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
临床分析登录
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
    Should Contain    ${getRes['msg']}    success
