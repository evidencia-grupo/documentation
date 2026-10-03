# Sprint 02 — Sprint Backlog

## Sprint Goal

> Converter os resultados da investigação em um pipeline de evidências e uma UX que preserve o pensamento crítico, eliminando a dependência estrutural do Ollama local.

## Período

| Campo | Valor |
|:---|:---|
| **Início** | A definir |
| **Fim** | A definir |

## Backlog da Sprint

| ID | HU | Item | SP | Responsável | Status |
|:---|:---|:---|:---:|:---|:---|
| S2-01 | HU16 | Provider Abstraction — interface `LLMProvider` com Ollama, Remote e Mock | 5 | A definir | To Do |
| S2-02 | HU13, HU14 | Evidence-First Schema — `claims[]` + `evidence[]` + `uncertainty` no contrato | 5 | A definir | To Do |
| S2-03 | HU02, HU04 | Remoção do score global — remover `score`, `reliabilityScore`, `Gauge.tsx` da UX | 3 | A definir | To Do |
| S2-04 | HU14 | Evidence Cards — componente UI com título, URL, data, publisher e relação por alegação | 5 | A definir | To Do |
| S2-05 | HU11, HU15 | Reflection Questions — geração de ≥ 3 perguntas neutras por alegação no painel | 5 | A definir | To Do |
| S2-06 | HU16 | Failure/Timeout Handling — modo Evidence-Only como fallback; hard timeout 15s | 3 | A definir | To Do |
| S2-07 | HU03 | Latency Tests — testes de latência P90 (≤ 5s primeiras evidências, ≤ 10s completo) | 5 | A definir | To Do |
| S2-08 | — | E2E Atualizado — testes Playwright para UX evidence-first | 5 | A definir | To Do |
| S2-09 | — | Sprint Review Evidence — commits, screenshots, métricas documentadas | 2 | A definir | To Do |

**Total Sprint 2:** 38 Story Points

## Critérios de Aceitação da Sprint

- [ ] Interface `LLMProvider` implementada com pelo menos `OllamaProvider` e `MockProvider`.
- [ ] `MockProvider` retorna erro imediato se `ENV=production`.
- [ ] Schema `analysisMode: "evidence_first"` validado contra ao menos 3 análises reais.
- [ ] `score` e `reliabilityScore` ausentes da resposta `/analyze` em produção.
- [ ] `Gauge.tsx` removido da UX principal (pode existir como componente legado desativado com nota).
- [ ] Evidence Cards renderizados no painel com relação, título, URL, data e publisher.
- [ ] Reflection Questions: ≥ 3 perguntas por alegação, nenhuma impõe conclusão.
- [ ] Modo Evidence-Only ativado automaticamente em caso de falha do provider, com limitação visível.
- [ ] Hard timeout de 15s implementado no Service Worker.
- [ ] Latência P90 ≤ 5s para primeiras evidências medida com Playwright (ou documentada como meta não atingida com justificativa).
- [ ] Testes E2E cobrindo: HU13 (alegações listadas), HU14 (evidências por alegação), HU11 (perguntas reflexivas), HU09 (estado `insufficient_evidence` visível).

## Evidências

| Evidência | Status |
|:---|:---|
| Commit(s) com Evidence-First Schema | A preencher |
| Commit(s) com Evidence Cards | A preencher |
| Commit(s) com Reflection Questions | A preencher |
| Commit(s) com LLMProvider interface | A preencher |
| Screenshot: painel evidence-first (sem gauge) | A preencher |
| Screenshot: estado `insufficient_evidence` visível | A preencher |
| Screenshot: Reflection Questions no painel | A preencher |
| Métrica: Latência P90 primeiras evidências | A preencher |
| Métrica: Latência P90 resultado completo | A preencher |
| Relatório de testes E2E | A preencher |
| PR(s) aprovados nesta sprint | A preencher |

## Impedimentos

| # | Impedimento | Dono | Status |
|:---|:---|:---|:---|
| — | A preencher | — | — |

## Resultado

| Item | Entregue | Não Entregue | Carry-over |
|:---|:---|:---|:---|
| S2-01 Provider Abstraction | ☐ | ☐ | ☐ |
| S2-02 Evidence-First Schema | ☐ | ☐ | ☐ |
| S2-03 Remoção do score global | ☐ | ☐ | ☐ |
| S2-04 Evidence Cards | ☐ | ☐ | ☐ |
| S2-05 Reflection Questions | ☐ | ☐ | ☐ |
| S2-06 Failure/Timeout Handling | ☐ | ☐ | ☐ |
| S2-07 Latency Tests | ☐ | ☐ | ☐ |
| S2-08 E2E Atualizado | ☐ | ☐ | ☐ |
| S2-09 Sprint Review Evidence | ☐ | ☐ | ☐ |

---

**Ver também:** [Sprint Goal](sprint-goal.md) · [Review](review.md) · [Retrospective](retrospective.md)
