# Portal de Documentação — EvidencIA

> **O que você vai encontrar aqui:** Ponto de entrada oficial da documentação do EvidencIA. Apresenta o escopo do produto, a interface conceitual, os pilares da documentação técnica e os parâmetros homologados de engenharia.

<div class="hero-banner">
  <div class="hero-banner__title">EvidencIA — Inteligência Aumentada contra Desinformação em Vídeos</div>
  <div>Extensão de navegador sob o padrão Manifest V3 que checa alegações em vídeos do YouTube através de IA local, busca factual em agências jornalísticas brasileiras e arquitetura Evidence-First.</div>
  <div class="hero-banner__pills">
    <span class="hero-pill">Manifest V3</span>
    <span class="hero-pill">Evidence-First</span>
    <span class="hero-pill">Chromium 110+</span>
    <span class="hero-pill">WCAG 2.1 AA</span>
    <span class="hero-pill">Challenge Based Learning</span>
  </div>
</div>

---

!!! tip "Novo no projeto? Comece por aqui em até 15 minutos"
    Consulte a [Visão Geral do Projeto (1 página)](visao-geral/visao-geral-do-projeto.md) para entender rapidamente o problema, a solução, a arquitetura e os próximos passos. Acompanhe a entrega dos marcos no [Painel de Status Consolidado](visao-geral/status.md).

---

## 4 Pilares Estruturais da Documentação

A documentação está consolidada em quatro pilares objetivos para rápida localização por qualquer perfil de leitor:

<div class="doc-grid">
  <a href="visao-geral/visao-geral-do-projeto.md" class="doc-card">
    <div>
      <div class="doc-card__header">
        <span class="doc-card__icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76"/></svg></span>
        <h3 class="doc-card__title">1. Visão Geral</h3>
      </div>
      <p class="doc-card__desc">Síntese executiva em 1 página (leitura de 5-10 min), fluxo de telas, topologia dos repositórios e status das entregas.</p>
    </div>
    <div class="doc-card__action"><span>Entender o Projeto &rarr;</span></div>
  </a>

  <a href="requisitos/catalogo-requisitos.md" class="doc-card">
    <div>
      <div class="doc-card__header">
        <span class="doc-card__icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><rect x="8" y="2" width="8" height="4" rx="1" ry="1"/><path d="M9 12h6"/><path d="M9 16h6"/></svg></span>
        <h3 class="doc-card__title">2. Requisitos & Produto</h3>
      </div>
      <p class="doc-card__desc">Catálogo formal de requisitos (RF-01 a 15, RNF-01 a 07), personas, casos de uso, critérios em Gherkin e matriz MoSCoW.</p>
    </div>
    <div class="doc-card__action"><span>Explorar Requisitos &rarr;</span></div>
  </a>

  <a href="tecnico/arquitetura.md" class="doc-card">
    <div>
      <div class="doc-card__header">
        <span class="doc-card__icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"/><polyline points="2 17 12 22 22 17"/><polyline points="2 12 12 17 22 12"/></svg></span>
        <h3 class="doc-card__title">3. Arquitetura & Engenharia</h3>
      </div>
      <p class="doc-card__desc">Diagramas C4, pipeline RAG local com datasets brasileiros, contratos OpenAPI/Pydantic, segurança STRIDE e as 6 ADRs.</p>
    </div>
    <div class="doc-card__action"><span>Ver Arquitetura &rarr;</span></div>
  </a>

  <a href="visao/guiding-questions.md" class="doc-card">
    <div>
      <div class="doc-card__header">
        <span class="doc-card__icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 2v7.31M14 2v7.31M8.5 2h7M14 9.3a6.5 6.5 0 1 1-4 0"/><line x1="8" y1="15" x2="16" y2="15"/></svg></span>
        <h3 class="doc-card__title">4. Processo & Validação</h3>
      </div>
      <p class="doc-card__desc">Framework Challenge Based Learning (Engage, Investigate, Act), governança Scrum, experimento com usuários e banca acadêmica.</p>
    </div>
    <div class="doc-card__action"><span>Conferir Validação &rarr;</span></div>
  </a>
</div>

| Pilar | Documentos Principais | O que você encontra | Ponto de Partida |
|:---|:---|:---|:---:|
| **1. Visão Geral** | [Visão em 1 Página](visao-geral/visao-geral-do-projeto.md) · [Mapa Visual](visao-geral/mapa-do-projeto.md) · [Painel de Status](visao-geral/status.md) · [Glossário](glossario.md) | Síntese executiva (5-10 min), fluxo de telas, topologia dos repositórios e status das entregas | [Começar aqui](visao-geral/visao-geral-do-projeto.md) |
| **2. Requisitos & Produto** | [Elicitação ($100)](requisitos/elicitacao.md) · [Catálogo RF/RNF](requisitos/catalogo-requisitos.md) · [Personas & UX](design/personas-e-jornadas.md) · [Histórias Gherkin](requisitos/backlog-e-historias.md) · [Matriz MoSCoW](requisitos/matriz-rastreabilidade.md) | Personas, requisitos funcionais/não funcionais, casos de uso, critérios Gherkin e priorização MoSCoW | [Ver Requisitos](requisitos/catalogo-requisitos.md) |
| **3. Arquitetura & Engenharia** | [Arquitetura C4](tecnico/arquitetura.md) · [Pipeline RAG Local](tecnico/ia-e-datasets.md) · [Contrato de API](tecnico/contrato-api.md) · [STRIDE & LGPD](tecnico/threat-model.md) · [ADRs 001–006](tecnico/decisoes/ADR-001-manifest-v3.md) · [CI/CD](tecnico/estrategia-testes.md) | Modelo C4, sequência assíncrona, schemas OpenAPI/Pydantic, privacidade, decisões arquiteturais e setup | [Ver Arquitetura](tecnico/arquitetura.md) |
| **4. Processo & Validação** | [12 GQs (Engage)](visao/guiding-questions.md) · [Scrum & DoD](scrum/definition-of-done.md) · [Experimento Act](cbl/act/experiment-plan.md) · [Showcase & Auditoria](cbl/reflect-share/reflection.md) | Ciclo Challenge Based Learning, cerimônias ágeis, desenho experimental com participantes e evidências para banca | [Ver Processo](visao/guiding-questions.md) |

---

## Visão do Produto & Interface Conceitual

O **EvidencIA** é uma extensão de navegador de código aberto desenvolvida sob o padrão **Manifest V3** (Google Chrome, Microsoft Edge e Brave) projetada para apoiar o discernimento crítico de quem assiste a conteúdos no YouTube. A ferramenta analisa a transcrição do áudio do vídeo em tempo real, identifica alegações verificáveis e busca evidências factuais em agências de checagem jornalística brasileiras, organizando os resultados em um painel lateral acessível.

Ao contrário de abordagens baseadas em vereditos algorítmicos automatizados, o EvidencIA adota a arquitetura **Evidence-First** ([ADR-006](tecnico/decisoes/ADR-006-evidence-first-architecture.md)): o sistema não atribui uma nota ou score à verdade, mas fornece o contexto factual, as fontes auditáveis e perguntas de estímulo crítico para que o próprio usuário forme sua convicção.

![Interface do Painel Lateral da Extensão no YouTube](assets/mockup-painel-youtube.png)
*Figura: Conceito visual do painel lateral em tema escuro integrado ao player do YouTube. A interface segue a arquitetura Evidence-First com cartões de alegações, fontes com links auditáveis e perguntas reflexivas.*

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
