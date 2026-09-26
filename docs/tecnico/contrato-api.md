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

Submete a transcrição capturada de um vídeo para extração de alegações, cruzamento com bases de evidências externas e cálculo do índice de veracidade.

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

#### Exemplo de Resposta de Sucesso (HTTP 200 OK)

```json
{
  "videoId": "abc123xyz",
  "analyzedAt": "2026-09-26T12:00:00Z",
  "score": 68,
  "classification": "moderado",
  "summary": "O vídeo apresenta dados reais e cita especialistas reconhecidos na área de economia. No entanto, algumas projeções podem ser consideradas otimistas e não levam em conta possíveis riscos, como instabilidade política e fatores externos. Por isso, a veracidade é considerada moderada, com base na qualidade das fontes e na forma como as informações são apresentadas.",
  "claims": [
    {
      "id": "clm-01",
      "text": "O PIB brasileiro ultrapassará os Estados Unidos até o ano de 2035.",
      "status": "contraditada",
      "evidenceSummary": "Relatórios do FMI e do Banco Mundial projetam crescimento moderado e descartam essa possibilidade.",
      "confidence": 0.94
    },
    {
      "id": "clm-02",
      "text": "O setor de agronegócio e energia limpa lideram a atração de investimentos internacionais.",
      "status": "apoiada",
      "evidenceSummary": "Dados oficiais de comércio exterior e balança de pagamentos confirmam a liderança destes dois setores.",
      "confidence": 0.91
    }
  ],
  "sources": [
    {
      "id": "src-01",
      "title": "Banco Mundial - Perspectivas Econômicas do Brasil",
      "url": "https://www.worldbank.org/pt/country/brazil",
      "domain": "worldbank.org",
      "reliabilityScore": 0.98,
      "publishedAt": "2026-01-15T00:00:00Z"
    },
    {
      "id": "src-02",
      "title": "Relatório do FMI - Projeções para o Brasil",
      "url": "https://www.imf.org/pt/News/Articles",
      "domain": "imf.org",
      "reliabilityScore": 0.96,
      "publishedAt": "2026-02-10T00:00:00Z"
    },
    {
      "id": "src-03",
      "title": "Artigo - O futuro da economia brasileira",
      "url": "https://www.folha.uol.com.br/economia",
      "domain": "folha.uol.com.br",
      "reliabilityScore": 0.88,
      "publishedAt": "2026-08-01T00:00:00Z"
    }
  ],
  "processingTimeMs": 3840
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

export interface VerificationClaim {
  id: string;
  text: string;
  status: ClaimVerificationStatus;
  evidenceSummary: string;
  confidence: number;
}

export interface FactCheckingSource {
  id: string;
  title: string;
  url: string;
  domain: string;
  reliabilityScore: number;
  publishedAt?: string;
}

export interface AnalyzeResponse {
  videoId: string;
  analyzedAt: string;
  score: number; // 0 a 100
  classification: VerificationClassification;
  summary: string;
  claims: VerificationClaim[];
  sources: FactCheckingSource[];
  processingTimeMs: number;
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
**Ver também:** [Threat Model e Segurança](threat-model.md) — análise de riscos e conformidade LGPD.
