# Gestão de Riscos Técnicos e de Projeto

## Nesta página

- [Matriz de Riscos do Produto](#matriz-de-riscos)
- [Análise Detalhada e Planos de Mitigação](#analise-detalhada)
  - [Risco 1: Descumprimento do SLA de Latência de 10s](#risco-1)
  - [Risco 2: Mudanças Inesperadas no DOM do YouTube](#risco-2)
  - [Risco 3: Escalada de Custos com APIs de IA e Busca](#risco-3)
  - [Risco 4: Alta Proporção de Vídeos Sem Legendas Disponíveis](#risco-4)
  - [Risco 5: Ataques Coordenados e Engenharia Reversa](#risco-5)
- [Processo de Monitoramento e Resposta](#processo-de-monitoramento)

---

## Matriz de Riscos do Produto {: #matriz-de-riscos }

| ID | Risco Identificado | Categoria | Probabilidade | Impacto | Severidade | Estratégia Adotada |
|:---:|:---|:---|:---:|:---:|:---:|:---|
| **R-01** | Pipeline em série exceder o SLA de 10 segundos ([RNF-01](../requisitos/catalogo-requisitos.md#rnf-01)) | Desempenho | Média | Alto | **Alta** | Mitigação via paralelização assíncrona e cache |
| **R-02** | Alterações unilaterais no layout ou DOM do YouTube pelo Google | Técnico | Alta | Médio | **Alta** | Mitigação via seletores estáveis e testes contínuos |
| **R-03** | Explosão de custos operacionais com provedores de IA e busca | Financeiro | Média | Alto | **Alta** | Mitigação via cache agressivo e modelos econômicos |
| **R-04** | Vídeos sem faixas de legenda nativas ou automáticas disponíveis | Produto | Média | Médio | **Média** | Tratamento gracioso no MVP; roadmap para Onda 3 |
| **R-05** | Tentativas de desinformadores de engenharia reversa para burlar a ferramenta | Segurança | Média | Alto | **Alta** | Mitigação por design (sem feedback de contorno) |

---

## Análise Detalhada e Planos de Mitigação {: #analise-detalhada }

### Risco 1: Descumprimento do SLA de Latência de 10s {: #risco-1 }

- **Descrição:** O encadeamento sequencial tradicional (extrair texto → enviar ao backend → isolar alegações com LLM → consultar motor de busca → sintetizar resposta) pode superar o teto de 10 segundos em horários de pico.
- **Plano de Mitigação:**
  1. **Execução Concorrente:** O backend dispara as consultas a bases de fact-checking e aos modelos de triagem de forma paralela assim que as primeiras alegações são segmentadas.
  2. **Seleção de Modelos de Baixa Latência:** Uso de modelos otimizados para inferência rápida (tempo até o primeiro token < 400ms).
  3. **Timeout Rígido do Servidor:** O Backend Proxy encerra a inferência em 8,0 segundos, retornando a melhor síntese disponível até aquele momento para preservar o SLA no cliente.

### Risco 2: Mudanças Inesperadas no DOM do YouTube {: #risco-2 }

- **Descrição:** O YouTube atualiza frequentemente seus componentes de interface e classes CSS geradas dinamicamente, podendo quebrar a injeção do botão da extensão.
- **Plano de Mitigação:**
  1. **Seletores Desacoplados:** Utilização de atributos funcionais e âncoras estruturais estáveis (ex.: contêineres de ações do player e tags semânticas) em vez de classes CSS ofuscadas.
  2. **Suíte Diária de Smoke Tests:** Testes automatizados executados diariamente em ambiente CI que validam a injeção da extensão contra a página real do YouTube, alertando a equipe antes que os usuários finais sejam afetados.

### Risco 3: Escalada de Custos com APIs de IA e Busca {: #risco-3 }

- **Descrição:** O aumento exponencial de acessos ou vídeos virais repetidos pode inflacionar os custos de computação de modelos e consumo de APIs pagas de busca.
- **Plano de Mitigação:**
  1. **Cache Local de 24 Horas:** Consulta imediata em `chrome.storage.local` impede que o mesmo usuário gere cobranças repetidas ([ADR-003](../tecnico/decisoes/ADR-003-estrategia-cache-local.md)).
  2. **Cache Centralizado no Backend Proxy:** Vídeos populares com checagens idênticas utilizam o resultado já processado para outros usuários.
  3. **Rate Limiting:** Bloqueio de abusos e limites estritos de chamadas por usuário.

### Risco 4: Alta Proporção de Vídeos Sem Legendas Disponíveis {: #risco-4 }

- **Descrição:** Canais que desativam manualmente legendas ou vídeos com ruído de áudio onde a transcrição automática do YouTube falha inviabilizam o fluxo do MVP.
- **Plano de Mitigação:**
  1. **Feedback Imediato:** Notificação clara em até 1 segundo explicando que o vídeo não possui legendas, evitando tempo de espera inútil ([RF-08](../requisitos/catalogo-requisitos.md#rf-08)).
  2. **Evolução Planejada (Onda 3):** No Sequenciador de Features, a Onda 3 prevê a funcionalidade `F3.3: Transcrição por áudio local via Whisper` como fallback para vídeos sem faixas de texto nativas.

### Risco 5: Ataques Coordenados e Engenharia Reversa {: #risco-5 }

- **Descrição:** Atores maliciosos utilizarem a extensão como laboratório de testes para formular alegações falsas que "escapem" dos filtros da IA.
- **Plano de Mitigação:**
  1. **Critério de Exclusão Editorial:** Conforme deliberado no Lean Inception, o sistema não entrega "dicas de redação" nem explica como o score foi numericamente ponderado.
  2. **Rate Limit Severo:** Endereços que apresentem padrões de bombardeamento de testes são bloqueados temporariamente com resposta HTTP 429.

---

## Processo de Monitoramento e Resposta {: #processo-de-monitoramento }

A matriz de riscos é revisada semanalmente com base nas métricas operacionais coletadas pelo Backend Proxy e alertas automatizados de integração contínua.

---

**Próximo:** [Instrumentação e Telemetria](metricas-telemetria.md) — coleta ética de dados de uso e KPIs.  
**Ver também:** [Threat Model e Segurança](../tecnico/threat-model.md) — governança de segurança contra ameaças.
