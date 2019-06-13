*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
疾病险情_对接版
    [Documentation]    断言:""
    ${getRes}    疾病险情_对接版    diseaseId=911991    customEnv=3
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['catalogueList']]
    Should Contain    ${aj}    解剖生理概要




