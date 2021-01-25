*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
最新文献
    [Documentation]    doc/seer/document/newest
    ############评估历史#############
    ${getRes}    最新文献
    ${aj}    Evaluate    [aj for aj in $getRes['body']['searchDiagnose']]
    Should Contain    ${aj}    心肌病
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
