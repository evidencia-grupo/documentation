# Politica de Seguranca — Documentacao EvidencIA

Este documento define a politica de seguranca da informacao e protecao documental do repositorio de documentacao do EvidencIA.

---

## 1. Escopo e Integridade Documental

O repositorio `documentation` contem a arquitetura conceitual, analise de requisitos, registros de decisoes arquiteturais (ADRs), modelagem formal de ameacas e relatorios de prontidao.

### Diretrizes de Seguranca Documental

1. **Zero Segredos ou Credenciais:** Nenhum arquivo de documentacao, diagrama ou anexo pode conter tokens reais, chaves privadas, connection strings ou segredos de infraestrutura. Todas as referencias devem utilizar exemplos ficticios ou marcadores genericos.
2. **Protecao de Dados e LGPD:** Nenhuma informacao pessoal identificavel (PII) de usuarios, estudantes ou participantes de testes deve constar nos relatorios ou transcricoes armazenadas.
3. **Imutabilidade de Decisoes Historicas:** Registros de decisoes humanas e atas de auditoria anteriores sao preservados com integridade e rastreabilidade estrita.

---

## 2. Reporte de Incidentes e Vulnerabilidades

Caso voce identifique exposicao acidental de dados, links inseguros ou inconsistencias que afetem a seguranca do produto nos documentos:

1. **Nao abra issue publica** nem pull request que reproduza o dado exposto.
2. **Canal preferencial:** abra um [GitHub Private Security Advisory](https://github.com/evidencia-grupo/documentation/security/advisories/new). Alternativa: `seguranca@evidencia.org`.
3. **Inclua:** arquivo e linha (ou URL publicada), tipo de exposicao, desde quando o conteudo esta publico, se ha copia em historico Git ou no site publicado, e impacto estimado.
4. **Nao inclua no relato** o segredo ou dado pessoal completo; descreva-o de forma parcial (por exemplo, os quatro primeiros caracteres de um token).
5. **Tempo de Resposta:** Confirmacao de recebimento em ate 48 horas uteis. Segredos expostos devem ser revogados no provedor de origem; remover o arquivo do repositorio nao invalida a credencial.

Para vulnerabilidades de codigo ou na extensao de navegador, consulte a politica do repositorio de desenvolvimento em [EvidencIA Security](https://github.com/evidencia-grupo/EvidencIA/blob/main/SECURITY.md).
