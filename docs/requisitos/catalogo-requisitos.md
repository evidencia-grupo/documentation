# Catálogo Consolidado de Requisitos

## Nesta página

- [Introdução e Critérios de Classificação](#introducao-e-criterios-de-classificacao)
- [Requisitos Funcionais (RF)](#requisitos-funcionais-rf)
  - [RF-01: Acionamento da Análise](#rf-01)
  - [RF-02: Obtenção e Análise de Transcrição](#rf-02)
  - [RF-03: Apresentação de Evidências em Linguagem Clara](#rf-03)
  - [RF-04: Apresentação de Fontes e Referências Diretas](#rf-04)
  - [RF-05: Retorno Reflexivo e Estímulo Crítico (Pós-MVP)](#rf-05)
  - [RF-06: Síntese Estruturada de Resultados](#rf-06)
  - [RF-07: Alerta Expresso de Incerteza Analítica](#rf-07)
  - [RF-08: Alerta de Ausência de Transcrição](#rf-08)
  - [RF-09: Armazenamento em Cache Local](#rf-09)
  - [RF-10: Avaliação de Precisão e Feedback (Pós-MVP)](#rf-10)
  - [RF-11: Contextualização Temporal e Autoria](#rf-11)
- [Requisitos Não Funcionais (RNF)](#requisitos-nao-funcionais-rnf)
  - [RNF-01 [Desempenho - Latência]](#rnf-01)
  - [RNF-02 [Desempenho - Sobrecarga de Renderização]](#rnf-02)
  - [RNF-03 [Arquitetura e Compatibilidade]](#rnf-03)
  - [RNF-04 [Segurança - Gestão de Credenciais]](#rnf-04)
  - [RNF-05 [Segurança e Privacidade (LGPD)]](#rnf-05)
  - [RNF-06 [Resiliência e Degradação Graciosa]](#rnf-06)
  - [RNF-07 [Usabilidade e Acessibilidade]](#rnf-07)

---

## Introdução e Critérios de Classificação {: #introducao-e-criterios-de-classificacao }

Este documento consolida a totalidade dos requisitos da **Extensão de Fact-Checking para YouTube**, servindo como fonte única da verdade para engenharia de software, testes e auditoria de qualidade.

A priorização segue a metodologia **MoSCoW**, alinhada com a alocação orçamentária da **Técnica dos 100 Dólares ($100 Test)** realizada após as etapas de entrevistas, benchmarking de concorrentes e prototipagem:
- **Must Have (Obrigatório - Onda 1 / MVP):** Requisitos essenciais para viabilizar a jornada do usuário no Happy Path.
- **Should Have (Importante - Onda 2):** Recursos que agregam alto valor operacional e contextual, programados para o primeiro incremento.
- **Could Have (Desejável - Onda 3 / Pós-MVP):** Funcionalidades reflexivas e de engajamento comunitário mapeadas para ciclos futuros.
- **Won't Have (Fora de Escopo):** Demandas expressamente excluídas (ex.: checagem compulsória com pausa forçada de vídeo, transcrição por reconhecimento de áudio no cliente, login social obrigatório).

---

## Requisitos Funcionais (RF) {: #requisitos-funcionais-rf }

### RF-01: Acionamento da Análise {: #rf-01 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve permitir que o usuário inicie a análise de um vídeo do YouTube por meio do acionamento da extensão. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | O botão de acionamento deve ser renderizado exclusivamente em páginas de vídeo ativas (`https://www.youtube.com/watch*`); ao ser clicado pelo usuário, deve disparar a checagem fornecendo confirmação visual de carregamento em até 1 segundo. |
| **Componente Responsável** | Content Script (UI injetada via Shadow DOM isolado). |
| **Rastreabilidade** | [Cenário 01](cenarios.md#cenario-01), [Cenário 03](cenarios.md#cenario-03), [UC-01](casos-de-uso.md#uc-01), [HU01, HU03](backlog-e-historias.md#hu01). |

### RF-02: Obtenção e Análise de Transcrição {: #rf-02 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve obter e analisar a transcrição do conteúdo do vídeo quando legendas ou transcrições estiverem disponíveis. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | O sistema deve capturar faixas de legendas oficiais fornecidas pelo canal ou legendas geradas automaticamente pelo YouTube, estruturando o texto com marcações temporais (*timestamps*) e eliminando ruídos de formatação. |
| **Componente Responsável** | Content Script integrado à API interna do player do YouTube. |
| **Rastreabilidade** | [Cenário 02](cenarios.md#cenario-02), [UC-02](casos-de-uso.md#uc-02), [HU05](backlog-e-historias.md#hu05). |

### RF-03: Apresentação de Evidências em Linguagem Clara {: #rf-03 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve apresentar as evidências relacionadas às afirmações em linguagem acessível e clara. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | As alegações extraídas da transcrição devem ser contrapontas com evidências factuais redigidas em português simples e direto, sem termos herméticos ou jargões da web, priorizando a compreensão imediata por usuários leigos. |
| **Componente Responsável** | Backend Proxy (Pipeline de IA com prompt de formatação acessível) e Painel Lateral (UI). |
| **Rastreabilidade** | [Cenário 03](cenarios.md#cenario-03), [Cenário 10](cenarios.md#cenario-10), [UC-01, UC-03](casos-de-uso.md#uc-01), [HU01, HU02, HU04](backlog-e-historias.md#hu01). |

### RF-04: Apresentação de Fontes e Referências Diretas {: #rf-04 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve apresentar as fontes e referências utilizadas com links e metadados diretos, permitindo que o usuário consulte a origem e verifique as evidências de forma autônoma. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | Cada evidência deve ser acompanhada de título do artigo/instituição, domínio de origem e hiperligação direta com abertura em nova aba (`target="_blank"`), assegurando que o player do vídeo e o painel permaneçam intactos. Links inacessíveis devem ser tratados nativamente pelo navegador sem quebrar a extensão. |
| **Componente Responsável** | Painel Lateral (UI de Fontes) e Backend Proxy (Schema de Referências). |
| **Rastreabilidade** | [Cenário 04](cenarios.md#cenario-04), [UC-04](casos-de-uso.md#uc-04), [HU07](backlog-e-historias.md#hu07). |

### RF-05: Retorno Reflexivo e Estímulo Crítico (Pós-MVP) {: #rf-05 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve fornecer retorno reflexivo sobre o processo de investigação, estimulando a postura crítica do usuário durante a navegação. |
| **Classificação MoSCoW** | Could Have (Onda 3 - Pós-MVP) \| OUT |
| **Regras de Negócio** | O sistema formula perguntas reflexivas neutras ao final da análise de temas controversos para estimular a autonomia do usuário, sem emitir juízos ideológicos ou impor conclusões pré-fabricadas. A interação é opcional e pode ser ignorada sem travar a navegação. |
| **Componente Responsável** | Painel Lateral (Módulo Reflexivo Pós-MVP). |
| **Rastreabilidade** | [Cenário 05](cenarios.md#cenario-05), [UC-05](casos-de-uso.md#uc-05), [HU11](backlog-e-historias.md#hu11). |

### RF-06: Síntese Estruturada de Resultados {: #rf-06 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve apresentar uma síntese estruturada dos resultados da investigação, categorizando quais evidências apoiam, contradizem ou contextualizam a afirmação. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | A interface do painel lateral deve apresentar score de veracidade (0 a 100%), velocímetro gráfico e cartões estruturados segmentando as afirmações em: Apoiadas por Evidências, Contraditadas por Evidências ou Necessitam de Contextualização. |
| **Componente Responsável** | Painel Lateral (Preact / Shadow DOM) e Backend Proxy. |
| **Rastreabilidade** | [Cenário 03](cenarios.md#cenario-03), [Cenário 10](cenarios.md#cenario-10), [UC-01, UC-03](casos-de-uso.md#uc-01), [HU02, HU04](backlog-e-historias.md#hu02). |

### RF-07: Alerta Expresso de Incerteza Analítica {: #rf-07 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve alertar expressamente o usuário quando houver insuficiência de dados, margem de incerteza analítica ou divergência/conflito entre as fontes consultadas. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | Sempre que as referências apresentarem dados insuficientes ou visões divergentes consolidadas, o sistema deve exibir badge destacado de advertência no topo do painel e abster-se de declarar vencedor absoluto, expondo os dois pontos de vista de forma imparcial. |
| **Componente Responsável** | Backend Proxy (Classificador de Consenso) e Painel Lateral (Badge de Alerta). |
| **Rastreabilidade** | [Cenário 06](cenarios.md#cenario-06), [UC-06](casos-de-uso.md#uc-06), [HU09](backlog-e-historias.md#hu09). |

### RF-08: Alerta de Ausência de Transcrição {: #rf-08 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve alertar o usuário de forma clara caso o vídeo não possua legendas ou transcrições disponíveis para processamento. |
| **Classificação MoSCoW** | Must Have (Onda 1 - MVP) \| IN |
| **Regras de Negócio** | Caso o vídeo ativo não contenha faixas de legendas nativas nem automáticas, o sistema deve interromper o fluxo localmente em até 1 segundo, notificando a impossibilidade técnica sem realizar requisições desnecessárias ao backend. |
| **Componente Responsável** | Content Script (Validador Local de Legendas). |
| **Rastreabilidade** | [Cenário 08](cenarios.md#cenario-08), [UC-02](casos-de-uso.md#uc-02), [HU05, HU10](backlog-e-historias.md#hu05). |

### RF-09: Armazenamento em Cache Local {: #rf-09 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve armazenar em cache local os resultados das análises recentes para viabilizar a recuperação imediata de checagens já realizadas. |
| **Classificação MoSCoW** | Should Have (Onda 2 - Incremento 1) \| IN |
| **Regras de Negócio** | As análises concluídas com sucesso devem ser persistidas via `chrome.storage.local` com chave indexada pelo ID do vídeo (`videoId`) e TTL de 24 horas. Consultas repetidas dentro do prazo devem ser renderizadas instantaneamente (< 1s) sem tráfego de rede externo. |
| **Componente Responsável** | Service Worker e `chrome.storage.local`. |
| **Rastreabilidade** | [Cenário 07](cenarios.md#cenario-07), [UC-01](casos-de-uso.md#uc-01), [HU03, HU06](backlog-e-historias.md#hu03). |

### RF-10: Avaliação de Precisão e Feedback (Pós-MVP) {: #rf-10 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve disponibilizar opções para o usuário avaliar a relevância e a precisão das evidências e perguntas apresentadas pela IA. |
| **Classificação MoSCoW** | Could Have (Onda 3 - Pós-MVP) \| OUT |
| **Regras de Negócio** | Disponibilização de opções discretas de feedback (positivo/negativo) ao final da análise. O envio deve ser estritamente voluntário, assíncrono e anônimo, sem coleta de dados pessoais ou histórico de navegação. |
| **Componente Responsável** | Painel Lateral e Módulo de Telemetria Anônima. |
| **Rastreabilidade** | [Cenário 11](cenarios.md#cenario-11), [UC-05](casos-de-uso.md#uc-05), [HU12](backlog-e-historias.md#hu12). |

### RF-11: Contextualização Temporal e Autoria {: #rf-11 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve apresentar a data original de publicação do vídeo e as informações do canal para contextualizar temporalmente as afirmações analisadas. |
| **Classificação MoSCoW** | Should Have (Onda 2 - Incremento 1) \| IN |
| **Regras de Negócio** | O painel deve exibir metadados de publicação (ano de upload e canal proprietário) e o pipeline de IA deve considerar o período de produção para não classificar como anacrônica ou falsa uma afirmação que era fato comprovado na data de postagem original. |
| **Componente Responsável** | Content Script (Extração de Metadados) e Backend Proxy. |
| **Rastreabilidade** | [Cenário 09](cenarios.md#cenario-09), [UC-01, UC-03](casos-de-uso.md#uc-01), [HU08](backlog-e-historias.md#hu08). |

---

## Requisitos Não Funcionais (RNF) {: #requisitos-nao-funcionais-rnf }

### RNF-01 [Desempenho - Latência] {: #rnf-01 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | O sistema deve fornecer confirmação visual de processamento em até 1 segundo e disponibilizar o primeiro resultado útil em até 10 segundos sob condições normais de rede, exibindo indicador contínuo de progresso em chamadas assíncronas demoradas. |
| **Métricas Técnicas** | Latência de feedback visual: <= 1.000 ms. Latência de primeiro resultado útil (P90): <= 10.000 ms. |
| **Método de Validação** | Testes de telemetria E2E automatizados com Playwright e medição via `performance.now()`. |
| **Rastreabilidade** | [Cenário 01, 03, 07, 08](cenarios.md#cenario-01), [HU01, HU03, HU06, HU10](backlog-e-historias.md#hu01). |

### RNF-02 [Desempenho - Sobrecarga de Renderização] {: #rnf-02 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | A injeção de scripts e componentes na página ativa do YouTube não deve elevar o Tempo Total de Bloqueio (TBT) em mais de 50 ms nem alocar mais de 80 MB de memória RAM na aba do navegador. |
| **Métricas Técnicas** | Incremento de Total Blocking Time: <= 50 ms. Consumo incremental de memória RAM: <= 80 MB. |
| **Método de Validação** | Auditoria automatizada do Google Lighthouse em pipeline de CI e amostragem via Chrome DevTools Memory Inspector. |
| **Rastreabilidade** | [Cenário 01, 03](cenarios.md#cenario-01), [HU04](backlog-e-historias.md#hu04). |

### RNF-03 [Arquitetura e Compatibilidade] {: #rnf-03 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | A extensão deve ser implementada em estrita conformidade com o padrão Manifest V3 do ecossistema Chromium, utilizando Service Workers para rotinas de fundo e assegurando interoperabilidade nos navegadores Google Chrome, Microsoft Edge e Brave. |
| **Escopo de Homologação** | Navegadores baseados em Chromium versão >= 110. Escopo restrito a `https://www.youtube.com/watch*`. |
| **Método de Validação** | Testes de regressão automatizados em runners Chromium para Chrome, Edge e Brave. |
| **Rastreabilidade** | [Cenário 02](cenarios.md#cenario-02), [HU05](backlog-e-historias.md#hu05), [ADR-001](../tecnico/decisoes/ADR-001-manifest-v3.md). |

### RNF-04 [Segurança - Gestão de Credenciais] {: #rnf-04 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | A extensão não deve conter chaves de API, credenciais ou segredos em seu código executável no cliente (client-side), canalizando todas as requisições a serviços externos e inferências por meio de um servidor proxy autenticado. |
| **Diretrizes de Segurança** | Zero segredos em arquivos empacotados na extensão; autenticação segura por token de sessão efêmero no Backend Proxy; isolamento de renderização em Shadow DOM. |
| **Método de Validação** | Secret scanning estático no CI (Gitleaks, Trufflehog) e análise de tráfego de rede no build. |
| **Rastreabilidade** | [Cenário 03](cenarios.md#cenario-03), [HU03, HU04](backlog-e-historias.md#hu03), [ADR-002](../tecnico/decisoes/ADR-002-backend-proxy.md). |

### RNF-05 [Segurança e Privacidade (LGPD)] {: #rnf-05 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | A extensão deve solicitar apenas permissões estritamente essenciais no manifesto (activeTab e escopo restrito a https://www.youtube.com/*), sem coletar histórico geral de navegação, sem armazenar credenciais do usuário e sem reter dados analíticos por padrão. |
| **Princípios LGPD** | Necessidade (Art. 6º, III), Finalidade (Art. 6º, I) e Segurança (Art. 6º, VII). Sem cookies de terceiros ou identificadores biométricos/persistentes. |
| **Método de Validação** | Auditoria de segurança de permissões de manifesto e verificação de conformidade no Threat Model. |
| **Rastreabilidade** | [Cenário 04, 07, 11](cenarios.md#cenario-04), [HU06, HU07, HU12](backlog-e-historias.md#hu06), [Threat Model](../tecnico/threat-model.md). |

### RNF-06 [Resiliência e Degradação Graciosa] {: #rnf-06 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | Em caso de falha de conexão, indisponibilidade de APIs externas ou timeout, o sistema deve degradar com segurança, exibindo mensagem descritiva de erro ao usuário e desativando o estado de carregamento sem travar a extensão. |
| **Tratamento de Exceções** | Fallback visual em falhas de rede; timeout defensivo de 10s com botão de nova tentativa; zero crashes na aba do YouTube. |
| **Método de Validação** | Testes de caos com indução de indisponibilidade de rede (HTTP 500, 503, timeout 504). |
| **Rastreabilidade** | [Cenário 02, 03, 06, 08](cenarios.md#cenario-02), [HU05, HU09, HU10](backlog-e-historias.md#hu05). |

### RNF-07 [Usabilidade e Acessibilidade] {: #rnf-07 }

| Propriedade | Detalhe |
|:---|:---|
| **Enunciado Padronizado** | A interface deve apresentar as informações de forma hierarquizada e sem sobrecarga cognitiva para usuários leigos, atendendo aos padrões WCAG de contraste de cores, legibilidade e suporte integral à navegação via teclado. |
| **Critérios de Acessibilidade** | Conformidade com WCAG 2.1 nível AA; contraste de cores >= 4,5:1; suporte integral a foco via `Tab`; atributos descritivos ARIA. |
| **Método de Validação** | Varredura automatizada com `axe-core` no CI e testes manuais de navegação por teclado. |
| **Rastreabilidade** | [Cenário 01, 04, 06, 08, 09, 10](cenarios.md#cenario-01), [HU01, HU02, HU07, HU08, HU09, HU10](backlog-e-historias.md#hu01), [Design System](../design/design-system.md). |

---

**Próximo:** [Casos de Uso](casos-de-uso.md) — especificações de atores e fluxos operacionais.  
**Ver também:** [Processo de Elicitação](elicitacao.md) — evidências das entrevistas, análise de concorrentes, prototipagem e dinâmica dos 100 Dólares.
