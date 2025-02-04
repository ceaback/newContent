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

gera relatório de execução da requisição
    [Documentation]  Keyword responsável por validar se a resposta da requisição trouxe algo esperado.
    ${curl}  Retorna curl da chamada
    Run Keyword If Test Failed  Fail  msg=CURL DA REQUISIÇÃO: ${curl}\n\nSTATUS CODE RETORNADO: ${response.status_code}\n\nRESPOSTA:\n${response.json()}\n

Retorna curl da chamada
    [Documentation]  Keyword responsável por gerar um curl da requisição.
    ${response_curl}  geraCurl    response=true
    Log   ${response_curl}
    Return From Keyword  ${response_curl}
