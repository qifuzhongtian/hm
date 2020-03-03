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
嵩山登录
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    嵩山登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
    Should Contain    ${getRes['msg']}    success


