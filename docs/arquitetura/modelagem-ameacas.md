# Threat Model e Conformidade com a LGPD

## Nesta página

- [Objetivo e Metodologia](#objetivo-e-metodologia)
- [Fronteiras de Confiança e Superfície de Ataque](#fronteiras-de-confianca)
- [Análise de Ameaças (Modelo STRIDE)](#analise-stride)
  - [Spoofing (Falsificação de Identidade)](#spoofing)
  - [Tampering (Adulteração de Dados e Injeção)](#tampering)
  - [Repudiation (Repúdio)](#repudiation)
  - [Information Disclosure (Vazamento de Informações)](#information-disclosure)
  - [Denial of Service (Negação de Serviço e Abuso)](#denial-of-service)
  - [Elevation of Privilege (Elevação de Privilégio)](#elevation-of-privilege)
- [Regras Específicas contra Mau Uso (Critérios de Exclusão)](#regras-contra-mau-uso)
- [Avaliação de Conformidade com a LGPD](#conformidade-lgpd)

---

## Objetivo e Metodologia {: #objetivo-e-metodologia }

Este documento estabelece a análise formal de segurança e privacidade da **Extensão de Fact-Checking para YouTube**, utilizando a metodologia **STRIDE** combinada com uma avaliação de conformidade sob os preceitos da **Lei Geral de Proteção de Dados (LGPD — Lei nº 13.709/2018)**.

A prioridade é assegurar que a extensão não exponha o usuário a riscos de espionagem ou sequestro de dados e que o backend proxy resista a abusos coordenados e custos descontrolados.

!!! note "Base de verificação e limites desta análise"
    As mitigações abaixo foram conferidas em 23/10/2026 contra `EvidencIA@6ec6c70` (`extension/manifest.json`, `extension/src/content/content-script.ts`, `backend/app/config.py`, `backend/app/schemas.py`, `backend/app/body_limit.py` e `backend/app/services/auth_service.py`). Valores configuráveis são citados pelo padrão do código; a configuração efetiva do ambiente publicado não foi inspecionada. A seção de LGPD é uma leitura técnica de engenharia, não um parecer jurídico: a adequação legal da [Política de Privacidade](../legal/politica-de-privacidade.md) e das bases legais depende de revisão por responsável jurídico.

---

## Fronteiras de Confiança e Superfície de Ataque {: #fronteiras-de-confianca }

```mermaid
flowchart LR
    subgraph UntrustedZone["Zona Nao Confiavel (DOM do YouTube)"]
        YTPages["Pagina youtube.com/watch"]
        YTComments["Comentarios e Scripts de Terceiros"]
    end

    subgraph SemiTrustedZone["Zona Semi-Confiavel (Extensao Cliente)"]
        CS["Content Script (Shadow DOM)"]
        SW["Service Worker"]
        Panel["Painel Lateral (iFrame Sandbox)"]
    end

    subgraph TrustedZone["Zona Confiavel (Infraestrutura de Servidor)"]
        Backend["Backend Proxy"]
        Secrets["Cofre de Variaveis / Chaves de API"]
    end

    YTPages -.->|Fronteira 1: Isolamento de DOM| CS
    CS <-->|Fronteira 2: Mensageria Interna| SW
    SW <-->|Fronteira 3: HTTPS / Token Bearer| Backend
    Backend <-->|Fronteira 4: Acesso Seguro| Secrets
```

---

## Análise de Ameaças (Modelo STRIDE) {: #analise-stride }

### 1. Spoofing (Falsificação de Identidade) {: #spoofing }

| Ameaça Mapeada | Impacto | Medida Mitigatória Implementada |
|:---|:---|:---|
| Requisições forjadas enviadas ao Backend Proxy por atacantes para consumir quotas de IA sem utilizar a extensão legítima | **Alto** (prejuízo financeiro e esgotamento de quota) | Tokens Bearer efêmeros assinados com HMAC-SHA256 (24 h), exigidos quando `REQUIRE_AUTH=true` (obrigatório em produção e staging); CORS restrito às origens configuradas em `CORS_ALLOWED_ORIGINS`; limite de taxa por cliente. **Risco residual:** `POST /api/v1/auth/token` emite token para qualquer `installationId` sintaticamente válido (limitado a 30/min por cliente), e CORS não impede chamadas fora do navegador; o token reduz abuso casual, mas não comprova que a chamada vem da extensão oficial (ver decisão H1 em [Decisões aprovadas](../governanca/decisoes-aprovadas.md)). |

### 2. Tampering (Adulteração de Dados e Injeção) {: #tampering }

| Ameaça Mapeada | Impacto | Medida Mitigatória Implementada |
|:---|:---|:---|
| Injeção de scripts maliciosos (XSS) via transcrição manipulada ou metadados de fontes fraudulentas | **Crítico** (execução indevida de código na aba) | Painel renderizado em `iframe` de recurso da própria extensão, isolado da página do YouTube pela origem `chrome-extension://`; botão em Shadow DOM; escape automático de HTML pelo Preact. O `iframe` declara `sandbox="allow-scripts allow-same-origin allow-popups allow-popups-to-escape-sandbox"`; com `allow-scripts` e `allow-same-origin` juntos, o atributo `sandbox` não acrescenta isolamento relevante, e a proteção depende da separação de origens e do escape do framework. |
| Tentativas de *Prompt Injection* inseridas no áudio do vídeo para burlar a análise da IA | **Médio** (geração de veredito incorreto) | O backend estrutura o prompt com separadores rígidos de contexto de sistema (*system instructions*) e instrui o modelo a tratar a transcrição estritamente como dado não executável. |

### 3. Repudiation (Repúdio) {: #repudiation }

| Ameaça Mapeada | Impacto | Medida Mitigatória Implementada |
|:---|:---|:---|
| Falhas na identificação de incidentes operacionais ou abusos de infraestrutura | **Baixo** | Registro estruturado de logs de auditoria no Backend Proxy contendo data/hora, código de erro e tempo de resposta, sem persistir dados pessoais de usuários. |

### 4. Information Disclosure (Vazamento de Informações) {: #information-disclosure }

| Ameaça Mapeada | Impacto | Medida Mitigatória Implementada |
|:---|:---|:---|
| Extensão capturar histórico geral de navegação em outros domínios ou ler cookies da conta do usuário | **Crítico** (violação grave de privacidade e LGPD) | O arquivo `manifest.json` restringe estritamente `host_permissions` a `https://www.youtube.com/*` e à origem HTTPS do backend, com permissões limitadas a `storage` e `scripting`. Nenhuma permissão para `cookies`, `history`, `webNavigation` ou acesso indiscriminado a abas é solicitada. |
| Vazamento de chaves secretas de APIs de IA no código do cliente | **Crítico** (furto de credenciais) | Nenhuma chave reside no pacote da extensão. Todas as chamadas a provedores externos ocorrem exclusivamente via Backend Proxy ([ADR-002](decisoes/ADR-002-backend-proxy.md)). |

### 5. Denial of Service (Negação de Serviço e Abuso) {: #denial-of-service }

| Ameaça Mapeada | Impacto | Medida Mitigatória Implementada |
|:---|:---|:---|
| Ataques volumétricos ou testes em lote automatizados (*scraping*) sobrecarregando o backend | **Alto** (indisponibilidade do serviço e custos elevados) | *Rate limiting* por endereço de cliente com SlowAPI e resposta HTTP 429: `RATE_LIMIT_MAX_PER_MINUTE` (padrão 60/min) em `/analyze`, `/feedback` e `/classify`, e 30/min em `/auth/token`. O endereço considera `TRUSTED_PROXY_HOPS` atrás de proxy reverso; o armazenamento padrão `memory://` não é compartilhado entre instâncias, e o Blueprint do Render (`render.yaml`) configura `RATE_LIMIT_STORAGE_URI` para uma instância Key Value compartilhada. Não há detecção de padrões de automação além do limite de taxa. |
| Injeção de transcrições astronômicas para travar o analisador | **Médio** (sobrecarga de memória) | Corpo acima de `MAX_REQUEST_BODY_BYTES` (padrão 512 KiB) é recusado com HTTP 413 antes do parsing; `transcript` acima de 100.000 caracteres ou mais de 5.000 segmentos violam o esquema e retornam HTTP 422. |

### 6. Elevation of Privilege (Elevação de Privilégio) {: #elevation-of-privilege }

| Ameaça Mapeada | Impacto | Medida Mitigatória Implementada |
|:---|:---|:---|
| Execução de código arbitrário fora da sandbox do navegador | **Crítico** | Adoção integral do **Manifest V3**, que proíbe terminantemente `eval()`, carregamento de scripts externos em tempo de execução (*remotely hosted code*) e políticas de segurança permissivas. |

---

## Regras Específicas contra Mau Uso (Critérios de Exclusão) {: #regras-contra-mau-uso }

Em consonância com as diretrizes consolidadas no planejamento de produto:

1. **Sem Feedback de Contorno:** O sistema nunca expõe métricas, pontuações parciais ou explicações técnicas detalhadas sobre os pesos algorítmicos que possam instruir criadores de desinformação a mascarar conteúdos para burlar a ferramenta.
2. **Vedação de Automação Pública:** Não serão disponibilizadas APIs públicas sem credenciamento formal nem mecanismos que facilitem a raspagem massiva ou auditoria reversa automatizada.
3. **Não Recomendação Clínica:** A interface inclui declaração explícita de que a ferramenta não emite diagnósticos, pareceres farmacológicos ou orientações terapêuticas individualizadas.

---

## Avaliação de Conformidade com a LGPD {: #conformidade-lgpd }

A extensão foi projetada sob o princípio de **Privacidade desde a Concepção (*Privacy by Design*)**:

| Princípio Legal (Art. 6º da LGPD) | Aplicação Prática no Produto |
|:---|:---|
| **Finalidade** (Inciso I) | O processamento limita-se exclusivamente à checagem de fatos do vídeo em exibição solicitado pelo usuário. |
| **Adequação e Necessidade** (Incisos II e III) | Minimização de dados: por análise, a extensão envia legenda, título, canal, data de publicação, duração e identificador do vídeo; mantém um identificador aleatório de instalação e a credencial temporária; o backend recebe o endereço IP pela conexão. O inventário completo está na [Política de Privacidade](../legal/politica-de-privacidade.md#dados-tratados). Nenhum dado cadastral (nome, e-mail, telefone) é exigido ou armazenado. |
| **Livre Acesso e Transparência** (Incisos IV e VI) | O usuário vê quando a extensão está ativa através do botão visível; o código do cliente é auditável. Os operadores terceiros (provedor de LLM via OpenRouter, Google Fact Check Tools API e hospedagem) estão listados na política. |
| **Segurança e Prevenção** (Incisos VII e VIII) | A comunicação com o backend publicado usa HTTPS (a versão de TLS é definida pela hospedagem e não foi verificada nesta análise); o cache local expira em 24h e permanece no próprio dispositivo do usuário. |
| **Não Discriminação** (Inciso IX) | A análise de alegações baseia-se em literatura científica e bases de checagem consolidadas, sem categorização de perfil ideológico ou comportamental do usuário. |

---

**Próximo:** [Estratégia de Testes e Definition of Done](estrategia-testes.md) — governança de qualidade e critérios de aceite.  
**Ver também:** [Arquitetura do Sistema](arquitetura.md) — visão técnica dos componentes e isolamento.
