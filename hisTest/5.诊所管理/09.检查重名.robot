*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# examName    String  是   检查名称
*** Test Cases ***
5.1 检查重名
    [Documentation]    断言:""
    ${getRes}    检查重名    examName=测试名称
    Should Be Equal As Strings    ${getRes['head']['error']}    0



