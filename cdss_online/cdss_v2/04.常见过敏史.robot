*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# gender Integer 是 1男，0女


*** Test Cases ***
4.1常见过敏史
    [Documentation]    断言:"historyType=吸入过敏原"
    ${getRes}    常见过敏史
    Should Be Equal As Strings    ${getRes['body']['allergyHistoryList'][0]['historyType']}    吸入过敏原




