# Contrato de Dados e Especificação da API

## Nesta página

- [Visão Geral da Integração](#visao-geral-da-integracao)
- [Padrões de Comunicação e Segurança](#padroes-de-comunicacao-e-seguranca)
- [Endpoints da API](#endpoints-da-api)
  - [POST /api/v1/analyze](#post-apiv1analyze)
  - [GET /api/v1/health](#get-apiv1health)
- [Modelos de Dados (TypeScript e JSON)](#modelos-de-dados-json-schema-e-typescript)
- [Códigos de Status HTTP e Cenários de Falha](#codigos-de-status-http-e-cenarios-de-falha)

---

## Visão Geral da Integração {: #visao-geral-da-integracao }

A extensão atua exclusivamente como cliente consumidor da API fornecida pelo **Backend Proxy**. O desacoplamento através de um contrato estrito garante que o cliente web e o pipeline de inferência de inteligência artificial possam evoluir de forma independente, sem quebras de compatibilidade.

---

## Padrões de Comunicação e Segurança {: #padroes-de-comunicacao-e-seguranca }

- **Protocolo:** HTTPS obrigatório com TLS 1.3.
- **Formato:** Cargas de entrada e saída codificadas estritamente em JSON (`Content-Type: application/json; charset=utf-8`).
- **Autenticação:** Requisições originadas da extensão incluem cabeçalho de assinatura de aplicação (`X-App-Client-Id` e token de sessão temporário emitido na instalação).
- **Timeouts:** O backend impõe tempo limite interno de **8,0 segundos** para comunicação com os provedores de inteligência artificial e serviços de busca externa, garantindo margem para o SLA de **10 segundos** no navegador do usuário ([RNF-01](../requisitos/catalogo-requisitos.md#rnf-01)).

---

## Endpoints da API {: #endpoints-da-api }

### POST /api/v1/analyze {: #post-apiv1analyze }

Submete a transcrição capturada de um vídeo para extração de alegações, recuperação de evidências factuais em corpora verificados (FactChecks.br) e formulação de perguntas para reflexão crítica, operando sob a arquitetura Evidence-First ([ADR-006](decisoes/ADR-006-evidence-first-architecture.md)).

#### Cabeçalhos da Requisição

| Cabeçalho | Tipo | Obrigatório | Descrição |
|:---|:---|:---:|:---|
| `Content-Type` | string | Sim | `application/json` |
| `X-Client-Version` | string | Sim | Versão da extensão cliente (ex.: `1.0.0`) |

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
    "cacheStore": "operational"
  },
  "timestamp": "2026-09-26T12:00:00Z"
}
```

---

## Modelos de Dados (JSON Schema e TypeScript) {: #modelos-de-dados-json-schema-e-typescript }

Para manter a consistência entre o cliente JavaScript no navegador e o servidor, as seguintes definições TypeScript representam os tipos contratuais:

```typescript
export type VerificationClassification = "verdadeiro" | "moderado" | "falso" | "inconclusivo";

export type ClaimVerificationStatus = "apoiada" | "contraditada" | "inconclusiva";

export interface AnalyzeRequest {
  videoId: string;
  videoTitle: string;
  channelName: string;
  uploadDate?: string;
  durationSeconds?: number;
  transcript: string;
  language?: string;
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
  snippet?: string;
  provenance: EvidenceProvenance;
}

export interface Claim {
  id: string;
  text: string;
  temporalContext: TemporalContext;
  evidence: Evidence[];
  uncertainty: UncertaintyState;
  reflectionQuestions: string[];
}

export interface AnalyzeResponse {
  videoId: string;
  analysisMode: "evidence_first";
  videoTitle: string;
  channelName: string;
  publishedAt: string;
  processingTimeMs: number;
  claims: Claim[];
  limitations: string[];
}

export interface ApiErrorDetail {
  code: string;
  message: string;
  field?: string;
}

export interface ErrorResponse {
  error: {
    code: string;
    message: string;
    details?: ApiErrorDetail[];
    timestamp: string;
  };
}
```

---

## Códigos de Status HTTP e Cenários de Falha {: #codigos-de-status-http-e-cenarios-de-falha }

| Código HTTP | Significado | Causa e Comportamento da Extensão |
|:---|:---|:---|
| **200 OK** | Sucesso | Análise concluída; cliente renderiza o painel e salva no cache local. |
| **400 Bad Request** | Requisição Inválida | Campos obrigatórios ausentes (`videoId` ou `transcript`). Extensão registra log e sinaliza falha de formato. |
| **422 Unprocessable Entity** | Conteúdo Inelegível | Transcrição contém menos de 50 caracteres úteis ou apenas ruído. Extensão exibe aviso de texto insuficiente para inferência. |
| **429 Too Many Requests** | Limite Excedido | Taxa de requisições excedeu os limites de proteção (*Rate Limit*). Extensão instrui o usuário a aguardar 60 segundos. |
| **503 Service Unavailable** | Provedor Indisponível | Falha momentânea nas APIs upstream de IA ou busca. Extensão informa indisponibilidade e disponibiliza botão de repetição. |
| **504 Gateway Timeout** | Tempo Limite Esgotado | O pipeline de checagem excedeu o teto de 8 segundos no servidor. Extensão cancela o carregamento e notifica o usuário graciosamente. |

---

**Próximo:** [Arquitetura do Sistema](arquitetura.md) — diagrama de contêineres e fluxo de dados.  
**Ver também:** [Threat Model e Segurança](modelagem-ameacas.md) — análise de riscos e conformidade LGPD.
