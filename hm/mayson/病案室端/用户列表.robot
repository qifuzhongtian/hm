*** Settings ***
Force Tags    skip
Suite Setup       嵩山登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
用户列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    用户列表    user_name=    dep_name=    patient_area=
    Should Contain    ${getRes['msg']}    success

