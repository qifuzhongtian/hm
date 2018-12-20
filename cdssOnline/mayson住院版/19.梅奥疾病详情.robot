*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

*** Test Cases ***
梅奥疾病详情
    [Documentation]    断言:"急性胰腺炎 基础知识 titleId"
    ${getRes}    梅奥疾病详情    diseaseId=8753C0AAE7
    Should Be Equal As Strings    ${getRes['body']['hasMayo']}    True

