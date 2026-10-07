# Definição de Métricas e Regra de Decisão Pré-Registrada — Fase CBL Act

> **O que você vai encontrar aqui:** Formalização matemática e conceitual das métricas comportamentais (M1 a M9), convenções de cálculo, regras de tratamento para denominadores nulos e matriz de decisão preestabelecida para validar a arquitetura Evidence-First no YouTube.

---

## 1. Convenções e Notação Matemática

Para todas as fórmulas definidas neste documento, adota-se a seguinte notação formal:

- `s ∈ S`: Sessão individual associada a um participante pseudonimizado `P`.
- `cond(s) ∈ {A, B}`: Condição experimental atribuída à sessão `s` (Condição A: controle com velocímetro/score; Condição B: intervenção Evidence-First).
- `fase ∈ {baseline, assisted, transfer}`: Fases do experimento (Fase 1: basal; Fase 2: assistida; Fase 3: transferência).
- `i ∈ I_p`: Item apresentado na fase `p`.
- `c ∈ C_i`: Alegação individual presente no item `i`.
- `d(s, c, etapa)`: Decisão registrada pelo participante para a alegação `c`, onde `etapa ∈ {pre_evidence, final}`.
- `gt(c) ∈ {supported, contradicted, misleading, insufficient}`: Rótulo objetivo de verdade-terreno (*ground truth*) da alegação `c`, definido por agências profissionais de checagem.
- `o(d) ∈ {0, 1}`: Função indicadora de acurácia factual (`o(d) = 1` se `d = gt(c)`; `o(d) = 0` caso contrário).
- `conf(d) ∈ [0, 100]`: Grau subjetivo de confiança expresso pelo participante de que sua decisão está correta (escala de 0% a 100%).
- `p_conf(d) = conf(d) / 100 ∈ [0.0, 1.0]`: Grau de confiança normalizado em probabilidade decimal.

---

## 2. Catálogo Detalhado de Métricas Comportamentais (M1 a M9)

### M1 — Taxa de Inspeção de Evidências (Evidence Inspection Rate - EIR)
- **Definição:** Proporção de alegações visualizadas na fase assistida cujos cartões de evidência factual correspondentes foram explicitamente expandidos pelo usuário ao menos uma vez.
- **Fórmula de Cálculo:**
  ```text
  EIR_s = (Alegações assistidas com expansão de evidência >= 1) / (Total de alegações visualizadas)
  ```
- **Unidade de Análise:** Participante individual por sessão `s`.
- **Agregado por Condição:** Média aritmética `EIR_médio` acompanhada da proporção de sessões em que `EIR_s > 0`.
- **Tratamento de Denominador Nulo:** Se nenhuma alegação for registrada como visualizada na fase assistida, a sessão é considerada inválida para M1, excluída do cálculo e contabilizada no relatório de desvios.
- **Condições Aplicáveis:** Condição A (expansão do link "Ver fontes") e Condição B (expansão dos Evidence Cards).
- **Interpretação:** Mensura se a interface estimula a leitura e inspeção crítica das evidências antes do julgamento final.
- **Mitigação de Ruído:** Cliques repetidos em sequência rápida sem tempo hábil de leitura são filtrados cruzando o evento com o Tempo até Conclusão (TTC).

---

### M1b — Taxa de Abertura de Fontes Externas (Source Open Rate - SOR)
- **Definição:** Proporção de alegações na fase assistida em que o participante clicou no link externo para abrir a matéria original do veículo de checagem em nova aba.
- **Fórmula de Cálculo:**
  ```text
  SOR_s = (Alegações com clique em link externo de fonte >= 1) / (Total de alegações visualizadas)
  ```
- **Unidade de Análise:** Participante individual por sessão `s`.
- **Tratamento de Denominador Nulo:** Idêntico ao critério de M1.
- **Condições Aplicáveis:** Condições A e B.
- **Interpretação:** Avalia o comportamento de leitura lateral espontânea (recorrer à fonte primária externa).

---

### M2 — Taxa de Interação com Perguntas Reflexivas (Reflection Interaction Rate - RIR)
- **Definição:** Taxa de engajamento ativo com as perguntas provocativas de reflexão crítica apresentadas na interface.
- **Fórmula de Cálculo:**
  ```text
  RIR_s = (Perguntas reflexivas expandidas ou respondidas) / (Total de perguntas reflexivas visualizadas)
  ```
- **Unidade de Análise:** Participante individual por sessão `s`.
- **Tratamento de Denominador Nulo:** Caso nenhuma pergunta reflexiva tenha sido apresentada na sessão, a métrica é assinalada como não aplicável (`null`).
- **Condições Aplicáveis:** Estritamente Condição B (a interface de controle com velocímetro da Condição A não possui perguntas reflexivas).
- **Interpretação:** Ações de fechamento voluntário sem resposta contam no denominador como visualizadas, mas não pontuam no numerador como engajamento positivo.

---

### M3 — Taxa de Revisão Pós-Evidência (Evidence Revision Rate - ERR)
- **Definição:** Frequência com que o participante altera sua percepção ou voto prévio após expandir e inspecionar as evidências factuais.
- **Fórmula de Cálculo:**
  ```text
  ERR_s = (Alegações elegíveis em que voto_final != voto_prévio) / (Total de alegações elegíveis)
  ```
  *Nota:* Alegações elegíveis são aquelas com registro de voto prévio, voto final e ao menos um evento de expansão de evidência entre ambos.
- **Subtaxas de Qualidade:**
  - **Revisão Construtiva (ERR_correta):** Participante estava incorreto na avaliação prévia e mudou para o julgamento correto após ler as evidências.
  - **Revisão Prejudicial (ERR_prejudicial):** Participante estava correto e mudou para incorreto após ler as evidências.
- **Tratamento de Denominador Nulo:** Se não houver alterações de voto (`voto_final == voto_prévio` para todas as alegações), define-se `ERR = 0` com nota explicativa.

---

### M3b — Taxa de Decisão Prematura (Premature Decision Rate - PDR)
- **Definição:** Proporção de decisões finais registradas de modo impulsivo, sem que nenhuma evidência factual tenha sido aberta ou inspecionada para aquela alegação.
- **Fórmula de Cálculo:**
  ```text
  PDR_s = (Alegações finalizadas com zero expansões de evidência) / (Total de alegações finalizadas)
  ```
- **Unidade de Análise:** Participante individual por sessão `s`.
- **Interpretação:** Avalia a complacência passiva do usuário. Valores altos na Condição A comprovam a tendência prejudicial de acatar o velocímetro/score sem reflexão analítica.

---

### M4 — Calibração de Confiança (Brier Score, Overconfidence Gap e ECE)
- **Definição:** Aferição matemática da harmonia entre o grau de certeza declarado pelo usuário e a veracidade empírica de seus acertos.
- **Indicadores Numéricos:**
  1. **Brier Score (BS):**
     ```text
     BS = (1 / N_decisões) * Soma((confiança_normalizada - acerto_binário)²)
     ```
     *(Valores próximos de 0 representam calibração ideal; valores próximos de 1 indicam forte descalibração).*
  2. **Gap de Superconfiança (OG - Overconfidence Gap):**
     ```text
     OG = (Média da confiança declarada) - (Taxa média de acerto factual)
     ```
     *(Valores positivos revelam ilusão de certeza em respostas erradas).*
  3. **Expected Calibration Error (ECE):**
     Particionamento das predições em faixas de probabilidade para calcular a diferença média ponderada entre acurácia e confiança.
- **Regra de Estabilidade Amostral:** O ECE é omitido caso o total de decisões avaliadas seja inferior a 100 (`N_decisões < 100`), prevenindo distorções aritméticas em amostras pequenas.

---

### M5 — Acurácia Final e Delta de Aprendizado (Delta-Accuracy)
- **Definição:**
  - **Acurácia por Fase (Acc):** Percentual de decisões finais concordantes com a apuração das agências de checagem.
  - **Delta de Acurácia Intraparticipante (Delta_Acc):**
    ```text
    Delta_Acc = Acurácia_fase_assistida - Acurácia_fase_basal
    ```
- **Interpretação:** Mede o ganho cognitivo efetivo proporcionado pelo uso da extensão frente à habilidade prévia individual da pessoa.

---

### M6 — Acurácia na Tarefa de Transferência (Transfer Task Accuracy - TTA)
- **Definição:** Percentual de acertos factuais obtido na Fase 3 (itens inéditos sem o suporte de nenhuma ferramenta), avaliando retenção de postura crítica.
- **Fórmula de Cálculo:**
  ```text
  TTA_s = (Acertos na Fase 3) / (Total de itens da Fase 3)
  ```
- **Interpretação:** Testa a hipótese de que o uso contínuo da abordagem Evidence-First desenvolve competências autônomas de pensamento crítico.

---

### M6b — Contagem de Etapas de Verificação Autônoma (Verification Steps Count - VSC)
- **Definição:** Quantidade de métodos independentes de checagem (buscar data, inspecionar canal, procurar fontes externas) que o participante executou de forma autônoma na fase de transferência.
- **Valores Possíveis:** Número inteiro entre 0 e 4 procedimentos relatados.

---

### M7 — Tempo até Conclusão da Decisão (Time to Conclusion - TTC)
- **Definição:** Intervalo de tempo em segundos transcorrido entre a seleção inicial da alegação na extensão e a submissão do veredito pelo usuário.
- **Métrica Sumarizada:** Mediana e Intervalo Interquartil (IQR) por condição experimental.
- **Ressalva:** Tempos excessivamente curtos revelam julgamento superficial; tempos desproporcionalmente longos indicam atrito de interface ou fadiga cognitiva.

---

### M8 — Esforço Subjetivo Percebido (Single Ease Question - SEQ)
- **Definição:** Avaliação de esforço relatada ao término da sessão na escala padronizada de 1 ("Muito difícil") a 7 ("Muito fácil").
- **Interpretação:** Monitora a viabilidade ergonômica da extensão. A abordagem reflexiva não pode se tornar exaustiva a ponto de inviabilizar o uso no dia a dia.

---

### M9 — Taxa de Comportamento Investigativo (Investigation Behavior Rate - IBR)
- **Status Metodológico:** Métrica exclusivamente de pesquisa e sumarização acadêmica. **É terminantemente proibido exibir este valor como nota, score ou índice de reputação para a pessoa usuária.**
- **Composição Paramétrica:**
  ```text
  IBR_Condição_B = (Taxa_Seleção + EIR + SOR + RIR) / 4
  ```

---

## 3. Regra de Decisão Pré-Registrada (Framework de Validação Act)

Para blindar a avaliação contra viés confirmatório ou interpretações arbitrárias, os limiares de sucesso foram definidos antes da coleta empírica:

### Limiares Numéricos Homologados

| Limiar | Parâmetro Avaliado | Valor de Corte | Racionalidade Metodológica |
|:---:|:---|:---:|:---|
| **θ₁** | Taxa mínima de inspeção na Condição B (EIR_B) | **≥ 60%** | A ampla maioria das alegações deve ter evidências consultadas |
| **θ₂** | Diferença mínima de inspeção frente ao controle (EIR_B - EIR_A) | **≥ +20 pp** | A Condição B deve superar o velocímetro por margem expressiva |
| **θ₃** | Taxa mínima de revisão orientada por evidência (ERR_B) | **≥ 15%** | As evidências devem provocar reavaliação consciente no usuário |
| **θ₄** | Engajamento mínimo com perguntas reflexivas (RIR_B) | **≥ 30%** | Pelo menos um terço dos estímulos de reflexão deve ser interagido |
| **δ** | Margem de não-inferioridade em acurácia (Acc_B vs. Acc_A) | **≤ 5 pp** | Tolerância máxima de variação estatística em acerto geral |
| **ρ** | Razão máxima permitida de tempo (Mediana TTC_B / TTC_A) | **≤ 1,50** | A reflexão crítica não pode demorar mais que 1,5× o veredito passivo |
| **θ₅** | Fração máxima de sessões com esforço extremo (SEQ ≤ 2) | **≤ 25%** | No máximo um quarto dos participantes pode relatar esforço penoso |
| **ε** | Variação máxima tolerada na mediana de esforço | **≤ 1 ponto** | A usabilidade não pode degradar além de 1 ponto na escala 1 a 7 |

---

### Lógica Sequencial de Classificação

A tomada de decisão segue estritamente a ordem de precedência mais cautelosa (**NO-GO > INVESTIGAR > GO**):

```text
[GO] (Aprovação Plena da Arquitetura Evidence-First):
     EIR_B >= 0.60
  E  (EIR_B - EIR_A) >= 0.20
  E  ERR_B >= 0.15
  E  Acc_B >= (Acc_A - 0.05)
  E  TTA_B >= (TTA_A - 0.05)
  E  (Mediana_TTC_B / Mediana_TTC_A) <= 1.50

[INVESTIGAR] (Necessidade de Refinamento de UX):
     (Perguntas reflexivas são exibidas, mas RIR_B < 0.30)
  OU (Leitura de evidências é alta, mas sem evolução no Delta de acurácia)
  OU (EIR_B situa-se na faixa intermediária entre 0.45 e 0.60)

[NO-GO] (Inviabilidade do Paradigma ou Dano Comportamental):
     PDR_B >= PDR_A (usuários continuam decidindo sem ler evidências)
  OU (Percentual de sessões com SEQ <= 2) > 0.25
  OU TTA_B < (TTA_A - 0.05)
```

---

## 4. Governança e Tratamento de Desvios de Protocolo

1. **Vedação de Alteração Retroativa:** Nenhum limiar numérico pode ser afrouxado ou redefinido após o congelamento oficial do protocolo de teste.
2. **Registro de Ocorrências Atípicas:** Quedas de conexão, descarte voluntário de participantes ou falhas de navegador devem ser registradas com a respectiva justificativa e análise de sensibilidade (cálculo de métricas com e sem o participante afetado).

---

## Documentos Relacionados
- [Plano do Experimento](plano-experimento.md) — Desenho experimental between-subjects e hipóteses formais.
- [Protocolo do Participante](protocolo-participante.md) — Roteiro de aplicação para o facilitador.
- [Especificação de Telemetria](especificacao-telemetria.md) — Eventos e payloads gerados pela extensão.
- [Limitações do Estudo](limitacoes.md) — Ameaças conhecidas à validade interna e externa.
