# Portal de Documentação — Extensão de Fact-Checking para YouTube

> Documentação técnica e de produto para checagem de fatos em vídeos através de transcrição automatizada, inteligência artificial e painel lateral acessível.

---

## Visão do Produto

A **Extensão de Fact-Checking para YouTube** é uma solução de navegador (Chrome, Edge, Brave — Manifest V3) projetada para capacitar usuários que consomem conteúdos informativos no YouTube a validar de forma autônoma a veracidade das afirmações apresentadas, diretamente no fluxo de consumo e sem necessidade de pesquisas manuais exaustivas.

![Interface do Painel Lateral da Extensão no YouTube](assets/mockup-painel-youtube.png)

---

## Módulos da Documentação

O acervo de documentação está estruturado em seis áreas fundamentais para orientar desenvolvedores, arquitetos, designers e gestores de produto:

| Área | Documentos Principais | Descrição do Conteúdo |
|:---|:---|:---|
| **Visão do Produto** | [Alinhamento Estratégico](visao/alinhamento-estrategico.md) | Declaração de visão, matriz É/Não É/Faz/Não Faz, objetivos e KPIs |
| **Design e Experiência** | [Personas e Jornadas](design/personas-e-jornadas.md)<br>[Design System](design/design-system.md) | Perfis de usuários, antipersonas, jornadas AS-IS/TO-BE e tokens de interface |
| **Engenharia de Requisitos** | [Processo de Elicitação](requisitos/elicitacao.md)<br>[Catálogo de Requisitos](requisitos/catalogo-requisitos.md)<br>[Casos de Uso](requisitos/casos-de-uso.md)<br>[Cenários de Uso](requisitos/cenarios.md)<br>[Backlog e Histórias](requisitos/backlog-e-historias.md)<br>[Matriz de Rastreabilidade](requisitos/matriz-rastreabilidade.md) | Elicitação empírica, especificação de RFs e RNFs, fluxos operacionais, cenários e critérios de aceitação |
| **Arquitetura e Engenharia** | [Arquitetura do Sistema](tecnico/arquitetura.md)<br>[Contrato de Dados e API](tecnico/contrato-api.md)<br>[Threat Model e LGPD](tecnico/threat-model.md)<br>[Estratégia de Testes e DoD](tecnico/estrategia-testes.md)<br>[Decisões Arquiteturais (ADRs)](tecnico/arquitetura.md#decisoes-de-design-adrs) | Diagramas C4, diagramas de sequência, schemas OpenAPI, análise STRIDE e testes |
| **Planejamento e Governança** | [Priorização e MVP](planejamento/priorizacao-e-mvp.md)<br>[Gestão de Riscos](planejamento/gestao-riscos.md)<br>[Métricas e Telemetria](planejamento/metricas-telemetria.md) | Matriz MoSCoW, sequenciador Lean Inception, matriz de riscos e telemetria ética |
| **Referência** | [Glossário Técnico](referencia/glossario.md) | Vocabulário consolidado com definições formais de termos e siglas do projeto |

---

## Parâmetros Técnicos do Produto

| Dimensão | Especificação Homologada |
|:---|:---|
| **Padrão de Extensão** | Manifest V3 (Google Chrome Extensions API) |
| **Navegadores Homologados** | Google Chrome, Microsoft Edge, Brave (Chromium >= 110) |
| **Escopo de Operação** | Exclusivo em páginas de reprodução ativa: `https://www.youtube.com/watch*` |
| **SLA de Latência** | Resposta analítica estruturada entregue em até **10 segundos** ([RNF-01](requisitos/catalogo-requisitos.md#rnf-01)) |
| **Sobrecarga de Renderização** | Impacto máximo de **+50 ms** em Total Blocking Time (TBT) ([RNF-02](requisitos/catalogo-requisitos.md#rnf-02)) |
| **Segurança e Chaves** | Zero credenciais no cliente; intermediação via Backend Proxy ([ADR-002](tecnico/decisoes/ADR-002-backend-proxy.md)) |
| **Privacidade de Dados** | Permissão restrita a `activeTab`; sem coleta de histórico geral de navegação ([RNF-05](requisitos/catalogo-requisitos.md#rnf-05)) |
| **Acessibilidade Digital** | Conformidade com as diretrizes internacionais WCAG 2.1 nível AA ([RNF-07](requisitos/catalogo-requisitos.md#rnf-07)) |

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
