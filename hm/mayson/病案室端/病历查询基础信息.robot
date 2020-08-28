*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
病历查询基础信息
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    病历查询基础信息
    Should Contain    ${getRes['msg']}    success



