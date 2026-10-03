# Log de Decisões — EvidencIA

## Nesta página

- [Sobre este Log](#sobre-este-log)
- [Tabela de Decisões](#tabela-de-decisoes)

---

## Sobre este Log {: #sobre-este-log }

Este documento registra as decisões estratégicas e de produto do projeto EvidencIA, complementando os ADRs técnicos com o contexto de origem (Guiding Question ou evento externo) e o status atual.

Para decisões técnicas detalhadas, consulte as [Decisões Arquiteturais](../tecnico/decisoes/ADR-001-manifest-v3.md) e o [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md).

---

## Tabela de Decisões {: #tabela-de-decisoes }

| ID | Data | Decisão | Motivo | Origem GQ | Status | Documento |
|:---|:---|:---|:---|:---|:---|:---|
| **D-001** | 2026-10-02 | Adotar arquitetura Evidence-First: remover score global, unidade = alegação + evidências, LLM como auxiliar, RAG como núcleo factual, HU11 no MVP, provider desacoplado | Auditoria CBL identificou 5 gaps; Essential Question exige investigação assistida, não veredito algorítmico | GQ01, GQ02, GQ03, GQ07, GQ08, GQ11, GQ12 | Aceito | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| **D-002** | 2026-10-02 | Estado `insufficient_evidence` como valor explícito no contrato, distinto de `false` | Ausência de evidência não implica falsidade (GQ05); conversão automática seria alucinação classificatória | GQ05 | Aceito | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| **D-003** | 2026-10-02 | Priorizar FactChecks.br como base de retrieval e Fake.br como corpus linguístico/EDA; ClaimPT como auxiliar metodológico (não é PT-BR) | Evidência em PT-BR requer corpus específico; bases genéricas não cobrem contexto brasileiro (GQ04) | GQ04 | Aceito | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| **D-004** | 2026-10-02 | EDA obrigatória na Sprint 1 antes de continuar evolução da extensão | Gap de EDA identificado na auditoria CBL; hipóteses H01–H03 precisam de validação empírica (GQ09) | GQ09 | Aceito | [docs/scrum/sprint-01/sprint-goal.md](../scrum/sprint-01/sprint-goal.md) |
| **D-005** | 2026-10-02 | HU11 (perguntas orientadoras de reflexão crítica) promovida de Could Have/Pós-MVP para Must Have do MVP | HU11 é o mecanismo que mais diretamente responde à Essential Question; deixá-la fora do MVP contradizia o objetivo central | GQ08, GQ11 | Aceito | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| **D-006** | 2026-10-02 | Mock de provider de IA é explícito, ativado apenas em dev/testes via configuração, proibido em produção | Mock silencioso gerava risco de demonstrações com dados fabricados sem sinalização | GQ07 | Aceito | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| **D-007** | 2026-10-02 | Criar governança Scrum formal com product-backlog, definition-of-done e templates de sprint (sprint-goal, sprint-backlog, review, retrospective) | Auditoria CBL identificou ausência de evidência de processo Scrum no Kanban anterior | — | Aceito | [Product Backlog](../scrum/product-backlog.md) |
| **D-008** | 2026-10-02 | Exceção controlada ao ADR-001/ADR-006: especificação de protótipo de controle experimental estático (Condição A) com gauge e score global, isolado fora do bundle da extensão em experiments/control-gauge-prototype/, sem dependência do backend e excluído do build de produção | Necessidade metodológica de comparação empírica A/B na fase CBL Act (testar se a UX evidence-first altera o comportamento investigativo vs baseline de veredito); impossibilidade de contaminar a extensão de produção com componentes depreciados | GQ02, GQ05, GQ08, GQ11 | Aceito | [docs/cbl/act/experiment-plan.md](../cbl/act/experiment-plan.md) |
| **D-009** | 2026-10-02 | Estruturar fechamento CBL (Reflect & Share) com auditoria automatizada fail-closed e relatórios de completude | Garantir integridade metodológica e acadêmica antes da banca avaliadora, impedindo afirmações sem evidência verificável | GQ01–GQ12 | Aceito | [Reflect & Share](../cbl/reflect-share/README.md) |

---

**Ver também:** [Guiding Questions](guiding-questions.md) · [Essential Question Alignment](essential-question-alignment.md) · [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) · [Plano Experimental Act](../cbl/act/experiment-plan.md) · [Reflect & Share](../cbl/reflect-share/README.md)
