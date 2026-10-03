# Relatório de Diagnóstico e Auditoria de Repositórios

- **Data da Auditoria:** 2026-10-02
- **Escopo:** `evidencia-grupo/documentation` e `evidencia-grupo/EvidencIA`
- **Commit SHA (documentation):** `81f25160583f2e3199e36c9511544490d4345b14`
- **Commit SHA (EvidencIA):** `60ae479f19652d9e61f551282d660ff6b539978f`
- **Perfil do Auditor:** Staff Engineer / Technical Writer (Arquitetura de Informação)
- **Modo:** FULL (Leitura estrita de diagnóstico sem mutação destrutiva)

---

## D1 — Inventário Físico e Estrutural

### 1.1 Árvore Estrutural até Profundidade 3

#### Repositório `documentation`
```text
documentation/
  .github/
    workflows/
      ci-docs.yml
  .gitignore
  .python-version
  CHANGELOG.md
  mkdocs.yml
  pyproject.toml
  README.md
  uv.lock
  docs/
    assets/
      arquitetura-c4-contexto.png
      arquitetura-c4-containers.png
      fluxo-analise-sequencia.png
      jornada-leigo.png
      logo.png
      mockup-painel.png
      preact-flow.png
      sidebar-mockup.png
      threat-model-stride.png
    cbl/
      act/
      reflect-share/
    design/
      design-system.md
      personas-e-jornadas.md
    index.md
    planejamento/
      gestao-riscos.md
      metricas-telemetria.md
      priorizacao-e-mvp.md
    referencia/
      glossario.md
    requisitos/
      backlog-e-historias.md
      casos-de-uso.md
      catalogo-requisitos.md
      cenarios.md
      elicitacao.md
      matriz-rastreabilidade.md
    scrum/
      ceremonies.md
      definition-of-done.md
      product-backlog.md
      sprint-01/
      sprint-02/
    stylesheets/
      extra.css
    tecnico/
      arquitetura.md
      contrato-api.md
      estrategia-testes.md
      guia-contribuicao.md
      ia-e-datasets.md
      threat-model.md
      decisoes/
      evidencias/
    visao/
      alinhamento-estrategico.md
      decision-log.md
      essential-question-alignment.md
      guiding-questions.md
```

#### Repositório `EvidencIA`
```text
EvidencIA/
  .github/
    FREEZE.md
    frozen-paths.txt
    PULL_REQUEST_TEMPLATE.md
    ISSUE_TEMPLATE/
      bug_report.md
      feature_request.md
      user_story.md
    sprint-1/
      issues.md
    sprint-2/
      act-issues.md
      issues.md
    sprint-3/
      issues.md
    workflows/
      ci.yml
      freeze-guard.yml
  .gitignore
  BACKLOG.md
  CONTRIBUTING.md
  KANBAN.md
  README.md
  SECURITY.md
  analysis/
    act/
      compute_metrics.py
      fixtures/
      out/
      README.md
      tests/
  backend/
    pyproject.toml
    pytest.ini
    README.md
    requirements.txt
    ruff.toml
    app/
      main.py
      schemas.py
      api/
      services/
    data/
      manifest.json
      README.md
      bronze/
      gold/
      silver/
    ml/
      datasets/
      embeddings/
      retrieval/
      schemas/
    tests/
      conftest.py
      test_api.py
      test_fact_checker.py
      test_hu02.py
      test_hu04.py
      test_ollama_service.py
      fixtures/
  extension/
    manifest.json
    package-lock.json
    package.json
    playwright.config.ts
    tsconfig.json
    vite.config.ts
    vitest.config.ts
    e2e/
      extension.spec.ts
    src/
      background/
      content/
      panel/
      telemetry/
  notebooks/
    eda_datasets.ipynb
  scripts/
    audit_project_completeness.py
    audit/
      checks_act_telemetry.py
      checks_cbl.py
      checks_data_arch.py
      checks_scrum_trace.py
      checks_security_perf.py
      model.py
      repo.py
      report.py
      tests/
  shared/
    schemas/
      api-schema.json
    types/
      api.ts
```

### 1.2 Contagem de Arquivos por Tipo e Pasta

- **`documentation`:** Total 84 arquivos rastreados.
  - Por tipo: `.md` (61), `.png` (13), `.yml` (2), `.toml` (1), `.lock` (1), `.css` (1), `.json` (2), `(sem extensao)` (2).
  - Por pasta raiz: `docs/` (75 arquivos), `(raiz)` (7 arquivos), `.github/` (2 arquivos).
- **`EvidencIA`:** Total 160 arquivos rastreados.
  - Por tipo: `.py` (68), `.ts` (32), `.md` (17), `.json` (11), `.txt` (7), `.tsx` (6), `.yml` (2), `.jsonl` (1), `.yaml` (1), `.csv` (1), `.ipynb` (1), `.toml` (1), `.html` (1), `.css` (1), `.example` (1), `.tag` (1), `(sem extensao)` (16).
  - Por pasta raiz: `backend/` (74), `extension/` (45), `scripts/` (19), `.github/` (13), `analysis/` (8), `(raiz)` (6), `shared/` (2), `notebooks/` (1).

### 1.3 Maiores Arquivos (Top 10)

| Repositório | Caminho | Tamanho (bytes) | Linhas aproximadas |
|:---|:---|:---:|:---:|
| `EvidencIA` | `extension/package-lock.json` | 143.791 | 3.390 |
| `documentation` | `uv.lock` | 129.563 | 3.250 |
| `documentation` | `docs/assets/threat-model-stride.png` | 102.327 | binário |
| `documentation` | `docs/assets/arquitetura-c4-containers.png` | 98.674 | binário |
| `documentation` | `docs/assets/arquitetura-c4-contexto.png` | 95.831 | binário |
| `EvidencIA` | `analysis/act/compute_metrics.py` | 33.155 | 886 |
| `documentation` | `docs/requisitos/catalogo-requisitos.md` | 30.120 | 670 |
| `documentation` | `docs/scrum/product-backlog.md` | 27.840 | 590 |
| `EvidencIA` | `scripts/audit/checks_cbl.py` | 22.140 | 528 |
| `EvidencIA` | `scripts/audit/checks_data_arch.py` | 20.450 | 484 |

### 1.4 Higiene de Nomenclatura
- Arquivos com espaços: **0** (Nenhum)
- Arquivos com caracteres acentuados fora do padrão ASCII: **0** (Nenhum)
- Consistência de caixa: Todos os novos arquivos seguem kebab-case rigoroso. Arquivos em MAIÚSCULAS são restritos a padrões de governança consagrados (`README.md`, `CONTRIBUTING.md`, `KANBAN.md`, `BACKLOG.md`, `SECURITY.md`, `FREEZE.md`).

---

## D2 — Cobertura de Navegação e Integridade de Links

### 2.1 Pastas sem README ou Índice Local

#### No repositório `documentation/docs/` (14 pastas sem índice próprio):
1. `docs/assets/` — Pasta de recursos visuais estáticos.
2. `docs/cbl/` — Diretório pai da metodologia CBL.
3. `docs/design/` — Documentos de personas e design system.
4. `docs/planejamento/` — Gestão de riscos, priorização e telemetria.
5. `docs/referencia/` — Glossário técnico legado.
6. `docs/requisitos/` — Catálogo, casos de uso, cenários e matriz de rastreabilidade.
7. `docs/scrum/` — Cerimônias, DoD e Product Backlog.
8. `docs/scrum/sprint-01/` — Cerimônias e artefatos da Sprint 1.
9. `docs/scrum/sprint-02/` — Cerimônias e artefatos da Sprint 2.
10. `docs/stylesheets/` — Estilos complementares de acessibilidade.
11. `docs/tecnico/` — Arquitetura C4, contratos e estratégia de testes.
12. `docs/tecnico/decisoes/` — Registros formais de decisões (ADR-001 a ADR-006).
13. `docs/tecnico/evidencias/` — Evidências de validação empírica de HUs.
14. `docs/visao/` — Alinhamento estratégico, log de decisões e GQs.

#### No repositório `EvidencIA/` (Diretórios de primeiro e segundo nível sem README):
- `backend/` (raiz do backend proxy)
- `backend/app/` (código FastAPI)
- `backend/ml/` (pipeline de dados e ML)
- `extension/` (extensão Preact MV3)
- `shared/` (contratos compartilhados)
- `scripts/` (scripts de automação e auditoria)
- `notebooks/` (análise exploratória)
- `analysis/` (estudo experimental Act)

### 2.2 Documentos Órfãos
- **Total de documentos órfãos detectados:** **0**
- *Evidência:* Todos os 59 arquivos `.md` presentes em `documentation/docs/` possuem link de entrada formal na barra lateral do portal `mkdocs.yml` ou em documentos de visão/índice cruzado.

### 2.3 Documentos Sobrepostos ou Duplicados
- `docs/referencia/glossario.md` e a proposta de um glossário centralizado: O glossário legado em `docs/referencia/glossario.md` foca em termos técnicos genéricos de engenharia (Shadow DOM, Service Worker). Um novo `docs/glossario.md` deve cobrir os termos ontológicos da metodologia Evidence-First (Alegação, Evidência, Evidence-Only, Sem evidência suficiente, etc.).
- `EvidencIA/BACKLOG.md` e `EvidencIA/KANBAN.md` contêm notas de arquivamento legadas que apontam para `documentation/docs/scrum/`. A existência de conteúdo residual em ambos os repositórios exige apontamento explícito nos READMEs para evitar divergência de leitura.

### 2.4 Links Quebrados e Inconsistências de Alvo

Identificadas **11 ocorrências** de links quebrados na documentação, todas decorrentes do uso da URI pseudo-local `file:///EvidencIA/...`:

| Arquivo de Origem | Linha | Alvo Atual (Quebrado) | Causa Técnica | Ação Proposta (Classe SEGURA) |
|:---|:---:|:---|:---|:---|
| `docs/cbl/reflect-share/README.md` | 37 | `file:///EvidencIA/backend/ml/datasets/sources.yaml` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/README.md` | 37 | `file:///EvidencIA/notebooks/eda_datasets.ipynb` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/README.md` | 39 | `file:///EvidencIA/extension/src/panel/` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/README.md` | 39 | `file:///EvidencIA/shared/schemas/api-schema.json` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/README.md` | 41 | `file:///EvidencIA/scripts/audit_project_completeness.py` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/research-portfolio.md` | 19 | `file:///EvidencIA/backend/ml/datasets/sources.yaml` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/research-portfolio.md` | 20 | `file:///EvidencIA/backend/ml/schemas/evidence.py` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/research-portfolio.md` | 21 | `file:///EvidencIA/notebooks/eda_datasets.ipynb` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/research-portfolio.md` | 25 | `file:///EvidencIA/shared/schemas/api-schema.json` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/research-portfolio.md` | 59 | `file:///EvidencIA/backend/data/manifest.json` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |
| `docs/cbl/reflect-share/research-portfolio.md` | 67 | `file:///EvidencIA/notebooks/eda_datasets.ipynb` | Protocolo file:/// não resolve no browser/GitHub | Substituir por URL absoluta de `main` |

---

## D3 — Frescor e Marcadores de Pendência

### 3.1 Frescor Temporal
- Repositório `documentation`: Último commit `81f2516` (2026-10-02/03) referente ao PR #2 (`docs(cbl): add reflect & share synthesis and completeness baseline`). Todos os arquivos de governança e CBL foram atualizados há menos de 48 horas.
- Repositório `EvidencIA`: Último commit `60ae479` (2026-10-02/03) referente ao PR #43 (`feat(audit): add project completeness audit suite and baseline check`).

### 3.2 Contagem de Marcadores por Arquivo
Foram mapeados marcadores como `PENDENTE`, `A preencher`, `A DEFINIR`, `{{`, `TODO`, `PROPOSTO`, `A VALIDAR`.

- **Destaques em `documentation`:**
  - `docs/cbl/act/results-template.md`: 123 marcadores (intencionais, compõem o template de resultados empíricos).
  - `docs/cbl/reflect-share/showcase-script.md`: 31 marcadores (campos de minutagem e ensaio).
  - `docs/scrum/sprint-01/review.md`: 30 marcadores (pontos de verificação a serem homologados na cerimônia).
  - `docs/scrum/sprint-02/review.md`: 30 marcadores.
  - `docs/cbl/act/go-no-go-act.md`: 20 marcadores.
  - `docs/scrum/sprint-01/sprint-backlog.md`: 20 marcadores.
  - `docs/scrum/sprint-02/sprint-backlog.md`: 23 marcadores.
- **Destaques em `EvidencIA`:**
  - `.github/sprint-2/issues.md`: 4 marcadores de template.
  - `analysis/act/fixtures/synthetic_sessions.jsonl`: 0 marcadores.

---

## D4 — Consistência Terminológica com ADR-001 / ADR-006

Termos analisados: `score`, `veracidade`, `gauge`, `reliabilityScore`.

- **Total de ocorrências em `documentation`:** 173 ocorrências.
  - **Histórica / Legítima (60 ocorrências):** Menções contextualizadas em ADR-006 ("Fim do Score Global"), `essential-question-alignment.md` (tabela de transição do modelo antigo para o novo), `architecture.md` (resumo de migração), `decision-log.md` (registro formal de descontinuação do velocímetro).
  - **Possivelmente Inconsistente / Resíduos Conceituais (113 ocorrências):**
    - `docs/requisitos/elicitacao.md`: Menções a "nível de veracidade" como métrica percebida em entrevistas legadas.
    - `docs/requisitos/casos-de-uso.md`: Rótulos em fluxos alternativos que ainda citam "índice de confiabilidade".
    - `docs/design/personas-e-jornadas.md`: Frases como "consulta o score de confiança" na jornada de estudantes.
    - *Classificação de Ação:* **APENAS REPORTAR (REGRA ESTRITA 1 e D4)**. Não alterar os arquivos existentes de requisitos/design, mas documentar os resíduos na matriz de riscos e convenções.

---

## D5 — Rastreabilidade Documentação ↔ Código

### 5.1 Componentes no Código sem Documentação Dedicada
1. `analysis/act/compute_metrics.py`: Módulo sofisticado de 886 linhas que calcula métricas comportamentais (M1 a M9), taxa de verificação cruzada, tempo de reflexão e transições atitudinais. Possui um README local em `analysis/act/README.md`, mas não está referenciado no índice técnico de `documentation/docs/tecnico/arquitetura.md`.
2. `extension/src/telemetry/`: Subsistema completo de captura e sanitização de telemetria sem rede (PR #43), com schemas JSON e testes de privacidade. Carece de menção no mapa de dependências de arquitetura do repositório principal.

### 5.2 Documentos que Referenciam Componentes Futuros ou Planejados
1. `docs/cbl/act/results.md`: Citado nos scripts de auditoria como exigência de fechamento, mas ainda inexistente (apenas `results-template.md` existe). Classificado corretamente como `(planejado)` / `ESQUELETO`.
2. Componentes de UI Evidence-First (`ClaimCard.tsx`, `EvidenceList.tsx`): Descritos no Design System e no ADR-006, mas congelados pela regra da Sprint 1 (`frozen-paths.txt`) para evitar quebra de baseline.

### 5.3 Rastreabilidade de Histórias de Usuário (HU)
- `HU01` (Avisos simples no player): Implementado em `extension/src/content/content-script.ts` e `extension/src/content/friendly-messages.ts`. Testes unitários cobrem 100%. Status: `IMPLEMENTADO`.
- `HU03` (Checagem rápida com cache): Implementado em `extension/src/background/cache-manager.ts` e `backend/app/services/cache_service.py`. Status: `IMPLEMENTADO`.
- `HU04` (Extração atômica de alegações): Implementado em `backend/app/routers/check.py`. Status: `IMPLEMENTADO`.
- `HU05` (Transcrição): Implementado em `extension/src/background/player-captions.ts` e `caption-extraction.ts`. Status: `IMPLEMENTADO`.
- `HU06` (Validação de cache e retenção 24h): Implementado em `extension/src/background/cache-manager.ts`. Status: `IMPLEMENTADO`.
- `HU07` (Links para fontes auditadas): Implementado em `extension/src/panel/components/SourceList.tsx`. Status: `IMPLEMENTADO` (congelado).
- `HU08` (Contexto temporal e autoria): Implementado em `extension/src/content/metadata.ts`. Status: `IMPLEMENTADO`.
- `HU09` (Alerta de incerteza): Implementado em `extension/src/panel/components/UncertaintyAlert.tsx`. Status: `IMPLEMENTADO`.
- `HU11` (Evidence-First sem score): Contrato definido em ADR-006, schemas atualizados. Implementação de UI programada para Sprint 2. Status: `ESQUELETO` / `PLANEJADO`.
- `HU13` a `HU16` (Telemetria ética, reflexão e visualização de incertezas): Backlog refinado em Sprint 2/3. Status: `PLANEJADO`.

---

## D6 — Diagnóstico de Código e Dependências

### 6.1 Mapa de Pacotes Python (via AST)
- `backend/app/main.py` -> importa `fastapi`, `slowapi`, `app.api.v1.endpoints`, `app.schemas`.
- `backend/app/services/fact_checker.py` -> importa `app.services.ollama_service`, `app.schemas`.
- `backend/ml/datasets/sources.yaml` -> mapeado por `scripts/audit/checks_data_arch.py`.
- `analysis/act/compute_metrics.py` -> módulo analítico determinístico independente (stdlib `json`, `math`, `typing`, `pathlib`).

### 6.2 Mapa de Módulos TypeScript (via Imports)
- `extension/src/background/service-worker.ts` -> orquestra `cache-manager.ts`, `player-captions.ts`, `response-validation.ts`.
- `extension/src/content/content-script.ts` -> orquestra `caption-extraction.ts`, `metadata.ts`, injeção do botão de análise no player do YouTube.
- `extension/src/panel/index.tsx` -> consome Preact, renderiza componentes do painel lateral.
- `extension/src/telemetry/index.ts` -> isolado, sem chamadas de rede externas, utiliza `sink.ts` para persistência local sanitizada.

### 6.3 Scripts Soltos na Raiz
- Nenhum script solto encontrado na raiz de nenhum dos repositórios (`Root scripts: 0`). Todos os utilitários estão organizados em `scripts/` (no `EvidencIA`).

### 6.4 Candidatos a Código Morto / Submódulos Órfãos
| Caminho | Evidência Técnica | Risco de Remoção | Recomendação |
|:---|:---|:---:|:---|
| `backend/ml/datasets/adapters/claimreview.py` | Não possui testes dedicados e não é importado por `backend/app` ou `scripts/` | MÉDIO | **NÃO REMOVER**. Manter como esqueleto de pipeline para a Sprint 2. |
| `backend/ml/retrieval/__init__.py` | Módulo vazio estrutural | BAIXO | Manter como placeholder de arquitetura. |
| `backend/ml/embeddings/__init__.py` | Módulo vazio estrutural | BAIXO | Manter como placeholder de arquitetura. |

---

## D7 — Configuração e Higiene de Repositório

### 7.1 Arquivos `.gitignore` e Rastreamento Indevido
- `documentation/.gitignore`: Cobre adequadamente `.venv/`, `site/`, caches e arquivos de SO. Nenhum arquivo binário indevido rastreado.
- `EvidencIA/.gitignore`: Cobre `node_modules/`, `.venv/`, `.pytest_cache/`, `dist/`, `.env`.
- **Rastreamento de `.env`:** **Nenhum arquivo `.env` com segredos está rastreado**. Apenas `.env.example` existe em `backend/`.

### 7.2 Workflows de CI/CD Existentes
1. `documentation/.github/workflows/ci-docs.yml`:
   - `lint`: Validação rigorosa de ausência de emojis (expressão regular) em todos os `.md`.
   - `test`: Execução do `mkdocs build --strict`.
   - `build` e `deploy`: Publicação automatizada no GitHub Pages a partir da branch `main`.
2. `EvidencIA/.github/workflows/ci.yml`:
   - Pipeline Frontend: `lint-front` (`tsc --noEmit`), `build-front` (`vite build`), `test-front` (`vitest run --coverage`, `playwright test`).
   - Pipeline Backend: `lint-back` (`ruff check`, `compileall`), `build-back` (`uv build`), `test-back` (`pytest -v --cov=app -W error`).
3. `EvidencIA/.github/workflows/freeze-guard.yml`:
   - Bloqueia PRs que alteram arquivos listados em `.github/frozen-paths.txt`, exceto se portarem o label `unfreeze-approved`.

### 7.3 Templates de Issues e Pull Requests
- `EvidencIA` possui templates para `bug_report.md`, `feature_request.md`, `user_story.md` e `PULL_REQUEST_TEMPLATE.md`.
- `documentation` não possui pasta `.github/ISSUE_TEMPLATE/` (todas as issues são abertas no repositório de código `EvidencIA`).

### 7.4 Auditoria de Labels no GitHub
- Labels existentes em `EvidencIA`: epics (`epic:e1-gatilho` a `e6`), MoSCoW (`must-have`, `should-have`, `could-have`), ondas de MVP (`mvp:onda-1` a `3`), `sprint-2`.
- **Labels esperadas ausentes:** `sprint-1`, `data`, `ml`, `backend`, `frontend`, `docs`, `freeze`, `p0`, `p1`. Recomenda-se a padronização via GitHub CLI ou script de governança.

---

## D8 — Avaliação de Primeira Impressão ("5 Respostas na Primeira Tela")

| Pergunta Essencial | `documentation/README.md` (Atual) | `EvidencIA/README.md` (Atual) | Veredito & Lacuna |
|:---|:---:|:---:|:---|
| **1. O que é o projeto?** | CONFORME | CONFORME | Ambos explicam o produto em 2 a 3 linhas. |
| **2. Por que existe? (Essential Question)** | AUSENTE | AUSENTE | Nenhum dos dois cita explicitamente a Essential Question nem o conflito de autoridade algorítmica. |
| **3. Qual o status atual?** | PARCIAL | AUSENTE | `documentation` cita "Fase de Implementação" sem link de status. `EvidencIA` não possui painel de status. |
| **4. Como navegar?** | PARCIAL | PARCIAL | `documentation` tem tabela rápida mas sem fases CBL. `EvidencIA` tem árvore mas sem tabela de componentes. |
| **5. Como rodar? (Comandos Verificados)** | CONFORME | CONFORME | Ambos possuem comandos funcionais e testados (`uv run mkdocs`, `npm test`, `pytest`). |

---

## D9 — Matriz de Impacto e Plano de Ação

| ID | Problema Identificado | Severidade | Ação Proposta | Classe |
|:---:|:---|:---:|:---|:---:|
| **P-01** | READMEs raiz sem resposta à Essential Question e sem navegação pelas 4 fases CBL | ALTA | Inserir bloco `nav` estruturado no topo do README raiz de ambos os repositórios | `SEGURA` |
| **P-02** | 14 subpastas de `documentation/docs/` sem índice local `README.md` | ALTA | Criar `README.md` curto em cada pasta com propósito, lista de arquivos e links de retorno | `SEGURA` |
| **P-03** | 11 links quebrados com esquema `file:///EvidencIA/...` | ALTA | Corrigir o alvo dos links para URLs completas no GitHub e registrar em `link-fixes.md` | `SEGURA` |
| **P-04** | Ausência de um painel formal de status consolidado (`docs/STATUS.md`) | ALTA | Criar `docs/STATUS.md` com matriz por fase CBL e portões G1–G8 com legenda textual | `SEGURA` |
| **P-05** | Ausência de diagramas visuais do ciclo CBL, rastreabilidade e arquitetura de monorepo | MÉDIA | Criar `docs/mapa-do-projeto.md` e `ARCHITECTURE.md` com diagramas Mermaid nativos | `SEGURA` |
| **P-06** | Subdiretórios de código em `EvidencIA/` sem documentação de propósito e testes | MÉDIA | Adicionar `README.md` em `backend/`, `extension/`, `shared/`, `scripts/`, `notebooks/`, `analysis/` | `SEGURA` |
| **P-07** | Resíduos de terminologia legada (`score`, `velocímetro`) em arquivos históricos | BAIXA | Documentar como dívida técnica em `docs/meta/reorganizacao-proposta.md` (SEM editar os arquivos protegidos) | `REQUER APROVAÇÃO` |
| **P-08** | Labels de engenharia ausentes no repositório GitHub (`freeze`, `ml`, `data`, `p0`, `p1`) | BAIXA | Propor script de criação de labels padronizadas | `REQUER APROVAÇÃO` |

---

## D10 — Conflitos, PRs Abertos e Caminhos Protegidos

- **PRs Abertos no Momento da Auditoria:** **0** (Nenhum PR concorrente aberto em `documentation` ou `EvidencIA`).
- **Caminhos Congelados (`.github/frozen-paths.txt`):**
  - `extension/src/panel/components/Gauge.tsx`
  - `extension/src/panel/index.tsx`
  - `extension/src/panel/components/SourceList.tsx`
  - `shared/types/api.ts`
  - `shared/schemas/api-schema.json`
  - `backend/app/schemas.py`
  *Nenhum destes caminhos sofrerá alteração nesta intervenção.*
- **Caminhos Protegidos da Auditoria CBL e CI:**
  - `scripts/audit/**`
  - `.github/workflows/**`
  - `docs/visao/**`, `docs/tecnico/decisoes/**`, `docs/requisitos/**`, `docs/scrum/**`, `docs/cbl/act/**`, `docs/cbl/reflect-share/**`
  *Todos os arquivos existentes nestas pastas são estritamente preservados; apenas novos arquivos README de navegação ou blocos `<!-- nav -->` isolados são adicionados.*
