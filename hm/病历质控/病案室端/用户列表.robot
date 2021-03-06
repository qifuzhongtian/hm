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
用户列表
    [Documentation]    :3021/manage/userList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    用户列表    content=
    ...    order={"name": "name","sort": "desc"}
    ...    jump=true
    ...    current_index=${1}    page_size=${20}
    Should Contain    ${getRes['msg']}    success


