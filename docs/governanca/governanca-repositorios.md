# Governança dos Repositórios e Práticas Comunitárias

Este documento estabelece o modelo formal de governança, divisão de responsabilidades, ciclo de contribuição, licenciamento e gestão de segurança adotados no ecossistema **EvidencIA**.

---

## 1. Topologia e Divisão de Responsabilidades

O projeto opera sob uma política estrita de separação de responsabilidades entre desenvolvimento e documentação técnica:

| Repositório | Escopo e Conteúdo | Governança Aplicável |
| --- | --- | --- |
| **EvidencIA** | Código-fonte da extensão (MV3), backend proxy (FastAPI), schemas Pydantic/TypeScript, suíte de testes (Vitest/Pytest/Playwright) e scripts de verificação. | [CONTRIBUTING.md](https://github.com/evidencia-grupo/EvidencIA/blob/main/CONTRIBUTING.md), [SECURITY.md](https://github.com/evidencia-grupo/EvidencIA/blob/main/SECURITY.md), [LICENSE](https://github.com/evidencia-grupo/EvidencIA/blob/main/LICENSE) |
| **documentation** | Arquitetura conceitual (C4), catálogo de requisitos, atas de decisões humanas (H1–H6), registros ADR (ADR-001 a ADR-006), modelagem de ameaças e entregáveis consolidados. | [CONTRIBUTING.md](https://github.com/evidencia-grupo/documentation/blob/main/CONTRIBUTING.md), [SECURITY.md](https://github.com/evidencia-grupo/documentation/blob/main/SECURITY.md), [LICENSE](https://github.com/evidencia-grupo/documentation/blob/main/LICENSE) |

---

## 2. Política de Licenciamento

### Código-Fonte e Documentação
Tanto o código executável quanto os documentos técnicos do projeto são distribuídos sob a licença **MIT** (permissiva e aberta). Consulte os respectivos arquivos `LICENSE` na raiz de cada repositório.

### Proveniência e Licenciamento de Datasets (Portão Humano H2)
O modelo de machine learning e a suíte de avaliação utilizam corpora científicos e jornalísticos brasileiros com salvaguardas explícitas:
- **Fake.br-Corpus (NILC / USP São Carlos):** Utilizado exclusivamente para fins de pesquisa e extração de padrões estilísticos/linguísticos. Os dados brutos não são redistribuídos como pacote comercial.
- **FactChecks.br (UFG):** Corpus curado de checagens jornalísticas brasileiras (Agência Lupa, Aos Fatos, Boatos.org). O pipeline opera em conformidade com o Portão H2, mantendo atribuição rigorosa às agências publicadoras originais e hiperligações para as fontes primárias.
- **Google Fact Check Tools API:** Consulta complementar externa sob os Termos de Serviço da API do Google, exigindo autenticação por chave de servidor segura no backend proxy.

---

## 3. Gestão de Segurança da Informação

O projeto mantém compromisso com a privacidade dos usuários e a integridade do sistema:

1. **Zero Segredos no Cliente (ADR-002):** Nenhuma credencial de API, chave privada ou segredo operacional é embarcado na extensão.
2. **Conformidade com a LGPD (ADR-004):** A arquitetura foi concebida sem coleta ou retenção de dados pessoais identificáveis (PII). Os identificadores de instalação são efêmeros e anônimos.
3. **Reporte Responsável:** Vulnerabilidades de segurança devem ser comunicadas de forma confidencial através de `seguranca@evidencia.org` ou por GitHub Security Advisories privados, com SLA de resposta inicial em até 48 horas úteis.

---

## 4. Ciclo de Contribuição e Portões de Qualidade

Todas as contribuições submetidas via Pull Request devem satisfazer os seguintes critérios objetivos:

- **Conventional Commits:** Mensagens de commit estruturadas (`feat:`, `fix:`, `docs:`, `test:`, `chore:`).
- **Regra de Estilo e Comunicação:** Nenhuma utilização de emojis em código, documentação ou commits.
- **Testes Obrigatórios:** Testes unitários e de acessibilidade com 100% de sucesso.
- **Acessibilidade WCAG 2.1 AA:** Contraste mínimo de 4.5:1 para texto normal, navegabilidade por teclado e tags semânticas auditadas via `axe-core`.
- **Verificação de Drift (Fail-Closed):** O script `check_drift.py` não permite divergências entre contratos Pydantic, TypeScript e documentação.

---

## 5. Código de Conduta e Convivência

Adotamos formalmente o **Contributor Covenant (v2.1)** em todos os repositórios do projeto, garantindo um ambiente aberto, inclusivo e livre de qualquer forma de assédio ou discriminação. O canal de relato para condutas que violem este compromisso é `conduta@evidencia.org`.
