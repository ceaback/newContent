*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***
Buscar Slides GET Modules
    [Arguments]    ${ID_PAGE}     ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    
    ...    GET On Session    
    ...    alias=api    
    ...    url=/slides?IdPage=${ID_PAGE}    
    ...    headers=${headers}
    ...    expected_status=${expected_status} 
    
    ${ID_SLIDE}               Set Variable      ${response.json()}[0][id]
    Set Global Variable    ${ID_SLIDE} 
    Return From Keyword    ${ID_SLIDE}

Publicar Módulo Em Produção
     [Arguments]    ${ID_PAGE}    ${MODULE_ID}   ${file}    ${expected_status}

    ${body}     Get File        path=${EXECDIR}\\inputs\\modules\\productionModule.json

    ${body}    Replace String Using Regexp    ${body}   _typeModuleProduction    ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _idModule                ${MODULE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idPage                  ${ID_PAGE}
    ${body}    Replace String Using Regexp    ${body}   "_isProd"          ${file}[IsProd]

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}

Despublicar Módulo Em Produção
     [Arguments]    ${ID_PAGE}    ${MODULE_ID}    ${file}    ${expected_status}

   ${body}     Get File        path=${EXECDIR}\\inputs\\modules\\productionModule.json

    ${body}    Replace String Using Regexp    ${body}   _typeModuleProduction    ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _idModule                ${MODULE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idPage                  ${ID_PAGE}
    ${body}    Replace String Using Regexp    ${body}   "_isProd"          ${file}[IsProd]

    ${headers}    Create Dictionary      Content-Type=application/json
    
    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
    
    ${retorno_criar_Slide}    Set Variable    ${response}