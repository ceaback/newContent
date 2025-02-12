*** Settings ***
Resource   ../utils/main.resource

*** Variables ***
###criar slide###
&{create_slide_app_scroll}
...    type=app-slide-product-scroll-create-v1
...    title=Teste Automacao
...    numberTypes=4
...    sort={\\"key\\":\\"\\"}
...    filter={\\"category-1\\":[\\"casa\\"]}
...    category=BEL
...    lastUpdate=2025-02-04T11:09:37


&{update_slide_app_scroll}
...    type=app-slide-product-scroll-update-v1
...    index=0
...    type=4
...    typeModule=12
...    filter={\\"category-1\\":[\\"casa\\"]}
...    sort={\\"key\\":\\"\\"}
...    title=Teste Automacao
...    category=BEL
...    order=1,
...    lastUpdate=2025-02-04T11:09:37-03:00
...    title=Teste Automacao
...    isStaging=false
...    isProd=false
...    isScheadule=false
...    userUpdated=Automacao QA
...    lastUpdated=2025-02-04T16:12:13.799-03:00
...    order=1
...    typeModule=12
...    id=0
...    name=NoMessage
...    text=Sem mensagem
...    showTitle=true

&{slide_true_production}
...    type=app-slide-publish-production-v1
...    IsProduction= true

&{slide_false_production}
...    type=app-slide-publish-production-v1
...    IsProduction= false

&{slide_true_staging}
...    type=app-slide-publish-staging-v1
...    IsProduction= true

&{slide_false_staging}
...    type=app-slide-publish-staging-v1
...    IsProduction= false

###módulos***

&{module_true_production}
...    type=app-module-publish-production-v1
...    IsProd=true

&{module_false_production}
...    type=app-module-publish-production-v1
...    IsProd=false

&{module_true_staging}
...    type=app-module-publish-staging-v1
...    IsProd=true

&{module_false_staging}
...    type=app-module-publish-staging-v1
...    IsProd=false