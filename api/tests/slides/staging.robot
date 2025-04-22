*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Publicar Slide Em Homologação
    [Tags]    TC16
    Publicar Slide Em Homologação    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_true_staging}    expected_status=204
Despublicar Slide Em Homologação
    [Tags]    TC17
    Despublicar Slide Em Homologação    ID_PAGE=${ID_PAGE}    MODULE_ID=${MODULE_ID}    SLIDE_ID=${ID_SLIDE}    file=&{slide_false_staging}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204