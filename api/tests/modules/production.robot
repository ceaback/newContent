*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Validar Publicar Módulo Em Produção
    [Tags]    TC010
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
    Publicar Módulo Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{module_true_production}    expected_status=204
    Publicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=204
    Despublicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=204

Validar Despublicar Módulo Em Produção
    [Tags]    TC011
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
    Publicar Módulo Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{module_true_production}    expected_status=204
    Despublicar Módulo Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    file=&{module_false_production}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204