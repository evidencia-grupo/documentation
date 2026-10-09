# Scrum - evidências e entrega de remediação

Data: 09/10/2026. Há planos de Sprint 1 (28/09-02/10) e Sprint 2 (05/10-09/10) na documentação de origem. Esses registros não foram convertidos em atas de cerimônias que não acompanhavam os dados fornecidos.

## Objetivo desta iteração

Fechar falhas de integridade factual e contrato, organizar o desenvolvimento e entregar modelo/notebook/avaliação reproduzíveis.

## Backlog executado

| Pacote | Resultado de implementação |
|---|---|
| Integridade de IA | Catálogo neutro; grounding em trecho da transcrição; fallback usa texto do vídeo; hits externos contextualizam |
| Contratos | Geração de JSON Schema e TypeScript a partir de Pydantic, checada na CI |
| Extensão | Token renovável, segmentos reais, leitura de cache antecipada, teste de sender fortalecido |
| Backend | Limite HTTP, Redis configurável, validação de segredos e CORS, health corrigido, Docker non-root |
| CI e supply chain | Actions por SHA, permissões reduzidas, Vitest/Vite atualizados, lock de runtime |
| Documentação | Narrativas migradas com origem; READMEs enxutos; referências históricas preservadas |
| Entrega acadêmica | Notebook executado, modelo JSON, EDA, resultados por amostra, requisitos e Guiding Questions |

## Critério de concluído

Mudanças implementadas, testes pertinentes executados, artefatos abertos/verificados e limitações explicitadas. Aprovação informada pelo usuário em 09/10/2026 registrada; resultado de teste não é inferido dessa aprovação.

## Review e retrospectiva técnica

A leitura estática encontrou riscos que a cobertura alta não capturava. Mutação mostrou um teste assíncrono ineficaz. E2E detectou latência local no cache; leitura antecipada reduziu a serialização sem fazer a ausência de legendas esperar pelo cache. Contratos gerados reduziram manutenção manual. Não foram atribuídos nomes, cargos, pontos, burndown ou reuniões fictícias à equipe.

## Continuidade

Provisionar valores reais de produção e validar o serviço no ambiente escolhido; coletar gold set independente e registrar métricas e concordância. A entrega local não fabrica execução de Docker sem daemon ou chamadas LLM remotas.
