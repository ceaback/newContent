*** Settings ***
Resource    ../utils/main.resource
Library    JSONLibrary

*** Keywords ***
Assert Json Schema
    [Arguments]     ${response_json}   
    Validate Json By Schema File
    ...    ${response_json}
    ...    ${EXECDIR}\\schemas\\listarPaginaPorNome.json