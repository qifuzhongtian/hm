*** Settings ***
Force Tags    skip
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
华山登录
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    华山登录    name=admin    password=732cc37c8ec5a38f750889f1cf7129eb    type=0
    Should Contain    ${getRes['msg']}    success



