*** Settings ***
Suite Setup    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# symptomName    String  是   症状名
# password  String  是   密码

*** Test Cases ***
11.1 症状sug
    [Documentation]    断言error:"SYMP_NAME 存在腹痛"
    ${getRes}    amc管理端_症状sug    symptomName=
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    腹痛

