---
experiment_id: "EXP-ACT-CBL-2026"
prereg_tag: "{{PREENCHER: ex. act-prereg-v1}}"
summary_sha256: "{{PREENCHER: ex. sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855}}"
n_condition_A: "{{PREENCHER: int}}"
n_condition_B: "{{PREENCHER: int}}"
exclusions: "{{PREENCHER: int}}"
date_completed: "{{PREENCHER: YYYY-MM-DD}}"
lead_researcher: "{{PREENCHER: Nome do Pesquisador}}"
---

# Relatorio de Resultados do Experimento — Fase CBL Act

> [!IMPORTANT]
> **DIRETRIZ MANDATORIA DE PREENCHIMENTO**
>
> Este documento e um template estrito. **Nenhum valor numerico, estimativa pontual ou intervalo de confianca pode ser inserido manualmente ou estimado a olho.**
>
> Todos os valores estatísticos declarados nas tabelas e secoes abaixo devem ser extraidos **exclusivamente e literalmente** do arquivo deterministico `summary.json` gerado pelo script `analysis/act/compute_metrics.py`. O hash SHA-256 do referido arquivo deve constar no front matter deste documento.

---

## 1. Resumo Executivo e Classificacao de Decisão

- **Veredito do Framework CBL Act**: `{{PREENCHER: [GO] | [INVESTIGAR] | [NO-GO]}}`
- **Classificacao Mais Restritiva Aplicada**: `{{PREENCHER: Justificativa com base na precedencia NO-GO > INVESTIGAR > GO}}`
- **Síntese dos Achados**:
  - `{{PREENCHER: Sintese textual de 2 a 3 paragrafos contextualizando o comportamento observado na Condicao B em relacao ao controle A.}}`

---

## 2. Amostra, Demografia e Exclusoes de Sessão

- **Total de Participantes Recrutados**: `{{PREENCHER}}`
- **Participantes Alocados na Condição A**: `{{PREENCHER}}`
- **Participantes Alocados na Condição B**: `{{PREENCHER}}`
- **Sessões Excluidas da Análise Principal**: `{{PREENCHER}}`
- **Detalhamento das Exclusoes e Incidentes**:
  - `{{PREENCHER: Listar cada PID excluido e o motivo formal conforme secao 6 do experiment-plan.md}}`

---

## 3. Métricas Comportamentais por Condição (M1 a M9)

Os valores abaixo foram calculados via bootstrap não parametrico (10.000 reamostragens, semente `seed = 42`):

| ID | Métrica | Condição A (Estimativa [IC 95%]) | Condição B (Estimativa [IC 95%]) | Diferenca B − A [IC 95%] | Status vs. Hipotese |
|:---:|:---|:---:|:---:|:---:|:---:|
| **M1** | Evidence Inspection Rate (EIR) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER: H1 Confirmada/Refutada}}` |
| **M1b** | Source Open Rate (SOR) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M2** | Reflection Interaction Rate (RIR) | N/A | `{{PREENCHER}}` | N/A | `{{PREENCHER}}` |
| **M3** | Evidence Revision Rate (ERR) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M3b** | Premature Decision Rate (PDR) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M4a** | Brier Score (Calibracao) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER: H3 Confirmada/Refutada}}` |
| **M4b** | Overconfidence Gap | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M4c** | ECE (5 faixas) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER: Omitido se n < 100}}` |
| **M5a** | Final Accuracy (Assisted) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER: H2 Confirmada/Refutada}}` |
| **M5b** | Delta-Accuracy (Assisted − Baseline) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M6** | Transfer Task Accuracy (TTA) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER: H4 Confirmada/Refutada}}` |
| **M6b** | Verification Steps Count (VSC) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M7** | Time to Conclusion (TTC, mediana [IQR]) | `{{PREENCHER}}` | `{{PREENCHER}}` | `Razao: {{PREENCHER}}` | `{{PREENCHER: H5 Confirmada/Refutada}}` |
| **M8** | Esforco Percebido (SEQ, mediana) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` |
| **M9** | Investigation Behavior Rate (IBR) | `{{PREENCHER}}` | `{{PREENCHER}}` | `{{PREENCHER}}` | `Metrica Operacional Interna` |

---

## 4. Comparacao Direta com os Limiares Pre-Registrados

| Limiar Pre-Registrado | Critério de Avaliação | Valor Medido no Estudo | Condição Atendida? |
|:---|:---|:---:|:---:|
| **$\theta_1 \ge 0.60$** | $\text{EIR}_B$ minimo absoluto | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\theta_2 \ge 0.20$** | $\text{EIR}_B - \text{EIR}_A$ (ganho de inspecao) | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\theta_3 \ge 0.15$** | $\text{ERR}_B$ (taxa de revisao guiada por evidência) | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\theta_4 \ge 0.30$** | $\text{RIR}_B$ (engajamento com reflexão) | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\delta \le 0.05$** | $\text{Acc}_B \ge \text{Acc}_A - 0.05$ (não-inferioridade) | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\delta \le 0.05$** | $\text{TTA}_B \ge \text{TTA}_A - 0.05$ (não-inferioridade) | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\rho \le 1.50$** | $\text{mediana}(\text{TTC}_B) / \text{mediana}(\text{TTC}_A)$ | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\theta_5 \le 0.25$** | Fracao de sessões com $\text{SEQ} \le 2$ | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |
| **$\varepsilon \le 1$** | Queda na mediana de SEQ ($\text{SEQ}_B \ge \text{SEQ}_A - 1$) | `{{PREENCHER}}` | `{{PREENCHER: SIM / NAO}}` |

---

## 5. Análise de Revisoes e Subtaxas de Decisão (M3)

- **Total de Oportunidades de Revisao Elegiveis**: `{{PREENCHER}}`
- **Revisoes Construtivas ($\text{ERR}_{\text{correct}}$)**: `{{PREENCHER}}`%
- **Revisoes Prejudiciais ($\text{ERR}_{\text{harm}}$)**: `{{PREENCHER}}`%
- **Análise Qualitativa de Erros**:
  - `{{PREENCHER: Descrever padroes identificados nos casos em que a evidencia induziu erro ou foi ignorada.}}`

---

## 6. Efeito de Transferencia Cognitiva (Fase 3)

- **Acuracia em Itens Ineditos sem Ferramenta (TTA)**:
  - Condição A: `{{PREENCHER}}`
  - Condição B: `{{PREENCHER}}`
- **Distribuição dos Passos de Verificacao (VSC)**:
  - Verificacao de fonte (`source`): `{{PREENCHER}}`% (A) vs. `{{PREENCHER}}`% (B)
  - Checagem de data (`date`): `{{PREENCHER}}`% (A) vs. `{{PREENCHER}}`% (B)
  - Evidência independente (`independent_evidence`): `{{PREENCHER}}`% (A) vs. `{{PREENCHER}}`% (B)
  - Análise de contexto (`context`): `{{PREENCHER}}`% (A) vs. `{{PREENCHER}}`% (B)
  - Nenhum passo (`none`): `{{PREENCHER}}`% (A) vs. `{{PREENCHER}}`% (B)

---

## 7. Calibracao Subjetiva e Ilusao de Certeza

- **Grafico de Calibracao (Reliability Diagram)**: `{{PREENCHER: Referencia ao artefato de plot se gerado}}`
- **Análise do Gap de Superconfianca**:
  - `{{PREENCHER: Avaliar se o gauge em A inflou a confianca dos usuarios em alegacoes incorretas em comparacao com o comportamento reflexivo em B.}}`

---

## 8. Custo Temporal e Sobrecarga de Usabilidade

- **Tempo Mediano por Alegação**:
  - Condição A: `{{PREENCHER}}` s
  - Condição B: `{{PREENCHER}}` s
- **Índice de Esforco Percebido (SEQ 1 a 7)**:
  - Condição A: `{{PREENCHER}}`
  - Condição B: `{{PREENCHER}}`
- **Comentario de Usabilidade**:
  - `{{PREENCHER: Avaliar se o tempo adicional em B e justificado pela mudanca qualitativa de escrutinio.}}`

---

## 9. Desvios Formais do Protocolo

- **Ocorrencias de Desvio**: `{{PREENCHER: Registrar se houve qualquer desvio de cronograma, exclusao nao prevista ou problema tecnico durante a coleta.}}`
- **Impacto no Conjunto de Dados**: `{{PREENCHER: Apresentar analise de sensibilidade com e sem os dados afetados.}}`

---

## 10. Ameacas a Validade Observadas no Estudo

- `{{PREENCHER: Documentar ameacas que se manifestaram concretamente durante a realizacao do experimento (ex.: itens que geraram interpretacao dubia, cansaco excessivo em participantes)}}`

---

## 11. Decisões de Produto Derivadas dos Resultados

Com base na classificacao final `{{PREENCHER: GO / INVESTIGAR / NO-GO}}`:

- `{{PREENCHER: Decisao 1 sobre evolucao da interface na Sprint subsequente}}`
- `{{PREENCHER: Decisao 2 sobre refinamento de cards ou perguntas reflexivas}}`
- `{{PREENCHER: Decisao 3 sobre arquitetura de dados ou recuperacao}}`

---

## 12. Rastreabilidade e Evidências de Auditoria

- **Arquivo de Síntese**: `analysis/act/out/summary.json`
- **Hash SHA-256 Registrado**: `{{PREENCHER}}`
- **Comando de Reproducao**:
  ```bash
  python analysis/act/compute_metrics.py --sessions <diretorio_sessoes> --ground-truth ground_truth.json --out analysis/act/out/summary.json
  ```
