# Matriz Go / No-Go Final — Avaliação para a Banca

> **Fase:** CBL Reflect & Share  
> **Estado de Avaliação:** SCAFFOLD (Avaliação Baseline Pré-Act)  
> **Veredito Atual:** **NO-GO** (Resultado esperado e metodologicamente correto antes da conclusão do Act e da Sprint 2)  
> **Repositórios Auditados:** `evidencia-grupo/documentation` (@`9e95b68`) e `evidencia-grupo/EvidencIA` (@`27c53e8`)

---

## 1. Regras de Veredito e Critérios de Bloqueio

A deliberação da equipe e a recomendação para a banca avaliadora seguem o algoritmo formal fail-closed:

```text
NO-GO          se QUALQUER critério BLOCKER (P0) falhar ou não puder ser verificado.
GO WITH DEBT   se todos os critérios BLOCKER (P0) passarem, restando apenas P1/P2 com dívida aceita (dono + prazo).
GO             se TODOS os critérios (BLOCKER, P1 e P2) tiverem evidência verificável e aprovada.

NO-GO IMEDIATO se ocorrer qualquer uma das condições fatais:
               1. Guiding Questions ausentes no repositório.
               2. Análise Exploratória de Dados (EDA) ausente.
               3. Estudo experimental Act sem voluntários humanos reais.
               4. Resultados sem summary.json ou com hash criptográfico divergente.
               5. Dado pessoal identificável (PII), CPF, e-mail ou segredo no Git.
```

---

## 2. Portões de Qualidade (Gates G1 a G8)

### Portão G1 — Metodologia Challenge Based Learning (CBL)
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **ENG-01** | Essential Question e 12 GQs completas | **BLOCKER** | `docs/visao/guiding-questions.md` com GQ01–GQ12 e 8 seções | Script / Auto | **PASS** | CBL Lead |
| **ENG-02** | Alinhamento da Essential Question registrado | **BLOCKER** | `docs/visao/essential-question-alignment.md` citando a EQ | Script / Auto | **PASS** | CBL Lead |
| **EDA-01** | Notebook exploratório de dados estruturado | **BLOCKER** | `notebooks/eda_datasets.ipynb` com seções 0 a 16 | Script / Auto | **PASS** | Data Lead |
| **EDA-02** | Notebook exploratório EXECUTADO | **BLOCKER** | Células com `execution_count` não-nulo e sem erros | Script / Auto | **FAIL** | Data Lead |
| **EDA-03** | Relatório de resultados e decisões da EDA | **BLOCKER** | `docs/investigate/eda-results.md` e `eda-decisions.md` | Script / Auto | **FAIL** | Data Lead |
| **ACT-01** | Protocolo e desenho experimental registrados | **BLOCKER** | `experiment-plan.md`, `participant-protocol.md`, `metrics-definition.md` | Script / Auto | **PASS** | Research Lead |
| **ACT-02** | Pré-registro travado com tag Git | **BLOCKER** | Tag `act-prereg-v1` existente e sem placeholders | Script / Git | **FAIL** | Tech Lead |
| **ACT-03** | Estudo Act executado com participantes reais | **BLOCKER** | `results.md` sem `{{` e com N ≥ 10 por condição | Script / Humano | **FAIL** | Research Lead |
| **REF-01** | Documentos de síntese e fechamento criados | **BLOCKER** | `reflection.md`, `showcase-script.md`, `demo-script.md` | Script / Auto | **PASS** | Tech Writer |
| **ACT-06** | Limitações observadas documentadas | **BLOCKER** | `limitations.md` e seção de limitações em `results.md` | Script / Auto | **WARN** | Tech Writer |

### Portão G2 — Engenharia de Dados e Machine Learning
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **DATA-01** | Registro formal de papéis de datasets | **BLOCKER** | `sources.yaml` válido com Fake.br linguístico e FactChecks.br factual | Script / Auto | **PASS** | Data Lead |
| **DATA-02** | Manifesto com hashes SHA-256 de 64 hex | **BLOCKER** | `manifest.json` com datasets validados | Script / Auto | **FAIL** | Data Lead |
| **DATA-03** | Governança de dados: dados brutos fora do Git | **BLOCKER** | `git ls-files backend/data` sem arquivos binários > 5 MB | Script / Git | **PASS** | Data Lead |
| **DATA-04** | Schemas canônicos de evidência via AST | **BLOCKER** | `schemas/evidence.py` define `EvidenceRecord` e `VerdictNormalized` | Script / AST | **PASS** | ML Engineer |
| **DATA-05** | Eliminação de fontes sintéticas primárias | **BLOCKER** | Pipeline não usa `sample_facts.json` como fonte primária | Script / Auto | **PASS** | ML Engineer |
| **EDA-04** | Métricas de Information Retrieval da EDA | **BLOCKER** | Recall@1/3/5, MRR e nDCG@5 registrados numericamente | Script / Regex | **FAIL** | Data Lead |

### Portão G3 — Arquitetura de Software e Resiliência
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **ADR-01** | Decisão formal de arquitetura Evidence-First | **BLOCKER** | ADR com Status Aceito, fim do score, HU11 e anti-mock | Script / Auto | **PASS** | Tech Lead |
| **ARC-01** | Protocolo abstrato de provedores de LLM | **BLOCKER** | `LLMProvider` define `extract_claims` e `generate_reflection` | Script / AST | **PASS** | Backend Lead |
| **ARC-02** | Guarda anti-mock em produção | **BLOCKER** | `factory.py` levanta `MockInProductionError` | Script / Testes | **PASS** | Backend Lead |
| **ARC-03** | Ausência de fallbacks silenciosos para mock | **BLOCKER** | `test_no_silent_mock_fallback.py` existe e NÃO é xfail | Script / Pytest | **FAIL** | Backend Lead |
| **ARC-04** | Remoção de score e gauges da extensão | **BLOCKER** | Sem score na resposta raiz e sem `*gauge*` na extensão | Script / Auto | **FAIL** | Frontend Lead |
| **ARC-05** | Contrato de API evidence-first compartilhado | **BLOCKER** | `api-schema.json` contém `claims`, `evidence`, `limitations` | Script / JSON | **PASS** | Tech Lead |
| **ARC-06** | Modo resiliente Evidence-Only | **BLOCKER** | `test_provider_failure.py` passando sob falha do LLM | Script / Pytest | **FAIL** | Backend Lead |
| **UX-01** | Componentes nucleares de Evidence UI | **BLOCKER** | Existem `EvidenceCard.tsx` e `ReflectionQuestions.tsx` | Script / Auto | **FAIL** | Frontend Lead |

### Portão G4 — Segurança e Privacidade (LGPD)
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **SEC-01** | Ausência de segredos commitados no repositório | **BLOCKER** | Varredura de chaves de API e tokens nos arquivos Git | Script / Regex | **PASS** | Security Lead |
| **SEC-02** | Gitignore protegendo arquivos sensíveis | **BLOCKER** | `.gitignore` cobre `.env*`, `data/{bronze,silver}/*`, telemetria | Script / Auto | **PASS** | Tech Lead |
| **SEC-03** | Workflows automatizados de CI e segurança | P1 | `ci.yml`, `security.yml` e `freeze-guard.yml` ativos | Script / Auto | **FAIL** | DevOps Lead |
| **SEC-04** | Testes de segurança contra injeção e abuso | P1 | Testes de rate limit, transcript limit e prompt injection | Script / Pytest | **FAIL** | Security Lead |
| **ACT-04** | Proteção de privacidade e ausência de PII | **BLOCKER** | Sem CPFs, e-mails ou telefones; pasta de dados não rastreada | Script / Regex | **PASS** | DPO / Security |
| **TEL-01** | Telemetria estritamente local sem tráfego de rede | **BLOCKER** | `extension/src/telemetry/` sem chamadas fetch/sendBeacon | Script / Auto | **PASS** | Frontend Lead |
| **TEL-02** | Especificação alinhada de eventos permitidos | P1 | Catálogo em `telemetry-spec.md` alinhado ao schema | Script / Auto | **PASS** | Tech Writer |

### Portão G5 — Performance e Usabilidade
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **PERF-01** | Latência de recuperação sob controle | P1 | `test_retrieval_latency.py` com medição registrada | Script / Auto | **FAIL** | QA Engineer |

### Portão G6 — Produto e Pensamento Crítico
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **TRC-01** | Rastreabilidade: HU11 no MVP e HUs 13–16 | **BLOCKER** | Matriz liga GQ → ADR → HU; HU11 é Must Have | Script / Auto | **PASS** | Product Owner |
| **TRC-02** | Consistência e integridade de identificadores | P1 | Todos os IDs citados existem nos catálogos | Script / Auto | **PASS** | Tech Writer |
| **TRC-03** | Integridade de hiperlinks relativos internos | P1 | Nenhum link quebrado na documentação MkDocs | Script / Auto | **PASS** | Tech Writer |

### Portão G7 — Governança e Processo Ágil (Scrum)
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **SCR-01** | Product Backlog e Definition of Done formais | **BLOCKER** | `product-backlog.md` e `definition-of-done.md` existem | Script / Auto | **PASS** | Scrum Master |
| **SCR-02** | Estrutura de sprints 01 e 02 padronizada | **BLOCKER** | 4 arquivos por sprint (goal, backlog, review, retro) | Script / Auto | **PASS** | Scrum Master |
| **SCR-03** | Cerimônias de Review e Retro preenchidas | **BLOCKER** | Reviews e retros com status final (sem pendências) | Script / Auto | **FAIL** | Scrum Master |
| **SCR-04** | Resposta às 6 perguntas obrigatórias de Review | **BLOCKER** | Respostas completas em cada `review.md` | Script / Auto | **FAIL** | Scrum Master |
| **SCR-05** | Cerimônias e ritos documentados | P2 | `ceremonies.md` existe e define a cadência da equipe | Script / Auto | **PASS** | Scrum Master |
| **GOV-01** | Vinculação estrita entre PRs e Issues | P2 | PRs fechados contêm marcador `Closes #N` | Script / GitHub | **SKIP** | Tech Lead |

### Portão G8 — Comunicação e Showcase
| ID | Critério | Classe | Evidência Esperada | Verificação | Status | Responsável |
|:---|:---|:---:|:---|:---:|:---:|:---|
| **REF-02** | Roteiro alinhado à ordem narrativa do CBL | **BLOCKER** | Segmentos na ordem Challenge → EQ → GQs → EDA → ADR → UI → Act | Script / Auto | **PASS** | CBL Lead |
| **REF-03** | Anti-fabricação: métricas ancoradas em evidência | **BLOCKER** | Toda afirmação quantitativa possui marcador `[EV:]` | Script / Auto | **PASS** | Technical Writer |

---

## 3. Síntese do Veredito Atual

```text
+-------------------------------------------------------------------------+
| VEREDITO DA BANCA: NO-GO (Baseline SCAFFOLD)                            |
| Condição Fatal Ativada: NÃO (estrutura íntegra)                        |
| Bloqueadores P0 Pendentes: 12 checks                                    |
| Dívidas P1/P2 Pendentes: 6 checks                                       |
+-------------------------------------------------------------------------+
```

O veredito **NO-GO** neste momento é a representação legítima e correta do estado do projeto. Ele reflete o fato de que a fase Act ainda não foi submetida a voluntários humanos e que a Sprint 2 de engenharia de interface está aberta. Qualquer declaração de prontidão antecipada violaria a ética do Challenge Based Learning.

---

## 4. Registro de Dívidas Técnicas Aceitas

| ID | Domínio | Descrição da Dívida | Risco Associado | Proprietário | Prazo de Liquidação |
|:---|:---|:---|:---|:---|:---|
| **DEBT-01** | Performance | Latência P90 do modelo local Ollama superior a 10s sob CPU | Impacto na experiência do usuário ao checar vídeos longos | Backend Lead | Sprint 3 (Onda 2) |
| **DEBT-02** | CI/CD | Workflows de segurança e congelamento de caminhos em teste | Quebra acidental de branches por regras excessivamente rígidas | DevOps Lead | Fechamento Sprint 2 |
| **DEBT-03** | Dataset | Ausência de validação automatizada de integridade do ClaimPT | Risco de uso inadvertido de sintaxe PT-EU em classificadores | Data Lead | Sprint 2 |

---

## 5. Bloco de Assinaturas e Decisão

| Função | Nome | Veredito Recomendado | Assinatura / Data |
|:---|:---|:---:|:---|
| **Tech Lead / QA Engineer** | `A PREENCHER` | **NO-GO** | `A PREENCHER`, 2026-10-02 |
| **CBL Closure Lead** | `A PREENCHER` | **NO-GO** | `A PREENCHER`, 2026-10-02 |
| **Product Owner** | `A PREENCHER` | **NO-GO** | `A PREENCHER`, 2026-10-02 |
