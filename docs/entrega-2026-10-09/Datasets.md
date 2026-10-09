# Datasets - dados efetivamente incluídos

- training_local.csv: 139 exemplos de linguagem, 112 treino / 27 teste, seed 42. Colunas: id, text, label, category, source_declared, provenance_status, split.
- sample_facts.json: amostra local de 20 registros usada pelo matcher; links e resumos são conteúdo versionado, não checagens revalidadas externamente nesta entrega.
- sources.yaml: registro de fontes potenciais e papéis (Fake.br: linguagem; FactChecks.br: evidência; ClaimReview: complemento; ClaimPT: metodologia).
- retrieval_claims.jsonl e retrieval_candidates.jsonl: dados existentes para futura anotação; rótulos humanos não foram preenchidos artificialmente.
- metadata.json: contagens, protocolo, hash e origem do corpus exportado.

Os nomes em source_declared reproduzem o corpus local e não comprovam download oficial ou anotação humana independente. A aprovação declarada pelo usuário foi registrada; licença/distribuição documental de terceiros não foi inventada. Não foram baixados corpora externos completos para substituir silenciosamente os dados analisados.

SHA256 do CSV: `379f725f5568bea2c42c8aeff3d0aa78908086ad5735828a29fe68d53d818246`.
