# Definition of Done — EvidencIA (Release 1.0.0 — GO)

## Nesta página

- [DoD Geral (todas as entregas)](#dod-geral)
- [DoD Específica — Código](#dod-codigo)
- [DoD Específica — Notebook / EDA](#dod-notebook)
- [DoD Específica — Documentação](#dod-documentacao)
- [DoD Específica — Requisito / HU](#dod-requisito)

---

## DoD Geral (todas as entregas) {: #dod-geral }

Uma entrega está **Done** quando todos os itens abaixo estiverem verificados:

- [x] **Código commitado** na branch correta (`main`, `feat/`, `fix/`, `docs/`) com mensagem Conventional Commits.
- [x] **Testes passando** (unitários e de integração relevantes) no CI/CD sem falhas (151 backend, 171 frontend).
- [x] **Documentação atualizada** no mesmo commit ou PR da entrega (sem docs atrasados).
- [x] **Evidência reproduzível** — qualquer revisor pode executar e obter o mesmo resultado com as mesmas condições.
- [x] **Issue/tarefa vinculada** no sistema de acompanhamento (GitHub Issues ou equivalente).
- [x] **Revisão por outro integrante** da equipe (ao menos 1 aprovação de PR) antes do merge.

---

## DoD Específica — Código {: #dod-codigo }

Além da DoD Geral, código de produção satisfaz:

- [x] **Lint e typecheck limpos** — zero erros de `ruff`, `tsc` e linters no CI.
- [x] **Cobertura de testes ≥ 80%** para o módulo entregue (backend 91.2%, frontend 99.6%).
- [x] **Nenhum secret ou credencial** no código, logs ou artefatos (verificado por secret scan).
- [x] **Mock de IA desativado** — `LLM_PROVIDER=mock` estritamente bloqueado em builds de produção (`MockInProductionError`).
- [x] **Critérios de aceitação Gherkin** executáveis passando para todas as HUs correspondentes.
- [x] **Sem console.log / print de debug** não intencionais no código commitado.
- [x] **TBT ≤ 50 ms** e **memória adicional ≤ 80 MB** verificados na extensão.
- [x] **Auditoria de acessibilidade** com `axe-core` sem erros de nível AA (WCAG 2.1 AA compliant).

---

## DoD Específica — Notebook / EDA {: #dod-notebook }

Um notebook de EDA está **Done** quando:

- [x] **Executa do zero** (Kernel → Restart & Run All) sem erros em ambiente limpo.
- [x] **Seeds fixas** declaradas e documentadas para reprodutibilidade estrita.
- [x] **Sem dados brutos commitados** — dados originais obtidos via script de download ou referência a artefato externo.
- [x] **Métricas calculadas** (Recall@k, MRR, nDCG) documentadas na célula de resultados.
- [x] **Interpretação qualitativa** dos top-k resultados documentada no notebook.
- [x] **Conclusão** com resposta explícita às Guiding Questions abordadas.
- [x] **Versionamento** — notebook commitado em pasta documentada com saídas limpas.

---

## DoD Específica — Documentação {: #dod-documentacao }

Uma entrega de documentação está **Done** quando:

- [x] **Links relativos válidos** — verificação automatizada com `check_drift.py` (0 links quebrados).
- [x] **IDs de rastreabilidade atualizados** — HU, RF, RNF, GQ e ADR citados existem nos documentos de origem.
- [x] **Histórico de revisão** atualizado em toda HU ou requisito alterado.
- [x] **Sem `A preencher` bloqueante** — todas as seções e portões preenchidos e homologados.
- [x] **Linguagem consistente** — sem termos legados em contexto atual, em conformidade com ADR-006.

---

## DoD Específica — Requisito / HU {: #dod-requisito }

Uma História de Usuário ou Requisito Funcional está **Done** quando:

- [x] **Critérios de Aceitação em Gherkin** definidos com cenários verificáveis (Dado/Quando/Então).
- [x] **Rastreabilidade bidirecional** mapeando Guiding Questions (GQ), ADR correspondente e personas relacionadas.
- [x] **Histórico de revisão** preenchido registrando data, motivo da modificação e referência ao ADR.
- [x] **Catálogo de Requisitos e Matriz de Rastreabilidade** sincronizados com os IDs, prioridades MoSCoW e status correspondentes.

---

**Ver também:** [Product Backlog](backlog-produto.md) · [Estratégia de Testes](../arquitetura/estrategia-testes.md) · [Contrato de API](../arquitetura/contrato-api.md)
