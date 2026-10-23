# Contrato de Dados e Especificação da API

## Nesta página

- [Visão Geral da Integração](#visao-geral-da-integracao)
- [Padrões de Comunicação e Segurança](#padroes-de-comunicacao-e-seguranca)
- [Endpoints da API](#endpoints-da-api)
  - [Resumo das rotas](#resumo-das-rotas)
  - [POST /api/v1/analyze](#post-apiv1analyze)
  - [GET /api/v1/health](#get-apiv1health)
- [Modelos de Dados (TypeScript e JSON)](#modelos-de-dados-json-schema-e-typescript)
- [Códigos de Status HTTP e Cenários de Falha](#codigos-de-status-http-e-cenarios-de-falha)

---

## Visão Geral da Integração {: #visao-geral-da-integracao }

A extensão atua exclusivamente como cliente consumidor da API fornecida pelo **Backend Proxy**. O desacoplamento através de um contrato estrito garante que o cliente web e o pipeline de inferência de inteligência artificial possam evoluir de forma independente, sem quebras de compatibilidade.

---

## Padrões de Comunicação e Segurança {: #padroes-de-comunicacao-e-seguranca }

- **Protocolo:** HTTPS obrigatório fora do ambiente local; o build de produção da extensão recusa backend sem `https:` e restringe `host_permissions` à origem configurada.
- **Formato:** Cargas de entrada e saída codificadas estritamente em JSON (`Content-Type: application/json; charset=utf-8`). Corpos acima de `MAX_REQUEST_BODY_BYTES` (padrão 512 KiB) são recusados antes do parsing.
- **Autenticação:** A extensão obtém em `POST /api/v1/auth/token` um token efêmero assinado com HMAC-SHA256 (validade de 24 horas), a partir de um identificador anônimo de instalação, e o envia como `Authorization: Bearer <token>`. Em produção e staging, `REQUIRE_AUTH=true` e um `AUTH_SECRET` próprio (mínimo de 32 caracteres) são exigidos no startup; em desenvolvimento, chamadas anônimas são aceitas.
- **Timeouts:** As etapas de LLM compartilham o orçamento `LLM_TIMEOUT_SECONDS` (padrão e teto de **15 segundos**). Esgotado o orçamento, a resposta degrada para o modo `evidence_only` em vez de falhar. A extensão aborta a requisição após **30 segundos**; a meta de latência do [RNF-01](../requisitos/catalogo-requisitos.md#rnf-01) é verificada nos testes E2E.

---

## Endpoints da API {: #endpoints-da-api }

### Resumo das rotas {: #resumo-das-rotas }

| Método e rota | Autenticação | Limite | Finalidade |
|:---|:---:|:---:|:---|
| `POST /api/v1/auth/token` | Não | 30/min | Emite token Bearer efêmero para um `installationId` anônimo (8 a 128 caracteres `[A-Za-z0-9_-]`). |
| `POST /api/v1/analyze` | Sim* | `RATE_LIMIT_MAX_PER_MINUTE` | Extração de alegações, evidências e perguntas de reflexão (Evidence-First). |
| `POST /api/v1/feedback` | Sim* | `RATE_LIMIT_MAX_PER_MINUTE` | Avaliação anônima de utilidade (sem dado pessoal persistido). |
| `POST /api/v1/classify` | Sim* | `RATE_LIMIT_MAX_PER_MINUTE` | Classe linguística supervisionada com abstenção; não é prova factual. |
| `GET /api/v1/health` | Não | Padrão | Estado agregado (`healthy`, `degraded` com provedor mock, `unhealthy`). |
| `GET /api/v1/health/live` | Não | Padrão | Liveness probe. |
| `GET /api/v1/health/ready` | Não | Padrão | Readiness probe; HTTP 503 enquanto provedor ou classificador não estiverem prontos. |

\* Obrigatória quando `REQUIRE_AUTH=true` (sempre em produção e staging). Os esquemas de cada corpo estão no [JSON Schema canônico](https://github.com/evidencia-grupo/EvidencIA/blob/main/shared/schemas/api-schema.json), gerado dos modelos Pydantic.

### POST /api/v1/analyze {: #post-apiv1analyze }

Submete a transcrição capturada de um vídeo para extração de alegações, recuperação de evidências factuais em corpora verificados (FactChecks.br) e formulação de perguntas para reflexão crítica, operando sob a arquitetura Evidence-First ([ADR-006](decisoes/ADR-006-evidence-first-architecture.md)).

#### Cabeçalhos da Requisição

| Cabeçalho | Tipo | Obrigatório | Descrição |
|:---|:---|:---:|:---|
| `Content-Type` | string | Sim | `application/json` |
| `Authorization` | string | Sim* | `Bearer <token>` emitido por `POST /api/v1/auth/token` |
| `X-Client-Version` | string | Não | Versão da extensão cliente (ex.: `1.0.0`); sempre enviada pela extensão |

#### Exemplo de Payload de Requisição

```json
{
  "videoId": "abc123xyz",
  "videoTitle": "O Brasil vai se tornar a maior economia do mundo? Veja o que os especialistas dizem",
  "channelName": "Mundo Hoje",
  "uploadDate": "2026-09-24T14:30:00Z",
  "durationSeconds": 628,
  "transcript": "Olá pessoal, hoje vamos analisar se o Brasil pode alcançar a primeira posição na economia global até o próximo decênio...",
  "language": "pt-BR"
}
```

#### Exemplo de Resposta de Sucesso (HTTP 200 OK — Evidence-First)

```json
{
  "videoId": "abc123xyz",
  "analysisMode": "evidence_first",
  "videoTitle": "O Brasil vai se tornar a maior economia do mundo? Veja o que os especialistas dizem",
  "channelName": "Mundo Hoje",
  "publishedAt": "2026-09-24T14:30:00Z",
  "processingTimeMs": 3840,
  "claims": [
    {
      "id": "clm-01",
      "text": "O PIB brasileiro ultrapassará os Estados Unidos até o ano de 2035.",
      "temporalContext": {
        "claimDate": "2026-09-24",
        "videoPublishedAt": "2026-09-24T14:30:00Z"
      },
      "uncertainty": "contradicted",
      "reflectionQuestions": [
        "Qual é a fonte primária das projeções econômicas citadas no vídeo?",
        "As projeções do FMI e Banco Mundial consideram que taxa de crescimento médio anual?",
        "Que fatores de risco político ou cambial foram omitidos no argumento?"
      ],
      "evidence": [
        {
          "sourceId": "src-01",
          "relation": "contradicts",
          "title": "Banco Mundial - Perspectivas Econômicas do Brasil",
          "url": "https://www.worldbank.org/pt/country/brazil",
          "publishedAt": "2026-01-15T00:00:00Z",
          "publisher": "Banco Mundial",
          "snippet": "Projeções oficiais estimam crescimento de 1,8% a 2,2% ao ano, descartando ultrapassagem do PIB norte-americano.",
          "provenance": {
            "dataset": "factchecks-br",
            "indexedAt": "2026-08-01T10:00:00Z",
            "contentHash": "sha256-a1b2c3d4..."
          }
        }
      ]
    },
    {
      "id": "clm-02",
      "text": "O setor de agronegócio e energia limpa lideram a atração de investimentos internacionais.",
      "temporalContext": {
        "claimDate": "2026-09-24",
        "videoPublishedAt": "2026-09-24T14:30:00Z"
      },
      "uncertainty": "supported",
      "reflectionQuestions": [
        "A liderança setorial se mantém no último trimestre consolidado?",
        "Que metodologia é utilizada para classificar 'energia limpa' nos relatórios citados?",
        "Existem fontes independentes além dos dados ministeriais divulgados?"
      ],
      "evidence": [
        {
          "sourceId": "src-02",
          "relation": "supports",
          "title": "Balança Comercial e Investimento Estrangeiro Direto",
          "url": "https://www.gov.br/mdic/pt-br/noticias",
          "publishedAt": "2026-06-30T00:00:00Z",
          "publisher": "MDIC / Banco Central",
          "snippet": "Dados consolidados confirmam agropecuária e energia renovável como principais destinos de IED.",
          "provenance": {
            "dataset": "factchecks-br",
            "indexedAt": "2026-08-01T10:00:00Z",
            "contentHash": "sha256-e5f6g7h8..."
          }
        }
      ]
    }
  ],
  "limitations": [
    "A análise cobre apenas alegações verificáveis presentes na transcrição de áudio.",
    "Bases de fact-checking possuem atualização até a data da última indexação do corpus."
  ]
}
```

---

### GET /api/v1/health {: #get-apiv1health }

Verifica a integridade operacional do backend proxy e dos conectores de inteligência artificial e busca externa.

#### Resposta de Sucesso (HTTP 200 OK)

```json
{
  "status": "healthy",
  "version": "1.0.0",
  "services": {
    "llmConnector": "operational",
    "searchConnector": "operational",
    "cacheStore": "operational",
    "classifier": "operational"
  },
  "timestamp": "2026-09-26T12:00:00Z"
}
```

---

## Modelos de Dados (JSON Schema e TypeScript) {: #modelos-de-dados-json-schema-e-typescript }

A fonte canônica dos tipos é `backend/app/schemas.py`; dela são gerados [`shared/schemas/api-schema.json`](https://github.com/evidencia-grupo/EvidencIA/blob/main/shared/schemas/api-schema.json) e [`shared/types/api.ts`](https://github.com/evidencia-grupo/EvidencIA/blob/main/shared/types/api.ts) por `scripts/generate_contracts.py`. O resumo abaixo foi conferido contra `EvidencIA@6ec6c70` em 23/10/2026; em caso de divergência, prevalecem os arquivos gerados. Todos os modelos recusam campos extras (`extra="forbid"`).

```typescript
export interface TranscriptSegment {
  text: string;      // 1 a 100.000 caracteres
  start: number;     // segundos, >= 0
  duration: number;  // segundos, >= 0
}

export interface AnalyzeRequest {
  videoId: string;          // 1 a 128 caracteres
  videoTitle: string;       // 1 a 500 caracteres
  channelName: string;      // 1 a 500 caracteres
  uploadDate?: string | null;
  durationSeconds?: number | null;
  transcript: string;       // 50 a 100.000 caracteres
  language?: string | null; // padrão "pt-BR"
  segments?: TranscriptSegment[];                      // até 5.000 segmentos
  analysisMode?: "evidence_first" | "evidence_only";   // padrão "evidence_first"
}

export type EvidenceRelation = "supports" | "contradicts" | "contextualizes";

export type UncertaintyState =
  | "supported"
  | "contradicted"
  | "contextualized"
  | "conflicting"
  | "insufficient_evidence";

export interface EvidenceProvenance {
  dataset: string;
  indexedAt: string;
  contentHash?: string;
}

export interface TemporalContext {
  claimDate?: string;
  videoPublishedAt: string;
  note?: string;
}

export interface Evidence {
  sourceId: string;
  relation: EvidenceRelation;
  title: string;
  url: string;
  publishedAt: string;
  publisher: string;
  snippet?: string | null;
  matchReason?: string | null;
  provenance: EvidenceProvenance;
}

export interface Claim {
  id: string;
  text: string;
  transcriptSnippet?: string | null;
  timestampStart?: number | null;
  timestampEnd?: number | null;
  temporalContext: TemporalContext;
  evidence?: Evidence[];
  uncertainty: UncertaintyState;
  reflectionQuestions?: string[] | null;
}

export interface AnalyzeResponse {
  videoId: string;
  analysisMode: "evidence_first" | "evidence_only";
  videoTitle: string;
  channelName: string;
  publishedAt: string;
  processingTimeMs: number;
  claims: Claim[];
  limitations?: string[];
}
```

Os corpos de `POST /api/v1/auth/token`, `POST /api/v1/feedback`, `POST /api/v1/classify` e das sondas de saúde estão no JSON Schema canônico. Em resumo: `feedback` aceita `rating` (`positive` ou `negative`) e `reason` opcional (`outdated_sources`, `insufficient_evidence`, `inaccurate`, `other`); `classify` aceita `text` (3 a 10.000 caracteres) e `threshold` opcional (sem valor, aplica o `acceptance_threshold` de `model.json`, hoje 0,60, embora a descrição do campo no esquema cite 0,65) e devolve uma classe linguística, não um veredito factual.

!!! note "Formato real dos erros"
    O backend usa o formato padrão do FastAPI: `{"detail": "<mensagem>"}` para erros de negócio, corpo e autenticação, e `{"detail": [ ... ]}` com a lista de violações para HTTP 422 de validação de esquema. A readiness não pronta devolve `{"detail": {"status": "not_ready", "components": {...}}}`. A exceção é o HTTP 429, gerado pelo tratador padrão do SlowAPI no formato `{"error": "Rate limit exceeded: <limite>"}`. A interface `ErrorResponse` (`{ "error": { "code", "message", ... } }`) existe em `shared/types/api.ts`, mas nenhuma rota a emite; não a use para interpretar respostas.

    Os rótulos em português `apoiada`, `contraditada` e `inconclusiva` (`ClaimVerificationStatus`) são internos ao cliente da Google Fact Check Tools API no backend e não fazem parte do contrato HTTP. O tipo `VerificationClassification` citado em versões anteriores desta página não existe no código.

---

## Códigos de Status HTTP e Cenários de Falha {: #codigos-de-status-http-e-cenarios-de-falha }

| Código HTTP | Significado | Causa e Comportamento da Extensão |
|:---|:---|:---|
| **200 OK** | Sucesso | Análise concluída; cliente renderiza o painel e salva no cache local. |
| **400 Bad Request** | Cabeçalho Inválido | `Content-Length` malformado ou negativo, recusado antes do parsing. |
| **401 Unauthorized** | Credencial Ausente | Com autenticação obrigatória, cabeçalho `Authorization: Bearer` ausente ou mal formatado. |
| **403 Forbidden** | Credencial Inválida | Token com assinatura inválida ou expirado. A extensão renova o token uma única vez e repete a chamada. |
| **413 Content Too Large** | Corpo Excedido | Corpo declarado ou transmitido acima de `MAX_REQUEST_BODY_BYTES`. |
| **422 Unprocessable Entity** | Conteúdo Inválido | Violação do esquema (campo obrigatório ausente, campo extra, tamanho fora do limite) ou transcrição com menos de 50 caracteres úteis. Extensão exibe a falha e permite nova tentativa. |
| **429 Too Many Requests** | Limite Excedido | Taxa de requisições excedeu os limites de proteção (*Rate Limit*, janela de um minuto por endereço de cliente; 30/min em `/auth/token` e `RATE_LIMIT_MAX_PER_MINUTE`, padrão 60, nas demais rotas protegidas). Extensão exibe aviso amigável para tentar de novo em instantes. |
| **503 Service Unavailable** | Serviço Indisponível | Falha inesperada no pipeline de análise ou readiness ainda não pronto. Extensão informa indisponibilidade e disponibiliza botão de repetição. Timeout do LLM não gera 503: a resposta degrada para `evidence_only`. |
| **504 Gateway Timeout** | Tempo Limite Esgotado | Tempo limite da análise excedido fora das etapas de LLM. Extensão cancela o carregamento e notifica o usuário. |

---

**Próximo:** [Arquitetura do Sistema](arquitetura.md) — diagrama de contêineres e fluxo de dados.  
**Ver também:** [Threat Model e Segurança](modelagem-ameacas.md) — análise de riscos e conformidade LGPD.
