*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
检查检验_对接版
    [Documentation]    断言:""
    ${getRes}    检查检验_对接版    examId=55    customEnv=1    examType=1
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docs'][0]['docContentList']]
    Should Contain    ${aj}    用法和用量

