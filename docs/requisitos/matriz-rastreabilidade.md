# Matriz de Rastreabilidade de Requisitos

## Nesta página

- [Visão Geral da Rastreabilidade](#visao-geral-da-rastreabilidade)
- [Matriz Integrada: GQ → ADR → HU → Requisito → Artefato](#matriz-integrada)
- [Matriz Bidirecional de Requisitos Funcionais (RF)](#matriz-bidirecional-de-requisitos-funcionais-rf)
- [Matriz Bidirecional de Requisitos Não Funcionais (RNF)](#matriz-bidirecional-de-requisitos-nao-funcionais-rnf)

---

## Visão Geral da Rastreabilidade {: #visao-geral-da-rastreabilidade }

Esta matriz consolida a relação bidirecional entre as **Guiding Questions (GQ)** originadas no desafio CBL, as decisões arquiteturais (**ADR**), as histórias de usuário (**HU**), os requisitos técnicos (**RF/RNF**) e os artefatos de código futuros.

> [!NOTE]
> Todos os artefatos de código listados nesta matriz aparecem com status **Planejado**, refletindo a especificação dos incrementos para as próximas sprints conforme a governança Scrum do projeto.

---

## Matriz Integrada: GQ → ADR → HU → Requisito → Artefato {: #matriz-integrada }

| GQ Origem | Decisão Arquitetural | História de Usuário | Requisito Técnico | Artefato Futuro | Status do Artefato |
|:---|:---|:---|:---|:---|:---|
| **GQ01** (Decomposição em alegações) | [ADR-006 Decisão 2](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-2-unidade-alegacao-evidencias) | [HU13](backlog-e-historias.md#hu13) | [RF-06](catalogo-requisitos.md#rf-06) | `shared/schemas/api-schema.json` | Planejado |
| **GQ02** (Fim de veredito / score) | [ADR-006 Decisão 1](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global) | [HU01](backlog-e-historias.md#hu01), [HU13](backlog-e-historias.md#hu13) | [RF-06](catalogo-requisitos.md#rf-06), [RNF-07](catalogo-requisitos.md#rnf-07) | `extension/src/panel/components/ClaimCard.tsx` | Planejado |
| **GQ03** (IA como assistente auxiliar) | [ADR-006 Decisão 4](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-4-a-llm-nao-decide-a-verdade-antes-de-recuperar-evidencias) | [HU02](backlog-e-historias.md#hu02), [HU16](backlog-e-historias.md#hu16) | [RF-03](catalogo-requisitos.md#rf-03), [RF-14](catalogo-requisitos.md#rf-14) | `backend/app/providers/base.py` | Planejado |
| **GQ04** (Corpora e evidências PT-BR) | [ADR-006 Decisão 5](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-5-papeis-dos-datasets) | [HU07](backlog-e-historias.md#hu07), [HU14](backlog-e-historias.md#hu14) | [RF-04](catalogo-requisitos.md#rf-04), [RF-13](catalogo-requisitos.md#rf-13) | `backend/ml/datasets/downloader.py` | Planejado |
| **GQ05** (Estado sem evidência) | [ADR-006 Decisão 3](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-3-estado-sem-evidencia-suficiente) | [HU09](backlog-e-historias.md#hu09) | [RF-07](catalogo-requisitos.md#rf-07), [RF-12](catalogo-requisitos.md#rf-12) | `extension/src/panel/components/UncertaintyAlert.tsx` | Planejado |
| **GQ06** (Fontes conflitantes expostas) | [ADR-006 Decisão 3](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-3-estado-sem-evidencia-suficiente) | [HU09](backlog-e-historias.md#hu09), [HU14](backlog-e-historias.md#hu14) | [RF-07](catalogo-requisitos.md#rf-07), [RF-13](catalogo-requisitos.md#rf-13) | `extension/src/panel/components/EvidenceCard.tsx` | Planejado |
| **GQ07** (RAG factual e sem mock em prod) | [ADR-006 Decisão 4 e 6](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-4-a-llm-nao-decide-a-verdade-antes-de-recuperar-evidencias) | [HU14](backlog-e-historias.md#hu14), [HU16](backlog-e-historias.md#hu16) | [RF-13](catalogo-requisitos.md#rf-13), [RF-15](catalogo-requisitos.md#rf-15) | `backend/ml/chroma_index.py` | Planejado |
| **GQ08** (Reflexão crítica promovida) | [ADR-006 Decisão 7](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-7-hu11-promovida-para-must-have-do-mvp) | [HU11](backlog-e-historias.md#hu11), [HU15](backlog-e-historias.md#hu15) | [RF-05](catalogo-requisitos.md#rf-05) | `extension/src/panel/components/ReflectionQuestions.tsx` | Planejado |
| **GQ09** (Avaliação de retrieval / EDA) | [ADR-006 Decisão 8](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-8-criterios-de-aceitacao-de-performance-e-comportamento) | [HU03](backlog-e-historias.md#hu03) | [RNF-01](catalogo-requisitos.md#rnf-01) | `backend/ml/notebooks/eda_retrieval.ipynb` | Planejado |
| **GQ10** (Contexto temporal de vídeos) | [ADR-006 Decisão 2](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-2-unidade-alegacao-evidencias) | [HU08](backlog-e-historias.md#hu08) | [RF-11](catalogo-requisitos.md#rf-11) | `shared/schemas/api-schema.json` | Planejado |
| **GQ11** (Usuário como investigador final) | [ADR-006 Decisão 1 e 7](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global) | [HU01](backlog-e-historias.md#hu01), [HU13](backlog-e-historias.md#hu13), [HU15](backlog-e-historias.md#hu15) | [RF-01](catalogo-requisitos.md#rf-01), [RF-05](catalogo-requisitos.md#rf-05) | `extension/src/panel/index.tsx` | Planejado |
| **GQ12** (Explicitação de limites e lacunas) | [ADR-006 Decisão 1 e 3](../tecnico/decisoes/ADR-006-evidence-first-architecture.md#decisao-1-fim-do-score-global) | [HU09](backlog-e-historias.md#hu09), [HU13](backlog-e-historias.md#hu13) | [RF-06](catalogo-requisitos.md#rf-06), [RF-12](catalogo-requisitos.md#rf-12) | `shared/schemas/api-schema.json` | Planejado |

---

## Matriz Bidirecional de Requisitos Funcionais (RF) {: #matriz-bidirecional-de-requisitos-funcionais-rf }

| ID Requisito | Caso de Uso | Cenário Operacional | História de Usuário | Componente Responsável | Estratégia de Verificação |
|:---|:---|:---|:---|:---|:---|
| **RF-01** (Acionamento) | [UC-01](casos-de-uso.md#uc-01) | [Cenário 01](cenarios.md#cenario-01), [Cenário 03](cenarios.md#cenario-03) | [HU01, HU03](backlog-e-historias.md#hu01) | Content Script & Shadow DOM | Teste unitário de injeção e teste E2E com Playwright |
| **RF-02** (Extração de Legendas) | [UC-02](casos-de-uso.md#uc-02) | [Cenário 02](cenarios.md#cenario-02) | [HU05](backlog-e-historias.md#hu05) | Content Script & Interceptador | Teste de integração simulando player com legendas |
| **RF-03** (Evidências Claras) | [UC-01, UC-03](casos-de-uso.md#uc-03) | [Cenário 03](cenarios.md#cenario-03), [Cenário 10](cenarios.md#cenario-10) | [HU01, HU02, HU04](backlog-e-historias.md#hu01) | Backend Proxy & Pipeline RAG | Teste automatizado de contrato de API e fixture de síntese |
| **RF-04** (Fontes e Links) | [UC-04](casos-de-uso.md#uc-04) | [Cenário 04](cenarios.md#cenario-04) | [HU07, HU14](backlog-e-historias.md#hu07) | Painel Lateral (`EvidenceCard.tsx`) | Teste de componente validando abertura com `target="_blank"` |
| **RF-05** (Pensamento Crítico) | [UC-05](casos-de-uso.md#uc-05) | [Cenário 05](cenarios.md#cenario-05) | [HU11, HU15](backlog-e-historias.md#hu11) | Painel Lateral (`ReflectionQuestions.tsx`) | Avaliação de neutralidade de prompts e testes visuais |
| **RF-06** (Investigação Estruturada) | [UC-01, UC-03](casos-de-uso.md#uc-01) | [Cenário 03](cenarios.md#cenario-03), [Cenário 10](cenarios.md#cenario-10) | [HU02, HU04, HU13](backlog-e-historias.md#hu02) | Painel Lateral (Preact / `ClaimCard.tsx`) | Teste de regressão visual validando ausência de score/gauge |
| **RF-07** (Alerta de Incerteza) | [UC-06](casos-de-uso.md#uc-06) | [Cenário 06](cenarios.md#cenario-06) | [HU09](backlog-e-historias.md#hu09) | Backend Proxy & Badge de UI (`UncertaintyAlert.tsx`) | Teste unitário com fixture de fontes divergentes |
| **RF-08** (Ausência de Legenda) | [UC-02](casos-de-uso.md#uc-02) | [Cenário 08](cenarios.md#cenario-08) | [HU05, HU10](backlog-e-historias.md#hu05) | Content Script | Teste automatizado com vídeo com legendas desativadas |
| **RF-09** (Cache Local) | [UC-01](casos-de-uso.md#uc-01) | [Cenário 07](cenarios.md#cenario-07) | [HU03, HU06](backlog-e-historias.md#hu03) | Service Worker & `chrome.storage` | Teste de unidade com mock de `chrome.storage.local` e TTL |
| **RF-10** (Feedback de Utilidade) | [UC-05](casos-de-uso.md#uc-05) *(OUT)* | [Cenário 11](cenarios.md#cenario-11) | [HU12](backlog-e-historias.md#hu12) | Módulo de Telemetria (Pós-MVP) | Teste de integração assíncrona anônima |
| **RF-11** (Contexto Temporal) | [UC-01, UC-03](casos-de-uso.md#uc-01) | [Cenário 09](cenarios.md#cenario-09) | [HU08](backlog-e-historias.md#hu08) | Content Script & Backend Proxy | Teste de contrato de metadados (`uploadDate`, `author`) |
| **RF-12** (Insuficiência de Evidência) | [UC-06](casos-de-uso.md#uc-06) | [Cenário 06](cenarios.md#cenario-06) | [HU09](backlog-e-historias.md#hu09) | Backend Proxy & Painel Lateral | Teste unitário verificando estado `insufficient_evidence` |
| **RF-13** (Provenance de Evidências) | [UC-04](casos-de-uso.md#uc-04) | [Cenário 04](cenarios.md#cenario-04) | [HU07, HU14](backlog-e-historias.md#hu07) | Backend Proxy & `EvidenceCard.tsx` | Teste de validação de schema JSON com campos de provenance |
| **RF-14** (Desacoplamento de Provedores) | [UC-03](casos-de-uso.md#uc-03) | [Cenário 03](cenarios.md#cenario-03) | [HU16](backlog-e-historias.md#hu16) | Backend Proxy (`app/providers/base.py`) | Teste de injeção de dependência e fallback Evidence-Only |
| **RF-15** (Bloqueio de Mock em Produção) | — | — | [HU16](backlog-e-historias.md#hu16) | Backend Proxy (Startup Gate) | Teste de inicialização induzindo falha com `ENV=production` |

---

## Matriz Bidirecional de Requisitos Não Funcionais (RNF) {: #matriz-bidirecional-de-requisitos-nao-funcionais-rnf }

| ID Requisito | Propósito Técnico | Cenários Operacionais | Histórias de Usuário | Componente Crítico | Ferramenta de Validação |
|:---|:---|:---|:---|:---|:---|
| **RNF-01** (SLA Latência) | Desempenho perceptivo (1ª evidência <= 5s P90, completo <= 10s P90, feedback <= 1s) | [Cenário 01, 03, 07, 08](cenarios.md#cenario-01) | [HU01, HU03, HU06, HU10](backlog-e-historias.md#hu01) | Pipeline Extensão ↔ Backend ↔ IA | Teste de carga E2E e medição com `performance.now()` |
| **RNF-02** (Impacto na Página) | Desempenho do navegador (TBT <= 50ms, RAM <= 80MB) | [Cenário 01, 03](cenarios.md#cenario-01) | [HU04](backlog-e-historias.md#hu04) | Content Script e Shadow DOM | Auditoria automatizada com Google Lighthouse no CI |
| **RNF-03** (Compatibilidade) | Manifest V3 em Chrome, Edge e Brave | [Cenário 02](cenarios.md#cenario-02) | [HU05](backlog-e-historias.md#hu05) | `manifest.json` & Service Worker | Testes multiplataforma em runners Chromium |
| **RNF-04** (Segurança) | Zero chaves no cliente, intermediação proxy, bloqueio de mock | [Cenário 03](cenarios.md#cenario-03) | [HU03, HU04, HU16](backlog-e-historias.md#hu03) | Backend Proxy (Python FastAPI · [ADR-004](../tecnico/decisoes/ADR-004-stack-tecnologica.md)) | Análise estática de código (SAST) e Secret Scanning |
| **RNF-05** (Privacidade LGPD) | Permissão mínima (`activeTab`), sem rastreamento | [Cenário 04, 07, 11](cenarios.md#cenario-04) | [HU06, HU07, HU12, HU14](backlog-e-historias.md#hu06) | Service Worker e Storage Local | Auditoria de segurança de permissões de extensão |
| **RNF-06** (Degradação Segura) | Tolerância a falhas externas sem crash (modo Evidence-Only) | [Cenário 02, 03, 06, 08](cenarios.md#cenario-02) | [HU05, HU09, HU10, HU16](backlog-e-historias.md#hu05) | Interceptador de Exceções da Extensão & Backend | Testes de caos com falha induzida de rede e timeout |
| **RNF-07** (Acessibilidade) | WCAG 2.1 AA, contraste >= 4.5:1, navegação teclado | [Cenário 01, 04, 06, 08, 09, 10](cenarios.md#cenario-01) | [HU01, HU02, HU07, HU08, HU09, HU10, HU13, HU15](backlog-e-historias.md#hu01) | Painel Lateral (UI) | Auditoria automatizada com `axe-core` em CI |

---

**Próximo:** [Arquitetura do Sistema](../tecnico/arquitetura.md) — componentes e decisões de engenharia.  
**Ver também:** [Catálogo Consolidado de Requisitos](catalogo-requisitos.md) — definições detalhadas de cada requisito.
