# Desenvolvimento local

Mantenha os repositórios `EvidencIA` (código) e `documentation` (este site) lado a lado na mesma pasta. O modo mock permite verificar o fluxo sem chaves ou servidor de IA.

## Pré-requisitos

| Ferramenta | Versão | Uso |
|:---|:---|:---|
| Python | 3.12 (fixado em `.python-version` nos dois repositórios) | Backend e este site |
| [uv](https://docs.astral.sh/uv/) | Versão recente | Ambientes Python a partir dos lockfiles (`uv.lock`) |
| Node.js | 24 LTS (a versão usada na CI do EvidencIA) | Build e testes da extensão |
| Navegador Chromium | Chrome, Edge ou Brave | Carregar a extensão descompactada |

## Este site (repositório `documentation`)

Na raiz de `documentation/`:

```bash
uv sync --frozen
uv run mkdocs serve -a 127.0.0.1:8001
uv run mkdocs build --strict
```

`uv sync --frozen` instala exatamente o que está em `uv.lock`, sem atualizá-lo. O `mkdocs serve` usa a porta 8000 por padrão, a mesma do backend; por isso o exemplo usa 8001. O build estrito falha em qualquer aviso (link ou âncora inválida, página fora da navegação não excluída). A verificação de links relativos feita pela CI está descrita no [Guia de contribuição](../arquitetura/guia-contribuicao.md#verificacoes-da-ci).

## Backend (repositório `EvidencIA`)

Na pasta `EvidencIA/backend`:

```bash
uv sync --frozen --extra dev
cp .env.example .env
uv run uvicorn app.main:app --host 127.0.0.1 --port 8000
```

O `backend/.env.example` já vem com `LLM_PROVIDER=mock`, `REQUIRE_AUTH=false` e um `AUTH_SECRET` de desenvolvimento, que só serve localmente. Não use o `.env.example` da raiz do repositório para o backend: ele serve de referência geral e define `LLM_PROVIDER=ollama`. Para provedores reais, consulte [Configuração e evidências](../operacao/configuracao-e-evidencias.md). Nunca coloque chaves reais em arquivos versionados.

## Extensão (repositório `EvidencIA`)

Em outro terminal, na pasta `EvidencIA/extension`:

```bash
npm ci --ignore-scripts
npm run build
```

Sem `.env`, o build de desenvolvimento aponta para `http://127.0.0.1:8000` (valor padrão de `VITE_API_BASE_URL` em `vite.config.ts`). Carregue `extension/dist` como extensão descompactada em `chrome://extensions`, abra um vídeo com legendas e acione Checar Alegações. Sem faixas, o painel informa a ausência; faixas vazias ou curtas produzem erro recuperável, nunca análise da descrição.

## Verificações

Na pasta `EvidencIA/backend`:

```bash
uv run ruff check . ../scripts --config pyproject.toml
uv run pytest --cov=app
uv run python ../scripts/generate_contracts.py --check
uv run python ../scripts/check_drift.py --docs ../../documentation
```

Na pasta `EvidencIA/extension`:

```bash
npm run typecheck
npm run test:coverage
npx playwright install chromium
E2E_PYTHON=../backend/.venv/bin/python npm run test:e2e
```

No Windows, o interpretador do ambiente fica em `..\backend\.venv\Scripts\python.exe`; ajuste `E2E_PYTHON` de acordo. O E2E sobe o próprio backend em `127.0.0.1:8000` (porta fixa em `playwright.config.ts`): encerre antes qualquer backend que você tenha iniciado nessa porta, ou o Playwright aborta com "is already used". `check_drift.py` procura o repositório `documentation` como irmão de `EvidencIA` quando `--docs` é omitido.

Os E2E verificam o transporte real da extensão para o backend local com respostas controladas de legendas. Não certificam todos os vídeos reais ou mudanças futuras do YouTube. Para produção, configure provedor real, segredo próprio, autenticação, Redis e CORS exato; consulte a [prontidão](../governanca/prontidao.md) e a [publicação](../operacao/publicacao-chrome-web-store.md) antes de hospedar.

Os comandos do repositório `EvidencIA` acima foram conferidos contra os arquivos de configuração de `EvidencIA@6ec6c70` (`backend/pyproject.toml`, `backend/.env.example`, `extension/package.json` e `extension/vite.config.ts`), mas não foram executados nesta revisão da documentação.
