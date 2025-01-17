*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Atualizar Página
    [Tags]    TC003
    ${NAME_PAGE}    Criar Página
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}
    Atualizar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página      ID_PAGE=${ID_PAGE}    expected_status=204