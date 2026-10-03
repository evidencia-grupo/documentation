# Proposta de Reorganização e Diagnóstico Estrutural

> **O que você vai encontrar aqui:** Registro formal do diagnóstico de documentação, mapeamento de inconsistências, proposta de arquitetura de informação e plano de execução implementado na branch `docs/reorganizacao`.

---

## 1. Contexto e Motivação

O repositório de documentação do projeto **EvidencIA** expandiu-se ao longo das etapas metodológicas do Challenge Based Learning (CBL) e dos sprints de desenvolvimento. Esse crescimento resultou em:
- Informações sobrepostas e duplicidade de índices mestres (`README.md`, `docs/README.md`, `docs/index.md`).
- Termos técnicos utilizados de formas divergentes (ex.: "alegação" versus "afirmação", referências residuais ao "velocímetro" descontinuado pelo ADR-006).
- Divergências de numeração e escopo de requisitos entre documentos legados e documentos consolidados.
- Necessidade de organizar a leitura para que uma pessoa nova no projeto compreenda o escopo, arquitetura e estado atual em até 15 minutos.

---

## 2. Diagnóstico das Inconsistências Identificadas

| ID | Inconsistência Detectada | Fontes Envolvidas | Resolução Implementada |
|:---:|:---|:---|:---|
| **C1** | Escopo de IDs divergentemente documentado (RF-01 a 11 e HU01 a 12 vs. RF-01 a 15 e HU01 a 16) | `index.md`, glossário antigo × catálogo de requisitos e matriz | Preservação integral de todos os IDs vigentes (RF-01 a RF-15, RNF-01 a RNF-07, UC-01 a UC-06, HU01 a HU16). |
| **C2** | Menção a RNF-01 a RNF-11, mas apenas RNF-01 a RNF-07 especificados formalmente | `convencoes.md`, `mapa-do-projeto.md` × catálogo | Registrado formalmente como pendência de escopo em RNF; padronizado para RNF-01 a RNF-07 no catálogo. |
| **C3** | Resíduos conceituais de "velocímetro" e "score global de veracidade" | Textos legados × ADR-006 (Decisão 1) | Contextualização histórica como protótipo descontinuado e reafirmação do modelo Evidence-First. |
| **C4** | Divergência MoSCoW em HU11 e RF-04 em glossários antigos | `referencia/glossario.md` × ADR-006 | Harmonização: HU11 e RF-04 classificados como Must Have no MVP pelo ADR-006. |
| **C5** | Citação equivocada da numeração de decisão do ADR-006 | `glossario.md` inicial × ADR-006 | Correção: "Sem evidência suficiente" corresponde à Decisão 3 do ADR-006. |
| **C6** | Duplicidade binária de imagem | `assets/diagrama.png` = `assets/diagrama-casos-de-uso.png` | Arquivamento da duplicata em `docs/arquivo/diagrama-duplicado.png` com nota explicativa. |
| **C7** | Dois glossários coexistindo | `docs/glossario.md` e `referencia/glossario.md` | Unificação em `docs/glossario.md` e arquivamento do antigo em `docs/arquivo/glossario-legado.md`. |

---

## 3. Topologia Adotada (Abordagem Híbrida Segura)

A reestruturação adotou a estratégia que preserva a integridade dos scripts de validação automatizada do repositório de código `EvidencIA`:

1. **Visão Geral Dedicada (`docs/visao-geral/`):**
   - [`visao-geral-do-projeto.md`](../visao-geral/visao-geral-do-projeto.md): Síntese executiva de 1 página (leitura em 5 minutos).
   - [`mapa-do-projeto.md`](../visao-geral/mapa-do-projeto.md): Diagramas de ciclo CBL, topologia e rastreabilidade.
   - [`status.md`](../visao-geral/status.md): Painel consolidado com portões G1 a G8.
2. **README Raiz Modernizado:**
   - Guia de leitura por 3 perfis distintos (entender, desenvolver, avaliar).
   - Mapa de links unificado e comandos verificados.
3. **Glossário Centralizado:**
   - Fusão completa dos conceitos ontológicos, metodológicos e técnicos em [`docs/glossario.md`](../glossario.md).
4. **Acervo Histórico Não Destrutivo (`docs/arquivo/`):**
   - Preservação de versões legadas de índices, glossários e snapshots de auditoria com notas explícitas de motivo.

---

## Documentos Relacionados
- [Catálogo de Caminhos Protegidos](protected-paths.md) — Relação de arquivos monitorados pelo CI.
- [Convenções de Documentação](convencoes.md) — Padrões tipográficos e regras de governança.
- [Painel Consolidado de Status](../visao-geral/status.md) — Situação atual das entregas.
