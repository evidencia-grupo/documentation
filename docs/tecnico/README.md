<!-- nav:start -->
[Voltar ao Indice Mestre](../README.md)
<!-- nav:end -->

# Arquitetura e Engenharia de Software

> **Proposito:** Especificar a arquitetura de software, contratos de interface, modelo de ameacas, estrategia de testes e diretrizes de desenvolvimento do ecossistema EvidencIA.

---

## Arquivos e Subdiretorios
- [`arquitetura.md`](arquitetura.md): Diagramas C4 (Contexto e Containers), fluxo de sequencia e decisoes estruturais.
- [`contrato-api.md`](contrato-api.md): Especificacao formal dos endpoints REST, payloads JSON e tipos TypeScript.
- [`threat-model.md`](threat-model.md): Modelagem de ameacas STRIDE, protecao contra prompt injection e conformidade LGPD.
- [`estrategia-testes.md`](estrategia-testes.md): Piramide de testes automatizados, medicao de RNFs e integracao continua.
- [`ia-e-datasets.md`](ia-e-datasets.md): Pipeline de dados de checagem, taxonomias e integracao com Hugging Face.
- [`guia-contribuicao.md`](guia-contribuicao.md): Instrucoes de setup local, execucao de linters e testes.
- [`decisoes/`](decisoes/README.md): Architecture Decision Records (ADR-001 a ADR-006).
- [`evidencias/`](evidencias/README.md): Relatorios de evidencias de execucao e medicao de RNFs.

---

## Ordem Recomendada de Leitura
1. [`arquitetura.md`](arquitetura.md) — Visao sistemica e fronteiras de componentes.
2. [`contrato-api.md`](contrato-api.md) — Contrato de dados Evidence-First.
3. [`decisoes/README.md`](decisoes/README.md) — Registro formal de trade-offs arquiteturais.
4. [`threat-model.md`](threat-model.md) e [`estrategia-testes.md`](estrategia-testes.md) — Seguranca e confiabilidade.
