*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
处置建议_对接版
    [Documentation]    断言:"一般治疗"
    ${getRes}    处置建议_对接版    diseaseId=898265    customEnv=3
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['catalogueList']]
    Should Contain    ${aj}    一般治疗



# http://10.117.64.153:8080/athena/v_1_0/article/dispose_advice?diseaseId=898265&customEnv=3
