<!-- nav:start -->
[Voltar ao Índice Mestre](../index.md)
<!-- nav:end -->

# Arquitetura e Engenharia de Software

> **Propósito:** Especificar a arquitetura de software, contratos de interface, modelo de ameaças, estratégia de testes e diretrizes de desenvolvimento do ecossistema EvidencIA.

---

## Arquivos e Subdiretórios
- [`arquitetura.md`](arquitetura.md): Diagramas C4 (Contexto e Containers), fluxo de sequência e decisões estruturais.
- [`contrato-api.md`](contrato-api.md): Especificação formal dos endpoints REST, payloads JSON e tipos TypeScript.
- [`threat-model.md`](threat-model.md): Modelagem de ameaças STRIDE, proteção contra prompt injection e conformidade LGPD.
- [`estrategia-testes.md`](estrategia-testes.md): Pirâmide de testes automatizados, medição de RNFs e integração contínua.
- [`ia-e-datasets.md`](ia-e-datasets.md): Pipeline de dados de checagem, taxonomias e integração com Hugging Face.
- [`guia-contribuicao.md`](guia-contribuicao.md): Instruções de setup local, execução de linters e testes.
- [`decisoes/`](decisoes/README.md): Architecture Decision Records (ADR-001 a ADR-006).

---

## Ordem Recomendada de Leitura
1. [`arquitetura.md`](arquitetura.md) — Visão sistêmica e fronteiras de componentes.
2. [`contrato-api.md`](contrato-api.md) — Contrato de dados Evidence-First.
3. [`decisoes/README.md`](decisoes/README.md) — Registro formal de trade-offs arquiteturais.
4. [`threat-model.md`](threat-model.md) e [`estrategia-testes.md`](estrategia-testes.md) — Segurança e confiabilidade.
