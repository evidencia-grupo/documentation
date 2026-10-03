# Plano do Experimento — Fase CBL Act

## 1. Objetivo e Alinhamento com a Essential Question e Guiding Questions

O objetivo deste plano experimental e avaliar empiricamente se a interface centrada em evidências e perguntas reflexivas (**Condição B — Evidence-First**) estimula um comportamento investigativo ativo e preserva a autonomia crítica do usuário, quando comparada a uma interface baseada em veredito algoritmico (**Condição A — Controle com Score Global e Gauge**).

O experimento se ancora diretamente na **Essential Question** do projeto:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?"*

E operacionaliza quatro **Guiding Questions** centrais documentadas em `docs/visao/guiding-questions.md`:

- **GQ02 (Substituicao de Julgamento)**: Como evitar que o usuário aceite passivamente uma classificacao automatizada sem analisar os fatos? O experimento mede se a interface B induz a inspecao ativa de fontes e evidências antes de emitir um veredito pessoal.
- **GQ05 (Incerteza e Evidência Insuficiente)**: O produto comunica adequadamente que "ausência de evidência confirmatoria não equivale a falsidade"? O experimento avalia o tratamento dado a alegações com estado `insufficient_evidence` e `conflicting`.
- **GQ08 (Heuristicas e Engajamento Reflexivo)**: Que estimulos de interface provocam reflexão sistematica em vez de reacao rapida e heuristica? Avalia-se a interação com perguntas reflexivas (Reflection Cards).
- **GQ11 (Métricas de Pensamento Crítico)**: Como aferir se a intervencao promoveu postura crítica sustentavel? O experimento mensura comportamento investigativo, calibracao de confianca e transferencia de habilidades para tarefas sem ferramenta.

---

## 2. Hipoteses Pre-Registradas

As hipoteses foram formuladas em linguagem testavel e devem ser registradas e travadas antes do inicio de qualquer coleta:

- **H1 (Inspecao Comportamental)**: Participantes na Condição B apresentarao maior taxa de inspecao de evidências (Evidence Inspection Rate) do que participantes na Condição A.
  - *Métrica associada*: **M1 (EIR)** e **M1b (SOR)**.
- **H2 (Não-Inferioridade em Acuracia)**: A acuracia final de julgamento na Condição B não e inferior a da Condição A, respeitando uma margem de não-inferioridade pre-estabelecida delta = 0.05.
  - *Métrica associada*: **M5 (Final Accuracy e Delta-Accuracy)**.
- **H3 (Calibracao de Confianca)**: Participantes na Condição B apresentarao melhor calibracao entre confianca subjetiva e acuracia objetiva (menor erro quadratico de Brier e menor gap de superconfianca) do que participantes na Condição A.
  - *Métrica associada*: **M4 (Confidence Calibration)**.
- **H4 (Transferencia Cognitiva)**: Na fase de transferencia sem auxilio de ferramenta (Fase 3), participantes previamente expostos a Condição B demonstrarao acuracia equivalente ou superior e executarao maior número de passos de verificacao distintos do que participantes da Condição A.
  - *Métrica associada*: **M6 (TTA)** e **M6b (VSC)**.
- **H5 (Custo Cognitivo e Temporal)**: O tempo total para conclusão (Time to Conclusion) e o esforco subjetivo percebido (Single Ease Question) na Condição B não excederao os limites de viabilidade operacional tolerados em relação a Condição A.
  - *Métrica associada*: **M7 (TTC)** e **M8 (SEQ)**.

---

## 3. Desenho Experimental

O estudo adota um delineamento **exploratorio entre sujeitos (between-subjects)** com duas condições (A vs. B) e tres fases cronologicas consecutivas por participante:

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

### Distribuição das Fases e Conjuntos de Estimulos

- **Fase 1 (Baseline)**: O participante avalia itens do conjunto **S1** (proposta: 4 itens) sem qualquer apoio automatizado, estabelecendo seu nivel basal de acuracia e tempo.
- **Fase 2 (Assistida)**: O participante avalia itens do conjunto **S2** (proposta: 4 itens) com suporte da interface correspondente a condição sorteada (A ou B).
- **Fase 3 (Transferencia)**: O participante avalia itens inéditos do conjunto **S3** (proposta: 3 itens) sem nenhuma ferramenta, permitindo verificar a retenção de habitos de escrutinio crítico.

### Estrutura dos Itens

- Cada item consiste em um trecho curto de vídeo ou transcrição (duracao <= 90 segundos) contendo de 2 a 3 alegações factuais delimitadas.
- Os conjuntos S1, S2 e S3 são disjuntos (nenhum item se repete entre fases).
- S1 e S2 são pareados em termos de distribuição de dificuldade e categorias tematicas.
- O conjunto S3 e integralmente inedito e mantido fora de qualquer base de evidências pré-carregada.

### Aleatorizacao

A alocacao dos participantes entre as condições A e B sera conduzida pelo pesquisador responsável utilizando uma tabela de **aleatorizacao em blocos balanceados de tamanho 4** (ex.: AABB, ABAB, BABA, BBAA). A lista de correspondencia entre pseudonimo (`P-0001`, `P-0002`, ...) e a condição designada e mantida rigorosamente **offline**, em arquivo seguro e fora do repositorio Git.

---

## 4. Especificação das Condições Experimentais

### Condição A (Controle — Veredito Algoritmico)

A Condição A reproduz a abordagem convencional de checagem automatizada baseada em autoridade algoritmica (paradigma anterior ao ADR-006):

- **Elemento Central**: Painel com medidor visual tipo *gauge* e pontuação numerica global (score de 0 a 100) associada a um rotulo taxativo de veredito ("Verdadeiro", "Falso", "Enganoso").
- **Alegações**: Apresenta a lista das mesmas alegações do item.
- **Evidências**: Não expoe os cards de evidências abertos por padrão; as fontes originais estao colapsadas sob o botao "Ver fontes", exigindo acao deliberada para inspecao (garantindo que a acao de inspecao seja mensuravel e comparavel a B).
- **Restricoes Estritas**: Não possui categorizacao semantica de relação (*sustenta*, *contradiz*, *contextualiza*), não apresenta estados explicitos de incerteza metodológica, nem contem perguntas reflexivas.
- **Isolamento de Engenharia**: O prototipo da Condição A sera construido como uma aplicacao web estatica independente (HTML/TypeScript + fixtures locais), alocada no diretorio `experiments/control-gauge-prototype/` do repositorio `EvidencIA`. Este artefato e expressamente excluido dos scripts de empacotamento da extensão de produção, opera sem conexao de rede com o backend e emite o mesmo envelope de telemetria com campo fixo `cond: "A"`.

### Condição B (Teste — Evidence-First e Engajamento Reflexivo)

A Condição B implementa a totalidade das diretrizes do ADR-006 e dos requisitos HU11/HU13/HU14/HU15:

- **Elemento Central**: Interface orientada a investigacao analitica por alegação, sem nenhum score consolidado ou medidor sintetico de confiabilidade.
- **Evidence Cards**: Cada alegação exibe cards de evidência contendo trechos factuais rastreaveis e classificacao explicita da relação logica (`supports`, `contradicts`, `contextualizes`).
- **Estados de Incerteza**: Identificacao visual clara para alegações com evidência insuficiente (`insufficient_evidence`), fontes conflitantes (`conflicting`) ou evidências desatualizadas (`dated`).
- **Reflection Cards (HU11/HU15)**: Questões reflexivas interativas que convidam o participante a ponderar sobre potenciais vieses, ausência de contexto e passos complementares de checagem.
- **Controle de Variabilidade**: Utilizacao de fixtures estaticas pre-extraidas no ambiente de teste para neutralizar latencia e oscilacoes de rede ou alucinacoes estocasticas de LLM. A flag de análise e fixada como `analysisMode="mock"`, exclusiva do ambiente experimental e estritamente proibida em compilacoes de produção.

---

## 5. Banco de Itens e Regras de Construção

A montagem do banco de estimulos deve seguir os preceitos detalhados em `item-bank-template.md`:

1. **Rotulagem Dupla Cega**: A verdade-terreno de cada alegação e determinada de forma independente por dois pesquisadores, tomando como referência relatorios publicados por agencias profissionais de fact-checking reconhecidas pela IFCN (ex.: Aos Fatos, Lupa, Boatos.org, E-farsas).
2. **Resolucao de Divergencias**: Casos de discrepancia entre os avaliadores devem ser deliberados com um terceiro membro e documentados com a justificativa final. Alegações ambiguas são descartadas.
3. **Distribuição do Conjunto S2**:
   - Pelo menos 50% dos itens devem possuir evidências diretamente recuperaveis na base local de checagens.
   - Pelo menos 25% dos itens devem ser genuinamente carentes de evidências conclusivas, para avaliar a reacao dos usuários ao estado `insufficient_evidence` (testando a diretriz de que "sem evidência suficiente != falso").
4. **Conjunto S3 (Transferencia)**: 100% dos itens deste conjunto devem tratar de fatos não indexados na base local, simulando um cenario real de novas afirmações publicadas na web.
5. **Mitigacao de Riscos Eticos no Conteúdo**: São expressamente vetados itens que envolvam desinformacao medica com risco grave a saúde (ex.: tratamentos danosos para doencas críticas), promocao de odio, violencia ou conteúdo que possa desestabilizar emocionalmente os participantes.

---

## 6. Participantes: Critérios de Inclusao e Exclusao

### Critérios de Inclusao
- Idade igual ou superior a 18 anos completos na data da sessão.
- Fluencia nativa ou comprovada em Portugues do Brasil (PT-BR).
- Uso habitual de navegadores web e consumo de conteúdo informativo digital (vídeos, noticias).
- Aceite formal do Termo de Consentimento Livre e Esclarecido (TCLE).

### Critérios de Exclusao
- Integrantes da equipe do projeto EvidencIA ou colaboradores diretos do desenvolvimento.
- Conhecimento previo comprovado dos itens de teste selecionados para o experimento.
- Não conclusão de todas as fases da sessão por desistencia voluntaria ou falha técnica irreversivel.

### Politica de Exclusao de Sessão
Uma sessão sera marcada como excluida da análise confirmatoria caso ocorra:
- Falha de software que impeca o registro de telemetria por mais de uma fase.
- Interrupcao externa que suspenda a tarefa por mais de 5 minutos.
- Denominador nulo em métricas essenciais decorrente de anomalia instrumental.
- Todas as exclusoes serao quantificadas e descritas no relatorio final, preservando a rastreabilidade metodológica.

---

## 7. Estudo Piloto e Congelamento (Tag `act-prereg-v1`)

Antes da execução formal com a coorte principal, sera realizado um **estudo piloto com 2 a 3 participantes**:

- **Objetivos do Piloto**: Identificar ambiguidades nos enunciados das alegações, calibrar o tempo de cada fase, validar o funcionamento silencioso da telemetria e avaliar a naturalidade do script do facilitador.
- **Descarte de Dados do Piloto**: Os dados colhidos no piloto não serao computados no conjunto de resultados finais do experimento.
- **Congelamento Metodológico**: Finalizado o piloto e efetuados eventuais ajustes finos no protocolo e no banco de itens, o repositorio sera etiquetado com a tag Git imutavel:
  ```bash
  git tag -a act-prereg-v1 -m "docs(cbl-act): pre-registration protocol and metric thresholds freeze"
  ```
- Após a criacao desta tag, **nenhuma hipotese, formula ou limiar de decisão podera ser modificado**. Qualquer alteracao superveniente constituira desvio de protocolo e devera ser registrada como tal no relatorio de resultados.

---

## 8. Plano de Análise Estatística

- **Abordagem**: Estudo eminentemente exploratorio e descritivo, focado em variacao comportamental e distribuição empirica. Não serao emitidas afirmações categoricas de significancia estatística classica ou causalidade determinista restrita.
- **Intervalos de Confianca**: Estimados via **bootstrap não parametrico com 10.000 reamostragens** (percentil bootstrap a 95%) para cada métrica continuada e taxa agregada.
- **Semente Fixa**: A análise sera executada com semente pseudoaleatoria fixa documentada (`seed = 42`), garantindo reprodutibilidade numerica exata.
- **Tamanho de Amostra Proposto**: Minimo de **10 participantes por condição** (total N = 20 participantes validos), compatível com o carater exploratorio da fase Act e os limites operacionais do ciclo letivo.

---

## 9. Excecao Controlada ao ADR-001 / ADR-006

- **Justificativa Metodológica**: Para testar a hipotese de que a UX evidence-first altera favoravelmente a postura crítica em relação a um veredito pronto, e indispensavel dispor de uma interface de controle que materialize a apresentação do veredito algoritmico (gauge e score consolidado).
- **Escopo e Contencao**: A Condição A reside exclusivamente em `experiments/control-gauge-prototype/` no repositorio `EvidencIA`. Este prototipo e isolado, estatico, não compoe o bundle de produção da extensão e esta registrado no log de decisões de produto como a decisão formal **D-008**.
- **Mecanismo de Bloqueio**: A inclusao deste prototipo no manifesto de produção ou no pipeline de publicacao e bloqueada pelas politicas de integração continua e de freeze.

---

## 10. Riscos e Mitigacao

| Risco Identificado | Impacto | Estratégia de Mitigacao |
|:---|:---|:---|
| **Efeito de Aprendizado entre Fases** | Participante desempenhar melhor em F3 por treino previo | Desenho de transferencia balanceado entre grupos; comparacao intra-fase e controle de ordem de apresentação. |
| **Vies do Facilitador (Efeito Rosenthal)** | Facilitador induzir respostas favoraveis a ferramenta | Script do facilitador rigidamente padronizado e verbatim; proibição de dicas substantivas durante a execução. |
| **Efeito Hawthorne** | Participante mudar habito por saber que esta sendo observado | Explicacao de que o foco de avaliação e a compreensao da interface e a clareza da informação, não a capacidade individual do voluntario. |
| **Vazamento de Itens entre Participantes** | Participante relatar os estimulos a futuros voluntarios | Orientação explicita de sigilo durante o debriefing e aplicacao concentrada em janela temporal restrita. |
| **Variabilidade Estocastica de LLM** | Respostas da IA oscilarem entre sessões | Congelamento rigoroso de fixtures em ambiente de teste com `analysisMode="mock"`. |
