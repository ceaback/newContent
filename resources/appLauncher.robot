*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***
Buscar Página AppLauncher
    [Arguments]      ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    GET On Session    
    ...    alias=api    
    ...    url=/pageTypes/3/pages    
    ...    headers=${headers}
    ...    expected_status=${expected_status}
    ${ID_PAGE_APPLAUNCHER}               Set Variable      ${response.json()}[0][id]

    Return From Keyword    ${ID_PAGE_APPLAUNCHER}

Buscar Módulo AppLauncher
     [Arguments]    ${ID_PAGE_APPLAUNCHER}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    GET On Session    
    ...    alias=api    
    ...    url=/pages/${ID_PAGE_APPLAUNCHER}/modules   
    ...    headers=${headers}
    ...    expected_status=${expected_status}
    ${ID_MODULE_APPLAUNCHER}               Set Variable      ${response.json()}[0][id]
    
    Return From Keyword    ${ID_MODULE_APPLAUNCHER}

Buscar Slide AppLauncher
     [Arguments]    ${ID_PAGE_APPLAUNCHER}    ${expected_status}

    ${headers}    Create Dictionary      Content-Type=application/json    Authorization=automacao-qa
    ${response}    GET On Session    
    ...    alias=api    
    ...    url=/pages/${ID_PAGE_APPLAUNCHER}/modules   
    ...    headers=${headers}
    ...    expected_status=${expected_status}
    
    ${ID_SLIDE_APPLAUNCHER}    Set Variable      ${response.json()}[0][slides][0][id]
    Return From Keyword    ${ID_SLIDE_APPLAUNCHER}

    
Criar Slide App Launcher Recurrence
    [Arguments]    ${ID_PAGE_APPLAUNCHER}    ${ID_MODULE_APPLAUNCHER}   ${file}    ${expected_status}
    ${titleAppLauncher}=    FakerLibrary.Color Name

    ${body}     Get File        path=${EXECDIR}\\inputs\\appLauncher\\createSlideLauncher.json

    ${body}    Replace String Using Regexp    ${body}    _typeSlideLauncher    ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher         ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _urlImageLauncher          ${file}[urlImage]
    ${body}    Replace String Using Regexp    ${body}   _imgLauncher           ${file}[image]
    ${body}    Replace String Using Regexp    ${body}   _idLogo        ${file}[idLogo]
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher      ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher    ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher         ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   "_isScheadule"         ${file}[isScheadule]
    ${body}    Replace String Using Regexp    ${body}   _idModuleLauncher      ${ID_MODULE_APPLAUNCHER}
    ${body}    Replace String Using Regexp    ${body}   _idPageLauncher        ${ID_PAGE_APPLAUNCHER}

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}
    Return From Keyword    ${titleAppLauncher}

Criar Slide App Launcher Recurrence Limite Criação Slides
    [Arguments]    ${ID_PAGE_APPLAUNCHER}    ${ID_MODULE_APPLAUNCHER}   ${file}    ${expected_status}
    ${titleAppLauncher}=    FakerLibrary.Color Name
    FOR    ${counter}    IN RANGE    3

    ${body}     Get File        path=${EXECDIR}\\inputs\\appLauncher\\createSlideLauncher.json
    ${body}    Replace String Using Regexp    ${body}    _typeSlideLauncher    ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher         ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _urlImageLauncher          ${file}[urlImage]
    ${body}    Replace String Using Regexp    ${body}   _imgLauncher           ${file}[image]
    ${body}    Replace String Using Regexp    ${body}   _idLogo        ${file}[idLogo]
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher      ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher    ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher         ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   "_isScheadule"         ${file}[isScheadule]
    ${body}    Replace String Using Regexp    ${body}   _idModuleLauncher      ${ID_MODULE_APPLAUNCHER}
    ${body}    Replace String Using Regexp    ${body}   _idPageLauncher        ${ID_PAGE_APPLAUNCHER}

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
    END   
     
    ${retorno_criar_Slide}    Set Variable    ${response}
    Return From Keyword    ${titleAppLauncher}
   
Criar Slide App Launcher Primeiro Acesso
    [Arguments]    ${ID_PAGE_APPLAUNCHER}    ${ID_MODULE_APPLAUNCHER}   ${file}    ${expected_status}
    
    ${titleAppLauncher}=    FakerLibrary.Color Name

    ${body}     Get File        path=${EXECDIR}\\inputs\\appLauncher\\createSlideLauncher.json

    ${body}    Replace String Using Regexp    ${body}    _typeSlideLauncher    ${file}[type]
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher         ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _urlImageLauncher          ${file}[urlImage]
    ${body}    Replace String Using Regexp    ${body}   _imgLauncher           ${file}[image]
    ${body}    Replace String Using Regexp    ${body}   _idLogo        ${file}[idLogo]
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher      ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher    ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   _titleLauncher         ${titleAppLauncher}
    ${body}    Replace String Using Regexp    ${body}   "_isScheadule"         ${file}[isScheadule]
    ${body}    Replace String Using Regexp    ${body}   _idModuleLauncher      ${ID_MODULE_APPLAUNCHER}
    ${body}    Replace String Using Regexp    ${body}   _idPageLauncher        ${ID_PAGE_APPLAUNCHER}

    ${headers}    Create Dictionary      Content-Type=application/json

    ${response}    POST On Session
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data=${body}
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}
    Return From Keyword    ${titleAppLauncher}    

Deletar Slide
    [Arguments]    ${ID_SLIDE_APPLAUNCHER}    ${expected_status}

    ${headers}    Create Dictionary    Content-Type=application/json    Authorization=automacao-qa
    ${response}    Post On Session    
    ...    alias=api
    ...    url=/commands    
    ...    headers=${headers}
    ...    data={"type": "app-slide-delete-v1","payload": {"id":"${ID_SLIDE_APPLAUNCHER}"}}
    ...    expected_status=${expected_status}  
    
    ${retorno_delete}    Set Variable    ${response}