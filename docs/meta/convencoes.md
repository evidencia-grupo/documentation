# Convenções de Engenharia, Nomenclatura e Documentação

- **Data de Vigência:** 2026-10-02
- **Escopo:** Ecossistema EvidencIA (`documentation` e `EvidencIA`)
- **Conformidade:** Padrão corporativo estrito — zero emojis, tipografia técnica, links rastreáveis e idempotência.

---

## 1. Nomenclatura de Pastas e Arquivos

1. **Padrão Obrigatório:** Todas as novas pastas e novos arquivos devem ser nomeados exclusivamente em **kebab-case** minúsculo (ex.: `mapa-do-projeto.md`, `item-bank-template.md`).
2. **Caracteres Proibidos:** Espaços em branco, caracteres especiais (`!`, `@`, `#`, `$`, `%`) e caracteres acentuados da língua portuguesa (`á`, `é`, `ç`, `õ`, etc.) são proibidos em novos nomes de arquivos.
3. **Preservação Histórica:** Nomes de pastas e arquivos pré-existentes **NUNCA são renomeados** (mesmo que sigam outros padrões), garantindo que referências em commits e históricos de branches permaneçam válidos.
4. **Exceções em Maiúsculas:** Somente arquivos consagrados na governança de projetos de software utilizam caixa alta: `README.md`, `CONTRIBUTING.md`, `KANBAN.md`, `BACKLOG.md`, `SECURITY.md`, `FREEZE.md`.

---

## 2. Mapa Arquitetural: Pasta -> Propósito -> Responsabilidade Técnica -> Fase CBL

| Diretório | Propósito Principal | Responsabilidade Técnica | Fase CBL Correspondente |
|:---|:---|:---|:---:|
| `docs/visao/` | Alinhamento com a Essential Question, GQs e log de decisões | Product Owner / Tech Lead | **Engage** |
| `docs/requisitos/` | Catálogo de RFs, RNFs, Casos de Uso e Matriz de Rastreabilidade | Engenharia de Requisitos | **Investigate** |
| `docs/tecnico/` | Modelos C4, Contrato de API, Threat Model e Estratégia de Testes | Arquitetura de Software | **Investigate** |
| `docs/tecnico/decisoes/` | Architecture Decision Records (ADRs) | Arquitetura / Tech Lead | **Investigate** |
| `docs/scrum/` | Cerimônias, Definition of Done, Backlogs e Sprints | Scrum Master / Equipe Ágil | **Investigate / Act** |
| `docs/design/` | Personas, jornadas do usuário e design system acessível | UI/UX Designer | **Investigate / Act** |
| `docs/planejamento/` | Matriz MoSCoW, plano de riscos e telemetria ética | Gestão de Produto | **Investigate** |
| `docs/cbl/act/` | Protocolo experimental, métricas M1 a M9 e telemetria | Pesquisa / Engenharia | **Act** |
| `docs/cbl/reflect-share/` | Síntese acadêmica, showcase, portfólio e auditoria final | Equipe Multidisciplinar | **Reflect & Share** |
| `docs/meta/` | Metadados, auditoria de repositório, convenções e propostas | Staff Engineer / Docs | **Transversal** |
| `backend/app/` | API FastAPI, endpoints de inferência e validação Pydantic | Backend Engineer | **Act** |
| `backend/ml/` | Catálogo de datasets, adapters e schemas de evidência | ML Engineer / Data Scientist | **Investigate / Act** |
| `extension/` | Extensão Preact MV3 para o YouTube | Frontend Engineer | **Act** |
| `analysis/act/` | Scripts de análise estatística determinística de telemetria | Data Analyst / Pesquisador | **Act / Reflect** |
| `scripts/audit/` | Motor automatizado de auditoria fail-closed | Quality / AppSec | **Reflect & Share** |

---

## 3. Legenda Formal de Status dos Artefatos

Em conformidade estrita com o pipeline corporativo, os status de documentos e componentes devem utilizar **exclusivamente rótulos textuais**, sem ícones ou emojis:

- **`EVIDENCIADO`**: Componente ou resultado executado com dados reais e comprovado por documentação formal com identificador `[EV: ...]`.
- **`IMPLEMENTADO`**: Código executável completo com suíte de testes automatizados associada e passando sem erros no CI.
- **`ESQUELETO`**: Arquivo ou módulo criado estruturalmente, mas que ainda possui marcadores de pendência, dados sintéticos ou falta de execução.
- **`PLANEJADO`**: Funcionalidade, documento ou experimento especificado formalmente em backlog ou ADR, mas ainda sem código-fonte.
- **`AUSENTE`**: Elemento previsto na arquitetura que ainda não possui arquivo físico criado no repositório.

> **Regra de Governança:** O rótulo `ACEITO` representa homologação humana privativa da banca examinadora ou do Tech Lead. O agente automatizado nunca se autoatribui o status `ACEITO`.

---

## 4. Convenção de Marcadores Idempotentes

Para viabilizar atualizações contínuas sem risco de corrupção de conteúdo, são adotados marcadores de blocos:

1. **Blocos de Navegação:**
   ```markdown
   <!-- nav:start -->
   ... links de índice e navegação ...
   <!-- nav:end -->
   ```
2. **Blocos Gerados Automaticamente:**
   ```markdown
   <!-- gen:<nome>:start -->
   ... conteúdo gerado deterministicamente ...
   <!-- gen:<nome>:end -->
   ```
3. **Marcadores de Evidência Auditável:**
   ```text
   [EV: <repo>:<caminho>#<ancora>@<sha>]
   ```
   *Exemplo:* `[EV: documentation:docs/cbl/act/results.md#m1-cross-check@81f2516]`
4. **Marcadores de Pendência Legítimos:**
   - `PENDENTE`: Aguarda execução de etapa futura.
   - `A preencher`: Campo reservado para resultado empírico ou minutagem.
   - `A DEFINIR`: Decisão técnica pendente de refinamento.
   - `{{...}}`: Variável de template a ser interpolada.
   - `TODO`: Tarefa de engenharia atribuída ao backlog.
   - `PROPOSTO`: Item submetido à apreciação do Tech Lead.
   - `A VALIDAR`: Hipótese aguardando teste comportamental.

---

## 5. Como Linkar entre Repositórios

1. **Links para Código em Desenvolvimento:** Utilizar links HTTP absolutos apontando para o branch estável `main` no GitHub:
   `https://github.com/evidencia-grupo/EvidencIA/blob/main/backend/ml/datasets/sources.yaml`
2. **Links de Evidência e Portfólio Estático:** Utilizar permalinks com o commit SHA fixado para garantir imutabilidade científica:
   `https://github.com/evidencia-grupo/EvidencIA/blob/60ae479f19652d9e61f551282d660ff6b539978f/analysis/act/compute_metrics.py`
3. **Proibições:**
   - Proibido o uso do esquema `file:///` em links de markdown.
   - Proibido o uso de caminhos relativos ascendentes que cruzem a raiz do repositório (ex.: `../../EvidencIA/...`), pois quebram no GitHub e no MkDocs estático.

---

## 6. Regras de Construção de Diagramas Mermaid

1. **Compatibilidade:** Usar exclusivamente sintaxe Mermaid nativa suportada pelo GitHub e pelo plugin `pymdownx.superfences` do MkDocs.
2. **Identificadores:** IDs de nós devem ser estritamente alfanuméricos simples (ex.: `nodeA`, `proc01`).
3. **Rótulos Textuais:** Sempre entre aspas duplas: `id["Texto do Nó"]`.
4. **Escopo e Legibilidade:** Limite de aproximadamente 25 nós por diagrama para preservar legibilidade em telas móveis e desktop.
5. **Nós Planejados:** Devem conter a anotação explícita `(planejado)` e estilo pontilhado: `style nodeX stroke-dasharray: 5 5`.
6. **Cabeçalho e Metadados:** Todo diagrama deve incluir título, legenda de status textual e anotação temporal:
   `Gerado em <DATA> sobre <sha-docs>/<sha-code>`.

---

## 7. Glossário de Siglas Fundamentais

| Sigla | Significado em Inglês | Significado e Aplicação no Projeto |
|:---|:---|:---|
| **GQ** | *Guiding Question* | Questão orientadora do CBL; desdobra a Essential Question em aspectos investigativos concretos (GQ01 a GQ12). |
| **HU** | *User Story* | História de Usuário; unidade de entrega do backlog Scrum com critérios de aceitação em formato Gherkin (HU01 a HU16). |
| **RF** | *Functional Requirement* | Requisito Funcional; comportamento observável esperado do software (RF-01 a RF-15). |
| **RNF** | *Non-Functional Requirement* | Requisito Não-Funcional; atributo de qualidade, segurança, performance ou privacidade (RNF-01 a RNF-11). |
| **UC** | *Use Case* | Caso de Uso; descrição formal de interações entre atores e o sistema em fluxos primários e secundários. |
| **ADR** | *Architecture Decision Record* | Registro formal de decisão arquitetural; documenta contexto, decisão, trade-offs e alternativas rejeitadas. |
| **EDA** | *Exploratory Data Analysis* | Análise Exploratória de Dados; investigação estatística prévia dos datasets antes da incorporação ao pipeline. |
| **SP** | *Story Points* | Pontos de história; métrica relativa de esforço e complexidade utilizada na estimativa do backlog Scrum. |
| **DoD** | *Definition of Done* | Definição de Pronto; conjunto de critérios obrigatórios de qualidade e validação que autorizam o encerramento de um item. |
