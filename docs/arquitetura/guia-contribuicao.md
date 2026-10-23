# Guia de Contribuição e Ambiente de Desenvolvimento

## Nesta página

- [Onde está cada instrução](#fontes-canonicas)
- [Verificações da CI deste repositório](#verificacoes-da-ci)
- [Estrutura Consolidada dos Repositórios](#estrutura-de-arquivos)
- [Convenções e Padrões de Engenharia](#convencoes-de-documentacao)
- [Checklist Obrigatório de Pré-Commit](#checklist-antes-de-commitar)

---

## Onde está cada instrução {: #fontes-canonicas }

Esta página reúne convenções e a estrutura dos repositórios. Para não manter instruções duplicadas, os procedimentos ficam em uma única fonte:

| Assunto | Fonte canônica |
|:---|:---|
| Instalar e executar backend, extensão e este site; rodar testes | [Desenvolvimento local](../inicio/desenvolvimento-local.md) |
| Variáveis de ambiente do backend | `backend/.env.example` e `backend/app/config.py` no [repositório EvidencIA](https://github.com/evidencia-grupo/EvidencIA); uso em [Configuração e evidências](../operacao/configuracao-e-evidencias.md) |
| Fluxo de branch, commits e pull requests deste repositório | `CONTRIBUTING.md` na raiz do repositório `documentation` |
| Fluxo de contribuição do código | `CONTRIBUTING.md` do repositório EvidencIA |

Versões anteriores desta página traziam variáveis que não existem no backend (`CORS_ORIGINS`, `RATE_LIMIT_PER_MINUTE`, `AI_ANALYSIS_TIMEOUT_SECONDS`, `GEMINI_API_KEY`), timeout de 8 s e `pip install -r requirements.txt` para este site. Os nomes vigentes são, entre outros, `CORS_ALLOWED_ORIGINS`, `RATE_LIMIT_MAX_PER_MINUTE`, `LLM_TIMEOUT_SECONDS` (padrão e teto de 15 s), `LLM_PROVIDER` e `REMOTE_LLM_API_KEY`.

---

## Verificações da CI deste repositório {: #verificacoes-da-ci }

| Workflow | Quando roda | O que bloqueia |
|:---|:---|:---|
| `.github/workflows/ci-docs.yml` | Push e PR para `main`; manual | Emojis em páginas ativas; `uv sync --frozen`; `uv run mkdocs build --strict`. Publica no GitHub Pages só em push para `main`. |
| `.github/workflows/docs-links.yml` | PR para `main` que altere `docs/**`, `README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `mkdocs.yml` ou o próprio workflow; manual | Links e imagens relativos inexistentes, URIs `file://` e imagens sem texto alternativo nas páginas ativas. |

Links externos (`http://`, `https://`) não são verificados por nenhum workflow, pois dependem de rede e de limites de taxa de terceiros; confira-os manualmente quando alterá-los.

Para reproduzir localmente, na raiz de `documentation/`:

```bash
uv sync --frozen
uv run mkdocs build --strict
```

O script de links é o bloco `python -c` de `docs-links.yml`; execute-o a partir da raiz do repositório com o Python 3.12 do ambiente (`uv run python -c "..."`).

---

## Estrutura Consolidada dos Repositórios {: #estrutura-de-arquivos }

O ecossistema do projeto divide-se em dois repositórios complementares.

### Repositório de Código (`EvidencIA`)
```
EvidencIA/
├── .github/workflows/       → ci.yml (lint, build, testes e E2E) e release-extension.yml
├── extension/               → Extensão Chromium Manifest V3 (Preact + TypeScript + Vite)
│   ├── manifest.json        → Permissões storage e scripting; hosts YouTube e backend
│   ├── e2e/                 → Testes Playwright
│   └── src/
│       ├── background/      → Service Worker (cache, captura de legendas, chamadas ao backend)
│       ├── content/         → Content Script (botão em Shadow DOM, parser de legendas)
│       └── panel/           → Painel Preact (ClaimCard, EvidenceCard, ReflectionQuestions)
├── backend/                 → Backend Proxy (Python 3.12, FastAPI)
│   ├── app/
│   │   ├── api/v1/          → /auth/token, /analyze, /feedback, /classify, /health, /health/live, /health/ready
│   │   ├── providers/       → ollama, remote, mock
│   │   └── services/        → orquestração, busca de evidências, classificador e autenticação
│   ├── ml/                  → classificador de contingência, datasets e recuperação
│   └── tests/               → Pytest
├── shared/                  → Contratos gerados (schemas/api-schema.json, types/api.ts)
├── scripts/                 → generate_contracts.py, check_drift.py, check_readiness.py, evaluate_retrieval.py
├── evaluation/              → Gold set de recuperação (sem anotação humana)
├── experiments/fakebr/      → Experimento acadêmico Fake.br
└── render.yaml              → Blueprint de hospedagem no Render
```

### Repositório de Documentação (`documentation`)
```
documentation/
├── .github/workflows/
│   ├── ci-docs.yml              → Lint sem emojis, build estrito e publicação
│   └── docs-links.yml           → Validador de links e imagens relativos
├── pyproject.toml / uv.lock     → Dependências MkDocs Material via uv
├── mkdocs.yml                   → Navegação e exclusões
└── docs/
    ├── index.md, glossario.md
    ├── inicio/, operacao/, legal/
    ├── visao/, requisitos/, arquitetura/, validacao/, governanca/
    ├── auditoria/                → Relatórios datados (na navegação)
    ├── auditorias/historico/     → Snapshot congelado (fora da navegação)
    └── desenvolvimento/referencia-original/ → READMEs originais (fora da navegação)
```

---

## Convenções e Padrões de Engenharia {: #convencoes-de-documentacao }

### Tom e Estilo de Documentação
- Estilo estritamente técnico e profissional, **sem utilização de emojis**.
- Uso de identificadores explícitos (`{: #id }`) em cabeçalhos para manter âncoras estáveis.
- Referências cruzadas baseadas em caminhos relativos para garantir portabilidade em builds locais e servidores de CI.
- Imagens informativas com texto alternativo descritivo e, quando contêm dados, o conteúdo essencial também em texto ou tabela.
- Estado explícito de cada afirmação: planejado, implementado, testado localmente ou verificado no ambiente publicado.

### Admonitions Oficiais
Utilize os blocos nativos do Material for MkDocs:
```markdown
!!! note "Nota de Escopo"
    Contexto operacional relevante.

!!! warning "Aviso de Segurança"
    Restrições de segurança ou privacidade.

!!! info "Referência Técnica"
    Detalhes de parâmetros e contratos.
```

---

## Checklist Obrigatório de Pré-Commit {: #checklist-antes-de-commitar }

- [ ] Todos os novos arquivos e seções foram mapeados no menu `nav` do `mkdocs.yml` ou excluídos intencionalmente em `exclude_docs`.
- [ ] Links cruzados utilizam caminhos relativos e âncoras normalizadas.
- [ ] O comando de validação estrita `uv run mkdocs build --strict` executa com **zero avisos e zero erros**.
- [ ] O arquivo `CHANGELOG.md` registra as alterações na seção `[Unreleased]`.
- [ ] Nenhum segredo ou chave de API foi inserido em arquivos versionados.
- [ ] Nenhum arquivo em `docs/auditorias/historico/` ou `docs/desenvolvimento/referencia-original/` foi alterado (exceto `PROVENIENCIA.md`).

---

**Ver também:** [Estratégia de Testes](estrategia-testes.md) — critérios para homologação de código.
