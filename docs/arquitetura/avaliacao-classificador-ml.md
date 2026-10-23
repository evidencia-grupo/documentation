# Avaliação e Performance do Modelo Classificador Supervisionado — EvidencIA

> **Metadado de Proveniência:** Migrado do repositório de desenvolvimento (`backend/ml/classifier/EVALUATION_REPORT.md`) em conformidade com a Política de Governança Documental.  
> **Rastreabilidade:** [Pipeline de IA e Datasets](ia-e-datasets.md) · [ADR-005](decisoes/ADR-005-modelo-local-e-datasets-brasileiros.md) · [ADR-006](decisoes/ADR-006-evidence-first-architecture.md)

!!! warning "Escopo e confiabilidade destas métricas"
    Este relatório avalia o **classificador linguístico de contingência** (`backend/ml/classifier/model.json`) sobre o corpus local de 139 frases, cuja procedência não foi verificada externamente ([EDA](eda.md#corpus-local-do-produto)). O teste tem **27 exemplos**: cada acerto ou erro altera a acurácia em cerca de 3,7 pontos percentuais e, nos limiares altos, um único exemplo muda a precisão entre aceitos em 10 pontos ou mais. A classe prevista descreve padrões de linguagem, não a veracidade de uma alegação, e não decide o estado de nenhuma alegação no produto ([ADR-006](decisoes/ADR-006-evidence-first-architecture.md)). Estas métricas não são comparáveis às do [experimento Fake.br](modelo-ia.md), que usa outro conjunto.

---

## 1. Resumo Geral de Performance
- **Amostras no Conjunto de Teste:** 27
- **Acurácia Global:** 66.67%
- **Macro F1-Score:** 65.92%

---

## 2. Matriz de Confusão
| | Predito: FALSO | Predito: VERDADEIRO |
|:---|:---:|:---:|
| **Real: FALSO** | 11 (Verdadeiro Positivo) | 3 (Falso Negativo) |
| **Real: VERDADEIRO** | 6 (Falso Positivo) | 7 (Verdadeiro Negativo) |

---

## 3. Métricas Detalhadas por Classe
| Classe | Precisão | Revocação (Recall) | F1-Score |
|:---|:---:|:---:|:---:|
| **Falso / Desinformação** | 64.7% | 78.6% | 71.0% |
| **Verdadeiro / Fato** | 70.0% | 53.8% | 60.9% |

---

## 4. Análise de Limiares de Aceitação (Curva de Decisão e Confiança)

> **Conceito de Governança:** O modelo adota calibração com limiar mínimo de confiança $\tau$. Quando a confiança probabilística é inferior ao limiar estipulado, o modelo **abstém-se de emitir veredito unilateral** e encaminha a alegação para o modo *Evidence-First* (verificação manual por checagens oficiais rastreáveis).

| Limiar ($\tau$) | Predições Aceitas | Taxa de Aceitação (%) | Taxa de Abstenção (%) | Precisão nos Aceitos (%) | Taxa de Erro nos Aceitos (%) |
|:---:|:---:|:---:|:---:|:---:|:---:|
| **0.50** | 27 / 27 | 100.0% | 0.0% | **66.7%** | 33.3% |
| **0.55** | 22 / 27 | 81.5% | 18.5% | **72.7%** | 27.3% |
| **0.60** | 18 / 27 | 66.7% | 33.3% | **83.3%** | 16.7% |
| **0.65** | 10 / 27 | 37.0% | 63.0% | **90.0%** | 10.0% |
| **0.70** | 6 / 27 | 22.2% | 77.8% | **83.3%** | 16.7% |
| **0.75** | 3 / 27 | 11.1% | 88.9% | **100.0%** | 0.0% |
| **0.80** | 1 / 27 | 3.7% | 96.3% | **100.0%** | 0.0% |
| **0.85** | 1 / 27 | 3.7% | 96.3% | **100.0%** | 0.0% |
| **0.90** | 0 / 27 | 0.0% | 100.0% | **100.0%** | 0.0% |

---

## 5. Recomendação Operacional para Produção
- **Limiar em uso ($\tau = 0.60$):** É o `acceptance_threshold` gravado em `backend/ml/classifier/model.json` e aplicado quando `POST /api/v1/classify` não recebe `threshold` (a descrição do campo no esquema ainda menciona 0.65; divergência a corrigir no repositório de código). No teste, $\tau = 0.60$ aceita 18 de 27 exemplos (66,7%); $\tau = 0.65$ aceita 10 (37,0%). Esta página recomendava 0.65 ou 0.70 como "alta cobertura", o que os próprios números não sustentam. Com 27 exemplos, nenhum desses limiares é distinguível com segurança; a escolha deve ser revista com um conjunto de teste maior e de procedência verificada.
- **Garantia Evidence-First:** Nenhuma decisão automatizada substitui a apresentação de fontes auditadas; alegações com score abaixo do limiar mantêm o estado de neutralidade investigativa.
