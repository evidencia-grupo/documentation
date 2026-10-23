# Painel de Status Consolidado do Produto EvidencIA

> **Monitoramento de Entregas Técnicas e Prontidão do Produto (Release 1.0.0 — GO)**  
> Acompanhamento do ciclo de vida, maturidade dos módulos de software e validação experimental com usuários.

---

## 1. Classificação de Maturidade dos Componentes

O status atribuído a cada documento ou componente de software reflete o estado atual comprovado no repositório:

1. **`IMPLEMENTADO`**: Código-fonte funcional, testado localmente e integrado à esteira de CI/CD.
2. **`EVIDENCIADO`**: Documento ou métrica com validação técnica, testes ou simulações reproduzíveis.
3. **`HOMOLOGADO`**: Decisão humana registrada. Aprovação autoriza o trabalho; não comprova execução.
4. **`ESPECIFICADO`**: Desenho documentado sem implementação correspondente no código verificado.
5. **`PENDENTE`**: Validação ainda não executada (por exemplo, estudo com usuários ou anotação humana).

!!! note "Fonte canônica das evidências"
    Este painel resume o estado por módulo. Contagens de testes, cobertura, verificações no ambiente publicado e limites vigentes ficam em [Prontidão atual](../governanca/prontidao.md), que prevalece em caso de divergência. Revisão de 23/10/2026 contra `EvidencIA@6ec6c70`.

---

## 2. Painel Consolidado de Entregas do Produto

| Módulo / Dimensão | Artefato de Referência | Status | Observações Técnicas |
|:---|:---|:---:|:---|
| **Alinhamento do Produto** | [`docs/validacao/questoes-norteadoras.md`](../validacao/questoes-norteadoras.md) | `EVIDENCIADO` | 12 Questões Norteadoras e delimitação do problema |
| **Decisão Evidence-First** | [`docs/requisitos/alinhamento-pergunta-fundamental.md`](../requisitos/alinhamento-pergunta-fundamental.md) | `EVIDENCIADO` | Eliminação do score algorítmico em prol de fontes auditáveis |
| **Arquitetura Manifest V3** | [`docs/arquitetura/decisoes/ADR-001-manifest-v3.md`](../arquitetura/decisoes/ADR-001-manifest-v3.md) | `IMPLEMENTADO` | Background Service Worker e painel lateral Chromium |
| **Arquitetura Evidence-First** | [`docs/arquitetura/decisoes/ADR-006-evidence-first-architecture.md`](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md) | `IMPLEMENTADO` | Decisão de cartões de evidência e estímulo reflexivo |
| **Catálogo de Requisitos** | [`docs/requisitos/catalogo-requisitos.md`](../requisitos/catalogo-requisitos.md) | `EVIDENCIADO` | 15 Requisitos Funcionais e 7 Não Funcionais |
| **Matriz de Rastreabilidade** | [`docs/requisitos/matriz-rastreabilidade.md`](../requisitos/matriz-rastreabilidade.md) | `EVIDENCIADO` | Rastreabilidade bidirecional de ponta a ponta (RF, UC, HU, Código) |
| **Plano Experimental** | [`docs/validacao/plano-experimento.md`](../validacao/plano-experimento.md) | `HOMOLOGADO` | Desenho between-subjects aprovado (H6); o estudo com participantes **não foi executado** (`PENDENTE`) |
| **Métricas de Validação** | [`docs/validacao/definicao-metricas.md`](../validacao/definicao-metricas.md) | `ESPECIFICADO` | Formalização de M1 a M9; não há dados coletados para calculá-las |
| **Telemetria do Cliente** | [`docs/validacao/especificacao-telemetria.md`](../validacao/especificacao-telemetria.md) | `ESPECIFICADO` | Contrato de telemetria da fase Act documentado; nenhum módulo de telemetria existe na extensão ou no backend verificados |
| **Qualidade e Entrega** | [`docs/validacao/criterios-de-pronto.md`](../validacao/criterios-de-pronto.md) | `IMPLEMENTADO` | Testes, cobertura, typecheck e auditoria `axe-core` automatizados; itens da DoD sem evidência estão marcados como pendentes na própria página |
| **Reflexão Crítica e Síntese** | [`docs/validacao/reflexao-critica.md`](../validacao/reflexao-critica.md) | `EVIDENCIADO` | Análise crítica sobre discernimento e impacto contra desinformação |

---

## 3. Painel dos Portões de Decisão e Prontidão (G1 a G8)

| Portão | Descrição do Portão | Critério de Avaliação | Status do Portão | Evidência Rastreável |
|:---:|:---|:---|:---:|:---|
| **G1** | Rastreabilidade Epistemológica | Big Idea -> EQ -> 12 GQs formalizadas | `EVIDENCIADO` | `docs/validacao/questoes-norteadoras.md` |
| **G2** | Investigação & Datasets | EDA documentada em datasets PT-BR | `EVIDENCIADO` | `docs/arquitetura/ia-e-datasets.md` |
| **G3** | Ruptura Arquitetural | Eliminação de scores e adoção Evidence-First | `EVIDENCIADO` | `docs/arquitetura/decisoes/ADR-006-evidence-first-architecture.md` |
| **G4** | Qualidade de Engenharia | Suítes de testes passando no backend e extensão | `IMPLEMENTADO` | Execução local registrada em [Prontidão atual](../governanca/prontidao.md#evidencias): 325 testes backend (cobertura 94,09%), 232 testes da extensão e 16 E2E aprovados em 14/10/2026; reexecução de 23/10/2026: 331 backend (91,90%), 235 extensão e 16 E2E |
| **G5** | Governança Scrum | DoD, Product Backlog e cerimônias documentadas | `EVIDENCIADO` | `docs/validacao/` (DoD e Product Backlog) |
| **G6** | Protocolo Experimental Act | Desenho between-subjects e métricas formalizadas | `HOMOLOGADO` | `docs/validacao/plano-experimento.md` (Aprovado H6) |
| **G7** | Privacidade & Segurança | Zero PII persistida, ausência de telemetria e threat model | `IMPLEMENTADO` | Testes de isolamento, [Threat Model](../arquitetura/modelagem-ameacas.md) e [Política de Privacidade](../legal/politica-de-privacidade.md); revisão jurídica formal `PENDENTE` |
| **G8** | Fechamento Reflexivo | Síntese, portfólio, showcase e relatório final | `EVIDENCIADO` | `docs/validacao/reflexao-critica.md` |

---

## 4. Síntese Executiva de Prontidão (Release 1.0.0)

As verificações automatizadas executadas localmente passaram, e os portões humanos foram aprovados como autorização. Isso não equivale a validação completa em produção:

- **Verificações de arquitetura e drift:** `check_drift.py` com 0 falhas CRITICAL e 0 HIGH (execução local).
- **Technical Gates (01 a 17):** aprovados na auditoria de 09/10/2026 ([Relatório Final](../auditoria/relatorio-final.md), registro datado).
- **Human Gates (H1 a H6):** aprovação do usuário registrada em [Decisões aprovadas](../governanca/decisoes-aprovadas.md), que separa aprovação de execução.
- **Ainda pendentes:** análise de ponta a ponta contra o backend publicado a partir da extensão, anotação humana do gold set de recuperação (sem Recall, MRR ou nDCG), estudo com usuários, Docker e Redis multi-instância ([Prontidão atual](../governanca/prontidao.md#limites)).
- **Veredito registrado:** **GO** com o escopo descrito em [Revisão do relatório de IA](../governanca/revisao-relatorio-ia.md) ("para desenvolvimento local") e as pendências acima; não é certificação de produção nem de eficácia junto a usuários.
