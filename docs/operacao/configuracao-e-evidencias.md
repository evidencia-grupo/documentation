# Configuração de IA e evidências

Inicie com mock para desenvolver e testar a extensão. Esse provedor sinaliza demonstração. Para testar inferência real, configure o provedor e o modelo disponíveis no seu ambiente.

## Diagnóstico

Na raiz da aplicação:

```bash
backend/.venv/bin/python scripts/check_readiness.py
backend/.venv/bin/python scripts/check_readiness.py --check-services
```

O comando não exibe credenciais. Com --check-services, consulta /api/tags no Ollama e a coleção evidencia no Chroma instalado. A existência do diretório de índice não comprova uma coleção populada. A existência da chave externa não comprova validade, quota ou disponibilidade da API. --require-live retorna erro quando faltam pré-requisitos locais; não certifica produção ou qualidade científica.

## Ollama

```bash
ollama list
ollama pull qwen2.5:3b
```

Use OLLAMA_MODEL=qwen2.5:3b após a instalação, ou um nome efetivamente listado por ollama list. Defina LLM_PROVIDER=ollama no .env local. Um nome ausente produz falha recuperável e pode acionar contingência. Receber a transcrição completa não garante que o contexto de qualquer modelo suporte 100.000 caracteres; um erro do provedor permanece explícito no resultado.

## Evidências rastreáveis

Configure GOOGLE_FACT_CHECK_API_KEY somente no .env privado ou gerenciador de segredos. Para busca local, instale backend/requirements-ml.txt e prepare dados ClaimReview ou FactChecksBR com URL, texto da alegação, origem e metadados. Verifique termos de uso e procedência antes da ingestão. Na pasta backend:

```bash
python -m ml.datasets.ingest --source claimreview --input-dir data/bronze/claimreview --output-dir data/silver
python -m ml.retrieval.index --collection evidencia --silver-dir data/silver
```

Use apenas o diretório silver destinado a evidências; notícias Fake.br são benchmark de classificação linguística e não substituem uma checagem de uma fala. Sem fontes adequadas, insufficient_evidence é um resultado válido. Para avaliar busca, anote relevância e relação entre alegação e evidência de forma independente e execute scripts/evaluate_retrieval.py com esse gold set.
