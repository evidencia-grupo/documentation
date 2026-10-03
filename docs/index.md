# Portal de Documentação — Extensão de Fact-Checking para YouTube

> Documentação técnica e de produto para checagem de fatos em vídeos através de transcrição automatizada, inteligência artificial e painel lateral acessível.

---

## Visão do Produto

A **Extensão de Fact-Checking para YouTube** é uma solução de navegador (Google Chrome, Microsoft Edge, Brave — Manifest V3) projetada para capacitar usuários que consomem conteúdos informativos no YouTube a validar de forma autônoma a veracidade das afirmações apresentadas, diretamente no fluxo de consumo e sem necessidade de pesquisas manuais exaustivas.

![Interface do Painel Lateral da Extensão no YouTube](assets/mockup-painel-youtube.png)
*Figura: Interface do painel lateral em tema escuro integrado ao player do YouTube, exibindo o velocímetro de veracidade e a categorização analítica das alegações.*

---

## Módulos da Documentação

A documentação está estruturada em sete áreas fundamentais para orientar desenvolvedores, arquitetos, designers e gestores de produto:

| Pilar | Documentos Principais | Escopo e Entregáveis | Rastreabilidade |
|:---|:---|:---|:---|
| **Visão do Produto** | [Alinhamento Estratégico](visao/alinhamento-estrategico.md) | Visão, matriz É/Não É/Faz/Não Faz, objetivos estratégicos e KPIs de negócio | [Visão](visao/alinhamento-estrategico.md) |
| **Design e Experiência** | [Personas e Jornadas](design/personas-e-jornadas.md)<br>[Design System da Interface](design/design-system.md) | Personas primárias e secundárias, diretrizes de antipersonas, jornadas AS-IS/TO-BE e tokens dark mode | [Design](design/design-system.md) |
| **Engenharia de Requisitos** | [Processo de Elicitação](requisitos/elicitacao.md)<br>[Catálogo de Requisitos](requisitos/catalogo-requisitos.md)<br>[Casos de Uso e Diagramas](requisitos/casos-de-uso.md)<br>[Cenários Operacionais](requisitos/cenarios.md)<br>[Backlog e Histórias Gherkin](requisitos/backlog-e-historias.md)<br>[Matriz de Rastreabilidade](requisitos/matriz-rastreabilidade.md) | Elicitação empírica em 5 etapas ($100 Test), RF-01 a RF-11, RNF-01 a RNF-07, Cenários 01 a 11, Histórias HU01 a HU12 com Gherkin e matriz | [Requisitos](requisitos/catalogo-requisitos.md) |
| **Arquitetura e Engenharia** | [Arquitetura C4 e Sequência](tecnico/arquitetura.md)<br>[Contrato de API REST](tecnico/contrato-api.md)<br>[Threat Model (STRIDE & LGPD)](tecnico/threat-model.md)<br>[Estratégia de Testes e DoD](tecnico/estrategia-testes.md)<br>[Guia de Contribuição e Setup](tecnico/guia-contribuicao.md) | Modelo C4 (Contexto e Contêineres), sequência com SLAs, schemas JSON, interfaces TypeScript, STRIDE e pirâmide de testes | [Técnico](tecnico/arquitetura.md) |
| **Decisões Arquiteturais** | [ADR-001 — Padrão Manifest V3](tecnico/decisoes/ADR-001-manifest-v3.md)<br>[ADR-002 — Backend Proxy Dedicado](tecnico/decisoes/ADR-002-backend-proxy.md)<br>[ADR-003 — Estratégia de Cache Local com TTL](tecnico/decisoes/ADR-003-estrategia-cache-local.md) | Registros de decisões estruturais homologadas (ADRs) com justificativas, alternativas e impactos | [ADRs](tecnico/decisoes/ADR-001-manifest-v3.md) |
| **Planejamento e Governança** | [Priorização e MVP](planejamento/priorizacao-e-mvp.md)<br>[Gestão de Riscos Técnicos](planejamento/gestao-riscos.md)<br>[Instrumentação e Telemetria](planejamento/metricas-telemetria.md) | Matriz MoSCoW, Sequenciador Lean Inception (Ondas 1 a 3), funil de backlog, critérios de exclusão e governança de telemetria | [Planejamento](planejamento/priorizacao-e-mvp.md) |
| **Referência** | [Glossário Técnico](arquivo/glossario-legado.md) | Vocabulário técnico unificado com definições de termos, métricas e siglas | [Glossário](arquivo/glossario-legado.md) |

---

## Parâmetros Técnicos do Produto

| Dimensão | Especificação Homologada | Rastreabilidade |
|:---|:---|:---|
| **Padrão de Extensão** | Manifest V3 (Google Chrome Extensions API) | [ADR-001](tecnico/decisoes/ADR-001-manifest-v3.md) |
| **Navegadores Homologados** | Google Chrome, Microsoft Edge, Brave (Chromium >= 110) | [RNF-03](requisitos/catalogo-requisitos.md#rnf-03) |
| **Escopo de Operação** | Exclusivo em páginas de reprodução ativa: `https://www.youtube.com/watch*` | [RF-01](requisitos/catalogo-requisitos.md#rf-01) |
| **SLA de Latência** | Resposta analítica estruturada entregue em até **10 segundos** | [RNF-01](requisitos/catalogo-requisitos.md#rnf-01) |
| **Sobrecarga de Renderização** | Impacto máximo de **+50 ms** em Total Blocking Time (TBT) | [RNF-02](requisitos/catalogo-requisitos.md#rnf-02) |
| **Segurança e Credenciais** | Zero credenciais no cliente; intermediação via Backend Proxy | [ADR-002](tecnico/decisoes/ADR-002-backend-proxy.md) |
| **Privacidade de Dados** | Permissão restrita a `activeTab`; sem coleta de histórico geral de navegação | [RNF-05](requisitos/catalogo-requisitos.md#rnf-05) |
| **Acessibilidade Digital** | Conformidade com as diretrizes internacionais WCAG 2.1 nível AA | [RNF-07](requisitos/catalogo-requisitos.md#rnf-07) |

---

## Execução Rápida do Ambiente

Para iniciar o portal de documentação localmente com recarregamento em tempo real:

```bash
# Executar servidor via uv:
uv run mkdocs serve

# O portal estara acessivel em: http://127.0.0.1:8000
```

Para validar a integridade estrita de todos os links e diagramas:

```bash
uv run mkdocs build --strict
```

---

!!! note "Guia de Leitura Recomendado"
    Para uma imersão completa no projeto, inicie pela seção [Alinhamento Estratégico](visao/alinhamento-estrategico.md) e siga sequencialmente para [Personas e Jornadas](design/personas-e-jornadas.md) e [Catálogo de Requisitos](requisitos/catalogo-requisitos.md).
