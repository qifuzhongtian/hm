*** Settings ***
# Suite Setup    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Setup    Run Keywords    amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12    patientName=接口发    patientPhone=13810578454
...    AND    amc下一题    questionId=${292}    type=option     answer=1
...    AND    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明


*** Test Cases ***
14.1 问诊科室统计
    [Documentation]    断言:"subject存在 急诊医学科"
    ${getRes}    amc管理端_问诊科室统计
    ${aj}    Evaluate    [aj['subject'] for aj in $getRes['body'][0]]
    Should Contain    ${aj}    急诊医学科
    # Should Be Equal As Strings    ${getRes['head']['error']}    0

    # ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']]
