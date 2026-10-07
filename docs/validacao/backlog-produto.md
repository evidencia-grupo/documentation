# Product Backlog — EvidencIA

!!! note "KANBAN.md"
    e **BACKLOG.md** anteriores (em `EvidencIA/`) permanecem como histórico de planejamento inicial. Este arquivo é a fonte oficial do product backlog a partir da Sprint 1 (2026-10-02), seguindo a governança Scrum documentada em `docs/validacao/`.

## Nesta página

- [Nota sobre Histórico](#nota-historico)
- [Backlog Ordenado por Prioridade](#backlog-priorizado)
- [Épicos de Referência](#epicos-de-referencia)

---

## Nota sobre Histórico {: #nota-historico }

- `EvidencIA/KANBAN.md` — planejamento operacional inicial (28/09 a 09/10). Status registrados no arquivo correspondem ao estado na data de criação; não refletem estado atual.
- `EvidencIA/BACKLOG.md` — histórias de usuário iniciais (HU01–HU12) com formato anterior.

A rastreabilidade completa das HUs permanece em [`docs/requisitos/backlog-e-historias.md`](../requisitos/backlog-e-historias.md).

---

## Backlog Ordenado por Prioridade {: #backlog-priorizado }

| ID | História de Usuário | Item de Backlog | MoSCoW | SP | Sprint Alvo | Status |
|:---|:---|:---|:---|:---:|:---|:---|
| **HU01** | [HU01 — Verificação Simplificada](../requisitos/backlog-e-historias.md#hu01) | Botão de acionamento com feedback ≤ 1s em Shadow DOM | Must Have | 5 | Sprint 1 | To Do |
| **HU05** | [HU05 — Ingestão de Transcrição](../requisitos/backlog-e-historias.md#hu05) | Interceptador e higienizador de legendas do player YouTube | Must Have | 5 | Sprint 1 | To Do |
| **HU13** | [HU13 — Investigação Orientada por Alegações](../requisitos/backlog-e-historias.md#hu13) | Listagem de alegações verificáveis individuais no painel | Must Have | 5 | Sprint 2 | To Do |
| **HU14** | [HU14 — Evidência Rastreável](../requisitos/backlog-e-historias.md#hu14) | Evidence Cards com título, URL, data e relação por alegação | Must Have | 5 | Sprint 2 | To Do |
| **HU11** | [HU11 — Reflexão Crítica](../requisitos/backlog-e-historias.md#hu11) | Perguntas orientadoras neutras por alegação (≥ 3) | Must Have | 5 | Sprint 2 | To Do |
| **HU15** | [HU15 — Reflexão Crítica (novo)](../requisitos/backlog-e-historias.md#hu15) | Perguntas para autoavaliação antes da conclusão | Must Have | 3 | Sprint 2 | To Do |
| **HU02** | [HU02 — Síntese Estruturada](../requisitos/backlog-e-historias.md#hu02) | Síntese explicativa baseada em evidências recuperadas, sem veredito | Must Have | 5 | Sprint 2 | To Do |
| **HU04** | [HU04 — Mapeamento Claim→Evidence](../requisitos/backlog-e-historias.md#hu04) | Mapeamento claim→evidence por alegação com relação explícita | Must Have | 5 | Sprint 2 | To Do |
| **HU09** | [HU09 — Incerteza e Limitações](../requisitos/backlog-e-historias.md#hu09) | Estado `insufficient_evidence` distinto de false; seção "O que ainda não sabemos" | Must Have | 3 | Sprint 2 | To Do |
| **HU03** | [HU03 — Checagem Rápida](../requisitos/backlog-e-historias.md#hu03) | SLA: primeiras evidências ≤ 5s P90; resultado completo ≤ 10s P90 | Must Have | 3 | Sprint 1 | To Do |
| **HU10** | [HU10 — Ausência de Transcrição](../requisitos/backlog-e-historias.md#hu10) | Notificação imediata (≤ 1s) se vídeo sem legendas | Must Have | 3 | Sprint 2 | Done |
| **HU07** | [HU07 — Auditoria de Fontes](../requisitos/backlog-e-historias.md#hu07) | Fontes com título, URL, data, publisher e hash de provenance | Must Have | 3 | Sprint 2 | To Do |
| **HU16** | [HU16 — Provider de IA Independente](../requisitos/backlog-e-historias.md#hu16) | Interface LLMProvider; troca por config; mock proibido em prod | Must Have | 5 | Sprint 2 | To Do |
| **HU06** | [HU06 — Cache Local](../requisitos/backlog-e-historias.md#hu06) | Cache local `chrome.storage.local` (TTL 24h) com hit < 1s | Should Have | 5 | Sprint 2 | To Do |
| **HU08** | [HU08 — Contexto Temporal](../requisitos/backlog-e-historias.md#hu08) | Data de upload e canal no cabeçalho do painel | Should Have | 3 | Sprint 2 | To Do |
| **HU12** | [HU12 — Feedback de Qualidade](../requisitos/backlog-e-historias.md#hu12) | Avaliação anônima (positivo/negativo) assíncrona | Could Have | 3 | Pós-Sprint 2 | To Do |

### Itens de Infraestrutura / EDA (sem HU direta)

| Item | Descrição | SP | Sprint Alvo | Status |
|:---|:---|:---:|:---|:---|
| Dataset Registry | Documentação e acesso aos datasets PT-BR (Fake.br, FactChecks.br) | 3 | Sprint 1 | To Do |
| Ingestion Pipeline | Pipeline de ingestão e indexação no Chroma | 5 | Sprint 1 | To Do |
| Canonical Schema | Schema JSON `analysisMode: evidence_first` (ADR-006 Decisão 2) | 3 | Sprint 1 | To Do |
| Chroma Index | Índice vetorial FactChecks.br | 5 | Sprint 1 | To Do |
| EDA Notebook | Análise exploratória com Recall@k, MRR, nDCG, cobertura PT-BR | 8 | Sprint 1 | To Do |
| Retrieval Baseline | Baseline BM25 vs. embeddings com métricas objetivas | 5 | Sprint 1 | To Do |
| Data Provenance | Documentação de origem, licença e hash dos datasets | 2 | Sprint 1 | To Do |
| Provider Abstraction | Implementação da interface LLMProvider (ADR-006 Decisão 6) | 5 | Sprint 2 | To Do |
| Failure/Timeout Handling | Modo Evidence-Only como fallback; hard timeout 15s | 3 | Sprint 2 | To Do |
| Latency Tests | Testes de latência P90 com Playwright | 5 | Sprint 2 | To Do |
| E2E Atualizado | Testes E2E atualizados para UX evidence-first | 5 | Sprint 2 | To Do |
| Sprint Review Evidence | Evidências de revisão de sprint (commits, screenshots, métricas) | 2 | Sprint 2 | To Do |

---

## Épicos de Referência {: #epicos-de-referencia }

| Épico | Histórias | Prioridade |
|:---|:---|:---|
| E1 — Gatilho e Ativação | HU01, HU03, HU10 | Must Have |
| E2 — Extração de Transcrição | HU05 | Must Have |
| E3 — Investigação Assistida (novo) | HU13, HU14, HU15 | Must Have |
| E4 — Análise Evidence-First | HU02, HU04, HU09 | Must Have |
| E5 — Confiança e Fontes | HU07, HU08 | Must Have / Should Have |
| E6 — Performance e Cache | HU03, HU06 | Must Have / Should Have |
| E7 — Reflexão Crítica (promovido) | HU11 | Must Have |
| E8 — Infraestrutura de IA | HU16 | Must Have |
| E9 — Engajamento Comunitário | HU12 | Could Have |

---

**Ver também:** [Definition of Done](criterios-de-pronto.md) · [Catálogo de Requisitos](../requisitos/catalogo-requisitos.md) · [Backlog e Histórias de Usuário](../requisitos/backlog-e-historias.md) · [Matriz de Rastreabilidade](../requisitos/matriz-rastreabilidade.md)
