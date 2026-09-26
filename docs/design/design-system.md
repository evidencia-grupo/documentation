# Design System e Interface do Painel Lateral

## Nesta página

- [Visão Geral da Interface](#visao-geral-da-interface)
- [Tokens Visuais e Paleta de Cores](#tokens-visuais-e-paleta-de-cores)
- [Componentes da Extensão](#componentes-da-extensao)
  - [Badge de Acionamento no Player](#badge-de-acionamento-no-player)
  - [Painel Lateral (Side Panel)](#painel-lateral-side-panel)
  - [Indicador de Veracidade (Gauge / Velocímetro)](#indicador-de-veracidade-gauge-velocimetro)
  - [Card de Síntese Analítica](#card-de-sintese-analitica)
  - [Lista de Fontes e Referências](#lista-de-fontes-e-referencias)
- [Diretrizes de Acessibilidade (WCAG 2.1 AA)](#diretrizes-de-acessibilidade-wcag-21-aa)

---

## Visão Geral da Interface {: #visao-geral-da-interface }

A interface da extensão foi projetada para se integrar de forma natural ao ecossistema visual do YouTube, operando sob o padrão de tema escuro (*Dark Theme*) nativo da plataforma. O objetivo é oferecer máxima clareza com mínimo atrito cognitivo para usuários leigos.

![Interface do Painel Lateral da Extensão](../assets/mockup-painel-youtube.png)

---

## Tokens Visuais e Paleta de Cores {: #tokens-visuais-e-paleta-de-cores }

As cores e tipografias foram mapeadas para garantir contraste estrito e conformidade com o padrão WCAG 2.1 nível AA.

### Cores Estruturais (Tema Escuro)

| Token | Código Hex | Aplicação |
|:---|:---|:---|
| `--color-bg-canvas` | `#0F0F0F` | Fundo principal da página do YouTube |
| `--color-bg-surface` | `#1F1F1F` | Fundo do painel lateral e contêineres principais |
| `--color-bg-card` | `#272727` | Fundo dos cartões internos de justificativa e fontes |
| `--color-border-subtle` | `#3F3F3F` | Bordas e divisores estruturais |
| `--color-text-primary` | `#FFFFFF` | Títulos e dados quantitativos principais |
| `--color-text-secondary` | `#AAAAAA` | Descrições secundárias, metadados e legendas |

### Cores Semânticas de Veracidade

| Classificação | Código Hex | Faixa Percentual | Significado Editorial |
|:---|:---|:---|:---|
| **Verdadeiro / Apoiado** | `#2BA640` | 70% a 100% | Afirmações fundamentadas em consenso científico ou fontes institucionais |
| **Moderado / Controverso** | `#FBC02D` | 40% a 69% | Presença de extrapolações, dados desatualizados ou debate metodológico legítimo |
| **Falso / Inconclusivo** | `#E53935` | 0% a 39% | Afirmações explicitamente contraditas por evidências ou desprovidas de comprovação |

---

## Componentes da Extensão {: #componentes-da-extensao }

### Badge de Acionamento no Player {: #badge-de-acionamento-no-player }

- **Posicionamento:** Injetado via Content Script na área de metadados do vídeo ativo (`/watch`), ao lado dos dados do canal e botões de interação.
- **Estrutura:** Ícone de escudo institucional, texto `"Veracidade do vídeo: XX%"` e borda com a cor semântica do resultado.
- **Isolamento de Estilo:** O botão é renderizado em *Shadow DOM* aberto para impedir que o CSS global do YouTube desconfigure suas propriedades.

### Painel Lateral (Side Panel) {: #painel-lateral-side-panel }

- **Comportamento:** Desliza a partir da extremidade direita da tela ao ser acionado, sem redimensionar bruscamente o player de vídeo.
- **Isolamento:** Executado dentro de um `iframe` com atributo `sandbox` restrito, impedindo vazamento de scripts de terceiros e preservando a segurança.
- **Cabeçalho:** Contém o título `"Veracidade do vídeo"`, subtítulo contextual `"Análise de fontes e evidências"` e botão de fechamento com tecla de atalho (`Escape`).

### Indicador de Veracidade (Gauge / Velocímetro) {: #indicador-de-veracidade-gauge-velocimetro }

- **Visual:** Semicírculo graduado de 0% a 100% com arco tricolor contínuo (vermelho, amarelo, verde).
- **Indicador:** Ponteiro centralizado apontando para a nota final apurada pelo pipeline de inteligência artificial.
- **Legenda Central:** Texto de alto contraste indicando a porcentagem e a classificação em caixa alta (ex.: `"68% VERDADEIRO"`).

### Card de Síntese Analítica {: #card-de-sintese-analitica }

- **Título:** `"Por que essa veracidade?"` acompanhado de ícone informativo.
- **Texto:** Parágrafo em prosa corrida, em linguagem acessível e neutra, explicando os pontos de convergência factual e eventuais omissões ou alertas de incerteza encontrados nas alegações do vídeo.

### Lista de Fontes e Referências {: #lista-de-fontes-e-referencias }

- **Título:** `"Fontes utilizadas"`.
- **Itens:** Lista de cartões com hiperligações para cada evidência externa consultada.
- **Metadados:** Nome do órgão ou instituição (ex.: *Banco Mundial*, *FMI*, *Artigo Folha de S.Paulo*), acompanhado da URL encurtada.
- **Segurança:** Todas as hiperligações externas abrem obrigatoriamente em nova aba utilizando `target="_blank"` e atributo de proteção `rel="noopener noreferrer"`.

---

## Diretrizes de Acessibilidade (WCAG 2.1 AA) {: #diretrizes-de-acessibilidade-wcag-21-aa }

1. **Relação de Contraste:** Todos os textos de leitura obrigatória apresentam contraste superior a 4,5:1 em relação ao fundo escuro. Textos de grande porte e elementos gráficos ativos possuem contraste superior a 3:1.
2. **Navegabilidade por Teclado:** O foco sequencial (`Tab` e `Shift+Tab`) percorre todos os elementos interativos do painel de forma ordenada. O acionamento da tecla `Escape` encerra a visualização do painel imediatamente.
3. **Semântica para Leitores de Tela:** O velocímetro e cartões possuem descrições textuais associadas via atributos `aria-label` e `aria-describedby`, comunicando o percentual de veracidade a usuários de tecnologias assistivas sem depender unicamente de estímulos visuais.

---

**Próximo:** [Catálogo Consolidado de Requisitos](../requisitos/catalogo-requisitos.md) — especificações completas de RF e RNF.  
**Ver também:** [Personas e Jornadas](personas-e-jornadas.md) — perfis de usuários que orientam o design do produto.
