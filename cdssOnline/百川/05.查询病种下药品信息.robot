*** Settings ***
# Suite Setup    Run Keywords    amc进入    AlgoID=2959    age=44    ageStyle=岁    gender=88    symptomId=10    patientName=接口发    patientPhone=13810578454
# ...    AND    amc下一题    questionId=${292}    type=option     answer=1
# ...    AND    用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明

*** Test Cases ***
5.1 查询病种下药品信息
    [Documentation]    断言=""
    ${getRes}    查询病种下药品信息    id=3
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['labelList']]
    Should Contain    ${aj}    一线药物
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
