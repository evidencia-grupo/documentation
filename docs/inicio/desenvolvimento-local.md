# Desenvolvimento local

Use Node 24, Python 3.12 para a aplicação e Python 3.13 ou superior para este site. Mantenha os repositórios EvidencIA e documentation lado a lado. O modo mock permite verificar o fluxo sem chaves ou servidor de IA.

## Backend

Na pasta EvidencIA:

```bash
cd backend
uv sync --frozen --extra dev
cp .env.example .env
uv run uvicorn app.main:app --host 127.0.0.1 --port 8000
```

## Extensão

Em outro terminal:

```bash
cd EvidencIA/extension
npm ci --ignore-scripts
npm run build
```

Carregue `extension/dist` como extensão descompactada em `chrome://extensions`, abra um vídeo com legendas e acione Checar Alegações. Sem faixas, o painel informa a ausência; faixas vazias ou curtas produzem erro recuperável, nunca análise da descrição.

## Verificações

```bash
cd EvidencIA/backend
uv run ruff check . ../scripts --config pyproject.toml
uv run pytest --cov=app
cd ../extension
npm run typecheck
npm run test:coverage
npx playwright install chromium
E2E_PYTHON=../backend/.venv/bin/python npm run test:e2e
cd ..
backend/.venv/bin/python scripts/generate_contracts.py --check
backend/.venv/bin/python scripts/check_drift.py --docs ../documentation
```

Os E2E verificam o transporte real da extensão para o backend local com respostas controladas de legendas. Não certificam todos os vídeos reais ou mudanças futuras do YouTube. Para produção, configure provedor real, segredo próprio, autenticação, Redis e CORS exato; consulte a prontidão antes de hospedar.
