# Definition of Done — EvidencIA

## Nesta página

- [DoD Geral (todas as entregas)](#dod-geral)
- [DoD Específica — Código](#dod-codigo)
- [DoD Específica — Notebook / EDA](#dod-notebook)
- [DoD Específica — Documentação](#dod-documentacao)
- [DoD Específica — Requisito / HU](#dod-requisito)

---

## DoD Geral (todas as entregas) {: #dod-geral }

Uma entrega está **Done** quando todos os itens abaixo estiverem verificados:

- [ ] **Código commitado** na branch correta (`feat/`, `fix/`, `docs/`) com mensagem Conventional Commits.
- [ ] **Testes passando** (unitários e de integração relevantes) no CI/CD sem falhas.
- [ ] **Documentação atualizada** no mesmo commit ou PR da entrega (sem docs atrasados).
- [ ] **Evidência reproduzível** — qualquer revisor pode executar e obter o mesmo resultado com as mesmas condições.
- [ ] **Issue/tarefa vinculada** no sistema de acompanhamento (GitHub Issues ou equivalente).
- [ ] **Revisão por outro integrante** da equipe (ao menos 1 aprovação de PR) antes do merge.

---

## DoD Específica — Código {: #dod-codigo }

Além da DoD Geral, código de produção deve satisfazer:

- [ ] **Lint e typecheck limpos** — zero erros de `eslint` / `mypy` / `pyright` / `flutter analyze` no CI.
- [ ] **Cobertura de testes ≥ 80%** para o módulo entregue, verificada via relatório de cobertura no CI.
- [ ] **Nenhum secret ou credencial** no código, logs ou artefatos (verificado por secret scan).
- [ ] **Mock de IA desativado** — `LLM_PROVIDER` não pode ser `mock` em builds de staging/produção.
- [ ] **Critérios de aceitação Gherkin** executáveis passando para a HU correspondente.
- [ ] **Sem console.log / print de debug** não intencionais no código commitado.
- [ ] **TBT ≤ 50 ms** e **memória adicional ≤ 80 MB** verificados se houver alteração de UI.
- [ ] **Auditoria de acessibilidade** com `axe-core` sem erros de nível AA (para alterações de UI).

---

## DoD Específica — Notebook / EDA {: #dod-notebook }

Um notebook de EDA está **Done** quando:

- [ ] **Executa do zero** (Kernel → Restart & Run All) sem erros em ambiente limpo.
- [ ] **Seeds fixas** declaradas e documentadas para todo código com aleatoriedade (`random.seed()`, `np.random.seed()`, `torch.manual_seed()`).
- [ ] **Sem dados brutos commitados** — dados originais são obtidos via script de download ou referência a artefato externo; apenas amostras mínimas ilustrativas (≤ 100 linhas) são permitidas.
- [ ] **Métricas calculadas** (Recall@k, MRR, nDCG ou outras definidas no sprint goal) documentadas na célula de resultados.
- [ ] **Interpretação qualitativa** dos top-k resultados documentada no notebook.
- [ ] **Conclusão** com resposta explícita à(s) Guiding Question(s) que o notebook aborda.
- [ ] **Versionamento** — notebook commitado em pasta documentada (`docs/tecnico/eda/` ou `backend/ml/notebooks/`); nenhum notebook com saídas de execução em células (células limpas antes do commit).

---

## DoD Específica — Documentação {: #dod-documentacao }

Uma entrega de documentação está **Done** quando:

- [ ] **Links relativos válidos** — verificação manual ou automatizada (sem 404 internos).
- [ ] **IDs de rastreabilidade atualizados** — HU, RF, RNF, GQ e ADR citados existem nos documentos de origem.
- [ ] **Histórico de revisão** atualizado em toda HU ou requisito alterado (data, motivo, referência ao ADR).
- [ ] **Sem `A preencher` bloqueante** — itens `A preencher` só são aceitáveis em campos que genuinamente dependem de informações futuras (ex.: datas de cerimônias ainda não agendadas).
- [ ] **Linguagem consistente** — sem termos do modelo anterior (`score`, `veracidade`, `gauge`) em contexto não-histórico.

---

## DoD Específica — Requisito / HU {: #dod-requisito }

Uma História de Usuário ou Requisito Funcional está **Done** quando:

- [ ] **Critérios de Aceitação em Gherkin** definidos com no mínimo 3 cenários verificáveis (Dado/Quando/Então).
- [ ] **Rastreabilidade bidirecional** mapeando Guiding Questions (GQ), ADR correspondente e personas relacionadas.
- [ ] **Histórico de revisão** preenchido registrando data, motivo da modificação e referência ao ADR.
- [ ] **Catálogo de Requisitos e Matriz de Rastreabilidade** sincronizados com os IDs, prioridades MoSCoW e status correspondentes.

---

**Ver também:** [Product Backlog](product-backlog.md) · [Ceremonies](ceremonies.md) · [Sprint 01](sprint-01/sprint-goal.md)
