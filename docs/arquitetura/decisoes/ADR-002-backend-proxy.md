# ADR-002 — Intermediação via Backend Proxy Dedicado

| Campo | Valor |
|:---|:---|
| **Status** | Aceito |
| **Data** | 2026-09 |
| **Autores** | Equipe de Engenharia |
| **Revisores** | Comitê Técnico de Arquitetura |

---

## Contexto

A solução depende da utilização de modelos de linguagem de grande escala (LLMs) para segmentação de alegações e de provedores externos de busca para levantamento de fontes factuais. A integração com esses serviços exige credenciais de autenticação (chaves de API privadas) que possuem limites de faturamento e quotas de requisição.

Duas opções arquiteturais foram consideradas para a realização dessas chamadas:
1. **Chamada Direta a partir da Extensão:** O código JavaScript da extensão carrega a chave de API e consome diretamente o endpoint do provedor de IA.
2. **Intermediação via Backend Proxy:** A extensão comunica-se exclusivamente com uma API proprietária do produto, e o servidor atua como intermediário seguro (*proxy*) perante os serviços externos.

---

## Decisão

**Implementar um Backend Proxy dedicado** para intermediar toda comunicação entre a extensão cliente e os serviços de inteligência artificial e busca externa.

Principais diretrizes da implementação:
- O código da extensão nunca empacota chaves secretas ou credenciais de terceiros.
- O backend proxy implementa controle de acesso rigoroso, limitação de taxa (*Rate Limiting*) e verificação de assinatura da extensão cliente.
- O backend orquestra chamadas concorrentes para modelos de linguagem e provedores de busca, aplicando timeout rígido de 8 segundos para respeitar o SLA geral de 10 segundos ([RNF-01](../../requisitos/catalogo-requisitos.md#rnf-01)).

---

## Alternativas Consideradas

### Alternativa A — Chamada Direta Client-Side (Extensão ↔ LLM)

| Vantagens | Desvantagens |
|:---|:---|
| Sem necessidade de hospedar ou manter infraestrutura de backend próprio | **Vulnerabilidade Crítica:** Extensões no navegador têm código descompactável; qualquer chave de API inserida no cliente pode ser extraída por engenharia reversa em minutos |
| Menor custo inicial de desenvolvimento de servidor | Risco de esgotamento de quota ou cobranças financeiras ilimitadas por sequestro de credenciais |
| Menor complexidade operacional no primeiro momento | Impossibilidade de aplicar políticas centrais de governança, filtragem de prompts ou auditoria de abuso |

**Veredito:** Rejeitada categoricamente por violar os princípios fundamentais de segurança e governança ([RNF-04](../../requisitos/catalogo-requisitos.md#rnf-04)).

### Alternativa B — Usuário Fornece a Própria Chave ("Bring Your Own Key - BYOK")

| Vantagens | Desvantagens |
|:---|:---|
| Custos de consumo de IA transferidos para o usuário | Inviabiliza a adoção pelas personas primárias leigas (Dona Lurdes não possui conta em provedores de IA como OpenAI ou Google Cloud) |
| Chaves não ficam centralizadas | Atrito de onboarding extremamente elevado |

**Veredito:** Rejeitada para o escopo do MVP, pois contraria a proposta de valor de checagem acessível e sem fricção.

---

## Consequências

### Positivas

- **Segurança Absoluta de Credenciais:** As chaves de acesso a provedores de IA permanecem em variáveis de ambiente seguras no servidor.
- **Proteção contra Abuso e Custos Excessivos:** O backend proxy implementa limitadores de requisição (*Rate Limiting* por IP e por sessão), impedindo ataques de negação de serviço e consumo descontrolado.
- **Desacoplamento de Provedores:** Possibilidade de alternar entre diferentes fornecedores de modelos de linguagem (ex.: OpenAI, Anthropic, Gemini, modelos locais) sem a necessidade de lançar novas versões da extensão na Chrome Web Store.
- **Sanitização Centralizada:** O proxy pode aplicar regras unificadas de higienização de texto e filtragem de conteúdo ofensivo antes de encaminhar dados aos modelos.

### Negativas e Mitigações

| Consequência | Mitigação |
|:---|:---|
| Custo de hospedagem e manutenção de um serviço de backend | Utilização de infraestrutura escalável sem servidor (*Serverless* ou contêineres gerenciados) com consumo proporcional à demanda. |
| Ponto único de falha na cadeia de comunicação | Monitoramento ativo de saúde (*healthcheck*), redundância regional e fallback para mensagens informativas em caso de indisponibilidade ([RNF-06](../../requisitos/catalogo-requisitos.md#rnf-06)). |

---

**Referências:**

- [Catálogo Consolidado de Requisitos — RNF-04](../../requisitos/catalogo-requisitos.md#rnf-04)
- [Contrato de Dados e API](../contrato-api.md)
- [Threat Model e Segurança](../modelagem-ameacas.md)
