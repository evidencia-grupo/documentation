# Cerimônias Scrum — EvidencIA

## Estrutura das Cerimônias

| Cerimônia | Duração | Cadência | Participantes | Objetivo |
|:---|:---|:---|:---|:---|
| **Sprint Planning** | 45 min | Início de cada sprint | Toda a equipe + Product Owner | Definir Sprint Goal e selecionar itens do Product Backlog para o Sprint Backlog |
| **Daily Scrum** | 15 min | Diário (dias úteis) | Equipe de desenvolvimento | Sincronizar progresso, identificar impedimentos, ajustar plano do dia |
| **Sprint Review** | 30 min | Final de cada sprint | Toda a equipe + stakeholders | Demonstrar incremento, coletar feedback, atualizar Product Backlog |
| **Sprint Retrospective** | 30 min | Final de cada sprint (após Review) | Toda a equipe | Inspecionar processo, identificar melhorias, definir ações com dono e prazo |
| **Refinamento** | 30 min | 1x por sprint (opcional) | Equipe de desenvolvimento + PO | Detalhar e estimar itens candidatos ao próximo sprint |

---

## Protocolos de Cada Cerimônia

### Sprint Planning

**Entradas:** Product Backlog priorizado, velocity de referência (A preencher), capacidade da equipe no sprint.

**Saídas:**
- Sprint Goal documentado em `sprint-XX/sprint-goal.md`
- Sprint Backlog documentado em `sprint-XX/sprint-backlog.md`
- Distribuição de itens por responsável

**Perguntas obrigatórias:**
1. O Sprint Goal responde a alguma Guiding Question em aberto?
2. Todos os itens têm critérios de aceitação verificáveis?
3. Há impedimentos já conhecidos?

---

### Daily Scrum

**Formato sugerido (3 perguntas):**
1. O que fiz desde o último Daily que contribui para o Sprint Goal?
2. O que farei até o próximo Daily?
3. Existe algum impedimento?

**Impedimentos** são registrados no campo correspondente do `sprint-backlog.md` da sprint atual.

---

### Sprint Review

**Entradas:** Incremento desenvolvido, Sprint Backlog, critérios de aceitação, evidências (commits, screenshots, métricas).

**Saídas:** Template preenchido em `sprint-XX/review.md`.

**6 perguntas obrigatórias:**
1. O que prometemos (Sprint Goal e itens)?
2. O que entregamos?
3. O que conseguimos demonstrar?
4. O que não conseguimos demonstrar?
5. Que evidência comprova a entrega?
6. Que decisão mudou por causa da investigação desta sprint?

---

### Sprint Retrospective

**Formato sugerido (Start/Stop/Continue ou 4Ls):**
- O que funcionou bem?
- O que não funcionou?
- Ações de melhoria (com dono e prazo definidos)
- Follow-up das ações da retro anterior

**Saídas:** Template preenchido em `sprint-XX/retrospective.md`.

---

### Refinamento (opcional)

**Objetivo:** Garantir que os 2–3 próximos sprints tenham itens suficientemente detalhados para o Planning.

**Critérios de um item "refinado":**
- Descrição clara (formato Como/Quero/Para ou equivalente)
- Critérios de aceitação em Gherkin (mínimo 3 cenários)
- Estimativa de Story Points consensuada
- Rastreabilidade com GQ, HU, RF/RNF registrada

---

**Ver também:** [Definition of Done](definition-of-done.md) · [Product Backlog](product-backlog.md) · [Sprint 01 → Goal](sprint-01/sprint-goal.md)
