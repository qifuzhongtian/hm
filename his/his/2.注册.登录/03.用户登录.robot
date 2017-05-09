*** Settings ***
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# doctorName	String	是	登录名
# password	String	是	密码
# loginStatus	Integer	是	登录状态

*** Test Cases ***
3.1 用户登录成功
    [Documentation]    断言error:""
    用户登录    0    doctorName=iyinbo    password=e3ceb5881a0a1fdaad01296d7554868d
    ...    loginStatus=1

3.2 用户登录失败
    [Documentation]    断言error:""
    用户登录    4011    doctorName=iyinbo    password=222222
    ...    loginStatus=1
