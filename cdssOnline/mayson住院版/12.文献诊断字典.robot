*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String



*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


文献诊断字典
    [Documentation]    断言:""
    ${getRes}   文献诊断字典
    ${aj}    Evaluate    [aj['section'] for aj in $getRes['body']]
    Should Contain    ${aj}    心脏科
    # Should Be Equal As Strings    ${getRes['head']['error']}    0








