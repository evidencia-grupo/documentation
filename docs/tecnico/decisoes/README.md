<!-- nav:start -->
[Voltar ao Indice Tecnico](../README.md) · [Voltar ao Indice Mestre](../../README.md)
<!-- nav:end -->

# Registros de Decisao Arquitetural (ADRs)

> **Proposito:** Documentar formalmente todas as decisoes de design de software que moldaram a extensao e o backend proxy do EvidencIA.

---

## Catalogo de Decisoes
- [`ADR-001-manifest-v3.md`](ADR-001-manifest-v3.md): Arquitetura Manifest V3 com Service Worker no navegador Chromium.
- [`ADR-002-backend-proxy.md`](ADR-002-backend-proxy.md): Backend Proxy Seguro em FastAPI para isolamento de credenciais e controle de taxa.
- [`ADR-003-estrategia-cache-local.md`](ADR-003-estrategia-cache-local.md): Cache client-side de analises com TTL de 24 horas via `chrome.storage.local`.
- [`ADR-004-stack-tecnologica.md`](ADR-004-stack-tecnologica.md): Definicao das tecnologias: Preact, Vite, TypeScript, Python 3.12, FastAPI e uv.
- [`ADR-005-modelo-local-e-datasets-brasileiros.md`](ADR-005-modelo-local-e-datasets-brasileiros.md): Inferencia via Ollama e incorporacao de corpora jornalisticos nacionais.
- [`ADR-006-evidence-first-architecture.md`](ADR-006-evidence-first-architecture.md): Adoção do paradigma Evidence-First, eliminacao de scores e inclusao da HU11 no MVP.

---

## Ordem Recomendada de Leitura
1. [`ADR-006`](ADR-006-evidence-first-architecture.md) -> 2. [`ADR-001`](ADR-001-manifest-v3.md) -> 3. [`ADR-002`](ADR-002-backend-proxy.md) -> 4. [`ADR-005`](ADR-005-modelo-local-e-datasets-brasileiros.md).
