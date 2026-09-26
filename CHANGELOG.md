# Changelog

Todas as mudanças relevantes neste projeto são documentadas aqui.  
Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

---

## [Unreleased]

### Added

- **Engenharia de Requisitos:**
  - `docs/requisitos/elicitacao.md`: documentação aprofundada do processo empírico de descoberta e elicitação em 5 etapas (entrevistas qualitativas com múltiplos perfis, análise de concorrentes, prototipagem ergonômica, dinâmica da Técnica dos 100 Dólares para alocação orçamentária de RFs e RNFs, e matrizes MoSCoW e IN/OUT).
  - `docs/requisitos/cenarios.md`: especificação formal dos Cenários 01 a 11 com objetivos, contexto, atores, recursos, episódios operacionais, restrições e exceções.
  - `docs/requisitos/catalogo-requisitos.md`: consolidação formal e padronização dos requisitos funcionais (RF-01 a RF-11) e não funcionais (RNF-01 a RNF-07) com rastreabilidade direta aos cenários.
  - `docs/requisitos/backlog-e-historias.md`: padronização integral de HU01 a HU12 com personas vinculadas, critérios de aceitação objetivos, priorização MoSCoW e especificações BDD em sintaxe Gherkin.
  - `docs/requisitos/matriz-rastreabilidade.md`: matriz bidirecional consolidando Requisitos, Casos de Uso, Cenários Operacionais, Histórias de Usuário e Componentes Técnicos.
- **Arquitetura e Engenharia:**
  - `docs/tecnico/arquitetura.md`: expansão arquitetural com Modelo C4 (Nível 1 - Contexto; Nível 2 - Contêineres) e Diagrama de Sequência completo do fluxo crítico com demarcação exata dos SLAs e timeouts.
  - `docs/tecnico/contrato-api.md`: especificação formal da API REST entre extensão e Backend Proxy, schemas JSON, interfaces TypeScript e códigos de erro HTTP.
  - `docs/tecnico/threat-model.md`: análise de segurança formal sob a metodologia STRIDE, prevenção contra abusos e avaliação de conformidade com a LGPD.
  - `docs/tecnico/estrategia-testes.md`: pirâmide de testes, protocolos automatizados de medição para SLA de 10s (RNF-01) e TBT (RNF-02), e Definition of Done (DoD).
  - `docs/tecnico/decisoes/ADR-002-backend-proxy.md`: decisão arquitetural de intermediação via Backend Proxy dedicado.
  - `docs/tecnico/decisoes/ADR-003-estrategia-cache-local.md`: decisão técnica de cache local com `chrome.storage.local` e TTL de 24 horas.
- **Design e Interface:**
  - `docs/design/design-system.md`: especificação de tokens visuais, componente de velocímetro (gauge), card analítico e diretrizes de acessibilidade WCAG 2.1 AA baseados no mockup oficial.
- **Planejamento e Governança:**
  - `docs/planejamento/gestao-riscos.md`: matriz de riscos técnicos e de projeto com planos de contingência detalhados.
  - `docs/planejamento/metricas-telemetria.md`: plano de instrumentação e coleta ética de KPIs de negócio em conformidade com a privacidade.
- **Infraestrutura e Tooling:**
  - Suporte ao gerenciador **uv** com `.python-version` (3.13) e `pyproject.toml`.
  - Arquivo `.gitignore` abrangente para Python, uv, MkDocs e ambientes de desenvolvimento.
  - Integração de imagens e mockups do desafio na pasta `docs/assets/`.

### Changed

- Removidos integralmente todos os emojis da documentação para adotar um tom estritamente profissional e corporativo.
- Reformulação da landing page `docs/index.md` e do `README.md` com matriz interativa de módulos e parâmetros técnicos consolidados.
- Atualização do menu de navegação do `mkdocs.yml` para comportar a hierarquia completa de engenharia.
- Validação contínua com `uv run mkdocs build --strict` passando com zero erros e zero avisos.

---

## [0.1.0] — 2026-09

### Added

- Versão inicial dos documentos de produto:
  - `alinhamento-estrategico.md`
  - `personas-e-jornadas.md`
  - `backlog-e-historias.md`
  - `casos-de-uso.md`
  - `priorizacao-e-mvp.md`
- Configuração inicial do `mkdocs.yml`
