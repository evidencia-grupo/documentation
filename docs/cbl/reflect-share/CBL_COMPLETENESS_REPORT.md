<!-- CBL_COMPLETENESS_REPORT -->
# Relatório de Auditoria de Completude do Projeto — EvidencIA

> **Data da Auditoria:** 2026-10-03  
> **Fase Auditada:** `SCAFFOLD`  
> **Versão Documentação:** `@`7a5ef5d  
> **Versão Código:** `@`60ae479  
> **Veredito Geral:** **`NO-GO`**  
> **Flag de Bloqueio Imediato:** `ATIVADA` (condição fatal de integridade violada)  

---

## 1. Resumo Quantitativo por Domínio

| Domínio | PASS | FAIL | WARN | SKIP | Total |
|:---|:---:|:---:|:---:|:---:|:---:|
| **ACT** | 2 | 5 | 1 | 0 | 8 |
| **ARC** | 2 | 4 | 0 | 0 | 6 |
| **CBL** | 7 | 4 | 0 | 0 | 11 |
| **DATA** | 4 | 1 | 0 | 0 | 5 |
| **GOV** | 0 | 0 | 0 | 1 | 1 |
| **PERF** | 0 | 1 | 0 | 0 | 1 |
| **SCR** | 3 | 2 | 0 | 0 | 5 |
| **SEC** | 2 | 2 | 0 | 0 | 4 |
| **TEL** | 1 | 1 | 0 | 0 | 2 |
| **TRC** | 3 | 0 | 0 | 0 | 3 |
| **UX** | 0 | 1 | 0 | 0 | 1 |
| **TOTAL GERAL** | **24** | **21** | **1** | **1** | **47** |

---

## 2. Tabela Detalhada de Checks

| Domínio | ID | Evidência Esperada | Encontrada | Status | Classe | Detalhe |
|:---|:---|:---|:---|:---:|:---:|:---|
| ACT | **ACT-01** | experiment-plan.md, participant-protocol.md e metrics-definition.md existentes em docs/cbl/act/ | experiment-plan.md, participant-protocol.md, metrics-definition.md presentes | PASS | P0 | Instrumentos nucleares do Act validados |
| ACT | **ACT-02** | Pré-registro travado: tag git act-prereg-v1 existe e metrics-definition.md não contém PROPOSTO nem A DEFINIR | Tag git 'act-prereg-v1' ausente | **FAIL** | P0 | Pré-registro não travado formalmente |
| ACT | **ACT-03** | results.md existe, sem {{ ou PREENCHER, com N >= --min-participants por condição | docs/cbl/act/results.md ausente | **FAIL** | P0 | Resultados do estudo Act com participantes reais ainda não produzidos |
| ACT | **ACT-04** | Nenhum e-mail, CPF ou telefone em arquivos rastreados; analysis/act/data/ não rastreado | 5 potenciais dados pessoais (PII) encontrados | **FAIL** | P0 | code:extension/src/background/response-validation.test.ts:7 (Email detectado: pas***); code:extension/src/telemetry/__tests__/sanitize.test.ts:148 (CPF detectado) |
| ACT | **ACT-05** | participant-protocol.md contém TCLE e procedimento de pseudonimização | TCLE e pseudonimização presentes | PASS | P1 | participant-protocol.md validado |
| ACT | **ACT-06** | limitations.md existe e seção 'Limitações observadas' não está vazia em results.md | limitations.md presente; results.md ainda não criado (SCAFFOLD) | **WARN** | P0 | Limitações observadas pendentes de coleta |
| ACT | **ACT-07** | Integridade: summary_sha256 em results.md é igual ao SHA-256 real de analysis/act/out/summary.json | results.md ausente | **FAIL** | P0 | Não é possível validar integridade sem results.md |
| ACT | **ACT-08** | Decisão GO/INVESTIGAR/NO-GO em results.md é compatível com a regra pré-registrada aplicada aos números de summary.json | results.md ou summary.json ausente | **FAIL** | P0 | Impossível validar decisão |
| CBL | **ADR-01** | ADR com Status Aceito/Accepted mencionando fim do score, HU11 no MVP, Evidence-Only e proibição de mock em produção | Encontrado em docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md | PASS | P0 | Status Aceito; cobre fim do score, HU11, Evidence-Only e proibição de mock |
| ARC | **ARC-01** | via AST: providers/base.py define LLMProvider com extract_claims e generate_reflection | LLMProvider define extract_claims e generate_reflection | PASS | P0 | AST validada em backend/app/services/providers/base.py |
| ARC | **ARC-02** | factory.py levanta MockInProductionError e test_no_mock_in_production.py existe | MockInProductionError levantado e test_no_mock_in_production.py presente | PASS | P0 | Guarda anti-mock implementada |
| ARC | **ARC-03** | test_no_silent_mock_fallback.py existe e NÃO está mais marcado xfail | test_no_silent_mock_fallback.py ainda está marcado com @pytest.mark.xfail | **FAIL** | P0 | Dívida técnica de fallbacks silenciosos ainda ativa |
| ARC | **ARC-04** | Score removido: AnalyzeResponse sem score; schemas sem reliabilityScore; sem *gauge* em extension/src; sem 'veracidade' | 7 resíduos de score/gauge detectados | **FAIL** | P0 | AnalyzeResponse contém campo 'score'; shared/schemas/api-schema.json contém 'reliabilityScore'; shared/types/api.ts contém 'reliabilityScore' |
| ARC | **ARC-05** | shared/schemas/api-schema.json contém claims, reflectionQuestions, limitations, analysisMode | Campos evidence-first ausentes no schema: ['reflectionQuestions', 'limitations'] | **FAIL** | P0 | Verificado em shared/schemas/api-schema.json |
| ARC | **ARC-06** | test_provider_failure.py existe (e passa se --run-tests) — modo Evidence-Only | test_provider_failure.py ausente | **FAIL** | P0 | Teste de modo Evidence-Only não encontrado |
| DATA | **DATA-01** | sources.yaml válido: Fake.br=linguistic_corpus, FactChecks.br=fact_check_evidence, ClaimPT=methodological_auxiliary com nota PT-EU/PT-PT | sources.yaml válido com papéis e notas canônicas | PASS | P0 | Encontrado em backend/ml/datasets/sources.yaml |
| DATA | **DATA-02** | manifest.json válido com hashes sha256 de 64 hexadecimais para cada dataset | manifest.json sem datasets mapeados | **FAIL** | P0 | Campo 'datasets' vazio ou inválido |
| DATA | **DATA-03** | backend/data só rastreia .gitkeep, README.md, manifest.json; nenhum arquivo rastreado > 5 MB | backend/data limpo; nenhum arquivo binário rastreado | PASS | P0 | 5 arquivos permitidos |
| DATA | **DATA-04** | via AST: schemas/evidence.py define EvidenceRecord, NewsRecord, VerdictNormalized | EvidenceRecord, NewsRecord, VerdictNormalized definidos | PASS | P0 | AST validada em backend/ml/schemas/evidence.py |
| DATA | **DATA-05** | sample_facts.json deixou de ser fonte primária; padrão aponta para sources.yaml | Pipeline não usa sample_facts.json como primária | PASS | P0 | sources.yaml é a referência primária |
| CBL | **EDA-01** | notebooks/eda_datasets.ipynb existe, JSON válido e contém 17 seções (0–16) | 17 seções (0–16) encontradas | PASS | P0 | Notebook estruturado com sucesso |
| CBL | **EDA-02** | notebook EXECUTADO: células de código com execution_count não nulo, sem erro e sem NotImplementedError | 17 células não executadas (execution_count: null) | **FAIL** | P0 | Total de células de código: 17 |
| CBL | **EDA-03** | docs/investigate/eda-results.md e eda-decisions.md (formato Achado→Evidência→Impacto→Decisão >= 1 linha); dataset-card.md | Arquivos ausentes: ['docs/investigate/eda-results.md', 'docs/investigate/eda-decisions.md'] | **FAIL** | P0 | Relatórios de EDA não encontrados |
| CBL | **EDA-04** | eda-results.md traz valores numéricos para Recall@1, Recall@3, Recall@5, MRR e nDCG@5 | docs/investigate/eda-results.md ausente | **FAIL** | P0 | Relatório de métricas IR não encontrado |
| CBL | **ENG-01** | docs/visao/guiding-questions.md com exatamente GQ01–GQ12 e 8 seções obrigatórias | 12 GQs e 8 seções presentes | PASS | P0 | docs/visao/guiding-questions.md íntegro |
| CBL | **ENG-02** | essential-question-alignment.md existente citando a Essential Question | Encontrado em docs/visao/essential-question-alignment.md | PASS | P0 | Cita Essential Question explicitamente |
| CBL | **ENG-03** | decision-log.md referencia ADR-001 | Referência a ADR-001 presente | PASS | P1 | decision-log.md referencia ADR-001 |
| GOV | **GOV-01** | PRs mesclados contêm 'Closes #N' vinculando código a issues | Verificação do GitHub desativada (use flag --check-github) | SKIP | P2 | Auditoria de PRs pulada em modo offline |
| PERF | **PERF-01** | test_retrieval_latency.py existe e medição de P90 registrada na Sprint 2 | test_retrieval_latency.py ausente | **FAIL** | P1 | Teste de latência de recuperação não encontrado |
| CBL | **REF-01** | reflection.md, showcase-script.md, demo-script.md existentes; lessons-learned.md e research-portfolio.md (P1) | Todos os 5 artefatos de Reflect & Share presentes | PASS | P0 | reflection, showcase, demo, lessons, portfolio |
| CBL | **REF-02** | showcase-script.md contém segmentos na ordem Challenge → EQ → GQs → EDA → ADR → Evidence UI → Act | Ordem incorreta no segmento: Evidence\s+UI/UI | **FAIL** | P0 | Ordem esperada: Challenge → EQ → GQs → EDA → ADR → Evidence UI → Act |
| CBL | **REF-03** | Anti-fabricação: todo parágrafo com número, %, Recall, MRR ou p90 tem marcador [EV: apontando caminho existente; sem PENDENTE em FINALIZE | Todas as métricas possuem marcador [EV:] válido | PASS | P0 | Nenhuma fabricação detectada |
| SCR | **SCR-01** | product-backlog.md e definition-of-done.md existentes em docs/scrum/ | product-backlog.md e definition-of-done.md presentes | PASS | P0 | Artefatos Scrum validados |
| SCR | **SCR-02** | sprint-01/ e sprint-02/ contendo os 4 arquivos cada (goal, backlog, review, retro) | Sprints 01 e 02 possuem todos os 4 arquivos | PASS | P0 | Estrutura ágil completa |
| SCR | **SCR-03** | Reviews e retrospectivas de ambas as sprints preenchidas (sem 'A preencher' ou 'Pendente') | Cerimônias não encerradas: ['docs/scrum/sprint-01/review.md (contém pendências)', 'docs/scrum/sprint-01/retrospective.md (contém pendências)', 'docs/scrum/sprint-02/review.md (contém pendências)', 'docs/scrum/sprint-02/retrospective.md (contém pendências)'] | **FAIL** | P0 | Reviews e retrospectivas devem estar formalmente concluídas |
| SCR | **SCR-04** | Cada review.md responde às 6 perguntas obrigatórias do processo | Perguntas obrigatórias não respondidas: ['docs/scrum/sprint-02/review.md (respostas não preenchidas)'] | **FAIL** | P0 | Exigidas 6 perguntas estruturadas de review |
| SCR | **SCR-05** | ceremonies.md existente definindo a cadência Scrum | docs/scrum/ceremonies.md presente | PASS | P2 | Ritos Scrum documentados |
| SEC | **SEC-01** | Nenhum .env rastreado; varredura negativa para chaves (AIza..., sk-..., ghp_...); valores mascarados | Varredura limpa; nenhum segredo ou .env detectado | PASS | P0 | 154 arquivos auditados |
| SEC | **SEC-02** | .gitignore cobre .env*, backend/data/{bronze,silver,gold}/* e analysis/act/data/ | .gitignore cobre .env*, backend/data/ e telemetria | PASS | P0 | .gitignore validado |
| SEC | **SEC-03** | Workflows ci.yml, security.yml e freeze-guard.yml existentes em .github/workflows/ | Workflows ausentes em .github/workflows: ['security.yml'] | **FAIL** | P1 | Esteira de CI incompleta |
| SEC | **SEC-04** | Testes de rate limit, limite de transcript e prompt injection existentes | Testes de segurança ausentes: ['rate limit', 'limite de transcript'] | **FAIL** | P1 | Testes de abuso e injeção incompletos |
| TEL | **TEL-01** | extension/src/telemetry/ com schema JSON, sanitize.ts, testes; nenhum fetch/XMLHttpRequest/sendBeacon/WebSocket | Chamadas de rede proibidas detectadas: ['no-network.test.ts:7 (fetch()', 'no-network.test.ts:8 (XMLHttpRequest)', 'no-network.test.ts:9 (sendBeacon)'] | **FAIL** | P0 | Telemetria deve ser estritamente local sem emissão de tráfego de rede |
| TEL | **TEL-02** | docs/cbl/act/telemetry-spec.md existe e o catálogo de eventos coincide com EVENT_ALLOWLIST | 4 tipos de eventos documentados | PASS | P1 | telemetry-spec.md validado |
| TRC | **TRC-01** | HU11 não consta como Pós-MVP; HU13–HU16 existem; matriz liga GQ → ADR → HU | HU11 no MVP, HU13–HU16 presentes e matriz GQ → ADR → HU validada | PASS | P0 | Rastreabilidade íntegra |
| TRC | **TRC-02** | Todo ID citado (GQ, HU, ADR, RF, RNF) existe nos catálogos | Todos os 12 IDs de GQ referenciados na matriz | PASS | P1 | Consistência de IDs verificada |
| TRC | **TRC-03** | Hiperlinks relativos internos válidos na documentação | 1005 hiperlinks relativos auditados; nenhum link quebrado | PASS | P1 | Navegação íntegra |
| UX | **UX-01** | EvidenceCard.tsx e ReflectionQuestions.tsx presentes em extension/src | Componentes ausentes em extension/src/panel/components: ['EvidenceCard.tsx', 'ReflectionQuestions.tsx'] | **FAIL** | P0 | HU11 promovida ao MVP exige EvidenceCard e ReflectionQuestions |

---

## 3. Bloqueadores (P0 não-PASS)

Foram identificados **18** bloqueadores críticos P0:

- **[ACT-02]** (`FAIL`): Tag git 'act-prereg-v1' ausente
  - *Critério:* Verifica imutabilidade metodológica do pré-registro
  - *Detalhe:* Pré-registro não travado formalmente
- **[ACT-03]** (`FAIL`): docs/cbl/act/results.md ausente
  - *Critério:* Verifica relatório de resultados com participantes humanos reais
  - *Detalhe:* Resultados do estudo Act com participantes reais ainda não produzidos
- **[ACT-04]** (`FAIL`): 5 potenciais dados pessoais (PII) encontrados
  - *Critério:* Verifica conformidade estrita com a LGPD e ausência de PII
  - *Detalhe:* code:extension/src/background/response-validation.test.ts:7 (Email detectado: pas***); code:extension/src/telemetry/__tests__/sanitize.test.ts:148 (CPF detectado)
- **[ACT-07]** (`FAIL`): results.md ausente
  - *Critério:* Garante autenticidade criptográfica e anti-adulteração de métricas
  - *Detalhe:* Não é possível validar integridade sem results.md
- **[ACT-08]** (`FAIL`): results.md ou summary.json ausente
  - *Critério:* Verifica fidelidade estrita à regra de decisão pré-registrada
  - *Detalhe:* Impossível validar decisão
- **[ARC-03]** (`FAIL`): test_no_silent_mock_fallback.py ainda está marcado com @pytest.mark.xfail
  - *Critério:* Garante eliminação de fallbacks silenciosos em produção
  - *Detalhe:* Dívida técnica de fallbacks silenciosos ainda ativa
- **[ARC-04]** (`FAIL`): 7 resíduos de score/gauge detectados
  - *Critério:* Verifica expurgo completo de autoridade algorítmica e scores globais
  - *Detalhe:* AnalyzeResponse contém campo 'score'; shared/schemas/api-schema.json contém 'reliabilityScore'; shared/types/api.ts contém 'reliabilityScore'
- **[ARC-05]** (`FAIL`): Campos evidence-first ausentes no schema: ['reflectionQuestions', 'limitations']
  - *Critério:* Verifica contrato evidence-first compartilhado entre backend e frontend
  - *Detalhe:* Verificado em shared/schemas/api-schema.json
- **[ARC-06]** (`FAIL`): test_provider_failure.py ausente
  - *Critério:* Verifica resiliência e suporte ao modo Evidence-Only sob falha externa
  - *Detalhe:* Teste de modo Evidence-Only não encontrado
- **[DATA-02]** (`FAIL`): manifest.json sem datasets mapeados
  - *Critério:* Verifica integridade criptográfica dos dados curados
  - *Detalhe:* Campo 'datasets' vazio ou inválido
- **[EDA-02]** (`FAIL`): 17 células não executadas (execution_count: null)
  - *Critério:* Verifica execução real completa e congelamento de saídas da EDA
  - *Detalhe:* Total de células de código: 17
- **[EDA-03]** (`FAIL`): Arquivos ausentes: ['docs/investigate/eda-results.md', 'docs/investigate/eda-decisions.md']
  - *Critério:* Verifica documentação e decisões derivadas da análise exploratória
  - *Detalhe:* Relatórios de EDA não encontrados
- **[EDA-04]** (`FAIL`): docs/investigate/eda-results.md ausente
  - *Critério:* Verifica métricas objetivas de Information Retrieval da investigação
  - *Detalhe:* Relatório de métricas IR não encontrado
- **[REF-02]** (`FAIL`): Ordem incorreta no segmento: Evidence\s+UI|UI
  - *Critério:* Verifica ordem narrativa e cadeia pedagógica estrita do showcase
  - *Detalhe:* Ordem esperada: Challenge → EQ → GQs → EDA → ADR → Evidence UI → Act
- **[SCR-03]** (`FAIL`): Cerimônias não encerradas: ['docs/scrum/sprint-01/review.md (contém pendências)', 'docs/scrum/sprint-01/retrospective.md (contém pendências)', 'docs/scrum/sprint-02/review.md (contém pendências)', 'docs/scrum/sprint-02/retrospective.md (contém pendências)']
  - *Critério:* Garante fechamento cerimonial e encerramento documental das sprints
  - *Detalhe:* Reviews e retrospectivas devem estar formalmente concluídas
- **[SCR-04]** (`FAIL`): Perguntas obrigatórias não respondidas: ['docs/scrum/sprint-02/review.md (respostas não preenchidas)']
  - *Critério:* Verifica prestação de contas estruturada nas revisões de sprint
  - *Detalhe:* Exigidas 6 perguntas estruturadas de review
- **[TEL-01]** (`FAIL`): Chamadas de rede proibidas detectadas: ['no-network.test.ts:7 (fetch()', 'no-network.test.ts:8 (XMLHttpRequest)', 'no-network.test.ts:9 (sendBeacon)']
  - *Critério:* Garante telemetria estritamente local e sem transmissão remota
  - *Detalhe:* Telemetria deve ser estritamente local sem emissão de tráfego de rede
- **[UX-01]** (`FAIL`): Componentes ausentes em extension/src/panel/components: ['EvidenceCard.tsx', 'ReflectionQuestions.tsx']
  - *Critério:* Verifica presença física dos componentes centrais de Evidence UI
  - *Detalhe:* HU11 promovida ao MVP exige EvidenceCard e ReflectionQuestions

---

## 4. Dívidas Técnicas e Alertas (P1/P2)

Foram registradas **3** dívidas técnicas/alertas:

- **[PERF-01]** (P1 - `FAIL`): test_retrieval_latency.py ausente
  - *Detalhe:* Teste de latência de recuperação não encontrado
- **[SEC-03]** (P1 - `FAIL`): Workflows ausentes em .github/workflows: ['security.yml']
  - *Detalhe:* Esteira de CI incompleta
- **[SEC-04]** (P1 - `FAIL`): Testes de segurança ausentes: ['rate limit', 'limite de transcript']
  - *Detalhe:* Testes de abuso e injeção incompletos

---

## 5. Verificações Não Executadas (SKIP)

Foram pulados **1** checks condicionais:

- **[GOV-01]**: Verificação do GitHub desativada (use flag --check-github) (Como destravar: Auditoria de PRs pulada em modo offline)

---

## 6. Regra de Veredito Aplicada

```text
NO-GO          se qualquer critério P0 falhar ou for pulado (fail-closed)
GO WITH DEBT   se todos os critérios P0 passarem, restando apenas P1/P2 com dívida registrada
GO             se todos os critérios tiverem evidência verificável
NO-GO IMEDIATO se: GQs ausentes · EDA ausente · Act sem usuários · hash divergente · dado pessoal
```
