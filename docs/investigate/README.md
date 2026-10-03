<!-- nav:start -->
[Voltar ao Índice Mestre](../index.md)
<!-- nav:end -->

# CBL — Fase Investigate (Investigacao e EDA)

> **Propósito:** Centralizar a orientação metodológica da fase **Investigate** do framework Challenge Based Learning, conectando as Guiding Questions aos artefatos técnicos e de dados.

---

## Artefatos Centrais da Investigacao
- **Formulacao das Perguntas:** [`docs/visao/guiding-questions.md`](../visao/guiding-questions.md) (GQ01 a GQ12).
- **Análise Exploratoria de Dados (EDA):** Notebook executavel [`notebooks/eda_datasets.ipynb`](https://github.com/evidencia-grupo/EvidencIA/blob/main/notebooks/eda_datasets.ipynb).
- **Catalogo de Fontes de Dados:** [`backend/ml/datasets/sources.yaml`](https://github.com/evidencia-grupo/EvidencIA/blob/main/backend/ml/datasets/sources.yaml).
- **Decisões Arquiteturais Derivadas:** [`docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md`](../tecnico/decisoes/ADR-006-evidence-first-architecture.md).
- **Especificação de Requisitos:** [`docs/requisitos/catalogo-requisitos.md`](../requisitos/catalogo-requisitos.md).

---

## Ordem Recomendada de Leitura
1. [`guiding-questions.md`](../visao/guiding-questions.md) — Entendimento dos desafios técnicos e cognitivos.
2. Notebook de EDA — Análise de balanceamento, rotulagem e densidade lexical dos dados jornalisticos.
3. [`ADR-006`](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) — Formalizacao da ruptura com scores numericos.
