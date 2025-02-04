*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Publicar Slide Em Produção
    [Tags]    TC010
    ${NAME_PAGE}    Criar Página
    ${ID_PAGE}      Buscar Página     NAME_PAGE=${NAME_PAGE}
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{create_slide_app_scroll}    expected_status=201
    ${ID_SLIDE}    Buscar Slides GET Modules    ID_PAGE=${ID_PAGE}        expected_status=200
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
Despublicar Slide Em Produção
    [Tags]    TC010
    ${NAME_PAGE}    Criar Página
    ${ID_PAGE}      Buscar Página     NAME_PAGE=${NAME_PAGE}
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{create_slide_app_scroll}    expected_status=201
    ${ID_SLIDE}    Buscar Slides GET Modules    ID_PAGE=${ID_PAGE}        expected_status=200
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
    Despublicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_false_production}    expected_status=204
    
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204