*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***
Criar Página
    [Arguments]    ${expected_status}
    ${NAME_PAGE}=    FakerLibrary.Color Name

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data={"type": "app-page-create-v1","payload": {"Name": "${NAME_PAGE}","PageTypeId": 1}}
    ...    expected_status=${expected_status}      
      
    ${retorno_create}    Set Global Variable    ${response}

    Return From Keyword    ${NAME_PAGE}

    # ${schema_contract}  Get Json Schema  ${nome_do_schema}
    # Validate Jsonschema From File    ${schema_contract}    ${nome_do_schema}

Buscar Página
    [Arguments]    ${NAME_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    GET On Session    
    ...    alias=api    
    ...    url=/pages/${NAME_PAGE}    
    ...    headers=${headers}
    ...    expected_status=${expected_status}
    ${ID_PAGE}               Set Variable      ${response.json()}[page][id]
    ${NAME_PAGE}             Set Variable      ${response.json()}[page][name]
    Set Global Variable    ${ID_PAGE}
    Set Global Variable    ${NAME_PAGE}

    Return From Keyword    ${ID_PAGE}
Buscar Página Retornando Modulo    
    [Arguments]    ${NAME_PAGE}   ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    GET On Session    
    ...    alias=api    
    ...    url=/pages/${NAME_PAGE}    
    ...    headers=${headers}
    ...    expected_status=${expected_status} 
    ${NAME_PAGE}             Set Variable      ${response.json()}[page][name]
    ${MODULE_ID}             Set Variable    ${response.json()}[modulesFooter][0][id]
    Set Global Variable    ${NAME_PAGE}
    Set Global Variable    ${MODULE_ID}
    Return From Keyword    ${MODULE_ID}
    Return From Keyword    ${NAME_PAGE}

Atualizar Página
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${NAME_PUT}=    FakerLibrary.Name Male

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}  
    ...  data={"type": "app-page-update-v1","payload": {"id":"${ID_PAGE}", "Name": "${NAME_PUT}"}}    
    ...    expected_status=${expected_status}  
    
    ${retorno_atualizar}    Set Variable    ${response}
    Return From Keyword    ${NAME_PUT}

Publicar Pagina Homologação
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-staging-v1","payload":{"id":"${ID_PAGE}","isStaging": true}}
    ...    expected_status=${expected_status}    
    
    ${retorno_publicar}    Set Variable    ${response}

Despublicar Pagina Homologação
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-staging-v1","payload":{"id":"${ID_PAGE}","isStaging": false}}
    ...    expected_status=${expected_status}    
    
    ${retorno_publicar}    Set Variable    ${response}

Publicar Pagina Produção
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-production-v1","payload":{"id":"${ID_PAGE}","isProd": true}}
    ...    expected_status=${expected_status}    
    
    ${retorno_publicar}    Set Variable    ${response}

Despublicar Pagina Produção
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-production-v1","payload":{"id":"${ID_PAGE}","isProd": false}}
    ...    expected_status=${expected_status}

    ${retorno_publicar}    Set Variable    ${response}

Deletar Página
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary    Content-Type=application/json    Authorization=automacao-qa
    ${response}    Post On Session    
    ...    alias=api
    ...    url=/commands    
    ...    headers=${headers}
    ...    data={"type": "app-page-delete-v1","payload": {"id":"${ID_PAGE}"}}
    ...    expected_status=${expected_status}  
    
    ${retorno_delete}    Set Variable    ${response}