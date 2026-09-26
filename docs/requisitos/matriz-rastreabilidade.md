# Matriz de Rastreabilidade de Requisitos

## Nesta página

- [Visão Geral da Rastreabilidade](#visao-geral-da-rastreabilidade)
- [Matriz Bidirecional de Requisitos Funcionais (RF)](#matriz-bidirecional-de-requisitos-funcionais-rf)
- [Matriz Bidirecional de Requisitos Não Funcionais (RNF)](#matriz-bidirecional-de-requisitos-nao-funcionais-rnf)

---

## Visão Geral da Rastreabilidade {: #visao-geral-da-rastreabilidade }

Esta matriz consolida a relação bidirecional entre os requisitos técnicos, casos de uso, histórias de usuário, cenários de aceitação em Gherkin e os componentes arquiteturais responsáveis por sua entrega.

---

## Matriz Bidirecional de Requisitos Funcionais (RF) {: #matriz-bidirecional-de-requisitos-funcionais-rf }

| ID Requisito | Caso de Uso | Cenário Operacional | História de Usuário | Componente Responsável | Estratégia de Verificação |
|:---|:---|:---|:---|:---|:---|
| **RF-01** (Acionamento) | [UC-01](casos-de-uso.md#uc-01) | [Cenário 01](cenarios.md#cenario-01), [Cenário 03](cenarios.md#cenario-03) | [HU01, HU03](backlog-e-historias.md#hu01) | Content Script & Shadow DOM | Teste unitário de injeção e teste E2E com Playwright |
| **RF-02** (Extração de Legendas) | [UC-02](casos-de-uso.md#uc-02) | [Cenário 02](cenarios.md#cenario-02) | [HU05](backlog-e-historias.md#hu05) | Content Script & Interceptador | Teste de integração simulando player com legendas |
| **RF-03** (Segmentação IA) | [UC-01, UC-03](casos-de-uso.md#uc-03) | [Cenário 03](cenarios.md#cenario-03), [Cenário 10](cenarios.md#cenario-10) | [HU01, HU02, HU04](backlog-e-historias.md#hu01) | Backend Proxy & Pipeline LLM | Teste automatizado de contrato de API e mock de LLM |
| **RF-04** (Fontes e Links) | [UC-04](casos-de-uso.md#uc-04) | [Cenário 04](cenarios.md#cenario-04) | [HU07](backlog-e-historias.md#hu07) | Painel Lateral (UI) | Teste de componente validando abertura com `target="_blank"` |
| **RF-05** (Pensamento Crítico) | [UC-05](casos-de-uso.md#uc-05) *(OUT)* | [Cenário 05](cenarios.md#cenario-05) | [HU11](backlog-e-historias.md#hu11) | Módulo Reflexivo (Pós-MVP) | Avaliação qualitativa de prompts e testes visuais |
| **RF-06** (Síntese Estruturada) | [UC-01, UC-03](casos-de-uso.md#uc-01) | [Cenário 03](cenarios.md#cenario-03), [Cenário 10](cenarios.md#cenario-10) | [HU02, HU04](backlog-e-historias.md#hu02) | Painel Lateral (Preact) | Teste de regressão visual com snapshots de UI |
| **RF-07** (Alerta de Incerteza) | [UC-06](casos-de-uso.md#uc-06) | [Cenário 06](cenarios.md#cenario-06) | [HU09](backlog-e-historias.md#hu09) | Backend Proxy & Badge de UI | Teste unitário com fixture de resposta inconclusiva |
| **RF-08** (Ausência de Legenda) | [UC-02](casos-de-uso.md#uc-02) | [Cenário 08](cenarios.md#cenario-08) | [HU05, HU10](backlog-e-historias.md#hu05) | Content Script | Teste automatizado com vídeo com legendas desativadas |
| **RF-09** (Cache Local) | [UC-01](casos-de-uso.md#uc-01) | [Cenário 07](cenarios.md#cenario-07) | [HU03, HU06](backlog-e-historias.md#hu03) | Service Worker & `chrome.storage` | Teste de unidade com mock de `chrome.storage.local` e TTL |
| **RF-10** (Feedback de Utilidade) | [UC-05](casos-de-uso.md#uc-05) *(OUT)* | [Cenário 11](cenarios.md#cenario-11) | [HU12](backlog-e-historias.md#hu12) | Módulo de Telemetria (Pós-MVP) | Teste de integração assíncrona anônima |
| **RF-11** (Contexto Temporal) | [UC-01, UC-03](casos-de-uso.md#uc-01) | [Cenário 09](cenarios.md#cenario-09) | [HU08](backlog-e-historias.md#hu08) | Content Script & Backend Proxy | Teste de contrato de metadados (`uploadDate`, `author`) |

---

## Matriz Bidirecional de Requisitos Não Funcionais (RNF) {: #matriz-bidirecional-de-requisitos-nao-funcionais-rnf }

| ID Requisito | Propósito Técnico | Cenários Operacionais | Histórias de Usuário | Componente Crítico | Ferramenta de Validação |
|:---|:---|:---|:---|:---|:---|
| **RNF-01** (SLA Latência) | Desempenho perceptivo (<= 10s P90, feedback <= 1s) | [Cenário 01, 03, 07, 08](cenarios.md#cenario-01) | [HU01, HU03, HU06, HU10](backlog-e-historias.md#hu01) | Pipeline Extensão ↔ Backend ↔ IA | Teste de carga E2E e medição com `performance.now()` |
| **RNF-02** (Impacto na Página) | Desempenho do navegador (TBT <= 50ms, RAM <= 80MB) | [Cenário 01, 03](cenarios.md#cenario-01) | [HU04](backlog-e-historias.md#hu04) | Content Script e Shadow DOM | Auditoria automatizada com Google Lighthouse no CI |
| **RNF-03** (Compatibilidade) | Manifest V3 em Chrome, Edge e Brave | [Cenário 02](cenarios.md#cenario-02) | [HU05](backlog-e-historias.md#hu05) | `manifest.json` & Service Worker | Testes multiplataforma em runners Chromium |
| **RNF-04** (Segurança) | Zero chaves no cliente, intermediação proxy | [Cenário 03](cenarios.md#cenario-03) | [HU03, HU04](backlog-e-historias.md#hu03) | Backend Proxy (Node.js/Python) | Análise estática de código (SAST) e Secret Scanning |
| **RNF-05** (Privacidade LGPD) | Permissão mínima (`activeTab`), sem rastreamento | [Cenário 04, 07, 11](cenarios.md#cenario-04) | [HU06, HU07, HU12](backlog-e-historias.md#hu06) | Service Worker e Storage Local | Auditoria de segurança de permissões de extensão |
| **RNF-06** (Degradação Segura) | Tolerância a falhas externas sem crash | [Cenário 02, 03, 06, 08](cenarios.md#cenario-02) | [HU05, HU09, HU10](backlog-e-historias.md#hu05) | Interceptador de Exceções da Extensão | Testes de caos com falha induzida de rede e HTTP 500/504 |
| **RNF-07** (Acessibilidade) | WCAG 2.1 AA, contraste >= 4.5:1, navegação teclado | [Cenário 01, 04, 06, 08, 09, 10](cenarios.md#cenario-01) | [HU01, HU02, HU07, HU08, HU09, HU10](backlog-e-historias.md#hu01) | Painel Lateral (UI) | Auditoria automatizada com `axe-core` em CI |

---

**Próximo:** [Arquitetura do Sistema](../tecnico/arquitetura.md) — componentes e decisões de engenharia.  
**Ver também:** [Catálogo Consolidado de Requisitos](catalogo-requisitos.md) — definições detalhadas de cada requisito.
