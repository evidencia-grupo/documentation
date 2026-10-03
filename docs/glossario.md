# Glossário Oficial do Projeto EvidencIA

> **O que você vai encontrar aqui:** Definições formais e padronizadas de todos os conceitos ontológicos, metodológicos, arquiteturais e termos de engenharia adotados no projeto EvidencIA. Todas as definições estão harmonizadas com o [ADR-006](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) e demais documentos normativos.

---

## 1. Conceitos Centrais e Ontologia Evidence-First

### Alegação (*Claim*)
- **Definição:** Unidade elementar e atômica de significado factual extraída da transcrição de áudio do vídeo em reprodução. Cada alegação contém uma proposição verificável, marcação temporal de início e fim no vídeo (`timestamp`), e serve como eixo principal para a busca de fatos correlatos.
- **Fonte Oficial:** [ADR-006 (Decisão 2)](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) e [Contrato de Dados e API](arquitetura/contrato-api.md).

### Evidência (*Evidence*)
- **Definição:** Trecho de informação factual e contextual recuperado de agências de checagem ou fontes jornalísticas auditadas (ex.: Aos Fatos, Agência Lupa). Cada evidência inclui título da matéria, resumo contextual, URL pública auditável, data de apuração, veículo de imprensa e identificador de proveniência.
- **Fonte Oficial:** [ADR-006 (Decisão 2)](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) e [Pipeline de IA e Datasets](arquitetura/ia-e-datasets.md).

### Evidence-First
- **Definição:** Paradigma arquitetural e pedagógico central do projeto EvidencIA. Substitui o modelo tradicional de "veredito algorítmico" por uma interface orientada a alegações individuais, evidências jornalísticas com links auditáveis e perguntas de estímulo reflexivo, preservando a autonomia intelectual do usuário.
- **Fonte Oficial:** [ADR-006 (Decisão 1)](arquitetura/decisoes/ADR-006-evidence-first-architecture.md).

### Evidence-Only
- **Definição:** Modo de operação e contingência de primeira classe (*first-class citizen*) do sistema. Entrega à pessoa usuária as alegações extraídas e as evidências recuperadas diretamente das bases de checagem, sem intermediação de modelos de linguagem (LLM). Garante resposta com latência inferior a 1 segundo, custo zero de inferência e imunidade contra alucinações.
- **Fonte Oficial:** [ADR-006 (Decisão 3)](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) e [Contrato de Dados e API](arquitetura/contrato-api.md).

### Sem Evidência Suficiente (*Insufficient Evidence*)
- **Definição:** Estado epistêmico formal do sistema exibido quando a busca semântica não localiza registros que comprovem ou contradigam uma alegação nas bases homologadas. É estritamente proibido converter a ausência de checagem em rótulo de "falsidade". Esse estado é apresentado na seção "O que ainda não sabemos" da interface.
- **Fonte Oficial:** [ADR-006 (Decisão 3)](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) e [RF-12](requisitos/catalogo-requisitos.md#rf-12).

### Proveniência de Dados (*Data Provenance*)
- **Definição:** Registro auditável e detalhado da origem, versão, data de publicação, link canônico e hash criptográfico de cada dado ou evidência apresentado no sistema, permitindo que a pessoa usuária faça a validação independente da fonte primária.
- **Fonte Oficial:** [ADR-006](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) e [RF-13](requisitos/catalogo-requisitos.md#rf-13).

### Score Global e Velocímetro (*Descontinuados*)
- **Definição:** Indicador numérico percentual (0 a 100%) e medidor visual tricolor presentes nos protótipos iniciais do projeto. Foram formalmente descontinuados pelo ADR-006 por representarem uma autoridade algorítmica impositiva que induz à aceitação passiva e atrofia o pensamento crítico.
- **Fonte Oficial:** [ADR-006 (Decisão 1)](arquitetura/decisoes/ADR-006-evidence-first-architecture.md).

---

## 2. Metodologia Challenge Based Learning (CBL)

### Essential Question (EQ)
- **Definição:** A pergunta fundamental de pesquisa e design que norteia todas as decisões do projeto: *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?"*.
- **Fonte Oficial:** [Alinhamento com a Essential Question](requisitos/essential-question-alignment.md).

### Guiding Questions (GQs)
- **Definição:** As 12 questões orientadoras desdobradas na fase Engage do framework CBL (GQ01 a GQ12), responsáveis por direcionar o levantamento de requisitos, a exploração de dados (EDA) e a arquitetura técnica.
- **Fonte Oficial:** [Guiding Questions (CBL)](validacao/guiding-questions.md).

### Fases do Ciclo CBL
- **Engage:** Fase de imersão no problema, definição da *Big Idea*, da *Essential Question* e das 12 perguntas orientadoras.
- **Investigate:** Fase de pesquisa aprofundada, análise exploratória de dados (EDA), elicitação de requisitos e modelagem de arquitetura.
- **Act:** Fase de projeto experimental, implementação do protótipo, instrumentação de telemetria e aplicação de testes com pessoas participantes.
- **Reflect & Share:** Fase de avaliação crítica dos resultados, síntese de lições aprendidas, portfólio de pesquisa e apresentação para a banca avaliadora.
- **Fonte Oficial:** [Mapa do Projeto](visao/mapa-do-projeto.md) e [Painel de Status](visao/status.md).

### Condição A vs. Condição B (Estudo Experimental Act)
- **Definição:** Protocolo experimental comparativo entre grupos (*between-subjects*):
  - **Condição A (Controle):** Protótipo isolado contendo o velocímetro e veredito algorítmico fechado.
  - **Condição B (Tratamento):** Extensão oficial operando com arquitetura Evidence-First, exibindo cartões de alegações, evidências e perguntas reflexivas.
- **Fonte Oficial:** [Plano do Experimento Act](validacao/experiment-plan.md) e [Definição de Métricas](validacao/metrics-definition.md).

---

## 3. Termos Técnicos de Extensões e Arquitetura Web

### activeTab
- **Definição:** Permissão de segurança do Manifest V3 que concede acesso temporário apenas à aba atualmente em foco quando a extensão é ativada explicitamente pelo usuário, garantindo privacidade e princípio do menor privilégio.
- **Fonte Oficial:** [ADR-001](arquitetura/decisoes/ADR-001-manifest-v3.md) e [RNF-05](requisitos/catalogo-requisitos.md#rnf-05).

### Backend Proxy
- **Definição:** Serviço intermediário desenvolvido em Python FastAPI responsável por orquestrar chamadas de IA e buscas externas. Garante que nenhuma chave de API seja exposta no cliente e implementa controle de taxa (*rate limiting*).
- **Fonte Oficial:** [ADR-002](arquitetura/decisoes/ADR-002-backend-proxy.md) e [Contrato de API](arquitetura/contrato-api.md).

### Content Script
- **Definição:** Módulo JavaScript injetado na página do YouTube (`youtube.com/watch*`) responsável por capturar o `videoId`, extrair as legendas do player e injetar o botão e o painel lateral em uma árvore de DOM isolada.
- **Fonte Oficial:** [Arquitetura do Sistema](arquitetura/arquitetura.md).

### Manifest V3 (MV3)
- **Definição:** Especificação técnica moderna da plataforma de extensões para navegadores baseados em Chromium, exigindo a substituição de páginas de segundo plano persistentes por Service Workers orientados a eventos.
- **Fonte Oficial:** [ADR-001](arquitetura/decisoes/ADR-001-manifest-v3.md).

### Retrieval-Augmented Generation (RAG)
- **Definição:** Técnica de inteligência artificial que recupera trechos factuais em bases de conhecimento antes de realizar a geração ou sumarização de texto, ancorando as respostas em dados verificáveis e evitando alucinações.
- **Fonte Oficial:** [Pipeline de IA e Datasets](arquitetura/ia-e-datasets.md).

### Shadow DOM
- **Definição:** Recurso de encapsulamento da Web API que isola a estrutura DOM e os estilos CSS da interface da extensão, impedindo conflitos visuais com a folha de estilos nativa do YouTube.
- **Fonte Oficial:** [Design System](requisitos/design-system.md) e [RNF-02](requisitos/catalogo-requisitos.md#rnf-02).

### TTL (Time to Live)
- **Definição:** Tempo de expiração dos dados de análise armazenados localmente no navegador via `chrome.storage.local`. O valor homologado no projeto é de 24 horas.
- **Fonte Oficial:** [ADR-003](arquitetura/decisoes/ADR-003-estrategia-cache-local.md).

---

## 4. Engenharia de Requisitos e Governança de Produto

### Definition of Done (DoD)
- **Definição:** Critérios formais de qualidade e aceitação que autorizam a homologação e o encerramento de qualquer entrega no projeto, abrangendo cobertura de testes, validação estrita de linters e conformidade de documentação.
- **Fonte Oficial:** [Definition of Done](validacao/definition-of-done.md).

### Gherkin
- **Definição:** Linguagem estruturada no formato `Dado / Quando / Então` (*Given / When / Then*) empregada para formalizar os critérios de aceitação de cada História de Usuário.
- **Fonte Oficial:** [Backlog e Histórias de Usuário](requisitos/backlog-e-historias.md).

### MoSCoW
- **Definição:** Técnica de priorização de requisitos categorizada em quatro níveis:
  - **Must Have:** Essencial para o funcionamento do MVP.
  - **Should Have:** Importante, mas não bloqueia a versão mínima.
  - **Could Have:** Desejável para ciclos posteriores (Pós-MVP).
  - **Won't Have:** Expressamente fora do escopo atual.
- **Fonte Oficial:** [Priorização e MVP](requisitos/priorizacao-e-mvp.md).

### Siglas de Engenharia
| Sigla | Significado | Aplicação no Projeto |
|:---|:---|:---|
| **RF** | Requisito Funcional | Comportamentos operacionais do sistema (RF-01 a RF-15). |
| **RNF** | Requisito Não Funcional | Atributos de qualidade, desempenho, segurança e acessibilidade (RNF-01 a RNF-07). |
| **UC** | Caso de Uso (*Use Case*) | Fluxos formais de interação entre atores e o sistema (UC-01 a UC-06). |
| **HU** | História de Usuário (*User Story*) | Unidades de entrega do backlog com critérios Gherkin (HU01 a HU16). |
| **SLA** | Acordo de Nível de Serviço | Metas temporais de resposta (≤ 5s para 1ª evidência, ≤ 10s completo). |
| **TBT** | *Total Blocking Time* | Métrica de desempenho de renderização na página (limite de +50 ms). |
| **WCAG 2.1 AA** | *Web Content Accessibility Guidelines* | Diretrizes de acessibilidade digital para contraste, teclado e leitores de tela. |

---

## Documentos Relacionados
- [Visão Geral do Projeto](visao/visao-geral-do-projeto.md) — Resumo de alto nível do produto.
- [Catálogo de Requisitos](requisitos/catalogo-requisitos.md) — Especificação detalhada dos RFs e RNFs.
- [Matriz de Rastreabilidade](requisitos/matriz-rastreabilidade.md) — Conexão entre GQs, ADRs, HUs e requisitos.
- [ADR-006 — Arquitetura Evidence-First](arquitetura/decisoes/ADR-006-evidence-first-architecture.md) — Decisão sobre o fim de scores e adoção do modelo factual.
