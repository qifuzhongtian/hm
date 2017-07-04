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
    # 1.2fff
    #    ${ajson}    Evaluate    {"api": "api.name","v": "1.0","code": "10000","error_msg": "success","data": {"userlist": [{"uid": "94901","nickName": "test1",}, {"uid": "1010640","nickName": "test2",}, {"uid": "1012130","nickName": "test3",}]}}
    #    log    ${ajson['data']['userlist'][0]['nickName']}
    #    ${aj}    Evaluate    [aj['nickName'] for aj in $ajson['data']['userlist']]
    #    log    ${aj}
    #    Should Contain    ${aj}    test3
