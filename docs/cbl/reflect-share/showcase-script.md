# Roteiro de Apresentação (Showcase Script) — EvidencIA

> **Fase:** CBL Reflect & Share  
> **Duração Total Prevista:** 10:00 (*A CONFIRMAR com a banca avaliadora; se a duração oficial for outra, escalone proporcionalmente*)  
> **Princípio Ético:** Transparência radical e exposição de resultados negativos sem maquiagem  
> **Repositórios de Evidência:** `evidencia-grupo/documentation` (@`9e95b68`) e `evidencia-grupo/EvidencIA` (@`27c53e8`)

---

## 1. Estrutura Narrativa e Orçamento de Tempo

A apresentação segue rigorosamente a cadeia metodológica do Challenge Based Learning (CBL):  
**Challenge → Essential Question → Guiding Questions → EDA → ADR → Evidence UI → Validação Act → Limitações/Reflexão → Encerramento**.

| # | Segmento | Tempo | Orador | Evidência Obrigatória [EV] | Slide Sugerido |
|:---:|:---|:---:|:---:|:---|:---|
| 1 | Challenge (O Problema) | 0:45 | `A DEFINIR` | [EV: documentation:docs/visão/alinhamento-estratégico.md#problema-central@9e95b68] | Slide 1: O Desafio da Informação em Vídeo |
| 2 | Essential Question | 0:30 | `A DEFINIR` | [EV: documentation:docs/visão/essential-question-alignment.md#alinhamento-com-a-essential-question@9e95b68] | Slide 2: A Pergunta Essencial |
| 3 | Guiding Questions | 1:00 | `A DEFINIR` | [EV: documentation:docs/visão/guiding-questions.md#guiding-questions@9e95b68] | Slide 3: 12 Perguntas Orientadoras |
| 4 | EDA: Dados e Achados | 1:45 | `A DEFINIR` | [EV: EvidencIA:notebooks/eda_datasets.ipynb@27c53e8] | Slide 4: Análise Exploratória dos Datasets |
| 5 | ADR: Achado → Decisão | 1:15 | `A DEFINIR` | [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão@9e95b68] | Slide 5: A Virada Arquitetural Evidence-First |
| 6 | Evidence UI (Antes vs Depois + Demo) | 2:00 | `A DEFINIR` | [EV: documentation:docs/cbl/reflect-share/demo-script.md#roteiro-de-demonstração-passo-a-passo@9e95b68] | Slide 6: Nova Interface em Ação |
| 7 | Validação Experimental (Act) | 1:30 | `A DEFINIR` | [EV: documentation:docs/cbl/act/experiment-plan.md#plano-experimental@9e95b68] | Slide 7: Protocolo e Métricas do Estudo |
| 8 | Limitações e Reflexão Metodológica | 1:00 | `A DEFINIR` | [EV: documentation:docs/cbl/act/limitations.md#limitacoes-metodológicas@9e95b68] | Slide 8: Limitações Reais e Ameaças à Validade |
| 9 | Encerramento e Próximos Passos | 0:15 | `A DEFINIR` | [EV: documentation:docs/cbl/reflect-share/lessons-learned.md#matriz-de-licoes-aprendidas-por-categoria@9e95b68] | Slide 9: Conclusão e Próximos Passos |

---

## 2. Detalhamento dos Segmentos

### Segmento 1 — Challenge: O Problema da Informação em Vídeo (0:45)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 1 — Capturas de vídeos virais e o dilema do consumo passivo.
- **Pontos-Chave:**
  - Vídeos informacionais são lineares, envolventes e misturam opiniões com afirmações empíricas.
  - O usuário não tem ferramentas ágeis para checar alegações pontuais sem interromper o fluxo cognitivo.
  - A tentação tecnológica inicial era criar um "detector automático de mentiras" com score.
- **Evidência:** [EV: documentation:docs/visão/alinhamento-estratégico.md#problema-central@9e95b68]
- **Transição:** *"Para responder a esse desafio, o primeiro passo metodológico do CBL foi formular nossa pergunta essencial."*

### Segmento 2 — Essential Question (0:30)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 2 — A Essential Question em destaque central.
- **Pontos-Chave:**
  - *Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?*
  - O foco não é a IA decidir pelo usuário, mas capacitar o usuário a investigar melhor.
  - Rejeição do modelo autoritário em favor da autonomia epistêmica do cidadão.
- **Evidência:** [EV: documentation:docs/visão/essential-question-alignment.md#alinhamento-com-a-essential-question@9e95b68]
- **Transição:** *"A partir desta pergunta central, derivamos 12 perguntas orientadoras para guiar nossa pesquisa."*

### Segmento 3 — Guiding Questions (1:00)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 3 — Painel com as 12 GQs, com zoom em GQ02, GQ05 e GQ08.
- **Pontos-Chave:**
  - **GQ02 (Veredito vs Evidência):** O usuário precisa de um veredito ou de evidências? Descobrimos que notas únicas anulam a reflexão crítica.
  - **GQ05 (Incerteza):** O que significa não achar evidência? Ausência de checagem não é falsidade; é evidência insuficiente.
  - **GQ08 (Estímulo Crítico):** Como estimular reflexão? Promovendo perguntas orientadoras (HU11) ao centro da interface.
- **Evidência:** [EV: documentation:docs/visão/guiding-questions.md#guiding-questions@9e95b68]
- **Transição:** *"Mas antes de desenhar o software, precisávamos investigar a fundo os dados disponíveis no Brasil."*

### Segmento 4 — EDA: Dados, Linguística e Achados (1:45)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 4 — Gráficos do notebook `eda_datasets.ipynb` (distribuição, léxico, temporais).
- **Pontos-Chave:**
  - Investigamos três bases principais: FactChecks.br, Fake.br e ClaimPT através de 17 seções analíticas no notebook [EV: EvidencIA:notebooks/eda_datasets.ipynb@27c53e8].
  - **Achado 1:** Fake.br é um corpus de estilo linguístico balanceado, mas **não é fonte factual de checagens com links auditáveis** [EV: EvidencIA:backend/ml/datasets/sources.yaml#fakebr@27c53e8].
  - **Achado 2:** FactChecks.br é a única base brasileira curada com matérias de agências IFCN (Lupa, Aos Fatos) [EV: EvidencIA:backend/ml/datasets/sources.yaml#factchecksbr@27c53e8].
  - **Achado 3:** ClaimPT usa Português Europeu (PT-EU), o que introduz ruído sintático em classificadores voltados para o Brasil [EV: EvidencIA:backend/ml/datasets/sources.yaml#claimpt@27c53e8].
- **Evidência:** [EV: EvidencIA:backend/ml/datasets/sources.yaml#sources@27c53e8]
- **Transição:** *"Esses achados empíricos transformaram radicalmente nossas decisões de arquitetura."*

### Segmento 5 — ADR: Da Investigação à Decisão Arquitetural (1:15)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 5 — Diagrama comparativo da arquitetura anterior vs ADR-006 Evidence-First.
- **Pontos-Chave:**
  - **ADR-006:** Formalizamos o abandono do score global (0–100) e do componente Gauge na extensão [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-1-fim-do-score-global@9e95b68].
  - **Nova Unidade de Dados:** O sistema não classifica o "vídeo", mas decompõe o vídeo em **Alegações Individuais + Evidências Rastreáveis** [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-2-unidade-alegação-evidências@9e95b68].
  - **Guarda Anti-Mock:** Criação da interface abstrata `LLMProvider` com bloqueio obrigatório de mocks em ambiente de produção [EV: EvidencIA:backend/app/services/providers/factory.py#get_provider@27c53e8].
- **Evidência:** [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão@9e95b68]
- **Transição:** *"Vamos ver como essa mudança conceitual se materializou na experiência de uso."*

### Segmento 6 — Evidence UI: Demonstração Operacional (2:00)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 6 / Execução ao vivo do roteiro de demonstração.
- **Pontos-Chave:**
  - Demonstração honesta ancorada em `demo-script.md`:
  - 1. Decomposição da fala do vídeo em alegações atômicas independentes.
  - 2. Apresentação de Evidence Cards com vínculo direto às matérias de checagem.
  - 3. Tratamento explícito de alegações sem dados como `insufficient_evidence`.
  - 4. Rastreabilidade e links diretos para auditoria das fontes pelo próprio usuário.
  - *Transparência:* Sinalização explícita de componentes em transição da Sprint 2.
- **Evidência:** [EV: documentation:docs/cbl/reflect-share/demo-script.md#roteiro-de-demonstração-passo-a-passo@9e95b68]
- **Transição:** *"Para validar se essa nova interface de fato preserva o pensamento crítico, estruturamos o experimento da fase Act."*

### Segmento 7 — Validação Experimental (Act) (1:30)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 7 — Desenho do ensaio controlado A/B e métricas pré-registradas.
- **Pontos-Chave:**
  - Estudo experimental entre-sujeitos: Grupo Controle (Interface Tradicional com Score/Gauge) vs Grupo Experimental (Evidence-First com Cards e Perguntas Reflexivas) [EV: documentation:docs/cbl/act/experiment-plan.md#desenho-experimental@9e95b68].
  - Métricas comportamentais objetivas: Tempo de Análise (TTA), Taxa de Expansão de Evidências (EIR) e Taxa de Decisão Independente (IBR) [EV: documentation:docs/cbl/act/metrics-definition.md#métricas-comportamentais@9e95b68].
  - Telemetria ética: estritamente local e sem envio de dados a servidores remotos [EV: documentation:docs/cbl/act/telemetry-spec.md#especificação-de-telemetria@9e95b68].
  - **Estado Atual (SCAFFOLD):** Protocolo pronto, aguardando aplicação em campo com voluntários para geração do relatório `results.md`.
- **Evidência:** [EV: documentation:docs/cbl/act/metrics-definition.md#regras-de-decisão-pre-registradas@9e95b68]
- **Transição:** *"Nenhum projeto científico está completo sem reconhecer abertamente suas limitações."*

### Segmento 8 — Limitações e Reflexão Metodológica (1:00)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 8 — Matriz de limitações e aprendizados CBL + Scrum.
- **Pontos-Chave:**
  - **Limitação de Base:** O sistema depende da existência de checagens prévias; fatos hiperlocais ou inéditos não possuem cobertura factual imediata [EV: documentation:docs/cbl/act/limitations.md#limitacoes-metodológicas@9e95b68].
  - **Latência de Inferência:** Executar LLMs locais (como Qwen 3B via Ollama) em computadores convencionais sem GPU dedicada ultrapassa a meta de 10 segundos, exigindo infraestrutura acelerada ou destilação [EV: documentation:docs/scrum/sprint-01/review.md#incremento-demonstrado@9e95b68].
  - **Integração CBL + Scrum:** O CBL garantiu a bússola ética contra a alienação tecnológica, enquanto o Scrum forneceu cadência técnica para converter pesquisa em código auditável [EV: documentation:docs/scrum/sprint-01/retrospective.md#o-que-funcionou-bem@9e95b68].
- **Evidência:** [EV: documentation:docs/cbl/act/limitations.md#limitacoes-metodológicas@9e95b68]
- **Transição:** *"Para encerrar, compartilhamos nossas próximas ações e abrimos para a banca."*

### Segmento 9 — Encerramento e Próximos Passos (0:15)
- **Orador:** `A DEFINIR`
- **Visual / Slide:** Slide 9 — QR Code para a documentação técnica e agradecimentos.
- **Pontos-Chave:**
  - Aplicação do protocolo de testes com amostra humana real.
  - Conclusão do pacote da Sprint 2 na extensão do navegador.
  - Agradecimento à banca e abertura formal para perguntas.
- **Evidência:** [EV: documentation:docs/cbl/reflect-share/lessons-learned.md#matriz-de-licoes-aprendidas-por-categoria@9e95b68]

---

## 3. Perguntas Prováveis da Banca e Respostas com Evidência

### 1. Por que vocês eliminaram o score numérico de confiabilidade?
> **Resposta:** "Porque o score numérico é uma forma de autoridade algorítmica. Quando a interface mostra 'Confiabilidade: 85%', o usuário para de ler os argumentos e aceita o número como verdade, transferindo seu julgamento para a máquina. A Essential Question nos desafiou a usar IA sem substituir o pensamento crítico. Por isso, no ADR-006, eliminamos o score e adotamos Evidence Cards individuais: quem julga é o ser humano; a IA apenas organiza as evidências [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-1-fim-do-score-global@9e95b68]."

### 2. O dataset Fake.br não pode ser usado como verdade factual de checagens?
> **Resposta:** "Não. A análise exploratória no notebook `eda_datasets.ipynb` demonstrou que o Fake.br é um corpus de análise linguística estilométrica, pareando notícias verdadeiras e falsas para treino de classificadores. Ele não possui metadados de checagem, links para fontes originais nem justificativas factuais. Nosso registro `sources.yaml` classifica formalmente o Fake.br como `linguistic_corpus` e elege o FactChecks.br como a base de evidências do RAG [EV: EvidencIA:backend/ml/datasets/sources.yaml#fakebr@27c53e8]."

### 3. O que acontece na extensão quando nenhuma evidência é encontrada?
> **Resposta:** "O sistema exibe explicitamente o estado `insufficient_evidence`, com mensagem clara avisando que a base curada não possui registros sobre aquela alegação específica. Estabelecemos formalmente na GQ05 e no schema `evidence.py` que ausência de evidência nunca pode ser convertida automaticamente em falsidade ou veredito negativo, pois isso constituiria alucinação de classificação [EV: EvidencIA:backend/ml/schemas/evidence.py#verdictnormalized@27c53e8]."

### 4. Por que vocês restringiram o escopo ao PT-BR e descartaram o ClaimPT como base primária?
> **Resposta:** "Porque o ClaimPT é redigido em Português Europeu (PT-EU). Nossa inspeção revelou disparidades lexicais, ortográficas e estilísticas que alteram a similaridade de cosseno em modelos de embedding treinados em português brasileiro. Ele foi mantido apenas como referência metodológica de check-worthiness em `sources.yaml` [EV: EvidencIA:backend/ml/datasets/sources.yaml#claimpt@27c53e8]."

### 5. Qual foi o N do experimento e por que ainda não há significância estatística?
> **Resposta:** "Como estamos na fase SCAFFOLD de estruturação metodológica e de software, o estudo experimental com voluntários humanos ainda não foi realizado. Os dados atualmente existentes em `summary.json` derivam de execuções sintéticas para teste do pipeline de telemetria. Em conformidade com nosso compromisso ético de não fabricar evidências, o resultado é reportado como PENDENTE [EV: documentation:docs/cbl/act/go-no-go-act.md#critérios-de-prontidao@9e95b68]."

### 6. E se o Ollama local falhar durante a execução?
> **Resposta:** "A arquitetura do backend implementa o modo Evidence-Only. Se o modelo generativo local falhar ou estourar o timeout, a extração sintética de reflexão é ignorada e o sistema entrega ao usuário diretamente as alegações e os Evidence Cards recuperados das bases de dados, sem travar e sem inventar dados via mock [EV: EvidencIA:backend/tests/test_no_mock_in_production.py#test_provider_factory_mock_guard@27c53e8]."

### 7. Como o sistema evita ataques de Prompt Injection através de transcrições maliciosas?
> **Resposta:** "A transcrição do vídeo é tratada estritamente como dado não-confiável. O sistema não concatena transcrições diretamente no corpo executável de instruções do prompt; a extração de proposições ocorre em delimitadores estritos e a validação de fatos é executada por busca semântica em base local pré-indexada, blindando o RAG contra injeções que tentem forçar um veredito específico [EV: documentation:docs/técnico/threat-model.md#threat-model-e-lgpd@9e95b68]."

### 8. O que a interface antiga fazia de errado conceitualmente?
> **Resposta:** "A interface original concentrava a atenção em um gauge semicircular colorido com nota de 0 a 100. Testes de usabilidade mostraram que o usuário fixava o olhar na cor e no número, ignorando as fontes. Isso contradiz diretamente a proposta de pensamento crítico, induzindo o espectador ao viés de automação [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#contexto@9e95b68]."

### 9. O que NÃO funcionou como o time esperava no projeto?
> **Resposta:** "Dois aspectos centrais: primeiro, a inferência puramente local do Qwen 2.5-3B sob CPU em computadores padrão mostrou-se lenta para respostas instantâneas, exigindo mecanismos agressivos de cache [EV: documentation:docs/scrum/sprint-01/review.md#incremento-demonstrado@9e95b68]. Segundo, a tentativa de usar Story Points para tarefas puramente investigativas gerou desvios de estimativa na Sprint 1, ensinando o time a utilizar spikes com tempo fixo [EV: documentation:docs/scrum/sprint-01/retrospective.md#o-que-pode-melhorar@9e95b68]."

---

## 4. Plano de Contingência

| Cenário de Falha | Probabilidade | Procedimento de Resposta Imediata |
|:---|:---:|:---|
| Falha de conexão ou timeout na demonstração ao vivo da extensão | Média | Chamar imediatamente o Plano B gravado: execução local com fixtures offline e vídeo de homologação de 45 segundos [EV: documentation:docs/cbl/reflect-share/demo-script.md#checklist-de-pre-voo@9e95b68]. |
| Tempo estourando (atingiu 7:00 antes do Segmento 6) | Média | O orador funde os Segmentos 7 e 8, focando nos princípios centrais e nas ameaças à validade, preservando os 2 minutos finais para debate com a banca. |
| Pergunta da banca sobre ausência de testes com humanos | Alta | Assumir prontamente o estado de SCAFFOLD: o protocolo está desenhado e congelado, impedindo conclusões precipitadas antes da aprovação ética. |
