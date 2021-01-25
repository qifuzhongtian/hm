*** Settings ***
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***

*** Test Cases ***
amc常见症状
    # [Documentation]    /amc/common_symptom
    ${getRes}    amc常见症状
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    发热
