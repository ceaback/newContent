*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup       Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Buscar Slide App Scroll
    [Tags]    TC18
    Deletar Página                  ID_PAGE=${ID_PAGE}    expected_status=204