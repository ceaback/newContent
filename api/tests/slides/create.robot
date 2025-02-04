*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup       Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Criar Slide App Scroll
    [Tags]    TC008

    ${NAME_PAGE}    Criar Página    
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}
    ${MODULE_ID}    Buscar Página Retornando Modulo    NAME_PAGE=${NAME_PAGE}
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{create_slide_app_scroll}    expected_status=201
    Deletar Página                  ID_PAGE=${ID_PAGE}    expected_status=204