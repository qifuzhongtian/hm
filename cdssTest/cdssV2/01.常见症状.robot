*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
1.1常见症状
    [Documentation]    断言:""
    # 1.1常见症状
    #    [Documentation]    断言error:"commonSymptom[0]=发热"
    #    常见症状    ['body']['commonSymptom'][0]    发热
    ${getRes}    常见症状
    log    ${getRes}
    Should Be Equal As Strings    ${getRes['body']['commonSymptom'][0]}    发热
    # [Teardown]    Delete All Sessions

