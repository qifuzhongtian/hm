*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
6.1 常见体格检查
    [Documentation]    断言:"bodyPart=一般检查"
    ${getRes}    常见体格检查
    Should Be Equal As Strings    ${getRes['body']['commonPhysicalMore'][0]['bodyPart']}    一般检查


