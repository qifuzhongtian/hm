*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型 是否必须 说明

*** Test Cases ***
21.1 Amcpc版症状统计图型
    [Documentation]    断言:"symptom存在睡眠问题"
    ${getRes}    amcPc版症状统计图型    enterTime=    recordTime=    symptom=    gender=88    subject=
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    # ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']]
    # Should Contain    ${aj}    体重问题（指南）
    Should Be Equal As Strings    ${getRes['head']['error']}    0
