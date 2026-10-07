# ADR-006 — Arquitetura Evidence-First

| Campo | Valor |
|:---|:---|
| **Status** | Aceito |
| **Data** | 2026-10-02 |
| **Autores** | Equipe EvidencIA |
| **Revisores** | A preencher |
| **Referências** | [GQ01–GQ12](../../validacao/questoes-norteadoras.md) · [Essential Question Alignment](../../requisitos/alinhamento-pergunta-fundamental.md) |

---

## Contexto

Uma auditoria CBL do projeto EvidencIA identificou cinco gaps críticos de alinhamento com a Essential Question do desafio:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?"*

Os gaps encontrados foram:

1. **Ausência de Guiding Questions** documentadas que derivem decisões arquiteturais da Essential Question.
2. **Dados mockados silenciosamente** — o provider de IA opera com respostas fabricadas sem sinalização.
3. **Ausência de EDA** — não há análise exploratória dos datasets antes de usá-los no pipeline.
4. **UX desalinhada com a Essential Question** — o painel apresenta um gauge numérico (score 0–100) que constitui um veredito algorítmico, substituindo o julgamento do usuário em vez de auxiliá-lo.
5. **Kanban sem evidência de Scrum** — ausência de goals de sprint, definition of done, reviews e retrospectivas documentadas.

O modelo anterior operava com a proposta de valor: *"A IA diz quão verdadeiro é o vídeo"* — implementada como `score: number (0–100)`, `reliabilityScore` por fonte e componente `Gauge.tsx`. Esse modelo é incompatível com a Essential Question.

---

## Decisão

Adotar a arquitetura **Evidence-First**: o EvidencIA deixa de emitir vereditos e passa a **organizar a investigação**. A unidade central do produto é a **alegação individual + suas evidências**. O usuário conclui; o sistema organiza.

As subseções abaixo formalizam cada decisão do ADR.

---

### Decisão 1 — Fim do Score Global {: #decisao-1-fim-do-score-global }

**Os campos `score` (0–100) e `reliabilityScore` são removidos do contrato de API e da UX principal.**

Esses campos implementam autoridade algorítmica: o sistema comunica um julgamento numérico sobre a veracidade de um vídeo ou fonte, substituindo o processo investigativo do usuário. Ambos violam a Essential Question.

- `score: number` (campo raiz da resposta `/analyze`) — **removido**
- `reliabilityScore: number` (campo de cada `FactCheckingSource`) — **removido**
- Componente `Gauge.tsx` do painel Preact — **removido da UX principal**

O resultado da análise não possui mais um número global. O estado de cada alegação é descrito pelo conjunto de evidências recuperadas, não por um índice calculado.

---

### Decisão 2 — Unidade = Alegação + Evidências {: #decisao-2-unidade-alegacao-evidencias }

**O novo contrato conceitual da resposta `/analyze` é:**

```typescript
interface AnalysisResponse {
  videoId: string;
  analysisMode: "evidence_first";        // identifica o modelo evidence-first
  videoTitle: string;
  channelName: string;
  publishedAt: string;                   // ISO 8601 — contexto temporal
  processingTimeMs: number;
  claims: Claim[];
  limitations: string[];                 // limites explícitos da análise atual
}

interface Claim {
  id: string;
  text: string;
  temporalContext: TemporalContext;
  evidence: Evidence[];
  uncertainty: UncertaintyState;
  reflectionQuestions: string[];         // >= 3 perguntas neutras por alegação
}

interface Evidence {
  sourceId: string;
  relation: "supports" | "contradicts" | "contextualizes";
  title: string;
  url: string;
  publishedAt: string;
  publisher: string;
  snippet?: string;                      // excerto relevante da fonte
  provenance: EvidenceProvenance;        // origem, hash, data de indexação
}

interface EvidenceProvenance {
  dataset: string;                       // ex.: "factchecks-br", "google-fact-check"
  indexedAt: string;
  contentHash?: string;                  // hash do conteúdo indexado
}

interface TemporalContext {
  claimDate?: string;                    // data da alegação no vídeo
  videoPublishedAt: string;              // data de publicação do vídeo
  note?: string;                         // alerta de anacronismo se relevante
}

type UncertaintyState =
  | "supported"            // evidências que sustentam encontradas
  | "contradicted"         // evidências que contradizem encontradas
  | "contextualized"       // evidências contextualizam sem confirmar/negar
  | "conflicting"          // fontes com conclusões opostas (divergência legítima)
  | "insufficient_evidence"; // sem suporte suficiente no corpus atual
```

O schema JSON correspondente será versionado em `shared/schemas/api-schema.json` (Planejado — Sprint 2).

---

### Decisão 3 — Estado "Sem Evidência Suficiente" {: #decisao-3-estado-sem-evidencia-suficiente }

**O estado `insufficient_evidence` é distinto de `"false"` ou `"contradicted"`.**

Quando nenhuma evidência com score de similaridade acima do limiar definido na EDA (H03) for recuperada para uma alegação, o sistema registra `uncertainty: "insufficient_evidence"`. Isso é epistemicamente honesto: significa que o corpus disponível não contém evidências suficientes — não que a alegação seja falsa.

**Regra inviolável:** `resultado sem evidência jamais é convertido automaticamente em "false"`.

---

### Decisão 4 — A LLM Não Decide a Verdade Antes de Recuperar Evidências {: #decisao-4-a-llm-nao-decide-a-verdade-antes-de-recuperar-evidencias }

**Pipeline obrigatório:**

```
Transcript
    │
    ▼
Claim Extraction         ← LLM extrai alegações verificáveis em linguagem natural
    │
    ▼
Normalization            ← normalização, deduplicação, filtragem de opinião
    │
    ▼
Vector Retrieval         ← busca vetorial no índice (FactChecks.br, Google Fact Check)
    │
    ▼
Metadata/Temporal Filter ← filtragem por relevância temporal e idioma
    │
    ▼
Evidence Ranking         ← ranking por score de similaridade + relevância temporal
    │
    ▼
Evidence Set             ← conjunto de evidências com relação explícita
    │
    ▼
(opcional) LLM Explanation ← síntese explicativa auxiliar a partir das evidências recuperadas
    │
    ▼
Reflection Questions     ← LLM formula perguntas neutras a partir das lacunas identificadas
    │
    ▼
UI Evidence-First        ← painel de investigação assistida
```

A LLM **não emite julgamento factual** na etapa de Claim Extraction. Ela apenas identifica e formula alegações. O julgamento factual pertence exclusivamente ao conjunto de evidências recuperadas na etapa de Vector Retrieval.

---

### Decisão 5 — Papéis dos Datasets {: #decisao-5-papeis-dos-datasets }

| Dataset | Papel no Produto | Restrições |
|:---|:---|:---|
| **Fake.br** (Santos et al., OpenCor 2018) | Corpus linguístico para EDA, análise de embeddings e baseline de retrieval | NÃO é base de verdade factual em produção; uso restrito a EDA e desenvolvimento |
| **FactChecks.br** (fake-news-UFG) | Base principal de evidências verificáveis para retrieval em produção | Verificar licença e termos de uso antes do deploy em produção |
| **Google Fact Check Tools / ClaimReview** | Evidência externa complementar em runtime (via API) | Sujeito a quotas de API; implementar circuit breaker |
| **ClaimPT** (LIAAD) | Auxiliar metodológico para extração de alegações | É Português Europeu — não é PT-BR; uso restrito à metodologia de extração, não ao retrieval |

---

### Decisão 6 — Providers de LLM Desacoplados {: #decisao-6-desacoplamento-de-providers-de-ia }

<a id="decisao-6-providers-de-llm-desacoplados"></a>

**Interface `LLMProvider`:**

```python
# backend/app/providers/base.py (Planejado)
from abc import ABC, abstractmethod

class LLMProvider(ABC):
    @abstractmethod
    async def extract_claims(self, transcript: str) -> list[str]: ...

    @abstractmethod
    async def generate_explanation(self, claim: str, evidence: list[dict]) -> str: ...

    @abstractmethod
    async def generate_reflection_questions(self, claim: str, evidence: list[dict]) -> list[str]: ...
```

**Implementações previstas:**

| Provider | Classe | Ativação |
|:---|:---|:---|
| Ollama (local) | `OllamaProvider` | `LLM_PROVIDER=ollama` |
| Remote (API externa) | `RemoteProvider` | `LLM_PROVIDER=remote` |
| Mock (testes) | `MockProvider` | `LLM_PROVIDER=mock` — **proibido em produção** |

**Regras:**

- Mock **somente** com `LLM_PROVIDER=mock` explícito em arquivo de configuração de dev/testes.
- Qualquer tentativa de ativar Mock em ambiente com `ENV=production` deve retornar erro imediato com log de auditoria.
- Falha do provider (timeout, erro de conexão) degrada para **modo Evidence-Only**: as evidências recuperadas são apresentadas sem síntese explicativa da LLM, com limitação visível no painel.

---

### Decisão 7 — HU11 Promovida para Must Have do MVP {: #decisao-7-hu11-promovida-para-must-have-do-mvp }

**As perguntas orientadoras de reflexão crítica (HU11) são promovidas de `Could Have / Pós-MVP` para `Must Have` do MVP.**

Motivação: HU11 é o mecanismo que mais diretamente responde à Essential Question. Um produto que emite vereditos automáticos mas não estimula o pensamento crítico não responde ao desafio CBL. A HU11 garante que o usuário receba, junto com as evidências, perguntas que o convidem a investigar por conta própria.

**Impactos:** RF-05 reclassificado de `Could Have` para `Must Have`; HU11 entra na Sprint 2.

---

### Decisão 8 — Critérios de Aceitação de Performance e Comportamento {: #decisao-8-criterios-de-aceitacao-de-performance-e-comportamento }

| Critério | Limiar | Método de Validação |
|:---|:---|:---|
| Feedback visual inicial | ≤ 1 s após clique | Playwright + `performance.now()` |
| Captions preflight (validação de legendas) | ≤ 1 s | Playwright |
| Cache hit | < 1 s | Teste unitário `chrome.storage.local` mock |
| Primeiras evidências úteis | ≤ 5 s P90 | Teste de carga E2E |
| Resultado completo | ≤ 10 s P90 | Alinhado a RNF-01; Playwright E2E |
| Hard timeout total | 15 s | Configuração de timeout no Service Worker |
| TBT adicional | ≤ 50 ms | Lighthouse CI |
| Memória adicional | ≤ 80 MB | Chrome DevTools Memory Inspector |
| Falha de provider | Sem crash; modo Evidence-Only com limitação visível | Teste de caos (HTTP 500, timeout) |
| Falha de retrieval | Mensagem explícita de erro; sem veredito implícito | Teste de caos |
| Mock em produção | **Proibido** — erro imediato com log de auditoria | Verificação de `ENV=production` no startup |

---

## Consequências

### Positivas

- **Alinhamento com a Essential Question:** o produto passa a estimular o pensamento crítico em vez de substituí-lo.
- **Honestidade epistêmica:** `insufficient_evidence` é mais honesto do que uma classificação arbitrária.
- **Rastreabilidade de evidências:** toda conclusão apresentada ao usuário tem fonte, data e URL verificáveis.
- **Desacoplamento do Ollama:** o produto pode ser usado com qualquer LLM, incluindo APIs remotas ou modo Evidence-Only.
- **EDA fundamentada:** as decisões de retrieval passam a ser baseadas em dados, não em hipóteses.

### Negativas e Mitigações

| Consequência | Mitigação |
|:---|:---|
| Remoção do gauge pode frustrar usuários que esperam um número simples | Seção "O que ainda não sabemos" e perguntas reflexivas oferecem estrutura alternativa clara |
| Pipeline RAG tem latência maior que resposta direta da LLM | Hard timeout de 15s com modo Evidence-Only como fallback; cache reduz latência em visitas repetidas |
| Fake.br não pode ser usado como base de verdade factual em produção | Documentado explicitamente; FactChecks.br é a base de produção |
| Desacoplamento do provider adiciona complexidade arquitetural | Interface `LLMProvider` é simples e testável; MockProvider facilita testes |

### Riscos

| Risco | Probabilidade | Impacto | Mitigação |
|:---|:---|:---|:---|
| FactChecks.br não cobre suficientemente alegações de vídeos PT-BR | Média | Alto | EDA Sprint 1 mede cobertura (H02); Google Fact Check complementa |
| Limiar de `insufficient_evidence` mal calibrado gera falsos positivos | Média | Médio | EDA Sprint 1 calibra empiricamente o limiar (H03) |
| Latência P90 de 5s não atingível com retrieval completo | Baixa | Alto | Testes de latência na Sprint 2; fallback para busca mais simples |

---

## Alternativas Consideradas

### Alternativa A — Manter score com explicação adicional

Manter o gauge mas adicionar uma seção de evidências abaixo. **Rejeitada:** o gauge continua sendo o elemento de destaque visual e reintroduz a autoridade algorítmica; o usuário ancora no número antes de examinar as evidências.

### Alternativa B — Classificação por faixa (Alto/Médio/Baixo confiabilidade)

Substituir o número por uma faixa verbal. **Rejeitada:** a faixa é igualmente um veredito algorítmico, apenas menos preciso. O problema é estrutural, não de granularidade.

### Alternativa C — Score opcional (atrás de um toggle)

Esconder o score em um "modo avançado". **Rejeitada:** a Essential Question não permite que o produto emita um veredito em nenhum modo de operação padrão.

---

## Referências

- [GQ01–GQ12 — Guiding Questions](../../validacao/questoes-norteadoras.md)
- [Essential Question Alignment](../../requisitos/alinhamento-pergunta-fundamental.md)
- [Decision Log — D-001 a D-007](registro-decisoes.md)
- [HU11 — Perguntas Orientadoras para Reflexão Crítica](../../requisitos/backlog-e-historias.md#hu11)
- [HU13–HU16 — Novas Histórias Evidence-First](../../requisitos/backlog-e-historias.md#hu13)
- [ADR-005 — Modelo Local e Datasets Brasileiros](ADR-005-modelo-local-e-datasets-brasileiros.md) *(precursor)*
- Fake.br — Santos et al., OpenCor 2018 (A validar)
- FactChecks.br — fake-news-UFG (A validar)
- ClaimPT — LIAAD (A validar)
