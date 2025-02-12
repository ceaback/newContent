*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Publicar Página Homologação
    [Tags]    TC004
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Publicar Pagina Homologação     ID_PAGE=${ID_PAGE}    expected_status=204
    Despublicar Pagina Homologação     ID_PAGE=${ID_PAGE}    expected_status=204
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
    
Teste Despublicar Página Homologação
    [Tags]    TC005
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Despublicar Pagina Homologação     ID_PAGE=${ID_PAGE}    expected_status=200
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204

