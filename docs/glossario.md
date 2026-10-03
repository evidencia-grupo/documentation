# Glossario Ontologico do Projeto EvidencIA

> **Proposito:** Definir formalmente os conceitos, termos operacionais e construtos pedagogicos do projeto EvidencIA. Todas as definicoes foram extraidas exclusivamente dos documentos oficiais do repositorio, acompanhadas dos links para suas fontes canonicas.

---

## Termos e Conceitos Centrais

### Alegacao (Claim)
- **Definicao:** Unidade elementar de significado e afirmacao factual extraida da transcricao de audio do video em reproducao. Cada alegacao contem uma proposicao verificavel, marca temporal de inicio e fim no video (`timestamp`), e serve como eixo para a busca de fatos correlatos.
- **Fonte Oficial:** [ADR-006 — Arquitetura Evidence-First (Decisao 2)](tecnico/decisoes/ADR-006-evidence-first-architecture.md) e [Contrato de Dados e API](tecnico/contrato-api.md).

### Evidencia (Evidence)
- **Definicao:** Trecho de informacao factual recuperado de fontes jornalisticas ou agencias de checagem auditadas (ex.: Aos Fatos, Agencia Lupa). Cada evidencia inclui titulo da materia, resumo contextual, URL publica auditavel, data da apuracao e grau de correspondencia semantica com a alegacao analisada.
- **Fonte Oficial:** [ADR-006 — Arquitetura Evidence-First](tecnico/decisoes/ADR-006-evidence-first-architecture.md) e [Pipeline de IA e Datasets](tecnico/ia-e-datasets.md).

### Evidence-Only
- **Definicao:** Modo de operacao e contingencia de primeira classe (*first-class citizen*) do sistema. Entrega ao usuario as alegacoes extraidas e os conjuntos de evidencias recuperadas sem qualquer intermediacao, sintese textual ou inferencia de LLM. Garante latencia sub-segundo, custo zero de IA e imunidade completa a alucinacoes.
- **Fonte Oficial:** [ADR-006 (Decisao 3)](tecnico/decisoes/ADR-006-evidence-first-architecture.md) e [Contrato de Dados e API](tecnico/contrato-api.md).

### Sem Evidencia Suficiente (Inconclusivo)
- **Definicao:** Regra de ouro epistemologica do projeto. Quando o mecanismo de busca nao localiza evidencias em fontes homologadas com similaridade suficiente, o sistema rotula a situacao explicitamente como incerteza investigativa ("Sem evidencia suficiente"). E estritamente proibido classificar a ausencia de checagem previa como "falso" ou "desinformacao".
- **Fonte Oficial:** [ADR-006 (Decisao 4)](tecnico/decisoes/ADR-006-evidence-first-architecture.md) e [Alinhamento com a Essential Question](visao/essential-question-alignment.md).

### Guiding Question (GQ)
- **Definicao:** Questao norteadora formulada durante a fase Engage do framework Challenge Based Learning (CBL). Desdobra a Essential Question em doze eixos investigativos concretos (GQ01 a GQ12), orientando o levantamento de requisitos, a analise exploratoria de dados e as escolhas de arquitetura.
- **Fonte Oficial:** [Guiding Questions (CBL)](visao/guiding-questions.md).

### Essential Question (EQ)
- **Definicao:** Pergunta fundamental e orientadora de todo o projeto EvidencIA: *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informacoes sem substituir seu pensamento critico?"*. Toda funcionalidade ou decisao de design deve ser subordinada a esta indagacao.
- **Fonte Oficial:** [Alinhamento com a Essential Question](visao/essential-question-alignment.md) e [Log de Decisoes](visao/decision-log.md).

### HU11 (Modo Evidence-First no MVP)
- **Definicao:** Historia de usuario promovida a requisito Must-Have do MVP pelo ADR-006. Especifica a interface do painel lateral Preact sem score global, estruturada em ClaimCards, EvidenceCards e area de reflexao critica orientada ao usuario.
- **Fonte Oficial:** [Backlog e Historias](requisitos/backlog-e-historias.md) e [Product Backlog](scrum/product-backlog.md).

### Provedor de LLM (LLM Provider)
- **Definicao:** Modulo de servico encapsulado no Backend Proxy responsavel por orquestrar a inferencia de modelos de linguagem (ex.: Ollama local com Qwen 2.5-3B ou APIs remotas). Opera sob a salvaguarda estrita de proibicao de mocks silenciosos em ambiente de producao.
- **Fonte Oficial:** [Arquitetura do Sistema](tecnico/arquitetura.md) e [ADR-002 (Backend Proxy)](tecnico/decisoes/ADR-002-backend-proxy.md).

### Retrieval (Recuperacao da Informacao)
- **Definicao:** Processo computacional de busca e ranqueamento semantico de artigos de checagem em relacao a uma alegacao. Emprega representacao vetorial (embeddings) e busca densa/lexical sobre corpora estruturados de fatos jornalisticos.
- **Fonte Oficial:** [Pipeline de IA e Datasets](tecnico/ia-e-datasets.md) e [ADR-005](tecnico/decisoes/ADR-005-modelo-local-e-datasets-brasileiros.md).

### Proveniencia (Data Provenance)
- **Definicao:** Registro detalhado da origem, linhagem, data de extracao e licenca legal de cada dado e evidencia utilizada no sistema. Garante que qualquer fato apresentado possa ser rastreado ate sua apuracao jornalistica original.
- **Fonte Oficial:** [Portfolio de Pesquisa](cbl/reflect-share/research-portfolio.md) e [ADR-005](tecnico/decisoes/ADR-005-modelo-local-e-datasets-brasileiros.md).

### Gauge e Score Global (Descontinuados)
- **Definicao:** Indicador numerico de veracidade (0 a 100%) e velocimetro tricolor da interface legada. Foram formalmente descontinuados e removidos da UX principal pelo ADR-006 por representarem autoridade algoritmica que induz a aceitacao passiva e atrofia o pensamento critico.
- **Fonte Oficial:** [ADR-006 (Decisao 1)](tecnico/decisoes/ADR-006-evidence-first-architecture.md) e [ADR-001](tecnico/decisoes/ADR-001-manifest-v3.md).

### Condicao A x Condicao B (Controle vs. Evidence-First)
- **Definicao:** Protocolo experimental between-subjects da fase Act do CBL:
  - **Condicao A (Controle):** Prototipo isolado contendo o velocimetro e veredito algoritmico fechado.
  - **Condicao B (Tratamento):** Extensao oficial operando com arquitetura Evidence-First, exibindo alegacoes, evidencias factuais e prompts reflexivos.
- **Fonte Oficial:** [Plano do Experimento Act](cbl/act/experiment-plan.md) e [Definicao de Metricas](cbl/act/metrics-definition.md).
