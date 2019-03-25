*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Run Keywords    amc进入    AlgoID=2959    age=44    ageStyle=岁
...               # gender=88    symptomId=10    patientName=接口发    patientPhone=13810578454    # ...    # AND    amc下一题
...               # questionId=${292}    type=option    answer=1    # ...    # AND    用户登录    name=tester
...               # password=9d06407716dd900dc25e2771cbdfa1dc
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型 是否必须 说明

*** Test Cases ***
3.1 查询常用药品
    [Tags]
    ${getRes}    查询常用药品
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']]
    Should Contain    ${aj}    门冬胰岛素注射液
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
