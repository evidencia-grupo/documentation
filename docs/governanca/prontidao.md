# Prontidão atual

Escopo verificado: desenvolvimento local e backend publicado no Render. Última verificação em 14/10/2026, sobre a branch `EvidencIA@fix/release-closure-audit` (main `01ed7b0` com as issues [#66](https://github.com/evidencia-grupo/EvidencIA/issues/66) a [#69](https://github.com/evidencia-grupo/EvidencIA/issues/69) auditadas e completadas) e `documentation@docs/release-closure-audit`.

As issues #66 a #69 foram conferidas contra o código e os testes, não só contra o backlog. A auditoria completou o que faltava: segmentação de legendas ASR pelas pausas da fala (#67), aberturas de telejornal e chamadas do canal sem saliência (#68), comparação de números no matcher (#69) e prova de ordem e latência das reflexões concorrentes (#66). Também reaplicou as correções para vídeos reais do YouTube, que não tinham chegado à main.

## Evidências

- Backend: 325 testes aprovados e 1 integração opcional ignorada (Chroma não instalado); cobertura de 94,09% (mínimo obrigatório 80%); ruff sem apontamentos; nenhum aviso.
- Extensão: 232 testes aprovados, sem ruído no stderr; cobertura de 95,58% das instruções e 91,61% dos ramos (mínimo de 81% por arquivo); typecheck e build passaram.
- Pacote da Chrome Web Store: gerado com `VITE_API_BASE_URL=https://evidencia-backend-jtsh.onrender.com npm run package` e aprovado pelo verificador (Manifest V3, permissões `storage` e `scripting`, hosts só YouTube e o backend HTTPS).
- E2E: 16 testes Playwright aprovados, incluindo corpo HTTP da legenda e ausência de análise com legenda vazia.
- Fake.br: 7 testes aprovados, incluindo a concordância (tolerância 1e-10) entre `metrics.json` e a entrega recebida.
- Contratos, drift e prontidão: `generate_contracts.py --check`, `check_drift.py` (0 crítico, 0 alto) e `check_readiness.py` sem falhas.
- Avaliação de recuperação: `evaluate_retrieval.py` responde `PENDING_HUMAN_ANNOTATION`. O gold set de 8 alegações e 9 pares não tem rótulos humanos, então não há Recall, MRR ou nDCG a relatar.
- Backend publicado: `/api/v1/health` respondeu `healthy`, com LLM, busca, cache e classificador operacionais. O plano gratuito leva cerca de 24 s para acordar.
- Runtime sem pickle: o backend carrega só `model.json`; o `.plk` acadêmico fica em `experiments/fakebr/models/`.
- CI desta branch: verificar os checks dos PRs; os resultados acima são de execução local.
- Reexecução em 23/10/2026 sobre `EvidencIA@6ec6c70` (cópia limpa do commit, Windows, Python 3.12, Node 24): backend com 331 testes aprovados e 1 ignorado, cobertura de 91,90%, ruff sem apontamentos; `generate_contracts.py --check`, `check_drift.py` (0 crítico, 0 alto) e `check_readiness.py` sem falhas; extensão com typecheck, build e 235 testes Vitest aprovados (95,6% das instruções, 91,55% dos ramos). E2E com 16 testes Playwright aprovados.

## Limites

O baseline local conserva acurácia 66,67% e macro F1 65,92% em 27 exemplos. O candidato Fake.br obtém 93,47% e macro-F1 0,9347 em 1.088 notícias; esses números não avaliam vídeos. [Revisão e escopos](revisao-relatorio-ia.md). Docker sem daemon, Redis multi-instância, avaliação humana do gold set e estudo de usuários não foram executados; a hospedagem no Render e o LLM real respondem no health, mas uma análise de ponta a ponta contra o Render ainda precisa ser feita na extensão publicada. A aprovação do usuário autoriza o trabalho e não substitui essas evidências. Os protocolos de validação descrevem como coletá-las.
