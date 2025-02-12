# *** Keywords ***
# Get Json Schema
#     [Documentation]  Keyword responsável por localizar e retornar um json schema desejado.
#     [Arguments]  ${nome_do_schema}
#     ${json_schema}  Get From Dictionary  ${INDEX_SCHEMAS}  ${nome_do_schema}
#     Return From Keyword  ${json_schema}