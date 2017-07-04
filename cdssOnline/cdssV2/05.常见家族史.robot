*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
5.1常见过敏史
    [Documentation]    断言:"historyType=吸入过敏原"
    ${getRes}    常见家族史
    Should Be Equal As Strings    ${getRes['body']['familyHistoryList'][0]['historyType']}    常见

