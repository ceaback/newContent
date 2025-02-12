*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Publicar Página Produção
    [Tags]    TC006
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Publicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=422
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204


Teste Despublicar Página Produção
    [Tags]    TC007
    ${NAME_PAGE}    Criar Página    expected_status=201
    ${ID_PAGE}    Buscar Página     NAME_PAGE=${NAME_PAGE}    expected_status=200
    Despublicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=200
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
