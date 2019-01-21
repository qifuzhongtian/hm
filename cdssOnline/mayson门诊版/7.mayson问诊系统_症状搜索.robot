*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
mayson问诊系统_症状搜索
    [Documentation]    断言问诊结果:呕吐导致持续腹痛>4小时未缓解
    ${getRes}   症状搜索    symptom=发热
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    发热



