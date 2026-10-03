# Sprint 01 — Goal

## Sprint Goal

> **Construir uma base investigativa reproduzível para o EvidencIA, validando Guiding Questions, datasets reais e EDA antes de continuar a evolução da extensão.**

## Período

| Campo | Valor |
|:---|:---|
| **Início** | A definir |
| **Fim** | A definir |
| **Duração** | 1 semana (sugerida) |

## Justificativa

A auditoria CBL identificou ausência de EDA e uso de dados mockados como gaps críticos. Antes de qualquer evolução da UX e do pipeline de produção, a equipe precisa validar empiricamente:

- Que datasets PT-BR estão disponíveis e com que cobertura (H02 — FactChecks.br);
- Que técnica de retrieval funciona melhor (H01 — embeddings vs. BM25);
- Qual limiar define `insufficient_evidence` de forma objetiva (H03).

Os resultados da EDA alimentam diretamente as decisões da Sprint 2 (pipeline de produção e UX).

## Guiding Questions Respondidas nesta Sprint

| GQ | Questão | Atividade |
|:---|:---|:---|
| GQ04 | Que evidência é relevante para PT-BR? | Dataset Registry + análise de cobertura |
| GQ05 | O que significa "sem evidência"? | Definição do limiar de `insufficient_evidence` |
| GQ07 | Como evitar alucinação da LLM? | Ingestion pipeline + Chroma index + baseline |
| GQ09 | Como medir se a recuperação funciona? | EDA notebook com Recall@k, MRR, nDCG |
| GQ10 | Como lidar com conteúdo antigo? | Canonical schema com `TemporalContext` |

---

**Ver também:** [Sprint Backlog](sprint-backlog.md) · [Review](review.md) · [Retrospective](retrospective.md)
