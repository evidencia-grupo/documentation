# EvidencIA Portal de documentação

O EvidencIA organiza a investigação de alegações presentes nas legendas de vídeos do YouTube. O usuário examina fontes e incertezas. O classificador descreve padrões linguísticos; suas métricas não comprovam veracidade factual.

## Comece pelo seu objetivo

| Objetivo | Leitura inicial | Próximo passo |
|---|---|---|
| Executar o projeto | [Desenvolvimento local](inicio/desenvolvimento-local.md) | [Captura e validação da transcrição](operacao/transcricao-e-validacao.md) |
| Entender o produto | [Visão geral](visao/visao-geral-do-projeto.md) | [Catálogo de requisitos](requisitos/catalogo-requisitos.md) |
| Revisar engenharia | [Arquitetura](arquitetura/arquitetura.md) | [Contrato da API](arquitetura/contrato-api.md) e [testes](arquitetura/estrategia-testes.md) |
| Avaliar os resultados | [Prontidão](governanca/prontidao.md) | [Métricas](validacao/definicao-metricas.md) e [limitações](validacao/limitacoes.md) |
| Baixar os entregáveis | [Índice de arquivos](entregaveis/index.md) | Notebooks, modelo, DOCX, YAML e CSV |

## Regra de integridade

A captura busca uma faixa de legendas do vídeo atual e lê seu conteúdo em `/api/timedtext`. Descrição, título e resultados de checagem não são usados como substitutos da fala. Sem transcrição válida, não há requisição de análise. O cache atual invalida resultados das versões anteriores que poderiam conter descrição.

## Estado e origem

A [prontidão atual](governanca/prontidao.md) distingue testes concluídos de validações pendentes. Protocolos de participantes e planos de sprints são planos; não constituem resultados observados. As [decisões aprovadas](governanca/decisoes-aprovadas.md) registram a autorização do usuário separadamente dos experimentos.

A documentação anterior permanece em `auditorias/historico/` e `desenvolvimento/referencia-original/`, fora da navegação ativa. Consulte o [glossário](glossario.md) para os termos usados.
