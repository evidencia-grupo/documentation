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
| **Python** | >= 3.13 | Ambiente de execução e ferramentas de documentação |
| **uv** | Mais recente | Gerenciador determinístico de pacotes e ambientes virtuais Python |
| **Node.js** | >= 20 LTS | Build do frontend da extensão e do backend proxy em TypeScript/JavaScript |
| **Git** | >= 2.40 | Controle de versões |
| **Navegador Chromium** | Google Chrome, Edge ou Brave | Execução da extensão em modo desenvolvedor |

---

## Rodar a Documentação Localmente {: #rodar-a-documentacao-localmente }

Com o **uv** instalado, o ambiente virtual e as dependências são gerenciados de forma transparente:

```bash
# 1. Iniciar o servidor de desenvolvimento com hot-reload:
uv run mkdocs serve

# O site estara disponivel em: http://127.0.0.1:8000
```

```bash
# 2. Executar o build estático com validação estrita (CI/CD):
uv run mkdocs build --strict

# A flag --strict assegura que avisos e links quebrados bloqueiem a esteira
```

---

## Ambiente de Desenvolvimento da Extensão {: #desenvolvimento-extensao }

Para executar e testar a extensão no navegador em modo descompactado (*unpacked*):

1. **Compilar os Artefatos da Extensão:**
   ```bash
   npm install
   npm run build
   # Gera a pasta de distribuicao /dist com manifest.json, content-scripts e service-worker
   ```
2. **Carregar no Navegador Chromium:**
   - Acesse `chrome://extensions/` (ou `edge://extensions/` ou `brave://extensions/`).
   - Ative a opção **Modo do desenvolvedor** no canto superior direito.
   - Clique no botão **Carregar sem compactação** (*Load unpacked*).
   - Selecione o diretório `/dist` gerado pelo build.
3. **Testar no YouTube:**
   - Abra qualquer vídeo em `https://www.youtube.com/watch?v=...`.
   - Localize o botão de veracidade injetado abaixo do título do vídeo.

---

## Ambiente de Desenvolvimento do Backend Proxy {: #desenvolvimento-backend }

O Backend Proxy pode ser executado localmente para simular respostas reais ou sintetizadas por mock:

```bash
# 1. Configurar variáveis de ambiente a partir do modelo
cp .env.example .env

# 2. Instalar dependências e executar o servidor
uv run uvicorn server.main:app --reload --port 8000
# Ou via Node.js:
# npm run dev
```

Variáveis mínimas requeridas no arquivo `.env`:
```ini
PORT=8000
ENVIRONMENT=development
LLM_API_KEY=sua_chave_de_teste_aqui
SEARCH_API_KEY=sua_chave_de_busca_aqui
RATE_LIMIT_MAX_PER_MINUTE=60
```

---

## Estrutura Consolidada do Repositório {: #estrutura-de-arquivos }

```
documentation/
├── .gitignore               → Regras de exclusao do Git (venv, site/, caches, OS)
├── .python-version          → Versao do Python fixada (3.13)
├── pyproject.toml           → Especificacao do projeto e dependencias via uv
├── uv.lock                  → Trava deterministica de dependencias
├── README.md                → Visao executiva do projeto
├── CHANGELOG.md             → Historico cronologico de mudancas
├── mkdocs.yml               → Configuracao do portal MkDocs Material
└── docs/
    ├── assets/              → Imagens, mockups e diagramas
    ├── index.md             → Landing page da documentacao
    ├── visao/
    │   └── alinhamento-estrategico.md
    ├── design/
    │   ├── personas-e-jornadas.md
    │   └── design-system.md
    ├── requisitos/
    │   ├── catalogo-requisitos.md
    │   ├── backlog-e-historias.md
    │   ├── casos-de-uso.md
    │   └── matriz-rastreabilidade.md
    ├── tecnico/
    │   ├── arquitetura.md
    │   ├── contrato-api.md
    │   ├── threat-model.md
    │   ├── estrategia-testes.md
    │   ├── guia-contribuicao.md
    │   └── decisoes/
    │       ├── ADR-001-manifest-v3.md
    │       ├── ADR-002-backend-proxy.md
    │       └── ADR-003-estrategia-cache-local.md
    ├── planejamento/
    │   ├── priorizacao-e-mvp.md
    │   ├── gestao-riscos.md
    │   └── metricas-telemetria.md
    └── referencia/
        └── glossario.md
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
