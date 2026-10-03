# Definicao de Metricas e Regra de Decisao Pre-Registrada — Fase CBL Act

## 1. Convencoes e Notacao Matematica

Para todas as formulas definidas neste documento, adota-se a seguinte notacao formal:

- $s \in S$: sessao individual associada a um participante pseudonimizado $P$.
- $cond(s) \in \{A, B\}$: condicao experimental atribuida a sessao $s$.
- $p \in \{\text{baseline}, \text{assisted}, \text{transfer}\}$: fase do experimento (Fases 1, 2 e 3).
- $i \in I_p$: item apresentado na fase $p$.
- $c \in C_i$: alegacao individual presente no item $i$.
- $d(s, c, \text{stage})$: decisao registrada pelo participante para a alegacao $c$, onde $\text{stage} \in \{\text{pre\_evidence}, \text{final}\}$.
- $gt(c) \in \{\text{supported}, \text{contradicted}, \text{misleading}, \text{insufficient}\}$: rotulo objetivo de verdade-terreno da alegacao $c$ definido por checadores independentes.
- $o(d) \in \{0, 1\}$: funcao indicadora de acuracia factual, onde $o(d) = 1$ se $d = gt(c)$ e $o(d) = 0$ caso contrario.
- $conf(d) \in [0, 100]$: grau subjetivo de confianca expresso pelo participante de que sua decisao esta correta.
- $p_{conf}(d) = \frac{conf(d)}{100} \in [0.0, 1.0]$: confianca normalizada em probabilidade.

---

## 2. Catalogo Detalhado de Metricas Comportamentais (M1 a M9)

### M1 — Evidence Inspection Rate (EIR)
- **Definicao**: Proporcao de alegacoes visiveis na fase assistida cujos cards de evidencia correspondentes foram explicitamente expandidos pelo usuario ao menos uma vez.
- **Formula**:
  $$\text{EIR}_s = \frac{|\{c \in C_{\text{assisted}} : \text{count}(\text{evidence\_expanded}_{s,c}) \ge 1\}|}{|\{c \in C_{\text{assisted}} : c \text{ foi visualizada via } \text{claims\_viewed}\}|}$$
- **Unidade de Analise**: Participante / sessao $s$.
- **Agregado por Condicao**: Media aritmetica $\overline{\text{EIR}}_{\text{cond}}$ acompanhada da proporcao de sessoes em que $\text{EIR}_s > 0$.
- **Tratamento de Denominador Zero**: Se nenhuma alegacao for registrada como visualizada na fase assistida, a sessao e considerada invalida para M1, excluida do calculo e contabilizada no relatorio de incidentes.
- **Condicoes Aplicaveis**: Condicao A (via expansao de "Ver fontes") e Condicao B (via expansao dos Evidence Cards).
- **Interpretacao**: Mede se a interface induz o comportamento basico de ler e analisar evidencias antes de julgar.
- **Armadilhas**: Cliques repetidos ou expansoes rapidas sem leitura ("clique reflexo"). Mitigado cruzando com o tempo de permanencia (TTC).

---

### M1b — Source Open Rate (SOR)
- **Definicao**: Proporcao de alegacoes na fase assistida em que o participante abriu a fonte original externa de ao menos uma evidencia.
- **Formula**:
  $$\text{SOR}_s = \frac{|\{c \in C_{\text{assisted}} : \text{count}(\text{source\_opened}_{s,c}) \ge 1\}|}{|\{c \in C_{\text{assisted}} : c \text{ foi visualizada}\}|}$$
- **Unidade de Analise**: Participante / sessao $s$.
- **Tratamento de Denominador Zero**: Identico a M1.
- **Condicoes Aplicaveis**: Condicoes A e B.
- **Interpretacao**: Mensura o nivel de leitura lateral (ir a fonte primaria externa).

---

### M2 — Reflection Interaction Rate (RIR)
- **Definicao**: Taxa de engajamento ativo com as perguntas reflexivas (Reflection Cards) apresentadas na interface.
- **Formula**:
  $$\text{RIR}_s = \frac{|\{q : \text{reflection\_interacted}_{s,q} \in \{\text{expanded}, \text{answered}\}\}|}{|\{q : \text{reflection\_viewed}_{s,q}\}|}$$
- **Unidade de Analise**: Participante / sessao $s$.
- **Tratamento de Denominador Zero**: Se nenhuma pergunta reflexiva foi apresentada na sessao, a metrica e computada como nao aplicavel (`null`).
- **Condicoes Aplicaveis**: Estritamente Condicao B (a Condicao A nao possui perguntas reflexivas).
- **Interpretacao e Armadilhas**: Eventos de fechamento (`dismissed`) contam no denominador (como visualizadas), mas **nao** pontuam no numerador como interacao construtiva.

---

### M3 — Evidence Revision Rate (ERR)
- **Definicao**: Frequencia com que o participante revisa ou altera sua decisao previa apos expandir e inspecionar evidencias factuais.
- **Formula**:
  $$\text{ERR} = \frac{\sum_{c \in C_{\text{elegivel}}} \mathbb{I}[d(s, c, \text{final}) \neq d(s, c, \text{pre\_evidence})]}{|C_{\text{elegivel}}|}$$
  Onde $C_{\text{elegivel}}$ sao alegacoes que possuem ambos os registros $d(s, c, \text{pre\_evidence})$ e $d(s, c, \text{final})$, com pelo menos um evento `evidence_expanded` entre ambas as decisoes.
- **Subtaxas Obrigatorias**:
  - **Revisao Construtiva ($\text{ERR}_{\text{correct}}$)**:
    $$\text{ERR}_{\text{correct}} = \frac{\sum \mathbb{I}[d_{\text{pre}} \neq gt(c) \land d_{\text{final}} = gt(c)]}{\sum \mathbb{I}[d_{\text{final}} \neq d_{\text{pre}}]}$$
  - **Revisao Prejudicial ($\text{ERR}_{\text{harm}}$)**:
    $$\text{ERR}_{\text{harm}} = \frac{\sum \mathbb{I}[d_{\text{pre}} = gt(c) \land d_{\text{final}} \neq gt(c)]}{\sum \mathbb{I}[d_{\text{final}} \neq d_{\text{pre}}]}$$
- **Tratamento de Denominador Zero**: Se nao houver revisoes ($d_{\text{final}} = d_{\text{pre}}$ para todas as alegacoes), $\text{ERR} = 0$, e as subtaxas sao registradas como indefinidas com nota explicativa.
- **Condicoes Aplicaveis**: Condicao B e Condicao A (se o protocolo de A contiver o passo pre-evidencia).

---

### M3b — Premature Decision Rate (PDR)
- **Definicao**: Proporcao de decisoes finais tomadas precipitadamente, sem que nenhuma evidencia ou fonte tenha sido expandida para a referida alegacao.
- **Formula**:
  $$\text{PDR}_s = \frac{|\{c \in C_{\text{assisted}} : \text{count}(\text{evidence\_expanded}_{s,c}) = 0 \land \exists d(s, c, \text{final})\}|}{|\{c \in C_{\text{assisted}} : \exists d(s, c, \text{final})\}|}$$
- **Unidade de Analise**: Participante / sessao $s$.
- **Interpretacao**: Mede a taxa de impulsividade ou complacencia com o veredito sugerido. Valores elevados na Condicao A indicam consumo passivo do gauge.

---

### M4 — Confidence Calibration (Brier Score, Overconfidence Gap, ECE)
- **Definicao**: Medida formal da concordancia entre a confianca declarada pelo participante e a veracidade factual objetiva de suas respostas.
- **Componentes Matematicos**:
  1. **Brier Score ($BS$)**:
     $$BS = \frac{1}{N_{\text{decisoes}}} \sum_{k=1}^{N_{\text{decisoes}}} (p_{\text{conf}, k} - o(d_k))^2$$
     *(Valores proximos de 0 indicam calibracao perfeita; valores proximos de 1 indicam erro severo de calibracao).*
  2. **Gap de Superconfianca ($OG$)**:
     $$OG = \left(\frac{1}{N_{\text{decisoes}}} \sum_{k=1}^{N_{\text{decisoes}}} p_{\text{conf}, k}\right) - \left(\frac{1}{N_{\text{decisoes}}} \sum_{k=1}^{N_{\text{decisoes}}} o(d_k)\right)$$
     *(Valores positivos denotam excesso de confianca em respostas incorretas).*
  3. **Expected Calibration Error ($ECE$)**:
     Divisao das predicoes em 5 faixas equiprovaveis ($B_m$, com $m \in \{1..5\}$):
     $$ECE = \sum_{m=1}^{5} \frac{|B_m|}{N_{\text{decisoes}}} |\text{acc}(B_m) - \text{conf}(B_m)|$$
- **Regra Estrita para o ECE**: O calculo do ECE e **obrigatoriamente omitido** se o numero total de decisoes avaliadas for inferior a 100 ($N_{\text{decisoes}} < 100$). Justificativa: em amostras pequenas, o particionamento em 5 faixas gera *bins* vazios ou com $n < 5$, produzindo instabilidade aritmetica espuria. Nesses casos, o relatorio registra expressamente o motivo da omissao.

---

### M5 — Final Accuracy e Delta-Accuracy
- **Definicao**:
  - **Acuracia por Fase**: Proporcao de decisoes finais que coincidem com a verdade-terreno:
    $$\text{Acc}_p = \frac{1}{|C_p|} \sum_{c \in C_p} o(d(s, c, \text{final}))$$
  - **Delta de Acuracia Intra-Participante ($\Delta\text{Acc}_s$)**:
    $$\Delta\text{Acc}_s = \text{Acc}_{\text{assisted}, s} - \text{Acc}_{\text{baseline}, s}$$
- **Interpretacao**: Mede o ganho cognitivo propiciado pela interface em comparacao com o desempenho basal do proprio participante.
- **Ressalva Metodologica**: $\Delta\text{Acc}$ so possui validade interpretativa sob a premissa de que os conjuntos S1 e S2 foram devidamente pareados em grau de dificuldade.

---

### M6 — Transfer Task Accuracy (TTA)
- **Definicao**: Acuracia media obtida pelo participante na Fase 3 (itens inéditos do conjunto S3, realizada sem nenhuma ferramenta de apoio).
- **Formula**:
  $$\text{TTA}_s = \frac{1}{|C_{\text{transfer}}|} \sum_{c \in C_{\text{transfer}}} o(d(s, c, \text{final}))$$
- **Interpretacao**: Testa a hipotese H4 de que a interacao previa com a interface evidence-first consolida habitos analiticos independentes do software.

---

### M6b — Verification Steps Count (VSC)
- **Definicao**: Quantidade de procedimentos metodologicos distintos de checagem que o participante reportou ter executado autonomamente durante a fase de transferencia.
- **Formula**:
  $$\text{VSC}_s = |\text{steps}_s \setminus \{\text{"none"}\}|, \quad \text{onde } \text{steps}_s \subseteq \{\text{"source"}, \text{"date"}, \text{"independent\_evidence"}, \text{"context"}, \text{"none"}\}$$
- **Valores Possiveis**: Inteiro entre 0 e 4. Se o participante assinalar `"none"`, $\text{VSC}_s = 0$.

---

### M7 — Time to Conclusion (TTC)
- **Definicao**: Tempo transcorrido em segundos entre a primeira selecao da alegacao na interface e o envio formal da decisao final.
- **Formula**:
  $$\text{TTC}_c = \frac{t_{\text{ms}}(\text{decision\_submitted}_{\text{final}, c}) - t_{\text{ms}}(\text{claim\_selected}_{1^{\circ}, c})}{1000}$$
- **Sumarizacao**: Reportado via **mediana** e **Intervalo Interquartil (IQR)** por condicao.
- **Aviso Metodologico**: Nao ha direcao presumida de "melhor". Um TTC excessivamente curto pode denunciar superficialidade analitica; um TTC excessivamente longo pode indicar sobrecarga cognitiva ou atrito de usabilidade.

---

### M8 — Esforco Percebido (Single Ease Question - SEQ)
- **Definicao**: Mediana das avaliacoes de esforco subjetivo reportadas no questionario pos-tarefa na escala ordinal de 1 a 7.
- **Interpretacao**: Acompanha a viabilidade da solucao. Se B exigir esforco excessivo sem ganho correspondente, o produto enfrenta risco de abandono.

---

### M9 — Investigation Behavior Rate (IBR — Metrica Operacional Composta)
- **Status Metodologico**: Metrica puramente instrumental e heuristica, desenvolvida para sumarizar dimensoes de engajamento do estudo. **NAO possui validacao psicometrica formal e e TERMINANTEMENTE PROIBIDO exibi-la como score, reputacao ou nota para o usuario final.**
- **Formulacao**:
  - **Taxa Geral Comparavel ($\text{IBR}_{\text{common}}$)**:
    $$\text{IBR}_{\text{common}} = \frac{\text{CE} + \text{EIR} + \text{SOR}}{3}$$
    Onde $\text{CE}$ (Claim Engagement Rate) e a proporcao de alegacoes vistas que foram selecionadas ativamente:
    $$\text{CE} = \frac{|\{c : \text{count}(\text{claim\_selected}_{s,c}) \ge 1\}|}{|\{c : c \text{ visivel}\}|}$$
  - **Taxa Completa da Condicao B ($\text{IBR}_B$)**:
    $$\text{IBR}_B = \frac{\text{CE} + \text{EIR} + \text{SOR} + \text{RIR}}{4}$$

---

## 3. Regra de Decisao Pre-Registrada (Framework de Decisao Act)

Para assegurar integridade cientifica e blindar a equipe contra interpretacoes *post hoc*, os limiares de decisao sao propostos e registrados formalmente antes da coleta.

### Limiares Numericos Propostos (Sujeitos a Ratificacao)

| Parametro | Descricao do Limiar | Valor Proposto | Justificativa |
|:---:|:---|:---:|:---|
| **$\theta_1$** | EIR minimo absoluto na Condicao B | **0.60** (60%) | Maioria substancial das alegacoes deve ser analisada com evidencias. |
| **$\theta_2$** | Diferenca minima de inspecao ($\text{EIR}_B - \text{EIR}_A$) | **0.20** (+20 pp) | Condicao B deve superar o controle em inspecao de evidencias por margem expressiva. |
| **$\theta_3$** | Taxa minima de revisao guiada por evidencia ($\text{ERR}_B$) | **0.15** (15%) | Evidencias devem provocar reavaliacao em parcela mensuravel das alegacoes. |
| **$\theta_4$** | Engajamento minimo em perguntas reflexivas ($\text{RIR}_B$) | **0.30** (30%) | Ao menos 30% das perguntas reflexivas apresentadas devem ser interagidas. |
| **$\delta$** | Margem de nao-inferioridade em acuracia e transferencia | **0.05** (5 pp) | Tolerancia maxima de perda em acuracia admitida para o novo paradigma. |
| **$\rho$** | Razao maxima permitida de tempo ($\text{mediana}(\text{TTC}_B) / \text{mediana}(\text{TTC}_A)$) | **1.50** (+50%) | A investigacao em B nao pode demorar mais que 1.5 vezes o tempo do veredito. |
| **$\theta_5$** | Fracao maxima de sessoes com esforco extremo ($\text{SEQ} \le 2$) | **0.25** (25%) | No maximo 1/4 dos participantes podem avaliar a tarefa como excessivamente penosa. |
| **$\varepsilon$** | Queda maxima tolerada na mediana de esforco ($\text{SEQ}_B$ vs. $\text{SEQ}_A$) | **1 ponto** | Esforco em B nao pode degradar mais de 1 ponto na escala de 1 a 7. |

---

### Condicoes Logicas de Classificacao

As condicoes abaixo sao aplicadas de forma sequencial, prevalecendo estritamente a classificacao mais restritiva (**NO-GO > INVESTIGAR > GO**):

```text
[GO] (Validacao Positiva da Arquitetura Evidence-First):
     EIR_B >= 0.60
  E  (EIR_B - EIR_A) >= 0.20
  E  ERR_B >= 0.15
  E  Acc_B >= (Acc_A - 0.05)
  E  TTA_B >= (TTA_A - 0.05)
  E  (mediana(TTC_B) / mediana(TTC_A)) <= 1.50

[INVESTIGAR] (Gargalos de UX ou Desalinhamento Cognitivo):
     (Reflection Cards sao visualizados, mas RIR_B < 0.30)
  OU (Interacao com evidencias e alta, mas ganho cognitivo e nulo: Delta-Acc ≈ 0)
  OU (EIR_B situa-se na faixa marginal entre 0.45 e 0.60)

[NO-GO] (Inviabilidade do Paradigma ou Dano Comportamental):
     PDR_B >= PDR_A
  OU (Fracao de sessoes com SEQ <= 2) > 0.25
  OU (mediana(SEQ_B) < mediana(SEQ_A) - 1 E sem ganho comportamental comprovado em EIR/ERR)
  OU TTA_B < (TTA_A - 0.05)
```

---

## 4. Governanca de Desvios de Protocolo

Qualquer situacao imprevista durante a execucao que obrigue a adocao de procedimento distinto do pre-registrado deve ser tratada da seguinte forma:

1. **Vedacao de Alteracao Retroativa**: Sob nenhuma hipotese os valores de $\theta_1..\theta_5$, $\delta$, $\rho$ ou $\varepsilon$ poderao ser modificados apos a emissao da tag Git `act-prereg-v1`.
2. **Registro Obrigatorio de Desvio**: Qualquer ocorrencia atipica (ex.: perda de conectividade local em uma maquina, descarte excepcional de participante, oscilacao de versao de navegador) devera ser registrada na Secao 9 do documento de resultados (`results.md`), discriminando:
   - Descricao exata do evento.
   - Justificativa metodologica da acao corretiva adotada.
   - Analise de sensibilidade (calculo das metricas com e sem os dados afetados).
