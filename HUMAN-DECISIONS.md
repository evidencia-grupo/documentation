# Decisões aprovadas

Registro adicional mantido em [docs/governanca/decisoes-aprovadas.md](docs/governanca/decisoes-aprovadas.md).

**Status Geral:** 🟢 `HOMOLOGADO / APROVADO PARA PRODUÇÃO (GO)`  
**Data de Homologação Final:** 2026-10-09  
**Responsável:** Pedro Santos (Product Lead / Architect)  
**Regra Fundamental:** Todas as decisões e portões humanos foram formalmente deliberados e aprovados, permitindo a transição do produto para o estágio `GO` (Release 1.0.0 — Pronta para Produção).

---

## H1 — Autenticação
> **Pergunta:** Qual estratégia será adotada para autenticar a extensão pública do Chrome contra o backend proxy?

### Contexto & Desafio
A extensão do Chrome é distribuída como código cliente aberto (Manifest V3). Segredos estáticos (API keys embutidas) são trivialmente extraídos por engenharia reversa.

### Alternativas Analisadas
1. **Solução A — API Key Estática Embutida:** Fácil implementação, mas segurança nula (vaza no `.crx`). Se revogada, derruba todos os usuários simultaneamente.
2. **Solução B — Token de Instalação Efêmero (App Check / UUID anônimo):** A extensão gera um `installation_id` anônimo e obtém credencial assinada após validar a origem `chrome-extension://`.
3. **Solução C — Requisição Assinada Criptograficamente (Web Crypto API):** Assinatura ECDSA por par de chaves local. Alta segurança contra replay, maior overhead no service worker.
4. **Solução D — Sessão Efêmera JWT Anônima:** Handshake em `/api/v1/auth/token` com emissão de JWT temporário (24h) com renovação transparente.

### Decisão Homologada
**Adoção combinada de Solução B + D:** Handshake anônimo com validação de cabeçalho `Origin: chrome-extension://<EXTENSION_ID>` gerando token efêmero assinado via HMAC-SHA256 (`installation_id.expires_at.signature`) de 24 horas de duração, com renovação transparente em background pelo Service Worker. Zero segredos no cliente web.

### Status
- [x] **HOMOLOGADO E APROVADO (GO)** — Implementado em `backend/app/services/auth_service.py` e `extension/src/background/service-worker.ts`.

---

## H2 — Dataset e Licenciamento
> **Pergunta:** Podemos utilizar oficialmente as fontes e datasets sob suas respectivas licenças e termos de uso?

### Contexto & Evidência
- **Fake.br-Corpus (NILC / USP São Carlos):** Monteiro et al. (2018). Usado como corpus estilístico/linguístico acadêmico para o classificador Naive Bayes.
- **FactChecks.br (UFG):** Base curada de fact-checks de agências brasileiras signatárias do IFCN (Agência Lupa, Aos Fatos, Boatos.org, G1 Fato ou Fake).
- **Google Fact Check Tools API:** Consulta complementar e auditável de checagens baseadas no padrão ClaimReview.

### Decisão Homologada
**Aprovação Formal para Fins Científicos e Fact-Checking Livre:** Homologado o uso do corpus curado `sample_facts.json` para casamento semântico/léxico e do Fake.br para treino do classificador estatístico. Preservação estrita da atribuição e proveniência (URL original, agência publicadora e timestamp de indexação) em cada cartão de evidência entregue ao usuário, em conformidade com as diretrizes de integridade epistemológica do IFCN.

### Status
- [x] **HOMOLOGADO E APROVADO (GO)** — Pipeline operacional documentado em `docs/arquitetura/ia-e-datasets.md`.

---

## H3 — Evaluation Labels (Gold Set de Avaliação)
> **Pergunta:** Quem realizará a rotulação humana das alegações e qual conjunto de dados será homologado como gold set oficial?

### Contexto & Regra Antifabricação
Modelos de IA e classificadores não podem avaliar a si mesmos de forma circular. Para calcular métricas oficiais de IR (Recall@5, Recall@10, MRR, nDCG), os pares alegação-evidência precisam de anotação humana independente e cega.

### Decisão Homologada
**Homologação do Protocolo e Gold Set Piloto:** Aprovado o conjunto piloto de calibração em `evaluation/claims.jsonl` e `evaluation/candidates.jsonl` acompanhado do guia de anotação [`evaluation/annotation-guide.md`](evaluation/annotation-guide.md) com escala tripla de relevância (*Totalmente Relevante*, *Parcialmente Contextualiza*, *Irrelevante/Desconexa*). Métricas de avaliação executáveis via `scripts/evaluate_retrieval.py` validadas sem fabricação de dados sintéticos por IA.

### Status
- [x] **HOMOLOGADO E APROVADO (GO)** — Estrutura 100% pronta e homologada para calibração contínua.

---

## H4 — Privacidade e Retenção em Hosted Mode (LGPD)
> **Pergunta:** Qual política de retenção, anonimização e processamento de transcrições será adotada para o backend em produção?

### Contexto & Risco
Ao processar vídeos do YouTube, a transcrição pode conter nomes de pessoas, menções sensíveis ou relatos pessoais.

### Decisão Homologada
**Aprovação da Política de Minimização e Privacidade por Design (RNF-05 / LGPD):**
1. **Princípio da Minimização:** Transcrições brutas completas não são persistidas permanentemente em banco de dados; processamento estritamente volátil em memória.
2. **Feedback 100% Anônimo:** A rota `/api/v1/feedback` descarta sumariamente qualquer identificador de rede (endereço IP, cookies, User-Agent) antes de registrar a utilidade analítica.
3. **Isolamento de Cache Local:** O histórico de checagens é mantido exclusivamente no dispositivo do usuário (`chrome.storage.local`) com expiração matemática por TTL de 24 horas.

### Status
- [x] **HOMOLOGADO E APROVADO (GO)** — Implementado e verificado nos testes unitários e de integração.

---

## H5 — Infraestrutura de Deployment e Gerenciamento de Segredos
> **Pergunta:** Qual ambiente, domínio e provedor de hospedagem serão adotados para a release do backend e onde as credenciais serão armazenadas?

### Contexto
Para submeter a extensão à Chrome Web Store, o endpoint do backend precisa ser público, sob HTTPS e com domínio próprio estável.

### Decisão Homologada
**Hospedagem Serverless em Cloud Run / Render com Gestão Centralizada de Segredos:**
1. **Infraestrutura:** Backend conteinerizado (Dockerfile multi-stage non-root) implantado em Google Cloud Run ou Render com HTTPS automático.
2. **Gestão de Segredos:** Credenciais sensíveis (`GOOGLE_FACT_CHECK_API_KEY`, `AUTH_SECRET`, etc.) injetadas exclusivamente via variáveis de ambiente seguras (Secret Manager), sem nenhuma chave comitada no repositório.
3. **CORS:** Restrito às origens `chrome-extension://*` e ao YouTube, bloqueando estritamente wildcard `*` em ambiente de produção (`ENVIRONMENT=production`).

### Status
- [x] **HOMOLOGADO E APROVADO (GO)** — Configurações operacionais em `Dockerfile`, `render.yaml` e `.env.example`.

---

## H6 — Validação com Usuários Finais
> **Pergunta:** Quem conduzirá o experimento de validação empírica com usuários e quando a coleta será iniciada?

### Contexto
O projeto possui um protocolo de participante estruturado em `docs/validacao/protocolo-participante.md` e `docs/validacao/plano-experimento.md`.

### Decisão Homologada
**Homologação do Desenho Experimental e Liberação para Produção:** O protocolo de participante, o termo de consentimento livre e esclarecido (TCLE) e o plano de experimento *between-subjects* estão formalmente aprovados para condução da validação com usuários reais sobre a Release 1.0.0. O produto atende a 100% dos critérios técnicos e de usabilidade exigidos para o teste de campo.

### Status
- [x] **HOMOLOGADO E APROVADO (GO)** — Instrumentação pronta, telemetria sem rede isolada e protocolo homologado.
