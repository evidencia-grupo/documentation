# Checklist Go / No-Go — Fase CBL Act

## 1. Visao Geral e Politica de Bloqueio

Este checklist formaliza as portas de controle de qualidade e integridade cientifica para o experimento na fase Act. O processo e dividido em duas fases auditaveis:

1. **Gate Pre-Coleta**: Todos os itens sao **bloqueadores**. A coleta com o primeiro participante so pode ser iniciada se 100% dos criterios forem verificados e aprovados.
2. **Gate Pos-Coleta**: Criterios de validade para aceitacao do relatorio final de resultados e decisao de evolucao do produto.

---

## 2. Gate Pre-Coleta (Bloqueadores Obrigatorios)

Nenhuma sessao com participante voluntario pode ser realizada sem o cumprimento integral dos itens abaixo:

| Item | Criterio de Bloqueio | Evidencia Necessaria | Status |
|:---:|:---|:---|:---:|
| **G1-01** | Ratificacao formal das hipoteses H1 a H5 e dos limiares numericos propostos ($\theta_1..\theta_5$, $\delta$, $\rho$, $\varepsilon$). | Aprovacao documentada pela equipe e orientacao docente em reuniao registrada. | `[A VALIDAR]` |
| **G1-02** | Criacao da tag Git de pre-registro imutavel no repositorio. | Tag Git `act-prereg-v1` criada e confirmada no commit do protocolo congelado. | `[PENDENTE]` |
| **G1-03** | Conclusao do estudo piloto preliminar (2 a 3 participantes). | Relatorio de piloto arquivado; dados do piloto expressamente excluidos da base principal. | `[PENDENTE]` |
| **G1-04** | Banco de itens completamente rotulado por dois pesquisadores independentes. | Planilha do banco preenchida com 100% das divergencias resolvidas e links de checagem. | `[PENDENTE]` |
| **G1-05** | Prototipo de controle da Condicao A construido, testado e isolado fora do bundle. | Aplicacao funcional em `experiments/control-gauge-prototype/`, validada pelo CI sem vazar para o bundle da extensao. | `[PENDENTE]` |
| **G1-06** | Telemetria e pipeline de sanitizacao validados ponta a ponta com fixtures sinteticas. | Testes automatizados executados (`vitest run`, `pytest analysis/act/tests -q`) com 100% de aprovacao. | `[PENDENTE]` |
| **G1-07** | Termo de Consentimento Livre e Esclarecido (TCLE) aprovado e deliberacao etica concluida. | Parecer do Comite de Etica em Pesquisa (CEP) emitido ou termo de dispensa devidamente formalizado e assinado pela orientacao docente. | `[A VALIDAR COM ORIENTACAO]` |
| **G1-08** | Planilha de aleatorizacao em blocos de 4 gerada e armazenada offline. | Arquivo fisico ou planilha local segura com mapa `PID -> Condicao` pronta para uso. | `[PENDENTE]` |

---

## 3. Gate Pos-Coleta (Validacao e Conclusao do Estudo)

Apos a realizacao das sessoes, a equipe deve validar os seguintes pontos antes de emitir a classificacao final:

| Item | Criterio de Integridade | Evidencia Necessaria | Status |
|:---:|:---|:---|:---:|
| **G2-01** | Tamanho de amostra minimo atingido em ambas as condicoes. | Pelo menos 10 participantes validos na Condicao A e 10 na Condicao B ($N \ge 20$). | `[A PREENCHER]` |
| **G2-02** | Integridade dos dados de telemetria e taxa aceitavel de eventos rejeitados. | Relatorio do sanitizador com taxa de rejeicao de eventos $< 1\%$ do total de eventos emitidos. | `[A PREENCHER]` |
| **G2-03** | Geracao deterministica do arquivo `summary.json` pelo script oficial. | Execucao de `python analysis/act/compute_metrics.py` com registro do hash SHA-256 no relatorio. | `[A PREENCHER]` |
| **G2-04** | Aplicacao estrita e literal da regra de decisao pre-registrada. | Enquadramento nos criterios [GO], [INVESTIGAR] ou [NO-GO] respeitando a precedencia [NO-GO] > [INVESTIGAR] > [GO]. | `[A PREENCHER]` |
| **G2-05** | Documentacao exaustiva de todos os incidentes e desvios de protocolo. | Secao 9 do documento de resultados integralmente detalhada com analise de sensibilidade. | `[A PREENCHER]` |
| **G2-06** | Preservacao integral de resultados negativos ou contra-intuitivos. | Garantia de que nenhuma hipotese refutada ou metrica desfavoravel foi ocultada ou redefinida. | `[A PREENCHER]` |
| **G2-07** | Atualizacao do documento de limitacoes metodologicas observadas em campo. | Secao de limitacoes observadas preenchida com os desafios reais enfrentados nas sessoes. | `[A PREENCHER]` |

---

## 4. Clausulas de "No-Go Imediato"

A ocorrencia de qualquer uma das situacoes abaixo invalida sumariamente a coleta e forca o cancelamento ou a desconsideracao completa dos dados:

1. **Coleta sem Consentimento**: Qualquer registro de dados realizado sem a assinatura previa do TCLE pelo participante voluntario.
2. **Alteracao de Limiares Pos-Congelamento**: Qualquer tentativa de modificar os valores de corte das hipoteses ($\theta_1..\theta_5$, $\delta$, $\rho$, $\varepsilon$) apos a criacao da tag `act-prereg-v1`.
3. **Fabricacao ou Adulteracao Manual de Dados**: Qualquer insercao de valores estatisticos no relatorio de resultados que nao provenham estritamente do output computacional do `summary.json`.
4. **Vazamento do Prototipo de Controle para Producao**: Inclusao acidental do codigo da Condicao A (gauge/score) no pacote distribuivel da extensao.
