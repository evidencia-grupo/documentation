# Priorização e MVP

## Nesta página

- [Matriz MoSCoW](#matriz-moscow)
- [Sequenciador de Features (Lean Inception)](#sequenciador-de-features-lean-inception)
- [Matriz de Revisão Técnica](#matriz-de-revisao-tecnica-o-que-como-fazer)
- [Resumo Executivo](#resumo-executivo)

---

## Matriz MoSCoW {: #matriz-moscow }

| Prioridade | Item | Justificativa |
|:---|:---|:---|
| **Must Have** | RF-01, RF-02, RF-03, RF-06, RF-07, RF-08, RF-09, RNF-01 a RNF-07 | Sem esses itens não há produto funcional, seguro ou minimamente confiável — formam o Happy Path completo |
| **Should Have** | RF-04 (fontes com link direto), RF-11 (metadados temporais do vídeo) | Aumentam significativamente a credibilidade, mas o fluxo crítico funciona sem eles, ainda que com menor confiança |
| **Could Have** | RF-05 (retorno reflexivo), RF-10 (avaliação de relevância) | Já classificados como OUT pelo documento original ([HU11, HU12](../requisitos/backlog-e-historias.md#hu11)) |
| **Won't Have (agora)** | Suporte multi-idioma, sincronização de histórico entre dispositivos, dashboard de estatísticas de uso, suporte a outras plataformas (Instagram, TikTok) | Não mapeados no levantamento original; risco de scope creep — mantidos explicitamente fora para evitar ambiguidade |

## Sequenciador de Features (Lean Inception) {: #sequenciador-de-features-lean-inception }

A estruturação das ondas de entrega e a priorização MoSCoW foram definidas diretamente a partir do investimento orçamentário obtido na [Técnica dos 100 Dólares](../requisitos/elicitacao.md#etapa-4-100-dolares), conduzida após as fases de entrevistas, benchmarking de concorrentes e prototipagem.

![Funil de Priorização do Backlog (Now, Next, Soon, Later)](../assets/funil-backlog.png)

| Onda | Features | Esforço | Valor de Negócio |
|:---|:---|:---|:---|
| **Onda 1 — MVP** | RF-01 (acionamento), RF-02/RF-08 (transcrição + alerta de ausência), RF-03/RF-06 (síntese categorizada), RF-07 (alerta de incerteza), RF-09 (cache), RNF-01 a RNF-07 (performance, segurança, acessibilidade, Manifest V3) | **Alto** (pipeline IA + integração com player do YouTube + backend proxy) | **Alto** — valida a hipótese central de confiança do usuário |
| **Onda 2 — Incremento 1** | RF-04 (fontes com link direto), RF-11 (data/canal do vídeo) | **Médio** (requer estruturação de metadados no backend e novo bloco de UI) | **Médio-Alto** — reforça credibilidade e reduz objeções de usuários mais exigentes (Mayara) |
| **Onda 3 — Incremento 2** | RF-05 (perguntas reflexivas), RF-10 (feedback de utilidade), suporte multi-plataforma, sincronização entre dispositivos | **Alto** (novo módulo de UX + telemetria + possível expansão de arquitetura) | **Médio** — engajamento de longo prazo, não crítico para a validação inicial |

## Matriz de Revisão Técnica (O quê / Como fazer) {: #matriz-de-revisao-tecnica-o-que-como-fazer }

| Feature de Negócio | O quê (valor entregue) | Como fazer (estratégia técnica) |
|:---|:---|:---|
| **RF-01 — Acionar análise** | Botão visível na página de reprodução | Content script (Manifest V3) injetado condicionalmente em URLs `/watch`; botão renderizado em Shadow DOM para isolar estilos do YouTube |
| **RF-02 / RF-08 — Obter transcrição** | Extração automática de legendas, com alerta se ausentes | Interceptação das faixas de legenda expostas pelo player do YouTube (nativas/automáticas); tratamento de exceção local sem chamar o backend quando ausentes |
| **RF-03 / RF-06 — Síntese categorizada** | Painel lateral com evidências apoiam/contradizem/contextualizam | Painel renderizado em iframe sandbox (isolamento de CSS/JS); dados consumidos via `fetch` ao backend proxy, componentes de UI leves (ex.: Preact) |
| **RF-07 / RF-06 (UC-06) — Alerta de incerteza** | Badge de inconclusão quando há divergência entre fontes | Campo `status: apoiada \| contraditada \| inconclusiva` retornado pela API do backend, mapeado diretamente para o componente de badge |
| **RF-04 — Fontes com link direto** *(Onda 2)* | Cartões de evidência com hiperligação e metadados | Estrutura de dados da API já prevendo array de `sources[{titulo, url, dominio}]`; abertura via `window.open` em nova aba, sem afetar a aba ativa |
| **RF-09 — Cache local** | Recuperação instantânea de checagens recentes | `chrome.storage.local` com chave = hash do `videoId`, TTL configurável (ex.: 24h), invalidação automática em leitura expirada |
| **RF-11 — Metadados temporais** *(Onda 2)* | Data de publicação e canal exibidos no cabeçalho | Consumo da YouTube Data API (ou scraping controlado da página) no momento da extração da transcrição, cacheado junto ao resultado |
| **RNF-03 — Manifest V3 / multi-browser** | Compatibilidade Chrome, Edge, Brave | Service Worker para lógica de fundo (sem `background page` persistente); `host_permissions` restritos a `https://www.youtube.com/*` · [ADR-001](../tecnico/decisoes/ADR-001-manifest-v3.md) |
| **RNF-04 — Segurança de credenciais** | Nenhuma chave exposta no client | Todas as chamadas de IA/busca passam por um backend proxy autenticado (ex.: Node/Python); a extensão nunca armazena segredos |
| **RNF-05 — Privacidade (LGPD)** | Sem coleta de histórico geral | Apenas permissão `activeTab` + escopo `youtube.com`; nenhuma persistência de dados analíticos por padrão, cache local restrito ao escopo da extensão |
| **RNF-01 / RNF-02 — Performance** | Resposta em até 10s, TBT +50ms, RAM +80MB | Chamadas assíncronas com indicador de progresso desde o primeiro clique; lazy-loading do painel; monitoramento de bundle size do content script |
| **RNF-07 — Acessibilidade (WCAG AA)** | Interface hierarquizada e navegável por teclado | Uso de HTML semântico, contraste validado (ferramenta tipo axe-core em CI), foco gerenciado via `tabindex` no painel |

## Resumo Executivo {: #resumo-executivo }

!!! success "Resumo executivo"
    A **Onda 1 (MVP)** concentra 100% do valor de validação da hipótese central — confiança do usuário leigo na síntese apresentada — com o menor conjunto de features tecnicamente viável. As Ondas 2 e 3 são incrementais e não bloqueiam o lançamento inicial.

---

**Ver também:** [Arquitetura do Sistema](../tecnico/arquitetura.md) — componentes e decisões técnicas detalhadas.  
**Ver também:** [Casos de Uso](../requisitos/casos-de-uso.md) — fluxos detalhados de cada funcionalidade do MVP.
