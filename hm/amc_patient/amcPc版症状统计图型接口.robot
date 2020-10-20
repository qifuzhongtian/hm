*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
Amcpc版症状统计图型
    [Documentation]    cdss/amc/static_symptom
    ${getRes}    amcPc版症状统计图型    enterTime=    recordTime=    symptom=    gender=88    subject=
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    # ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']]
    # Should Contain    ${aj}    体重问题（指南）
    Should Be Equal As Strings    ${getRes['head']['error']}    0
