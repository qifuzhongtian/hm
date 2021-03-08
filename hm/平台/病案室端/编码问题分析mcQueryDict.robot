*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           Collections
Library           DateTime

*** Variables ***

*** Test Cases ***
编码问题分析mcQueryDict
    [Documentation]    :3021/mc/mcQueryDict
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    编码问题分析mcQueryDict    dep=true
    ...    project=${2}
    ...    chapter=true
    ...    special=true
    Should Contain    ${getRes['msg']}    success



