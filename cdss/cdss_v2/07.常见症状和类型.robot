*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
6.1常见症状和类型
    [Documentation]    断言:"error=发热"
    常见症状和类型    ['body']['commonSymptom'][0]['name']    发热


