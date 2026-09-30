# ADR-005 — Adoção de Motor de IA Local (Ollama + Qwen 2.5-3B) e Datasets Brasileiros de Fact-Checking

| Campo | Valor |
|:---|:---|
| **Status** | Aceito |
| **Data** | 2026-09 |
| **Autores** | Equipe de Engenharia (IA & Backend Proxy) |
| **Revisores** | Comitê Técnico de Arquitetura |

---

## Contexto

O pipeline de verificação do EvidencIA necessita processar transcrições em português brasileiro, extrair alegações atômicas checáveis e redigir sínteses analíticas compreensíveis para públicos leigos (Dona Lurdes - HU02) e pesquisadores (Amanda - HU04), operando sob um teto estrito de latência no servidor de 8,0 segundos ([RNF-01](../../requisitos/catalogo-requisitos.md#rnf-01)).

Três desafios centrais demandavam decisão:
1. **Dependência e Custo de Provedores de Nuvem:** O acoplamento estrito a APIs proprietárias pagas de LLM impõe riscos de faturamento imprevisto, estrangulamento de quotas (*rate limits*) e vazamento de dados de usuários.
2. **Desalinhamento Cultural/Linguístico:** Modelos e bases de dados em inglês falham em capturar nuances de desinformação regional brasileira (ex.: receitas curativas caseiras, vocabulário do WhatsApp, órgãos reguladores nacionais como Anvisa e IBGE).
3. **Restrições de Versionamento do Repositório:** Pesos binários de modelos de linguagem variam de 2 a 6 GB, sendo inviável e proibido commitá-los no Git sob risco de bloqueio pelo GitHub (teto de 100 MB).

---

## Decisão

Adotar a seguinte arquitetura de Inteligência Artificial e governança de dados:

1. **Motor de Inferência Local: Ollama com `qwen2.5:3b`**
   - Execução local via API HTTP REST (`http://localhost:11434`), aproveitando o modelo **Qwen 2.5-3B-Instruct** quantizado em 4-bit (consumo de ~2.2 GB de RAM).
   - Suporte nativo a geração de JSON estruturado (`format: "json"`), eliminando falhas de parsing sintático.
   - Janela de contexto de até 32.768 tokens, processando vídeos longos sem truncamento de premissas.
   - Padrão defensivo de circuit-breaker: caso o daemon do Ollama esteja indisponível, o sistema degrada automaticamente para o classificador heurístico sem interromper a API.

2. **Priorização de Datasets Brasileiros**
   - **FactChecks.br (UFG / Agências IFCN):** Base de verdade factual contendo checagens reais da Agência Lupa, Aos Fatos e Boatos.org.
   - **Fake.br Corpus (NILC - USP São Carlos):** Referência acadêmica em PT-BR para calibração de estilo e sensacionalismo.
   - **ClaimPT:** Diretrizes de anotação de sentenças checáveis (*check-worthiness*).

3. **Governança MLOps no Repositório**
   - **Zero Binários no Git:** Regras no `.gitignore` impedem commits de arquivos `.safetensors`, `.bin` e `.gguf`.
   - **Amostra de Ouro Versionada:** O arquivo `backend/ml/datasets/sample_facts.json` (< 40 KB) acompanha o repositório, garantindo testes unitários rápidos e execução da esteira de CI/CD sem dependência de internet.
   - **Download Automatizado:** O script `backend/ml/datasets/dataset_downloader.py` gerencia o download sob demanda via Hugging Face Hub.

---

## Consequências

### Positivas
- **Independência Operacional e Custo Zero:** Desenvolvimento e testes ocorrem de forma 100% autônoma e offline.
- **Privacidade Assegurada (LGPD):** Nenhum dado de transcrição precisa trafegar para servidores terceiros não auditados.
- **Pertinência Cultural:** Alegações são confrontadas com agências que atuam diretamente no combate à desinformação brasileira.
- **CI/CD Ultrarrápido:** A esteira de integração contínua executa testes em milissegundos usando a base curada de amostra.

### Negativas e Mitigações
| Desvantagem | Mitigação |
|:---|:---|
| Desenvolvedores precisam ter o Ollama instalado para inferência generativa completa | O conector `ollama_service.py` possui fallback automático e gracioso para o classificador local heurístico caso o daemon não esteja ativo. |
| Modelos de 3B parâmetros podem ser ligeiramente mais lentos em CPUs antigas | O modelo é servido em quantização 4-bit (Q4_K_M) e o timeout máximo de 8,0s do backend proxy é rigorosamente monitorado. |

---

## Rastreabilidade com Requisitos do Sistema

- [RF-03 — Evidências em Linguagem Clara](../../requisitos/catalogo-requisitos.md#rf-03): Viabilizado pelas instruções em PT-BR no Qwen e síntese sem jargões.
- [RF-06 — Síntese Estruturada de Resultados](../../requisitos/catalogo-requisitos.md#rf-06): Suportado pelo retorno JSON tipado e fontes das agências brasileiras.
- [RNF-01 — Desempenho e Tempo de Resposta](../../requisitos/catalogo-requisitos.md#rnf-01): Mantido pelo processamento local ultrarrápido (< 100ms/token).
- [RNF-04 — Segurança e Gestão de Credenciais](../../requisitos/catalogo-requisitos.md#rnf-04): Nenhuma chave privada é exposta ao cliente.

---

**Referências:**
- [ADR-002 — Intermediação via Backend Proxy](ADR-002-backend-proxy.md)
- [ADR-004 — Definição da Stack Tecnológica](ADR-004-stack-tecnologica.md)
- [Pipeline de IA e Datasets Brasileiros](../ia-e-datasets.md)
- [Qwen 2.5 Model Family (Alibaba Cloud)](https://github.com/QwenLM/Qwen2.5)
- [Ollama Open Source LLM Runner](https://ollama.com/)
