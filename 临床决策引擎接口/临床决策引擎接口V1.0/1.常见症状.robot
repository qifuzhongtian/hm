*** Settings ***
Resource          ../惠每决策引擎接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
1.1常见症状
    [Documentation]    断言error:"error=0"
    常见症状    0
