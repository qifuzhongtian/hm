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

drgs字典查询列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drgs字典查询列表    time_start=2020-09-17    current_index=${1}    page_size=${20}    time_end=2020-09-17    content=     order={"name":"display_id","sort":"asc"}
    Should Contain    ${getRes['msg']}    success





