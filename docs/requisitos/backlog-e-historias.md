# Backlog e Histórias de Usuário

## Nesta página

- [Visão geral por épico](#backlog-do-produto-por-epico)
- [Épico 1 — Gatilho e Ativação](#epico-1-gatilho-e-ativacao) · HU01, HU03
- [Épico 2 — Extração de Transcrição](#epico-2-extracao-de-transcricao) · HU05, HU10
- [Épico 3 — Análise e Checagem via IA](#epico-3-analise-e-checagem-via-ia) · HU02, HU04, HU09
- [Épico 4 — Confiança e Fontes](#epico-4-confianca-e-fontes) · HU07, HU08
- [Épico 5 — Performance e Cache](#epico-5-performance-e-cache) · HU06
- [Épico 6 — Engajamento Reflexivo (Fora do MVP)](#epico-6-engajamento-reflexivo-fora-do-mvp) · HU11, HU12

!!! info "Legenda de Padronização"
    - **HU** = História de Usuário (formato de valor de negócio com personas mapeadas)
    - **Prioridade MoSCoW** = Must Have (MVP Onda 1), Should Have (Onda 2), Could Have (Onda 3 - Pós-MVP)
    - **Rastreabilidade Bidirecional** = Vinculação estrita com Cenários Operacionais, Casos de Uso, RFs e RNFs
    - **Critérios de Aceitação** = Especificação comportamental em tópicos e cenários executáveis em sintaxe Gherkin

---

## Backlog do Produto por Épico {: #backlog-do-produto-por-epico }

![Mapeamento Visual de Épicos, Features e Histórias de Usuário](../assets/epicos-e-features.png)
*Figura: Mapeamento visual e estrutural entre Épicos, Features e Histórias de Usuário associadas às personas mapeadas.*

| Épico | Módulo | Histórias | Prioridade MoSCoW | Rastreabilidade a Cenários |
|:---|:---|:---|:---|:---|
| **E1 — Gatilho e Ativação** | Acionamento da extensão | HU01, HU03 | Must Have \| IN | [Cenário 01](cenarios.md#cenario-01), [Cenário 03](cenarios.md#cenario-03) |
| **E2 — Extração de Transcrição** | Ingestão de dados do vídeo | HU05, HU10 | Must Have \| IN | [Cenário 02](cenarios.md#cenario-02), [Cenário 08](cenarios.md#cenario-08) |
| **E3 — Análise e Checagem via IA** | Pipeline de IA e síntese | HU02, HU04, HU09 | Must Have \| IN | [Cenário 03](cenarios.md#cenario-03), [Cenário 06](cenarios.md#cenario-06), [Cenário 10](cenarios.md#cenario-10) |
| **E4 — Confiança e Fontes** | Credibilidade e contexto | HU07, HU08 | Must Have (HU07) / Should Have (HU08) \| IN | [Cenário 04](cenarios.md#cenario-04), [Cenário 09](cenarios.md#cenario-09) |
| **E5 — Performance e Cache** | Otimização e reuso local | HU06 | Should Have \| IN | [Cenário 07](cenarios.md#cenario-07) |
| **E6 — Engajamento Reflexivo** | Pensamento crítico e feedback | HU11, HU12 | Could Have \| OUT (Pós-MVP) | [Cenário 05](cenarios.md#cenario-05), [Cenário 11](cenarios.md#cenario-11) |

### Funil de Priorização do Backlog

A alocação de esforço e cadência de entrega de cada história segue o funil estratégico do produto:

![Funil de Priorização do Backlog](../assets/funil-backlog.png)
*Figura: Funil de refinamento progressivo do backlog de produto (Now, Next, Soon, Later).*

---

## Épico 1 — Gatilho e Ativação {: #epico-1-gatilho-e-ativacao }

### HU01 — Verificação Simplificada de Conteúdo em Vídeo {: #hu01 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Dona Lurdes, pretendo iniciar a checagem de um vídeo com apenas um clique para que eu saiba se as receitas e dicas caseiras de saúde são seguras antes de seguir ou repassar a familiares. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Dona Lurdes](../design/personas-e-jornadas.md#dona-lurdes) |
| **Rastreabilidade** | [Cenário 01](cenarios.md#cenario-01), [UC-01](casos-de-uso.md#uc-01), [RF-01](catalogo-requisitos.md#rf-01), [RF-03](catalogo-requisitos.md#rf-03), [RNF-01](catalogo-requisitos.md#rnf-01), [RNF-07](catalogo-requisitos.md#rnf-07) |

**Critérios de Aceitação:**

- A extensão deve disponibilizar um botão de acionamento destacado e visível na interface da página de reprodução (`/watch`).
- O primeiro resultado útil deve ser renderizado no painel lateral em linguagem clara, sem termos técnicos ou jargões da web.
- Caso o vídeo não possua transcrição ou a rede falhe, o sistema deve exibir aviso em linguagem simples e amigável sem travar o navegador.

```gherkin
Funcionalidade: Verificação simplificada de conteúdo em vídeo

  Cenário: Acionar a checagem com um clique
    Dado que Dona Lurdes está em uma página de vídeo ativa do YouTube (/watch)
    Quando ela clica no botão de acionamento da extensão
    Então o painel deve exibir confirmação visual de processamento em até 1 segundo
    E o primeiro resultado útil deve ser renderizado em linguagem clara, sem jargões técnicos

  Cenário: Falha de rede ou ausência de transcrição
    Dado que Dona Lurdes aciona a checagem de um vídeo
    Quando o vídeo não possui transcrição disponível ou a rede falha
    Então o sistema deve exibir um aviso em linguagem simples e amigável
    E o navegador não deve travar
```

---

### HU03 — Checagem Rápida e Factual no Player {: #hu03 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Amanda, pretendo analisar afirmações de vídeos de divulgação científica em até 10 segundos para validar premissas sem interromper o fluxo dos meus estudos. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Amanda](../design/personas-e-jornadas.md#amanda) |
| **Rastreabilidade** | [Cenário 01](cenarios.md#cenario-01), [Cenário 03](cenarios.md#cenario-03), [UC-01](casos-de-uso.md#uc-01), [UC-03](casos-de-uso.md#uc-03), [RF-01](catalogo-requisitos.md#rf-01), [RF-09](catalogo-requisitos.md#rf-09), [RNF-01](catalogo-requisitos.md#rnf-01) |

**Critérios de Aceitação:**

- O sistema deve fornecer confirmação visual imediata de processamento em até 1 segundo após o clique.
- A síntese útil deve ser renderizada no painel lateral em no máximo 10 segundos em condições normais de rede.
- Em vídeos já analisados recentemente, o sistema deve recuperar os dados instantaneamente a partir da memória local.

```gherkin
Funcionalidade: Checagem rápida e factual no player

  Cenário: Confirmação visual imediata
    Dado que Amanda aciona a checagem de um vídeo
    Quando o clique é processado
    Então uma confirmação visual de processamento deve aparecer em até 1 segundo

  Cenário: Entrega da síntese dentro do SLA
    Dado que a transcrição foi extraída com sucesso
    Quando o pipeline de IA e busca processa as alegações
    Então a síntese útil deve ser renderizada no painel em no máximo 10 segundos, em condições normais de rede

  Cenário: Recuperação instantânea de vídeo já analisado
    Dado que Amanda abre um vídeo checado recentemente
    Quando ela aciona a extensão
    Então o resultado deve ser recuperado da memória local instantaneamente, sem nova requisição
```

---

## Épico 2 — Extração de Transcrição {: #epico-2-extracao-de-transcricao }

### HU05 — Ingestão e Processamento de Transcrição {: #hu05 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Carlos Augusto, pretendo que o sistema obtenha e processe automaticamente a transcrição do vídeo para que a verificação de factualidade ocorra a partir do áudio exato do conteúdo. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Carlos Augusto](../design/personas-e-jornadas.md#carlos-augusto) |
| **Rastreabilidade** | [Cenário 02](cenarios.md#cenario-02), [UC-02](casos-de-uso.md#uc-02), [RF-02](catalogo-requisitos.md#rf-02), [RF-08](catalogo-requisitos.md#rf-08), [RNF-03](catalogo-requisitos.md#rnf-03), [RNF-06](catalogo-requisitos.md#rnf-06) |

**Critérios de Aceitação:**

- O sistema deve interceptar as faixas de legenda (nativas ou geradas automaticamente) diretamente do player do YouTube.
- O texto extraído deve ser estruturado e higienizado antes do envio seguro ao backend intermediário.
- Caso o criador tenha desativado as legendas e não haja transcrição disponível, o sistema deve exibir alerta informativo claro e liberar a tela.

```gherkin
Funcionalidade: Ingestão e processamento de transcrição

  Cenário: Extração de legendas nativas ou automáticas
    Dado que Carlos Augusto está em uma página de vídeo ativa
    Quando o sistema intercepta o identificador do vídeo
    Então as faixas de legenda (nativas ou automáticas) devem ser requisitadas ao player
    E o texto deve ser higienizado e estruturado antes do envio ao backend

  Cenário: Vídeo sem legendas disponíveis
    Dado que o criador do vídeo desativou as legendas
    Quando o sistema tenta obter a transcrição
    Então um alerta informativo claro deve ser exibido
    E o fluxo de checagem deve ser encerrado com segurança
```

---

### HU10 — Notificação Rápida de Ausência de Transcrição {: #hu10 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Mariana, pretendo ser notificada imediatamente caso o vídeo assistido não possua legendas para não perder tempo aguardando um resultado que não pode ser gerado. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Mariana](../design/personas-e-jornadas.md#mariana) |
| **Rastreabilidade** | [Cenário 08](cenarios.md#cenario-08), [UC-02](casos-de-uso.md#uc-02), [RF-08](catalogo-requisitos.md#rf-08), [RNF-01](catalogo-requisitos.md#rnf-01), [RNF-06](catalogo-requisitos.md#rnf-06), [RNF-07](catalogo-requisitos.md#rnf-07) |

**Critérios de Aceitação:**

- O sistema deve validar a disponibilidade da transcrição em até 1 segundo após o acionamento da extensão.
- Exibição de um alerta orientador informando a impossibilidade técnica de processar o vídeo sem legendas.
- Interrupção segura do carregamento sem retenção de estado de espera ou bloqueio da aba.

```gherkin
Funcionalidade: Notificação rápida de ausência de transcrição

  Cenário: Vídeo sem legendas
    Dado que Mariana aciona a checagem de um vídeo sem transcrição disponível
    Quando o sistema valida a disponibilidade da transcrição
    Então um alerta orientador deve ser exibido em até 1 segundo
    E o carregamento deve ser interrompido com segurança, sem bloquear a aba

  Cenário: Falha temporária da API do YouTube
    Dado que ocorre um erro temporário ao consultar as legendas
    Quando o sistema detecta a falha
    Então um botão de nova tentativa deve ser disponibilizado no painel
```

---

## Épico 3 — Análise e Checagem via IA {: #epico-3-analise-e-checagem-via-ia }

### HU02 — Síntese Estruturada sem Jargões Técnicos {: #hu02 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Dona Lurdes, pretendo visualizar uma síntese objetiva com destaques visuais acessíveis para entender facilmente o que é verdade, mentira ou sem comprovação sem sobrecarga de leitura. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Dona Lurdes](../design/personas-e-jornadas.md#dona-lurdes) |
| **Rastreabilidade** | [Cenário 10](cenarios.md#cenario-10), [UC-01](casos-de-uso.md#uc-01), [UC-03](casos-de-uso.md#uc-03), [RF-03](catalogo-requisitos.md#rf-03), [RF-06](catalogo-requisitos.md#rf-06), [RNF-07](catalogo-requisitos.md#rnf-07) |

**Critérios de Aceitação:**

- As alegações devem ser agrupadas com separação nítida entre o que possui respaldo científico e o que é contradito pelas evidências.
- O painel deve seguir normas WCAG de legibilidade, tipografia ampla e contraste cromático adequado.
- A consulta não deve exigir configurações complexas, preenchimento de cadastros ou autenticação externa.

```gherkin
Funcionalidade: Síntese estruturada sem jargões técnicos

  Cenário: Separação visual entre alegações apoiadas e contraditas
    Dado que a checagem de um vídeo foi concluída
    Quando o painel lateral é renderizado
    Então as alegações com respaldo científico devem estar visualmente separadas das contraditas pelas evidências
    E o painel deve seguir contraste e tipografia compatíveis com WCAG AA

  Cenário: Consulta sem cadastro
    Dado que Dona Lurdes deseja visualizar a síntese
    Quando ela usa a extensão
    Então nenhuma configuração, cadastro ou autenticação externa deve ser exigida
```

---

### HU04 — Categorização Estruturada de Alegações {: #hu04 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Amanda, pretendo visualizar as principais alegações do vídeo categorizadas entre evidências que apoiam, contradizem ou contextualizam a fala para facilitar os meus fichamentos acadêmicos. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Amanda](../design/personas-e-jornadas.md#amanda) |
| **Rastreabilidade** | [Cenário 03](cenarios.md#cenario-03), [UC-03](casos-de-uso.md#uc-03), [RF-03](catalogo-requisitos.md#rf-03), [RF-06](catalogo-requisitos.md#rf-06), [RNF-02](catalogo-requisitos.md#rnf-02) |

**Critérios de Aceitação:**

- As alegações extraídas pela IA devem ser listadas isoladamente, indicando claramente a sua relação com as evidências encontradas.
- A injeção dos componentes na aba do YouTube não deve elevar o Tempo Total de Bloqueio (TBT) em mais de 50 ms.
- O sistema não deve impor vereditos dogmáticos, mantendo foco na apresentação factual e analítica.

```gherkin
Funcionalidade: Categorização estruturada de alegações

  Cenário: Listagem isolada de alegações com relação às evidências
    Dado que a análise de um vídeo foi concluída
    Quando o painel exibe o resultado
    Então cada alegação extraída pela IA deve ser listada isoladamente
    E sua relação com as evidências (apoia, contradiz, contextualiza) deve estar explícita

  Cenário: Limite de sobrecarga de renderização
    Dado que os componentes da extensão são injetados na aba ativa do YouTube
    Quando a página é carregada
    Então o Tempo Total de Bloqueio (TBT) não deve aumentar mais de 50 ms
```

---

### HU09 — Alerta Visual Imediato de Incerteza Analítica {: #hu09 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Mariana, pretendo receber um alerta visual destacado quando houver incerteza ou conflito de fontes sobre o vídeo para conter impulsos de repasse em mensagens no WhatsApp. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Mariana](../design/personas-e-jornadas.md#mariana) |
| **Rastreabilidade** | [Cenário 06](cenarios.md#cenario-06), [UC-06](casos-de-uso.md#uc-06), [RF-07](catalogo-requisitos.md#rf-07), [RNF-06](catalogo-requisitos.md#rnf-06), [RNF-07](catalogo-requisitos.md#rnf-07) |

**Critérios de Aceitação:**

- Exibição de indicador visual de advertência (badge de incerteza) quando as evidências forem insuficientes ou divergentes.
- Apresentação de um texto curto e direto explicando que a afirmação não possui confirmação factual consolidada.
- O alerta deve estar visível no topo do painel lateral antes de qualquer detalhamento técnico.

```gherkin
Funcionalidade: Alerta visual imediato de incerteza analítica

  Cenário: Fontes conflitantes ou dados insuficientes
    Dado que o backend identifica ausência de evidências conclusivas ou divergência factual
    Quando o resultado é classificado como inconclusivo
    Então um badge visual de alerta deve ser exibido no topo do painel, antes de qualquer detalhamento técnico
    E um texto curto deve explicar que a afirmação não possui confirmação factual consolidada

  Cenário: Controvérsia legítima entre fontes
    Dado que existem referências legítimas com conclusões opostas
    Quando o sistema apresenta o resultado
    Então ambos os lados da controvérsia devem ser expostos, sem arbitrar um vencedor absoluto
```

---

## Épico 4 — Confiança e Fontes {: #epico-4-confianca-e-fontes }

### HU07 — Auditoria Direta de Fontes e Referências {: #hu07 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Mayara, pretendo acessar as fontes utilizadas na checagem por meio de hiperligações e metadados diretos para auditar a origem primária das evidências de forma autônoma. |
| **Prioridade** | Must Have \| IN |
| **Persona Relacionada** | [Mayara](../design/personas-e-jornadas.md#mayara) |
| **Rastreabilidade** | [Cenário 04](cenarios.md#cenario-04), [UC-04](casos-de-uso.md#uc-04), [RF-04](catalogo-requisitos.md#rf-04), [RNF-05](catalogo-requisitos.md#rnf-05), [RNF-07](catalogo-requisitos.md#rnf-07) |

**Critérios de Aceitação:**

- Cada cartão de alegação checada deve listar explicitamente as referências com título da fonte e hiperligação de acesso direto.
- Ao clicar na fonte, a página externa deve ser aberta em uma nova aba do navegador sem fechar o painel lateral da extensão nem recarregar o vídeo.
- Caso o endereço de destino esteja inacessível (erro HTTP), o navegador gerencia o erro sem travar a extensão.

```gherkin
Funcionalidade: Auditoria direta de fontes e referências

  Cenário: Abertura de fonte em nova aba
    Dado que Mayara visualiza um cartão de alegação checada com referências
    Quando ela clica na hiperligação da fonte
    Então a página original deve abrir em uma nova aba
    E o painel lateral e o player do vídeo devem permanecer intactos

  Cenário: Link inacessível
    Dado que a fonte referenciada retorna erro HTTP (ex.: 404)
    Quando Mayara tenta acessá-la
    Então o navegador deve tratar o erro na nova aba, sem travar a extensão
```

---

### HU08 — Contextualização Temporal e Autoria do Vídeo {: #hu08 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Mayara, pretendo visualizar a data original de publicação do vídeo e as informações do canal para avaliar se as afirmações analisadas estão anacrônicas ou fora de época. |
| **Prioridade** | Should Have \| IN |
| **Persona Relacionada** | [Mayara](../design/personas-e-jornadas.md#mayara) |
| **Rastreabilidade** | [Cenário 09](cenarios.md#cenario-09), [UC-01](casos-de-uso.md#uc-01), [UC-03](casos-de-uso.md#uc-03), [RF-11](catalogo-requisitos.md#rf-11), [RNF-07](catalogo-requisitos.md#rnf-07) |

**Critérios de Aceitação:**

- O painel de checagem deve exibir a data de upload original e o nome do canal responsável pelo vídeo no YouTube.
- O cruzamento de dados deve considerar o marco temporal de publicação para evitar falsas contradições em conteúdos antigos.
- Os metadados de contexto devem ser exibidos de forma compacta no cabeçalho do painel de análise.

```gherkin
Funcionalidade: Contextualização temporal e autoria do vídeo

  Cenário: Exibição de metadados de publicação
    Dado que a checagem de um vídeo foi concluída
    Quando o painel é renderizado
    Então a data de upload original e o nome do canal devem ser exibidos no cabeçalho

  Cenário: Cruzamento temporal das afirmações
    Dado que um vídeo antigo volta a circular como se fosse atual
    Quando a IA analisa as afirmações
    Então o cruzamento deve considerar o ano de produção do material
    E não deve classificar como falsa uma afirmação que era verídica à época
```

---

## Épico 5 — Performance e Cache {: #epico-5-performance-e-cache }

### HU06 — Consulta Imediata via Cache Local {: #hu06 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Carlos Augusto, pretendo recuperar checagens recentes salvas no cache local para não desperdiçar tráfego de rede nem consumir processamento em vídeos já auditados. |
| **Prioridade** | Should Have \| IN |
| **Persona Relacionada** | [Carlos Augusto](../design/personas-e-jornadas.md#carlos-augusto) |
| **Rastreabilidade** | [Cenário 07](cenarios.md#cenario-07), [UC-01](casos-de-uso.md#uc-01), [RF-09](catalogo-requisitos.md#rf-09), [RNF-01](catalogo-requisitos.md#rnf-01), [RNF-05](catalogo-requisitos.md#rnf-05) |

**Critérios de Aceitação:**

- A extensão deve verificar o armazenamento local pelo identificador do vídeo antes de efetuar chamadas externas de inferência.
- Resultados em cache válido devem ser exibidos de forma instantânea (latência inferior a 1 segundo).
- O armazenamento em cache local deve ser restrito ao escopo da extensão, sem reter histórico geral de navegação do usuário.

```gherkin
Funcionalidade: Consulta imediata via cache local

  Cenário: Cache válido disponível
    Dado que um vídeo já foi analisado recentemente
    Quando Carlos Augusto aciona a extensão nesse vídeo
    Então o sistema deve localizar o registro em cache pelo identificador do vídeo
    E exibir o resultado em menos de 1 segundo, sem nova chamada externa

  Cenário: Cache expirado ou corrompido
    Dado que o registro local de um vídeo está expirado ou corrompido
    Quando a extensão tenta recuperá-lo
    Então o sistema deve descartar o registro
    E disparar uma nova análise completa
```

---

## Épico 6 — Engajamento Reflexivo (Fora do MVP) {: #epico-6-engajamento-reflexivo-fora-do-mvp }

!!! note "Escopo Could Have | OUT"
    As histórias abaixo estão mapeadas para rastreabilidade, mas **não fazem parte da Release 1.0 (MVP)**. Veja [Priorização e MVP](../planejamento/priorizacao-e-mvp.md#sequenciador-de-features-lean-inception) para detalhes sobre a Onda 3.

### HU11 — Perguntas Orientadoras para Reflexão Crítica {: #hu11 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Helena, pretendo receber perguntas reflexivas sobre os pontos controversos do vídeo para orientar a minha própria checagem sem que a IA imponha conclusões fechadas. |
| **Prioridade** | Could Have \| OUT (Pós-MVP) |
| **Persona Relacionada** | [Helena](../design/personas-e-jornadas.md#helena) |
| **Rastreabilidade** | [Cenário 05](cenarios.md#cenario-05), [UC-05](casos-de-uso.md#uc-05), [RF-05](catalogo-requisitos.md#rf-05) |

**Critérios de Aceitação:**

- O painel deve disponibilizar perguntas norteadoras que estimulem a dúvida crítica sobre as premissas do vídeo.
- As perguntas devem manter postura de neutralidade, abstendo-se de apresentar respostas pré-fabricadas como fatos dogmáticos.
- A usuária pode prosseguir na navegação sem ser obrigada a interagir com as perguntas reflexivas.

```gherkin
Funcionalidade: Perguntas orientadoras para reflexão crítica

  Cenário: Exibição de pergunta reflexiva neutra
    Dado que a síntese de um vídeo com temática controversa foi apresentada
    Quando o painel exibe o bloco de reflexão
    Então a pergunta não deve emitir juízo ideológico nem impor conclusão

  Cenário: Ignorar a interação
    Dado que Helena não deseja interagir com a seção reflexiva
    Quando ela fecha ou ignora o bloco
    Então a navegação deve seguir normalmente, sem bloqueios
```

---

### HU12 — Avaliação de Relevância e Precisão da Análise {: #hu12 }

| Propriedade | Detalhamento |
|:---|:---|
| **Descrição** | Eu, como Helena, pretendo classificar a utilidade das evidências e perguntas recebidas para colaborar com a melhoria contínua das respostas analíticas do sistema. |
| **Prioridade** | Could Have \| OUT (Pós-MVP) |
| **Persona Relacionada** | [Helena](../design/personas-e-jornadas.md#helena) |
| **Rastreabilidade** | [Cenário 11](cenarios.md#cenario-11), [RF-10](catalogo-requisitos.md#rf-10), [RNF-05](catalogo-requisitos.md#rnf-05) |

**Critérios de Aceitação:**

- Disponibilização de opções discretas de avaliação (ex.: positivo/negativo) ao final do painel de análise.
- O envio da avaliação deve ocorrer de forma assíncrona, sem recarregar a interface nem interromper o vídeo.
- A rotina de retorno não deve recolher dados pessoais identificáveis ou históricos de navegação não consentidos.

```gherkin
Funcionalidade: Avaliação de relevância e precisão da análise

  Cenário: Envio de avaliação sem dados pessoais
    Dado que Helena finalizou a leitura dos cartões de evidências
    Quando ela aciona um botão de avaliação (positivo/negativo)
    Então o registro deve ser enviado de forma assíncrona e anônima
    E nenhum dado pessoal identificável deve ser coletado

  Cenário: Falha no envio
    Dado que ocorre perda de conexão durante o envio do feedback
    Quando a ação de avaliação falha
    Então a falha deve ocorrer silenciosamente, sem interromper a navegação
```

---

**Próximo:** [Casos de Uso](casos-de-uso.md) — fluxos detalhados de cada funcionalidade.  
**Ver também:** [Priorização e MVP](../planejamento/priorizacao-e-mvp.md) — sequência de entrega e decisões técnicas.
