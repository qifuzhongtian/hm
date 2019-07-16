*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
文献标签
    ############评估历史#############
    ${getRes}    文献标签
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['1']]
    Should Contain    ${aj}    消化科
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
