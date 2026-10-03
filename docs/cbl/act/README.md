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

## Ordem Recomendada de Leitura

Para membros da equipe, revisores técnicos, orientadores e auditores, a leitura deve seguir a seguinte sequencia logica:

1. [Plano do Experimento (experiment-plan.md)](experiment-plan.md): Contexto científico, hipoteses H1 a H5, desenho experimental entre sujeitos (between-subjects), especificação das condições A e B, e excecao controlada de arquitetura.
2. [Protocolo do Participante (participant-protocol.md)](participant-protocol.md): Roteiro cronometrado para o facilitador, scripts neutros verbatim, modelo de Termo de Consentimento Livre e Esclarecido (TCLE) e procedimento de pseudonimizacao offline.
3. [Definição de Métricas e Regra de Decisão (metrics-definition.md)](metrics-definition.md): Formalizacao matematica das métricas M1 a M9, formulas, tratamento de denominadores nulos e regra de decisão pre-registrada (GO / INVESTIGAR / NO-GO).
4. [Especificação de Telemetria (telemetry-spec.md)](telemetry-spec.md): Catalogo exato de eventos, schemas de envelope e propriedades, politica estrita de privacidade (zero PII, zero rede) e mapeamento evento-métrica.
5. [Template do Banco de Itens (item-bank-template.md)](item-bank-template.md): Estrutura para construção dos conjuntos de estimulos S1 (baseline), S2 (assistido) e S3 (transferencia), regras de balanceamento e rotulagem independente.
6. [Checklist Go / No-Go (go-no-go-act.md)](go-no-go-act.md): Critérios de prontidao pre-coleta e condições de parada/decisão pos-coleta.
7. [Limitacoes Metodológicas (limitations.md)](limitations.md): Análise a priori das ameacas a validade interna, externa e de construto.
8. [Template de Resultados (results-template.md)](results-template.md): Estrutura padronizada a ser preenchida exclusivamente após a execução dos scripts deterministas de análise.

---

## Principios Rigorosos de Governança e Conformidade

1. **Não Fabricacao de Dados**: Todos os templates contem apenas variáveis reservadas (`{{PREENCHER}}`) e fixtures sinteticas marcadas com `"synthetic": true`. Nenhum dado real de usuário e gerado ou citado nesta etapa.
2. **Pre-Registro e Travamento**: As hipoteses e limiares descritos nestes documentos são propostos e exigem ratificacao humana antes do congelamento com a tag Git `act-prereg-v1`. Nenhuma alteracao de limiar e permitida após o travamento sem registro formal de desvio.
3. **Privacidade e LGPD**: Coleta restrita a participantes adultos (maiores de 18 anos), precedida de consentimento livre e esclarecido. Telemetria anonimizada/pseudonimizada por design, sem transmissao por rede externa, sem captura de texto livre, URLs ou identificadores de midia.
4. **Isolamento de Arquitetura**: A Condição A (controle com gauge) existe estritamente como prototipo estatico isolado em `experiments/control-gauge-prototype/` no repositorio `EvidencIA`, documentada na Decisão D-008 do `decision-log.md`, sem qualquer poluicao do código de produção da extensão.
5. **Padrão Textual**: Em estrita conformidade com o pipeline corporativo de integração continua (`ci-docs.yml`), nenhum simbolo de emoji e utilizado nesta documentação.
