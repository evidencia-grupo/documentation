# ADR-003 — Estratégia de Armazenamento em Cache Local

| Campo | Valor |
|:---|:---|
| **Status** | Aceito |
| **Data** | 2026-09 |
| **Autores** | Equipe de Engenharia |
| **Revisores** | Comitê Técnico de Arquitetura |

---

## Contexto

A verificação de um vídeo envolve a extração de legendas, inferência em modelo de linguagem e agregação de buscas factuais. Esse fluxo possui custo financeiro por requisição e consome tempo de processamento. Quando um usuário assiste novamente a um vídeo ou navega entre capítulos da mesma reprodução, reprocessar a análise geraria desperdício de recursos e degradaria a experiência de uso.

Foi necessário definir a tecnologia e a estratégia de armazenamento temporário dos resultados de análise no lado do cliente.

---

## Decisão

**Adotar a API `chrome.storage.local`** como repositório de cache local da extensão, estruturado com chave indexada pelo identificador do vídeo (`videoId`) e validade temporal (*Time-to-Live* - TTL) de **24 horas**, com descarte preguiçoso (*lazy invalidation*).

---

## Alternativas Consideradas

### Alternativa A — `chrome.storage.local` (Escolhida)

| Vantagens | Desvantagens |
|:---|:---|
| API nativa do ecossistema de extensões Chromium, com suporte nativo em Service Workers | Capacidade padrão de 10 MB (extensível via permissão `unlimitedStorage` se necessário) |
| Acesso assíncrono baseado em Promises, sem bloquear a thread principal | Apenas armazenamento chave-valor simples (suficiente para o nosso caso de uso) |
| Totalmente isolada por perfil de usuário e restrita ao contexto da extensão | Sem recursos de busca textual complexa dentro do storage |
| Dados não saem do dispositivo, atendendo plenamente à LGPD ([RNF-05](../../requisitos/catalogo-requisitos.md#rnf-05)) | — |

### Alternativa B — IndexedDB no Navegador

| Vantagens | Desvantagens |
|:---|:---|
| Capacidade de armazenamento volumosa (centenas de megabytes) | Complexidade de implementação substancialmente superior para um modelo simples chave-valor |
| Suporte a índices avançados e transações relacionais | Inicialização mais lenta e maior sobrecarga de memória na aba ativa |
| — | Excesso de engenharia (*overengineering*) para o escopo do MVP |

**Veredito:** Rejeitada para o MVP por adicionar complexidade desnecessária sem ganho prático para recuperação de payloads JSON estruturados.

### Alternativa C — `chrome.storage.sync` (Sincronização em Nuvem do Google)

| Vantagens | Desvantagens |
|:---|:---|
| Sincronização automática entre diferentes dispositivos do mesmo usuário | **Quota Severa:** Limite de 100 KB no total e 8 KB por item (um payload de análise com transcrição ultrapassa esse teto) |
| — | Violaria a diretriz de privacidade estrita, expondo histórico de vídeos em infraestrutura de sincronização |

**Veredito:** Rejeitada por restrições técnicas intransponíveis de quota e conformidade de privacidade.

### Alternativa D — Cache Centralizado no Servidor (Backend Cache)

| Vantagens | Desvantagens |
|:---|:---|
| Economia global de chamadas a provedores de IA entre múltiplos usuários que assistem ao mesmo vídeo | Requer persistência em banco de dados centralizado e infraestrutura de Redis/Postgres |
| — | Não elimina a latência de rede no navegador (o usuário ainda precisa aguardar o *roundtrip* HTTPS) |

**Veredito:** Mantida como otimização complementar para o Backend Proxy na Onda 2, mas não substitui a necessidade do cache local no dispositivo do usuário para entrega instantânea (< 100ms).

---

## Consequências

### Positivas

- **Entrega Imediata de Análise (Cache Hit):** Em vídeos já consultados no período de 24 horas, o painel é renderizado em menos de 100 milissegundos, superando com ampla folga o SLA de 10 segundos ([RNF-01](../../requisitos/catalogo-requisitos.md#rnf-01)).
- **Economia Significativa de Quotas:** Redução drástica no número de requisições enviadas ao backend proxy e aos provedores de inferência.
- **Conformidade com a LGPD:** O cache local pertence unicamente ao dispositivo do usuário; nenhum registro histórico de visualizações é mantido no servidor.
- **Ciclo de Vida Limpo:** A lógica de *lazy invalidation* descarta registros expirados na própria leitura, sem necessidade de processos em background consumindo bateria do dispositivo.

### Negativas e Mitigações

| Consequência | Mitigação |
|:---|:---|
| Limite padrão de 10 MB do `chrome.storage.local` | O payload médio de análise possui ~5 KB. Com 10 MB, é possível armazenar até 2.000 análises simultâneas, capacidade muito superior à demanda diária média. |
| Informação factual desatualizada durante o período do TTL | Validade de 24 horas definida como equilíbrio ideal entre economia de chamadas e frescor da informação. Na Onda 2, um botão de "Forçar Reanálise" será introduzido para permitir invalidação manual. |

---

**Referências:**

- [Catálogo Consolidado de Requisitos — RF-09 e RNF-01](../../requisitos/catalogo-requisitos.md#rf-09)
- [Arquitetura do Sistema](../arquitetura.md)
- [Chrome for Developers — chrome.storage API](https://developer.chrome.com/docs/extensions/reference/api/storage)
