# Política de Privacidade — Extensão EvidencIA

Vigência: 14 de outubro de 2026. Aplica-se à extensão EvidencIA para Google Chrome e ao serviço de backend que ela consulta.

A EvidencIA ajuda a examinar alegações feitas em vídeos do YouTube, apresentando evidências e perguntas para reflexão. Ela não exige cadastro, não pede nome, e-mail ou senha e não acessa outros sites além do YouTube e do próprio backend.

## Quando a extensão age

A extensão só lê ou envia dados quando você clica em **Checar Alegações** em uma página de vídeo do YouTube (`https://www.youtube.com/*`). Ela não registra o histórico de navegação, não lê cookies e não monitora outras abas ou sites.

## Dados tratados

| Dado | Origem | Para quê | Onde fica |
|:---|:---|:---|:---|
| Legenda (transcrição) do vídeo, título, nome do canal, data de publicação, duração e identificador do vídeo | Página do vídeo aberta, no momento do clique | Identificar alegações e buscar evidências | Enviado ao backend EvidencIA para processamento; não é armazenado após a resposta |
| Identificador anônimo de instalação (valor aleatório, sem relação com sua conta) | Gerado pela extensão | Emitir a credencial temporária que protege o backend contra abuso | No seu navegador (`chrome.storage.local`); enviado ao backend ao renovar a credencial |
| Credencial temporária de acesso (validade de 24 horas) | Emitida pelo backend | Autorizar as chamadas da extensão | No seu navegador |
| Resultado das análises | Resposta do backend | Exibir novamente o resultado sem nova chamada | No seu navegador, por até 24 horas |
| Avaliação voluntária ("Útil" / "Não útil") e motivo opcional, com o identificador do vídeo | Seu clique no painel | Medir a utilidade das análises | Registro técnico do backend, sem dado pessoal |
| Endereço IP | Conexão de rede | Limitar a taxa de requisições (proteção contra abuso) | Contador temporário de até um minuto; registros técnicos da hospedagem |

A EvidencIA não vende, aluga nem compartilha dados para publicidade, criação de perfis ou avaliação de crédito, e não usa os dados para outra finalidade além da descrita acima.

## Serviços de terceiros

Para gerar a análise, o backend pode repassar parte dos dados a serviços que agem como operadores:

- **Provedor de modelo de linguagem** (atualmente via OpenRouter): recebe a transcrição e o título do vídeo para extrair alegações e formular perguntas. O tratamento por esse provedor segue a política de privacidade dele.
- **Google Fact Check Tools API**: recebe o texto de cada alegação como termo de busca por checagens publicadas.
- **Render** (hospedagem do backend): processa as conexões e mantém registros técnicos de acesso.

## Armazenamento local e exclusão

Os dados guardados no navegador ficam em `chrome.storage.local`. Para removê-los, desinstale a extensão ou limpe os dados dela em `chrome://extensions`. O backend não mantém contas nem um histórico de análises associado a você.

## Segurança

As comunicações com o backend usam HTTPS. Nenhuma chave de provedor de IA fica na extensão; as credenciais de serviços ficam apenas no servidor.

## Crianças

A extensão não é direcionada a menores de 13 anos e não coleta intencionalmente dados de crianças.

## Seus direitos (LGPD)

Você pode pedir informações sobre o tratamento descrito aqui ou solicitar exclusão abrindo uma issue em [github.com/evidencia-grupo/EvidencIA/issues](https://github.com/evidencia-grupo/EvidencIA/issues). Como os dados enviados não são associados a você, em geral não há registro pessoal a localizar.

## Alterações

Mudanças nesta política serão publicadas nesta página, com nova data de vigência, antes de valerem.
