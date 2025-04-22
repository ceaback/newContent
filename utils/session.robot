*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***

Criar Sessão
    ${headers}    Create Dictionary    Content-Type=application/json    Authorization=automacao-qa
    Create Session    alias=api    url=${base_url_dev}    headers=${headers}    disable_warnings=1
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{create_slide_app_scroll}    expected_status=201
    ${ID_SLIDE}    Buscar Slides GET Modules    ID_PAGE=${ID_PAGE}        expected_status=200
Fechar Sessão
    Delete All Sessions
