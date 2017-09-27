*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# drugId String 是 药品ID


*** Test Cases ***
4.1 药品详情
    [Documentation]    断言error:"docName=阿司匹林口服剂型"
    ${getRes}    药品详情    drugId=1CD441A2C3
    Should Be Equal As Strings    ${getRes['body']['docName']}    阿司匹林口服剂型

