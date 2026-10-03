# Plano do Experimento — Fase CBL Act

## 1. Objetivo e Alinhamento com a Essential Question e Guiding Questions

O objetivo deste plano experimental e avaliar empiricamente se a interface centrada em evidencias e perguntas reflexivas (**Condicao B — Evidence-First**) estimula um comportamento investigativo ativo e preserva a autonomia critica do usuario, quando comparada a uma interface baseada em veredito algoritmico (**Condicao A — Controle com Score Global e Gauge**).

O experimento se ancora diretamente na **Essential Question** do projeto:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informacoes sem substituir seu pensamento critico?"*

E operacionaliza quatro **Guiding Questions** centrais documentadas em `docs/visao/guiding-questions.md`:

- **GQ02 (Substituicao de Julgamento)**: Como evitar que o usuario aceite passivamente uma classificacao automatizada sem analisar os fatos? O experimento mede se a interface B induz a inspecao ativa de fontes e evidencias antes de emitir um veredito pessoal.
- **GQ05 (Incerteza e Evidencia Insuficiente)**: O produto comunica adequadamente que "ausencia de evidencia confirmatoria nao equivale a falsidade"? O experimento avalia o tratamento dado a alegacoes com estado `insufficient_evidence` e `conflicting`.
- **GQ08 (Heuristicas e Engajamento Reflexivo)**: Que estimulos de interface provocam reflexao sistematica em vez de reacao rapida e heuristica? Avalia-se a interacao com perguntas reflexivas (Reflection Cards).
- **GQ11 (Metricas de Pensamento Critico)**: Como aferir se a intervencao promoveu postura critica sustentavel? O experimento mensura comportamento investigativo, calibracao de confianca e transferencia de habilidades para tarefas sem ferramenta.

---

## 2. Hipoteses Pre-Registradas

As hipoteses foram formuladas em linguagem testavel e devem ser registradas e travadas antes do inicio de qualquer coleta:

- **H1 (Inspecao Comportamental)**: Participantes na Condicao B apresentarao maior taxa de inspecao de evidencias (Evidence Inspection Rate) do que participantes na Condicao A.
  - *Metrica associada*: **M1 (EIR)** e **M1b (SOR)**.
- **H2 (Nao-Inferioridade em Acuracia)**: A acuracia final de julgamento na Condicao B nao e inferior a da Condicao A, respeitando uma margem de nao-inferioridade pre-estabelecida delta = 0.05.
  - *Metrica associada*: **M5 (Final Accuracy e Delta-Accuracy)**.
- **H3 (Calibracao de Confianca)**: Participantes na Condicao B apresentarao melhor calibracao entre confianca subjetiva e acuracia objetiva (menor erro quadratico de Brier e menor gap de superconfianca) do que participantes na Condicao A.
  - *Metrica associada*: **M4 (Confidence Calibration)**.
- **H4 (Transferencia Cognitiva)**: Na fase de transferencia sem auxilio de ferramenta (Fase 3), participantes previamente expostos a Condicao B demonstrarao acuracia equivalente ou superior e executarao maior numero de passos de verificacao distintos do que participantes da Condicao A.
  - *Metrica associada*: **M6 (TTA)** e **M6b (VSC)**.
- **H5 (Custo Cognitivo e Temporal)**: O tempo total para conclusao (Time to Conclusion) e o esforco subjetivo percebido (Single Ease Question) na Condicao B nao excederao os limites de viabilidade operacional tolerados em relacao a Condicao A.
  - *Metrica associada*: **M7 (TTC)** e **M8 (SEQ)**.

---

## 3. Desenho Experimental

O estudo adota um delineamento **exploratorio entre sujeitos (between-subjects)** com duas condicoes (A vs. B) e tres fases cronologicas consecutivas por participante:

```text
Participante (P-XXXX)
        |
        +---> Bloco de Aleatorizacao (Offline) ---> Atribuicao: Condicao A ou B
        |
        +---> Fase 1: Baseline (Sem Ferramenta) — Conjunto S1 (4 itens)
        |
        +---> Fase 2: Assistida (Condicao A ou B) — Conjunto S2 (4 itens)
        |
        +---> Fase 3: Transferencia (Sem Ferramenta) — Conjunto S3 (3 itens)
        |
        +---> Questionario Pos-Tarefa (SEQ + Passos) e Debriefing Factual
```

### Distribuicao das Fases e Conjuntos de Estimulos

- **Fase 1 (Baseline)**: O participante avalia itens do conjunto **S1** (proposta: 4 itens) sem qualquer apoio automatizado, estabelecendo seu nivel basal de acuracia e tempo.
- **Fase 2 (Assistida)**: O participante avalia itens do conjunto **S2** (proposta: 4 itens) com suporte da interface correspondente a condicao sorteada (A ou B).
- **Fase 3 (Transferencia)**: O participante avalia itens inéditos do conjunto **S3** (proposta: 3 itens) sem nenhuma ferramenta, permitindo verificar a retencao de habitos de escrutinio critico.

### Estrutura dos Itens

- Cada item consiste em um trecho curto de video ou transcricao (duracao <= 90 segundos) contendo de 2 a 3 alegacoes factuais delimitadas.
- Os conjuntos S1, S2 e S3 sao disjuntos (nenhum item se repete entre fases).
- S1 e S2 sao pareados em termos de distribuicao de dificuldade e categorias tematicas.
- O conjunto S3 e integralmente inedito e mantido fora de qualquer base de evidencias pré-carregada.

### Aleatorizacao

A alocacao dos participantes entre as condicoes A e B sera conduzida pelo pesquisador responsavel utilizando uma tabela de **aleatorizacao em blocos balanceados de tamanho 4** (ex.: AABB, ABAB, BABA, BBAA). A lista de correspondencia entre pseudonimo (`P-0001`, `P-0002`, ...) e a condicao designada e mantida rigorosamente **offline**, em arquivo seguro e fora do repositorio Git.

---

## 4. Especificacao das Condicoes Experimentais

### Condicao A (Controle — Veredito Algoritmico)

A Condicao A reproduz a abordagem convencional de checagem automatizada baseada em autoridade algoritmica (paradigma anterior ao ADR-006):

- **Elemento Central**: Painel com medidor visual tipo *gauge* e pontuacao numerica global (score de 0 a 100) associada a um rotulo taxativo de veredito ("Verdadeiro", "Falso", "Enganoso").
- **Alegacoes**: Apresenta a lista das mesmas alegacoes do item.
- **Evidencias**: Nao expoe os cards de evidencias abertos por padrao; as fontes originais estao colapsadas sob o botao "Ver fontes", exigindo acao deliberada para inspecao (garantindo que a acao de inspecao seja mensuravel e comparavel a B).
- **Restricoes Estritas**: Nao possui categorizacao semantica de relacao (*sustenta*, *contradiz*, *contextualiza*), nao apresenta estados explicitos de incerteza metodologica, nem contem perguntas reflexivas.
- **Isolamento de Engenharia**: O prototipo da Condicao A sera construido como uma aplicacao web estatica independente (HTML/TypeScript + fixtures locais), alocada no diretorio `experiments/control-gauge-prototype/` do repositorio `EvidencIA`. Este artefato e expressamente excluido dos scripts de empacotamento da extensao de producao, opera sem conexao de rede com o backend e emite o mesmo envelope de telemetria com campo fixo `cond: "A"`.

### Condicao B (Teste — Evidence-First e Engajamento Reflexivo)

A Condicao B implementa a totalidade das diretrizes do ADR-006 e dos requisitos HU11/HU13/HU14/HU15:

- **Elemento Central**: Interface orientada a investigacao analitica por alegacao, sem nenhum score consolidado ou medidor sintetico de confiabilidade.
- **Evidence Cards**: Cada alegacao exibe cards de evidencia contendo trechos factuais rastreaveis e classificacao explicita da relacao logica (`supports`, `contradicts`, `contextualizes`).
- **Estados de Incerteza**: Identificacao visual clara para alegacoes com evidencia insuficiente (`insufficient_evidence`), fontes conflitantes (`conflicting`) ou evidencias desatualizadas (`dated`).
- **Reflection Cards (HU11/HU15)**: Questoes reflexivas interativas que convidam o participante a ponderar sobre potenciais vieses, ausencia de contexto e passos complementares de checagem.
- **Controle de Variabilidade**: Utilizacao de fixtures estaticas pre-extraidas no ambiente de teste para neutralizar latencia e oscilacoes de rede ou alucinacoes estocasticas de LLM. A flag de analise e fixada como `analysisMode="mock"`, exclusiva do ambiente experimental e estritamente proibida em compilacoes de producao.

---

## 5. Banco de Itens e Regras de Construcao

A montagem do banco de estimulos deve seguir os preceitos detalhados em `item-bank-template.md`:

1. **Rotulagem Dupla Cega**: A verdade-terreno de cada alegacao e determinada de forma independente por dois pesquisadores, tomando como referencia relatorios publicados por agencias profissionais de fact-checking reconhecidas pela IFCN (ex.: Aos Fatos, Lupa, Boatos.org, E-farsas).
2. **Resolucao de Divergencias**: Casos de discrepancia entre os avaliadores devem ser deliberados com um terceiro membro e documentados com a justificativa final. Alegacoes ambiguas sao descartadas.
3. **Distribuicao do Conjunto S2**:
   - Pelo menos 50% dos itens devem possuir evidencias diretamente recuperaveis na base local de checagens.
   - Pelo menos 25% dos itens devem ser genuinamente carentes de evidencias conclusivas, para avaliar a reacao dos usuarios ao estado `insufficient_evidence` (testando a diretriz de que "sem evidencia suficiente != falso").
4. **Conjunto S3 (Transferencia)**: 100% dos itens deste conjunto devem tratar de fatos nao indexados na base local, simulando um cenario real de novas afirmacoes publicadas na web.
5. **Mitigacao de Riscos Eticos no Conteudo**: Sao expressamente vetados itens que envolvam desinformacao medica com risco grave a saude (ex.: tratamentos danosos para doencas criticas), promocao de odio, violencia ou conteudo que possa desestabilizar emocionalmente os participantes.

---

## 6. Participantes: Criterios de Inclusao e Exclusao

### Criterios de Inclusao
- Idade igual ou superior a 18 anos completos na data da sessao.
- Fluencia nativa ou comprovada em Portugues do Brasil (PT-BR).
- Uso habitual de navegadores web e consumo de conteudo informativo digital (videos, noticias).
- Aceite formal do Termo de Consentimento Livre e Esclarecido (TCLE).

### Criterios de Exclusao
- Integrantes da equipe do projeto EvidencIA ou colaboradores diretos do desenvolvimento.
- Conhecimento previo comprovado dos itens de teste selecionados para o experimento.
- Nao conclusao de todas as fases da sessao por desistencia voluntaria ou falha tecnica irreversivel.

### Politica de Exclusao de Sessao
Uma sessao sera marcada como excluida da analise confirmatoria caso ocorra:
- Falha de software que impeca o registro de telemetria por mais de uma fase.
- Interrupcao externa que suspenda a tarefa por mais de 5 minutos.
- Denominador nulo em metricas essenciais decorrente de anomalia instrumental.
- Todas as exclusoes serao quantificadas e descritas no relatorio final, preservando a rastreabilidade metodologica.

---

## 7. Estudo Piloto e Congelamento (Tag `act-prereg-v1`)

Antes da execucao formal com a coorte principal, sera realizado um **estudo piloto com 2 a 3 participantes**:

- **Objetivos do Piloto**: Identificar ambiguidades nos enunciados das alegacoes, calibrar o tempo de cada fase, validar o funcionamento silencioso da telemetria e avaliar a naturalidade do script do facilitador.
- **Descarte de Dados do Piloto**: Os dados colhidos no piloto nao serao computados no conjunto de resultados finais do experimento.
- **Congelamento Metodologico**: Finalizado o piloto e efetuados eventuais ajustes finos no protocolo e no banco de itens, o repositorio sera etiquetado com a tag Git imutavel:
  ```bash
  git tag -a act-prereg-v1 -m "docs(cbl-act): pre-registration protocol and metric thresholds freeze"
  ```
- Apos a criacao desta tag, **nenhuma hipotese, formula ou limiar de decisao podera ser modificado**. Qualquer alteracao superveniente constituira desvio de protocolo e devera ser registrada como tal no relatorio de resultados.

---

## 8. Plano de Analise Estatistica

- **Abordagem**: Estudo eminentemente exploratorio e descritivo, focado em variacao comportamental e distribuicao empirica. Nao serao emitidas afirmacoes categoricas de significancia estatistica classica ou causalidade determinista restrita.
- **Intervalos de Confianca**: Estimados via **bootstrap nao parametrico com 10.000 reamostragens** (percentil bootstrap a 95%) para cada metrica continuada e taxa agregada.
- **Semente Fixa**: A analise sera executada com semente pseudoaleatoria fixa documentada (`seed = 42`), garantindo reprodutibilidade numerica exata.
- **Tamanho de Amostra Proposto**: Minimo de **10 participantes por condicao** (total N = 20 participantes validos), compativel com o carater exploratorio da fase Act e os limites operacionais do ciclo letivo.

---

## 9. Excecao Controlada ao ADR-001 / ADR-006

- **Justificativa Metodologica**: Para testar a hipotese de que a UX evidence-first altera favoravelmente a postura critica em relacao a um veredito pronto, e indispensavel dispor de uma interface de controle que materialize a apresentacao do veredito algoritmico (gauge e score consolidado).
- **Escopo e Contencao**: A Condicao A reside exclusivamente em `experiments/control-gauge-prototype/` no repositorio `EvidencIA`. Este prototipo e isolado, estatico, nao compoe o bundle de producao da extensao e esta registrado no log de decisoes de produto como a decisao formal **D-008**.
- **Mecanismo de Bloqueio**: A inclusao deste prototipo no manifesto de producao ou no pipeline de publicacao e bloqueada pelas politicas de integracao continua e de freeze.

---

## 10. Riscos e Mitigacao

| Risco Identificado | Impacto | Estrategia de Mitigacao |
|:---|:---|:---|
| **Efeito de Aprendizado entre Fases** | Participante desempenhar melhor em F3 por treino previo | Desenho de transferencia balanceado entre grupos; comparacao intra-fase e controle de ordem de apresentacao. |
| **Vies do Facilitador (Efeito Rosenthal)** | Facilitador induzir respostas favoraveis a ferramenta | Script do facilitador rigidamente padronizado e verbatim; proibicao de dicas substantivas durante a execucao. |
| **Efeito Hawthorne** | Participante mudar habito por saber que esta sendo observado | Explicacao de que o foco de avaliacao e a compreensao da interface e a clareza da informacao, nao a capacidade individual do voluntario. |
| **Vazamento de Itens entre Participantes** | Participante relatar os estimulos a futuros voluntarios | Orientacao explicita de sigilo durante o debriefing e aplicacao concentrada em janela temporal restrita. |
| **Variabilidade Estocastica de LLM** | Respostas da IA oscilarem entre sessoes | Congelamento rigoroso de fixtures em ambiente de teste com `analysisMode="mock"`. |
