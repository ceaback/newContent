*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Buscar Página
    [Tags]    TC002
    ${NAME_PAGE}    Criar Página
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204

