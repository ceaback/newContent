*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Buscar Página
    [Tags]    TC002
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}      Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    ${MODULE_ID}    Buscar Página Retornando Modulo     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204