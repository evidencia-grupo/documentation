# Plano do Experimento — Fase CBL Act

## 1. Objetivo e Alinhamento com a Essential Question e Guiding Questions

O objetivo deste plano experimental é avaliar empiricamente se a interface centrada em evidências e perguntas reflexivas (**Condição B — Evidence-First**) estimula um comportamento investigativo ativo e preserva a autonomia crítica do usuário, quando comparada a uma interface baseada em veredito algorítmico (**Condição A — Controle com Score Global e Gauge**).

O experimento se ancora diretamente na **Essential Question** do projeto:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?"*

E operacionaliza quatro **Guiding Questions** centrais documentadas em `docs/visao/guiding-questions.md`:

- **GQ02 (Substituição de Julgamento)**: Como evitar que o usuário aceite passivamente uma classificação automatizada sem analisar os fatos? O experimento mede se a interface B induz a inspeção ativa de fontes e evidências antes de emitir um veredito pessoal.
- **GQ05 (Incerteza e Evidência Insuficiente)**: O produto comunica adequadamente que "ausência de evidência confirmatória não equivale a falsidade"? O experimento avalia o tratamento dado a alegações com estado `insufficient_evidence` e `conflicting`.
- **GQ08 (Heurísticas e Engajamento Reflexivo)**: Que estímulos de interface provocam reflexão sistemática em vez de reação rápida e heurística? Avalia-se a interação com perguntas reflexivas (Reflection Cards).
- **GQ11 (Métricas de Pensamento Crítico)**: Como aferir se a intervenção promoveu postura crítica sustentável? O experimento mensura comportamento investigativo, calibração de confiança e transferência de habilidades para tarefas sem ferramenta.

---

## 2. Hipóteses Pré-Registradas

As hipóteses foram formuladas em linguagem testável e devem ser registradas e travadas antes do início de qualquer coleta:

- **H1 (Inspeção Comportamental)**: Participantes na Condição B apresentarão maior taxa de inspeção de evidências (Evidence Inspection Rate) do que participantes na Condição A.
  - *Métrica associada*: **M1 (EIR)** e **M1b (SOR)**.
- **H2 (Não Inferioridade em Acurácia)**: A acurácia final de julgamento na Condição B não é inferior à da Condição A, respeitando uma margem de não inferioridade pré-estabelecida delta = 0,05.
  - *Métrica associada*: **M5 (Final Accuracy e Delta-Accuracy)**.
- **H3 (Calibração de Confiança)**: Participantes na Condição B apresentarão melhor calibração entre confiança subjetiva e acurácia objetiva (menor erro quadrático de Brier e menor intervalo de superconfiança) do que participantes na Condição A.
  - *Métrica associada*: **M4 (Confidence Calibration)**.
- **H4 (Transferência Cognitiva)**: Na fase de transferência sem auxílio de ferramenta (Fase 3), participantes previamente expostos à Condição B demonstrarão acurácia equivalente ou superior e executarão maior número de passos de verificação distintos do que participantes da Condição A.
  - *Métrica associada*: **M6 (TTA)** e **M6b (VSC)**.
- **H5 (Custo Cognitivo e Temporal)**: O tempo total para conclusão (Time to Conclusion) e o esforço subjetivo percebido (Single Ease Question) na Condição B não excederão os limites de viabilidade operacional tolerados em relação à Condição A.
  - *Métrica associada*: **M7 (TTC)** e **M8 (SEQ)**.

---

## 3. Desenho Experimental

O estudo adota um delineamento **exploratório entre sujeitos (between-subjects)** com duas condições (A vs. B) e três fases cronológicas consecutivas por participante:

```text
Participante (P-XXXX)
        |
        +---> Bloco de Aleatorização (Offline) ---> Atribuição: Condição A ou B
        |
        +---> Fase 1: Baseline (Sem Ferramenta) — Conjunto S1 (4 itens)
        |
        +---> Fase 2: Assistida (Condição A ou B) — Conjunto S2 (4 itens)
        |
        +---> Fase 3: Transferência (Sem Ferramenta) — Conjunto S3 (3 itens)
        |
        +---> Questionário Pós-Tarefa (SEQ + Passos) e Debriefing Factual
```

### Distribuição das Fases e Conjuntos de Estímulos

- **Fase 1 (Baseline)**: O participante avalia itens do conjunto **S1** (proposta: 4 itens) sem qualquer apoio automatizado, estabelecendo seu nível basal de acurácia e tempo.
- **Fase 2 (Assistida)**: O participante avalia itens do conjunto **S2** (proposta: 4 itens) com suporte da interface correspondente à condição sorteada (A ou B).
- **Fase 3 (Transferência)**: O participante avalia itens inéditos do conjunto **S3** (proposta: 3 itens) sem nenhuma ferramenta, permitindo verificar a retenção de hábitos de escrutínio crítico.

### Estrutura dos Itens

- Cada item consiste em um trecho curto de vídeo ou transcrição (duração ≤ 90 segundos) contendo de 2 a 3 alegações factuais delimitadas.
- Os conjuntos S1, S2 e S3 são disjuntos (nenhum item se repete entre fases).
- S1 e S2 são pareados em termos de distribuição de dificuldade e categorias temáticas.
- O conjunto S3 é integralmente inédito e mantido fora de qualquer base de evidências pré-carregada.

### Aleatorização

A alocação dos participantes entre as condições A e B será conduzida pelo pesquisador responsável utilizando uma tabela de **aleatorização em blocos balanceados de tamanho 4** (ex.: AABB, ABAB, BABA, BBAA). A lista de correspondência entre pseudônimo (`P-0001`, `P-0002`, ...) e a condição designada é mantida rigorosamente **offline**, em arquivo seguro e fora do repositório Git.

---

## 4. Especificação das Condições Experimentais

### Condição A (Controle — Veredito Algorítmico)

A Condição A reproduz a abordagem convencional de checagem automatizada baseada em autoridade algorítmica (paradigma anterior ao ADR-006):

- **Elemento Central**: Painel com medidor visual tipo *gauge* e pontuação numérica global (score de 0 a 100) associada a um rótulo taxativo de veredito ("Verdadeiro", "Falso", "Enganoso").
- **Alegações**: Apresenta a lista das mesmas alegações do item.
- **Evidências**: Não expõe os cards de evidências abertos por padrão; as fontes originais estão colapsadas sob o botão "Ver fontes", exigindo ação deliberada para inspeção (garantindo que a ação de inspeção seja mensurável e comparável a B).
- **Restrições Estritas**: Não possui categorização semântica de relação (*sustenta*, *contradiz*, *contextualiza*), não apresenta estados explícitos de incerteza metodológica, nem contém perguntas reflexivas.
- **Isolamento de Engenharia**: O protótipo da Condição A será construído como uma aplicação web estática independente (HTML/TypeScript + fixtures locais), alocada no diretório `experiments/control-gauge-prototype/` do repositório `EvidencIA`. Este artefato é expressamente excluído dos scripts de empacotamento da extensão de produção, opera sem conexão de rede com o backend e emite o mesmo envelope de telemetria com campo fixo `cond: "A"`.

### Condição B (Teste — Evidence-First e Engajamento Reflexivo)

A Condição B implementa a totalidade das diretrizes do ADR-006 e dos requisitos HU11/HU13/HU14/HU15:

- **Elemento Central**: Interface orientada à investigação analítica por alegação, sem nenhum score consolidado ou medidor sintético de confiabilidade.
- **Evidence Cards**: Cada alegação exibe cards de evidência contendo trechos factuais rastreáveis e classificação explícita da relação lógica (`supports`, `contradicts`, `contextualizes`).
- **Estados de Incerteza**: Identificação visual clara para alegações com evidência insuficiente (`insufficient_evidence`), fontes conflitantes (`conflicting`) ou evidências desatualizadas (`dated`).
- **Reflection Cards (HU11/HU15)**: Questões reflexivas interativas que convidam o participante a ponderar sobre potenciais vieses, ausência de contexto e passos complementares de checagem.
- **Controle de Variabilidade**: Utilização de fixtures estáticas pré-extraídas no ambiente de teste para neutralizar latência e oscilações de rede ou alucinações estocásticas de LLM. A flag de análise é fixada como `analysisMode="mock"`, exclusiva do ambiente experimental e estritamente proibida em compilações de produção.

---

## 5. Banco de Itens e Regras de Construção

A montagem do banco de estímulos segue preceitos metodológicos rigorosos:

1. **Rotulagem Dupla Cega**: A verdade-terreno de cada alegação é determinada de forma independente por dois pesquisadores, tomando como referência relatórios publicados por agências profissionais de fact-checking reconhecidas pela IFCN (ex.: Aos Fatos, Lupa, Boatos.org, E-farsas).
2. **Resolução de Divergências**: Casos de discrepância entre os avaliadores devem ser deliberados com um terceiro membro e documentados com a justificativa final. Alegações ambíguas são descartadas.
3. **Distribuição do Conjunto S2**:
   - Pelo menos 50% dos itens devem possuir evidências diretamente recuperáveis na base local de checagens.
   - Pelo menos 25% dos itens devem ser genuinamente carentes de evidências conclusivas, para avaliar a reação dos usuários ao estado `insufficient_evidence` (testando a diretriz de que "sem evidência suficiente != falso").
4. **Conjunto S3 (Transferência)**: 100% dos itens deste conjunto devem tratar de fatos não indexados na base local, simulando um cenário real de novas afirmações publicadas na web.
5. **Mitigação de Riscos Éticos no Conteúdo**: São expressamente vetados itens que envolvam desinformação médica com risco grave à saúde (ex.: tratamentos danosos para doenças críticas), promoção de ódio, violência ou conteúdo que possa desestabilizar emocionalmente os participantes.

---

## 6. Participantes: Critérios de Inclusão e Exclusão

### Critérios de Inclusão
- Idade igual ou superior a 18 anos completos na data da sessão.
- Fluência nativa ou comprovada em Português do Brasil (PT-BR).
- Uso habitual de navegadores web e consumo de conteúdo informativo digital (vídeos, notícias).
- Aceite formal do Termo de Consentimento Livre e Esclarecido (TCLE).

### Critérios de Exclusão
- Integrantes da equipe do projeto EvidencIA ou colaboradores diretos do desenvolvimento.
- Conhecimento prévio comprovado dos itens de teste selecionados para o experimento.
- Não conclusão de todas as fases da sessão por desistência voluntária ou falha técnica irreversível.

### Política de Exclusão de Sessão
Uma sessão será marcada como excluída da análise confirmatória caso ocorra:
- Falha de software que impeça o registro de telemetria por mais de uma fase.
- Interrupção externa que suspenda a tarefa por mais de 5 minutos.
- Denominador nulo em métricas essenciais decorrente de anomalia instrumental.
- Todas as exclusões serão quantificadas e descritas no relatório final, preservando a rastreabilidade metodológica.

---

## 7. Estudo Piloto e Congelamento (Tag `act-prereg-v1`)

Antes da execução formal com a coorte principal, será realizado um **estudo piloto com 2 a 3 participantes**:

- **Objetivos do Piloto**: Identificar ambiguidades nos enunciados das alegações, calibrar o tempo de cada fase, validar o funcionamento silencioso da telemetria e avaliar a naturalidade do script do facilitador.
- **Descarte de Dados do Piloto**: Os dados colhidos no piloto não serão computados no conjunto de resultados finais do experimento.
- **Congelamento Metodológico**: Finalizado o piloto e efetuados eventuais ajustes finos no protocolo e no banco de itens, o repositório será etiquetado com a tag Git imutável:
  ```bash
  git tag -a act-prereg-v1 -m "docs(cbl-act): pre-registration protocol and metric thresholds freeze"
  ```
- Após a criação desta tag, **nenhuma hipótese, fórmula ou limiar de decisão poderá ser modificado**. Qualquer alteração superveniente constituirá desvio de protocolo e deverá ser registrada como tal no relatório de resultados.

---

## 8. Plano de Análise Estatística

- **Abordagem**: Estudo eminentemente exploratório e descritivo, focado em variação comportamental e distribuição empírica. Não serão emitidas afirmações categóricas de significância estatística clássica ou causalidade determinista restrita.
- **Intervalos de Confiança**: Estimados via **bootstrap não paramétrico com 10.000 reamostragens** (percentil bootstrap a 95%) para cada métrica continuada e taxa agregada.
- **Semente Fixa**: A análise será executada com semente pseudoaleatória fixa documentada (`seed = 42`), garantindo reprodutibilidade numérica exata.
- **Tamanho de Amostra Proposto**: Mínimo de **10 participantes por condição** (total N = 20 participantes válidos), compatível com o caráter exploratório da fase Act e os limites operacionais do ciclo letivo.

---

## 9. Exceção Controlada ao ADR-001 / ADR-006

- **Justificativa Metodológica**: Para testar a hipótese de que a UX evidence-first altera favoravelmente a postura crítica em relação a um veredito pronto, é indispensável dispor de uma interface de controle que materialize a apresentação do veredito algorítmico (gauge e score consolidado).
- **Escopo e Contenção**: A Condição A reside exclusivamente em `experiments/control-gauge-prototype/` no repositório `EvidencIA`. Este protótipo é isolado, estático, não compõe o bundle de produção da extensão e está registrado no log de decisões de produto como a decisão formal **D-008**.
- **Mecanismo de Bloqueio**: A inclusão deste protótipo no manifesto de produção ou no pipeline de publicação é bloqueada pelas políticas de integração contínua e de freeze.

---

## 10. Riscos e Mitigação

| Risco Identificado | Impacto | Estratégia de Mitigação |
|:---|:---|:---|
| **Efeito de Aprendizado entre Fases** | Participante desempenhar melhor em F3 por treino prévio | Desenho de transferência balanceado entre grupos; comparação intra-fase e controle de ordem de apresentação. |
| **Viés do Facilitador (Efeito Rosenthal)** | Facilitador induzir respostas favoráveis à ferramenta | Script do facilitador rigidamente padronizado e verbatim; proibição de dicas substantivas durante a execução. |
| **Efeito Hawthorne** | Participante mudar hábito por saber que está sendo observado | Explicação de que o foco de avaliação é a compreensão da interface e a clareza da informação, não a capacidade individual do voluntário. |
| **Vazamento de Itens entre Participantes** | Participante relatar os estímulos a futuros voluntários | Orientação explícita de sigilo durante o debriefing e aplicação concentrada em janela temporal restrita. |
| **Variabilidade Estocástica de LLM** | Respostas da IA oscilarem entre sessões | Congelamento rigoroso de fixtures em ambiente de teste com `analysisMode="mock"`. |
