*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# oldPassword	String	是	旧密码
# userName	String	是	用户名
# newPassword	String	是	新密码

*** Test Cases ***
4.1 修改密码成功
    [Documentation]    断言error:""
    ${getRes}    修改密码    oldPassword=e3ceb5881a0a1fdaad01296d7554868d    userName=yinbo
    ...    newPassword=e3ceb5881a0a1fdaad01296d7554868d
    Should Be Equal As Strings    ${getRes['head']['error']}    0

# 4.2 修改密码失败
#     [Documentation]    断言error:""
#     修改密码    4011    oldPassword=e3ceb5881a0a1fdaad01296d7554868d    userName=iyinbo
#     ...    newPassword=

