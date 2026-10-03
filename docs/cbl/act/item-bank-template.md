# Template do Banco de Itens — Fase CBL Act

## 1. Regras Metodologicas para Construcao do Banco de Estimulos

Este documento padroniza a estrutura, os criterios de selecao e as regras de rotulagem do banco de itens que subsidia as tres fases do experimento na fase Act.

### Regras de Pareamento e Distribuicao dos Conjuntos

1. **Conjunto S1 (Fase 1 — Baseline)**:
   - Proposta de tamanho: **4 itens** (cada item contendo de 2 a 3 alegacoes factuais).
   - Sem ferramentas de apoio.
   - Nivel de dificuldade balanceado: dois itens faceis (1), um intermediario (2) e um desafiador (3).
2. **Conjunto S2 (Fase 2 — Assistida)**:
   - Proposta de tamanho: **4 itens** (2 a 3 alegacoes cada).
   - Pareamento com S1: mesma distribuicao proporcional de dificuldade e tipologia tematica (politica institucional, ciencia/tecnologia, economia).
   - **Cobertura no Indice de Evidencias**:
     - Pelo menos **50% dos itens (>= 2 itens)** devem possuir checagens previamente indexadas e recuperaveis pela base local.
     - Pelo menos **25% dos itens (>= 1 item)** devem ser genuinamente carentes de evidencias na base e na literatura de checagem, recebendo o rotulo formal `insufficient` (verdade-terreno: ausencia de evidencia confirmatoria), para testar diretamente a compreensao do participante de que "sem evidencia suficiente != falso".
3. **Conjunto S3 (Fase 3 — Transferencia)**:
   - Proposta de tamanho: **3 itens** (2 a 3 alegacoes cada).
   - **100% dos itens devem estar fora do indice de evidencias local**, simulando afirmacoes recentes ou de nicho que exigem esforco investigativo independente do usuario sem apoio da extensao.
4. **Disjuncao Absoluta de Itens**:
   - Nenhum item, alegacao ou trecho de video pode ser reutilizado entre os conjuntos S1, S2 e S3.

---

## 2. Criterios de Seguranca Tematica e Etica de Conteudo

Para evitar riscos eticos e danos cognitivos aos participantes:

- **Temas Estritamente Vetados**: E vedada a utilizacao de afirmacoes sobre terapias medicas alternativas para doencas letais (ex.: curas falsas de cancer), desinformacao sanitaria que desencoraje tratamentos comprovados, discurso de odio, incitacao a violencia, autoagressao ou pornografia.
- **Minimizacao de Dano e Polarizacao**: Privilegiar afirmacoes verificaveis de carater economico, ambiental, historico, estatistico e de politicas publicas gerais, reduzindo o impacto de vieses ideologicos extremos.
- **Obrigatoriedade de Debriefing**: Todo e qualquer item inserido no banco deve conter uma sintese da checagem oficial publicada por agencia certificada pela *International Fact-Checking Network* (IFCN) para apresentacao obrigatoria na etapa final de debriefing educativo.

---

## 3. Protocolo de Rotulagem Independente (Duplo Cego)

A verdade-terreno de cada alegacao devera ser estabelecida pelo seguinte fluxo:

1. **Rotulacao Cega**: Dois pesquisadores da equipe (`Rotulador 1` e `Rotulador 2`) avaliam independentemente o trecho e a alegacao, atribuindo um dos rotulos permitidos:
   - `supported` (sustentada por fatos e dados oficiais)
   - `contradicted` (refutada cabalmente por evidencias de checadores)
   - `misleading` (contem elementos verdadeiros tirados de contexto para induzir a conclusao falsa)
   - `insufficient` (afirmacao nao sustentada nem refutavel por evidencias verificaveis publicas)
2. **Concordancia Interavaliadores**: Se houver divergencia entre os rotuladores, um terceiro membro revisor e convocado para mediar a deliberacao com base nas evidencias documentadas. Se persistir ambiguidade, o item e **descartado** do banco de testes.
3. **Fonte Rastreavel da Verdade-Terreno**: O rotulo final deve estar respaldado por link direto e data de publicacao de relatorio de checagem emitido por organizacao jornalistica reconhecida (ex.: Aos Fatos, Agencia Lupa, Boatos.org, E-farsas, Projeto Comprova).

---

## 4. Tabela-Modelo do Banco de Itens (Dados Sinteticos de Exemplo)

> [!NOTE]
> Os registros abaixo sao estritamente sinteticos (`"synthetic": true`), incluidos exclusivamente como modelo de preenchimento estrutural. O banco oficial do estudo sera preenchido pela equipe e mantido em arquivo fora do controle de versao.

| item_id | conjunto | origem do trecho (fonte e data de acesso) | claim_ordinal | rotulo de verdade-terreno | fonte independente do rotulo (checagem publicada + data) | no_indice | dificuldade | rotulador 1 | rotulador 2 | resolucao de divergencia |
|:---:|:---:|:---|:---:|:---:|:---|:---:|:---:|:---:|:---:|:---|
| `IT-001` | S1 | Exemplo Video YouTube A (Acesso: 2026-09-15) | 1 | `contradicted` | Agencia Lupa, Checagem 1042, 2025-08-10 | nao | 1 | `contradicted` | `contradicted` | Concordancia plena |
| `IT-001` | S1 | Exemplo Video YouTube A (Acesso: 2026-09-15) | 2 | `supported` | Portal IBGE, Censo 2022, 2023-06-28 | nao | 2 | `supported` | `supported` | Concordancia plena |
| `IT-002` | S1 | Exemplo Noticia Portal B (Acesso: 2026-09-16) | 1 | `misleading` | Aos Fatos, Relatorio 891, 2025-11-04 | nao | 2 | `misleading` | `contradicted` | Resolvido para misleading: dados corretos porem com interpretacao causal falsa |
| `IT-003` | S2 | Exemplo Discurso Video C (Acesso: 2026-09-20) | 1 | `supported` | Boatos.org, Despacho 442, 2025-03-12 | sim | 1 | `supported` | `supported` | Concordancia plena |
| `IT-003` | S2 | Exemplo Discurso Video C (Acesso: 2026-09-20) | 2 | `insufficient` | Checagem interna documental, 2026-09-22 | sim | 3 | `insufficient` | `insufficient` | Concordancia plena: declaracao sem registros documentais disponiveis |
| `IT-004` | S3 | Exemplo Post Rede Social D (Acesso: 2026-09-25) | 1 | `contradicted` | Projeto Comprova, Caso 311, 2026-02-18 | nao | 2 | `contradicted` | `contradicted` | Concordancia plena |
