# Lições Aprendidas — EvidencIA

> **Fase:** CBL Reflect & Share  
> **Estado:** SCAFFOLD  
> **Fontes Primárias:** Retrospectivas de Sprint, Revisões, PRs e Decisões de Arquitetura (@`9e95b68` e @`27c53e8`)

---

## 1. Visão Geral

Este documento consolida as lições aprendidas ao longo do desenvolvimento do projeto EvidencIA. Todas as entradas derivam estritamente de ocorrências empíricas registradas nas cerimônias ágeis do Scrum, nas decisões técnicas formais (ADRs) ou na auditoria do Challenge Based Learning (CBL). Nenhuma lição de teor genérico ou desvinculada de evidência rastreável é admitida.

---

## 2. Matriz de Lições Aprendidas por Categoria

### 2.1. Metodologia (Challenge Based Learning)

| O que aconteceu | Evidência [EV] | Lição Aprendida | Ação Futura |
|:---|:---|:---|:---|
| A equipe inicialmente desenhou a extensão como um medidor de veracidade, focando na tecnologia e não na formação do usuário. | [EV: documentation:docs/visao/essential-question-alignment.md#alinhamento-com-a-essential-question@9e95b68] | O alinhamento contínuo com a Essential Question é essencial para evitar que soluções de IA substituam a agência humana. | Instituir checagem formal contra as 12 GQs a cada novo épico do backlog. |
| A hipótese de impacto cognitivo foi formulada sem protocolo pré-registrado na largada do projeto. | [EV: documentation:docs/cbl/act/metrics-definition.md#regras-de-decisao-pre-registradas@9e95b68] | Em estudos de IHC e cognição, regras de decisão devem ser travadas antes da coleta para impedir viés de confirmação. | Manter tag imutável de pré-registro (`act-prereg-v1`) no repositório antes de rodar o Act. |

### 2.2. Dados e Machine Learning

| O que aconteceu | Evidência [EV] | Lição Aprendida | Ação Futura |
|:---|:---|:---|:---|
| Fake.br foi inicialmente imaginado como base de checagens factuais até a inspeção do corpus. | [EV: EvidencIA:backend/ml/datasets/sources.yaml#fakebr@27c53e8] | Nem todo dataset de desinformação serve para RAG; corpora linguísticos não possuem evidências rastreáveis. | Manter registro `sources.yaml` discriminando papéis (`linguistic_corpus` vs `fact_check_evidence`). |
| ClaimPT possui diferenças ortográficas e sintáticas por estar em Português Europeu (PT-EU). | [EV: EvidencIA:backend/ml/datasets/sources.yaml#claimpt@27c53e8] | Transferência direta de modelos ou embeddings entre variantes linguísticas degrada a qualidade sem adaptação prévia. | Restringir bases primárias de inferência ao contexto brasileiro (PT-BR). |
| Ausência de checagem em base de dados corria o risco de ser tratada como falsidade da alegação. | [EV: EvidencIA:backend/ml/schemas/evidence.py#verdictnormalized@27c53e8] | Ausência de evidência é um estado epistêmico neutro, distinto da refutação factual. | Tratar `unverifiable` e `unknown` como estados de primeira classe no schema canônico. |

### 2.3. Arquitetura de Software

| O que aconteceu | Evidência [EV] | Lição Aprendida | Ação Futura |
|:---|:---|:---|:---|
| Existiam fallbacks silenciosos em `fact_checker.py` que injetavam dados fictícios quando o LLM falhava. | [EV: EvidencIA:backend/tests/test_no_silent_mock_fallback.py#test_no_silent_fallback_in_fact_checker@27c53e8] | Fallbacks silenciosos geram falsa sensação de funcionamento e comprometem a integridade científica do sistema. | Adotar padrão fail-fast com exceção explícita `MockInProductionError` e modo Evidence-Only. |
| O contrato inicial da API expunha `score` numérico global que centralizava a autoridade no sistema. | [EV: documentation:docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global@9e95b68] | O schema de dados dita a experiência de uso: expor scores inviabiliza arquiteturas orientadas a reflexão. | Migrar o contrato para `claims[]`, `evidence[]` e `reflectionQuestions[]`. |
| O Service Worker do Manifest V3 sofre encerramento após 30 segundos de ociosidade pelo navegador. | [EV: documentation:docs/tecnico/decisoes/ADR-001-manifest-v3.md#consequencias@9e95b68] | Tarefas assíncronas longas na extensão exigem persistência imediata em `chrome.storage.local`. | Estruturar comunicação desacoplada via mensagens e cache de requisições. |

### 2.4. Processo Ágil e Governança Scrum

| O que aconteceu | Evidência [EV] | Lição Aprendida | Ação Futura |
|:---|:---|:---|:---|
| A Sprint 1 começou com quadro Kanban sem metas de sprint ou cerimônias documentadas. | [EV: documentation:docs/scrum/sprint-01/retrospective.md#o-que-funcionou-bem@9e95b68] | Kanban sem cadência formal dificulta a visibilidade de dependências complexas em equipes multidisciplinares. | Adotar Sprint Goals explícitos, Definition of Done e revisões de incremento. |
| Tarefas de investigação (EDA e revisão bibliográfica) tiveram dificuldade de pontuação em Story Points. | [EV: documentation:docs/scrum/sprint-01/retrospective.md#o-que-pode-melhorar@9e95b68] | Atividades de pesquisa pura não devem ser pontuadas como histórias de usuário tradicionais. | Utilizar spikes de tempo fixo (time-box) para investigação técnica antes da estimativa. |

### 2.5. Equipe e Dinâmica de Trabalho

| O que aconteceu | Evidência [EV] | Lição Aprendida | Ação Futura |
|:---|:---|:---|:---|
| Desenvolvimento de frontend e backend em repositórios separados gerou desalinhamento inicial de schemas. | [EV: documentation:docs/tecnico/contrato-api.md#contrato-de-dados-e-api@9e95b68] | Contratos de interface devem ser acordados e validados por esquemas JSON compartilhados antes do código. | Manter pasta `shared/schemas/` espelhada ou versionada como pacote comum entre repositórios. |

### 2.6. Produto e Experiência do Usuário (UX)

| O que aconteceu | Evidência [EV] | Lição Aprendida | Ação Futura |
|:---|:---|:---|:---|
| Usuários de teste preliminares focavam no gauge numérico sem ler as justificativas ou fontes. | [EV: documentation:docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md#contexto@9e95b68] | Elementos visuais reducionistas (gauges, cores vermelho/verde) monopolizam a atenção e canibalizam a reflexão. | Eliminar gauges e focar a hierarquia visual nos Evidence Cards e nas perguntas reflexivas. |
| A coleta de métricas em estudo comportamental corria o risco de violar a privacidade dos voluntários. | [EV: documentation:docs/cbl/act/telemetry-spec.md#especificacao-de-telemetria@9e95b68] | Telemetria ética deve ser puramente local, com sanitização de texto antes da persistência. | Proibir transmissões de rede na extensão para fins de telemetria; persistência estritamente local em arquivo exportável. |
