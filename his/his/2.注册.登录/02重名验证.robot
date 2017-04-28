*** Settings ***
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# userName String 是 登录名
# //0表示接口正常，>0表示接口异常
# status: 1 账号状态   0已经存在， 1 可以注册

*** Test Cases ***
# 02.1 存在的用户名
#     [Documentation]    断言error:"断言status=0"
#     重名验证    0    userName=iyinbo

# 02.1 不存在的用户名
#     [Documentation]    断言error:"断言status=1"
#     重名验证    1    userName=iyinboxxxxxxx

02.1 不存在的用户名
    [Documentation]    断言error:""
    重名验证    body=['body']['status']    1    userName=iyinboxxxxxxx
