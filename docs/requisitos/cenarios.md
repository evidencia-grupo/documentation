# Cenários de Uso e Operação

## Nesta página

- [Visão Geral dos Cenários](#visao-geral-dos-cenarios)
- [Cenário 01: Iniciar Análise de Vídeo (UC-01)](#cenario-01)
- [Cenário 02: Captura de Transcrição (UC-02)](#cenario-02)
- [Cenário 03: Processamento e Checagem pela IA (UC-03)](#cenario-03)
- [Cenário 04: Consulta Autônoma à Fonte (UC-04)](#cenario-04)
- [Cenário 05: Apresentação de Retorno Reflexivo (UC-05)](#cenario-05)
- [Cenário 06: Identificação de Controvérsia (UC-06)](#cenario-06)
- [Cenário 07: Recuperação Instantânea via Cache Local (UC-01 / HU06)](#cenario-07)
- [Cenário 08: Notificação de Ausência de Transcrição (UC-02 / HU10)](#cenario-08)
- [Cenário 09: Auditoria de Metadados e Contexto Temporal (UC-03 / HU08)](#cenario-09)
- [Cenário 10: Apresentação Acessível e Síntese Visual (UC-01 / HU02)](#cenario-10)
- [Cenário 11: Coleta de Feedback da Análise (UC-05 / HU12)](#cenario-11)

---

## Visão Geral dos Cenários {: #visao-geral-dos-cenarios }

Os cenários descrevem de maneira concreta e contextualizada as interações dos usuários com a **Extensão de Fact-Checking para YouTube**. Cada cenário especifica os atores envolvidos, os recursos técnicos mobilizados, o encadeamento de episódios operacionais, as restrições comportamentais e o tratamento de exceções.

---

### Cenário 01: Iniciar Análise de Vídeo (Referente ao UC-01) {: #cenario-01 }

- **Objetivo:** Acionar a checagem de fatos de um vídeo no YouTube via extensão.
- **Contexto:** Dona Lurdes desconfia de um vídeo sobre saúde e quer verificar as informações com o vídeo já em reprodução.
- **Atores:** Dona Lurdes (usuária), Sistema (extensão).
- **Recursos:** Extensão do navegador, player do YouTube.
- **Episódios:**
  1. Dona Lurdes clica no botão da extensão.
  2. O sistema verifica a inexistência de cache prévio para o vídeo ativo.
  3. O sistema abre o painel lateral em estado de carregamento enquanto dispara a extração em segundo plano.
- **Restrições:** O painel lateral deve ser renderizado sem interromper, pausar ou desestruturar o player de vídeo.
- **Exceção:** Se o vídeo não contiver transcrição disponível, o painel exibe aviso orientador e encerra o fluxo ([Cenário 08](#cenario-08)).
- **Rastreabilidade:** [UC-01](casos-de-uso.md#uc-01), [RF-01](catalogo-requisitos.md#rf-01), [RNF-01, RNF-02, RNF-07](catalogo-requisitos.md#rnf-01).

---

### Cenário 02: Captura de Transcrição (Referente ao UC-02) {: #cenario-02 }

- **Objetivo:** Capturar e higienizar o texto falado no vídeo para alimentar a checagem.
- **Contexto:** O sistema recebeu o comando de análise (UC-01) e necessita da base textual do áudio.
- **Atores:** Carlos Augusto (indireto), Extensão, Player do YouTube.
- **Recursos:** DOM da página, API interna de legendas do YouTube.
- **Episódios:**
  1. O sistema solicita a faixa de legenda do vídeo em reprodução.
  2. O YouTube retorna as faixas de legendas brutas (nativas ou automáticas).
  3. O sistema remove metadados ruidosos, organiza o texto cronologicamente e prepara o pacote para o backend.
- **Restrições:** A extração deve ser imperceptível para o usuário, sem exibição de pop-ups ou janelas adicionais.
- **Exceção:** Falha de comunicação com o player do YouTube gera notificação de "Indisponibilidade temporária" no painel.
- **Rastreabilidade:** [UC-02](casos-de-uso.md#uc-02), [RF-02](catalogo-requisitos.md#rf-02), [RNF-03, RNF-06](catalogo-requisitos.md#rnf-03).

---

### Cenário 03: Processamento e Checagem pela IA (Referente ao UC-03) {: #cenario-03 }

- **Objetivo:** Transformar a transcrição em uma verificação de fatos estruturada com referências externas.
- **Contexto:** A transcrição foi capturada com sucesso e encaminhada para o pipeline analítico.
- **Atores:** Amanda (indireta), Backend de IA, Motores de busca.
- **Recursos:** Modelo de linguagem (LLM), índices de busca institucional, backend autenticado.
- **Episódios:**
  1. O sistema transmite a transcrição limpa para o backend de checagem.
  2. A IA identifica e isola as alegações objetivas (ex.: "Limão cura gripe em 2 horas").
  3. O backend consulta bases médicas confiáveis e a IA classifica a alegação como falsa com base nas evidências.
  4. O sistema retorna o resultado estruturado diretamente para o painel lateral da extensão.
- **Restrições:** O tempo de resposta para a entrega da análise útil não deve ultrapassar 10 segundos.
- **Exceção:** Se a API externa falhar ou o tempo limite exceder 10 segundos, o sistema interrompe a requisição e notifica sobre a lentidão.
- **Rastreabilidade:** [UC-03](casos-de-uso.md#uc-03), [RF-03, RF-06](catalogo-requisitos.md#rf-03), [RNF-01, RNF-04, RNF-06](catalogo-requisitos.md#rnf-01).

---

### Cenário 04: Consulta Autônoma à Fonte (Referente ao UC-04) {: #cenario-04 }

- **Objetivo:** Permitir a auditoria independente da matéria ou estudo original utilizado como evidência pela IA.
- **Contexto:** O painel lateral exibe a análise concluída com a lista de fontes de apoio e contestação.
- **Atores:** Mayara (usuária), Navegador web.
- **Recursos:** Painel lateral da extensão, links externos.
- **Episódios:**
  1. Mayara visualiza a checagem e clica no card "Fonte: Ministério da Saúde".
  2. O sistema direciona o link e solicita a abertura da URL em uma nova aba do navegador.
  3. Mayara consulta o artigo oficial na íntegra de forma autônoma.
- **Restrições:** A abertura do link externo não pode reiniciar, recarregar ou desviar a aba onde o vídeo do YouTube está ativo.
- **Exceção:** Caso o link esteja quebrado (HTTP 404), o navegador trata o erro na nova guia sem comprometer a extensão.
- **Rastreabilidade:** [UC-04](casos-de-uso.md#uc-04), [RF-04](catalogo-requisitos.md#rf-04), [RNF-05, RNF-07](catalogo-requisitos.md#rnf-05).

---

### Cenário 05: Apresentação de Retorno Reflexivo (Referente ao UC-05) {: #cenario-05 }

- **Objetivo:** Estimular o pensamento crítico do usuário por meio de perguntas socráticas sem imposição de conclusões.
- **Contexto:** O painel concluiu a apresentação dos fatos de um vídeo com temática polêmica.
- **Atores:** Helena (usuária), Extensão.
- **Recursos:** Painel lateral da extensão, módulo reflexivo.
- **Episódios:**
  1. Helena examina a síntese de uma declaração sobre índices econômicos.
  2. O sistema exibe um bloco destacado ao final do card: "Você já avaliou quem financiou a pesquisa citada neste vídeo?".
  3. Helena lê a indagação e avalia o conteúdo criticamente antes de tomar decisões de compartilhamento.
- **Restrições:** As perguntas não devem emitir juízos ideológicos ou impedir o fechamento imediato do painel.
- **Exceção:** Nenhuma. Se a usuária ignorar a seção de reflexão, a experiência de uso flui sem bloqueios.
- **Rastreabilidade:** [UC-05](casos-de-uso.md#uc-05), [RF-05](catalogo-requisitos.md#rf-05) (Escopo OUT no MVP).

---

### Cenário 06: Identificação de Controvérsia (Referente ao UC-06) {: #cenario-06 }

- **Objetivo:** Avisar o usuário quando houver divergência factual entre fontes qualificadas ou ausência de dados conclusivos.
- **Contexto:** A extensão processa um tema recente de última hora em que o consenso factual ainda está em aberto.
- **Atores:** Mariana (usuária), Backend de IA.
- **Recursos:** Painel da extensão, componente de alerta de incerteza.
- **Episódios:**
  1. A IA encontra fontes institucionais sustentando conclusões divergentes sobre a mesma alegação.
  2. Em vez de emitir um veredito binário, o sistema define o estado da checagem como inconclusivo.
  3. O painel exibe um badge visual amarelo com o aviso: "Evidências conflitantes ou insuficientes".
- **Restrições:** O sistema deve obrigatoriamente exibir as referências de ambos os pontos de vista da controvérsia.
- **Exceção:** Havendo ausência absoluta de dados nas bases de busca, o sistema indica explicitamente a falta de dados para verificação.
- **Rastreabilidade:** [UC-06](casos-de-uso.md#uc-06), [HU09](backlog-e-historias.md#hu09), [RF-07](catalogo-requisitos.md#rf-07), [RNF-06, RNF-07](catalogo-requisitos.md#rnf-06).

---

### Cenário 07: Recuperação Instantânea via Cache Local (Referente ao UC-01 / HU06) {: #cenario-07 }

- **Objetivo:** Exibir a verificação de um vídeo previamente analisado de forma imediata, poupando tráfego de rede e inferência.
- **Contexto:** Carlos Augusto abre um debate no YouTube que já foi checado pela extensão nas últimas 24 horas.
- **Atores:** Carlos Augusto (usuário), Armazenamento local da extensão.
- **Recursos:** `chrome.storage.local` da extensão.
- **Episódios:**
  1. Carlos Augusto clica no botão da extensão na página do vídeo.
  2. O sistema identifica o ID do vídeo e localiza o registro estruturado válido na memória local.
  3. O painel lateral renderiza a síntese de alegações e fontes em tempo inferior a 1 segundo.
- **Restrições:** Os dados devem permanecer restritos ao escopo da extensão, respeitando o tempo de expiração do cache.
- **Exceção:** Se os dados locais estiverem corrompidos ou expirados, o sistema descarta o registro e dispara a análise completa.
- **Rastreabilidade:** [UC-01](casos-de-uso.md#uc-01), [HU06](backlog-e-historias.md#hu06), [RF-09](catalogo-requisitos.md#rf-09), [RNF-01, RNF-05](catalogo-requisitos.md#rnf-01).

---

### Cenário 08: Notificação de Ausência de Transcrição (Referente ao UC-02 / HU10) {: #cenario-08 }

- **Objetivo:** Alertar o usuário prontamente quando o vídeo assistido não contiver texto de legendas disponível.
- **Contexto:** Mariana acessa um vídeo antigo e aciona a verificação para repassar a mensagem aos pais dos alunos.
- **Atores:** Mariana (usuária), Extensão, Player do YouTube.
- **Recursos:** Painel lateral da extensão.
- **Episódios:**
  1. Mariana clica para iniciar a checagem do vídeo.
  2. O sistema inspeciona o player e detecta a ausência de faixas de legendas nativas ou automáticas.
  3. O sistema aborta o envio à IA e exibe o alerta: "Este vídeo não possui transcrição disponível para análise".
- **Restrições:** A identificação de indisponibilidade de legenda deve ocorrer em no máximo 1 segundo após o acionamento.
- **Exceção:** Em caso de erro temporário de resposta da API do YouTube, o painel disponibiliza botão para nova tentativa.
- **Rastreabilidade:** [UC-02](casos-de-uso.md#uc-02), [HU10](backlog-e-historias.md#hu10), [RF-08](catalogo-requisitos.md#rf-08), [RNF-01, RNF-06, RNF-07](catalogo-requisitos.md#rnf-01).

---

### Cenário 09: Auditoria de Metadados e Contexto Temporal (Referente ao UC-03 / HU08) {: #cenario-09 }

- **Objetivo:** Exibir metadados de publicação para evitar leituras distorcidas ou anacrônicas de vídeos antigos.
- **Contexto:** Mayara está apurando um pronunciamento gravado anos atrás que voltou a circular como se fosse atual.
- **Atores:** Mayara (usuária), Backend de análise.
- **Recursos:** Metadados do YouTube, cabeçalho do painel lateral.
- **Episódios:**
  1. Mayara aciona a extensão para checar o vídeo sob investigação.
  2. O sistema captura a data original de upload e o canal proprietário do conteúdo.
  3. A IA cruza as afirmações levando em consideração o ano de produção do material.
  4. O painel destaca no cabeçalho: "Publicado em [Data] por [Canal] – Fatos contextualizados à época".
- **Restrições:** O sistema não pode classificar como mentira afirmações que eram fatos verídicos na época de sua gravação.
- **Exceção:** Se os metadados do vídeo estiverem inacessíveis, o sistema exibe aviso informando contexto temporal incompleto.
- **Rastreabilidade:** [UC-01, UC-03](casos-de-uso.md#uc-01), [HU08](backlog-e-historias.md#hu08), [RF-11](catalogo-requisitos.md#rf-11), [RNF-07](catalogo-requisitos.md#rnf-07).

---

### Cenário 10: Apresentação Acessível e Síntese Visual (Referente ao UC-01 / HU02) {: #cenario-10 }

- **Objetivo:** Apresentar os resultados com alto contraste e linguagem direta para pessoas com baixa fluência digital.
- **Contexto:** Dona Lurdes quer entender o resultado da checagem de um chá sem enfrentar telas poluídas ou termos técnicos.
- **Atores:** Dona Lurdes (usuária), Interface da extensão.
- **Recursos:** Interface WCAG AA, cards visuais com ícones representativos.
- **Episódios:**
  1. A checagem do vídeo é concluída pelo backend.
  2. O painel lateral renderiza blocos com divisões cromáticas claras (verde para respaldo científico; vermelho para refutado).
  3. Dona Lurdes visualiza sentenças curtas e diretas sobre os riscos da receita caseira.
- **Restrições:** Tipografia ampla, espaçamento confortável e contraste em conformidade com as diretrizes WCAG AA.
- **Exceção:** Textos de transcrição excessivamente longos devem ser sumarizados em cartões de no máximo três linhas.
- **Rastreabilidade:** [UC-01, UC-03](casos-de-uso.md#uc-01), [HU02](backlog-e-historias.md#hu02), [RF-03, RF-06](catalogo-requisitos.md#rf-03), [RNF-07](catalogo-requisitos.md#rnf-07).

---

### Cenário 11: Coleta de Feedback da Análise (Referente ao UC-05 / HU12) {: #cenario-11 }

- **Objetivo:** Possibilitar a avaliação da precisão e utilidade da análise pelo usuário para refinamento contínuo.
- **Contexto:** Helena lê a checagem de um tema econômico e deseja sinalizar que as referências utilizadas estavam defasadas.
- **Atores:** Helena (usuária), Painel lateral, Backend de telemetria.
- **Recursos:** Botões de avaliação ("Útil" / "Não útil") no rodapé do painel.
- **Episódios:**
  1. Helena finaliza a leitura dos cartões de evidências.
  2. Helena aciona o botão de avaliação negativa e seleciona a opção "Fontes desatualizadas".
  3. O sistema transmite o registro anônimo e exibe uma breve mensagem de confirmação.
- **Restrições:** O envio de feedback não pode requerer login, cadastros nem capturar dados pessoais de navegação.
- **Exceção:** Em caso de perda de conexão no envio, a ação falha silenciosamente sem interromper a navegação da usuária.
- **Rastreabilidade:** [HU12](backlog-e-historias.md#hu12), [RF-10](catalogo-requisitos.md#rf-10), [RNF-05](catalogo-requisitos.md#rnf-05) (Escopo OUT no MVP).

---

**Próximo:** [Casos de Uso](casos-de-uso.md) — fluxos operacionais consolidados.  
**Ver também:** [Backlog e Histórias de Usuário](backlog-e-historias.md) — critérios de aceitação vinculados.
