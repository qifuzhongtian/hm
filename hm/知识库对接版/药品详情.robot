*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
药品详情_对接版
    [Documentation]    断言:""
    ${getRes}    药品详情_对接版    drugId=4513    customEnv=1
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docContentList']]
    Should Contain    ${aj}    用法和用量

