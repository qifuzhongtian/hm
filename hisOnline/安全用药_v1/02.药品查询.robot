*** Settings ***
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# drugName String 是 药品名称


*** Test Cases ***
2.1药品查询,输入存在的药品名称,查询成功
    [Documentation]    断言error:"drugCommonName=阿司匹林片"
    ${getRes}    药品查询    drugName=阿司匹林片
    Should Be Equal As Strings    ${getRes['body']['drugList'][0]['drugCommonName']}    阿司匹林片

