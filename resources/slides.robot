*** Settings ***
Resource   ../utils/main.resource

*** Keywords ***
Criar Slide App Scroll
    [Arguments]    ${ID_PAGE}    ${ID_MODULE}    ${expected_status}
    
    ${headers}    Create Dictionary      Content-Type=application/json  
    ${response}    POST On Session   
    ...    alias=api    
    ...    url=/commands    
    ...    headers=${headers}
    ...    data={"type": "app-slide-product-scroll-create-v1","payload": {"targets": [{"title": "SLIDEAPPSCROLL","type": 4,"sort": "{\"key\":\"\"}","filter": "{\"category-1\":[\"casa\"]}","category": "BEL","lastUpdate": "2024-10-25T12:09:14"}],"title": "SLIDEAPPSCROLL","idModule": "${ID_MODULE}","idPage": "${ID_PAGE}"}}  
    ...    expected_status=${expected_status}
     
    ${retorno_criar_Slide}    Set Variable    ${response}
    
    Log To Console    ${retorno_criar_Slide}
