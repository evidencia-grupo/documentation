# Checklist Go / No-Go — Fase CBL Act

## 1. Visão Geral e Politica de Bloqueio

Este checklist formaliza as portas de controle de qualidade e integridade científica para o experimento na fase Act. O processo e dividido em duas fases auditáveis:

1. **Gate Pre-Coleta**: Todos os itens são **bloqueadores**. A coleta com o primeiro participante só pode ser iniciada se 100% dos critérios forem verificados e aprovados.
2. **Gate Pos-Coleta**: Critérios de validade para aceitacao do relatorio final de resultados e decisão de evolucao do produto.

---

## 2. Gate Pre-Coleta (Bloqueadores Obrigatórios)

Nenhuma sessão com participante voluntario pode ser realizada sem o cumprimento integral dos itens abaixo:

| Item | Critério de Bloqueio | Evidência Necessaria | Status |
|:---:|:---|:---|:---:|
| **G1-01** | Ratificacao formal das hipoteses H1 a H5 e dos limiares numericos propostos ($\theta_1..\theta_5$, $\delta$, $\rho$, $\varepsilon$). | Aprovacao documentada pela equipe e orientação docente em reunião registrada. | `[A VALIDAR]` |
| **G1-02** | Criacao da tag Git de pre-registro imutavel no repositorio. | Tag Git `act-prereg-v1` criada e confirmada no commit do protocolo congelado. | `[PENDENTE]` |
| **G1-03** | Conclusão do estudo piloto preliminar (2 a 3 participantes). | Relatorio de piloto arquivado; dados do piloto expressamente excluidos da base principal. | `[PENDENTE]` |
| **G1-04** | Banco de itens completamente rotulado por dois pesquisadores independentes. | Planilha do banco preenchida com 100% das divergencias resolvidas e links de checagem. | `[PENDENTE]` |
| **G1-05** | Prototipo de controle da Condição A construido, testado e isolado fora do bundle. | Aplicacao funcional em `experiments/control-gauge-prototype/`, validada pelo CI sem vazar para o bundle da extensão. | `[PENDENTE]` |
| **G1-06** | Telemetria e pipeline de sanitizacao validados ponta a ponta com fixtures sinteticas. | Testes automatizados executados (`vitest run`, `pytest analysis/act/tests -q`) com 100% de aprovacao. | `[PENDENTE]` |
| **G1-07** | Termo de Consentimento Livre e Esclarecido (TCLE) aprovado e deliberacao etica concluida. | Parecer do Comite de Etica em Pesquisa (CEP) emitido ou termo de dispensa devidamente formalizado e assinado pela orientação docente. | `[A VALIDAR COM ORIENTACAO]` |
| **G1-08** | Planilha de aleatorizacao em blocos de 4 gerada e armazenada offline. | Arquivo fisico ou planilha local segura com mapa `PID -> Condicao` pronta para uso. | `[PENDENTE]` |

---

## 3. Gate Pos-Coleta (Validação e Conclusão do Estudo)

Após a realizacao das sessões, a equipe deve validar os seguintes pontos antes de emitir a classificacao final:

| Item | Critério de Integridade | Evidência Necessaria | Status |
|:---:|:---|:---|:---:|
| **G2-01** | Tamanho de amostra minimo atingido em ambas as condições. | Pelo menos 10 participantes validos na Condição A e 10 na Condição B ($N \ge 20$). | `[A PREENCHER]` |
| **G2-02** | Integridade dos dados de telemetria e taxa aceitavel de eventos rejeitados. | Relatorio do sanitizador com taxa de rejeicao de eventos $< 1\%$ do total de eventos emitidos. | `[A PREENCHER]` |
| **G2-03** | Geração deterministica do arquivo `summary.json` pelo script oficial. | Execução de `python analysis/act/compute_metrics.py` com registro do hash SHA-256 no relatorio. | `[A PREENCHER]` |
| **G2-04** | Aplicacao estrita e literal da regra de decisão pre-registrada. | Enquadramento nos critérios [GO], [INVESTIGAR] ou [NO-GO] respeitando a precedencia [NO-GO] > [INVESTIGAR] > [GO]. | `[A PREENCHER]` |
| **G2-05** | Documentação exaustiva de todos os incidentes e desvios de protocolo. | Secao 9 do documento de resultados integralmente detalhada com análise de sensibilidade. | `[A PREENCHER]` |
| **G2-06** | Preservacao integral de resultados negativos ou contra-intuitivos. | Garantia de que nenhuma hipotese refutada ou métrica desfavoravel foi ocultada ou redefinida. | `[A PREENCHER]` |
| **G2-07** | Atualizacao do documento de limitacoes metodológicas observadas em campo. | Secao de limitacoes observadas preenchida com os desafios reais enfrentados nas sessões. | `[A PREENCHER]` |

---

## 4. Clausulas de "No-Go Imediato"

A ocorrencia de qualquer uma das situações abaixo invalida sumariamente a coleta e forca o cancelamento ou a desconsideracao completa dos dados:

1. **Coleta sem Consentimento**: Qualquer registro de dados realizado sem a assinatura previa do TCLE pelo participante voluntario.
2. **Alteracao de Limiares Pos-Congelamento**: Qualquer tentativa de modificar os valores de corte das hipoteses ($\theta_1..\theta_5$, $\delta$, $\rho$, $\varepsilon$) após a criacao da tag `act-prereg-v1`.
3. **Fabricacao ou Adulteracao Manual de Dados**: Qualquer insercao de valores estatísticos no relatorio de resultados que não provenham estritamente do output computacional do `summary.json`.
4. **Vazamento do Prototipo de Controle para Produção**: Inclusao acidental do código da Condição A (gauge/score) no pacote distribuivel da extensão.
