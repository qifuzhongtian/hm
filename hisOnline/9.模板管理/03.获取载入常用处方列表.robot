*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

# tempName    Strng   否   处方名
# tempAuthority    int 是   处方类型 0：全部，1：个人，2：诊所

*** Test Cases ***
3.1 显示全部处方
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=    tempAuthority=0
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板
    # Should Contain    ${aj}    尹博安全用药处方


3.2 显示个人处方
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=    tempAuthority=1
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板


3.3 显示诊所处方
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=    tempAuthority=2
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板


3.4 处方名称搜索-模糊搜索
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=1    tempAuthority=0
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板

3.5 处方名称搜索-模糊搜索-诊所
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=处方    tempAuthority=2
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板


3.6 处方名称搜索-精确搜索
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=处方    tempAuthority=0
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板


3.7 处方名称搜索-精确搜索-诊所
    [Documentation]    断言:"tempName"
    ${getRes}    获取载入常用处方列表    tempName=处方    tempAuthority=2
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    处方模板

