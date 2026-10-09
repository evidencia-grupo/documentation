# EvidencIA Documentação

Documentação do produto, operação, requisitos e validação. A aplicação usa legendas do vídeo; a descrição não substitui transcrição. O escopo verificado é desenvolvimento local.

[![CI/CD Documentation](https://github.com/evidencia-grupo/documentation/actions/workflows/ci-docs.yml/badge.svg)](https://github.com/evidencia-grupo/documentation/actions/workflows/ci-docs.yml)
[![Status: GO](https://img.shields.io/badge/Status-GO%20(Release%201.0.0)-brightgreen)](docs/governanca/prontidao.md)
[![Repositório de Código](https://img.shields.io/badge/código-evidencia--grupo%2FEvidencIA-blue)](https://github.com/evidencia-grupo/EvidencIA)
[![Fase CBL](https://img.shields.io/badge/CBL-Act%20(Release%20GO)-brightgreen)](docs/visao/status.md)

## Começar

- [Portal e mapa de leitura](docs/index.md)
- [Desenvolvimento local](docs/inicio/desenvolvimento-local.md)
- [Transcrição e validação](docs/operacao/transcricao-e-validacao.md)
- [Entregáveis em formatos editáveis e executáveis](docs/entregaveis/index.md)
- [Prontidão e evidências](docs/governanca/prontidao.md)

## Visualizar a documentação

Python 3.13 ou superior e uv:

```bash
uv sync --frozen
uv run mkdocs serve
uv run mkdocs build --strict
```

## Organização

- `docs/inicio/`: entrada e execução local.
- `docs/requisitos/`: catálogo, personas, cenários e rastreabilidade.
- `docs/arquitetura/`: contratos, segurança, decisões e infraestrutura.
- `docs/operacao/`: captura de legendas e verificações do fluxo.
- `docs/validacao/`: protocolos e métricas; planos não equivalem a experimentos concluídos.
- `docs/entregaveis/`: downloads DOCX, YAML e CSV.
- `docs/governanca/`: aprovação e prontidão atual.
- `docs/auditorias/historico/`: registros anteriores preservados com origem.

Código, notebooks e modelo: [EvidencIA](https://github.com/evidencia-grupo/EvidencIA). Histórico e documentos de origem ficam separados da navegação ativa.
