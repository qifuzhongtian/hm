*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# gender Integer 是 1男，0女


*** Test Cases ***
4.1常见过敏史
    [Documentation]    断言error:"error=0"
    常见过敏史    0




