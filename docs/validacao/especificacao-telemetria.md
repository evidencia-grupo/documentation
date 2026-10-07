# Especificação do Contrato de Telemetria — Fase CBL Act

## 1. Princípios de Governança e Privacidade por Design

O módulo de telemetria da fase Act foi concebido sob princípios rigorosos de minimização de dados, soberania do participante e ética científica:

1. **Desligado por Padrão**: O módulo permanece totalmente inerte em ambientes normais de produção e desenvolvimento.
2. **Duplo Gate de Ativação**: Eventos só são instanciados e processados se, e somente se:
   - A variável de build `EXPERIMENT_MODE === true` estiver ativada na compilação da extensão.
   - O método `grantConsent()` tiver sido explicitamente chamado durante a sessão corrente.
3. **Persistência Exclusiva em Memória**: O estado de consentimento é transiente (armazenado apenas na memória da sessão) e nunca persiste entre sessões ou reaberturas de navegador.
4. **Isolamento Total de Rede**: O módulo de telemetria possui **zero chamadas de rede**. Não utiliza `fetch`, `XMLHttpRequest`, `sendBeacon`, `WebSocket` ou envio para servidores externos.
5. **Exportação Manual**: A exportação dos dados é estritamente manual, acionada pelo pesquisador ao final da sessão, gerando um arquivo local no formato JSONL com o padrão de nome `act_<pid>_<sid8>.jsonl`.
6. **Falha Fechada (Fail-Closed)**: Qualquer evento recebido que contenha chave desconhecida, valor fora de faixa ou caractere vedado é **descartado sumariamente**. Nenhum dado é "corrigido", truncado ou sanitizado para aproveitamento forçado. O descarte incrementa um contador determinístico de rejeições categorizadas.
7. **Dados de Verdade-Terreno Desacoplados**: A verdade-terreno das alegações **nunca** trafega na telemetria do participante. Ela é mantida exclusivamente no arquivo do pesquisador (`ground_truth.json`), localizado fora do repositório.

---

## 2. Dados Expressamente Vetados (Lista Negra Estrita)

É terminantemente proibido capturar, registrar ou transmitir os seguintes dados:

- Transcrições de áudio ou texto falado de vídeos.
- Textos literais de alegações, cards de evidência ou títulos de notícias.
- URLs de vídeos, canais, páginas de mídia ou fontes consultadas.
- Identificadores de vídeo (ex.: `video_id` do YouTube).
- Entradas de texto livre digitadas pelo participante (inclusive justificativas ou respostas discursivas a perguntas reflexivas; registra-se apenas a interação categórica via enum).
- Dados de identificação pessoal (PII): nomes, e-mails, telefones, documentos (CPF).
- Metadados técnicos de rastreamento: endereço IP, string completa de `User-Agent`, cookies de navegação.
- Timestamps absolutos (data/hora UTC do sistema). Permite-se apenas o delta relativo `t_ms` a partir do marco zero da sessão.

---

## 3. Especificação do Envelope Comum

Cada linha exportada no arquivo JSONL representa exatamente um evento no seguinte formato JSON estrito:

| Campo | Tipo | Validação / Regex | Descrição |
|:---|:---|:---|:---|
| `schema_version` | `string` | Fixo `"1.0.0"` | Versão semântica do contrato de telemetria. |
| `pid` | `string` | `^P-[0-9]{4}$` | Identificador pseudonimizado do participante (ex.: `"P-0001"`). |
| `sid` | `string` | UUID v4 | Identificador único global da sessão gerado via `crypto.randomUUID()`. |
| `cond` | `string` | `"A"` ou `"B"` | Condição experimental atribuída (Controle Veredito vs. Evidence-First). |
| `phase` | `string` | `"baseline"`, `"assisted"`, `"transfer"` | Fase cronológica do experimento. |
| `item_id` | `string` | `^IT-[0-9]{3}$` | Identificador do estímulo em análise (ex.: `"IT-001"`). |
| `event` | `string` | Enum do catálogo | Nome exato do evento catalogado. |
| `seq` | `integer` | Inteiro >= 0 | Número sequencial monotonicamente crescente de emissão do evento. |
| `t_ms` | `integer` | Inteiro >= 0 | Tempo transcorrido em milissegundos desde o início da sessão (`session_started`). |
| `props` | `object` | Objeto fechado | Dicionário de propriedades específicas do evento (sem campos adicionais permitidos). |

---

## 4. Catálogo Fechado de Eventos e Propriedades (`props`)

Toda emissão fora dos esquemas abaixo é sumariamente rejeitada pelo sanitizador:

### 1. `session_started`
- **Descrição**: Marca o início oficial da sessão de testes com o participante.
- **`props`**:
  - `build` (`string`): Hash curto do commit git da aplicação (`[a-f0-9]{7,12}`).

### 2. `item_presented`
- **Descrição**: Disparado no instante em que a tela de um item é renderizada para o participante.
- **`props`**:
  - `n_claims` (`integer`, 1 a 10): Quantidade total de alegações contidas no item.

### 3. `claims_viewed`
- **Descrição**: Registra a presença visual e leitura da área de alegações.
- **`props`**:
  - `n_claims_visible` (`integer`, 1 a 10): Quantidade de alegações renderizadas na viewport do usuário.

### 4. `claim_selected`
- **Descrição**: O participante clica ou foca em uma alegação específica para iniciar sua análise.
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice ordinal da alegação selecionada dentro do item.

### 5. `evidence_expanded`
- **Descrição**: O participante expande um card de evidência ou clica em "Ver fontes".
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice ordinal da alegação correspondente.
  - `evidence_ordinal` (`integer`, 1 a 20): Índice ordinal da evidência inspecionada.
  - `relation` (`string`): Relação semântica da evidência. Valores permitidos: `"supports"`, `"contradicts"`, `"contextualizes"` na Condição B; `"unspecified"` na Condição A.

### 6. `source_opened`
- **Descrição**: O participante clica no link para inspecionar a fonte original de uma evidência em nova aba.
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice da alegação.
  - `evidence_ordinal` (`integer`, 1 a 20): Índice da evidência cuja fonte foi aberta.

### 7. `uncertainty_viewed`
- **Descrição**: Exibição de sinalizador de incerteza metodológica na alegação (exclusivo da Condição B).
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice da alegação.
  - `kind` (`string`): Tipo de incerteza exibido: `"insufficient_evidence"`, `"conflicting"`, `"dated"`.

### 8. `reflection_viewed`
- **Descrição**: Um card de pergunta orientadora reflexiva tornou-se visível para o participante (exclusivo da Condição B).
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice da alegação correspondente.
  - `question_ordinal` (`integer`, 1 a 5): Índice da pergunta reflexiva.

### 9. `reflection_interacted`
- **Descrição**: O participante interagiu com o card de reflexão (exclusivo da Condição B).
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice da alegação.
  - `question_ordinal` (`integer`, 1 a 5): Índice da pergunta.
  - `interaction` (`string`): Tipo de ação: `"expanded"`, `"answered"`, `"dismissed"`.

### 10. `global_verdict_viewed`
- **Descrição**: O participante visualizou a pontuação numérica consolidada (score) e o veredito sintético do gauge (exclusivo da Condição A).
- **`props`**: `{}` *(objeto vazio).*

### 11. `decision_submitted`
- **Descrição**: O participante submete formalmente sua avaliação para uma alegação.
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Índice da alegação.
  - `stage` (`string`): Momento da decisão: `"pre_evidence"` ou `"final"`.
  - `decision` (`string`): Veredito escolhido: `"supported"`, `"contradicted"`, `"misleading"`, `"insufficient"`, `"cannot_determine"`.
  - `confidence` (`integer`, 0 a 100): Nível percentual de confiança declarado na resposta.

### 12. `post_task_questionnaire`
- **Descrição**: Respostas colhidas no formulário final de autoavaliação.
- **`props`**:
  - `effort_seq` (`integer`, 1 a 7): Nota na escala Single Ease Question (1 = Muito Difícil; 7 = Muito Fácil).
  - `verification_steps` (`array` de `string`): Subconjunto único contendo valores entre: `"source"`, `"date"`, `"independent_evidence"`, `"context"`, `"none"`.

### 13. `session_ended`
- **Descrição**: Finalização da sessão do participante.
- **`props`**:
  - `reason` (`string`): Motivo do encerramento: `"completed"`, `"abandoned"`, `"timeout"`.

---

## 5. Mapeamento de Eventos para Métricas de Análise

| ID da Métrica | Nome da Métrica | Eventos Primários Consumidos |
|:---:|:---|:---|
| **M1** | Evidence Inspection Rate (EIR) | `claims_viewed`, `evidence_expanded` |
| **M1b** | Source Open Rate (SOR) | `claims_viewed`, `source_opened` |
| **M2** | Reflection Interaction Rate (RIR) | `reflection_viewed`, `reflection_interacted` |
| **M3** | Evidence Revision Rate (ERR) | `evidence_expanded`, `decision_submitted` (stages `pre_evidence` e `final`) |
| **M3b** | Premature Decision Rate (PDR) | `decision_submitted` (stage `final`), ausência de `evidence_expanded` |
| **M4** | Confidence Calibration | `decision_submitted` (`confidence`, `decision`), cruzado com `ground_truth.json` |
| **M5** | Final Accuracy e Delta-Accuracy | `decision_submitted` (stage `final`), cruzado com `ground_truth.json` |
| **M6** | Transfer Task Accuracy (TTA) | `decision_submitted` (phase `transfer`), cruzado com `ground_truth.json` |
| **M6b** | Verification Steps Count (VSC) | `post_task_questionnaire` (`verification_steps`) |
| **M7** | Time to Conclusion (TTC) | `claim_selected` (primeiro evento), `decision_submitted` (stage `final`) |
| **M8** | Esforço Percebido (SEQ) | `post_task_questionnaire` (`effort_seq`) |
| **M9** | Investigation Behavior Rate (IBR) | `claim_selected`, `claims_viewed`, `evidence_expanded`, `source_opened`, `reflection_interacted` |

---

## 6. Procedimento de Exportação e Nomeação dos Arquivos

Ao término da Etapa 6 de cada sessão, a aplicação gera o payload JSONL serializado. O pesquisador salva o arquivo em disco local externo ao repositório, sob o padrão:

```text
act_<pid>_<sid8>.jsonl
```
Exemplo: `act_P-0001_3f8a1b2c.jsonl`, onde:
- `P-0001` é o pseudônimo formal do participante.
- `3f8a1b2c` são os primeiros 8 caracteres do UUID v4 da sessão (`sid`).
