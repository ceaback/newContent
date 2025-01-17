*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Deletar Página
    [Tags]    TC008
    ${NAME_PAGE}    Criar Página
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=422
