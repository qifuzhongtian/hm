*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# currentPage int 否   页码，翻页时使用，默认从1开始
# tempName    String  否   模板名称
# pageSize    int 否   每页显示数

*** Test Cases ***
2.1 获取诊所模板列表
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    获取诊所模板列表    currentPage=1    tempName=    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0

