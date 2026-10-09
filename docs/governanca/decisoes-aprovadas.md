# Decisões humanas - EvidencIA

Data: 09/10/2026. O usuário declarou "tudo já foi aprovado" e autorizou a remediação integral. As decisões estão aprovadas para o trabalho solicitado; o registro abaixo distingue aprovação de execução.

| Gate | Aprovação informada | Execução / evidência atual |
|---|---|---|
| H1 - acesso | Aprovado pelo usuário | Tokens de instalação anônimos e renovação implementados; não comprovam identidade |
| H2 - dados | Aprovado pelo usuário | Corpus local exportado com origem declarada e limites de proveniência; não foram anexados documentos jurídicos novos |
| H3 - avaliação | Aprovado pelo usuário | Modelo local avaliado em teste separado; gold de retrieval não contém anotações humanas e permanece sem métricas empíricas |
| H4 - privacidade | Aprovado pelo usuário | Nenhuma chave do chat salva; respostas de erro não expõem upstream; cache local com TTL; backend não persiste transcrições |
| H5 - infraestrutura | Aprovado pelo usuário | Código exige valores reais de produção; Docker não executado porque não há daemon; nenhum deploy realizado |
| H6 - usuários | Aprovado pelo usuário | Testes de interface automatizados; não foram fabricados resultados de experimento com participantes |

O registro anterior está preservado em docs/auditorias/historico/0ffe395/HUMAN-DECISIONS.md. Aprovação não é convertida em dado que não foi coletado.
