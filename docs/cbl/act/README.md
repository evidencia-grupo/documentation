<!-- nav:start -->
[Voltar ao Indice CBL](../README.md) · [Voltar ao Indice Mestre](../../README.md)
<!-- nav:end -->

# Experimento CBL (Fase Act) — Avaliacao Comportamental Evidence-First vs. Veredito

## Visao Geral

Este diretorio contem os artefatos metodologicos, especificacoes de telemetria, templates de analise e criterios de governanca para a fase **Act** do framework *Challenge-Based Learning* (CBL) no projeto **EvidencIA**.

O objetivo primordial deste experimento e responder de forma empirica e controlada a Essential Question do projeto:

> *"Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informacoes sem substituir seu pensamento critico?"*

Para isso, compara-se uma interface orientada a evidencias e reflexao (**Condicao B — Evidence-First**) contra uma interface orientada a veredito algoritmico (**Condicao A — Controle com Gauge e Score Global**).

---

## Ordem Recomendada de Leitura

Para membros da equipe, revisores tecnicos, orientadores e auditores, a leitura deve seguir a seguinte sequencia logica:

1. [Plano do Experimento (experiment-plan.md)](experiment-plan.md): Contexto cientifico, hipoteses H1 a H5, desenho experimental entre sujeitos (between-subjects), especificacao das condicoes A e B, e excecao controlada de arquitetura.
2. [Protocolo do Participante (participant-protocol.md)](participant-protocol.md): Roteiro cronometrado para o facilitador, scripts neutros verbatim, modelo de Termo de Consentimento Livre e Esclarecido (TCLE) e procedimento de pseudonimizacao offline.
3. [Definicao de Metricas e Regra de Decisao (metrics-definition.md)](metrics-definition.md): Formalizacao matematica das metricas M1 a M9, formulas, tratamento de denominadores nulos e regra de decisao pre-registrada (GO / INVESTIGAR / NO-GO).
4. [Especificacao de Telemetria (telemetry-spec.md)](telemetry-spec.md): Catalogo exato de eventos, schemas de envelope e propriedades, politica estrita de privacidade (zero PII, zero rede) e mapeamento evento-metrica.
5. [Template do Banco de Itens (item-bank-template.md)](item-bank-template.md): Estrutura para construcao dos conjuntos de estimulos S1 (baseline), S2 (assistido) e S3 (transferencia), regras de balanceamento e rotulagem independente.
6. [Checklist Go / No-Go (go-no-go-act.md)](go-no-go-act.md): Criterios de prontidao pre-coleta e condicoes de parada/decisao pos-coleta.
7. [Limitacoes Metodologicas (limitations.md)](limitations.md): Analise a priori das ameacas a validade interna, externa e de construto.
8. [Template de Resultados (results-template.md)](results-template.md): Estrutura padronizada a ser preenchida exclusivamente apos a execucao dos scripts deterministas de analise.

---

## Principios Rigorosos de Governanca e Conformidade

1. **Nao Fabricacao de Dados**: Todos os templates contem apenas variaveis reservadas (`{{PREENCHER}}`) e fixtures sinteticas marcadas com `"synthetic": true`. Nenhum dado real de usuario e gerado ou citado nesta etapa.
2. **Pre-Registro e Travamento**: As hipoteses e limiares descritos nestes documentos sao propostos e exigem ratificacao humana antes do congelamento com a tag Git `act-prereg-v1`. Nenhuma alteracao de limiar e permitida apos o travamento sem registro formal de desvio.
3. **Privacidade e LGPD**: Coleta restrita a participantes adultos (maiores de 18 anos), precedida de consentimento livre e esclarecido. Telemetria anonimizada/pseudonimizada por design, sem transmissao por rede externa, sem captura de texto livre, URLs ou identificadores de midia.
4. **Isolamento de Arquitetura**: A Condicao A (controle com gauge) existe estritamente como prototipo estatico isolado em `experiments/control-gauge-prototype/` no repositorio `EvidencIA`, documentada na Decisao D-008 do `decision-log.md`, sem qualquer poluicao do codigo de producao da extensao.
5. **Padrao Textual**: Em estrita conformidade com o pipeline corporativo de integracao continua (`ci-docs.yml`), nenhum simbolo de emoji e utilizado nesta documentacao.
