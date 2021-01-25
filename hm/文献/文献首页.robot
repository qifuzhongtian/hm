*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
# 文献首页
#     [Documentation]
#     #log    文献前端服务
#     ${dict}    Create Dictionary    Content-Type=text/html    Huimei_id=${Huimei_id}
#     Create Session    api    ${doc_fe}    ${dict}
#     ${addr}    Get Request    api    /index.html?auth=%7B%22autherKey%22%3A%227195F12825788F09375C2DB1E922F108%22
#     log    ${addr.status_code}
#     Run Keyword If    ${addr.status_code}!=200    log    文献前端服务失败
#     ...    ELSE    log    TRUE
#     Should Be Equal As Strings    ${addr.status_code}    200
