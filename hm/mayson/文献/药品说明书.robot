*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
药品说明书
    [Documentation]    断言:""
    ${getRes}    药品说明书    drugId=4513    customEnv=1
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docContentList']]
    Should Contain    ${aj}    用法和用量
