*** Settings ***
# Suite Setup    amcPc版_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
# Suite Setup    Run Keywords    amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12    symptomName=体重问题（指南）    patientName=接口发    patientPhone=13810578454
# ...    AND    amc下一题    questionId=${292}    type=option     answer=1
# ...    AND    amcPc版_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明


*** Test Cases ***

问诊科室统计
    [Documentation]    断言error:"急诊医学科"
    ${getRes}    amcPc版_问诊科室统计    currentPage=1    pageSize=20    countmode=true    userGuid=    doctorGuid=    doctorName=    hospitalGuid=    serialNumber=
    # ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']]
    # Should Contain    ${aj}    体重问题（指南）
    Should Be Equal As Strings    ${getRes['body'][0]['subject']}    急诊医学科

