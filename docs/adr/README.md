<!-- nav:start -->
[Voltar ao Indice Mestre](../README.md)
<!-- nav:end -->

# Architecture Decision Records (ADRs)

> **Proposito:** Indice e alias de convenção para os Registros de Decisao Arquitetural do projeto EvidencIA. Os arquivos canonicos estao organizados em [`docs/tecnico/decisoes/`](../tecnico/decisoes/README.md).

---

## Arquivos e Decisoes Homologadas
- [`ADR-001 (Manifest V3)`](../tecnico/decisoes/ADR-001-manifest-v3.md): Arquitetura da extensao baseada em Manifest V3 com Service Worker.
- [`ADR-002 (Backend Proxy Dedicado)`](../tecnico/decisoes/ADR-002-backend-proxy.md): Intermediacao segura de chamadas de LLMs e protecao de chaves.
- [`ADR-003 (Estrategia de Cache Local)`](../tecnico/decisoes/ADR-003-estrategia-cache-local.md): Cache client-side com TTL de 24h via `chrome.storage.local`.
- [`ADR-004 (Definicao da Stack Tecnologica)`](../tecnico/decisoes/ADR-004-stack-tecnologica.md): Preact, Vite, FastAPI, Pydantic v2 e uv.
- [`ADR-005 (Modelo Local e Datasets Brasileiros)`](../tecnico/decisoes/ADR-005-modelo-local-e-datasets-brasileiros.md): Inferencia via Ollama e priorizacao de corpora jornalisticos PT-BR.
- [`ADR-006 (Arquitetura Evidence-First)`](../tecnico/decisoes/ADR-006-evidence-first-architecture.md): Fim do score global, inclusao da HU11 no MVP e foco em organizacao investigativa.

---

## Ordem Recomendada de Leitura
1. [`ADR-006 (Arquitetura Evidence-First)`](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) — Paradigma fundamental do produto atual.
2. [`ADR-001 (Manifest V3)`](../tecnico/decisoes/ADR-001-manifest-v3.md) — Restricoes do ambiente de extensao Chromium.
3. [`ADR-002 (Backend Proxy)`](../tecnico/decisoes/ADR-002-backend-proxy.md) — Topologia e seguranca de fronteira.
4. [`ADR-005 (Datasets)`](../tecnico/decisoes/ADR-005-modelo-local-e-datasets-brasileiros.md) e [`ADR-003 (Cache)`](../tecnico/decisoes/ADR-003-estrategia-cache-local.md) — Pipeline e performance.
