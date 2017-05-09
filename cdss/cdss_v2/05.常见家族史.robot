*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
5.1常见家族史
    [Documentation]    断言:"historyType=常见"
    常见家族史    ['body']['familyHistoryList'][0]['historyType']    常见