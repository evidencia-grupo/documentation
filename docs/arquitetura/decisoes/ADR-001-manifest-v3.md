# ADR-001 — Uso de Manifest V3

| Campo | Valor |
|:---|:---|
| **Status** | Aceito |
| **Data** | 2026-09 |
| **Autores** | Equipe Evidência |
| **Revisores** | — |

---

## Contexto

Extensões de navegador para Chrome, Edge e Brave são distribuídas através da Chrome Web Store e precisam aderir à especificação de extensões do Google. Existem atualmente duas versões dessa especificação:

- **Manifest V2 (MV2):** versão legada; suporte encerrado pelo Google a partir de junho de 2025 na Chrome Web Store.
- **Manifest V3 (MV3):** versão atual; substitui `background page` persistente por **Service Worker** com ciclo de vida gerenciado pelo browser, introduz `declarativeNetRequest` em lugar da `webRequest` bloqueante e restringe APIs de injeção de scripts.

A extensão de Fact-Checking precisa ser publicável na Chrome Web Store e funcionar nos três navegadores-alvo (Chrome, Edge, Brave) ao longo da vida útil do produto.

---

## Decisão

**Usar Manifest V3 com Service Worker** como arquitetura base da extensão.

Principais implicações técnicas:

- O arquivo `manifest.json` declara `"manifest_version": 3`
- A lógica de fundo reside em um **Service Worker** (não em `background.js` persistente)
- As permissões são declaradas em `host_permissions` com escopo restrito: `"https://www.youtube.com/*"`
- A injeção de UI usa `chrome.scripting.executeScript` com `activeTab` (sem `all_urls`)
- Comunicação entre content script e Service Worker via `chrome.runtime.sendMessage`

---

## Alternativas Consideradas

### Alternativa A — Manifest V2

| Prós | Contras |
|:---|:---|
| API mais permissiva e madura | Deprecado — removido da Chrome Web Store em 2025 |
| Background page persistente simplifica gerenciamento de estado | Extensões MV2 não são aceitas para publicação a partir de jun/2025 |
| Documentação abundante e exemplos maduros | Suporte em declínio; Edge e Brave seguem o mesmo cronograma do Chrome |

**Rejeitada:** publicar com MV2 bloquearia a distribuição via Chrome Web Store no curto prazo.

### Alternativa B — MV3 + Firefox WebExtensions (cross-browser)

| Prós | Contras |
|:---|:---|
| Alcance maior (Firefox incluído) | APIs divergem em pontos críticos (Service Worker vs. background script persistente no Firefox) |
| Uma base de código para todos os browsers | Requer abstração de compatibilidade (ex.: `webextension-polyfill`) — complexidade adicional no MVP |

**Rejeitada para o MVP:** o esforço de compatibilidade cross-browser seria desproporcional para a validação inicial. Firefox pode ser adicionado na Onda 2 com a camada de polyfill.

---

## Consequências

### Positivas

- Extensão elegível para publicação imediata na Chrome Web Store
- Compatibilidade garantida com Chrome, Edge e Brave (os três navegadores-alvo do MVP)
- Menor footprint de memória: Service Workers são encerrados pelo browser quando ociosos
- Conformidade com a política de segurança mais recente do Google (CSP restrita, sem `eval`)

### Negativas e Mitigações

| Consequência | Mitigação |
|:---|:---|
| Service Worker tem ciclo de vida limitado (encerrado após ~30s ocioso) | Operações longas são iniciadas pelo content script via `sendMessage`; resultados são cacheados em `chrome.storage.local` antes do SW ser encerrado |
| `declarativeNetRequest` é menos flexível que `webRequest` | A extensão não precisa interceptar/modificar requisições de rede — apenas lê transcrições expostas pelo player; não há impacto prático |
| Curva de aprendizado para desenvolvedores acostumados com MV2 | Documentação técnica (este ADR + `arquitetura.md`) cobre as diferenças críticas |

---

**Referências:**

- [Chrome for Developers — Migrate to MV3](https://developer.chrome.com/docs/extensions/develop/migrate)
- [Chrome Web Store — MV2 deprecation timeline](https://developer.chrome.com/docs/extensions/develop/migrate/mv2-deprecation-timeline)
- [Arquitetura do Sistema](../arquitetura.md) — visão geral dos componentes
