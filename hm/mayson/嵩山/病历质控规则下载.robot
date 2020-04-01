*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
# 病历质控规则下载
#     [Documentation]    断言:"响应码200"
#     ${getRes}    病历质控规则下载
#     Should Be Equal As Strings    ${getRes.status_code}    200



