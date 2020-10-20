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
    ${getRes}    问题分析列表    order={"name": "count","sort": "desc"}
    ...    name_id=    category_id=
    ...    time_start=2018-09-17    time_end=2029-10-16
    ...    inpatient_department=
    ...    display_type=
    ...    line_item_veto=    page_size=${20}
    ...    current_index=${1}
    Should Contain    ${getRes['msg']}    success


