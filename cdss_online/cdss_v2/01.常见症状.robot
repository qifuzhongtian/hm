*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
1.1常见症状
    [Documentation]    断言error:"commonSymptom[0]=发热"
    常见症状    ['body']['commonSymptom'][0]    发热
