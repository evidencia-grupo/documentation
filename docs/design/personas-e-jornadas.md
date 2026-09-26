# Personas e Jornadas de Usuário

## Nesta página

- [Personas Primárias](#personas-primarias)
- [Personas Secundárias](#personas-secundarias-uso-ocasional)
- [Antipersonas e Critérios de Exclusão](#antipersonas)
- [Jornadas do Usuário](#jornadas-do-usuario)
  - [Jornada AS-IS (Sem a Extensão)](#as-is-jornada-atual-sem-a-extensao)
  - [Jornada TO-BE (Com a Extensão)](#to-be-jornada-proposta-com-a-extensao)

> **Nota:** Os diagramas de jornada abaixo utilizam a sintaxe `journey` do Mermaid, suportada nativamente no tema Material para MkDocs.

---

## Personas Primárias {: #personas-primarias }

### Persona 01: Dona Lurdes (Consumidora Leiga de Conteúdo) {: #dona-lurdes }

| Atributo | Detalhes |
|:---|:---|
| **Identificação** | 70 anos, aposentada |
| **Letramento Digital** | Baixo a nulo. Concluiu ensino médio; utiliza o celular e o computador com o auxílio de netos para acessar WhatsApp, Facebook e YouTube |
| **Contexto de Uso** | Diabética com preocupação constante sobre saúde. Assiste a vídeos recomendados com títulos apelativos prometendo receitas e curas milagrosas antes de repassar a familiares |
| **Dores Centrais** | Intimidada por termos médicos e científicos complexos; receio de disseminar desinformação prejudicial; frustração com a lentidão e divergência de resultados em buscas manuais |
| **Objetivos no Produto** | Veredito rápido, visual e em linguagem estritamente simples (sem jargões técnicos) diretamente na página do vídeo |
| **Rastreabilidade** | [HU01, HU02](../requisitos/backlog-e-historias.md#hu01), [UC-01](../requisitos/casos-de-uso.md#uc-01) |

### Persona 02: Amanda (Estudante Universitária) {: #amanda }

| Atributo | Detalhes |
|:---|:---|
| **Identificação** | 23 anos, estudante de Psicologia |
| **Letramento Digital** | Intermediário. Utiliza tablets e notebooks diariamente para estudos acadêmicos e pesquisa de artigos científicos |
| **Contexto de Uso** | Consome palestras e vídeos de divulgação científica no YouTube para complementar fichamentos e trabalhos de neurociência e comportamento |
| **Dores Centrais** | Perda de tempo ao alternar abas para verificar afirmações e medo de citar premissas falsas ou pseudocientíficas em apresentações acadêmicas |
| **Objetivos no Produto** | Análise e categorização factual em até 10 segundos, estruturando o que é apoiado por evidências científicas e o que é infundado |
| **Rastreabilidade** | [HU03, HU04](../requisitos/backlog-e-historias.md#hu03), [UC-03](../requisitos/casos-de-uso.md#uc-03) |

### Persona 03: Mariana Oliveira (Professora e Multiplicadora) {: #mariana }

| Atributo | Detalhes |
|:---|:---|
| **Identificação** | 35 anos, professora de ensino fundamental na rede pública |
| **Letramento Digital** | Intermediário. Navega com desenvoltura em ferramentas pedagógicas e aplicativos de comunicação |
| **Contexto de Uso** | Busca informações sobre saúde, prevenção e temas comunitários; frequente compartilhamento com grupos de pais e colegas de trabalho |
| **Dores Centrais** | Ansiedade em relação à responsabilidade social de suas mensagens; dificuldade de distinguir temas de controvérsia científica legítima de boatos fabricados |
| **Objetivos no Produto** | Sinalização visual instantânea quando houver carência de dados ou fontes em divergência, evitando o compartilhamento precipitado |
| **Rastreabilidade** | [HU09, HU10](../requisitos/backlog-e-historias.md#hu09), [UC-06](../requisitos/casos-de-uso.md#uc-06) |

---

## Personas Secundárias (Uso Ocasional) {: #personas-secundarias-uso-ocasional }

| Persona | Perfil e Ocupação | Foco de Interação | Rastreabilidade |
|:---|:---|:---|:---|
| **Carlos Augusto** {: #carlos-augusto } | 29 anos, analista de qualidade em cooperativa de tecnologia social | Validação de transcrições completas, precisão temporal e recuperação instantânea via cache local | [HU05, HU06](../requisitos/backlog-e-historias.md#hu05) |
| **Mayara** {: #mayara } | 34 anos, jornalista investigativa | Auditoria rigorosa de fontes primárias com hiperligações diretas e verificação de contexto temporal da publicação | [HU07, HU08](../requisitos/backlog-e-historias.md#hu07) |
| **Helena** {: #helena } | 54 anos, assistente administrativo | Questionamentos reflexivos e avaliação voluntária de utilidade da inferência (funcionalidades pós-MVP) | [HU11, HU12](../requisitos/backlog-e-historias.md#hu11) |

---

## Antipersonas e Critérios de Exclusão {: #antipersonas }

A definição formal de antipersonas orienta os limites de escopo do produto e impede o desvio para funcionalidades não prioritárias:

![Painel de Critérios de Exclusão e Antipersonas](../assets/criterios-exclusao.png)
*Figura: Mapeamento de critérios de exclusão, diretrizes de antipersonas e salvaguardas de integridade do produto.*

### Lucas Ferreira (38 anos, Criador de Conteúdo Sensacionalista)
- **Perfil:** Opera em ecossistema de engajamento acelerado, focado em monetização orgânica através de pânico moral e visualizações.
- **Risco de Mau Uso:** Buscaria utilizar o produto para encontrar brechas editoriais ou obter validações unilaterais.
- **Diretriz de Produto:** O sistema não fornece relatórios de contorno algorítmico nem atua como selo de aprovação política. Em temas com divergência legítima, ambas as correntes são apresentadas neutralmente.

### Rodrigo (38 anos, Consumidor Exclusivamente Mobile)
- **Perfil:** Operário fabril com rotina intensa; consome YouTube Shorts exclusivamente em smartphone no transporte público.
- **Diretriz de Produto:** O produto não disponibilizará arquitetura complexa para navegadores móveis no MVP, concentrando-se integralmente no ecossistema desktop Chromium (Chrome, Edge e Brave).

### Usuário em Busca de Aconselhamento Clínico
- **Perfil:** Indivíduo buscando substituição de diagnóstico presencial para quadros agudos.
- **Diretriz de Produto:** O sistema recusa formalmente qualquer caráter de diagnóstico médico, prescrição terapêutica ou consultoria em saúde individualizada.

---

## Jornadas do Usuário {: #jornadas-do-usuario }

### Jornada AS-IS (Sem a Extensão) — Dona Lurdes {: #as-is-jornada-atual-sem-a-extensao }

```mermaid
journey
    title Jornada Atual (Sem a Extensao) - Dona Lurdes
    section Consumo do Video
      Assiste video apelativo sobre receita caseira: 3: Dona Lurdes
      Fica em duvida sobre a veracidade: 2: Dona Lurdes
    section Tentativa de Verificacao
      Tenta ler comentarios contraditorios: 2: Dona Lurdes
      Abre nova aba para pesquisar no Google: 2: Dona Lurdes
      Encontra artigos tecnicos incompreensiveis: 1: Dona Lurdes
      Desiste por cansaco e excesso de termos: 1: Dona Lurdes
    section Decisao
      Compartilha o video com familiares por cautela: 2: Dona Lurdes
```

### Jornada TO-BE (Com a Extensão) — Dona Lurdes {: #to-be-jornada-proposta-com-a-extensao }

```mermaid
journey
    title Jornada Proposta (Com a Extensao) - Dona Lurdes
    section Consumo do Video
      Assiste video apelativo sobre receita caseira: 3: Dona Lurdes
      Visualiza botao integrado de veracidade: 4: Dona Lurdes
    section Analise Automatizada
      Aciona checagem com um unico clique: 5: Dona Lurdes
      Aguarda sintese visual em ate 10 segundos: 4: Dona Lurdes
      Observa indicador de veracidade e resumo claro: 5: Dona Lurdes
    section Decisao Confiante
      Identifica ausencia de comprovacao cientifica: 5: Dona Lurdes
      Abstem-se de compartilhar informacao duvidosa: 5: Dona Lurdes
```

---

**Próximo:** [Design System e Interface](design-system.md) — padrões visuais e componentes do painel lateral.  
**Ver também:** [Backlog e Histórias de Usuário](../requisitos/backlog-e-historias.md) — critérios de aceitação em formato Gherkin.
