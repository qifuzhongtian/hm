*** Settings ***
Suite Setup       ame登录    userName=testonline    password=a75e90383cb40793001731b2e159f822    # 字段名 类型 是否必须 说明    # name    String    是
Force Tags        skip
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
查询:帕金森
    [Documentation]    ame/search
    #    ${getRes}    ame查询    name=
    #    ${aj}    Evaluate    [aj['zhName'] for aj in $getRes['body']['xmlAliasList']]
    #    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #    Should Contain    ${aj}    肺栓塞
    ${getRes}    ame查询    name=帕金森
    ${aj}    Evaluate    [aj['zhName'] for aj in $getRes['body']['xmlAliasList']]
    Should Contain    ${aj}    帕金森病

查询:搜索词为简拼
    [Documentation]    ame/search,搜索词为简拼
    ${getRes}    ame查询    name=pjs
    ${aj}    Evaluate    [aj['zhName'] for aj in $getRes['body']['xmlAliasList']]
    Should Contain    ${aj}    帕金森病

查询:搜索词为英文
    [Documentation]    ame/search,搜索词为英文
    ${getRes}    ame查询    name=Parkinson
    ${aj}    Evaluate    [aj['enName'] for aj in $getRes['body']['xmlAliasList']]
    Should Contain    ${aj}    Parkinson disease
