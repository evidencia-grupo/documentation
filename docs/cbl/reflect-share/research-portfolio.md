# Portfólio de Pesquisa — EvidencIA

> **Fase:** CBL Reflect & Share  
> **Estado:** SCAFFOLD  
> **Repositórios de Evidência:** `evidencia-grupo/documentation` (@`9e95b68`) e `evidencia-grupo/EvidencIA` (@`27c53e8`)

---

## 1. Índice de Navegação por Fase CBL

Este portfólio cataloga todos os artefatos de pesquisa produzidos ao longo do ciclo Challenge Based Learning (CBL), organizados por fase, com localização de arquivo, permalink de versão e status de validação.

| Fase CBL | Artefato | Repositório | Caminho no Repositório | Versão / Commit | Status |
|:---|:---|:---|:---|:---|:---|
| **Engage** | Alinhamento Estratégico | `documentation` | [`docs/visao/alinhamento-estrategico.md`](../../visao/alinhamento-estrategico.md) | `@9e95b68` | Verificado |
| **Engage** | Alinhamento Essential Question | `documentation` | [`docs/visao/essential-question-alignment.md`](../../visao/essential-question-alignment.md) | `@9e95b68` | Verificado |
| **Engage** | Guiding Questions (GQ01–GQ12) | `documentation` | [`docs/visao/guiding-questions.md`](../../visao/guiding-questions.md) | `@9e95b68` | Verificado |
| **Engage** | Log de Decisões Estratégicas | `documentation` | [`docs/visao/decision-log.md`](../../visao/decision-log.md) | `@9e95b68` | Verificado |
| **Investigate** | Registry de Datasets | `EvidencIA` | [`backend/ml/datasets/sources.yaml`](file:///EvidencIA/backend/ml/datasets/sources.yaml) | `@27c53e8` | Verificado |
| **Investigate** | Schemas Canônicos de Evidência | `EvidencIA` | [`backend/ml/schemas/evidence.py`](file:///EvidencIA/backend/ml/schemas/evidence.py) | `@27c53e8` | Verificado |
| **Investigate** | Notebook Exploratório (17 seções) | `EvidencIA` | [`notebooks/eda_datasets.ipynb`](file:///EvidencIA/notebooks/eda_datasets.ipynb) | `@27c53e8` | Verificado |
| **Investigate** | Resultados da EDA & Métricas IR | `documentation` | `docs/investigate/eda-results.md` | `@9e95b68` | PENDENTE |
| **Investigate** | Decisões Técnicas Derivadas da EDA | `documentation` | `docs/investigate/eda-decisions.md` | `@9e95b68` | PENDENTE |
| **Investigate** | ADR-006 (Arquitetura Evidence-First) | `documentation` | [`docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md`](../../tecnico/decisoes/ADR-006-evidence-first-architecture.md) | `@9e95b68` | Verificado |
| **Investigate** | Contrato de API Evidence-First | `EvidencIA` | [`shared/schemas/api-schema.json`](file:///EvidencIA/shared/schemas/api-schema.json) | `@27c53e8` | Verificado |
| **Act** | Plano Experimental do Estudo | `documentation` | [`docs/cbl/act/experiment-plan.md`](../act/experiment-plan.md) | `@9e95b68` | Verificado |
| **Act** | Protocolo do Participante & TCLE | `documentation` | [`docs/cbl/act/participant-protocol.md`](../act/participant-protocol.md) | `@9e95b68` | Verificado |
| **Act** | Definição de Métricas Comportamentais | `documentation` | [`docs/cbl/act/metrics-definition.md`](../act/metrics-definition.md) | `@9e95b68` | Verificado |
| **Act** | Especificação de Telemetria Ética | `documentation` | [`docs/cbl/act/telemetry-spec.md`](../act/telemetry-spec.md) | `@9e95b68` | Verificado |
| **Act** | Critérios Go / No-Go do Experimento | `documentation` | [`docs/cbl/act/go-no-go-act.md`](../act/go-no-go-act.md) | `@9e95b68` | Verificado |
| **Act** | Limitações Metodológicas Pré-Registradas | `documentation` | [`docs/cbl/act/limitations.md`](../act/limitations.md) | `@9e95b68` | Verificado |
| **Act** | Relatório de Resultados com Usuários | `documentation` | `docs/cbl/act/results.md` | `@9e95b68` | PENDENTE |
| **Reflect & Share** | Síntese Acadêmica e Reflexão | `documentation` | [`docs/cbl/reflect-share/reflection.md`](reflection.md) | `@9e95b68` | Verificado |
| **Reflect & Share** | Catálogo de Lições Aprendidas | `documentation` | [`docs/cbl/reflect-share/lessons-learned.md`](lessons-learned.md) | `@9e95b68` | Verificado |
| **Reflect & Share** | Roteiro de Apresentação (Showcase) | `documentation` | [`docs/cbl/reflect-share/showcase-script.md`](showcase-script.md) | `@9e95b68` | Verificado |
| **Reflect & Share** | Roteiro de Demonstração Honesta | `documentation` | [`docs/cbl/reflect-share/demo-script.md`](demo-script.md) | `@9e95b68` | Verificado |
| **Reflect & Share** | Matriz Go / No-Go Final da Banca | `documentation` | [`docs/cbl/reflect-share/go-no-go-final.md`](go-no-go-final.md) | `@9e95b68` | Verificado |
| **Reflect & Share** | Relatório Automatizado de Completude | `documentation` | [`docs/cbl/reflect-share/CBL_COMPLETENESS_REPORT.md`](CBL_COMPLETENESS_REPORT.md) | `@9e95b68` | Gerado |

---

## 2. Inventário de Datasets e Papéis Metodológicos

Conforme o registro formal em `backend/ml/datasets/sources.yaml` [EV: EvidencIA:backend/ml/datasets/sources.yaml#sources@27c53e8]:

| Dataset | Papel Arquitetural | Idioma | Finalidade no Projeto EvidencIA | Limitações Registradas |
|:---|:---|:---|:---|:---|
| **FactChecks.br** | `fact_check_evidence` | pt-BR | Padrão ouro para busca de evidências e checagens factuais prévias de agências certificadas IFCN (Lupa, Aos Fatos). | Cobertura retrospectiva; não cobre fatos ocorridos após a data de extração da base. |
| **Fake.br-Corpus** | `linguistic_corpus` | pt-BR | Análise de estilo, diversidade lexical e características estilométricas da linguagem de desinformação. | **Não é base de verdades factuais.** Não deve ser usado como evidência no RAG. |
| **Google Fact Check Tools API** | `external_complementary` | Multilíngue (filtro pt) | Complemento via API ClaimReview quando o banco local não contiver a alegação investigada. | Exige conexão e chave de API via variável de ambiente `GOOGLE_FACT_CHECK_API_KEY`. |
| **ClaimPT** | `methodological_auxiliary` | pt-PT | Referência metodológica para critérios de seleção e categorização de alegações (check-worthiness). | Escrito em Português Europeu (PT-EU); vocabulário e construções sintáticas diferem do PT-BR. |

---

## 3. Hashes Criptográficos e Integridade de Dados

A integridade dos arquivos e dos modelos de teste é garantida via SHA-256 canônicos:

- **Manifesto de Datasets:** O arquivo [`backend/data/manifest.json`](file:///EvidencIA/backend/data/manifest.json) (@`27c53e8`) armazena a tabela de hashes dos arquivos baixados pelo pipeline de dados.
- **Governança de Dados Brutos (DATA-03):** Por política estrita de versionamento, nenhum arquivo de dados brutos (`backend/data/bronze/` ou `silver/`) superior a 5 MB é rastreado no Git [EV: EvidencIA:backend/data/README.md#governanca-de-dados@27c53e8].
- **Sumário de Validação Experimental:** O hash oficial do arquivo de métricas de teste `analysis/act/out/summary.json` será calculado pelo script de auditoria e registrado na entrega final. Em fase SCAFFOLD: `PENDENTE — depende de: docs/cbl/act/results.md`.

---

## 4. Notebook de Análise Exploratória (EDA)

O notebook de análise exploratória [`notebooks/eda_datasets.ipynb`](file:///EvidencIA/notebooks/eda_datasets.ipynb) (@`27c53e8`) foi estruturado com 17 seções metodológicas completas (seções 0 a 16), cobrindo:
1. Reprodutibilidade e Configuração de Ambiente
2. Inventário dos Datasets (Fake.br, FactChecks.br, ClaimPT)
3. Qualidade dos Dados (nulos, duplicatas, formatação)
4. Distribuição de Classes e Vereditos
5. Análise Temporal e Cobertura Histórica
6. Análise de Comprimento de Textos e Alegações
7. Diversidade Lexical (TTR, MATTR, MTLD, hapax legomena)
8. Análise Morfossintática (POS tagging)
9. Marcadores de Sensacionalismo (pontuação, maiúsculas, léxico emotivo)
10. N-gramas mais frequentes por categoria
11. Extração e Comparação de Entidades Nomeadas (NER)
12. Similaridade Semântica e Duplicatas Próximas
13. Detecção de Data Leakage e Vazamento Temporal
14. Linha de Base de Recuperação (BM25 vs Embeddings em PT-BR)
15. Análise de Erros Qualitativa (casos fronteiriços)
16. Mapeamento de Achados para Requisitos Arquiteturais
17. Limitações Observadas e Riscos do Pipeline

> **Status de Execução:** Em fase SCAFFOLD, as células de código do notebook estão prontas, aguardando execução sob o cluster de treinamento local para congelamento das saídas numéricas.

---

## 5. Benchmarks de Retrieval (Information Retrieval)

Conforme pré-registrado na definição metodológica [EV: documentation:docs/visao/guiding-questions.md#gq09-metricas-de-recuperacao-e-avaliacao@9e95b68]:

| Métrica | Linha de Base Prevista | Resultado da EDA | Status |
|:---|:---:|:---:|:---|
| **Recall@1** | ≥ 0.50 | `PENDENTE — depende de: docs/investigate/eda-results.md` | Não executado |
| **Recall@3** | ≥ 0.70 | `PENDENTE — depende de: docs/investigate/eda-results.md` | Não executado |
| **Recall@5** | ≥ 0.80 | `PENDENTE — depende de: docs/investigate/eda-results.md` | Não executado |
| **MRR (Mean Reciprocal Rank)** | ≥ 0.60 | `PENDENTE — depende de: docs/investigate/eda-results.md` | Não executado |
| **nDCG@5** | ≥ 0.65 | `PENDENTE — depende de: docs/investigate/eda-results.md` | Não executado |

---

## 6. Rastreabilidade de Sprints e Governança Scrum

### Sprint 01 — Investigação e Fundação da Arquitetura
- **Sprint Goal:** Estabelecer a fundação investigativa através da EDA nos corpora brasileiros e desenhar a arquitetura orientada a evidências [EV: documentation:docs/scrum/sprint-01/sprint-goal.md#sprint-goal@9e95b68].
- **Incremento:** Contratos canônicos (`evidence.py`), registry de datasets (`sources.yaml`), protocolo `LLMProvider` com guard anti-mock e notebook estruturado [EV: documentation:docs/scrum/sprint-01/review.md#incremento-demonstrado@9e95b68].
- **PR Consolidado:** PR #31 (`chore/sprint-1-foundation`) mesclado no repositório de código [EV: EvidencIA:backend/tests/test_provider_contract.py#test_provider_contract@27c53e8].

### Sprint 02 — Evidence-First UX e Protocolo Experimental Act
- **Sprint Goal:** Converter os resultados da investigação em um pipeline de evidências e uma UX que preserve o pensamento crítico, eliminando a dependência estrutural do Ollama local [EV: documentation:docs/scrum/sprint-02/sprint-goal.md#sprint-goal@9e95b68].
- **Status do Backlog:** Issues #32 a #40 em andamento no repositório de código.
- **Artefatos Produzidos:** Protocolo experimental de campo ([`docs/cbl/act/`](../act/README.md)), telemetria local ética ([`telemetry-spec.md`](../act/telemetry-spec.md)) e suite de auditoria de completude.

---

## 7. Guia de Reprodução Científica e Técnica

Para reproduzir os experimentos e auditar os artefatos a partir do zero:

### Pré-requisitos
- Sistema Operacional: Linux, macOS ou Windows 11 com WSL2/PowerShell.
- Python ≥ 3.10 (recomendado: 3.12).
- Node.js ≥ 20.x com npm.
- Git instalado.

### Ordem de Execução
```bash
# 1. Clonar os dois repositórios lado a lado
git clone https://github.com/evidencia-grupo/documentation.git
git clone https://github.com/evidencia-grupo/EvidencIA.git

# 2. Configurar o ambiente do backend
cd EvidencIA/backend
python -m venv .venv
source .venv/bin/activate  # ou .venv\Scripts\Activate.ps1 no Windows
pip install -r requirements.txt

# 3. Executar a suite de testes unitários e de governança
pytest tests/ -v

# 4. Executar o script de auditoria de completude (modo fail-closed)
cd ..
python scripts/audit_project_completeness.py \
  --docs-repo ../documentation \
  --code-repo . \
  --output ../documentation/docs/cbl/reflect-share/CBL_COMPLETENESS_REPORT.md \
  --date 2026-10-02
```

### O que NÃO está no Git e por quê
- **Arquivos binários de datasets brutos (`backend/data/bronze/`):** Por restrições de tamanho do Git e boas práticas de engenharia de dados, os arquivos brutos baixados de repositórios externos devem ser baixados via scripts de ingestão e conferidos contra `manifest.json`.
- **Arquivos de variáveis de ambiente (`.env`):** Segredos e chaves de API nunca são comitados. O arquivo `.env.example` serve como gabarito.
- **Dados brutos de telemetria com participantes (`analysis/act/data/`):** Protegidos pela LGPD; apenas sumários consolidados e agregados sem identificação pessoal (`summary.json`) são versionados.
