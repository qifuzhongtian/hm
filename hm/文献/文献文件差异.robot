*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Force Tags        skip
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
# 文献文件差异
#     [Documentation]    断言:""
#     ${getRes}    文献文件差异
#     Should Be Equal As Strings    ${getRes}    ${EMPTY}

