# Matriz de Rastreabilidade de Requisitos

## Nesta página

- [Visão Geral da Rastreabilidade](#visao-geral-da-rastreabilidade)
- [Matriz Integrada: GQ → ADR → HU → Requisito → Artefato](#matriz-integrada)
- [Matriz Bidirecional de Requisitos Funcionais (RF)](#matriz-bidirecional-de-requisitos-funcionais-rf)
- [Matriz Bidirecional de Requisitos Não Funcionais (RNF)](#matriz-bidirecional-de-requisitos-nao-funcionais-rnf)

---

## Visão Geral da Rastreabilidade {: #visao-geral-da-rastreabilidade }

Esta matriz consolida a relação bidirecional entre as **Guiding Questions (GQ)** originadas no desafio CBL, as decisões arquiteturais (**ADR**), as histórias de usuário (**HU**), os requisitos técnicos (**RF/RNF**) e os artefatos de código futuros.

!!! note "Nota"
    Todos os artefatos de código listados nesta matriz aparecem com status **Planejado**, refletindo a especificação dos incrementos para as próximas sprints conforme a governança Scrum do projeto.

---

## Matriz Integrada: GQ → ADR → HU → Requisito → Artefato {: #matriz-integrada }

| GQ Origem | Decisão Arquitetural | História de Usuário | Requisito Técnico | Artefato Futuro | Status do Artefato |
|:---|:---|:---|:---|:---|:---|
| **GQ01** (Decomposição em alegações) | [ADR-006 Decisão 2](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-2-unidade-alegacao-evidencias) | [HU13](backlog-e-historias.md#hu13) | [RF-06](catalogo-requisitos.md#rf-06) | `shared/schemas/api-schema.json` | Planejado |
| **GQ02** (Fim de veredito / score) | [ADR-006 Decisão 1](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global) | [HU01](backlog-e-historias.md#hu01), [HU13](backlog-e-historias.md#hu13) | [RF-06](catalogo-requisitos.md#rf-06), [RNF-07](catalogo-requisitos.md#rnf-07) | `extension/src/panel/components/ClaimCard.tsx` | Planejado |
| **GQ03** (IA como assistente auxiliar) | [ADR-006 Decisão 4](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-4-a-llm-nao-decide-a-verdade-antes-de-recuperar-evidencias) | [HU02](backlog-e-historias.md#hu02), [HU16](backlog-e-historias.md#hu16) | [RF-03](catalogo-requisitos.md#rf-03), [RF-14](catalogo-requisitos.md#rf-14) | `backend/app/providers/base.py` | Planejado |
| **GQ04** (Corpora e evidências PT-BR) | [ADR-006 Decisão 5](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-5-papeis-dos-datasets) | [HU07](backlog-e-historias.md#hu07), [HU14](backlog-e-historias.md#hu14) | [RF-04](catalogo-requisitos.md#rf-04), [RF-13](catalogo-requisitos.md#rf-13) | `backend/ml/datasets/downloader.py` | Planejado |
| **GQ05** (Estado sem evidência) | [ADR-006 Decisão 3](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-3-estado-sem-evidencia-suficiente) | [HU09](backlog-e-historias.md#hu09) | [RF-07](catalogo-requisitos.md#rf-07), [RF-12](catalogo-requisitos.md#rf-12) | `extension/src/panel/components/UncertaintyAlert.tsx` | Planejado |
| **GQ06** (Fontes conflitantes expostas) | [ADR-006 Decisão 3](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-3-estado-sem-evidencia-suficiente) | [HU09](backlog-e-historias.md#hu09), [HU14](backlog-e-historias.md#hu14) | [RF-07](catalogo-requisitos.md#rf-07), [RF-13](catalogo-requisitos.md#rf-13) | `extension/src/panel/components/EvidenceCard.tsx` | Planejado |
| **GQ07** (RAG factual e sem mock em prod) | [ADR-006 Decisão 4 e 6](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-4-a-llm-nao-decide-a-verdade-antes-de-recuperar-evidencias) | [HU14](backlog-e-historias.md#hu14), [HU16](backlog-e-historias.md#hu16) | [RF-13](catalogo-requisitos.md#rf-13), [RF-15](catalogo-requisitos.md#rf-15) | `backend/ml/chroma_index.py` | Planejado |
| **GQ08** (Reflexão crítica promovida) | [ADR-006 Decisão 7](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-7-hu11-promovida-para-must-have-do-mvp) | [HU11](backlog-e-historias.md#hu11), [HU15](backlog-e-historias.md#hu15) | [RF-05](catalogo-requisitos.md#rf-05) | `extension/src/panel/components/ReflectionQuestions.tsx` | Planejado |
| **GQ09** (Avaliação de retrieval / EDA) | [ADR-006 Decisão 8](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-8-criterios-de-aceitacao-de-performance-e-comportamento) | [HU03](backlog-e-historias.md#hu03) | [RNF-01](catalogo-requisitos.md#rnf-01) | `backend/ml/notebooks/eda_retrieval.ipynb` | Planejado |
| **GQ10** (Contexto temporal de vídeos) | [ADR-006 Decisão 2](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-2-unidade-alegacao-evidencias) | [HU08](backlog-e-historias.md#hu08) | [RF-11](catalogo-requisitos.md#rf-11) | `shared/schemas/api-schema.json` | Planejado |
| **GQ11** (Usuário como investigador final) | [ADR-006 Decisão 1 e 7](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global) | [HU01](backlog-e-historias.md#hu01), [HU13](backlog-e-historias.md#hu13), [HU15](backlog-e-historias.md#hu15) | [RF-01](catalogo-requisitos.md#rf-01), [RF-05](catalogo-requisitos.md#rf-05) | `extension/src/panel/index.tsx` | Planejado |
| **GQ12** (Explicitação de limites e lacunas) | [ADR-006 Decisão 1 e 3](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global) | [HU09](backlog-e-historias.md#hu09), [HU13](backlog-e-historias.md#hu13) | [RF-06](catalogo-requisitos.md#rf-06), [RF-12](catalogo-requisitos.md#rf-12) | `shared/schemas/api-schema.json` | Planejado |

---

## Matriz Bidirecional de Requisitos Funcionais (RF) {: #matriz-bidirecional-de-requisitos-funcionais-rf }

| ID Requisito | Caso de Uso | História de Usuário | Prioridade MoSCoW | Status no Escopo | Componente Responsável | Estratégia de Verificação |
|:---|:---|:---|:---:|:---:|:---|:---|
| **RF-01** (Acionamento da Análise) | [UC-01](casos-de-uso.md#uc-01) | [HU01, HU03](backlog-e-historias.md#hu01) | **Must Have** | **MVP (Onda 1)** | Content Script & Shadow DOM | Teste unitário de injeção e teste E2E com Playwright |
| **RF-02** (Extração de Legendas) | [UC-02](casos-de-uso.md#uc-02) | [HU05](backlog-e-historias.md#hu05) | **Must Have** | **MVP (Onda 1)** | Content Script & Interceptador | Teste de integração simulando player com legendas |
| **RF-03** (Evidências em Linguagem Clara) | [UC-01, UC-03](casos-de-uso.md#uc-03) | [HU01, HU02, HU04](backlog-e-historias.md#hu01) | **Must Have** | **MVP (Onda 1)** | Backend Proxy & Pipeline RAG | Teste automatizado de contrato de API e fixture de síntese |
| **RF-04** (Fontes e Links Auditáveis) | [UC-04](casos-de-uso.md#uc-04) | [HU07, HU14](backlog-e-historias.md#hu07) | **Must Have** | **MVP (Onda 1)** | Painel Lateral (`EvidenceCard.tsx`) | Teste de componente validando abertura com `target="_blank"` |
| **RF-05** (Retorno Reflexivo e Estímulo Crítico) | [UC-05](casos-de-uso.md#uc-05) | [HU11, HU15](backlog-e-historias.md#hu11) | **Must Have** *(promovido)* | **MVP (Onda 1)** | Painel Lateral (`ReflectionQuestions.tsx`) | Avaliação de neutralidade de prompts e testes visuais |
| **RF-06** (Síntese Estruturada por Alegações) | [UC-01, UC-03](casos-de-uso.md#uc-01) | [HU02, HU04, HU13](backlog-e-historias.md#hu02) | **Must Have** | **MVP (Onda 1)** | Painel Lateral (Preact / `ClaimCard.tsx`) | Teste de regressão visual validando ausência de score/gauge |
| **RF-07** (Alerta Expresso de Incerteza) | [UC-06](casos-de-uso.md#uc-06) | [HU09](backlog-e-historias.md#hu09) | **Must Have** | **MVP (Onda 1)** | Backend Proxy & Badge (`UncertaintyAlert.tsx`) | Teste unitário com fixture de fontes divergentes |
| **RF-08** (Alerta de Ausência de Legenda) | [UC-02](casos-de-uso.md#uc-02) | [HU05, HU10](backlog-e-historias.md#hu05) | **Must Have** | **MVP (Onda 1)** | Content Script | Teste automatizado com vídeo sem legendas disponíveis |
| **RF-09** (Armazenamento em Cache Local) | [UC-01](casos-de-uso.md#uc-01) | [HU03, HU06](backlog-e-historias.md#hu03) | **Should Have** | Incremento (Onda 2) | Service Worker & `chrome.storage.local` | Teste de unidade com mock de storage e expiração de TTL |
| **RF-10** (Feedback de Utilidade da Análise) | [UC-05](casos-de-uso.md#uc-05) | [HU12](backlog-e-historias.md#hu12) | **Could Have** | **Fora do MVP (Onda 3)** | Módulo de Telemetria Anônima | Teste de integração de envio assíncrono não bloqueante |
| **RF-11** (Contextualização Temporal e Autoria) | [UC-01, UC-03](casos-de-uso.md#uc-01) | [HU08](backlog-e-historias.md#hu08) | **Should Have** | Incremento (Onda 2) | Content Script & Backend Proxy | Teste de extração de metadados (`uploadDate`, `author`) |
| **RF-12** (Estado de Insuficiência de Evidência) | [UC-06](casos-de-uso.md#uc-06) | [HU09](backlog-e-historias.md#hu09) | **Must Have** | **MVP (Onda 1)** | Backend Proxy & Painel Lateral | Teste unitário com retorno `insufficient_evidence` |
| **RF-13** (Provenance Completa de Evidências) | [UC-04](casos-de-uso.md#uc-04) | [HU07, HU14](backlog-e-historias.md#hu07) | **Must Have** | **MVP (Onda 1)** | Backend Proxy & `EvidenceCard.tsx` | Teste de validação de schema JSON com hashes de proveniência |
| **RF-14** (Desacoplamento de Provedores de IA) | [UC-03](casos-de-uso.md#uc-03) | [HU16](backlog-e-historias.md#hu16) | **Must Have** | **MVP (Onda 1)** | Backend Proxy (`app/providers/base.py`) | Teste de injeção de dependência e fallback Evidence-Only |
| **RF-15** (Bloqueio Estrito de Mocks em Produção) | [UC-03](casos-de-uso.md#uc-03) | [HU16](backlog-e-historias.md#hu16) | **Must Have** | **MVP (Onda 1)** | Backend Proxy (Startup Gate) | Teste de inicialização induzindo falha com `ENV=production` |

---

## Matriz Bidirecional de Requisitos Não Funcionais (RNF) {: #matriz-bidirecional-de-requisitos-nao-funcionais-rnf }

| ID Requisito | Propósito Técnico | Histórias de Usuário | Prioridade MoSCoW | Status no Escopo | Componente Crítico | Ferramenta de Validação |
|:---|:---|:---|:---:|:---:|:---|:---|
| **RNF-01** (SLA de Latência) | Resposta perceptiva rápida (1ª evidência ≤ 5s P90; completo ≤ 10s P90; feedback ≤ 1s) | [HU01, HU03, HU06, HU10](backlog-e-historias.md#hu01) | **Must Have** | **MVP** | Pipeline Extensão ↔ Backend ↔ IA | Teste de carga E2E e medição com `performance.now()` |
| **RNF-02** (Impacto na Página) | Desempenho do navegador (TBT ≤ 50ms, RAM ≤ 80MB) | [HU04](backlog-e-historias.md#hu04) | **Must Have** | **MVP** | Content Script e Shadow DOM | Auditoria automatizada com Google Lighthouse no CI |
| **RNF-03** (Compatibilidade) | Suporte homologado a Manifest V3 em Chrome, Edge e Brave | [HU05](backlog-e-historias.md#hu05) | **Must Have** | **MVP** | `manifest.json` & Service Worker | Testes multiplataforma em executores Chromium |
| **RNF-04** (Segurança) | Zero chaves no cliente, intermediação proxy e bloqueio de mock | [HU03, HU04, HU16](backlog-e-historias.md#hu03) | **Must Have** | **MVP** | Backend Proxy (FastAPI · [ADR-004](../arquitetura/decisoes/ADR-004-stack-tecnologica.md)) | Análise estática de código (SAST) e Secret Scanning |
| **RNF-05** (Privacidade LGPD) | Permissão mínima (`activeTab`), sem histórico ou dados sensíveis | [HU06, HU07, HU12, HU14](backlog-e-historias.md#hu06) | **Must Have** | **MVP** | Service Worker e Storage Local | Auditoria de segurança de permissões de extensão |
| **RNF-06** (Degradação Segura) | Tolerância a falhas externas sem crash (modo Evidence-Only) | [HU05, HU09, HU10, HU16](backlog-e-historias.md#hu05) | **Must Have** | **MVP** | Interceptador de Exceções & Backend | Testes de injeção de falhas de rede e timeout |
| **RNF-07** (Acessibilidade) | WCAG 2.1 nível AA, contraste ≥ 4,5:1 e navegação por teclado | [HU01, HU02, HU07, HU08, HU09, HU10, HU13, HU15](backlog-e-historias.md#hu01) | **Must Have** | **MVP** | Painel Lateral (Preact UI) | Auditoria automatizada com `axe-core` em CI |

---

## Documentos Relacionados
- [Catálogo Consolidado de Requisitos](catalogo-requisitos.md) — Enunciados, regras de negócio e critérios de aceitação completos.
- [Backlog e Histórias de Usuário](backlog-e-historias.md) — Épicos e histórias estruturadas em Gherkin.
- [Casos de Uso do Sistema](casos-de-uso.md) — Diagramas e fluxos de interação entre usuário e sistema.
- [Arquitetura do Sistema](../arquitetura/arquitetura.md) — Modelagem C4 e mapeamento de componentes de software.
