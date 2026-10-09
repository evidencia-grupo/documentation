# Remediação e decisão de prontidão — 09/10/2026

**GO técnico para desenvolvimento local.** Estágio confirmado pelo usuário: desenvolvimento. Aprovação das alterações e decisões declarada no chat. Branch nos dois repositórios: `codex/audit-remediation`.

## Evidência final

| Verificação | Resultado |
|---|---|
| Backend | 178 passed, 1 skipped; cobertura 95% |
| Extensão | 196 passed; cobertura de linhas 96,57%, branches 90,75% |
| E2E Chromium + backend local | 14 passed; 41,6 s |
| TypeScript e builds | Typecheck, desenvolvimento e produção com origem HTTPS de teste passaram |
| Python | Ruff para backend/scripts e build de wheel/sdist passaram |
| Contratos e drift | Contratos gerados idênticos; 0 apontamentos em todas as severidades |
| Documentação | MkDocs --strict, verificação de links ativos e padrão documental passaram |
| Dependências | npm e lock Python: 0 vulnerabilidades conhecidas na consulta realizada |
| Mutações | Sender, limite de corpo e catálogo de perguntas detectaram regressões introduzidas |
| Notebook | Todas as células executadas sem erro; modelo salvo/recarregado com inferência equivalente |

O teste ignorado exige Chroma/sentence-transformers opcionais, indisponíveis no ambiente. A consulta de advisories descreve o estado observado, sem garantia permanente. E2E usa fixtures e mock, sem chamadas pagas ou credenciais do usuário.

## Achados tratados

| ID | Correção |
|---|---|
| AI-001 | Catálogo finito neutro validado no backend e painel; respostas livres não chegam à interface. |
| AI-002 | Fallback usa trechos da transcrição; checagens recuperadas permanecem evidências contextuais. |
| AI-003 | Resultados externos contextualizam; relação factual local exige proposição normalizada idêntica. |
| AI-004 | Datas ausentes permanecem desconhecidas, sem substituir por data de consulta ou upload. |
| AI-005 | Timestamp provém de segmentos temporais válidos; timing ausente não vira zero. |
| AI-006 | Sem transferência de veredito por similaridade; negação/proposição divergente contextualiza. |
| ARCH-001 | Contratos JSON Schema e TypeScript gerados do Pydantic; extra/NaN recusados. |
| EXT-001 | 401/403 dispara emissão/renovação e uma repetição limitada ao prazo original. |
| SEC-001 | Limite ASGI antes do parse cobre corpo declarado e streaming. |
| SEC-002 | Storage compartilhado configurável; memória bloqueada em produção; concorrência local testada. |
| SEC-003 | Docker multi-stage, usuário 10001 e runtime com hashes; imagem pendente de daemon. |
| API-001 | Enum de health alinhado; estado não promete sondagem remota inexistente. |
| CI-001 | Render requer CORS exato, segredo e storage provisionados; nenhum wildcard de produção. |
| CI-002 | Actions fixadas por SHA, permissões reduzidas e gate de contratos/drift; docs também corrigida. |
| TEST-001 | Teste aguarda fila assíncrona e verifica ausência de side effects; mutação detectada. |
| DEP-001 | Vite/Vitest e tipos atualizados; auditorias de runtime e desenvolvimento sem advisories conhecidos. |
| DATA-001 | Recall conta fração de relevantes e nDCG ranks reais; dados não anotados bloqueiam métricas. |
| DATA-002 | Timestamp real de carga e SHA256 do conteúdo canônico; fixtures bloqueadas em produção. |
| DOC-001 | READMEs operacionais enxutos; referências extensas preservadas com origem. |
| DOC-002 | Narrativas migradas para histórico no repo de documentação; relatórios operacionais mantidos. |

## Proteções complementares

Segredo de assinatura e autenticação obrigatórios em produção; aliases de ambiente conferidos; CORS exato preserva origem Chrome válida. Conteúdo inventado pelo extrator é descartado. Vocabulário com empates lexicais estáveis e JSON ordenado passaram em teste entre diferentes PYTHONHASHSEED. Cache foi versionado para invalidar resultados antigos incompatíveis. Evidence-Only não instancia o provedor. Amostras de demonstração não são servidas como evidência factual em produção. Erros públicos não expõem detalhes internos.

## Modelo e dados

Modelo JSON treinado somente em 112 amostras, teste fixo de 27, seed 42. Acurácia 66,67%; macro F1 65,92%; baseline majoritário 51,85%. Houve 9 erros de predição. O modelo identifica padrões linguísticos e não comprova veracidade. Corpus local de 139 amostras com rótulos curados/fixtures; não equivale a um conjunto independente com anotações humanas. Métricas de recuperação não são declaradas sem gold set anotado.

## Limites da decisão

Dockerfile corrigido, mas sem execução da imagem porque o daemon não está disponível. Redis multi-instância, hospedagem, LLM real e experiência com usuários exigem validação nos respectivos ambientes. O GO local não certifica produção nem qualidade factual independente. A chave exposta no chat não foi usada ou incluída nos arquivos; sua substituição continua sendo uma ação na conta do titular.

## Conteúdo entregue

Notebook executado, modelo seguro em JSON, métricas e predições, CSV com partições, fontes declaradas, fixtures de recuperação, EDA, relatório técnico PDF/Markdown, Guiding Questions, requisitos, Scrum e catálogo/backlog de origem. Aprovações não foram convertidas em resultados de experimentos inexistentes.
