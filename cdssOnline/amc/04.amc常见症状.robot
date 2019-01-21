*** Settings ***
# Suite Setup    登录接口
# Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型  说明

*** Variables ***

*** Test Cases ***
04.amc常见症状
   # [Documentation]
    ${getRes}    amc常见症状
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    发热
