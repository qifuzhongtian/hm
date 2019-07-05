*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
2.1常见诊断
    [Documentation]    断言:"diseaseName=急性上呼吸道感染"
    # 2.1常见诊断
    #    [Documentation]    断言:"id"
    #    常见诊断    ['body']['commonDiseases'][0]['id']    34051
    ${getRes}    常见诊断
    Should Be Equal As Strings    ${getRes['body']['commonDiseases'][0]['diseaseName']}    急性上呼吸道感染
    # [Teardown]    Delete All Sessions
