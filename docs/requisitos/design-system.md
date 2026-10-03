# Design System e Interface do Painel Lateral

!!! note "Alinhamento Evidence-First (2026-10-02):"
    Conforme deliberado no [ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md), o componente `Gauge.tsx` (velocímetro numérico 0–100%) foi removido da UX principal para evitar vereditos algorítmicos. O painel passa a estruturar a experiência em torno de **Alegações Atômicas**, **Cartões de Evidência** com relação explícita e **Perguntas para Reflexão Crítica** (HU11/HU15).

## Nesta página

- [Visão Geral da Interface](#visao-geral-da-interface)
- [Tokens Visuais e Paleta de Cores](#tokens-visuais-e-paleta-de-cores)
- [Componentes da Extensão](#componentes-da-extensao)
  - [Badge de Acionamento no Player](#badge-de-acionamento-no-player)
  - [Painel Lateral (Side Panel)](#painel-lateral-side-panel)
  - [Cartões de Alegações (Claim Cards)](#cartoes-de-alegacoes-claim-cards)
  - [Cartões de Evidências (Evidence Cards)](#cartoes-de-evidencias-evidence-cards)
  - [Bloco de Incerteza e Limitações](#bloco-de-incerteza-e-limitacoes)
  - [Bloco de Perguntas para Reflexão Crítica](#bloco-de-perguntas-para-reflexao-critica)
  - [Lista de Fontes e Provenance](#lista-de-fontes-e-provenance)
- [Diretrizes de Acessibilidade (WCAG 2.1 AA)](#diretrizes-de-acessibilidade-wcag-21-aa)

---

## Visão Geral da Interface {: #visao-geral-da-interface }

A interface da extensão foi projetada para se integrar de forma natural ao ecossistema visual do YouTube, operando sob o padrão de tema escuro (*Dark Theme*) nativo da plataforma. O objetivo central é fornecer **investigação assistida** com mínimo atrito cognitivo, permitindo ao usuário examinar evidências e formular suas próprias conclusões.

![Interface do Painel Lateral da Extensão](../assets/mockup-painel-youtube.png)

---

## Tokens Visuais e Paleta de Cores {: #tokens-visuais-e-paleta-de-cores }

As cores e tipografias foram mapeadas para garantir contraste estrito e conformidade com o padrão WCAG 2.1 nível AA.

### Cores Estruturais (Tema Escuro)

| Token | Código Hex | Aplicação |
|:---|:---|:---|
| `--color-bg-canvas` | `#0F0F0F` | Fundo principal da página do YouTube |
| `--color-bg-surface` | `#1F1F1F` | Fundo do painel lateral e contêineres principais |
| `--color-bg-card` | `#272727` | Fundo dos cartões de alegação, evidências e perguntas |
| `--color-border-subtle` | `#3F3F3F` | Bordas e divisores estruturais |
| `--color-text-primary` | `#FFFFFF` | Títulos e dados textuais principais |
| `--color-text-secondary` | `#AAAAAA` | Descrições secundárias, metadados e legendas |

### Cores Semânticas de Relação Factual e Incerteza

| Relação / Estado | Código Hex | Aplicação Visual | Significado Editorial |
|:---|:---|:---|:---|
| **Sustenta (`supports`)** | `#2BA640` | Borda/ícone de evidência corroborativa | Evidência externa confirma ou apoia a alegação factual |
| **Contradiz (`contradicts`)** | `#E53935` | Borda/ícone de evidência refutadora | Evidência externa contesta ou contradiz a alegação factual |
| **Contextualiza (`contextualizes`)** | `#FBC02D` | Borda/ícone de contexto temporal/metodológico | Evidência adiciona contexto relevante sem refutar diretamente |
| **Sem evidência suficiente (`insufficient_evidence`)** | `#757575` | Badge neutro em tom cinza | Ausência de fontes catalogadas no corpus; não implica falsidade |

---

## Componentes da Extensão {: #componentes-da-extensao }

### Badge de Acionamento no Player {: #badge-de-acionamento-no-player }

- **Posicionamento:** Injetado via Content Script na área de metadados do vídeo ativo (`/watch`), ao lado dos dados do canal e botões de interação.
- **Estrutura:** Ícone institucional da extensão e texto `"Investigar com EvidencIA"`.
- **Isolamento de Estilo:** O botão é renderizado em *Shadow DOM* aberto para impedir que o CSS global do YouTube interfira em sua apresentação.

### Painel Lateral (Side Panel) {: #painel-lateral-side-panel }

- **Comportamento:** Desliza a partir da extremidade direita da tela ao ser acionado, sem redimensionar bruscamente o player de vídeo.
- **Isolamento:** Executado dentro de contêiner Shadow DOM / Preact isolado, impedindo conflitos de estilo.
- **Cabeçalho:** Contém o título `"EvidencIA — Investigação do Vídeo"`, nome do canal, data original de publicação do vídeo e botão de fechamento com atalho (`Escape`).

### Cartões de Alegações (Claim Cards) {: #cartoes-de-alegacoes-claim-cards }

- **Estrutura:** Cada alegação verificável extraída da transcrição recebe um cartão individualizado com seu texto transcrito e contexto temporal.
- **Ausência de Veredito:** O cartão não apresenta notas agregadas de 0 a 100% nem rótulos dogmáticos.
- **Interatividade:** O usuário pode expandir o cartão para visualizar as evidências específicas e as perguntas de reflexão associadas.

### Cartões de Evidências (Evidence Cards) {: #cartoes-de-evidencias-evidence-cards }

- **Estrutura:** Cartão interno para cada evidência recuperada contendo a tag de relação (Sustenta, Contradiz ou Contextualiza).
- **Metadados Obrigatórios:** Título da checagem/pesquisa, entidade publicadora (publisher), data de publicação e hiperligação direta.
- **Segurança:** Todas as hiperligações externas abrem obrigatoriamente em nova aba utilizando `target="_blank"` e atributo de proteção `rel="noopener noreferrer"`.

### Bloco de Incerteza e Limitações {: #bloco-de-incerteza-e-limitacoes }

- **Título:** `"O que ainda não sabemos"`.
- **Estrutura:** Lista em destaque alertando sobre alegações sem evidência suficiente no corpus atual, marcos temporais anacrônicos ou ausência de fontes primárias.

### Bloco de Perguntas para Reflexão Crítica {: #bloco-de-perguntas-para-reflexao-critica }

- **Título:** `"Perguntas para você"`.
- **Estrutura:** Lista de no mínimo 3 perguntas orientadoras neutras (ex.: *"Qual é a fonte original desta alegação?"*, *"Esta informação ainda é atual?"*, *"Existe evidência independente?"*).
- **Propósito:** Estimular o pensamento crítico e a autonomia do usuário antes da formulação de sua conclusão.

### Lista de Fontes e Provenance {: #lista-de-fontes-e-provenance }

- **Título:** `"Fontes e Provenance"`.
- **Metadados de Provenance:** Identificação do corpus consultado (ex.: *FactChecks.br*), data da indexação e identificador do registro.

---

## Diretrizes de Acessibilidade (WCAG 2.1 AA) {: #diretrizes-de-acessibilidade-wcag-21-aa }

1. **Relação de Contraste:** Todos os textos de leitura obrigatória apresentam contraste superior a 4,5:1 em relação ao fundo escuro. Textos de grande porte e elementos gráficos ativos possuem contraste superior a 3:1.
2. **Navegabilidade por Teclado:** O foco sequencial (`Tab` e `Shift+Tab`) percorre todos os elementos interativos do painel de forma ordenada. O acionamento da tecla `Escape` encerra a visualização do painel imediatamente.
3. **Semântica para Leitores de Tela:** Os cartões de alegações, evidências e perguntas possuem descrições textuais associadas via atributos `aria-label` e `aria-describedby`, comunicando as relações factuais sem depender unicamente de estímulos cromáticos.

---

**Próximo:** [Catálogo Consolidado de Requisitos](catalogo-requisitos.md) — especificações completas de RF e RNF.  
**Ver também:** [Personas e Jornadas](personas-e-jornadas.md) — perfis de usuários que orientam o design do produto.
