*** Settings ***
Resource    ../../../utils/main.resource

Suite Setup    Criar Sessão
Suite Teardown    Fechar Sessão

*** Test Cases ***
Teste Publicar Página Produção
    [Tags]    TC006
    Publicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=422

Teste Despublicar Página Produção
    [Tags]    TC007
    Despublicar Pagina Produção     ID_PAGE=${ID_PAGE}    expected_status=200
    Deletar Página    ID_PAGE=${ID_PAGE}    expected_status=204
