*** Settings ***
Resource          ../CDSS接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# drugId String 是 药品ID


*** Test Cases ***
4.1药品详情
    [Documentation]    断言error:""
    药品详情    0    drugId=二甲双胍

4.2药品详情,不输入药品id提交失败
    [Documentation]    断言error:""
    药品详情    0    drugId=

