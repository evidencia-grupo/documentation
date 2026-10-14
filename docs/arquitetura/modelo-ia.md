# Modelo de IA (Fake.br)

Classificador supervisionado de notícias falsas e verdadeiras em português, treinado e avaliado de forma reproduzível em [`experiments/fakebr`](https://github.com/evidencia-grupo/EvidencIA/tree/main/experiments/fakebr). O relatório técnico completo está em [`relatorio_tecnico.md`](https://github.com/evidencia-grupo/EvidencIA/blob/main/experiments/fakebr/relatorio_tecnico.md).

!!! warning "Escopo"
    O modelo mede padrões de linguagem de notícias de 2016 a 2018, não a veracidade de uma alegação. No produto ele **não decide** o estado de nenhuma alegação: isso depende só de evidências com fonte ([ADR-006](decisoes/ADR-006-evidence-first-architecture.md)).

## Abordagem

- **Dados:** Fake.br, snapshot fixado e conferido por SHA-256; 7.199 notícias após deduplicação, divididas por grupos temáticos (60/15/10/15% em treino, validação, calibração e teste; semente 42). Veja a [EDA](eda.md).
- **Representação:** TF-IDF de palavras e bigramas ajustado só no treino.
- **Seleção:** Naive Bayes (baseline) e regressão logística (C = 1 e C = 4), pelo macro-F1 na validação. Escolhida: regressão logística, C = 4.
- **Calibração:** sigmoid em partição própria de 717 notícias.
- **Abstenção:** limiar escolhido na validação e proteção para vocabulário insuficiente.

## Resultados no teste (1.088 notícias)

| Modelo | Acurácia | Macro-F1 | ROC-AUC | Brier |
|:---|:---:|:---:|:---:|:---:|
| Classe majoritária | 50,00% | 0,3333 | 0,5000 | 0,2500 |
| Naive Bayes (baseline) | 89,06% | 0,8906 | 0,9597 | 0,0857 |
| Regressão logística calibrada | **93,47%** | **0,9347** | **0,9842** | **0,0474** |
| Mesma, só 40 primeiras palavras | 83,82% | 0,8382 | 0,9283 | 0,1098 |

IC95% da acurácia (bootstrap por grupos): 92,00% a 94,94%. A calibração reduziu o ECE de 0,1155 para 0,0112.

![Matriz de confusão](../assets/ia/confusao.png)

![Cobertura e erro por limiar de abstenção](../assets/ia/abstencao.png)

## Limitações

- **Viés de veículo e época:** 93% das falsas vêm de um único site e nenhum domínio aparece nas duas classes; parte da acurácia pode vir do estilo do veículo.
- **Textos curtos:** com 40 palavras a acurácia cai para 83,82%; legendas de vídeo são faladas, curtas e de outros temas.
- **Negação, ironia e números trocados** mudam o fato sem mudar o vocabulário.
- **Sem anotação humana** de pares alegação-evidência.

## Papel no produto

| Componente | Papel | Decide o estado? |
|:---|:---|:---:|
| LLM (Ollama ou provedor remoto) | Extrai alegações literais e escolhe perguntas de um catálogo fechado | Não |
| Busca de evidências (ClaimReview) | Encontra checagens publicadas por alegação | Sim, com fonte |
| Classificador linguístico de contingência | Observação de estilo quando não há evidência | Não |
| Modelo Fake.br | Experimento acadêmico | Não está no fluxo |

## Reprodução

```bash
cd experiments/fakebr
pip install -r requirements-lock.txt
python -m unittest source.test_experiment -v
```

Os testes conferem os hashes dos artefatos, a ausência de vazamento entre partições, a coerência entre métricas e predições e a concordância com a entrega original (tolerância 1e-10).
