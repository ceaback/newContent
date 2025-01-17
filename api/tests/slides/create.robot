*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup       Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Criar Slide App Scroll
    [Tags]    TC001

    ${NAME_PAGE}    Criar Página
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}
    ${ID_MODULE}    Buscar Página Retornando Slide     NAME_PAGE=${NAME_PAGE}   
    Criar Slide App Scroll          ID_PAGE=${ID_PAGE}    ID_MODULE=${ID_MODULE}    expected_status=422
    Deletar Página                  ID_PAGE=${ID_PAGE}    expected_status=204