# Transcrição e validação por alegação

## Origem da fala

A extensão lê os dados do player no mundo MAIN e confirma que o ID corresponde ao vídeo da URL. Seleciona uma faixa em português quando existe; usa a primeira faixa disponível como alternativa de idioma. Só aceita URL de legendas na origem YouTube e caminho `/api/timedtext`.

A resposta da faixa é a única origem de `transcript`. A descrição não é coletada nos metadados e não é usada em caso de legenda vazia, curta, inválida ou indisponível. Título, canal, data conhecida e duração são metadados separados, não material para inventar alegações.

## Formatos e tempos

- XML tradicional usa `text`, `start` e `dur` em segundos.
- SRV3 usa `p`, `t` e `d` em milissegundos.
- JSON3 concatena `utf8` dentro de cada evento sem inserir espaços no meio de palavras; eventos são separados por espaço.
- Texto válido sem tempos completos pode ser analisado sem timestamp. Segmentos negativos, ausentes, divergentes ou inválidos não geram tempo estimado.
- Menos de 50 caracteres encerra com erro recuperável, alinhado ao contrato HTTP. Não substitui por descrição nem inventa texto.

## Fluxo até a validação

O cliente envia `transcript` e, quando completos, `segments` para `/api/v1/analyze`. O backend confere ordenação, duração e correspondência do texto com os segmentos. Os provedores recebem a transcrição inteira aceita pelo contrato (até 100.000 caracteres), sem corte silencioso nos primeiros 2.500. Falhas ou excesso de contexto do provedor acionam contingência; não demonstram execução de LLM real.

Na contingência, cada alegação extraída da fala tem sua própria consulta de recuperação. Uma checagem recuperada não vira texto do vídeo. Observações linguísticas e contexto temporal são copiados por alegação, sem vazamento para as demais.

## Cache e regressões

Cache versão 3 invalida versões anteriores, inclusive resultados potencialmente originados na descrição. O E2E captura o corpo HTTP enviado pela extensão: com legenda SRV3, texto e tempos devem coincidir; com legenda vazia e descrição longa, não pode haver POST de análise.

Testes de provedores verificam afirmações no fim de transcrições maiores que 2.500 caracteres. Regressões também verificam palavras divididas em JSON3, tempos SRV3, isolamento das fontes por alegação e isolamento de observações linguísticas.
