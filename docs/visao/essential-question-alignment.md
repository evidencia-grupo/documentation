# Alinhamento com a Essential Question — EvidencIA

## Nesta página

- [Essential Question](#essential-question)
- [Tabela DE / PARA — Proposta de Valor](#tabela-de-para)
- [Conflitos Atuais com a Essential Question](#conflitos-atuais)
- [Mudanças de Produto Decorrentes](#mudancas-de-produto)
- [O Que o Produto NÃO Faz](#o-que-nao-faz)
- [Wireframe Textual da Nova UX](#wireframe-ux)
- [Regra de Ouro](#regra-de-ouro)

---

## Essential Question {: #essential-question }

> **Como sistemas de IA podem ajudar as pessoas a avaliar a confiabilidade de informações sem substituir seu pensamento crítico?**

Esta pergunta define o **eixo central** de todas as decisões de produto, UX e arquitetura do EvidencIA. Qualquer feature que responda por um usuário — em vez de ajudá-lo a investigar — conflita com a Essential Question.

---

## Tabela DE / PARA — Proposta de Valor {: #tabela-de-para }

| Dimensão | DE (modelo anterior) | PARA (modelo evidence-first) |
|:---|:---|:---|
| **Proposta central** | "A IA diz quão verdadeiro é o vídeo" | "A IA ajuda o usuário a investigar o vídeo" |
| **Unidade de análise** | O vídeo inteiro (score global 0–100) | Cada alegação individual + suas evidências |
| **Saída principal** | Veredito algorítmico numérico (gauge/velocímetro) | Conjunto de evidências com relação explícita (sustenta/contradiz/contextualiza) |
| **Papel do usuário** | Receptor passivo de um veredito | Investigador ativo que formula a própria conclusão |
| **Papel da IA** | Autoridade factual que decide o grau de verdade | Assistente que organiza evidências e formula perguntas |
| **Incerteza** | Expressa como "confiança da IA" (% numérico) | Expressa como estado do conjunto de evidências (`insufficient_evidence`, fontes divergentes) |
| **Score global** | Presente como `score: number (0–100)` e `reliabilityScore` | **Removido** do contrato e da UX principal |
| **Perguntas reflexivas (HU11)** | Pós-MVP (Onda 3 / OUT) | **Must Have do MVP** — elemento central da UX |
| **Mock de IA** | Implícito / silencioso em desenvolvimento | Explícito, apenas em dev/testes, **proibido em produção** |
| **Provider de LLM** | Acoplado ao Ollama local | Desacoplado via interface `LLMProvider` |

---

## Conflitos Atuais com a Essential Question {: #conflitos-atuais }

A auditoria CBL identificou os seguintes conflitos entre a implementação anterior e a Essential Question:

### Conflito 1 — Gauge Numérico Global

O componente `Gauge.tsx` e o campo `score: number (0–100)` no contrato de API implementam um **veredito algorítmico único** para o vídeo inteiro. Isso é o oposto da investigação assistida: o usuário recebe uma resposta antes de examinar as evidências.

**Problema com a Essential Question:** "sistemas de IA que ajudam a avaliar a confiabilidade" pressupõe que o usuário avalia — não que a IA avalia e comunica o resultado.

### Conflito 2 — `FactCheckingSource.reliabilityScore`

O campo `reliabilityScore` nas fontes individualmente atribui um grau de confiabilidade a cada fonte, novamente de forma algorítmica. Isso retira do usuário a capacidade de julgar a credibilidade da fonte por seus próprios critérios.

**Problema com a Essential Question:** o campo reintroduz autoridade algorítmica no nível das evidências.

### Conflito 3 — Classificação única por alegação

A UX anterior apresentava cada alegação com uma classificação única ("Apoiada", "Contradita", "Sem comprovação"), que colapsa o conjunto de evidências em um rótulo. Alegações com fontes conflitantes recebiam um único rótulo, eliminando a complexidade que o usuário deveria investigar.

**Problema com a Essential Question:** a classificação única substitui o pensamento crítico em vez de estimulá-lo.

### Conflito 4 — HU11 fora do MVP

Ao colocar as perguntas orientadoras de reflexão crítica em "Pós-MVP / Onda 3", o produto anterior priorizava o veredito automático em detrimento do mecanismo que mais diretamente responde à Essential Question.

**Problema com a Essential Question:** o produto não estimularia o pensamento crítico na versão inicial.

### Conflito 5 — Mock silencioso em desenvolvimento

A existência de um mock implícito e não-documentado do provider de IA significava que testes e demonstrações poderiam usar respostas fabricadas sem sinalização clara, comprometendo a confiabilidade das evidências apresentadas.

**Problema com a Essential Question:** evidências fabricadas destroem a proposta de ajudar o usuário a avaliar a confiabilidade real de informações.

---

## Mudanças de Produto Decorrentes {: #mudancas-de-produto }

| Mudança | Impacto nos Artefatos | Referência |
|:---|:---|:---|
| Remoção do `score` global (0–100) do contrato | `shared/schemas/api-schema.json`, `shared/types/api.ts`, `contrato-api.md` | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| Remoção do `reliabilityScore` das fontes | `shared/types/api.ts`, `contrato-api.md` | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| Remoção do componente `Gauge.tsx` da UX principal | `extension/src/panel/components/Gauge.tsx` | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| Novo contrato: `claims[]` com `evidence[]` e `uncertainty` | `shared/schemas/api-schema.json` (Planejado) | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| `reflectionQuestions[]` no contrato (obrigatório) | `shared/schemas/api-schema.json` (Planejado) | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md), HU11, HU15 |
| HU11 promovida para Must Have do MVP | `backlog-e-historias.md`, `catalogo-requisitos.md` (RF-05) | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| Provider de LLM desacoplado (`LLMProvider` interface) | `backend/app/providers/` (Planejado) | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md), HU16 |
| Mock explícito apenas em dev/testes, proibido em produção | Config de ambiente, testes | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |
| EDA obrigatória antes de continuar evolução da extensão | `docs/scrum/sprint-01/` | Sprint 01 Goal |
| `analysisMode` substituindo classificação única | `shared/schemas/api-schema.json` (Planejado) | [ADR-006](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) |

---

## O Que o Produto NÃO Faz {: #o-que-nao-faz }

> [!IMPORTANT]
> Este produto **não declara "a verdade"** sobre nenhum vídeo ou alegação. Ele organiza evidências e explicita lacunas.

- **Não emite veredito de "verdadeiro" ou "falso"** para o vídeo ou para alegações individuais.
- **Não atribui score global** de veracidade, confiabilidade ou qualidade ao conteúdo.
- **Não determina a credibilidade de fontes** por meio de um índice numérico algorítmico.
- **Não arbitra disputas** entre fontes com conclusões opostas — expõe ambas as perspectivas.
- **Não converte ausência de evidência em "falso"** — registra como `insufficient_evidence`.
- **Não substitui o julgamento do usuário** — fornece material para que o usuário conclua.
- **Não processa vídeos sem transcrição** disponível (limitação técnica documentada).
- **Não opera fora do domínio** `youtube.com/watch*`.

---

## Wireframe Textual da Nova UX {: #wireframe-ux }

O painel lateral da extensão passa a ter a seguinte estrutura de investigação:

```text
╔══════════════════════════════════════════════════════════════╗
║  EvidencIA — Investigação do Vídeo                           ║
║  Canal: [nome do canal]  •  Publicado em: [data]             ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  O QUE O VÍDEO AFIRMA                                        ║
║  ─────────────────────────────────────────────────────────   ║
║  Alegação 01: [texto da alegação extraída]                   ║
║  Alegação 02: [texto da alegação extraída]                   ║
║  ...                                                         ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  EVIDÊNCIAS ENCONTRADAS  [para Alegação 01]                  ║
║  ─────────────────────────────────────────────────────────   ║
║  [SUSTENTA]      [Fonte que sustenta]  — Título · Data       ║
║  [CONTRADIZ]     [Fonte que contradiz] — Título · Data       ║
║  [CONTEXTUALIZA] [Fonte que contextualiza] — Título · Data   ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  O QUE AINDA NÃO SABEMOS                                     ║
║  ─────────────────────────────────────────────────────────   ║
║  [INSUFICIENTE] Evidência insuficiente para [alegação N]     ║
║  [TEMPORAL]     Informação antiga — verificar atualização    ║
║  [LACUNA]       Fonte primária ausente nos resultados        ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  PERGUNTAS PARA VOCÊ                                         ║
║  ─────────────────────────────────────────────────────────   ║
║  • Qual é a fonte original desta alegação?                   ║
║  • Esta informação ainda é atual?                            ║
║  • Existe evidência independente que a confirme?             ║
║  • O que foi omitido do argumento?                           ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  FONTES                                                      ║
║  [Abrir fonte 1]  [Abrir fonte 2]  [Abrir fonte 3]           ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

**Elementos removidos em relação à UX anterior:**
- Velocímetro / gauge de veracidade
- Score numérico global (0–100%)
- Rótulo único de classificação ("Verdadeiro" / "Falso" / "Inconclusivo")
- `reliabilityScore` por fonte

**Elementos adicionados:**
- Seção "O que ainda não sabemos" (incerteza explícita)
- Seção "Perguntas para você" (reflexão crítica — HU11, HU15)
- Relação explícita de cada evidência (sustenta/contradiz/contextualiza)
- Contexto temporal e canal no cabeçalho

---

## Regra de Ouro {: #regra-de-ouro }

> [!CAUTION]
> **Resultado sem evidência jamais é convertido automaticamente em "falso".**
>
> O campo `uncertainty` descreve o **estado do conjunto de evidências recuperadas**, não a "confiança da IA" na resposta. Valores possíveis:
>
> - `supported` — evidências que sustentam a alegação foram encontradas
> - `contradicted` — evidências que contradizem a alegação foram encontradas
> - `contextualized` — evidências contextualizam sem confirmar ou negar
> - `conflicting` — fontes com conclusões opostas encontradas (divergência legítima)
> - `insufficient_evidence` — não foram encontradas evidências suficientes no corpus disponível
>
> O estado `insufficient_evidence` é epistemicamente honesto e **distinto de `false`**. Convertê-lo automaticamente em "falso" seria uma alucinação classificatória.

---

**Ver também:** [Guiding Questions](guiding-questions.md) · [ADR-006 — Evidence-First Architecture](../tecnico/decisoes/ADR-006-evidence-first-architecture.md) · [Backlog e Histórias de Usuário](../requisitos/backlog-e-historias.md)
