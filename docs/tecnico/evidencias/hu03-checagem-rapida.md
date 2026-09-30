# Evidências de Validação — HU03 (Checagem Rápida e Factual no Player)

| Campo | Detalhe |
|:---|:---|
| **História de Usuário** | [HU03 — Checagem Rápida e Factual no Player](../../requisitos/backlog-e-historias.md#hu03) |
| **Épico / Feature** | Épico 1 — Gatilho e Ativação / F2.1 — Disparo e Exibição Acessível WCAG |
| **Requisitos Validados** | [RF-01](../../requisitos/catalogo-requisitos.md#rf-01), [RF-09](../../requisitos/catalogo-requisitos.md#rf-09), [RNF-01](../../requisitos/catalogo-requisitos.md#rnf-01), [RNF-02](../../requisitos/catalogo-requisitos.md#rnf-02), [RNF-07](../../requisitos/catalogo-requisitos.md#rnf-07) |
| **Data da Homologação** | 2026-09-30 |
| **Ambiente de Teste** | macOS arm64, Node 24 LTS, Python 3.14, Chromium headless (Playwright) |

---

## 1. Resumo Executivo da Validação

A implementação da história de usuário **HU03** foi validada em ambiente controlado através de suítes de testes unitários (Vitest e Pytest), integração e testes end-to-end reais com Chromium via Playwright:

* **Confirmação Visual Imediata (RNF-01):** O botão de acionamento exibe feedback visual acessível em **12.0 ms** (P90 de 23.1 ms, amplamente abaixo do limite de 1.000 ms).
* **Recuperação por Cache Local (ADR-003 / RF-09):** Vídeos reincidentes são recuperados do `chrome.storage.local` em **13.8 ms** a **31.8 ms** (abaixo do teto de 100 ms), com bloqueio de novas requisições de rede.
* **Sobrecarga na Thread Principal (RNF-02):** Tarefas longas no YouTube controlado registraram **0 ms de excedente**, cumprindo o teto de $\text{TBT} \le 50\text{ ms}$.
* **Acessibilidade Digital (RNF-07):** Zero violações encontradas na auditoria automatizada via `axe-core` (WCAG 2.1 A/AA) no painel lateral e botão injetado, com suporte completo a teclado (`Tab`, `Shift+Tab`, `Enter`, `Espaço`, `Escape`).

---

## 2. Métricas de Latência e Desempenho (Amostra de 10 Execuções)

Valores consolidados em milissegundos utilizando o método *nearest-rank* para P90 em contexto Chromium descartável:

| Métrica Avaliada | Mínimo | P90 | Máximo | Limite Regulamentar | Veredito |
|:---|:---:|:---:|:---:|:---:|:---:|
| **Feedback Visual de Clique** | 13.9 ms | **23.1 ms** | 23.3 ms | $\le 1.000\text{ ms}$ (RNF-01) | **APROVADO** |
| **Síntese Útil com Cache Miss** | 426.0 ms | **435.8 ms** | 437.6 ms | $\le 10.000\text{ ms}$ (RNF-01) | **APROVADO** |
| **Recuperação Instantânea (Cache Hit)** | 13.8 ms | **31.8 ms** | 31.8 ms | $< 100\text{ ms}$ (ADR-003) | **APROVADO** |
| **Excedente de Tarefas Longas (TBT)** | 0.0 ms | **0.0 ms** | 0.0 ms | $\le 50\text{ ms}$ (RNF-02) | **APROVADO** |

---

## 3. Cobertura de Código e Testes Automatizados

* **Extensão (TypeScript / Preact / Vitest):**
    * 63 testes unitários aprovados em 7 suítes de teste.
    * 99,74% de cobertura de linhas/instruções.
    * 95,68% de cobertura de ramificações (*branches*).
    * 100% de cobertura de funções.
* **Backend Proxy (FastAPI / Pytest):**
    * 100% dos testes da suíte passando sem alertas (*warnings as errors*).
    * Cobertura de 97,62% com ramificações nos módulos core (`endpoints`, `schemas`, `fact_checker`).
* **Testes E2E (Playwright):**
    * 7 cenários completos no Chromium com extensão carregada em modo real (Service Worker MV3 ativo, iframe isolado e content script com Shadow DOM).

---

## 4. Auditoria de Acessibilidade (WCAG 2.1 AA)

* **Auditoria axe-core:** Zero violações registradas nos estados de carregamento (*spinner*), falha de legendas, resultado factual consolidado e classificações cromáticas.
* **Navegação por Teclado:**
    * `Escape`: Fecha o painel lateral e devolve o foco imediatamente ao botão de veracidade.
    * `Tab` / `Shift+Tab`: Navega de forma cíclica entre o botão de fechar e os links de fontes externas.
    * `Enter` / `Espaço`: Aciona o botão de checagem sem disparar atalhos globais do player do YouTube (como pause/play).
* **Contraste de Cores:** Vereditos cromáticos (Verdadeiro, Moderado, Falso, Inconclusivo) aderem à razão mínima de contraste de 4.5:1 exigida pelo critério de sucesso WCAG 1.4.3.

---

## 5. Como Reproduzir a Validação

No repositório de código `evidencia`:

```bash
# 1. Testes unitários e cobertura do frontend
cd extension
npm test

# 2. Testes automatizados do backend
cd ../backend
uv run pytest

# 3. Testes End-to-End no Chromium
cd ../extension
npx playwright test
```

---

**Ver também:**
* [Estratégia de Testes e DoD](../estrategia-testes.md)
* [ADR-003 — Estratégia de Cache Local](../decisoes/ADR-003-estrategia-cache-local.md)
* [Backlog e Histórias de Usuário](../../requisitos/backlog-e-historias.md)
