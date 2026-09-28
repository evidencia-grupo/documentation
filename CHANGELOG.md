# Changelog

Todas as mudanças relevantes neste projeto são documentadas aqui.  
Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

---

## [Unreleased]

### Added

- **Navegação, Acessibilidade e Experiência do Usuário (UX/UI):**
  - `docs/stylesheets/extra.css`: estilização personalizada contemplando transições sutis entre páginas (`subtleFadeIn`), suporte a `prefers-reduced-motion`, anéis de foco de alto contraste para navegação por teclado (`:focus-visible` - WCAG 2.1 AA), bordas suaves e sombras volumétricas para mockups e tabelas responsivas.
  - Chaveador de tema dinâmico Claro/Escuro (Light/Slate) no cabeçalho com detecção automática da preferência do sistema operacional (`prefers-color-scheme`).
  - Navegação instantânea assíncrona (`navigation.instant`) com barra de progresso sutil no topo (`navigation.instant.progress`) e pré-visualização de links (`navigation.instant.preview`).
  - Trilha de navegação estrutural em breadcrumbs (`navigation.path`), abas superiores fixas com rolagem (`navigation.tabs.sticky`) e sumário lateral direito sincronizado dinamicamente com a rolagem (`toc.follow`).
- **Alinhamento e Distribuição de Recursos Visuais:**
  - `docs/planejamento/priorizacao-e-mvp.md`: correção e posicionamento fidedigno do Sequenciador Lean Inception (`sequenciador-lean-inception.png`), criação da seção dedicada ao Funil de Priorização do Backlog (`funil-backlog.png`) e seção de Critérios de Exclusão e Limites de Escopo (`criterios-exclusao.png`).
  - `docs/requisitos/casos-de-uso.md`: integração do diagrama UML formal de casos de uso (`diagrama-casos-de-uso.png`) articulado com o diagrama interativo Mermaid.
  - `docs/requisitos/backlog-e-historias.md`: integração do mapa estrutural de épicos, features e personas (`epicos-e-features.png`) e do funil de refinamento progressivo do backlog.
  - `docs/design/personas-e-jornadas.md`: integração do painel visual de critérios de exclusão, antipersonas e salvaguardas de produto (`criterios-exclusao.png`).
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
  - `docs/tecnico/decisoes/ADR-004-stack-tecnologica.md`: decisão formal da stack tecnológica consolidada — Preact 10 + TypeScript + Vite 5 na extensão cliente (Manifest V3) e Python 3.12+ com FastAPI e Pydantic v2 no Backend Proxy, organizados em topologia de monorepo.
  - `docs/tecnico/estrategia-testes.md`: especificação formal da arquitetura da esteira de CI/CD com duas trilhas independentes de 4 estágios sequenciais (`lint`, `build`, `test`, `deploy`) para frontend e backend, e atualização dos ambientes de teste (Node.js 20 para extensão e Python 3.12 para backend proxy).
- **Design e Interface:**
  - `docs/design/design-system.md`: especificação de tokens visuais, componente de velocímetro (gauge), card analítico e diretrizes de acessibilidade WCAG 2.1 AA baseados no mockup oficial.
- **Planejamento e Governança:**
  - `docs/planejamento/priorizacao-e-mvp.md`: especificação da cadência de execução em Fast-Track de 2 semanas (Sprint 1 de 28/09 a 02/10 e Sprint 2 de 05/10 a 09/10/2026) e Matriz de Alocação de Responsabilidades distribuída entre os 5 integrantes da equipe.
  - `docs/planejamento/gestao-riscos.md`: matriz de riscos técnicos e de projeto com planos de contingência detalhados.
  - `docs/planejamento/metricas-telemetria.md`: plano de instrumentação e coleta ética de KPIs de negócio em conformidade com a privacidade.
- **Infraestrutura e Tooling:**
  - Suporte ao gerenciador **uv** com `.python-version` (3.13) e `pyproject.toml`.
  - Pipeline de CI/CD para GitHub Pages (`.github/workflows/ci-docs.yml`) com 4 etapas: lint, test, build e deploy.
  - Arquivo `.gitignore` abrangente para Python, uv, MkDocs e ambientes de desenvolvimento.
  - Integração de imagens e mockups do desafio na pasta `docs/assets/`.

### Fixed

- **Tipografia e Correção de Sobreposição de Texto (UX/UI):**
  - `docs/stylesheets/extra.css`: remoção da regra genérica e destrutiva `.md-content em` que transformava qualquer itálico em bloco centralizado com margem superior negativa (`-0.85rem`), restaurando a renderização correta de citações, falas de usuários em entrevistas qualitativas (`requisitos/elicitacao.md`) e trechos em ênfase no fluxo textual.
  - `docs/stylesheets/extra.css`: correção do containing block de ancestral que aprisionava o botão flutuante de voltar ao topo (`.md-top`) no meio da coluna de texto durante a rolagem; botão agora posicionado de forma fixa e não obstrutiva (`bottom: 2rem; right: 2rem`).
  - `docs/stylesheets/extra.css`: estilização limpa para blocos de citação (`blockquote`) e conteinerização responsiva com barra de rolagem horizontal sutil para diagramas Mermaid (`.mermaid`).
  - `docs/design/personas-e-jornadas.md`: otimização dos rótulos dos diagramas Mermaid Journey (AS-IS e TO-BE) para evitar truncamento e sobreposição de texto em resoluções padrão, complementados por tabelas estruturadas de Mapeamento Detalhado da Experiência.

### Changed

- `docs/tecnico/arquitetura.md`: consolidação dos componentes do Modelo C4 e tabela de responsabilidades técnicas com a stack definitiva (Preact/Vite e FastAPI + Pydantic v2), inserção da topologia estrutural de Monorepo (`extension/`, `backend/`, `shared/`) e alinhamento do comentário da esteira `ci.yml`.
- `docs/tecnico/guia-contribuicao.md`: atualização dos pré-requisitos, instruções operacionais e comandos de build/execução para os subsistemas da extensão (`npm run build`/`dev`) e backend proxy (`uvicorn app.main:app`), além da especificação da pipeline unificada de 4 estágios.
- `docs/referencia/glossario.md` e `docs/requisitos/matriz-rastreabilidade.md`: harmonização das definições do Backend Proxy com referência direta ao FastAPI e ADR-004.
- Removidos integralmente todos os emojis da documentação para adotar um tom estritamente profissional e corporativo.
- Reformulação da landing page `docs/index.md` e do `README.md` com matriz interativa de módulos e parâmetros técnicos consolidados.
- Atualização do menu de navegação do `mkdocs.yml` para comportar a hierarquia completa de engenharia com abas dedicadas, sumário direito e registro do ADR-004.
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
