*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
11.1 症状sug
    [Documentation]    断言error:"SYMP_NAME 存在腹痛"
    ${getRes}    amcPc版_症状sug    symptom=体重
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    体重异常
