# Síntese Acadêmica e Reflexão — EvidencIA

> **Fase:** CBL Reflect & Share  
> **Estado:** SCAFFOLD (pré-execução de campo do Act)  
> **Repositórios de Evidência:** `evidencia-grupo/documentation` (@`9e95b68`) e `evidencia-grupo/EvidencIA` (@`27c53e8`)

---

## 1. Retomada da Essential Question e Resposta Fundamentada

A Essential Question central formulada na fase Engage orienta todas as etapas do projeto EvidencIA [EV: documentation:docs/visão/essential-question-alignment.md#alinhamento-com-a-essential-question@9e95b68]:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?"*

A resposta construída pelo projeto, fundamentada nas evidências investigadas, estrutura-se em torno do princípio da **investigação assistida**:

1. **A IA como organizadora e facilitadora, nunca como árbitra da verdade:** O papel legítimo da IA não é emitir um selo binário ou um score de veracidade sobre o vídeo, mas sim decompor narrativas complexas em alegações atômicas verificáveis, recuperar evidências factuais rastreáveis de fontes qualificadas e expor concordâncias e contradições [EV: documentation:docs/visão/guiding-questions.md#guiding-questions@9e95b68].
2. **Preservação da agência humana através de perguntas reflexivas:** Em vez de receber uma pontuação sintetizada que induz à aceitação passiva, o usuário é confrontado com perguntas orientadoras que estimulam a reflexão crítica contextual (autoria, temporalidade, ausência de evidências) [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-1-fim-do-score-global@9e95b68].
3. **Transparência epistêmica:** O sistema comunica abertamente os limites da sua base de evidências, tratando a ausência de registros não como atestado de falsidade, mas como estado explícito de evidência insuficiente [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-2-unidade-alegação-evidências@9e95b68].

---

## 2. As 12 Guiding Questions (GQs): Aprendizado, Evidência e Decisões

A tabela abaixo sintetiza o ciclo investigativo das 12 perguntas orientadoras derivadas na etapa Engage [EV: documentation:docs/visão/guiding-questions.md#guiding-questions@9e95b68]:

| GQ | Guiding Question | O que aprendemos | Evidência | Decisão Derivada |
|:---|:---|:---|:---|:---|
| **GQ01** | O que torna uma informação de vídeo difícil de avaliar? | Vídeos combinam múltiplas alegações simultâneas em discursos emotivos e contínuos. | [EV: documentation:docs/visão/guiding-questions.md#gq01-dificuldade-de-avaliação-em-vídeos@9e95b68] | Decompor a transcrição em alegações atômicas individuais no schema. |
| **GQ02** | O usuário precisa de um "veredito" ou de evidências para investigar? | Vereditos algorítmicos geram confiança cega ou ceticismo desnecessário, substituindo o raciocínio. | [EV: documentation:docs/visão/guiding-questions.md#gq02-e-gq11-autonomia-crítica-vs-veredito@9e95b68] | Eliminar formalmente o score global de confiabilidade e gauges visuais. |
| **GQ03** | O que a IA pode automatizar sem substituir o julgamento? | A LLM opera como assistente de linguagem (extração e síntese), nunca como repositório de verdade. | [EV: documentation:docs/visão/guiding-questions.md#gq03-e-gq07-o-papel-da-ia-e-mitigacao-de-alucinacao@9e95b68] | RAG factual em bases de checagem; modelo generativo atua como formulador auxiliar. |
| **GQ04** | Que evidência é relevante para português brasileiro? | Corpora genéricos ou em outras variantes (como PT-EU) divergem morfossintaticamente e em contexto local. | [EV: documentation:docs/visão/guiding-questions.md#gq04-evidências-em-portugues-brasileiro@9e95b68] | Adotar FactChecks.br como fonte de checagem e Fake.br para análise linguística. |
| **GQ05** | O que significa "não encontramos evidência"? | Ausência de evidência em bases curadas não significa falsidade do fato. | [EV: documentation:docs/visão/guiding-questions.md#gq05-ausência-de-evidência-vs-falsidade@9e95b68] | Criar no contrato de dados o estado explícito `insufficient_evidence`. |
| **GQ06** | Como lidar com fontes conflitantes? | Checagens sobre o mesmo tópico podem ter escopos temporais ou metodologias divergentes. | [EV: documentation:docs/visão/guiding-questions.md#gq06-fontes-conflitantes-e-controversias@9e95b68] | Painel exibe relações supports, contradicts e contextualizes simultaneamente. |
| **GQ07** | Como evitar que a LLM alucine uma checagem? | Forçar grounding obrigatório e desacoplar extração de alegações da validação factual. | [EV: documentation:docs/visão/guiding-questions.md#gq03-e-gq07-o-papel-da-ia-e-mitigacao-de-alucinacao@9e95b68] | Interface abstrata `LLMProvider` e proibição de mock em produção. |
| **GQ08** | Como o usuário exerce pensamento crítico? | Usuários investigam melhor quando estimulados por perguntas reflexivas abertas sobre o conteúdo. | [EV: documentation:docs/visão/guiding-questions.md#gq08-perguntas-orientadoras-e-pensamento-crítico@9e95b68] | Promoção da história HU11 de Could Have para Must Have do MVP. |
| **GQ09** | Como medir se a recuperação funciona? | Métricas clássicas de Information Retrieval são essenciais para auditar a assertividade do RAG. | [EV: documentation:docs/visão/guiding-questions.md#gq09-métricas-de-recuperação-e-avaliação@9e95b68] | Inclusão de cálculo formal de Recall, MRR e nDCG no plano de EDA. |
| **GQ10** | Como lidar com conteúdo antigo? | Fatos evoluem e alegações antigas não podem ser julgadas com dados anacrônicos. | [EV: documentation:docs/visão/guiding-questions.md#gq10-contextualizacao-temporal-e-anacronismo@9e95b68] | Atributo obrigatório `TemporalContext` associado a cada alegação. |
| **GQ11** | Qual é o papel do usuário? | O usuário é o sujeito epistêmico ativo e investigador final do processo de avaliação. | [EV: documentation:docs/visão/guiding-questions.md#gq02-e-gq11-autonomia-crítica-vs-veredito@9e95b68] | Arquitetura Evidence-First estruturada em torno de Evidence Cards. |
| **GQ12** | Qual é o limite do produto? | A ferramenta não substitui a checagem profissional humana e não audita dados em tempo real. | [EV: documentation:docs/visão/guiding-questions.md#gq12-limites-eticos-e-operacionais-do-produto@9e95b68] | Eliminação de termos como "detector de fake news" da documentação e da interface. |

---

## 3. O que Mudou de Decisão por Causa da Investigação

A investigação exploratória gerou uma cadeia causal contínua entre hipóteses iniciais, achados e decisões de arquitetura e UX [EV: documentation:docs/visão/decision-log.md#tabela-de-decisões@9e95b68]:

- **Cadeia GQ02 / GQ11 → Auditoria CBL → ADR-006 → Fim do Gauge:** O projeto original previa um gauge com score numérico de 0 a 100 na extensão [EV: EvidencIA:extension/src/panel/components/Gauge.tsx@27c53e8]. A constatação de que scores únicos violam a autonomia do usuário levou ao ADR-006, determinando a substituição completa do gauge por Evidence Cards individuais [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-1-fim-do-score-global@9e95b68].
- **Cadeia GQ08 → Essential Question → ADR-006 → Promoção de HU11:** A funcionalidade de perguntas reflexivas para o espectador estava classificada como Pós-MVP no planejamento inicial. Reconheceu-se que perguntas orientadoras são o mecanismo primário de apoio ao pensamento crítico, promovendo HU11 a requisito nuclear do MVP [EV: documentation:docs/técnico/decisões/ADR-006-evidence-first-architecture.md#decisão-5-promocao-da-hu11-para-o-mvp@9e95b68].
- **Cadeia GQ04 → Análise de Datasets → sources.yaml → Separação de Papéis:** A análise dos corpora revelou que Fake.br não contém checagens de fatos com URLs rastreáveis, sendo um corpus de estilo linguístico. Isso motivou o registro em sources.yaml definindo Fake.br estritamente como `linguistic_corpus` e FactChecks.br como fonte de checagem [EV: EvidencIA:backend/ml/datasets/sources.yaml#fakebr@27c53e8].
- **Cadeia GQ07 → Identificação de Mocks → ADR-006 → Provider Abstraction:** A existência de fallback silencioso e mocks não declarados violava a integridade da ferramenta. Decidiu-se instituir a interface `LLMProvider`, bloqueando mocks em produção sob exceção explícita `MockInProductionError` [EV: EvidencIA:backend/app/services/providers/factory.py#get_provider@27c53e8].
- **Cadeia GQ09 → Protocolo Act → Experimento Pré-Registrado:** A necessidade de testar cientificamente a hipótese de preservação do pensamento crítico exigiu o desenho de um ensaio controlado com telemetria local estrita [EV: documentation:docs/cbl/act/experiment-plan.md#plano-experimental@9e95b68].

---

## 4. Resultado da Validação Experimental (Fase Act)

Conforme as regras de governança acadêmica pré-registradas na especificação experimental [EV: documentation:docs/cbl/act/metrics-definition.md#regras-de-decisão-pre-registradas@9e95b68]:

> **Status na Fase SCAFFOLD:**  
> `PENDENTE — depende de: docs/cbl/act/results.md e execução do protocolo experimental com participantes humanos.`

Quando o estudo for concluído em campo, os dados serão consolidados no sumário JSON e transcritos para `results.md` sem reinterpretação. O veredito pré-registrado aplicará rigorosamente a regra:
- **GO:** Preservação ou ganho de acurácia com aumento estatisticamente significante de tempo de reflexão e expansão de fontes.
- **INVESTIGAR:** Efeito positivo sem significância estatística ou indícios de sobrecarga cognitiva.
- **NO-GO:** Redução de acurácia, delegação acrítica de julgamento ou tempo de reflexão inferior ao controle.

---

## 5. O que NÃO Conseguimos Demonstrar

Em respeito estrito ao princípio da honestidade intelectual e integridade técnica:

1. **Validação com Amostra Humana Concluída:** Na presente data da fase SCAFFOLD, o experimento de campo com participantes humanos ainda não foi executado. Nenhuma alegação de eficácia comportamental sobre usuários reais pode ser legitimamente afirmada [EV: documentation:docs/cbl/act/experiment-plan.md#criterios-de-prontidao@9e95b68].
2. **Remoção Física Completa do Componente Legacy na Extensão:** Embora o contrato conceitual e a decisão arquitetural ADR-006 proíbam o score global, o arquivo físico `Gauge.tsx` ainda reside na árvore legada da extensão aguardando a finalização da Sprint 2 [EV: EvidencIA:extension/src/panel/components/Gauge.tsx@27c53e8].
3. **Latência de Recuperação em Produção com Modelo Local:** Em virtude do peso computacional de inferência do modelo local (Qwen 2.5-3B via Ollama), o pipeline sob hardware convencional sem GPU dedicada não atinge de forma consistente a meta de latência P90 inferior a 10 segundos, exigindo investigação de modelos destilados ou serviços remotos de inferência [EV: documentation:docs/scrum/sprint-01/review.md#incremento-demonstrado@9e95b68].

---

## 6. Ameaças à Validade

As seguintes ameaças foram identificadas metodologicamente no documento de limitações [EV: documentation:docs/cbl/act/limitations.md#limitacoes-metodológicas@9e95b68]:

1. **Validade Interna (Efeito Novidade e Heurística de Interface):** Participantes expostos aos Evidence Cards podem despender mais tempo analisando o conteúdo não por reflexão espontânea, mas pelo formato inovador dos componentes em relação à interface padrão do YouTube.
2. **Validade Externa (Restrição Temática e de Plataforma):** Os dados de validação baseiam-se em fact-checks brasileiros existentes (FactChecks.br). Notícias hiperlocais ou vídeos de nicho sem cobertura prévia por agências cairão invariavelmente no estado de `insufficient_evidence`.
3. **Validade de Constructo (Medição Indireta do Pensamento Crítico):** O pensamento crítico é inferido operacionalmente através de métricas de telemetria (tempo de visualização do card, expansão de fontes, divergência deliberada). Essa aproximação pode sofrer ruído caso o usuário deixe a interface aberta sem engajamento cognitivo real.

---

## 7. Reflexão Metodológica sobre CBL e Scrum

A integração entre a abordagem pedagógica Challenge Based Learning (CBL) e o framework ágil Scrum revelou complementaridades fundamentais registradas nas cerimônias [EV: documentation:docs/scrum/sprint-01/retrospective.md#o-que-funcionou-bem@9e95b68]:

- **CBL forneceu propósito e ancoragem ética:** Enquanto o Scrum tradicional foca na cadência de entrega de incrementos, o CBL garantiu que o time não se perdesse na entrega de funcionalidades descoladas do propósito educacional. A constante referência à Essential Question preveniu que o produto derivasse para um mero "detector autoritário de mentiras".
- **Scrum viabilizou disciplina e previsibilidade técnica:** O CBL não prescreve a mecânica de desenvolvimento de software. A introdução formal de Product Backlog, Definition of Done e revisões de sprint impediu o prolongamento indefinido das pesquisas exploratórias, forçando o time a converter hipóteses acadêmicas em contratos de dados e testes automatizados.
- **Oportunidades de melhoria observadas:** A estimativa de Story Points para atividades puramente investigativas (como EDA e revisão de literatura) apresentou volatilidade na Sprint 1, sugerindo o uso de spikes com time-box fixo em iterações futuras [EV: documentation:docs/scrum/sprint-01/retrospective.md#o-que-pode-melhorar@9e95b68].

---

## 8. Implicações Éticas e Autonomia Crítica

O projeto EvidencIA posiciona-se em um debate ético central da Inteligência Artificial aplicada à esfera pública:

- **O risco do determinismo epistêmico:** Atribuir à IA a prerrogativa de categorizar conteúdos como "verdadeiros" ou "falsos" por meio de scores numéricos cria uma relação de tutela algorítmica sobre a opinião cidadã. Em regimes democráticos, o discernimento deve ser exercido pelos indivíduos com apoio em fatos plurais e verificáveis.
- **Privacidade e LGPD:** O monitoramento de hábitos de consumo de informação é altamente sensível. A telemetria desenhada no projeto opera estritamente sob arquitetura local, sem envio de eventos para servidores externos e com anonimização mandatória de qualquer identificador pessoal [EV: documentation:docs/cbl/act/telemetry-spec.md#especificação-de-telemetria@9e95b68].

---

## 9. Próximos Passos

Para além da fase de encerramento do presente ciclo:

1. **Execução de Campo do Act:** Aplicação do protocolo com 10 ou mais participantes por grupo sob o comitê de ética e consentimento informado [EV: documentation:docs/cbl/act/participant-protocol.md#protocolo-do-participante@9e95b68].
2. **Conclusão da Sprint 2 na Extensão:** Mesclagem do pacote de issues de Evidence Cards (#35), Reflection Questions (#36) e desativação física do componente Gauge (#34).
3. **Expansão da Cobertura de Retrieval:** Integração do modelo multimodal com transcrições automáticas de áudio via Whisper local (HU05) para vídeos sem legendas oficiais fornecidas pelo criador.
