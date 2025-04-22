*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Publicar Slide Em Produção
    [Tags]    TC14
    Publicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_production}    expected_status=204
Despublicar Slide Em Produção
    [Tags]    TC15
    Despublicar Slide Em Produção    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_false_production}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204