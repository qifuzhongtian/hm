*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

drg字典查询列表
    [Documentation]    :3027/drgs/drgsList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg字典查询列表    time_start=2020-09    current_index=${1}    page_size=${20}    time_end=2020-09    content=     order={"name":"mdc_name","sort":"asc"}
    Should Contain    ${getRes['msg']}    success





