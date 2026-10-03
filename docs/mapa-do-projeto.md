# Mapa Visual e Topologia do Projeto EvidencIA

> **Proposito:** Visualizar graficamente o ciclo metodologico CBL, a cadeia de rastreabilidade de valor, a topologia de repositorios e a linha do tempo das iteracoes Scrum.  
> **Padrao Visual:** Mermaid nativo do GitHub · Conformidade estrita com a legenda de status textual.

---

<!-- gen:mapa-cbl:start -->
## 1. Ciclo Metodologico CBL (Challenge Based Learning)

> **Legenda de Status:** `EVIDENCIADO` · `IMPLEMENTADO` · `ESQUELETO` · `PLANEJADO` · `AUSENTE`  
> *Gerado em 2026-10-02 sobre 81f2516/60ae479*

```mermaid
flowchart TD
    subgraph FaseEngage["1. Fase Engage (EVIDENCIADO)"]
        BI["Big Idea: Desinformacao no YouTube"]
        EQ["Essential Question: Discernimento sem substituir julgamento"]
        GQ["12 Guiding Questions (GQ01-GQ12)"]
        DLog["Log de Decisoes D-001 a D-008"]
        BI --> EQ --> GQ --> DLog
    end

    subgraph FaseInvestigate["2. Fase Investigate (EVIDENCIADO)"]
        EDA["EDA Datasets Jornalisticos (17 secoes)"]
        ADR01["ADR-001: Manifest V3"]
        ADR06["ADR-006: Evidence-First Architecture"]
        ReqCat["Catalogo RF (01-15) e RNF (01-11)"]
        EDA --> ADR06
        ADR01 --> ReqCat
        ADR06 --> ReqCat
    end

    subgraph FaseAct["3. Fase Act (IMPLEMENTADO / ESQUELETO)"]
        ExpPlan["Plano Experimental Between-Subjects"]
        Telem["Telemetria Local Sem Rede (M1-M9)"]
        UIPlan["UI Evidence-First ClaimCards (planejado)"]
        ExpPlan --> Telem
        Telem -.-> UIPlan
    end

    subgraph FaseReflect["4. Fase Reflect & Share (EVIDENCIADO)"]
        Refl["Sintese Reflexiva & Licoes"]
        Showcase["Roteiro Showcase & Demo"]
        AuditSuite["Auditoria Fail-Closed (CBL Report)"]
        Refl --> Showcase --> AuditSuite
    end

    DLog --> EDA
    ReqCat --> ExpPlan
    Telem --> Refl

    style UIPlan stroke-dasharray: 5 5,stroke:#888
```

---

## 2. Cadeia de Rastreabilidade Estrategica (EQ -> Codigo -> Validacao)

> **Legenda de Status:** Linhas continuas = artefatos existentes; Linhas pontilhadas = componentes planejados.  
> *Gerado em 2026-10-02 sobre 81f2516/60ae479*

```mermaid
flowchart LR
    CH["Challenge: Fact-Checking"] --> EQ["Essential Question"]
    EQ --> GQs["Guiding Questions<br/>(docs/visao/guiding-questions.md)"]
    GQs --> EDA["EDA em Datasets PT-BR<br/>(notebooks/eda_datasets.ipynb)"]
    EDA --> ADR["ADR-006: Evidence-First<br/>(tecnico/decisoes/ADR-006)"]
    ADR --> HU["HU11: Interface sem Score<br/>(requisitos/backlog-e-historias.md)"]
    HU --> API["Contrato API v1<br/>(backend/app/routers/check.py)"]
    API --> UI["Painel Evidence-First<br/>(extension/src/panel/) (planejado)"]
    UI -.-> ACT["Validacao Empirica Act<br/>(analysis/act/compute_metrics.py)"]

    style UI stroke-dasharray: 5 5,stroke:#888
    style ACT stroke-dasharray: 5 5,stroke:#888
```

---

## 3. Mapa de Relacionamento entre os Dois Repositorios

> **Legenda de Status:** `documentation` (governanca e especificacao) <---> `EvidencIA` (codigo-fonte executavel).  
> *Gerado em 2026-10-02 sobre 81f2516/60ae479*

```mermaid
flowchart TD
    subgraph RepoDocs["Repositorio: evidencia-grupo/documentation"]
        D_Visao["docs/visao/<br/>Alinhamento & GQs"]
        D_Req["docs/requisitos/<br/>RF/RNF & Matriz"]
        D_Tec["docs/tecnico/<br/>C4 & Contrato API"]
        D_Scrum["docs/scrum/<br/>DoD & Cerimonias"]
        D_Act["docs/cbl/act/<br/>Protocolo Experimental"]
        D_Refl["docs/cbl/reflect-share/<br/>Portfolio & Auditoria"]
    end

    subgraph RepoCode["Repositorio: evidencia-grupo/EvidencIA"]
        C_Ext["extension/<br/>Preact MV3 & Content Script"]
        C_Back["backend/<br/>FastAPI & Providers"]
        C_Shared["shared/<br/>Schemas JSON & Tipos TS"]
        C_ML["backend/ml/<br/>Sources YAML & Adapters"]
        C_Act["analysis/act/<br/>compute_metrics.py"]
        C_Audit["scripts/audit/<br/>audit_project_completeness.py"]
    end

    D_Tec -->|especifica contrato| C_Shared
    D_Req -->|define backlog| C_Ext
    D_Req -->|define backlog| C_Back
    D_Tec -->|restringe mocks| C_Back
    D_Act -->|especifica telemetria| C_Ext
    D_Act -->|define metricas| C_Act
    C_Audit -->|audita conformidade| D_Refl
    C_ML -->|alimenta retrieval| C_Back
```

---

## 4. Linha do Tempo e Governanca das Sprints Scrum

> **Legenda de Status:** Sprint 1 = Concluida com Review/Retrospectiva; Sprint 2 = Em andamento / Planejamento.  
> *Gerado em 2026-10-02 sobre 81f2516/60ae479*

```mermaid
flowchart LR
    subgraph S1["Sprint 01 — Fundacao & EDA (EVIDENCIADO)"]
        S1_Goal["Sprint Goal: Fundacao Investigativa & Datasets PT-BR"]
        S1_Scope["Escopo: 36 SP (Backlog, EDA, ADR-001 a 006)"]
        S1_Review["Review: 6 Perguntas Respondidas"]
        S1_Retro["Retrospectiva: Acoes de Melhoria Registradas"]
        S1_Goal --> S1_Scope --> S1_Review --> S1_Retro
    end

    subgraph S2["Sprint 02 — Pipeline Evidence-First (ESQUELETO)"]
        S2_Goal["Sprint Goal: Integracao Evidence-First & Telemetria"]
        S2_Scope["Escopo: 38 SP (HU11, HU13-16, Telemetria Local)"]
        S2_Review["Review: Homologacao com Banca (planejado)"]
        S2_Retro["Retrospectiva: Balanco Final (planejado)"]
        S2_Goal --> S2_Scope -.-> S2_Review -.-> S2_Retro
    end

    S1_Retro --> S2_Goal

    style S2_Review stroke-dasharray: 5 5,stroke:#888
    style S2_Retro stroke-dasharray: 5 5,stroke:#888
```
<!-- gen:mapa-cbl:end -->
