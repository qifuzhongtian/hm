*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
7.1 常见症状和类型
    [Documentation]    断言:"name=发热"
    ${getRes}    常见症状和类型
    # 常见症状和类型    ['body']['commonSymptom'][0]['name']    发热
    Should Be Equal As Strings    ${getRes['body']['commonSymptom'][0]['name']}    发热


