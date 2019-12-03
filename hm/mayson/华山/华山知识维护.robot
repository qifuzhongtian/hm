*** Settings ***
Suite Setup       华山登录    name=admin    password=ff33b65e9a491a9f322da8b5e4379c4a    type=0
Force Tags    skip
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
华山知识维护
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    华山知识维护
    Should Contain    ${getRes['msg']}    success

