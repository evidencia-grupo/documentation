# Especificacao do Contrato de Telemetria — Fase CBL Act

## 1. Principios de Governanca e Privacidade por Design

O modulo de telemetria da fase Act foi concebido sob principios rigorosos de minimizacao de dados, soberania do participante e etica cientifica:

1. **Desligado por Padrao**: O modulo permanece totalmente inerte em ambientes normais de producao e desenvolvimento.
2. **Duplo Gate de Ativacao**: Eventos so sao instanciados e processados se, e somente se:
   - A variavel de build `EXPERIMENT_MODE === true` estiver ativada na compilacao da extensao.
   - O metodo `grantConsent()` tiver sido explicitamente chamado durante a sessao corrente.
3. **Persistencia Exclusiva em Memoria**: O estado de consentimento e transiente (armazenado apenas na memoria da sessao) e nunca persiste entre sessoes ou reaberturas de navegador.
4. **Isolamento Total de Rede**: O modulo de telemetria possui **zero chamadas de rede**. Nao utiliza `fetch`, `XMLHttpRequest`, `sendBeacon`, `WebSocket` ou envio para servidores externos.
5. **Exportacao Manual**: A exportacao dos dados e estritamente manual, acionada pelo pesquisador ao final da sessao, gerando um arquivo local no formato JSONL com o padrao de nome `act_<pid>_<sid8>.jsonl`.
6. **Falha Fechada (Fail-Closed)**: Qualquer evento recebido que contenha chave desconhecida, valor fora de faixa ou caractere vedado e **descartado sumariamente**. Nenhum dado e "corrigido", truncado ou sanitizado para aproveitamento forcado. O descarte incrementa um contador deterministico de rejeicoes categorizadas.
7. **Dados de Verdade-Terreno Desacoplados**: A verdade-terreno das alegacoes **nunca** trafega na telemetria do participante. Ela e mantida exclusivamente no arquivo do pesquisador (`ground_truth.json`), localizado fora do repositorio.

---

## 2. Dados Expressamente Vetados (Lista Negra Estrita)

E terminantemente proibido capturar, registrar ou transmitir os seguintes dados:

- Transcricoes de audio ou texto falado de videos.
- Textos literais de alegacoes, cards de evidencia ou titulos de noticias.
- URLs de videos, canais, paginas de midia ou fontes consultadas.
- Identificadores de video (ex.: `video_id` do YouTube).
- Entradas de texto livre digitadas pelo participante (inclusive justificativas ou respostas discursivas a perguntas reflexivas; registra-se apenas a interacao categorica via enum).
- Dados de identificacao pessoal (PII): nomes, e-mails, telefones, documentos (CPF).
- Metadados tecnicos de rastreamento: endereco IP, string completa de `User-Agent`, cookies de navegacao.
- Timestamps absolutos (data/hora UTC do sistema). Permite-se apenas o delta relativo `t_ms` a partir do marco zero da sessao.

---

## 3. Especificacao do Envelope Comum

Cada linha exportada no arquivo JSONL representa exatamente um evento no seguinte formato JSON estrito:

| Campo | Tipo | Validacao / Regex | Descricao |
|:---|:---|:---|:---|
| `schema_version` | `string` | Fixo `"1.0.0"` | Versao semantica do contrato de telemetria. |
| `pid` | `string` | `^P-[0-9]{4}$` | Identificador pseudonimizado do participante (ex.: `"P-0001"`). |
| `sid` | `string` | UUID v4 | Identificador unico global da sessao gerado via `crypto.randomUUID()`. |
| `cond` | `string` | `"A"` ou `"B"` | Condicao experimental atribuida (Controle Veredito vs. Evidence-First). |
| `phase` | `string` | `"baseline"`, `"assisted"`, `"transfer"` | Fase cronologica do experimento. |
| `item_id` | `string` | `^IT-[0-9]{3}$` | Identificador do estimulo em analise (ex.: `"IT-001"`). |
| `event` | `string` | Enum do catalogo | Nome exato do evento catalogado. |
| `seq` | `integer` | Inteiro >= 0 | Numero sequencial monotonicamente crescente de emissao do evento. |
| `t_ms` | `integer` | Inteiro >= 0 | Tempo transcorrido em milissegundos desde o inicio da sessao (`session_started`). |
| `props` | `object` | Objeto fechado | Dicionario de propriedades especificas do evento (sem campos adicionais permitidos). |

---

## 4. Catalogo Fechado de Eventos e Propriedades (`props`)

Toda emissao fora dos esquemas abaixo e sumariamente rejeitada pelo sanitizador:

### 1. `session_started`
- **Descricao**: Marca o inicio oficial da sessao de testes com o participante.
- **`props`**:
  - `build` (`string`): Hash curto do commit git da aplicacao (`[a-f0-9]{7,12}`).

### 2. `item_presented`
- **Descricao**: Disparado no instante em que a tela de um item e renderizada para o participante.
- **`props`**:
  - `n_claims` (`integer`, 1 a 10): Quantidade total de alegacoes contidas no item.

### 3. `claims_viewed`
- **Descricao**: Registra a presenca visual e leitura da area de alegacoes.
- **`props`**:
  - `n_claims_visible` (`integer`, 1 a 10): Quantidade de alegacoes renderizadas na viewport do usuario.

### 4. `claim_selected`
- **Descricao**: O participante clica ou foca em uma alegacao especifica para iniciar sua analise.
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice ordinal da alegacao selecionada dentro do item.

### 5. `evidence_expanded`
- **Descricao**: O participante expande um card de evidencia ou clica em "Ver fontes".
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice ordinal da alegacao correspondente.
  - `evidence_ordinal` (`integer`, 1 a 20): Indice ordinal da evidencia inspecionada.
  - `relation` (`string`): Relacao semantica da evidencia. Valores permitidos: `"supports"`, `"contradicts"`, `"contextualizes"` na Condicao B; `"unspecified"` na Condicao A.

### 6. `source_opened`
- **Descricao**: O participante clica no link para inspecionar a fonte original de uma evidencia em nova aba.
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice da alegacao.
  - `evidence_ordinal` (`integer`, 1 a 20): Indice da evidencia cuja fonte foi aberta.

### 7. `uncertainty_viewed`
- **Descricao**: Exibicao de sinalizador de incerteza metodologica na alegacao (exclusivo da Condicao B).
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice da alegacao.
  - `kind` (`string`): Tipo de incerteza exibido: `"insufficient_evidence"`, `"conflicting"`, `"dated"`.

### 8. `reflection_viewed`
- **Descricao**: Um card de pergunta orientadora reflexiva tornou-se visivel para o participante (exclusivo da Condicao B).
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice da alegacao correspondente.
  - `question_ordinal` (`integer`, 1 a 5): Indice da pergunta reflexiva.

### 9. `reflection_interacted`
- **Descricao**: O participante interagiu com o card de reflexao (exclusivo da Condicao B).
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice da alegacao.
  - `question_ordinal` (`integer`, 1 a 5): Indice da pergunta.
  - `interaction` (`string`): Tipo de acao: `"expanded"`, `"answered"`, `"dismissed"`.

### 10. `global_verdict_viewed`
- **Descricao**: O participante visualizou a pontuacao numerica consolidada (score) e o veredito sintetico do gauge (exclusivo da Condicao A).
- **`props`**: `{}` *(objeto vazio).*

### 11. `decision_submitted`
- **Descricao**: O participante submete formalmente sua avaliacao para uma alegacao.
- **`props`**:
  - `claim_ordinal` (`integer`, 1 a 10): Indice da alegacao.
  - `stage` (`string`): Momento da decisao: `"pre_evidence"` ou `"final"`.
  - `decision` (`string`): Veredito escolhido: `"supported"`, `"contradicted"`, `"misleading"`, `"insufficient"`, `"cannot_determine"`.
  - `confidence` (`integer`, 0 a 100): Nivel percentual de confianca declarado na resposta.

### 12. `post_task_questionnaire`
- **Descricao**: Respostas colhidas no formulario final de autoavaliacao.
- **`props`**:
  - `effort_seq` (`integer`, 1 a 7): Nota na escala Single Ease Question (1 = Muito Dificil; 7 = Muito Facil).
  - `verification_steps` (`array` de `string`): Subconjunto unico contendo valores entre: `"source"`, `"date"`, `"independent_evidence"`, `"context"`, `"none"`.

### 13. `session_ended`
- **Descricao**: Finalizacao da sessao do participante.
- **`props`**:
  - `reason` (`string`): Motivo do encerramento: `"completed"`, `"abandoned"`, `"timeout"`.

---

## 5. Mapeamento de Eventos para Metricas de Analise

| ID da Metrica | Nome da Metrica | Eventos Primarios Consumidos |
|:---:|:---|:---|
| **M1** | Evidence Inspection Rate (EIR) | `claims_viewed`, `evidence_expanded` |
| **M1b** | Source Open Rate (SOR) | `claims_viewed`, `source_opened` |
| **M2** | Reflection Interaction Rate (RIR) | `reflection_viewed`, `reflection_interacted` |
| **M3** | Evidence Revision Rate (ERR) | `evidence_expanded`, `decision_submitted` (stages `pre_evidence` e `final`) |
| **M3b** | Premature Decision Rate (PDR) | `decision_submitted` (stage `final`), ausencia de `evidence_expanded` |
| **M4** | Confidence Calibration | `decision_submitted` (`confidence`, `decision`), cruzado com `ground_truth.json` |
| **M5** | Final Accuracy e Delta-Accuracy | `decision_submitted` (stage `final`), cruzado com `ground_truth.json` |
| **M6** | Transfer Task Accuracy (TTA) | `decision_submitted` (phase `transfer`), cruzado com `ground_truth.json` |
| **M6b** | Verification Steps Count (VSC) | `post_task_questionnaire` (`verification_steps`) |
| **M7** | Time to Conclusion (TTC) | `claim_selected` (primeiro evento), `decision_submitted` (stage `final`) |
| **M8** | Esforco Percebido (SEQ) | `post_task_questionnaire` (`effort_seq`) |
| **M9** | Investigation Behavior Rate (IBR) | `claim_selected`, `claims_viewed`, `evidence_expanded`, `source_opened`, `reflection_interacted` |

---

## 6. Procedimento de Exportacao e Nomeacao dos Arquivos

Ao termino da Etapa 6 de cada sessao, a aplicacao gera o payload JSONL serializado. O pesquisador salva o arquivo em disco local externo ao repositorio, sob o padrao:

```text
act_<pid>_<sid8>.jsonl
```
Exemplo: `act_P-0001_3f8a1b2c.jsonl`, onde:
- `P-0001` e o pseudonimo formal do participante.
- `3f8a1b2c` sao os primeiros 8 caracteres do UUID v4 da sessao (`sid`).
