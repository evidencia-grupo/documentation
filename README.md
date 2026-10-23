# EvidencIA — Documentação

Documentação do produto, da arquitetura, dos dados e modelo de IA, da operação e da validação da extensão EvidencIA.

- **Site publicado:** https://evidencia-grupo.github.io/documentation/
- **Código:** https://github.com/evidencia-grupo/EvidencIA

[![CI/CD Documentation](https://github.com/evidencia-grupo/documentation/actions/workflows/ci-docs.yml/badge.svg)](https://github.com/evidencia-grupo/documentation/actions/workflows/ci-docs.yml)
[![Repositório de Código](https://img.shields.io/badge/código-evidencia--grupo%2FEvidencIA-blue)](https://github.com/evidencia-grupo/EvidencIA)

## Começar

- [Portal e mapa de leitura](docs/index.md)
- [Desenvolvimento local](docs/inicio/desenvolvimento-local.md)
- [Datasets](docs/arquitetura/ia-e-datasets.md), [EDA](docs/arquitetura/eda.md) e [Modelo de IA](docs/arquitetura/modelo-ia.md)
- [Publicação na Chrome Web Store](docs/operacao/publicacao-chrome-web-store.md) e [Política de privacidade](docs/legal/politica-de-privacidade.md)
- [Prontidão e evidências](docs/governanca/prontidao.md)

## Visualizar a documentação

Python 3.12 ou superior e uv:

```bash
uv sync --frozen
uv run mkdocs serve
uv run mkdocs build --strict
```

## Organização

- `docs/inicio/`: entrada e execução local.
- `docs/visao/`: visão geral, mapa e status do projeto.
- `docs/requisitos/`: catálogo, personas, cenários, backlog e rastreabilidade.
- `docs/arquitetura/`: arquitetura, contratos, segurança, IA e dados, decisões (ADRs).
- `docs/operacao/`: captura de legendas, configuração e publicação.
- `docs/legal/`: política de privacidade.
- `docs/validacao/`: protocolos e métricas; planos não equivalem a experimentos concluídos.
- `docs/governanca/`: decisões aprovadas e prontidão atual.
- `docs/auditoria/`: relatórios de auditoria datados, publicados na navegação.
- `docs/auditorias/historico/`: snapshot congelado da auditoria anterior, fora da navegação e sem edição.
- `docs/desenvolvimento/referencia-original/`: READMEs originais preservados com proveniência, fora da navegação.

A diferença entre os diretórios de auditoria está em [Mapa do projeto](docs/visao/mapa-do-projeto.md#auditorias).

## Governança e Comunidade

- [Guia de Contribuição](CONTRIBUTING.md): diretrizes editoriais e validação de build estrito.
- [Política de Segurança](SECURITY.md): relato responsável de vulnerabilidades e integridade documental.
- [Código de Conduta](CODE_OF_CONDUCT.md): padrões de respeito e inclusão na comunidade.
- [Licença MIT](LICENSE): termos de uso aberto do projeto.
