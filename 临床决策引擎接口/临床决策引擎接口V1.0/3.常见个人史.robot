*** Settings ***
Resource          ../惠每决策引擎接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# gender Integer 是 1男，0女


*** Test Cases ***
3.1常见个人史
    [Documentation]    断言error:"error=0"
    常见个人史    0    gender=1


3.2常见个人史,gender错误显示失败
    [Documentation]    断言error:"error=400"
    常见个人史    400    gender=啊啊啊啊


