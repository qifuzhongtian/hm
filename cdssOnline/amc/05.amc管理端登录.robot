*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# name    String  是   登录名
# password  String  是   密码
# loginStatus   Integer 是   登录状态

*** Test Cases ***
# 10.1 用户登录
#     [Documentation]    断言error:""
#     ${getRes}    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

