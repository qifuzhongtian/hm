*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
文献诊断字典
    ${getRes}    文献诊断字典
    ${aj}    Evaluate    [aj['section'] for aj in $getRes['body']]
    Should Contain    ${aj}    心脏科
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
