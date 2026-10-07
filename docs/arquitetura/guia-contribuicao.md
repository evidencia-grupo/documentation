# Guia de Contribuição e Ambiente de Desenvolvimento

## Nesta página

- [Pré-requisitos](#pre-requisitos)
- [Rodar a Documentação Localmente](#rodar-a-documentacao-localmente)
- [Ambiente de Desenvolvimento da Extensão](#desenvolvimento-extensao)
- [Ambiente de Desenvolvimento do Backend Proxy](#desenvolvimento-backend)
- [Estrutura Consolidada do Repositório](#estrutura-de-arquivos)
- [Convenções e Padrões de Engenharia](#convencoes-de-documentacao)
- [Checklist Obrigatório de Pré-Commit](#checklist-antes-de-commitar)

---

## Pré-requisitos {: #pre-requisitos }

| Ferramenta | Versão Mínima | Finalidade |
|:---|:---|:---|
| **Python** | >= 3.12 | Backend Proxy (FastAPI + Pydantic v2) e ferramentas de documentação |
| **Node.js** | >= 20 LTS | Build da extensão (Preact + Vite + TypeScript) com npm >= 10 |
| **uv** | Mais recente | Gerenciador determinístico opcional para ferramentas Python e MkDocs |
| **Git** | >= 2.40 | Controle de versões |
| **Navegador Chromium** | Google Chrome, Edge ou Brave | Execução e validação da extensão em modo desenvolvedor |

---

## Rodar a Documentação Localmente {: #rodar-a-documentacao-localmente }

No repositório `documentation/`, o ambiente e as dependências são gerenciados via **uv** ou `pip`:

```bash
# 1. Iniciar o servidor de desenvolvimento com hot-reload via uv:
uv run mkdocs serve

# Ou alternativamente via python venv:
# python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt
# mkdocs serve

# O site estara disponivel em: http://127.0.0.1:8000
```

```bash
# 2. Executar o build estático com validação estrita (CI/CD):
uv run mkdocs build --strict

# A flag --strict assegura que avisos e links quebrados bloqueiem a esteira
```

---

## Ambiente de Desenvolvimento da Extensão {: #desenvolvimento-extensao }

No repositório de código `evidencia/`, a extensão localiza-se no diretório `extension/`:

1. **Instalar Dependências e Compilar:**
   ```bash
   cd extension
   npm install
   npm run build
   # Gera a pasta de distribuicao extension/dist/ com manifest.json, service-worker.js, content-script.js e panel
   ```

2. **Desenvolvimento Contínuo com Watch:**
   ```bash
   npm run dev
   # Compila em modo incremental ao salvar alteracoes
   ```

3. **Carregar no Navegador Chromium:**
   - Acesse `chrome://extensions/` (ou `edge://extensions/` ou `brave://extensions/`).
   - Ative a opção **Modo do desenvolvedor** no canto superior direito.
   - Clique no botão **Carregar sem compactação** (*Load unpacked*).
   - Selecione o diretório `extension/dist/`.

4. **Testar no YouTube:**
   - Abra qualquer vídeo em `https://www.youtube.com/watch?v=...`.
   - Localize o botão de acionamento da investigação injetado via Shadow DOM abaixo do player do vídeo.

---

## Ambiente de Desenvolvimento do Backend Proxy {: #desenvolvimento-backend }

O Backend Proxy em FastAPI reside no diretório `backend/` do repositório `evidencia/`:

```bash
# Opção A (Recomendada via uv):
cd backend
uv sync                     # Cria venv e instala dependencias e ferramentas dev
cp .env.example .env        # Configura variaveis locais
uv run uvicorn app.main:app --reload --port 8000  # Inicia servidor local
uv run pytest               # Executa testes automatizados
uv run ruff check .         # Executa linter

# Opção B (Tradicional via pip):
cd backend
python3 -m venv .venv
source .venv/bin/activate   # No Windows: .venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env
uvicorn app.main:app --reload --port 8000
pytest
ruff check .
```

Variáveis mínimas requeridas no arquivo `.env`:
```ini
PORT=8000
ENVIRONMENT=development
CORS_ORIGINS=["chrome-extension://*"]
RATE_LIMIT_PER_MINUTE=60
AI_ANALYSIS_TIMEOUT_SECONDS=8.0
GEMINI_API_KEY=sua_chave_de_teste_aqui
```

---

## Estrutura Consolidada dos Repositórios {: #estrutura-de-arquivos }

O ecossistema do projeto divide-se em dois repositórios complementares:

### Repositório de Código (`evidencia`)
```
evidencia/
├── .github/
│   ├── workflows/ci.yml     → Pipeline unificada (4 estágios: lint, build, test, deploy para front e back)
│   ├── CODEOWNERS           → Definicao de responsaveis tecnicos por modulo
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── ISSUE_TEMPLATE/      → Templates de bug, feature e user story
├── extension/               → Extensao Chromium Manifest V3 (Preact + TypeScript + Vite)
│   ├── manifest.json
│   ├── package.json
│   ├── tsconfig.json
│   ├── vite.config.ts
│   └── src/
│       ├── background/      → Service Worker (cache e requisicoes)
│       ├── content/         → Content Script (Shadow DOM no player)
│       └── panel/           → Painel Lateral Preact (ClaimCard, EvidenceCard, ReflectionQuestions)
├── backend/                 → Backend Proxy seguro (Python 3.12+ FastAPI)
│   ├── pyproject.toml
│   ├── requirements.txt
│   ├── .python-version
│   ├── .env.example
│   ├── app/
│   │   ├── main.py          → Ponto de entrada FastAPI, CORS e Rate Limiting
│   │   ├── config.py        → Carregamento e validacao de ambiente
│   │   ├── schemas.py       → Modelos Pydantic v2 sincronizados com o contrato
│   │   ├── api/v1/          → Endpoints /analyze e /health
│   │   └── services/        → Orquestrador de IA com timeout de 8,0s
│   └── tests/               → Testes de integracao com pytest e TestClient
├── shared/                  → Contratos compartilhados (Single Source of Truth)
│   ├── schemas/api-schema.json
│   └── types/api.ts
├── CONTRIBUTING.md          → Normas corporativas e fluxo de branch
├── SECURITY.md              → Politica de reporte de vulnerabilidades
└── README.md
```

### Repositório de Documentação (`documentation`)
```
documentation/
├── .github/workflows/
│   ├── ci-docs.yml              → Esteira de lint sem emojis e build estrito
│   └── docs-links.yml           → Validador de links relativos
├── pyproject.toml               → Dependencias MkDocs Material via uv
├── CHANGELOG.md                 → Historico cronologico de versoes
├── mkdocs.yml                   → Configuracao estrutural de navegacao
└── docs/                        → Portal completo de documentacao
    ├── index.md                 → Portal de entrada
    ├── glossario.md             → Vocabulario unificado do projeto
    ├── visao/                   → Visao geral, topologia e painel de status
    ├── requisitos/              → Requisitos RF/RNF, Casos de Uso, HU e Rastreabilidade
    ├── arquitetura/             → C4, Contrato API, Seguranca e ADR-001 a ADR-006
    └── validacao/               → Questoes norteadoras, experimento, metricas e DoD
```

---

## Convenções e Padrões de Engenharia {: #convencoes-de-documentacao }

### Tom e Estilo de Documentação
- Estilo estritamente técnico e profissional, **sem utilização de emojis**.
- Uso de identificadores explícitos (`{: #id }`) em cabeçalhos para manter âncoras estáveis.
- Referências cruzadas baseadas em caminhos relativos para garantir portabilidade em builds locais e servidores de CI.

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

- [ ] Todos os novos arquivos e seções foram mapeados no menu `nav` do `mkdocs.yml`.
- [ ] Links cruzados utilizam caminhos relativos e âncoras normalizadas.
- [ ] O comando de validação estrita `uv run mkdocs build --strict` executa com **zero avisos e zero erros**.
- [ ] O arquivo `CHANGELOG.md` registra as alterações na seção `[Unreleased]`.
- [ ] Nenhum segredo ou chave de API foi inserido em arquivos versionados.

---

**Ver também:** [Estratégia de Testes](estrategia-testes.md) — critérios para homologação de código.
