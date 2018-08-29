*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
2.1常见诊断
    [Documentation]    断言:"diseaseName=急性上呼吸道感染"
    ${getRes}    常见诊断
    Should Be Equal As Strings    ${getRes['body']['commonDiseases'][0]['diseaseName']}    急性上呼吸道感染
    # [Teardown]    Delete All Sessions
