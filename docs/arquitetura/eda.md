# Análise exploratória dos dados (EDA)

EDA dos 7.199 documentos do Fake.br usados pelo [modelo de IA](modelo-ia.md), após a mesma deduplicação do experimento, e do corpus local de 139 frases do produto. É reproduzível no repositório da aplicação:

```bash
cd experiments/fakebr
python -m source.eda   # baixa o snapshot oficial, confere o SHA-256 e gera results/eda_summary.json e figures/eda_*.png
```

O corpus não é republicado (o snapshot não tem licença explícita); só estatísticas agregadas ficam no repositório.

## Principais achados

| Achado | Evidência | Consequência |
|:---|:---|:---|
| Classes balanceadas | 3.600 fake e 3.599 true, também dentro de cada categoria e partição | Acurácia é uma métrica adequada; a classe majoritária acerta 50% |
| Tamanho separaria as classes | Textos integrais: média de 1.107 palavras nas verdadeiras e 186 nas falsas | O modelo usa a versão normalizada (183 contra 186 palavras) |
| Viés de veículo | Falsas vêm de 6 domínios (92,6% de um único site); verdadeiras de 25 (G1 e Estadão); nenhum domínio em comum | Parte do sinal pode ser estilo de redação do veículo |
| Época diferente | Falsas em 2016-2017; verdadeiras em 2017-2018 | Nomes e eventos do período também separam as classes |
| Marcadores de estilo | Por mil palavras: 3,39 contra 0,41 exclamações; 31,2 contra 12,8 aspas | Sinais estilísticos fortes, não factuais |
| Temas concentrados | Política, TV/celebridades e sociedade somam mais de 97% | Pouca evidência para ciência, economia e religião |

## Distribuições

Os gráficos usam vermelho para `fake` e verde para `true`; os valores estão também nas tabelas, extraídas de `experiments/fakebr/results/eda_summary.json`.

![Gráfico de barras de documentos por categoria e rótulo no Fake.br: política tem cerca de 2.090 documentos por rótulo, TV e celebridades 771, sociedade e cotidiano 638, e as demais categorias menos de 60; as barras falsas e verdadeiras têm a mesma altura em cada categoria](../assets/ia/eda_categorias.png)

| Categoria | `fake` | `true` |
|:---|:---:|:---:|
| política | 2.089 | 2.088 |
| tv_celebridades | 771 | 771 |
| sociedade_cotidiano | 638 | 638 |
| ciencia_tecnologia | 56 | 56 |
| economia | 22 | 22 |
| religiao | 22 | 22 |
| não informado | 2 | 2 |

![Dois diagramas de caixa do tamanho em palavras: nos textos integrais, as notícias verdadeiras são muito mais longas (mediana 923) que as falsas (mediana 157); nos textos normalizados usados no modelo, as duas distribuições se sobrepõem](../assets/ia/eda_tamanho.png)

| Versão do texto | Rótulo | Média | Mediana | P10 | P90 |
|:---|:---|:---:|:---:|:---:|:---:|
| Integral | `fake` | 185,9 | 157 | 84 | 312 |
| Integral | `true` | 1.107,2 | 923 | 448 | 1.993 |
| Normalizado (usado no modelo) | `fake` | 182,7 | 157 | 84 | 309 |
| Normalizado (usado no modelo) | `true` | 186,0 | 160 | 87 | 312 |

![Dois gráficos de barras horizontais com os domínios de origem: as falsas vêm quase todas de diariodobrasil.org; as verdadeiras vêm principalmente de g1.globo.com e de subdomínios do Estadão](../assets/ia/eda_dominios.png)

| Rótulo | Principais domínios (documentos) |
|:---|:---|
| `fake` (6 domínios) | diariodobrasil.org (3.335), afolhabrasil.com.br (174), thejornalbrasil.com.br (66), ceticismopolitico.com (16), topfivetv.com (7), não informado (2) |
| `true` (25 domínios; 10 maiores) | g1.globo.com (2.297), politica.estadao.com.br (753), internacional.estadao.com.br (114), cultura.estadao.com.br (95), www1.folha.uol.com.br (91), economia.estadao.com.br (51), brasil.estadao.com.br (46), esportes.estadao.com.br (30), alias.estadao.com.br (29), sao-paulo.estadao.com.br (16) |

![Gráfico de barras de marcadores estilísticos por mil palavras: as falsas têm mais exclamações, interrogações, palavras em maiúsculas e aspas; as verdadeiras têm mais dígitos](../assets/ia/eda_estilo.png)

| Marcador (por 1.000 palavras) | `fake` | `true` |
|:---|:---:|:---:|
| Exclamações | 3,39 | 0,41 |
| Interrogações | 2,75 | 1,05 |
| Palavras em maiúsculas | 11,78 | 10,34 |
| Dígitos | 16,59 | 21,24 |
| Aspas | 31,17 | 12,80 |

## Termos característicos

Pelo log-odds com prior de Dirichlet informativo, as verdadeiras são marcadas por fórmulas de agência ("nesta quarta-feira", "tribunal", "federal", "Eldorado") e as falsas por nomes de políticos do período, linguagem coloquial ("pra", "povo") e referências ao próprio meio ("vídeo", "matéria", "site").

## Corpus local do produto

`backend/ml/datasets/training_local.csv`: 139 frases (70 fake, 69 true; 112 treino e 27 teste), média de 15 palavras, sem duplicatas. Toda a procedência está marcada como não verificada externamente; serve apenas ao baseline do classificador de contingência.

## Implicações

- Dividir por grupos e usar textos normalizados, como o experimento já faz.
- Ler a acurácia no Fake.br como medida de estilo jornalístico do período, não de veracidade; o próximo teste é com veículos não vistos no treino.
- No produto, o estado de uma alegação depende só de evidência com fonte ([ADR-006](decisoes/ADR-006-evidence-first-architecture.md)).
