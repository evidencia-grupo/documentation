# Revisão do relatório de IA recebido

O ZIP entrega_ia_EvidencIA.zip foi conferido contra seu manifesto: 22 arquivos íntegros. O corpus oficial de 31.825.189 bytes foi baixado na revisão fixada e conferiu com SHA-256 be91c188f621424017bd79a0f33528dcc27f8a6151adb2bcb899c17719eb4090. O notebook de 31 células foi reexecutado. As partições e 32 métricas centrais concordaram com a entrega recebida, em tolerância 1e-10.

## Resultado científico reproduzido

O experimento Fake.br tem 7.199 documentos após deduplicação. Treino, validação, calibração e teste têm 4.312, 1.082, 717 e 1.088 notícias. Os grupos temáticos e hashes não atravessam partições. TF-IDF e regressão logística C=4 com sigmoid independente obtêm acurácia 93,47%, macro-F1 0,9347 e 71 erros. O estresse com 40 palavras cai a 83,82%. São métricas de notícias históricas, não validação factual de legendas.

O baseline local de 139 exemplos permanece identificado: teste de 27 exemplos, acurácia 66,67% e macro-F1 65,92%. As duas avaliações não usam o mesmo conjunto e não podem ser comparadas como ganho percentual direto. O ganho relatado em Fake.br usa três abordagens no mesmo teste de 1.088 notícias.

## Alterações decorrentes da revisão

- Experimento completo integrado em experiments/fakebr na aplicação, com dependências isoladas e sem carregar sklearn na API.
- Notebook sincronizado ao código, recarga comparada nas 1.088 notícias e modelo exportado em .pkl e .plk com os mesmos bytes.
- Relatório revisado distingue diagnóstico recebido de 0ffe395 e a continuação criada de main b168b8b.
- Diagnóstico scripts/check_readiness.py identifica mock, modelo Ollama ausente e canal de evidências não confirmado, sem imprimir segredos.
- Fontes recuperadas continuam obrigatórias para uma conclusão factual. Nenhum limiar foi reduzido para esconder respostas inconclusivas.
- Transcrição integral, legendas exclusivas, tempos reais, fontes por alegação e cache 3 cobertos por testes.

## Pendências de validação externa

Infraestrutura real, disponibilidade da busca externa, LLM real, corpus humano de alegações e estudo de usuários continuam exigindo execução e coleta de evidências. O GO desta entrega é para desenvolvimento local; aprovação autoriza o trabalho e não comprova essas etapas.

[Experimento e reprodução](https://github.com/evidencia-grupo/EvidencIA/tree/codex/transcricao-entregaveis/experiments/fakebr) e [relatório revisado](../entregaveis/arquivos/relatorio_tecnico_ia.md).
