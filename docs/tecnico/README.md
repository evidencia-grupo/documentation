<!-- nav:start -->
[Voltar ao Índice Mestre](../index.md)
<!-- nav:end -->

# Arquitetura e Engenharia de Software

> **Propósito:** Especificar a arquitetura de software, contratos de interface, modelo de ameacas, estratégia de testes e diretrizes de desenvolvimento do ecossistema EvidencIA.

---

## Arquivos e Subdiretorios
- [`arquitetura.md`](arquitetura.md): Diagramas C4 (Contexto e Containers), fluxo de sequencia e decisões estruturais.
- [`contrato-api.md`](contrato-api.md): Especificação formal dos endpoints REST, payloads JSON e tipos TypeScript.
- [`threat-model.md`](threat-model.md): Modelagem de ameacas STRIDE, protecao contra prompt injection e conformidade LGPD.
- [`estrategia-testes.md`](estrategia-testes.md): Piramide de testes automatizados, medicao de RNFs e integração continua.
- [`ia-e-datasets.md`](ia-e-datasets.md): Pipeline de dados de checagem, taxonomias e integração com Hugging Face.
- [`guia-contribuicao.md`](guia-contribuicao.md): Instrucoes de setup local, execução de linters e testes.
- [`decisoes/`](decisoes/README.md): Architecture Decision Records (ADR-001 a ADR-006).
- [`evidencias/`](evidencias/README.md): Relatorios de evidências de execução e medicao de RNFs.

---

## Ordem Recomendada de Leitura
1. [`arquitetura.md`](arquitetura.md) — Visão sistemica e fronteiras de componentes.
2. [`contrato-api.md`](contrato-api.md) — Contrato de dados Evidence-First.
3. [`decisoes/README.md`](decisoes/README.md) — Registro formal de trade-offs arquiteturais.
4. [`threat-model.md`](threat-model.md) e [`estrategia-testes.md`](estrategia-testes.md) — Seguranca e confiabilidade.
