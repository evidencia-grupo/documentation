# ADR-004 — Definição da Stack Tecnológica (Extensão, Backend Proxy e Monorepo)

| Campo | Valor |
|:---|:---|
| **Status** | Aceito |
| **Data** | 2026-09 |
| **Autores** | Equipe de Engenharia |
| **Revisores** | Comitê Técnico de Arquitetura |

---

## Contexto

A solução de Fact-Checking para YouTube demanda a integração de dois subsistemas com características operacionais distintas:

1. **Extensão de Navegador (Manifest V3):** Executada no contexto do cliente, injetada na página de reprodução (`/watch`) do YouTube. Precisa cumprir requisitos rigorosos de desempenho, mantendo o Total Blocking Time (TBT) adicional abaixo de 50 milissegundos e consumo de memória RAM inferior a 80 MB ([RNF-02](../../requisitos/catalogo-requisitos.md#rnf-02)), além de garantir acessibilidade WCAG 2.1 AA ([RNF-07](../../requisitos/catalogo-requisitos.md#rnf-07)) e resposta visual em menos de 1 segundo ([RNF-01](../../requisitos/catalogo-requisitos.md#rnf-01)).
2. **Backend Proxy:** Serviço de intermediação que gerencia credenciais de provedores de IA, efetua controle de taxa (*Rate Limiting*), valida requisições e orquestra chamadas concorrentes a modelos de linguagem e bases de checagem ([ADR-002](ADR-002-backend-proxy.md)), operando sob timeout estrito de 8,0 segundos.

Foi necessário selecionar as linguagens, frameworks, ferramentas de build e padrão de organização de repositório para viabilizar o desenvolvimento ágil em 2 semanas com uma equipe de 5 engenheiros.

---

## Decisão

Adotar a seguinte composição tecnológica e arquitetural:

1. **Frontend da Extensão:** **Preact 10 + TypeScript 5 + Vite 5**
   - **Content Script:** TypeScript compilado via Vite, injetando o botão de veracidade no player do YouTube encapsulado em **Shadow DOM** para total isolamento de CSS e eventos.
   - **Service Worker:** TypeScript no padrão Manifest V3 ([ADR-001](ADR-001-manifest-v3.md)) gerenciando requisições HTTPS e cache local (`chrome.storage.local`, [ADR-003](ADR-003-estrategia-cache-local.md)).
   - **Painel Lateral:** Aplicação Preact com componentes funcionais e hooks, renderizada em `iframe` com atributo `sandbox="allow-scripts"` e comunicação via protocolo seguro `postMessage`.
2. **Backend Proxy:** **Python 3.12+ com FastAPI, Pydantic v2 e Uvicorn**
   - **FastAPI + Uvicorn:** Servidor assíncrono ASGI de alta performance para concorrência de chamadas I/O com motores de busca e modelos de linguagem.
   - **Pydantic v2:** Validação determinística de contratos em tempo de execução com núcleo em Rust, assegurando conformidade estrita com o payload da API.
   - **SlowAPI:** Middleware de controle de vazão (*Rate Limiting*) configurado para 60 requisições por minuto por cliente.
   - **Controle de Timeout:** Timeout global assíncrono de 8,0 segundos por requisição de análise, garantindo margem para o SLA de 10 segundos no cliente ([RNF-01](../../requisitos/catalogo-requisitos.md#rnf-01)).
3. **Contratos e Topologia do Repositório:** **Monorepo com Contratos Compartilhados**
   - Repositório único contendo `extension/`, `backend/` e `shared/`.
   - `shared/schemas/api-schema.json` e `shared/types/api.ts` atuam como fonte única da verdade para tipagem e validação entre cliente TypeScript e servidor Python.

---

## Alternativas Consideradas

### Frontend da Extensão

#### Alternativa A — Preact 10 + TypeScript + Vite (Escolhida)

| Vantagens | Desvantagens |
|:---|:---|
| Footprint ultraleve: ~20 KB de bundle total (~8 KB gzipped) vs ~45 KB+ do React | Ecossistema de bibliotecas terceiras ligeiramente menor que o React tradicional (irrelevante para o escopo do MVP) |
| Virtual DOM otimizado com impacto desprezível na thread principal (TBT < 50ms) | Requer configuração de alias JSX (`preact/compat`) caso bibliotecas externas React sejam introduzidas futuramente |
| Compatibilidade completa com modelos mentais e hooks modernos do React (`useState`, `useEffect`) | — |
| Vite oferece compilação rápida com suporte a múltiplos pontos de entrada (*multi-entry*) | — |

#### Alternativa B — React 18/19 + Vite

| Vantagens | Desvantagens |
|:---|:---|
| Padrão hegemônico de mercado com maior disponibilidade de componentes prontos | Bundle volumoso (> 45 KB gzipped), aumentando o tempo de inicialização da extensão |
| Suporte nativo amplo | Maior sobrecarga de memória RAM, arriscando estourar o teto de 80 MB em abas pesadas do YouTube |

**Veredito:** Rejeitada para priorizar a estrita conformidade com o SLA de performance ([RNF-02](../../requisitos/catalogo-requisitos.md#rnf-02)).

#### Alternativa C — Vanilla TypeScript (Sem Framework)

| Vantagens | Desvantagens |
|:---|:---|
| Zero overhead de biblioteca externa; tamanho de bundle mínimo | Complexidade e verbosidade elevadas para gerenciar estados reativos (animação do velocímetro, abas de fontes, filtros) |
| Controle manual absoluto do DOM | Maior probabilidade de bugs de sincronização de interface sob prazo de 2 semanas |

**Veredito:** Rejeitada por elevar o custo de manutenção da interface sem ganho perceptível sobre o Preact.

---

### Backend Proxy

#### Alternativa A — Python 3.12+ com FastAPI e Pydantic v2 (Escolhida)

| Vantagens | Desvantagens |
|:---|:---|
| Sinergia nativa com todo o ecossistema de IA e NLP (LangChain, LlamaIndex, SDKs oficiais da OpenAI/Gemini/Anthropic, Whisper) | Consumo de memória em repouso ligeiramente superior a linguagens compiladas como Go |
| Validação de dados ultrarrápida via Pydantic v2 com motor central compilado em Rust | Requer gestão disciplinada de ambientes virtuais e dependências |
| Programação assíncrona nativa (`async`/`await`) com Starlette, ideal para chamadas concorrentes a APIs externas | — |
| Geração automática de especificação OpenAPI / Swagger alinhada a `contrato-api.md` | — |

#### Alternativa B — Node.js com Fastify ou Express

| Vantagens | Desvantagens |
|:---|:---|
| Mesma linguagem do frontend (TypeScript unificado ponta a ponta) | Ecossistema de bibliotecas avançadas de IA e processamento de linguagem natural é inferior ao Python |
| Rápida inicialização e excelente vazão de I/O assíncrono | Validação de schemas em runtime exige bibliotecas adicionais como Zod ou TypeBox com overhead de configuração |

**Veredito:** Rejeitada por afastar o backend das principais ferramentas e bibliotecas de inteligência artificial vigentes.

#### Alternativa C — Go (Gin ou Fiber)

| Vantagens | Desvantagens |
|:---|:---|
| Binário estático compilado com consumo mínimo de recursos | Ecossistema incipiente e bibliotecas de IA pouco maduras para orquestração semântica |
| Concorrência imbatível via goroutines | Maior tempo de desenvolvimento para manipulação dinâmica de prompts e payloads JSON complexos |

**Veredito:** Rejeitada devido ao ciclo curto de desenvolvimento e necessidade de flexibilidade nos conectores de LLM.

---

### Estrutura do Repositório

#### Alternativa A — Monorepo (`extension/`, `backend/`, `shared/`) (Escolhida)

| Vantagens | Desvantagens |
|:---|:---|
| Sincronização atômica de contratos de API e schemas entre cliente e servidor | Esteira de CI precisa coordenar testes em múltiplos ecossistemas (Node.js e Python) |
| Visibilidade unificada para toda a equipe durante as sprints | — |
| Facilidade de clonagem e setup para novos contribuidores | — |

#### Alternativa B — Polyrepo (Repositórios Separados)

| Vantagens | Desvantagens |
|:---|:---|
| Isolamento estrito de dependências e esteiras de CI/CD independentes | Risco de dessincronização de contratos de API e maior fricção na revisão de PRs interdependentes |
| Menor acoplamento inicial | Sobrecarga de gestão de múltiplos repositórios sob prazo de 2 semanas |

**Veredito:** Rejeitada para garantir alinhamento contínuo entre frontend e backend.

---

## Consequências

### Positivas

- **Desempenho Assegurado no Cliente:** O bundle do Preact mantém a extensão leve, assegurando TBT < 50ms e resposta inicial visual em menos de 1 segundo.
- **Robustez no Tratamento de Dados:** Pydantic v2 impede que payloads inconsistentes propaguem erros no pipeline de IA, garantindo retorno HTTP 422 descritivo.
- **Produtividade Acelerada:** A equipe pode reutilizar tipos TypeScript e schemas JSON compartilhados, evitando retrabalho de comunicação.
- **Preparação para o Futuro:** O ecossistema Python facilita a incorporação de novos modelos de IA, módulos de transcrição via Whisper e técnicas de RAG em ondas subsequentes.

### Negativas e Mitigações

| Consequência | Mitigação |
|:---|:---|
| Duplicidade de ecossistemas (Node.js/npm para extensão e Python/pip para backend) | O script de CI (`ci.yml`) foi modularizado em etapas independentes com cache de pacotes, e o `guia-contribuicao.md` detalha o setup isolado de cada componente. |
| Curva de integração assíncrona entre Preact e Service Worker via `postMessage` | Estabelecimento de protocolo estruturado de mensagens com validação de origem e canais tipados em `shared/types/api.ts`. |

---

## Rastreabilidade com Requisitos do Sistema

- [RNF-01 — Desempenho e Tempo de Resposta](../../requisitos/catalogo-requisitos.md#rnf-01): Suportado por FastAPI async (timeout de 8,0s) e Preact (renderização rápida).
- [RNF-02 — Impacto Mínimo na Página do YouTube](../../requisitos/catalogo-requisitos.md#rnf-02): Garantido pelo bundle diminuto do Preact (~20 KB) e isolamento via Shadow DOM.
- [RNF-03 — Compatibilidade e Padrão Manifest V3](../../requisitos/catalogo-requisitos.md#rnf-03): Viabilizado pela compilação multi-entry do Vite para Service Worker e Content Script.
- [RNF-04 — Segurança e Gestão de Credenciais](../../requisitos/catalogo-requisitos.md#rnf-04): Chaves de API estritamente contidas no ambiente Python FastAPI.
- [RNF-07 — Acessibilidade WCAG 2.1 AA](../../requisitos/catalogo-requisitos.md#rnf-07): Componentes Preact estilizados com foco explícito, suporte a leitores de tela e contraste >= 4.5:1.

---

**Referências:**

- [ADR-001 — Uso de Manifest V3](ADR-001-manifest-v3.md)
- [ADR-002 — Intermediação via Backend Proxy Dedicado](ADR-002-backend-proxy.md)
- [ADR-003 — Estratégia de Armazenamento em Cache Local](ADR-003-estrategia-cache-local.md)
- [Arquitetura do Sistema](../arquitetura.md)
- [Contrato de Dados e Especificação da API](../contrato-api.md)
- [Preact Documentation](https://preactjs.com/)
- [FastAPI Framework](https://fastapi.tiangolo.com/)
