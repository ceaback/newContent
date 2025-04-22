*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Buscar Módulos
    [Tags]    TC01
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204