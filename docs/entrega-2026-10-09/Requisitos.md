# Requisitos - EvidencIA

Entrega de 09/10/2026. Este quadro descreve o comportamento corrigido e a evidência local. O catálogo original de requisitos e o backlog completo acompanham o pacote em arquivos separados.

| Requisito | Critério verificável | Evidência |
|---|---|---|
| Investigação por alegação | Sem score global do vídeo; cada alegação com fontes e incerteza | Atomic investigation e testes do painel |
| Fidelidade ao vídeo | Texto de Claim deve existir na transcrição; revisão recuperada fica na fonte | Regressão contra Claim inventada e fallback vetorial |
| Referências factuais | Perguntas só pertencem ao catálogo neutro; URLs/datas livres do provedor não são exibidas | Resposta adversarial controlada |
| Ausência de evidência | Estado insufficient_evidence, sem tratar ausência como falsidade | Teste sem fonte e mutação negativa |
| Contexto temporal | Data ausente permanece desconhecida; timestamp só de segmento real | Legenda após silêncio, sem segmentos e fonte sem data |
| Evidence-Only | analysisMode=evidence_only não instancia nem chama provedor | Sonda com factory mockada, zero chamadas |
| Mensagens MV3 | sender.id próprio e origem YouTube; callback assíncrono não burla teste | Mutação de sender deve falhar |
| Cache | TTL 24h; expirado/corrompido descartado; sem extração/rede no cache válido | Unitários e E2E; leitura antecipada em paralelo |
| Autenticação | Emissão/renovação após 401/403, uma nova tentativa | Testes de instalação/renovação/erro |
| Transporte | Limite de bytes antes de parse, inclusive sem Content-Length | Regressões 413 declaradas e streaming |
| Produção | Segredo próprio, autenticação, Redis compartilhado e CORS exato | Validação de configuração; exige provisionamento real |
| Menor privilégio | Manifesto gerado só YouTube e origem backend explícita | Build prod exige HTTPS configurado |
| Acessibilidade | Foco, teclado e estados avaliados no browser | E2E axe e navegação; sem certificação universal |
| CI | Actions por SHA, contents:read, dependências e contratos verificáveis | CI revisada e checks locais |

A validação local não mede automaticamente estabilidade em todos os vídeos reais ou concorrência de Redis não provisionado. Os valores de produção não são inventados no repositório.
