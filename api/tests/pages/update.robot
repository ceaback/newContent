*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Atualizar Página
    [Tags]    TC003
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Atualizar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página      ID_PAGE=${ID_PAGE}    expected_status=204