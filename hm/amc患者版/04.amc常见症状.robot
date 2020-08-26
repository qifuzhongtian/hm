*** Settings ***
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***

*** Test Cases ***
04.amc常见症状
    # [Documentation]
    ${getRes}    amc常见症状
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    发热
