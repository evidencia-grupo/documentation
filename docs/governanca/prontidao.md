# Prontidão atual

Escopo verificado: desenvolvimento local. Branch de continuação: `codex/transcricao-entregaveis`, criada da main após incorporar as entregas anteriores.

As correções da auditoria inicial foram incorporadas à main. A nova revisão remove a descrição do fluxo de análise, corrige JSON3/SRV3, invalida cache anterior e usa transcrição integral e recuperação por alegação.

## Evidências

- Backend: 185 testes aprovados e 1 integração opcional ignorada; cobertura de branches incluída no relatório.
- Extensão: 205 testes aprovados; typecheck e build local passaram.
- Notebooks: treinamento/avaliação e EDA executados sem erros; JSON e pickle equivalentes nas 139 amostras.
- Documentos: sete DOCX renderizados e conferidos; YAML/CSV estruturados validados.
- E2E: 16 testes aprovados, incluindo corpo HTTP da legenda e ausência de análise com legenda vazia.
- Fake.br: notebook de 31 células reexecutado; partições e 32 métricas centrais reproduzidas.
- CI desta branch: verificar os checks dos PRs; os resultados acima são de execução local.

## Limites

O baseline local conserva acurácia 66,67% e macro F1 65,92% em 27 exemplos. O candidato Fake.br obtém 93,47% e macro-F1 0,9347 em 1.088 notícias; esses números não avaliam vídeos. [Revisão e escopos](revisao-relatorio-ia.md). Docker sem daemon, hospedagem, Redis multi-instância, LLM real e estudo de usuários não foram executados. A aprovação do usuário autoriza o trabalho e não substitui essas evidências. Os protocolos de validação descrevem como coletá-las.
