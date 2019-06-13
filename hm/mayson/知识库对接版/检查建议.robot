*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
检查建议_对接版
    [Documentation]    断言:""
    ${getRes}    检查建议_对接版    diseaseId=897695    customEnv=3
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docContentList']]
    Should Contain    ${aj}    常规检查




# http://10.117.64.153:8080/athena/v_1_0/article/exam_advice?diseaseId=897695&customEnv=3

