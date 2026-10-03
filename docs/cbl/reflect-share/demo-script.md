# Roteiro de Demonstração (Demo Script) — EvidencIA

> **Fase:** CBL Reflect & Share  
> **Duração Total Prevista:** 2:00 a 3:00  
> **Princípio:** Demonstração honesta e estrita. Funcionalidades não verificadas no código recebem `NÃO DEMONSTRAR — recurso ausente`.  
> **Repositórios Auditados:** `evidencia-grupo/documentation` (@`9e95b68`) e `evidencia-grupo/EvidencIA` (@`27c53e8`)

---

## 1. Checklist de Pré-Voo (Obrigatório)

Antes de iniciar a sessão de demonstração diante da banca avaliadora:

- [ ] **Ambiente Limpo:** Navegador baseado em Chromium (Chrome, Edge ou Brave) aberto em janela isolada sem extensões conflitantes.
- [ ] **Backend Ativo:** Serviço FastAPI rodando localmente na porta 8000 (`http://localhost:8000/api/v1/health` retornando status 200).
- [ ] **Fixtures Offline Disponíveis:** Vídeo fixture de teste previamente carregado em cache local para evitar variações de rede pública.
- [ ] **Segurança de Credenciais:** Nenhuma chave de API exposta em terminais, variáveis de ambiente ou ferramentas de desenvolvedor abertas [EV: EvidencIA:.gitignore#security@27c53e8].
- [ ] **Variável de Provedor Conhecida:** Backend configurado com `LLM_PROVIDER=ollama` ou `remote` (nunca mock em demonstração pública, conforme guard formal) [EV: EvidencIA:backend/tests/test_no_mock_in_production.py#test_provider_factory_mock_guard@27c53e8].
- [ ] **Ensaio Cronometrado:** Ensaio prévio executado dentro do time-box de 2 minutos.

---

## 2. Roteiro de Demonstração Passo a Passo

### Passo 1 — Ativação no Player e Extração de Transcrição
- **Ação:** O apresentador acessa a página do vídeo no YouTube e clica no ícone da extensão EvidencIA na barra lateral do player.
- **Resultado Esperado:** O content script da extensão captura o `videoId`, extrai as legendas disponíveis e envia a requisição para o backend proxy MV3 [EV: EvidencIA:extension/src/content/content-script.ts#content-script@27c53e8].
- **Tempo:** 0:25
- **Status:** **VERIFICADO NO CÓDIGO**
- **Plano B:** Caso a rede do YouTube oscile, carregar a fixture estática de transcrição pré-gravada no ambiente de testes.

### Passo 2 — Decomposição da Fala em Alegações Individuais
- **Ação:** O painel lateral renderiza a resposta da análise estruturada.
- **Resultado Esperado:** A fala contínua do vídeo é apresentada decomposta em cards de alegações específicas (`ClaimCard.tsx`), permitindo ao usuário examinar ponto a ponto o que foi dito [EV: EvidencIA:extension/src/panel/components/ClaimCard.tsx#claimcard@27c53e8].
- **Tempo:** 0:30
- **Status:** **VERIFICADO NO CÓDIGO**
- **Plano B:** Captura de tela anotada da listagem de alegações.

### Passo 3 — Exibição de Evidências e Fontes Qualificadas
- **Ação:** O usuário clica para inspecionar os detalhes de uma alegação que possui correspondência em bases de fact-checking.
- **Resultado Esperado:** O componente de fontes (`SourceList.tsx`) lista matérias de agências de checagem com título, agência (Lupa, Aos Fatos) e link externo direto para auditoria pelo próprio usuário [EV: EvidencIA:extension/src/panel/components/SourceList.tsx#sourcelist@27c53e8].
- **Tempo:** 0:35
- **Status:** **VERIFICADO NO CÓDIGO (SourceList)**  
  *(Nota técnica honesta: O componente específico `EvidenceCard.tsx` com relações explícitas supports/contradicts está em desenvolvimento na Sprint 2 via Issue #35; a demonstração atual utiliza o componente estável `SourceList.tsx`).*
- **Plano B:** Navegar diretamente para o endpoint de API exibindo o schema JSON com as fontes recuperadas.

### Passo 4 — Tratamento de Incerteza e Evidência Insuficiente
- **Ação:** O apresentador navega para uma alegação sobre a qual não existem dados cadastrados.
- **Resultado Esperado:** O painel exibe o componente `UncertaintyAlert.tsx` informando explicitamente que não foram localizadas evidências suficientes na base curada, sem taxar o fato como falso [EV: EvidencIA:extension/src/panel/components/UncertaintyAlert.tsx#uncertaintyalert@27c53e8].
- **Tempo:** 0:20
- **Status:** **VERIFICADO NO CÓDIGO**
- **Plano B:** Vídeo de homologação gravado durante a validação da HU09.

### Passo 5 — Modo de Falha Resiliente (Evidence-Only)
- **Ação:** O apresentador simula a queda ou indisponibilidade do serviço generativo local (Ollama).
- **Resultado Esperado:** O backend responde mantendo as alegações e os registros de fact-checking já indexados, sem quebrar a interface e sem acionar mocks silenciosos em produção [EV: EvidencIA:backend/app/services/providers/factory.py#get_provider@27c53e8].
- **Tempo:** 0:30
- **Status:** **VERIFICADO NO BACKEND (Contrato do Factory)**
- **Plano B:** Exibição da suite de testes de contrato de providers executando via pytest no terminal.

### Passo 6 — Perguntas Orientadoras de Reflexão (HU11)
- **Status:** **NÃO DEMONSTRAR — recurso ausente na branch atual**
- **Justificativa:** O componente visual `ReflectionQuestions.tsx` pertence ao escopo da Sprint 2 (Issue #36) e ainda não foi mesclado na branch principal da extensão.
- **Ação na Apresentação:** Informar à banca que a funcionalidade foi formalizada no ADR-006 e aprovada como requisito nuclear do MVP, com entrega programada para a Sprint 2.

### Passo 7 — Ausência de Score Global e Remoção do Gauge
- **Status:** **NÃO DEMONSTRAR COMO CONCLUÍDO NA UI — transição em andamento**
- **Justificativa:** Conforme auditoria técnica, o arquivo `Gauge.tsx` ainda existe no diretório da extensão sob a proteção de congelamento de caminhos da Sprint 1 [EV: EvidencIA:extension/src/panel/components/Gauge.tsx@27c53e8]. A remoção física completa ocorre na Sprint 2 (Issue #34: Descongelamento formal).
- **Ação na Apresentação:** Explicar a política de governança de caminhos congelados (`.github/frozen-paths.txt`) e mostrar o novo contrato de API onde o campo `score` já foi removido.
