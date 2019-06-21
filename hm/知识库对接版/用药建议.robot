*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
用药建议_对接版
    [Documentation]    断言:"药物治疗原则"
    ${getRes}    用药建议_对接版    diseaseId=896250    customEnv=3
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docContentList']]
    Should Contain    ${aj}    药物治疗原则




# http://10.117.64.153:8080/athena/v_1_0/article/drug_advice?diseaseId=896250&customEnv=3

