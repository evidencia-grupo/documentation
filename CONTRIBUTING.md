# Guia de Contribuicao — Documentacao EvidencIA

Agradecemos o interesse em contribuir com a documentacao tecnica e de produto do **EvidencIA**!

---

## 1. Codigo de Conduta

Ao contribuir com este repositorio, voce concorda em seguir os padroes descritos em [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

---

## 2. Principios Editoriais e Qualidade Documental

- **Factualidade e Objetividade:** A documentacao deve ser rigorosa, baseada em evidencias tecnicas e alinhada ao estado real do codigo-fonte no repositorio `EvidencIA`.
- **Zero Emojis:** Nao utilize emojis em arquivos de documentacao, titulos, mensagens de commit ou pull requests.
- **Formato Padrao:** Utilize GitHub Flavored Markdown (GFM) com suporte as extensoes do MkDocs Material (admonicoes, tabelas, code blocks com anotacoes).
- **Rastreabilidade:** Ao propor alteracoes em requisitos ou arquitetura, cite as Decisoes de Arquitetura (ADRs) pertinentes.

---

## 3. Ambiente Local e Visualizacao

A documentacao e gerada com **MkDocs Material** e gerenciada via **uv**:

```bash
# Instalacao de dependencias
uv sync --frozen

# Servidor de desenvolvimento com recarregamento em tempo real
uv run mkdocs serve

# Validacao estrita de build (fail-closed)
uv run mkdocs build --strict
```

O comando `uv run mkdocs build --strict` nao permite links quebrados ou erros de configuracao.

---

## 4. Estrutura de Diretorios

- `docs/inicio/`: Guias de entrada e execucao local.
- `docs/visao/`: Sintese executiva, mapa do projeto e topologia.
- `docs/requisitos/`: Especificacao de requisitos (RF/RNF), personas e jornadas.
- `docs/arquitetura/`: Documento de arquitetura (C4), contratos e ADRs.
- `docs/operacao/`: Captura de legendas, verificacoes e operacao de pipeline.
- `docs/validacao/`: Estrategia de testes e avaliacao de IR.
- `docs/governanca/`: Prontidao, decisoes aprovadas e governanca de repositorios.
- `docs/entregaveis/`: Downloads de artefatos tecnicos consolidados.

---

## 5. Fluxo de Pull Requests

1. Crie um branch com prefixo `docs/` (ex.: `docs/atualizacao-arquitetura`).
2. Realize commits seguindo a convencao **Conventional Commits** (ex.: `docs: atualizar diagrama C4`).
3. Verifique que `uv run mkdocs build --strict` executa sem nenhum erro localmente.
4. Abra o Pull Request preenchendo o modelo em `.github/PULL_REQUEST_TEMPLATE.md`.
