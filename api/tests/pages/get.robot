*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Buscar Página
    [Tags]    TC002
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=422