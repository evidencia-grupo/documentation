# Publicação na Chrome Web Store

Roteiro para colocar o backend em produção e publicar a extensão. Os passos marcados como **responsável humano** exigem contas, pagamentos ou segredos e não são automatizados.

## Visão geral

1. Publicar o backend no Render (Blueprint `render.yaml`).
2. Gerar o pacote da extensão apontando para o backend publicado.
3. Criar o item na Chrome Web Store, preencher a listagem e enviar para revisão.
4. Restringir o CORS ao ID definitivo da extensão.

## 1. Backend em produção (Render)

Pré-requisitos (**responsável humano**):

- Chave de API de um provedor compatível com a API OpenAI (padrão: [OpenRouter](https://openrouter.ai/)). Confira se o modelo definido em `REMOTE_LLM_MODEL` continua disponível.
- Chave da [Google Fact Check Tools API](https://developers.google.com/fact-check/tools/api) no Google Cloud. **Sem ela, a produção não tem fonte de evidências**: o corpus de demonstração é bloqueado fora do desenvolvimento e todas as alegações aparecem como "sem evidência suficiente".

Passos:

1. No Render, **New > Blueprint**, selecione o repositório `evidencia-grupo/EvidencIA` (o app do GitHub do Render precisa de acesso à organização).
2. O Blueprint cria o serviço web `evidencia-backend` e a instância Key Value `evidencia-ratelimit` (rate limit compartilhado, sem acesso externo). `AUTH_SECRET` é gerado pelo próprio Render.
3. Preencha os valores pedidos: `REMOTE_LLM_API_KEY`, `GOOGLE_FACT_CHECK_API_KEY` e `CORS_ALLOWED_ORIGINS` (use `https://www.youtube.com` até conhecer o ID da extensão).
4. Plano: o `free` hiberna após 15 minutos sem uso, e a primeira análise seguinte pode passar do limite de 30 segundos da extensão. Para uso público, troque para `starter`.
5. Verifique: `GET https://<serviço>.onrender.com/api/v1/health` deve responder `healthy`, e `/api/v1/health/ready` deve responder HTTP 200.

O startup falha de propósito se faltar autenticação, Redis ou CORS sem curinga, ou se `LLM_PROVIDER=mock` em produção ou staging.

## 2. Pacote da extensão

Localmente:

```bash
cd extension
VITE_API_BASE_URL=https://<serviço>.onrender.com npm run package
```

O comando gera o build de produção, roda `verify:store` (ícones, permissões, hosts apenas HTTPS, ausência de código remoto) e produz `evidencia-chrome-web-store.zip`.

Pelo GitHub Actions: defina a variável de repositório `EVIDENCIA_API_BASE_URL` e rode o workflow **Release — Chrome Web Store Package** (ou crie uma tag `extension-vX.Y.Z`). O zip fica nos artefatos da execução.

## 3. Chrome Web Store (responsável humano)

1. Crie a conta de desenvolvedor no [Chrome Web Store Developer Dashboard](https://chrome.google.com/webstore/devconsole) (taxa única de registro) e verifique o e-mail de contato.
2. **New item** e envie o zip.
3. Preencha as abas com os textos abaixo, envie as imagens de `extension/store/` e defina a visibilidade.
4. **Submit for review**.

### Listagem

- **Nome:** EvidencIA — Fact-Checking para YouTube
- **Resumo (até 132 caracteres):** Investiga alegações de vídeos do YouTube com evidências de checagens publicadas e perguntas para reflexão.
- **Categoria:** Ferramentas (Tools). **Idioma:** Português (Brasil).
- **Descrição:**

> A EvidencIA ajuda você a examinar o que é dito em vídeos do YouTube. Ao clicar em **Checar Alegações**, a extensão lê a legenda do vídeo, separa as afirmações verificáveis e mostra, para cada uma, as evidências encontradas em checagens publicadas, com link para a fonte original.
>
> A EvidencIA não dá nota ao vídeo nem um veredito automático. Quando não há evidência suficiente, ela diz isso claramente e sugere perguntas para você refletir antes de compartilhar.
>
> - Painel lateral acessível (teclado e leitores de tela, WCAG 2.1 AA)
> - Funciona apenas em páginas de vídeo do YouTube e só quando você clica
> - Sem cadastro e sem coleta de histórico de navegação
> - Resultados guardados no seu navegador por 24 horas
>
> Requer vídeos com legendas (automáticas ou manuais). As análises dependem de fontes públicas de checagem e podem não cobrir temas recentes.

- **Imagens:** `screenshot-1-botao.png`, `screenshot-2-alegacoes.png`, `screenshot-3-evidencias.png` (1280×800) e `promo-tile-440x280.png`. Regenere com `npm run store:screenshots` se a interface mudar. A fonte exibida (página "Dengue" do Ministério da Saúde) é real e foi conferida em 14/10/2026.
- **Site:** https://evidencia-grupo.github.io/documentation/
- **Política de privacidade:** https://evidencia-grupo.github.io/documentation/legal/politica-de-privacidade/

### Aba Privacidade

**Finalidade única:** Ajudar o usuário a examinar alegações feitas em vídeos do YouTube, mostrando evidências de checagens publicadas e perguntas para reflexão, sob demanda.

**Justificativas de permissão:**

| Permissão | Justificativa |
|:---|:---|
| `storage` | Guardar no navegador o resultado das análises por 24 horas, o identificador anônimo de instalação e a credencial temporária do backend. |
| `scripting` | Ler, na página do vídeo aberto, a lista de faixas de legenda e os metadados do player (título, canal, data), que só existem no contexto da página. |
| Host `https://www.youtube.com/*` | Exibir o botão e o painel nas páginas de vídeo e baixar a legenda do vídeo aberto. |
| Host do backend (`https://<serviço>.onrender.com/*`) | Enviar a legenda para análise e receber alegações e evidências. |

**Código remoto:** Não. Todo o código está no pacote; o backend devolve apenas dados JSON.

**Uso de dados**, a declarar:

- Coleta **Conteúdo do site** (legenda, título e canal do vídeo, enviados ao clicar em Checar Alegações).
- Não coleta: informações pessoalmente identificáveis, saúde, financeiras, autenticação, comunicações pessoais, localização, histórico da web, atividade do usuário.
- Certificar: não vende nem transfere dados a terceiros fora dos casos de uso aprovados; não usa dados para fins não relacionados à finalidade única; não usa para crédito ou empréstimos.

## 4. Depois da aprovação

1. Copie o ID do item no Developer Dashboard (ele é fixado no primeiro envio).
2. No Render, altere `CORS_ALLOWED_ORIGINS` para `https://www.youtube.com,chrome-extension://<ID>`.
3. Atualizações: aumente `version` em `extension/manifest.json`, gere o pacote e envie no mesmo item.
