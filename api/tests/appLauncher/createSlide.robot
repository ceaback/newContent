# *** Settings ***
# Resource    ../../../utils/main.resource

# Suite Setup    Criar Sessão
# Suite Teardown    Fechar Sessão

# *** Test Cases ***
# Criar Slide Launcher
#     [Tags]    TC030
#     ${ID_PAGE_APPLAUNCHER}      Buscar Página AppLauncher                                                    expected_status=200
#     ${ID_MODULE_APPLAUNCHER}    Buscar Módulo AppLauncher   ID_PAGE_APPLAUNCHER=${ID_PAGE_APPLAUNCHER}      expected_status=200
#     Criar Slide App Launcher Recurrence    ID_PAGE_APPLAUNCHER=${ID_PAGE_APPLAUNCHER}      ID_MODULE_APPLAUNCHER=${ID_MODULE_APPLAUNCHER}    file=&{create_slide_app_launcher_recurrence}    expected_status=201
#     ${ID_SLIDE_APPLAUNCHER}     Buscar Slide AppLauncher    ID_PAGE_APPLAUNCHER=${ID_PAGE_APPLAUNCHER}    expected_status=200
#     Deletar Slide               ID_SLIDE_APPLAUNCHER=${ID_SLIDE_APPLAUNCHER}    expected_status=204