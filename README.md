<!-- nav:start -->
# EvidencIA — Documentacao do Projeto

> **Extensao de Fact-Checking para YouTube (Manifest V3 + Evidence-First)**  
> Sistema de apoio ao discernimento critico que extrai alegacoes de videos, recupera evidencias factuais em bases jornalisticas auditadas e organiza a investigacao para o usuario sem emitir vereditos algoritmicos.

### Essential Question (CBL)
> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informacoes sem substituir seu pensamento critico?"*

- **Status Geral do Projeto:** Consulte o painel consolidado em [docs/STATUS.md](docs/STATUS.md).
- **Repositorio de Codigo-Fonte:** [evidencia-grupo/EvidencIA](https://github.com/evidencia-grupo/EvidencIA)

---

### Comece por Aqui (5 Links Essenciais)
1. **Visao e Proposito:** [Alinhamento Estrategico](docs/visao/alinhamento-estrategico.md) e [Guiding Questions (CBL)](docs/visao/guiding-questions.md)
2. **Decisao Arquitetural Central:** [ADR-001 (Manifest V3)](docs/tecnico/decisoes/ADR-001-manifest-v3.md) e [ADR-006 (Arquitetura Evidence-First)](docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md)
3. **Engenharia de Requisitos:** [Catalogo de Requisitos (RF/RNF)](docs/requisitos/catalogo-requisitos.md) e [Matriz de Rastreabilidade](docs/requisitos/matriz-rastreabilidade.md)
4. **Governanca Scrum:** [Product Backlog](docs/scrum/product-backlog.md) e [Definition of Done](docs/scrum/definition-of-done.md)
5. **Painel de Resultados e Status:** [Painel de Status (STATUS.md)](docs/STATUS.md) e [Relatorio de Completude CBL](docs/cbl/reflect-share/CBL_COMPLETENESS_REPORT.md)

---

### Jornada Metodologica Challenge Based Learning (CBL)
- **1. Engage:** [Visao do Projeto](docs/visao/README.md) · [12 Guiding Questions](docs/visao/guiding-questions.md) · [Essential Question](docs/visao/essential-question-alignment.md) · [Log de Decisoes](docs/visao/decision-log.md)
- **2. Investigate:** [Requisitos](docs/requisitos/README.md) · [Arquitetura C4](docs/tecnico/arquitetura.md) · [Decisoes Tecnicas (ADRs)](docs/tecnico/decisoes/README.md) · [Design System](docs/design/README.md)
- **3. Act:** [Visao Geral do Experimento](docs/cbl/act/README.md) · [Plano Experimental](docs/cbl/act/experiment-plan.md) · [Telemetria e Metricas](docs/cbl/act/telemetry-spec.md)
- **4. Reflect & Share:** [Sintese e Reflexao](docs/cbl/reflect-share/reflection.md) · [Portfolio de Pesquisa](docs/cbl/reflect-share/research-portfolio.md) · [Showcase Banca](docs/cbl/reflect-share/showcase-script.md) · [Go/No-Go Final](docs/cbl/reflect-share/go-no-go-final.md)

---
<!-- nav:end -->

# Extensão de Fact-Checking para YouTube

> Checagem de fatos integrada ao YouTube — transcrição automática, inteligência artificial e painel lateral acessível.

---

## Visão Geral

A **Extensão de Fact-Checking para YouTube** é uma extensão de navegador (Google Chrome, Microsoft Edge, Brave — Manifest V3) que extrai a transcrição do vídeo em reprodução, cruza as alegações centrais com fontes externas confiáveis via modelos de inteligência artificial e apresenta, em um painel lateral acessível, uma síntese categorizada com índice de veracidade e fontes auditáveis.

Desenvolvida para **usuários leigos, estudantes e educadores**, permitindo validar informações diretamente no fluxo de consumo sem sair da plataforma.

---

## Links Rápidos da Documentação

| Seção | Documento | Finalidade |
|:---|:---|:---|
| **Visão** | [Alinhamento Estratégico](docs/visao/alinhamento-estrategico.md) | Visão, KPIs de produto e restrições de negócio |
| **Design** | [Personas e Jornadas](docs/design/personas-e-jornadas.md) | Perfis de usuários, antipersonas e jornadas AS-IS / TO-BE |
| **Design** | [Design System da Interface](docs/design/design-system.md) | Tokens visuais, velocímetro, componentes e acessibilidade |
| **Requisitos** | [Processo de Elicitação](docs/requisitos/elicitacao.md) | Entrevistas com usuários, benchmarking de concorrentes, protótipos e Técnica dos 100 Dólares |
| **Requisitos** | [Catálogo de Requisitos](docs/requisitos/catalogo-requisitos.md) | Especificação completa de todos os RFs e RNFs |
| **Requisitos** | [Casos de Uso](docs/requisitos/casos-de-uso.md) | Especificação formal de fluxos principais e de exceção |
| **Requisitos** | [Cenários de Uso e Operação](docs/requisitos/cenarios.md) | Especificação detalhada de episódios, atores e restrições |
| **Requisitos** | [Backlog e Histórias](docs/requisitos/backlog-e-historias.md) | Épicos e critérios de aceitação em formato Gherkin |
| **Requisitos** | [Matriz de Rastreabilidade](docs/requisitos/matriz-rastreabilidade.md) | Mapeamento bidirecional: Requisitos, Histórias e Testes |
| **Técnico** | [Arquitetura do Sistema](docs/tecnico/arquitetura.md) | Modelos C4 (Contexto e Contêineres) e diagrama de sequência |
| **Técnico** | [Contrato de Dados e API](docs/tecnico/contrato-api.md) | Endpoints REST, schemas JSON e interfaces TypeScript |
| **Técnico** | [Threat Model e LGPD](docs/tecnico/threat-model.md) | Análise STRIDE, segurança de credenciais e conformidade legal |
| **Técnico** | [Estratégia de Testes e DoD](docs/tecnico/estrategia-testes.md) | Pirâmide de testes, medição de RNFs e Definition of Done |
| **Técnico** | [Decisões Arquiteturais (ADRs)](docs/tecnico/arquitetura.md#decisoes-de-design-adrs) | Registro de decisões estruturais (MV3, Proxy, Cache) |
| **Técnico** | [Guia de Contribuição e Setup](docs/tecnico/guia-contribuicao.md) | Instruções para execução local e desenvolvimento |
| **Planejamento** | [Priorização e MVP](docs/planejamento/priorizacao-e-mvp.md) | Matriz MoSCoW e sequenciador de features Lean Inception |
| **Planejamento** | [Gestão de Riscos Técnicos](docs/planejamento/gestao-riscos.md) | Mapeamento de ameaças técnicas e planos de contingência |
| **Planejamento** | [Métricas e Telemetria](docs/planejamento/metricas-telemetria.md) | Instrumentação e coleta ética de dados de uso |
| **Referência** | [Glossário Técnico](docs/referencia/glossario.md) | Definições formais de todos os termos e siglas utilizados |

---

## Estrutura do Repositório

```
documentation/
├── .github/                 → Workflows de automação e CI/CD para GitHub Pages
├── .gitignore               → Regras de exclusao do Git (venv, site/, caches, OS)
├── .python-version          → Versao do Python fixada (3.13)
├── pyproject.toml           → Especificacao do projeto e dependencias via uv
├── uv.lock                  → Trava deterministica de dependencias
├── README.md                → Visao executiva do projeto
├── CHANGELOG.md             → Historico cronologico de mudancas
├── mkdocs.yml               → Configuracao do portal MkDocs Material
└── docs/
    ├── assets/              → Mockups, diagramas e recursos visuais
    ├── index.md             → Landing page da documentacao
    ├── stylesheets/         → Estilos customizados, transicoes e acessibilidade (extra.css)
    ├── visao/               → Alinhamento estrategico e visao do produto
    ├── design/              → Personas, jornadas e design system
    ├── requisitos/          → Catalogo de requisitos, backlog, casos de uso e matriz
    ├── tecnico/             → Arquitetura C4, contrato de API, threat model, testes e ADRs
    ├── planejamento/        → Priorizacao, gestao de riscos e metricas
    └── referencia/          → Glossario tecnico de termos
```

---

## Rodar a Documentação Localmente

Este repositório utiliza o **[uv](https://docs.astral.sh/uv/)** para gerenciamento do ambiente e dependências Python:

```bash
# Iniciar o servidor local com recarregamento em tempo real (hot-reload):
uv run mkdocs serve

# Executar a validacao estrita de integridade (CI/CD):
uv run mkdocs build --strict
```

Acesse o portal em: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## Parâmetros Técnicos do Produto

| Atributo | Especificação Homologada |
|:---|:---|
| **Padrão de Extensão** | Manifest V3 (Google Chrome Extensions API) |
| **Navegadores Homologados** | Google Chrome, Microsoft Edge, Brave (Chromium >= 110) |
| **Domínio de Operação** | Exclusivo em URLs de reprodução ativa: `youtube.com/watch*` |
| **SLA de Latência** | Resposta útil entregue em até **10 segundos** ([RNF-01](docs/requisitos/catalogo-requisitos.md#rnf-01)) |
| **Sobrecarga na Página** | Impacto máximo de **+50 ms** em Total Blocking Time (TBT) ([RNF-02](docs/requisitos/catalogo-requisitos.md#rnf-02)) |
| **Público-Alvo** | Consumidores leigos de conteúdos de saúde e informativos, estudantes e educadores |
| **Fase Atual** | Especificação Técnica e de Produto Concluída — Fase de Implementação do MVP |