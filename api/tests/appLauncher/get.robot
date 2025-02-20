# *** Settings ***
# Resource    ../../../utils/main.resource

# Suite Setup    Criar Sessão
# Suite Teardown    Fechar Sessão

# *** Test Cases ***
# Buscar Página e Módulo Launcher
#     [Tags]    TC030
#     ${ID_PAGE_APPLauncher}      Buscar Página AppLauncher                                                    expected_status=200
#     ${ID_MODULE_APPLauncher}    Buscar Módulo AppLauncher    ID_PAGE_APPLAUNCHER=${ID_PAGE_APPLAUNCHER}      expected_status=200