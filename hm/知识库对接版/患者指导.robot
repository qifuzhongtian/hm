*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
患者指导_对接版
    [Documentation]    断言:""
    ${getRes}    患者指导_对接版    diseaseId=911048    customEnv=3
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['catalogueList']]
    Should Contain    ${aj}    生活方式干预


