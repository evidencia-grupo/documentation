# Sprint 02 — Goal

## Sprint Goal

> **Converter os resultados da investigação em um pipeline de evidências e uma UX que preserve o pensamento crítico, eliminando a dependência estrutural do Ollama local.**

## Período

| Campo | Valor |
|:---|:---|
| **Início** | A definir |
| **Fim** | A definir |
| **Duração** | 1 semana (sugerida) |

## Justificativa

Com a base investigativa da Sprint 1 validada (datasets, EDA, retrieval baseline), a Sprint 2 converte os resultados em:

1. **Pipeline de produção evidence-first** — implementação do contrato ADR-006 Decisão 2 no backend e na extensão.
2. **UX de investigação assistida** — Evidence Cards (HU14), Reflection Questions (HU11, HU15) e remoção do gauge.
3. **Desacoplamento do provider de LLM** — interface `LLMProvider` com suporte a Ollama, Remote e Mock (mock proibido em produção).

## Guiding Questions Respondidas nesta Sprint

| GQ | Questão | Atividade |
|:---|:---|:---|
| GQ02 | O usuário precisa de veredito ou evidências? | Remoção do gauge; Evidence Cards no painel |
| GQ03 | O que a IA pode automatizar sem substituir o julgamento? | Pipeline completo: extração → retrieval → LLM auxiliar |
| GQ06 | Como lidar com fontes conflitantes? | Estado `conflicting` na UX; ambos os lados expostos |
| GQ08 | Como o usuário exerce pensamento crítico? | Reflection Questions (HU11, HU15) implementadas |
| GQ11 | Qual é o papel do usuário? | UX evidence-first validada com testes E2E |

---

**Ver também:** [Sprint Backlog](sprint-backlog.md) · [Review](review.md) · [Retrospective](retrospective.md) · [Sprint 01 → Review](../sprint-01/review.md)
