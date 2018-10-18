*** Settings ***
# Suite Setup    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明


*** Test Cases ***
22.1 amcPc版科室统计图型
    [Documentation]    断言:"symptom存在睡眠问题"
    ${getRes}    amcPc版科室统计图型    enterTime=    recordTime=    symptom=
    ...    gender=    subject=
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    ${aj}    Evaluate    [aj['subject'] for aj in $getRes['body']]
    Should Contain    ${aj}    急诊医学科


