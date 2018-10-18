*** Settings ***
# Suite Setup       amcPc版_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# subject    String    是    科室名
# password
# ...               # String    是    密码

*** Test Cases ***
科室sug
    [Documentation]    断言error:"subject存在口腔科"
    ${getRes}    amcPc版_科室sug    subject=
    ${aj}    Evaluate    [aj for aj in $getRes['body']]
    Should Contain    ${aj}    临床心理专业
