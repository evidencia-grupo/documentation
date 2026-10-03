# Portal de Documentação — EvidencIA

> **O que você vai encontrar aqui:** Ponto de entrada oficial da documentação do EvidencIA. Apresenta o escopo do produto, a interface conceitual, os pilares da documentação técnica e os parâmetros homologados de engenharia.

---

!!! tip "Novo no projeto? Comece por aqui em até 15 minutos"
    Consulte a [Visão Geral do Projeto (1 página)](visao-geral/visao-geral-do-projeto.md) para entender rapidamente o problema, a solução, a arquitetura e os próximos passos. Acompanhe a entrega dos marcos no [Painel de Status Consolidado](visao-geral/status.md).

---

## Visão do Produto

O **EvidencIA** é uma extensão de navegador de código aberto desenvolvida sob o padrão **Manifest V3** (Google Chrome, Microsoft Edge e Brave) projetada para apoiar o discernimento crítico de quem assiste a conteúdos no YouTube. A ferramenta analisa a transcrição do áudio do vídeo em tempo real, identifica alegações verificáveis e busca evidências factuais em agências de checagem jornalística brasileiras, organizando os resultados em um painel lateral acessível.

Ao contrário de abordagens baseadas em vereditos algorítmicos automatizados, o EvidencIA adota a arquitetura **Evidence-First** ([ADR-006](tecnico/decisoes/ADR-006-evidence-first-architecture.md)): o sistema não atribui uma nota ou score à verdade, mas fornece o contexto factual, as fontes auditáveis e perguntas de estímulo crítico para que o próprio usuário forme sua convicção.

![Interface do Painel Lateral da Extensão no YouTube](assets/mockup-painel-youtube.png)
*Figura: Conceito visual do painel lateral em tema escuro integrado ao player do YouTube. A interface evoluiu da versão inicial com medidor para o modelo Evidence-First com cartões de alegações, fontes com links auditáveis e perguntas reflexivas.*

---

## Pilares da Documentação

A documentação está estruturada em áreas integradas para orientar o desenvolvimento, a arquitetura, o design e a avaliação acadêmica:

| Pilar | Documentos Principais | Escopo e Entregáveis | Rastreabilidade |
|:---|:---|:---|:---|
| **Visão Geral** | [Visão em 1 Página](visao-geral/visao-geral-do-projeto.md)<br>[Mapa do Projeto](visao-geral/mapa-do-projeto.md)<br>[Painel de Status](visao-geral/status.md) | Síntese executiva do produto, topologia dos repositórios e monitoramento de entregas | [Visão Geral](visao-geral/visao-geral-do-projeto.md) |
| **Visão Estratégica (Engage)** | [Alinhamento Estratégico](visao/alinhamento-estrategico.md)<br>[Guiding Questions (CBL)](visao/guiding-questions.md)<br>[Log de Decisões](visao/decision-log.md) | Essential Question, 12 perguntas orientadoras do CBL e log de decisões de negócio | [Estratégia](visao/alinhamento-estrategico.md) |
| **Design e Experiência** | [Personas e Jornadas](design/personas-e-jornadas.md)<br>[Design System da Interface](design/design-system.md) | Personas primárias e secundárias, diretrizes de antipersonas, fluxos TO-BE e tokens visuais dark mode | [Design](design/design-system.md) |
| **Engenharia de Requisitos** | [Processo de Elicitação](requisitos/elicitacao.md)<br>[Catálogo de Requisitos](requisitos/catalogo-requisitos.md)<br>[Casos de Uso e Diagramas](requisitos/casos-de-uso.md)<br>[Cenários Operacionais](requisitos/cenarios.md)<br>[Backlog e Histórias Gherkin](requisitos/backlog-e-historias.md)<br>[Matriz de Rastreabilidade](requisitos/matriz-rastreabilidade.md) | Elicitação empírica em 5 etapas ($100 Test), RF-01 a RF-15, RNF-01 a RNF-07, Cenários 01 a 11, Histórias HU01 a HU16 com Gherkin e matriz integrada | [Requisitos](requisitos/catalogo-requisitos.md) |
| **Arquitetura e Engenharia** | [Arquitetura C4 e Sequência](tecnico/arquitetura.md)<br>[Pipeline de IA e Datasets](tecnico/ia-e-datasets.md)<br>[Contrato de Dados e API](tecnico/contrato-api.md)<br>[Threat Model (STRIDE)](tecnico/threat-model.md)<br>[Estratégia de Testes](tecnico/estrategia-testes.md)<br>[Guia de Contribuição](tecnico/guia-contribuicao.md) | Modelos C4 (Contexto e Contêineres), sequência com SLAs, schemas JSON, interfaces TypeScript, STRIDE, pirâmide de testes e execução local | [Técnico](tecnico/arquitetura.md) |
| **Decisões Arquiteturais** | [ADR-001 — Manifest V3](tecnico/decisoes/ADR-001-manifest-v3.md)<br>[ADR-002 — Backend Proxy](tecnico/decisoes/ADR-002-backend-proxy.md)<br>[ADR-003 — Cache Local](tecnico/decisoes/ADR-003-estrategia-cache-local.md)<br>[ADR-006 — Evidence-First](tecnico/decisoes/ADR-006-evidence-first-architecture.md) | Registros formais de decisões estruturais homologadas (ADRs) com justificativas, alternativas analisadas e impactos | [ADRs](tecnico/decisoes/README.md) |
| **Governança Ágil (Scrum)** | [Product Backlog](scrum/product-backlog.md)<br>[Definition of Done](scrum/definition-of-done.md)<br>[Cerimônias Scrum](scrum/ceremonies.md)<br>[Sprints 01 e 02](scrum/sprint-01/README.md) | Backlog priorizado por valor de negócio, critérios de aceitação para homologação, metas e cerimônias das iterações | [Scrum](scrum/product-backlog.md) |
| **Planejamento e Governança** | [Priorização e MVP](planejamento/priorizacao-e-mvp.md)<br>[Gestão de Riscos Técnicos](planejamento/gestao-riscos.md)<br>[Instrumentação e Telemetria](planejamento/metricas-telemetria.md) | Matriz MoSCoW, Sequenciador Lean Inception (Ondas 1 a 3), funil de backlog, critérios de exclusão e telemetria sem rede | [Planejamento](planejamento/priorizacao-e-mvp.md) |
| **Experimento e Fechamento CBL** | [Plano Experimental (Act)](cbl/act/experiment-plan.md)<br>[Métricas M1 a M9](cbl/act/metrics-definition.md)<br>[Síntese Acadêmica](cbl/reflect-share/reflection.md)<br>[Portfólio de Pesquisa](cbl/reflect-share/research-portfolio.md)<br>[Roteiro de Showcase](cbl/reflect-share/showcase-script.md) | Desenho do estudo científico comparativo (*between-subjects*), métricas de discernimento crítico, síntese acadêmica e roteiro para banca | [Reflect & Share](cbl/reflect-share/README.md) |
| **Referência e Ontologia** | [Glossário Unificado](glossario.md)<br>[Arquivo Histórico](arquivo/README.md) | Vocabulário técnico e conceitual padronizado com definições formais e acervo de documentos legados | [Glossário](glossario.md) |

---

## Parâmetros Técnicos do Produto

| Dimensão | Especificação Homologada | Rastreabilidade |
|:---|:---|:---:|
| **Padrão de Extensão** | Manifest V3 (Google Chrome Extensions API) | [ADR-001](tecnico/decisoes/ADR-001-manifest-v3.md) |
| **Navegadores Homologados** | Google Chrome, Microsoft Edge, Brave (Chromium ≥ 110) | [RNF-03](requisitos/catalogo-requisitos.md#rnf-03) |
| **Escopo de Operação** | Exclusivo em páginas de reprodução ativa: `https://www.youtube.com/watch*` | [RF-01](requisitos/catalogo-requisitos.md#rf-01) |
| **SLA de Latência** | Primeira evidência em ≤ 5s (P90); resposta completa em ≤ 10s (P90) | [RNF-01](requisitos/catalogo-requisitos.md#rnf-01) |
| **Sobrecarga de Renderização** | Impacto máximo de **+50 ms** em Total Blocking Time (TBT) | [RNF-02](requisitos/catalogo-requisitos.md#rnf-02) |
| **Segurança e Credenciais** | Zero chaves no cliente; intermediação estrita via Backend Proxy | [ADR-002](tecnico/decisoes/ADR-002-backend-proxy.md) |
| **Privacidade de Dados** | Permissão restrita a `activeTab`; sem coleta de histórico geral de navegação | [RNF-05](requisitos/catalogo-requisitos.md#rnf-05) |
| **Acessibilidade Digital** | Conformidade com as diretrizes internacionais WCAG 2.1 nível AA | [RNF-07](requisitos/catalogo-requisitos.md#rnf-07) |

---

## Execução Rápida do Ambiente Local

Para iniciar o portal de documentação localmente com recarregamento em tempo real:

```bash
# 1. Instalar as dependências sincronizadas
uv sync --frozen

# 2. Executar o servidor de documentação
uv run mkdocs serve

# O portal estará acessível em: http://127.0.0.1:8000
```

Para validar a integridade estrita de links e páginas (modo de teste do CI):

```bash
uv run mkdocs build --strict
```

---

## Documentos Relacionados
- [Visão Geral do Projeto (1 página)](visao-geral/visao-geral-do-projeto.md) — Resumo de alto nível para leitura rápida.
- [Painel Consolidado de Status](visao-geral/status.md) — Monitoramento de entregas e portões de decisão.
- [Catálogo de Requisitos](requisitos/catalogo-requisitos.md) — Especificação detalhada de requisitos funcionais e não funcionais.
- [Glossário Oficial](glossario.md) — Vocabulário padronizado do projeto.
