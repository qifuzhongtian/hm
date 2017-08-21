*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名    类型    是否必须    说明
# patientName    String # 是    药品名称或拼音

*** Test Cases ***
4.1 药品搜索Sug
    [Documentation]    断言:"patientName"
    ${getRes}    药品搜索Sug    drugName=1    dataSource=2    saleChannel=1    drugType=100    version=4
    Should Be Equal As Strings    ${getRes['head']['error']}    0
