# Guiding Questions — EvidencIA

## Nesta página

- [Essential Question](#essential-question)
- [Challenge](#challenge)
- [Guiding Questions](#guiding-questions)
- [Respostas Sintetizadas](#respostas-sintetizadas)
- [Evidências Utilizadas](#evidencias-utilizadas)
- [Decisões Derivadas](#decisoes-derivadas)
- [Hipóteses Ainda Não Validadas](#hipoteses-ainda-nao-validadas)
- [Relação Engage → Investigate](#relacao-engage-investigate)

---

## Essential Question {: #essential-question }

> **Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?**

---

## Challenge {: #challenge }

O desafio consiste em desenvolver um sistema de IA capaz de auxiliar usuários a **avaliar a confiabilidade de informações em vídeos do YouTube**, percorrendo o ciclo CBL completo:

- **Engage:** Identificar o problema central — a dificuldade de avaliar alegações em vídeos — e formular perguntas orientadoras que guiem a investigação.
- **Investigate:** Coletar evidências sobre como a IA pode auxiliar sem substituir o julgamento humano; explorar datasets, técnicas de recuperação e modelos de linguagem.
- **Act:** Construir a extensão EvidencIA com uma arquitetura orientada a evidências e investigação assistida.
- **Reflect & Share:** Avaliar os resultados com métricas objetivas (retrieval, latência, UX) e comunicar aprendizados.

O produto resultante é uma **extensão de navegador** que extrai a transcrição de vídeos do YouTube, identifica alegações verificáveis, recupera evidências de fontes confiáveis e apresenta ao usuário um painel de investigação — sem emitir um veredito global de "verdadeiro" ou "falso".

---

## Guiding Questions {: #guiding-questions }

| # | Guiding Question | Resposta Sintetizada | Decisão Derivada |
|:---|:---|:---|:---|
| **GQ01** | O que torna uma informação de vídeo difícil de avaliar? | Mistura de opinião, contexto temporal, linguagem emocional e múltiplas alegações simultâneas. | Decompor o conteúdo em alegações verificáveis antes de qualquer análise. |
| **GQ02** | O usuário precisa de um "veredito" ou de evidências para investigar? | Evidências, contexto e incertezas preservam a autonomia crítica; um veredito único a elimina. | Remover o score global (0–100) e o gauge da UX principal. |
| **GQ03** | O que a IA pode automatizar sem substituir o julgamento? | Extração de alegações, recuperação, agrupamento, comparação e síntese explicativa. | A LLM não é autoridade factual primária; serve como componente auxiliar de linguagem. |
| **GQ04** | Que evidência é relevante para português brasileiro? | Registros de fact-checking e corpora brasileiros; bases genéricas não cobrem o contexto PT-BR adequadamente. | Priorizar FactChecks.br e Fake.br como fontes primárias de retrieval. |
| **GQ05** | O que significa "não encontramos evidência"? | Ausência de evidência não equivale a falsidade; é um estado epistêmico distinto. | Criar estado explícito `insufficient_evidence` distinto de `false`. |
| **GQ06** | Como lidar com fontes conflitantes? | Expor a divergência com data e contexto das fontes; nunca reduzir conflito a uma nota arbitrária. | Painel apresenta ambos os lados de controvérsias legítimas sem arbitrar vencedor. |
| **GQ07** | Como evitar que a LLM alucine uma checagem? | Toda conclusão factual depende de evidências recuperadas e rastreáveis; a LLM não deve inventar fatos. | RAG é o núcleo factual; a LLM é componente auxiliar de linguagem e formulação. |
| **GQ08** | Como o usuário exerce pensamento crítico? | O painel apresenta perguntas reflexivas (fonte? data? o que foi omitido? que evidência contradiz?). | HU11 promovida de Pós-MVP para Must Have do MVP. |
| **GQ09** | Como medir se a recuperação funciona? | Recall@k, MRR, nDCG e análise qualitativa dos top-k resultados. | A EDA inclui avaliação de retrieval com métricas objetivas. |
| **GQ10** | Como lidar com conteúdo antigo? | A alegação deve ser interpretada no contexto temporal original de publicação. | Manter campo `TemporalContext` no schema de alegações. |
| **GQ11** | Qual é o papel do usuário? | Investigador final, não receptor passivo de um veredito algorítmico. | UX orientada à investigação assistida; o usuário conclui, o sistema organiza. |
| **GQ12** | Qual é o limite do produto? | Não determina "a verdade"; organiza evidências e explicita o grau de suporte disponível. | Revisar visão, requisitos e nomenclatura para eliminar termos como "veracidade" e "score". |

---

## Respostas Sintetizadas {: #respostas-sintetizadas }

### GQ01 — Dificuldade de avaliação em vídeos

Vídeos informacionais combinam múltiplas alegações em narrativas lineares e muitas vezes emocionais, tornando difícil para o espectador isolar o que é verificável do que é opinativo. A linguagem oral, o ritmo do discurso e o contexto temporal (um vídeo de 2018 pode circular como novo) agravam a dificuldade. A decisão derivada é **decompor o conteúdo em alegações verificáveis individuais** antes de qualquer análise — cada alegação recebe seu próprio conjunto de evidências.

### GQ02 e GQ11 — Autonomia crítica vs. veredito

A pesquisa sobre desinformação sugere que vereditos categóricos ("isso é falso") podem tanto reforçar vieses pré-existentes quanto criar dependência de autoridade algorítmica. O produto foi reorientado para uma **UX de investigação assistida**: o sistema organiza evidências, expõe incertezas e formula perguntas; o usuário conclui.

### GQ03 e GQ07 — Papel da LLM

A LLM é útil para extração de alegações em linguagem natural, síntese explicativa e formulação de perguntas reflexivas. Não deve ser usada como oráculo factual antes da recuperação de evidências. O pipeline correto é: `Transcript → Claim Extraction → Normalization → Vector Retrieval → Evidence Set → (opcional) LLM Explanation`.

### GQ04 — Relevância para PT-BR

O corpus Fake.br (Santos et al., OpenCor 2018) é um recurso linguístico/EDA para PT-BR; FactChecks.br (fake-news-UFG) é a principal base de evidências verificáveis em PT-BR. ClaimPT (LIAAD) é metodologicamente útil mas é Português Europeu — útil como referência, não como base primária de retrieval para PT-BR.

### GQ05 e GQ06 — Incerteza e conflito

A ausência de evidência no corpus disponível não implica falsidade — implica que o sistema não encontrou suporte suficiente com as fontes atuais. Estados distintos são: `supported` (evidências que sustentam), `contradicted` (evidências que contradizem), `contextualized` (evidências que contextualizam sem confirmar/negar) e `insufficient_evidence` (ausência de suporte suficiente). Fontes conflitantes são apresentadas lado a lado com data e contexto.

### GQ08 — Reflexão crítica na UX

As perguntas reflexivas (HU11) são o mecanismo central pelo qual o produto respeita a Essential Question. Perguntas como "Qual é a fonte primária desta alegação?", "Esta informação ainda é atual?", "Que evidência independente existe?" e "O que foi omitido?" estimulam o pensamento crítico sem impor uma conclusão.

### GQ09 — Avaliação de retrieval

As métricas Recall@k (k=5,10), MRR (Mean Reciprocal Rank) e nDCG (Normalized Discounted Cumulative Gain) serão calculadas na EDA da Sprint 1 usando anotações manuais de relevância sobre um subconjunto do corpus. A análise qualitativa dos top-k resultados complementa as métricas quantitativas.

### GQ10 — Contexto temporal

O campo `TemporalContext` no schema de alegações registra a data de publicação do vídeo e a data das evidências recuperadas, permitindo que o usuário avalie se uma alegação era válida à época.

### GQ12 — Limite do produto

O produto não determina "a verdade". Ao apresentar evidências com seus metadados de origem e um campo `uncertainty` que descreve o estado do conjunto de evidências (não a "confiança da IA"), o produto deixa explícito o limite epistêmico de cada análise.

---

## Evidências Utilizadas {: #evidencias-utilizadas }

| Fonte | Papel | Status de Validação |
|:---|:---|:---|
| Documento do desafio CBL / keynote | Origem da Essential Question e do ciclo Engage→Investigate→Act→Reflect | A validar com facilitadores do desafio |
| Auditoria CBL anterior | Identificou os 5 gaps que motivam esta revisão | Validado — gerou este documento |
| Fake.br — Santos et al. (OpenCor 2018) | Corpus linguístico PT-BR para EDA e baseline de embeddings | A validar acessibilidade e licença de uso |
| FactChecks.br — fake-news-UFG | Base principal de evidências verificáveis em PT-BR para retrieval | A validar cobertura de alegações de vídeos |
| ClaimPT — LIAAD | Auxiliar metodológico para extração de alegações (Português Europeu) | A validar — **não é PT-BR**; uso restrito à metodologia |
| Google Fact Check Tools / ClaimReview | Evidência externa complementar em runtime | A validar — uso em produção sujeito a limites de quota |

> **Nota:** Apenas as fontes marcadas como "Validado" foram confirmadas como existentes e acessíveis. As demais são referências a serem confirmadas na Sprint 1 (EDA).

---

## Decisões Derivadas {: #decisoes-derivadas }

| GQ(s) | Decisão | Status | Referência |
|:---|:---|:---|:---|
| GQ01 | Unidade de análise = alegação individual (não o vídeo inteiro) | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) |
| GQ02, GQ12 | Remoção do score global 0–100 e do gauge da UX | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) |
| GQ03, GQ07 | LLM como componente auxiliar; RAG como núcleo factual | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) |
| GQ04 | Priorizar FactChecks.br e Fake.br; ClaimPT como auxiliar metodológico | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) |
| GQ05, GQ06 | Estado `insufficient_evidence` distinto de `false`; fontes conflitantes expostas lado a lado | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) |
| GQ08 | HU11 promovida de Pós-MVP para Must Have do MVP | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md), [HU11](../requisitos/backlog-e-historias.md#hu11) |
| GQ09 | EDA inclui avaliação de retrieval com Recall@k, MRR, nDCG | Aceito | Sprint 01 |
| GQ10 | Campo `TemporalContext` obrigatório no schema de alegações | Aceito | [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) |
| GQ11 | UX de investigação assistida; usuário é investigador final | Aceito | [alinhamento-pergunta-fundamental.md](../requisitos/alinhamento-pergunta-fundamental.md) |

---

## Hipóteses Ainda Não Validadas {: #hipoteses-ainda-nao-validadas }

| # | Hipótese | Como será validada na EDA |
|:---|:---|:---|
| H01 | Embeddings multilíngues (ex.: `multilingual-e5-large`) superam BM25 nos subconjuntos PT-BR relevantes do FactChecks.br | EDA Sprint 1: comparação Recall@5 e nDCG@10 entre BM25 e embeddings densos sobre amostra anotada manualmente |
| H02 | FactChecks.br cobre parte suficiente (>= 30%) das alegações típicas de vídeos populares de saúde/política no YouTube PT-BR | EDA Sprint 1: amostragem de 50 alegações extraídas de vídeos reais; busca no corpus; cálculo de cobertura |
| H03 | O limiar de `insufficient_evidence` pode ser definido objetivamente (ex.: nenhuma evidência com score >= 0.65 no top-3) | EDA Sprint 1: análise da distribuição de scores de similaridade; definição empírica do limiar com validação qualitativa |
| H04 | A latência P90 de ≤ 5s para primeiras evidências é atingível com o pipeline RAG completo em ambiente de staging | Sprint 2: testes de latência com Playwright e `performance.now()` sob condições de rede normais |
| H05 | Perguntas reflexivas geradas pela LLM são percebidas como neutras e úteis pelos usuários | Pendente — requer pesquisa com usuários (fora do escopo da EDA técnica) |

---

## Relação Engage → Investigate {: #relacao-engage-investigate }

A fase **Engage** produziu as 12 Guiding Questions acima. A fase **Investigate** — executada na Sprint 1 — responderá diretamente às seguintes GQs:

| GQ | Questão | Atividade de Investigação na Sprint 1 |
|:---|:---|:---|
| GQ04 | Que evidência é relevante para PT-BR? | Dataset Registry + análise de cobertura do FactChecks.br |
| GQ05 | O que significa "não encontramos evidência"? | Definição empírica do limiar de `insufficient_evidence` na EDA |
| GQ06 | Como lidar com fontes conflitantes? | Análise qualitativa de top-k com fontes divergentes na EDA |
| GQ07 | Como evitar alucinação da LLM? | Ingestion pipeline + Chroma index + avaliação de retrieval baseline |
| GQ09 | Como medir se a recuperação funciona? | EDA notebook com Recall@k, MRR, nDCG |
| GQ10 | Como lidar com conteúdo antigo? | Canonical schema com campo `TemporalContext` |

As GQs respondidas na Sprint 1 alimentam a Sprint 2 (fase **Act**), que converterá os resultados em pipeline de evidências e UX definitiva.

---

**Ver também:** [Essential Question Alignment](../requisitos/alinhamento-pergunta-fundamental.md) · [ADR-006 — Evidence-First Architecture](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) · [Backlog e Histórias de Usuário](../requisitos/backlog-e-historias.md)
