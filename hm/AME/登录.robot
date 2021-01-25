*** Settings ***
Force Tags        skip
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
ame登录
    [Documentation]    ame/login

    ${getRes}    ame登录    userName=testonline    password=a75e90383cb40793001731b2e159f822
    Should Be Equal As Strings    ${getRes['head']['error']}    0
