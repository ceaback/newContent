*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Validar Publicar Módulo Em Produção
    [Tags]    TC010
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}      Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{create_slide_app_scroll}    expected_status=201
    ${ID_SLIDE}    Buscar Slides GET Modules    ID_PAGE=${ID_PAGE}        expected_status=200
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
    Publicar Módulo Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{module_true_production}    expected_status=204
    Publicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=204
    Despublicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204


Validar Despublicar Módulo Em Produção
    [Tags]    TC011
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}      Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{create_slide_app_scroll}    expected_status=201
    ${ID_SLIDE}    Buscar Slides GET Modules    ID_PAGE=${ID_PAGE}        expected_status=200
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
    Publicar Módulo Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{module_true_production}    expected_status=204
    Despublicar Módulo Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{module_false_production}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204