# Entregáveis em formatos editáveis e executáveis

Os arquivos abaixo são entregáveis reais, não apenas descrições em Markdown. DOCX é editável, YAML é legível por programas e CSV contém registros tabulares. O código, os notebooks e o modelo ficam no repositório da aplicação.

## Notebooks modelo e código

- [Notebook de treinamento e avaliação](https://github.com/evidencia-grupo/EvidencIA/blob/codex/transcricao-entregaveis/backend/ml/notebooks/model_training_evaluation.ipynb)
- [Notebook de EDA](https://github.com/evidencia-grupo/EvidencIA/blob/codex/transcricao-entregaveis/backend/ml/notebooks/eda.ipynb)
- [Modelo JSON](https://github.com/evidencia-grupo/EvidencIA/blob/codex/transcricao-entregaveis/backend/ml/classifier/model.json) e [modelo pickle PLK](https://github.com/evidencia-grupo/EvidencIA/blob/codex/transcricao-entregaveis/backend/ml/classifier/model.plk)
- [Código Python](https://github.com/evidencia-grupo/EvidencIA/tree/codex/transcricao-entregaveis/backend) e [TypeScript](https://github.com/evidencia-grupo/EvidencIA/tree/codex/transcricao-entregaveis/extension/src)

## Downloads

### Documentos

- [Datasets (docx)](arquivos/documentos/Datasets.docx)
- [EDA (docx)](arquivos/documentos/EDA.docx)
- [Guiding Questions (docx)](arquivos/documentos/Guiding_Questions.docx)
- [Relatorio Tecnico (docx)](arquivos/documentos/Relatorio_Tecnico.docx)
- [Remediacao e GO (docx)](arquivos/documentos/Remediacao_e_GO.docx)
- [Requisitos (docx)](arquivos/documentos/Requisitos.docx)
- [Scrum (docx)](arquivos/documentos/Scrum.docx)

### Estruturados

- [backlog historias completo (csv)](arquivos/estruturados/backlog_historias_completo.csv)
- [backlog historias completo (yaml)](arquivos/estruturados/backlog_historias_completo.yaml)
- [catalogo requisitos completo (csv)](arquivos/estruturados/catalogo_requisitos_completo.csv)
- [catalogo requisitos completo (yaml)](arquivos/estruturados/catalogo_requisitos_completo.yaml)
- [contrato api (yaml)](arquivos/estruturados/contrato_api.yaml)
- [curva abstencao (csv)](arquivos/estruturados/curva_abstencao.csv)
- [datasets metadados (yaml)](arquivos/estruturados/datasets_metadados.yaml)
- [eda distribuicoes (csv)](arquivos/estruturados/eda_distribuicoes.csv)
- [eda resumo (yaml)](arquivos/estruturados/eda_resumo.yaml)
- [guiding questions (csv)](arquivos/estruturados/guiding_questions.csv)
- [guiding questions (yaml)](arquivos/estruturados/guiding_questions.yaml)
- [metricas modelo (yaml)](arquivos/estruturados/metricas_modelo.yaml)
- [metricas por classe (csv)](arquivos/estruturados/metricas_por_classe.csv)
- [requisitos verificados (csv)](arquivos/estruturados/requisitos_verificados.csv)
- [requisitos verificados (yaml)](arquivos/estruturados/requisitos_verificados.yaml)
- [scrum backlog executado (csv)](arquivos/estruturados/scrum_backlog_executado.csv)
- [scrum backlog executado (yaml)](arquivos/estruturados/scrum_backlog_executado.yaml)

Os YAML/CSV de catálogo e backlog preservam 22 requisitos e 16 histórias de origem. Não atribuem conclusão automática a todos os itens. Os resultados do modelo e as limitações empíricas permanecem explícitos.


## Experimento Fake.br reproduzido

[Notebook e código](https://github.com/evidencia-grupo/EvidencIA/tree/codex/transcricao-entregaveis/experiments/fakebr), [relatório revisado](arquivos/relatorio_tecnico_ia.md), [métricas YAML](arquivos/estruturados/fakebr_modelo_avaliacao.yaml) e [1.088 predições CSV](arquivos/estruturados/fakebr_predicoes_teste.csv). A avaliação de notícias tem escopo distinto do baseline local e dos testes do produto.
