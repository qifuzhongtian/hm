*** Settings ***
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Setup       登录接口
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# oldPassword	String	是	旧密码
# userName	String	是	用户名
# newPassword	String	是	新密码

*** Test Cases ***
1.1 退出登录成功
    [Documentation]    断言error:""
    ${getRes}    退出登录
    Should Be Equal As Strings    ${getRes['head']['error']}    0

# 1.2 退出登录失败
#     [Documentation]    断言error:""
#     退出登录    4011    oldPassword=e3ceb5881a0a1fdaad01296d7554868d    userName=iyinbo
#     ...    newPassword=

