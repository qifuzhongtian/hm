*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

*** Test Cases ***
13.1梅奥疾病详情
    [Documentation]    断言:"原发性高血压 基础知识 titleId"
    ${getRes}    梅奥疾病详情    diseaseId=8754C7AAE2
    Should Be Equal As Strings    ${getRes['body']['catalogueList'][0]['titleId']}    277409

13.2 梅奥疾病详情
    [Documentation]    断言:"原发性高血压 基础知识 titleId"
    ${getRes}    梅奥疾病详情    diseaseId=8457C0ACE01333
    Should Be Equal As Strings    ${getRes['head']['message']}    程序异常！



