*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Deletar Slide App Scroll
    [Tags]    TC13
    Deletar Slide App Scroll    SLIDE_ID=${ID_SLIDE}    expected_status=204
    Deletar Página                  ID_PAGE=${ID_PAGE}    expected_status=204