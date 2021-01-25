*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种登录
    [Documentation]        :3022/manage/userLogin
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    单病种登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    type=0    time=0
    Should Contain    ${getRes['msg']}    success
