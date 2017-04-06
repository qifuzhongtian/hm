*** Settings ***
Resource          ../安全用药接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# drugName String 是 药品名称


*** Test Cases ***
2.1药品查询
    [Documentation]    断言error:""
    药品查询    0    drugName=二甲双胍

2.1药品查询,不输入药品名称提交失败
    [Documentation]    断言error:""
    药品查询    0    drugName=



