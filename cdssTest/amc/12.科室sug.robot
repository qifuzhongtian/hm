*** Settings ***
Suite Setup       amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# subject    String    是    科室名
# password
# ...               # String    是    密码

*** Test Cases ***
12.1 科室sug
    [Documentation]    断言error:"subject存在口腔科"
    [Tags]    skip
    ${getRes}    amc管理端_科室sug    subject=
    ${aj}    Evaluate    [aj['subject'] for aj in $getRes['body']]
    Should Contain    ${aj}    口腔科
