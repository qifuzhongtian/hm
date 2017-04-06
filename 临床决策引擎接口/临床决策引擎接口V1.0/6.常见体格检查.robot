*** Settings ***
Resource          ../惠每决策引擎接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
6.1常见体格检查
    [Documentation]    断言error:"error=0"
    常见体格检查    0


