*** Settings ***
Suite Teardown    Delete All Sessions
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
绿道登录
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    绿道登录    name=admin    password=ff33b65e9a491a9f322da8b5e4379c4a    type=0    time=0
    Should Contain    ${getRes['msg']}    success
