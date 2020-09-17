*** Settings ***
Suite Setup       drgs登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
drgs用户管理列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drgs用户管理列表    order={"name": "name","sort": "desc"}    current_index=${1}    page_size=${20}
    Should Contain    ${getRes['msg']}    success


