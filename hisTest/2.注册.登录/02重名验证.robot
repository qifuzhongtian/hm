*** Settings ***
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# userName String 是 登录名
# //0表示接口正常，>0表示接口异常
# status: 1 账号状态   0已经存在， 1 可以注册

*** Test Cases ***
2.1 不存在的用户名
    [Documentation]    断言error:""
    ${getRes}    重名验证    userName=yinbo
    Should Be Equal As Strings    ${getRes['body']['status']}    0

2.2 不存在的用户名
    [Documentation]    断言error:""
    ${getRes}    重名验证    userName=iyinboxxxxxxx
    Should Be Equal As Strings    ${getRes['body']['status']}    1
