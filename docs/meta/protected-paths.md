# Catálogo de Caminhos Protegidos do Projeto EvidencIA

- **Data de Registro:** 2026-10-02
- **Escopo:** `evidencia-grupo/documentation` e `evidencia-grupo/EvidencIA`
- **Regra de Ouro:** Nenhum caminho listado neste catálogo pode ser renomeado, movido, apagado ou sofrer mutação destrutiva. Modificações em arquivos existentes são restritas à adição de blocos de navegação ou correção inequívoca de alvos de links relativos.

---

## 1. Origens da Proteção Estrutural

A lista de caminhos protegidos consolida cinco fontes mandatórias de governança:
1. **Regra de Congelamento (`.github/frozen-paths.txt`):** Arquivos congelados para proteger a baseline da Sprint 1 e a estabilidade da UI legada enquanto a nova arquitetura Evidence-First é maturada.
2. **Pipelines de Integração Contínua (`.github/workflows/**`):** Arquivos de configuração de CI/CD que testam a documentação (`ci-docs.yml`), o código da extensão e do backend (`ci.yml`) e as regras de freeze (`freeze-guard.yml`).
3. **Scripts Automatizados de Auditoria (`scripts/audit/**`):** Caminhos literais consumidos pelas suítes de checagem fail-closed (`checks_cbl.py`, `checks_data_arch.py`, `checks_scrum_trace.py`, `checks_act_telemetry.py`, `checks_security_perf.py`).
4. **Convenções de Prompts Fundacionais (Prompts A a E):** Estruturas centrais do framework CBL e da governança ágil estabelecidas nas fases anteriores.
5. **Imports e Suítes de Testes:** Pastas de testes unitários, testes de integração, fixtures sintéticas e endpoints.

---

## 2. Tabela Mestra de Caminhos Protegidos

| Caminho Protegido | Repositório | Origem / Mecanismo de Proteção | Impacto se Alterado |
|:---|:---:|:---|:---|
| `extension/src/panel/components/Gauge.tsx` | EvidencIA | `.github/frozen-paths.txt` | Falha imediata no CI (`freeze-guard`) |
| `extension/src/panel/index.tsx` | EvidencIA | `.github/frozen-paths.txt` | Falha imediata no CI (`freeze-guard`) |
| `extension/src/panel/components/SourceList.tsx` | EvidencIA | `.github/frozen-paths.txt` | Falha imediata no CI (`freeze-guard`) |
| `shared/types/api.ts` | EvidencIA | `.github/frozen-paths.txt` | Falha imediata no CI (`freeze-guard`) |
| `shared/schemas/api-schema.json` | EvidencIA | `.github/frozen-paths.txt` | Falha imediata no CI (`freeze-guard`) |
| `backend/app/schemas.py` | EvidencIA | `.github/frozen-paths.txt` | Falha imediata no CI (`freeze-guard`) |
| `.github/workflows/ci-docs.yml` | documentation | CI/CD de documentação | Interrupção do deploy do GitHub Pages |
| `.github/workflows/ci.yml` | EvidencIA | CI/CD de engenharia | Interrupção dos testes e builds automatizados |
| `.github/workflows/freeze-guard.yml` | EvidencIA | Governança de PRs | Quebra do portão de proteção de código |
| `.github/frozen-paths.txt` | EvidencIA | Governança de PRs | Violação de integridade do freeze |
| `docs/visao/` | documentation | Prompts A-E / CBL Engage | Quebra de rastreabilidade da Essential Question |
| `docs/visao/guiding-questions.md` | documentation | `checks_cbl.py` (ENG-01) | Falha no check de 12 Guiding Questions |
| `docs/visao/essential-question-alignment.md` | documentation | `checks_cbl.py` (ENG-02) | Falha no check de alinhamento estratégico |
| `docs/visao/decision-log.md` | documentation | `checks_cbl.py` (ENG-03) | Falha no check de log de decisões D-001 a D-008 |
| `docs/tecnico/decisoes/` (e `docs/adr/`) | documentation | `checks_cbl.py` (ADR-01) | Falha no check de decisão de fim de score |
| `docs/tecnico/decisoes/ADR-006-evidence-first-architecture.md` | documentation | `checks_cbl.py` (ADR-01) | Falha crítica de conformidade arquitetural |
| `docs/requisitos/` | documentation | Prompts A-E / CBL Investigate | Quebra de catálogo de requisitos e HUs |
| `docs/requisitos/matriz-rastreabilidade.md` | documentation | `checks_scrum_trace.py` (TRC-01) | Falha na matriz GQ -> ADR -> HU |
| `docs/requisitos/backlog-e-historias.md` | documentation | `checks_scrum_trace.py` (TRC-01) | Falha na validação de HUs 01 a 16 |
| `docs/scrum/` | documentation | Prompts A-E / Governança Scrum | Quebra de rastreabilidade de cerimônias |
| `docs/scrum/definition-of-done.md` | documentation | `checks_scrum_trace.py` (SCRUM-02)| Falha nos critérios de homologação |
| `docs/scrum/sprint-01/` | documentation | `checks_scrum_trace.py` (SCRUM-03)| Falha de evidência da Sprint 1 |
| `docs/scrum/sprint-02/` | documentation | `checks_scrum_trace.py` (SCRUM-04)| Falha de evidência da Sprint 2 |
| `docs/investigate/` | documentation | Prompts A-E / Metodologia CBL | Diretório de referência conceitual |
| `docs/cbl/act/` | documentation | Prompts A-E / Metodologia CBL Act | Quebra de rastreabilidade experimental |
| `docs/cbl/act/experiment-plan.md` | documentation | `checks_act_telemetry.py` (ACT-01)| Falha no check de plano do experimento |
| `docs/cbl/act/participant-protocol.md` | documentation | `checks_act_telemetry.py` (ACT-02)| Falha no protocolo de participantes |
| `docs/cbl/act/metrics-definition.md` | documentation | `checks_act_telemetry.py` (ACT-04)| Falha na formalização das métricas M1 a M9 |
| `docs/cbl/act/telemetry-spec.md` | documentation | `checks_act_telemetry.py` (ACT-05)| Falha na especificação de eventos sem rede |
| `docs/cbl/act/go-no-go-act.md` | documentation | `checks_act_telemetry.py` (ACT-06)| Falha nos critérios de parada do Act |
| `docs/cbl/reflect-share/` | documentation | Prompts A-E / Metodologia CBL | Quebra do fechamento metodológico |
| `docs/cbl/reflect-share/reflection.md` | documentation | `checks_cbl.py` (REF-01) | Falha na síntese crítica reflexiva |
| `docs/cbl/reflect-share/showcase-script.md` | documentation | `checks_cbl.py` (REF-02) | Falha no roteiro da banca avaliadora |
| `docs/cbl/reflect-share/demo-script.md` | documentation | `checks_cbl.py` (REF-03) | Falha no roteiro de demonstração |
| `docs/cbl/reflect-share/go-no-go-final.md` | documentation | `checks_cbl.py` (REF-04) | Falha nos portões finais G1 a G8 |
| `docs/cbl/reflect-share/CBL_COMPLETENESS_REPORT.md` | documentation | `audit_project_completeness.py` | Arquivo gerado imutável (Regra 2) |
| `backend/ml/` | EvidencIA | Prompts A-E / Pipeline de Dados | Quebra de ingestão e schemas de evidência |
| `backend/ml/datasets/sources.yaml` | EvidencIA | `checks_data_arch.py` (DATA-01) | Falha na verificação de catálogo de datasets |
| `backend/ml/schemas/evidence.py` | EvidencIA | `checks_data_arch.py` (DATA-02) | Falha na validação do schema Evidence-First |
| `backend/app/services/providers/` | EvidencIA | `checks_security_perf.py` (SEC-01)| Falha no provider guard (proibição de mock) |
| `extension/src/telemetry/` | EvidencIA | `checks_act_telemetry.py` (ACT-05)| Falha no pipeline de telemetria ética |
| `analysis/act/` | EvidencIA | Prompts A-E / Scripts Analíticos | Quebra da reprodutibilidade de métricas |
| `analysis/act/compute_metrics.py` | EvidencIA | `test_compute_metrics.py` | Falha nos testes de cálculo determinístico |
| `scripts/audit/` | EvidencIA | Prompts A-E / Auditoria Completa | Quebra do motor de auditoria fail-closed |
| `notebooks/` | EvidencIA | Prompts A-E / EDA | Quebra da análise exploratória |
| `notebooks/eda_datasets.ipynb` | EvidencIA | `checks_cbl.py` (EDA-01) | Falha na evidência de EDA prévia |
