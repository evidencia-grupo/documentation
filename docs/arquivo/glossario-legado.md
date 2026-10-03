# Glossário

Definições de todos os termos, siglas e abreviações utilizados na documentação da Extensão de Fact-Checking para YouTube.

---

## A

| Termo | Definição |
|:---|:---|
| **activeTab** | Permissão do Manifest V3 que concede acesso apenas à aba atualmente em foco, quando acionado pelo usuário — escopo mínimo para a extensão operar |
| **ADR** | *Architecture Decision Record* — registro formal de uma decisão arquitetural, incluindo contexto, alternativas consideradas e consequências. Ver [ADR-001](../tecnico/decisoes/ADR-001-manifest-v3.md) |
| **Alegação** | Afirmação factual extraída do texto da transcrição de um vídeo e submetida à análise de evidências |

## B

| Termo | Definição |
|:---|:---|
| **Backend Proxy** | Serviço intermediário seguro em Python FastAPI ([ADR-004](../tecnico/decisoes/ADR-004-stack-tecnologica.md)) que autentica e encaminha as requisições entre a extensão e as APIs de IA/busca, sem expor chaves de API ao cliente |
| **Badge** | Indicador visual destacado no painel lateral que sinaliza o status de uma alegação (apoiada, contraditada, inconclusiva) |

## C

| Termo | Definição |
|:---|:---|
| **Cache** | Armazenamento local temporário de resultados de análise, identificados pelo `videoId`, com TTL de 24h — evita reprocessamento e reduz latência |
| **Content Script** | Arquivo JavaScript injetado pela extensão nas páginas do YouTube (`/watch`), com acesso ao DOM da página para injetar UI e interceptar o `videoId` |
| **Could Have** | Nível de prioridade MoSCoW — funcionalidade desejável, mas explicitamente fora do MVP (ex.: HU11, HU12) |

## D

| Termo | Definição |
|:---|:---|
| **Degradação Segura** | Comportamento da extensão em situações de falha (sem transcrição, backend indisponível, tempo limite) — sempre resulta em mensagem clara, nunca em crash |
| **declarativeNetRequest** | API do MV3 que substitui `webRequest` para modificação de requisições de rede, de forma declarativa e sem acesso ao conteúdo das requisições |

## E

| Termo | Definição |
|:---|:---|
| **E1–E6** | Épicos do backlog — agrupamentos temáticos de histórias de usuário. Ver [Backlog por Épico](../requisitos/backlog-e-historias.md#backlog-do-produto-por-epico) |
| **Evidência** | Dado externo (artigo, pesquisa, fact-check) usado para apoiar, contradizer ou contextualizar uma alegação extraída do vídeo |

## G

| Termo | Definição |
|:---|:---|
| **Gherkin** | Linguagem estruturada para critérios de aceitação no formato `Dado / Quando / Então`, usada nos cenários de cada história de usuário |

## H

| Termo | Definição |
|:---|:---|
| **Happy Path** | Fluxo principal de uso sem falhas — o caminho "feliz" que o sistema deve garantir antes de tratar exceções |
| **HU** | História de Usuário — requisito funcional no formato: *"Como [persona], quero [ação], para que [benefício]"*. Numeradas de HU01 a HU12 |

## I

| Termo | Definição |
|:---|:---|
| **iFrame sandbox** | Elemento HTML com atributo `sandbox` que isola o painel lateral da extensão do CSS e JS do YouTube, prevenindo interferências visuais e de segurança |
| **Inconclusivo** | Status de análise quando não há evidências suficientes ou quando existem fontes legítimas com conclusões opostas — o sistema não arbitra um vencedor |

## K

| Termo | Definição |
|:---|:---|
| **KPI** | *Key Performance Indicator* — métrica de sucesso. Ver [KPIs do produto](../visao/alinhamento-estrategico.md#metricas-de-sucesso-kpis) |

## L

| Termo | Definição |
|:---|:---|
| **LGPD** | Lei Geral de Proteção de Dados (Brasil, Lei nº 13.709/2018) — equivalente ao GDPR europeu; impõe restrições à coleta e retenção de dados pessoais |
| **Legenda** | Faixa de texto sincronizada com o áudio de um vídeo do YouTube — pode ser nativa (criada pelo criador) ou automática (gerada por reconhecimento de voz) |
| **Lean Inception** | Metodologia de alinhamento de produto que usa o "Sequenciador de Features" para organizar entregas em ondas progressivas |

## M

| Termo | Definição |
|:---|:---|
| **Manifest V3 (MV3)** | Versão atual da especificação de extensões do Google Chrome, obrigatória para novas extensões na Chrome Web Store desde 2025. Ver [ADR-001](../tecnico/decisoes/ADR-001-manifest-v3.md) |
| **MoSCoW** | Método de priorização: **M**ust Have, **S**hould Have, **C**ould Have, **W**on't Have (agora). Ver [Matriz MoSCoW](../planejamento/priorizacao-e-mvp.md#matriz-moscow) |
| **Must Have** | Nível de prioridade MoSCoW mais alto — sem esses itens o produto não funciona de forma mínima viável |

## O

| Termo | Definição |
|:---|:---|
| **Onda** | Agrupamento de features em entregas progressivas no Sequenciador de Features (Onda 1 = MVP, Onda 2 = Incremento 1, etc.) |

## P

| Termo | Definição |
|:---|:---|
| **Painel Lateral** | Interface da extensão renderizada ao lado do player do YouTube, exibindo a síntese de evidências e fontes |
| **Persona** | Representação arquetípica de um grupo de usuários com necessidades e comportamentos similares. Ver [Personas](../design/personas-e-jornadas.md) |

## R

| Termo | Definição |
|:---|:---|
| **RF** | Requisito Funcional — descreve o que o sistema **faz** (ex.: RF-01: acionar análise com um clique) |
| **RNF** | Requisito Não Funcional — descreve **como** o sistema deve se comportar (performance, segurança, acessibilidade) |

## S

| Termo | Definição |
|:---|:---|
| **Service Worker** | Componente de fundo do MV3 que substitui a `background page` persistente; gerenciado pelo browser, encerrado quando ocioso e reativado quando necessário |
| **Should Have** | Nível de prioridade MoSCoW — importante, mas o MVP funciona sem esse item (ex.: RF-04 fontes com link direto) |
| **SLA** | *Service Level Agreement* — compromisso de nível de serviço. No contexto deste produto: resultado útil em ≤ 10 segundos (RNF-01) |
| **Síntese** | Resultado final da análise: lista de alegações categorizadas (apoiadas, contraditadas, inconclusivas) com fontes |

## T

| Termo | Definição |
|:---|:---|
| **TBT** | *Total Blocking Time* — métrica de performance web (Core Web Vitals); mede quanto tempo o thread principal fica bloqueado durante o carregamento. Limite: +50 ms (RNF-02) |
| **Transcrição** | Texto completo do áudio de um vídeo, obtido via faixas de legenda do YouTube player |
| **TTL** | *Time to Live* — tempo de validade de um dado em cache. Valor padrão: 24h |

## U

| Termo | Definição |
|:---|:---|
| **UC** | Caso de Uso (*Use Case*) — especificação de um fluxo de interação entre atores e o sistema. Numerados de UC-01 a UC-06. Ver [Casos de Uso](../requisitos/casos-de-uso.md) |

## V

| Termo | Definição |
|:---|:---|
| **videoId** | Identificador único de um vídeo no YouTube (parâmetro `v` na URL `/watch?v=<videoId>`), usado como chave de cache e de referência no pipeline |

## W

| Termo | Definição |
|:---|:---|
| **WCAG AA** | *Web Content Accessibility Guidelines* nível AA — padrão internacional de acessibilidade digital; exige contraste mínimo de 4,5:1 para texto normal e navegação por teclado |
| **Won't Have** | Nível de prioridade MoSCoW — fora do escopo atual, documentado explicitamente para evitar scope creep (ex.: suporte multi-plataforma) |
