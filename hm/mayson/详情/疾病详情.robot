*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
疾病详情显示正常
    [Documentation]    断言:"titleId"
    ${getRes}    疾病详情    diseaseId=8456C0ADE0
    # Should Be Equal As Strings    ${getRes['body']['catalogueList'][0]['titleId']}    341548
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docContentList']]
    Should Contain    ${aj}    腰肌劳损
