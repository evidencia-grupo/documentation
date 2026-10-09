# EDA - exploração dos dados

Dados: 139 linhas, 112 treino e 27 teste.

- Rótulos: {"fake": 70, "true": 69}.
- Categorias: {"saúde": 61, "ciência": 24, "economia": 23, "política": 18, "sociedade": 11, "educação": 1, "tecnologia": 1}.
- Textos duplicados: 0.
- Sobreposição literal treino/teste: 0.
- Comprimento médio: 15.25 palavras por frase.

A ausência de duplicação literal não elimina vazamento semântico. O tamanho pequeno limita generalização. `eda/distribuicoes.png`, `eda/confusao.png` e `eda/summary.json` acompanham o notebook executado. As distribuições são do corpus local; não representam frequência de desinformação na população ou no YouTube.

Acurácia de teste: 66.67%. Macro F1: 65.92%. O baseline majoritário obtém 51.85%. As 27 predições individuais estão em modelo/test_predictions.csv. Recall de retrieval não foi calculado sem anotações humanas.
