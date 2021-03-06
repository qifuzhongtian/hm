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

问题分析列表
    [Documentation]    :3021/mc/ruleProblemList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    问题分析列表    order={"name": "project_cnt","sort": ""}
    ...    name_id=    category_id=
    ...    time_start=${time_now[0:10]}    time_end=${time_now[0:10]}
    ...    inpatient_department=
    ...    display_type=
    ...    line_item_veto=    page_size=${20}
    ...    current_index=${1}
    ...    type=${1}
    Should Contain    ${getRes['msg']}    success
