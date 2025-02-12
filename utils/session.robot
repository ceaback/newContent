*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***

Criar Sessão
    ${headers}    Create Dictionary      
    ...    Content-Type=application/json
    ...    Authorization=automacao-qa
    Create Session    
    ...    alias=api    
    ...    url=${base_url_dev}    
    ...    headers=${headers}
    ...    disable_warnings=1
    
Fechar Sessão
    Delete All Sessions

# gera relatório de execução da requisição
#     [Documentation]  Keyword responsável por validar se a resposta da requisição trouxe algo esperado.
#     ${response_curl}  Retorna curl da chamada
#     Run Keyword If Test Failed  Fail  msg=CURL DA REQUISIÇÃO: ${response_curl}\n\nSTATUS CODE RETORNADO: ${response.status_code}\n\nRESPOSTA:\n${response.json()}\n

# Retorna curl da chamada
#     [Documentation]  Keyword responsável por gerar um curl da requisição.
#     ${response_curl}  geraCurl    ${response}
#     Log   ${response_curl}
#     Return From Keyword  ${response_curl}
