*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Publicar Página Homologação
    [Tags]    TC004
    Publicar Pagina Homologação     ID_PAGE=${ID_PAGE}    expected_status=204

Teste Despublicar Página Homologação
    [Tags]    TC005
    Despublicar Pagina Homologação     ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=422

