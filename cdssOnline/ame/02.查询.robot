*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Setup        ame登录    userName=developer    password=9d06407716dd900dc25e2771cbdfa1dc
# 字段名 类型 是否必须 说明
# name    String  是   登录名
# password  String  是   密码
# loginStatus   Integer 是   登录状态

*** Test Cases ***
1.1 查询:搜索词为空
    [Documentation]    搜索词为空
    ${getRes}    ame查询    name=
    ${aj}    Evaluate    [aj['zhName'] for aj in $getRes['body']['xmlAliasList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肺栓塞

1.2 查询:搜索词不为空
    [Documentation]    搜索词不为空
    ${getRes}    ame查询    name=帕金森
    ${aj}    Evaluate    [aj['zhName'] for aj in $getRes['body']['xmlAliasList']]
    Should Contain    ${aj}    帕金森病

1.3 查询:搜索词为简拼
    [Documentation]    搜索词为简拼
    ${getRes}    ame查询    name=pjs
    ${aj}    Evaluate    [aj['zhName'] for aj in $getRes['body']['xmlAliasList']]
    Should Contain    ${aj}    帕金森病

1.4 查询:搜索词为英文
    [Documentation]    搜索词为英文
    ${getRes}    ame查询    name=Parkinson
    ${aj}    Evaluate    [aj['enName'] for aj in $getRes['body']['xmlAliasList']]
    Should Contain    ${aj}    Parkinson disease
