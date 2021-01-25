*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
文献详情
    [Documentation]    doc/seer/v_1_0/document/detail
    ############评估历史#############
    ${getRes}    文献详情    documentId=9410C674FE
    # ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    # Should Contain    ${aj}    脑出血急性期血压管理新进展
    Should Be Equal As Strings    ${getRes['body']['cnTitle']}    脑出血急性期血压管理新进展
