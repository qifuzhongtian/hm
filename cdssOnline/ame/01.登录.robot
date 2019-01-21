*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# userName    String  是   登录名
# password  String  是   密码
# loginStatus   Integer 是   登录状态

*** Test Cases ***
1.1 ame登录成功
    [Documentation]
    ${getRes}    ame登录    userName=developer    password=9d06407716dd900dc25e2771cbdfa1dc
    Should Be Equal As Strings    ${getRes['head']['error']}    0

1.2 ame登录失败
    [Documentation]
    ${getRes}    ame登录    userName=developer    password=1231b94610ad1e3e77d85cc6aad61bb68a6
    Should Be Equal As Strings    ${getRes['head']['error']}    4002








###amc管理端备份
# *** Settings ***
# Resource          ../cdss接口关键字.robot
# Library           Collections
# Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# doctorName    String  是   登录名
# password  String  是   密码
# loginStatus   Integer 是   登录状态

# *** Test Cases ***
# 1.1 登陆成功
#     [Documentation]    断言error:""
#     ${getRes}    ame管理_用户登录    doctorName=admin    password=1b94610ad1e3e77d85cc6aad61bb68a6
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

# 1.2 密码错误登陆失败
#     [Documentation]    断言error:""
#     ${getRes}    ame管理_用户登录    doctorName=admin    password=11111b94610ad1e3e77d85cc6aad61bb68a6
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

# *** Test Cases ***
# 1.1 用户登录
#     [Documentation]    断言error:""
#     ${getRes}    ame管理_用户登录    doctorName=admin    password=1b94610ad1e3e77d85cc6aad61bb68a6
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

# 2.1 文档关联诊断sug
#     [Documentation]    断言error:""
#     ${getRes}    ame管理_文档关联诊断sug    diseaseName=感冒
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

# 4.1 文档列表查询
#     [Documentation]    断言error:""
#     ${getRes}    ame管理_文档列表查询    zhName=    enName=    languageType=    type=    modifyStart=
#     ...    modifyEnd=    index=1    pageSize=20
#     Should Be Equal As Strings    ${getRes['head']['error']}    0
