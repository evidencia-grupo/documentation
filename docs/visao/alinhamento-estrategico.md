# Alinhamento Estratégico

## Nesta página

- [Visão do Produto](#visao-do-produto)
- [Matriz É / Não É / Faz / Não Faz](#matriz-e-nao-e-faz-nao-faz)
- [Objetivos de Negócio e MVP](#objetivos-de-negocio-e-mvp)
  - [Hipótese de Validação](#hipotese-de-validacao)
  - [Métricas de Sucesso (KPIs)](#metricas-de-sucesso-kpis)
  - [Restrições de Negócio Relevantes para o MVP](#restricoes-de-negocio-relevantes-para-o-mvp)

---

## Visão do Produto

!!! quote "Declaração de Visão do Produto"
    Para **usuários que consomem conteúdo informativo no YouTube e desconfiam de sua veracidade** (leigos, estudantes, educadores), cujo problema é **a desinformação em vídeos e a sobrecarga de pesquisa manual**, a **Extensão de Fact-Checking para YouTube** é uma **extensão de navegador informativa (Manifest V3)** que **extrai a transcrição do vídeo em reprodução, cruza as alegações com fontes externas confiáveis via IA e apresenta uma síntese categorizada de evidências com índice visual de veracidade** — diferente de ferramentas como **NewsGuard** e **Fake News Detector** (que se limitam à reputação de domínios ou palavras-chave) ou de pesquisas manuais em agências de checagem. Nosso produto conduz a investigação junto com o usuário, fortalecendo sua capacidade analítica autônoma.

![Declaração de Visão e Diferenciação Competitiva](../assets/visao-do-produto-concorrentes.png)

## Matriz É / Não É / Faz / Não Faz

| Dimensão | Descrição |
|:---|:---|
| **É** | Uma extensão de navegador (Chrome, Edge, Brave — Manifest V3) que atua exclusivamente sobre páginas de reprodução do YouTube (`/watch`) |
| **Não É** | Uma rede social de checagem colaborativa, um serviço de moderação/remoção de conteúdo do YouTube, um verificador de fatos em tempo real para transmissões ao vivo, ou uma ferramenta de auditoria acadêmica com padrão de citação formal (ABNT/APA) |
| **Faz** | Extrai transcrição automaticamente; envia o texto a um backend proxy autenticado; usa IA + busca externa para isolar alegações; classifica evidências como apoio, contradição ou contexto; sinaliza incerteza/controvérsia; exibe fontes com link direto; cacheia resultados localmente; degrada com segurança em falhas de rede/API |
| **Não Faz** | Não modera, remove ou sinaliza publicamente o vídeo perante terceiros; não opera fora do domínio `youtube.com`; não processa vídeos sem legenda/transcrição disponível; não emite veredito absoluto em temas com fontes legítimas divergentes (expõe ambos os lados); não requer login, cadastro ou coleta de histórico geral de navegação |

## Objetivos de Negócio e MVP

### Hipótese de Validação

> Usuários leigos que recebem, dentro do próprio YouTube, uma síntese categorizada e em linguagem acessível sobre a veracidade de um vídeo **confiam mais na informação apresentada** e **adotam o hábito de checar antes de compartilhar**, mesmo sem compreender os detalhes técnicos do processo de verificação.

### Métricas de Sucesso (KPIs)

| Métrica | O que valida | Meta inicial sugerida |
|:---|:---|:---|
| **Taxa de Ativação** | Se a proposta de valor é clara o suficiente para gerar o primeiro uso | ≥ 40% das instalações acionam a extensão em ≥ 1 vídeo na 1ª semana |
| **SLA de Latência** | Viabilidade técnica do RNF-01 (resultado útil em até 10s) | ≥ 90% das análises dentro do SLA |
| **Confiabilidade Percebida** | Se a síntese realmente reduz a incerteza do usuário (hipótese central) | Nota média ≥ 4/5 em pesquisa pós-uso |
| **Retenção (D7)** | Se o hábito de checagem se forma | ≥ 20% de usuários retornando em 7 dias |
| **Taxa de Degradação Segura** | Robustez do RNF-06 (sem travar o navegador) | ≥ 95% das falhas resultam em mensagem clara, não em crash |

### Restrições de Negócio Relevantes para o MVP

- **Privacidade por padrão (RNF-05):** sem coleta de histórico geral de navegação, sem retenção de dados analíticos por padrão — restrição de negócio, não apenas técnica, dado o público leigo e o tema sensível (desinformação em saúde/política).
- **Neutralidade editorial (UC-06):** o produto não pode "vencer" debates com fontes legítimas divergentes — isso é um limite estratégico, não apenas um requisito funcional, pois protege a credibilidade da ferramenta a longo prazo.

---

**Próximo:** [Personas e Jornadas](../design/personas-e-jornadas.md) — conheça os usuários para quem este produto foi desenhado.
