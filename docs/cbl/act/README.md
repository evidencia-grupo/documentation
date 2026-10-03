<!-- nav:start -->
[Voltar ao Índice CBL](../README.md) · [Voltar ao Índice Mestre](../../index.md)
<!-- nav:end -->

# Experimento CBL (Fase Act) — Avaliação Comportamental Evidence-First vs. Veredito

## Visão Geral

Este diretorio contem os artefatos metodológicos, especificações de telemetria, templates de análise e critérios de governança para a fase **Act** do framework *Challenge-Based Learning* (CBL) no projeto **EvidencIA**.

O objetivo primordial deste experimento e responder de forma empirica e controlada a Essential Question do projeto:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?"*

Para isso, compara-se uma interface orientada a evidências e reflexão (**Condição B — Evidence-First**) contra uma interface orientada a veredito algoritmico (**Condição A — Controle com Gauge e Score Global**).

---

## Documentos do Experimento

1. [Plano do Experimento (experiment-plan.md)](experiment-plan.md): Contexto científico, hipóteses H1 a H5, desenho experimental entre sujeitos (between-subjects) e especificação das condições de teste.
2. [Protocolo do Participante (participant-protocol.md)](participant-protocol.md): Roteiro cronometrado para o facilitador, scripts neutros e procedimento de pseudonimização offline.
3. [Definição de Métricas e Regra de Decisão (metrics-definition.md)](metrics-definition.md): Formalização matemática das métricas M1 a M9, fórmulas e regra de decisão pré-registrada.
4. [Especificação de Telemetria (telemetry-spec.md)](telemetry-spec.md): Catálogo de eventos, schemas de envelope, política estrita de privacidade (zero PII, zero rede) e mapeamento evento-métrica.
5. [Limitações Metodológicas (limitations.md)](limitations.md): Análise a priori das ameaças à validade interna, externa e de construto.

---

## Principios Rigorosos de Governança e Conformidade

1. **Não Fabricacao de Dados**: Todos os templates contem apenas variáveis reservadas (`{{PREENCHER}}`) e fixtures sinteticas marcadas com `"synthetic": true`. Nenhum dado real de usuário e gerado ou citado nesta etapa.
2. **Pre-Registro e Travamento**: As hipoteses e limiares descritos nestes documentos são propostos e exigem ratificacao humana antes do congelamento com a tag Git `act-prereg-v1`. Nenhuma alteracao de limiar e permitida após o travamento sem registro formal de desvio.
3. **Privacidade e LGPD**: Coleta restrita a participantes adultos (maiores de 18 anos), precedida de consentimento livre e esclarecido. Telemetria anonimizada/pseudonimizada por design, sem transmissao por rede externa, sem captura de texto livre, URLs ou identificadores de midia.
4. **Isolamento de Arquitetura**: A Condição A (controle com gauge) existe estritamente como prototipo estatico isolado em `experiments/control-gauge-prototype/` no repositorio `EvidencIA`, documentada na Decisão D-008 do `decision-log.md`, sem qualquer poluicao do código de produção da extensão.
5. **Padrão Textual**: Em estrita conformidade com o pipeline corporativo de integração continua (`ci-docs.yml`), nenhum simbolo de emoji e utilizado nesta documentação.
