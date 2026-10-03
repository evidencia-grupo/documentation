# Alinhamento Estratégico

## Nesta página

- [Visão do Produto](#visao-do-produto)
- [Matriz É / Não É / Faz / Não Faz](#matriz-e-nao-e-faz-nao-faz)
- [Objetivos de Negócio e MVP](#objetivos-de-negocio-e-mvp)
  - [Hipótese de Validação](#hipotese-de-validacao)
  - [Métricas de Sucesso (KPIs)](#metricas-de-sucesso-kpis)
  - [Restrições de Negócio Relevantes para o MVP](#restricoes-de-negocio-relevantes-para-o-mvp)

---

## Visão do Produto {: #visao-do-produto }

!!! quote "Declaração de Visão do Produto (Atualizada — 2026-10-02)"
    Para **usuários que consomem conteúdo informativo no YouTube e desejam avaliar criticamente as informações apresentadas** (leigos, estudantes, educadores), cujo problema é **a desinformação em vídeos e a dificuldade de encontrar evidências confiáveis sem perder a autonomia de julgamento**, a **Extensão de Fact-Checking para YouTube (EvidencIA)** é uma **extensão de navegador informativa (Manifest V3)** que **extrai a transcrição do vídeo em reprodução, decompõe o discurso em alegações verificáveis, cruza com corpora brasileiros de fact-checking e apresenta uma investigação estruturada de evidências com perguntas orientadoras para reflexão crítica, sem emitir vereditos algorítmicos ou scores globais** — diferente de ferramentas que tentam dizer se um vídeo é "verdadeiro ou falso". Nosso produto apoia a investigação autônoma do usuário, preservando integralmente seu pensamento crítico ([ADR-006](../arquitetura/decisoes/ADR-006-evidence-first-architecture.md)).

![Declaração de Visão e Diferenciação Competitiva](../assets/visao-do-produto-concorrentes.png)

## Matriz É / Não É / Faz / Não Faz {: #matriz-e-nao-e-faz-nao-faz }

| Dimensão | Descrição |
|:---|:---|
| **É** | Uma extensão de navegador (Chrome, Edge, Brave — Manifest V3) que atua exclusivamente sobre páginas de reprodução do YouTube (`/watch`) |
| **Não É** | Uma rede social de checagem colaborativa, um serviço de moderação/remoção de conteúdo do YouTube, um oráculo de verdade factual, um verificador em tempo real para transmissões ao vivo ou uma autoridade algorítmica com vereditos fechados |
| **Faz** | Extrai transcrição automaticamente; envia o texto a um backend proxy autenticado; decompõe o vídeo em alegações atômicas; busca evidências em corpora verificados (FactChecks.br); mapeia relações (sustenta, contradiz, contextualiza); explicita lacunas e incertezas (`insufficient_evidence`); formula perguntas para reflexão crítica; exibe fontes com link direto; cacheia resultados localmente; degrada com segurança em falhas de rede/API |
| **Não Faz** | Não declara "a verdade"; não atribui nota ou score numérico (0–100%) ao vídeo; não modera, remove ou sinaliza publicamente o vídeo perante terceiros; não opera fora do domínio `youtube.com`; não processa vídeos sem legenda/transcrição disponível; não converte ausência de evidência em falsidade; não emite veredito absoluto em controvérsias legítimas; não requer login ou coleta de dados pessoais |

## Objetivos de Negócio e MVP {: #objetivos-de-negocio-e-mvp }

### Hipótese de Validação {: #hipotese-de-validacao }

> Usuários leigos que recebem, dentro do próprio YouTube, uma síntese estruturada de evidências e perguntas orientadoras de reflexão crítica sobre as alegações de um vídeo **desenvolvem maior autonomia analítica**, **percebem lacunas com maior clareza** e **adotam o hábito de investigar antes de compartilhar**, sem depender de um veredito algorítmico automatizado.


### Métricas de Sucesso (KPIs) {: #metricas-de-sucesso-kpis }

| Métrica | O que valida | Meta inicial sugerida |
|:---|:---|:---|
| **Taxa de Ativação** | Se a proposta de valor é clara o suficiente para gerar o primeiro uso | ≥ 40% das instalações acionam a extensão em ≥ 1 vídeo na 1ª semana |
| **SLA de Latência** | Viabilidade técnica do RNF-01 (resultado útil em até 10s) | ≥ 90% das análises dentro do SLA |
| **Confiabilidade Percebida** | Se a síntese realmente reduz a incerteza do usuário (hipótese central) | Nota média ≥ 4/5 em pesquisa pós-uso |
| **Retenção (D7)** | Se o hábito de checagem se forma | ≥ 20% de usuários retornando em 7 dias |
| **Taxa de Degradação Segura** | Robustez do RNF-06 (sem travar o navegador) | ≥ 95% das falhas resultam em mensagem clara, não em crash |

### Restrições de Negócio Relevantes para o MVP {: #restricoes-de-negocio-relevantes-para-o-mvp }

- **Privacidade por padrão (RNF-05):** sem coleta de histórico geral de navegação, sem retenção de dados analíticos por padrão — restrição de negócio, não apenas técnica, dado o público leigo e o tema sensível (desinformação em saúde/política).
- **Neutralidade editorial (UC-06):** o produto não pode "vencer" debates com fontes legítimas divergentes — isso é um limite estratégico, não apenas um requisito funcional, pois protege a credibilidade da ferramenta a longo prazo.

---

**Próximo:** [Personas e Jornadas](personas-e-jornadas.md) — conheça os usuários para quem este produto foi desenhado.
