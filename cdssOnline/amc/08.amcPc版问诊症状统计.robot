*** Settings ***
# Suite Setup    Run Keywords    amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12    symptomName=体重问题（指南）    patientName=接口发    patientPhone=13810578454
# ...    AND    amc下一题    questionId=${292}    type=option     answer=1
# ...    AND    amcPc版_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明



*** Test Cases ***
13.1 问诊症状统计
    [Documentation]    断言error:"symptom存在 睡眠问题"
    ${getRes}    amcPc版_问诊症状统计    currentPage=1    pageSize=20    countmode=true    userGuid=    doctorGuid=    doctorName=    hospitalGuid=    serialNumber=
    # ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']]
    # Should Contain    ${aj}    体重问题（指南）
    Should Be Equal As Strings    ${getRes['body'][0]['symptom']}    体重问题（指南）

