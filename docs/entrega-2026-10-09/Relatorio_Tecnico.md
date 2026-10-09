# Relatório técnico - EvidencIA

Entrega: 09/10/2026.

## Objetivo e escopo

Entregar um classificador de padrões linguísticos em português e um pipeline Evidence-First com invariantes verificáveis. O classificador não comprova veracidade factual. Esta entrega contém código executável, modelo treinado e recarregado, dados locais, EDA e métricas de um teste fixo. O estágio informado pelo usuário é desenvolvimento.

## Preparação dos dados

O corpus efetivamente carregado contém 139 exemplos, exportados das fixtures e do corpus curado versionado. Os rótulos fake/true são locais. Nomes de fontes são declarações do corpus, não certificação de proveniência externa. Preservamos id, texto, rótulo, categoria, fonte declarada e partição. Houve 0 duplicatas literais e 0 textos iguais entre treino e teste. A separação estratificada com seed 42 produziu 112 exemplos de treino e 27 de teste. O vocabulário TF-IDF é ajustado somente no treino.

## Seleção da abordagem

Foi mantido o Multinomial Naive Bayes com TF-IDF, unigramas/bigramas e atributos de estilo do projeto. A escolha favorece execução offline, custo baixo, explicações por atributos e reprodução sem dependências compiladas no modelo. O JSON guarda vocabulário, pesos e parâmetros sem executar conteúdo como pickle. alpha=0.5 e limiar=0.60 preservam a configuração original; não houve busca de parâmetros no conjunto de teste. Um baseline majoritário foi medido, não um estudo comparativo exaustivo. Os scores normalizados não foram calibrados empiricamente.

## Treinamento e execução

O notebook treina apenas na partição train, salva modelo/claim_classifier.json, recarrega com ClaimClassifier.load e exige igualdade da inferência com o objeto original. O modelo entregue é o mesmo objeto avaliado, sem retreinamento no teste. O pacote inclui o código Python mínimo necessário e requirements-notebook.txt. Rodar o notebook reproduz métricas e gráficos com os dados e partições incluídos.

## Métricas e interpretação

Acurácia = proporção de acertos; precisão e recall separam falsos alarmes de omissões. Macro F1 dá o mesmo peso às classes. Resultado nas 27 amostras: acurácia 66.67%, macro F1 65.92%; baseline majoritário 51.85%. Matriz de confusão (classe positiva fake): TP=11, FP=6, TN=7, FN=3. Houve 9 erros de classificação no teste; execução sem erro não significa predição sem erro. A classe true tem recall de 53,85%, indicando omissões relevantes. O corpus pequeno não sustenta promessa de precisão em vídeos reais.

## Abstenção e recuperação

A curva de limiares informa cobertura, abstenção e precisão nos aceitos. No limiar 0.60, 18 de 27 previsões foram aceitas; precisão seletiva 83,3%. Esse número é descritivo e não foi usado para otimizar parâmetros no teste. Quando nenhuma previsão é aceita, a precisão é indefinida, não 100%. Para recuperação, Recall@K foi corrigido para contar relevantes, nDCG usa ranks reais e avaliação parcial é bloqueada. O gold set de retrieval ainda está sem rótulos humanos nos arquivos; nenhuma métrica foi fabricada.

## Principais desafios

Cobertura alta coexistia com um teste de sender que não esperava a fila assíncrona. Contratos JSON/TypeScript divergiam da serialização Python. O fallback vetorial apresentava texto da checagem como fala do vídeo; dados ausentes eram substituídos por datas não verificadas. Atualizar Vitest/Vite exigiu alinhar Node e tipos. E2E revelou latência de cache: iniciamos a leitura local antecipadamente e mantivemos a saída rápida quando não há legendas. A dependência de browser foi resolvida com Chromium oficial. Docker não pôde ser executado porque não há daemon local ativo.

## Correções de engenharia

Perguntas livres do provedor foram limitadas ao catálogo neutro. Alegações sem trecho da transcrição são descartadas. Evidências externas contextualizam, sem transferir automaticamente veredito entre proposições; o matcher local exige texto proposicional igual. Datas desconhecidas e timestamps sem segmentos são preservados como desconhecidos. Há limite ASGI de bytes, emissão/renovação de token com retry limitado, validação de segredo/CORS/Redis em produção, Docker non-root e dependências de runtime fixadas com hashes. CI usa Actions por SHA e contratos gerados. Narrativas migradas têm origem preservada.

## Aprendizados e lições

Não confundir similaridade de recuperação com prova factual, nem aprovação com dado empírico. Testes de mutação podem revelar lacunas que a cobertura não mostra. Contratos devem ser gerados e validados sobre a resposta serializada. Valores desconhecidos não devem ser preenchidos por conveniência. Scores do classificador descrevem o corpus, não a verdade de uma alegação. Documentação histórica precisa ser identificada; critérios de pronto devem informar estágio e evidência.

## Prontidão e limites

A remediação busca GO técnico para desenvolvimento local, com testes e artefatos reproduzíveis. Aprovação das decisões foi declarada pelo usuário em 09/10/2026. A entrega não afirma que uma infraestrutura inexistente foi provisionada, que Docker executou sem daemon, que chamadas de LLM real foram realizadas ou que anotações humanas foram produzidas. O status final e os commits da branch constam no documento de entrega após a última rodada de verificação.

## Reprodução

Descompacte o pacote e abra EvidencIA_modelo_e_avaliacao.ipynb na pasta raiz. Use Python 3.12 em venv e instale requirements-notebook.txt. O notebook localiza datasets/training_local.csv e codigo/ml, não precisa de credencial, rede ou serviço de IA. Para a aplicação, siga o README da branch codex/audit-remediation; configurações reais de produção são injetadas por variáveis de ambiente.

## Referências locais

- Notebook executado: EvidencIA_modelo_e_avaliacao.ipynb.
- Dados: datasets/training_local.csv e datasets/metadata.json.
- Modelo: modelo/claim_classifier.json.
- Métricas e predições: modelo/metrics.json e modelo/test_predictions.csv.
- Guiding Questions, requisitos e Scrum: documentos/.
- Código de origem: evidencia-grupo/EvidencIA, base 0ffe395aeb5b3dd86914cd9532d78edbfbd6188f, branch de remediação.
