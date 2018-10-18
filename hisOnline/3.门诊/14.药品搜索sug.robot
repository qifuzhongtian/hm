*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名    类型    是否必须    说明
# drugName    String # 是    患者名称或拼音

*** Test Cases ***

14.1 药品搜索sug
    [Documentation]    断言:"error=0"
    ${getRes}    药品搜索sug    drugName=1    dataSource=2
    ...    saleChannel=1    drugType=100    version=2
    Should Be Equal As Strings    ${getRes['head']['error']}    0

