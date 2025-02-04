*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***
Criar Slide App Scroll
    [Arguments]    ${ID_PAGE}    ${MODULE_ID}   ${file}    ${expected_status}

    ${body}     Get File        path=${EXECDIR}\\inputs\\slides\\createAppScroll.json

    ${body}    Replace String Using Regexp    ${body}    _type         ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _title         ${file}[title]
    ${body}    Replace String Using Regexp    ${body}   "_numberType"    ${file}[numberTypes]
    ${body}    Replace String Using Regexp    ${body}   _sort          ${file}[sort]
    ${body}    Replace String Using Regexp    ${body}   _filter        ${file}[filter]
    ${body}    Replace String Using Regexp    ${body}   _category      ${file}[category]
    ${body}    Replace String Using Regexp    ${body}   _lastUpdate    ${file}[lastUpdate]
    ${body}    Replace String Using Regexp    ${body}   _title         ${file}[title]
    ${body}    Replace String Using Regexp    ${body}   _idModule      ${MODULE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idPage        ${ID_PAGE}

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}
 
Atualizar Slide App Scroll
    [Arguments]    ${ID_PAGE}    ${MODULE_ID}    ${SLIDE_ID}    ${file}    ${expected_status}

    ${body}     Get File        path=${EXECDIR}\\inputs\\slides\\createAppScroll.json

    ${body}    Replace String Using Regexp    ${body}    _type         ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _title         ${file}[title]
    ${body}    Replace String Using Regexp    ${body}   "_numberType"    ${file}[numberTypes]
    ${body}    Replace String Using Regexp    ${body}   _sort          ${file}[sort]
    ${body}    Replace String Using Regexp    ${body}   _filter        ${file}[filter]
    ${body}    Replace String Using Regexp    ${body}   _category      ${file}[category]
    ${body}    Replace String Using Regexp    ${body}   _lastUpdate    ${file}[lastUpdate]
    ${body}    Replace String Using Regexp    ${body}   _title         ${file}[title]
    ${body}    Replace String Using Regexp    ${body}   _idModule      ${MODULE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idPage        ${ID_PAGE}

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}

Publicar Slide Em Produção
     [Arguments]    ${ID_PAGE}    ${MODULE_ID}    ${SLIDE_ID}    ${file}    ${expected_status}

    ${body}     Get File        path=${EXECDIR}\\inputs\\slides\\productionSlide.json

    ${body}    Replace String Using Regexp    ${body}   _typeProduction          ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _slideID                 ${SLIDE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idModule                ${MODULE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idPage                  ${ID_PAGE}
    ${body}    Replace String Using Regexp    ${body}   "_isProduction"          ${file}[IsProduction]

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}

Despublicar Slide Em Produção
     [Arguments]    ${ID_PAGE}    ${MODULE_ID}    ${SLIDE_ID}    ${file}    ${expected_status}

    ${body}     Get File        path=${EXECDIR}\\inputs\\slides\\productionSlide.json

    ${body}    Replace String Using Regexp    ${body}   _typeProduction          ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _slideID                 ${SLIDE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idModule                ${MODULE_ID}
    ${body}    Replace String Using Regexp    ${body}   _idPage                  ${ID_PAGE}
    ${body}    Replace String Using Regexp    ${body}   "_isProduction"          ${file}[IsProduction]

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}