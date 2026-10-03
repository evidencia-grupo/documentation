# Sprint 01 — Sprint Backlog

## Sprint Goal

> Construir uma base investigativa reproduzível para o EvidencIA, validando Guiding Questions, datasets reais e EDA antes de continuar a evolução da extensão.

## Período

| Campo | Valor |
|:---|:---|
| **Início** | A definir |
| **Fim** | A definir |

## Backlog da Sprint

| ID | HU | Item | SP | Responsável | Status |
|:---|:---|:---|:---:|:---|:---|
| S1-01 | — | Guiding Questions documentadas (`docs/visao/guiding-questions.md`) | 3 | A definir | To Do |
| S1-02 | — | Essential Question Alignment documentado (`docs/visao/essential-question-alignment.md`) | 2 | A definir | To Do |
| S1-03 | — | Dataset Registry (Fake.br, FactChecks.br, ClaimPT — licença, acesso, cobertura) | 3 | A definir | To Do |
| S1-04 | — | Ingestion Pipeline (download, limpeza, chunking, indexação no Chroma) | 5 | A definir | To Do |
| S1-05 | — | Canonical Schema `analysisMode: evidence_first` (ADR-006 Decisão 2) | 3 | A definir | To Do |
| S1-06 | — | Chroma Index (índice vetorial FactChecks.br) | 5 | A definir | To Do |
| S1-07 | — | EDA Notebook (Recall@k, MRR, nDCG, cobertura PT-BR, limiar `insufficient_evidence`) | 8 | A definir | To Do |
| S1-08 | — | Retrieval Baseline (BM25 vs. embeddings multilíngues) | 5 | A definir | To Do |
| S1-09 | — | Data Provenance (origem, licença, hash dos datasets) | 2 | A definir | To Do |

**Total Sprint 1:** 36 Story Points

## Critérios de Aceitação da Sprint

- [ ] Guiding Questions documentadas com resposta sintetizada e decisão derivada para todas as 12 GQs.
- [ ] Dataset Registry com status de licença e cobertura de pelo menos Fake.br e FactChecks.br.
- [ ] Ingestion Pipeline executa sem erros em ambiente de desenvolvimento com dados reais.
- [ ] Chroma Index construído com pelo menos o conjunto de treino do FactChecks.br.
- [ ] EDA Notebook executa do zero (Kernel → Restart & Run All) com seeds fixas, sem dados brutos commitados.
- [ ] Métricas Recall@5, Recall@10, MRR e nDCG@10 calculadas e interpretadas no notebook.
- [ ] Limiar de `insufficient_evidence` proposto com justificativa empírica.
- [ ] Canonical Schema documentado e validado contra ao menos um exemplo de análise real.

## Evidências

| Evidência | Status |
|:---|:---|
| Commit(s) com ingestion pipeline | A preencher |
| Link para o notebook EDA (Jupyter ou Colab) | A preencher |
| Testes/métricas do retrieval baseline | A preencher |
| Screenshot ou export do Chroma index | A preencher |
| Métrica: Recall@5 do conjunto de avaliação | A preencher |
| Métrica: nDCG@10 do conjunto de avaliação | A preencher |
| PR(s) aprovados nesta sprint | A preencher |

## Impedimentos

| # | Impedimento | Dono | Status |
|:---|:---|:---|:---|
| — | A preencher | — | — |

## Resultado

| Item | Entregue | Não Entregue | Carry-over |
|:---|:---|:---|:---|
| S1-01 Guiding Questions | [ ] | [ ] | [ ] |
| S1-02 EQ Alignment | [ ] | [ ] | [ ] |
| S1-03 Dataset Registry | [ ] | [ ] | [ ] |
| S1-04 Ingestion Pipeline | [ ] | [ ] | [ ] |
| S1-05 Canonical Schema | [ ] | [ ] | [ ] |
| S1-06 Chroma Index | [ ] | [ ] | [ ] |
| S1-07 EDA Notebook | [ ] | [ ] | [ ] |
| S1-08 Retrieval Baseline | [ ] | [ ] | [ ] |
| S1-09 Data Provenance | [ ] | [ ] | [ ] |

---

**Ver também:** [Sprint Goal](sprint-goal.md) · [Review](review.md) · [Retrospective](retrospective.md)
