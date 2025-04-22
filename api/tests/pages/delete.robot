*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Deletar Página
    [Tags]    TC008
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=422
