*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***

Criar Página
    ${NAME_PAGE}=    FakerLibrary.Color Name

    ${headers}    Create Dictionary      Content-Type=application/json
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}      
    ...    data={"type": "app-page-create-v1","payload": {"Name": "${NAME_PAGE}","PageTypeId": 1}}
      
    ${retorno_create}    Set Variable    ${response}
    Log To Console    ${retorno_create}
    Return From Keyword    ${NAME_PAGE}

Buscar Página
    [Arguments]    ${NAME_PAGE}

    ${response}    GET On Session    alias=api    url=/pages/${NAME_PAGE}
    ${ID_PAGE}               Set Variable      ${response.json()}[page][id]
    ${NAME_PAGE}             Set Variable      ${response.json()}[page][name]

    Log To Console         ${ID_PAGE}
    Return From Keyword    ${ID_PAGE}

Buscar Página Retornando Slide
    [Arguments]    ${NAME_PAGE}

    ${response}    GET On Session    alias=api    url=/pages/${NAME_PAGE}
    ${NAME_PAGE}             Set Variable      ${response.json()}[page][name]
    ${MODULE_PAGE_SCROLL}    Set Variable      ${response.json()}[modulesFooter][0][id]

    Log To Console         ${NAME_PAGE}
    Log To Console         ${MODULE_PAGE_SCROLL}
    
    Return From Keyword    ${MODULE_PAGE_SCROLL}
    Return From Keyword    ${NAME_PAGE}

Atualizar Página
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${NAME_PUT}=    FakerLibrary.Name Male

    ${headers}    Create Dictionary      Content-Type=application/json  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}  
    ...  data={"type": "app-page-update-v1","payload": {"id":"${ID_PAGE}", "Name": "${NAME_PUT}"}}    
    ...    expected_status=${expected_status}  
    
    ${retorno_atualizar}    Set Variable    ${response}
    Log To Console    ${retorno_atualizar}
    Return From Keyword    ${NAME_PUT}

Publicar Pagina Homologação
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-staging-v1","payload":{"id":"${ID_PAGE}","isStaging": true}}
    ...    expected_status=${expected_status}    
    
    ${retorno_publicar}    Set Variable    ${response}
    Log To Console    ${retorno_publicar}


Despublicar Pagina Homologação
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-staging-v1","payload":{"id":"${ID_PAGE}","isStaging": false}}
    ...    expected_status=${expected_status}    
    
    ${retorno_publicar}    Set Variable    ${response}
    Log To Console    ${retorno_publicar}


Publicar Pagina Produção
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-production-v1","payload":{"id":"${ID_PAGE}","isStaging": true}}
    ...    expected_status=${expected_status}    
    
    ${retorno_publicar}    Set Variable    ${response}
    Log To Console    ${retorno_publicar}

Despublicar Pagina Produção
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json  
    ${response}    POST On Session    
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-publish-production-v1","payload":{"id":"${ID_PAGE}","isStaging": false}}
    ...    expected_status=${expected_status}

    ${retorno_publicar}    Set Variable    ${response}
    Log To Console    ${retorno_publicar}


Deletar Página
    [Arguments]    ${ID_PAGE}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json
    ${response}    Post On Session    
    ...    alias=api
    ...    url=/commands    
    ...    headers=${headers}    
    ...    data={"type": "app-page-delete-v1","payload": {"id":"${ID_PAGE}"}}
    ...    expected_status=${expected_status}  
    
    ${retorno_delete}    Set Variable    ${response}
    Log To Console    ${retorno_delete}


