# Priorização e MVP

## Nesta página

- [Matriz MoSCoW](#matriz-moscow)
- [Sequenciador de Features (Lean Inception)](#sequenciador-de-features-lean-inception)
- [Funil de Priorização do Backlog](#funil-de-priorizacao-do-backlog)
- [Critérios de Exclusão e Limites de Escopo](#criterios-de-exclusao-e-limites-de-escopo)
- [Matriz de Revisão Técnica](#matriz-de-revisao-tecnica-o-que-como-fazer)
- [Resumo Executivo](#resumo-executivo)

---

## Matriz MoSCoW {: #matriz-moscow }

A classificação MoSCoW foi consolidada a partir da alocação de recursos da [Técnica dos 100 Dólares](../requisitos/elicitacao.md#etapa-4-100-dolares), estabelecendo os limites estritos do produto mínimo viável:

![Matriz MoSCoW da Votação](../assets/matriz-moscow-votacao.png)
*Figura: Matriz MoSCoW validada após a dinâmica da Técnica dos 100 Dólares com os participantes.*

| Prioridade | Item | Justificativa |
|:---|:---|:---|
| **Must Have** | RF-01, RF-02, RF-03, RF-06, RF-07, RF-08, RF-09, RNF-01 a RNF-07 | Sem esses itens não há produto funcional, seguro ou minimamente confiável — formam o Happy Path completo |
| **Should Have** | RF-04 (fontes com link direto), RF-11 (metadados temporais do vídeo) | Aumentam significativamente a credibilidade, mas o fluxo crítico funciona sem eles, ainda que com menor confiança |
| **Could Have** | RF-05 (retorno reflexivo), RF-10 (avaliação de relevância) | Já classificados como OUT pelo levantamento original ([HU11, HU12](../requisitos/backlog-e-historias.md#hu11)) |
| **Won't Have (agora)** | Suporte multi-idioma, sincronização de histórico entre dispositivos, dashboard de estatísticas de uso, suporte a outras plataformas (Instagram, TikTok) | Não mapeados no levantamento original; risco de dispersão de esforço — mantidos explicitamente fora para evitar ambiguidade |

---

## Sequenciador de Features (Lean Inception) {: #sequenciador-de-features-lean-inception }

A estruturação das ondas de entrega e a priorização executiva foram definidas diretamente no Sequenciador Lean Inception, demarcando as fronteiras entre a linha de corte do MVP e os incrementos seguintes:

![Sequenciador de Features Lean Inception](../assets/sequenciador-lean-inception.png)
*Figura: Sequenciador de Features estruturado em ondas contínuas de entrega (Lean Inception), com a demarcação explícita da linha de corte do MVP.*

| Onda | Features Contempladas | Esforço Técnico | Valor de Negócio |
|:---|:---|:---|:---|
| **Onda 1 — MVP** | F2.1 (Disparo e Exibição Acessível WCAG), F1.1 (Extração e Higienização de Transcrições), F1.2 (Motor de Checagem Factual e IA), F2.3 (Sinalização Visual de Incerteza), F2.2 (Auditoria de Fontes e Metadados) | **Alto** (pipeline IA + integração com player do YouTube + backend proxy + Shadow DOM) | **Alto** — valida a hipótese central de confiança do usuário na checagem factual |
| **Onda 2 — Incremento 1** | F1.3 (Cache Local e Otimização de Rede), F3.1 (Estímulo ao Pensamento Crítico), F3.2 (Avaliação e Feedback da Análise) | **Médio** (requer estruturação de armazenamento local e componentes interativos) | **Médio-Alto** — reforça retenção, engajamento analítico e redução de latência de rede |
| **Onda 3 — Incremento 2** | F3.3 (Recursos e Acessibilidade por Áudio / Text-to-Speech) | **Alto** (síntese vocal acessível e possíveis modelos adicionais de processamento) | **Médio** — ampliação da inclusão para usuários com baixa literacia ou deficiência visual severa |

---

## Funil de Priorização do Backlog {: #funil-de-priorizacao-do-backlog }

A passagem do escopo conceitual para a cadência operacional de engenharia adota o modelo de funil progressivo (Now, Next, Soon, Later), assegurando foco absoluto no valor prioritário e mitigando o risco de sobrecarga:

![Funil de Priorização do Backlog](../assets/funil-backlog.png)
*Figura: Funil estratégico de refinamento contínuo do Backlog — organizando a esteira de desenvolvimento de Now (MVP) até horizontes futuros (Later).*

- **Now (Linha do MVP):** Foco imediato na entrega dos Épicos E1, E2, E3 e E4 (disparo, transcrição, checagem e síntese categorizada).
- **Next (Incremento 1):** Introdução de cache local avançado com TTL ([ADR-003](../tecnico/decisoes/ADR-003-estrategia-cache-local.md)) e refinamento de metadados temporais.
- **Soon (Incremento 2):** Incorporação de perguntas reflexivas para fomento do pensamento crítico e avaliação de precisão.
- **Later (Visão Futura):** Transcrição de áudio via Whisper como contingência e integração com plataformas adicionais de vídeo.

---

## Critérios de Exclusão e Limites de Escopo {: #criterios-de-exclusao-e-limites-de-escopo }

A eficácia do produto depende da delimitação do que deliberadamente **não** será implementado no estágio atual. Os critérios de exclusão atuam como salvaguardas contra desvios de esforço, sobrecarga de usuário e riscos de segurança:

![Painel de Critérios de Exclusão](../assets/criterios-exclusao.png)
*Figura: Mapeamento visual dos critérios de exclusão, diretrizes de antipersonas e salvaguardas de integridade do produto.*

| Categoria | Diretriz Aplicada | Justificativa Técnica e de Produto |
|:---|:---|:---|
| **Dispositivos Móveis** | Não criar suporte inicial ao aplicativo móvel do YouTube | Extensões de navegador enfrentam severas restrições técnicas no mobile; o foco prioritário é o ecossistema desktop Chromium (Chrome, Edge, Brave). |
| **Proteção contra Abusos** | Bloqueio de raspagem de dados e testes em lote automatizados | Aplicação de limites estritos de taxa (*rate limiting*) no Backend Proxy para blindar o serviço contra ataques de negação de serviço e custos de IA. |
| **Sem Feedback de Contorno** | Jamais indicar parâmetros que facilitem driblar a detecção | Evitar que agentes disseminadores de desinformação utilizem a extensão como ferramenta de engenharia reversa para aperfeiçoar conteúdos enganosos. |
| **Vedação Clínica** | Não fornecer diagnósticos médicos ou prescrições individuais | A extensão avalia a sustentação científica de alegações de saúde, sem jamais emitir aconselhamento médico personalizado. |
| **Ergonomia e Concisão** | Proibição de textos longos e jargões herméticos | Usuários leigos e ocupados não leem blocos densos; a interface deve priorizar síntese visual, velocímetro intuitivo e leitura rápida. |

---

## Matriz de Revisão Técnica (O quê / Como fazer) {: #matriz-de-revisao-tecnica-o-que-como-fazer }

| Feature de Negócio | O quê (valor entregue) | Como fazer (estratégia técnica) |
|:---|:---|:---|
| **RF-01 — Acionar análise** | Botão visível na página de reprodução | Content script (Manifest V3) injetado condicionalmente em URLs `/watch`; botão renderizado em Shadow DOM para isolar estilos do YouTube |
| **RF-02 / RF-08 — Obter transcrição** | Extração automática de legendas, com alerta se ausentes | Interceptação das faixas de legenda expostas pelo player do YouTube (nativas/automáticas); tratamento de exceção local sem chamar o backend quando ausentes |
| **RF-03 / RF-06 — Síntese categorizada** | Painel lateral com evidências apoiam/contradizem/contextualizam | Painel renderizado em iframe sandbox (isolamento de CSS/JS); dados consumidos via `fetch` ao backend proxy, componentes de UI leves (ex.: Preact) |
| **RF-07 / RF-06 (UC-06) — Alerta de incerteza** | Badge de inconclusão quando há divergência entre fontes | Campo `status: apoiada \| contraditada \| inconclusiva` retornado pela API do backend, mapeado diretamente para o componente de badge |
| **RF-04 — Fontes com link direto** *(Onda 2)* | Cartões de evidência com hiperligação e metadados | Estrutura de dados da API já prevendo array de `sources[{titulo, url, dominio}]`; abertura via `window.open` em nova aba, sem afetar a aba ativa |
| **RF-09 — Cache local** | Recuperação instantânea de checagens recentes | `chrome.storage.local` com chave = hash do `videoId`, TTL configurável (ex.: 24h), invalidação automática em leitura expirada |
| **RF-11 — Metadados temporais** *(Onda 2)* | Data de publicação e canal exibidos no cabeçalho | Consumo da YouTube Data API (ou scraping controlado da página) no momento da extração da transcrição, cacheado junto ao resultado |
| **RNF-03 — Manifest V3 / multi-browser** | Compatibilidade Chrome, Edge, Brave | Service Worker para lógica de fundo (sem `background page` persistente); `host_permissions` restritos a `https://www.youtube.com/*` · [ADR-001](../tecnico/decisoes/ADR-001-manifest-v3.md) |
| **RNF-04 — Segurança de credenciais** | Nenhuma chave exposta no client | Todas as chamadas de IA/busca passam por um backend proxy autenticado (ex.: Node/Python); a extensão nunca armazena segredos |
| **RNF-05 — Privacidade (LGPD)** | Sem coleta de histórico geral | Apenas permissão `activeTab` + escopo `youtube.com`; nenhuma persistência de dados analíticos por padrão, cache local restrito ao escopo da extensão |
| **RNF-01 / RNF-02 — Performance** | Resposta em até 10s, TBT +50ms, RAM +80MB | Chamadas assíncronas com indicador de progresso desde o primeiro clique; lazy-loading do painel; monitoramento de bundle size do content script |
| **RNF-07 — Acessibilidade (WCAG AA)** | Interface hierarquizada e navegável por teclado | Uso de HTML semântico, contraste validado (ferramenta tipo axe-core em CI), foco gerenciado via `tabindex` no painel |

---

## Resumo Executivo {: #resumo-executivo }

!!! success "Resumo executivo"
    A **Onda 1 (MVP)** concentra 100% do valor de validação da hipótese central — confiança do usuário leigo na síntese apresentada — com o menor conjunto de features tecnicamente viável. As Ondas 2 e 3 são incrementais e não bloqueiam o lançamento inicial.

---

**Ver também:** [Arquitetura do Sistema](../tecnico/arquitetura.md) — componentes e decisões técnicas detalhadas.  
**Ver também:** [Casos de Uso](../requisitos/casos-de-uso.md) — fluxos detalhados de cada funcionalidade do MVP.
