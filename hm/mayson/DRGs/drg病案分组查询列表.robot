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

drg病案分组查询列表
    [Documentation]    :3027/drgs/drgsRecordList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg病案分组查询列表    current_index=${1}    page_size=${20}    time_type=${1}    time_start=2020-09-17    time_end=2020-09-17    doctor_name=    department=    query_num=    dead_risk=    drgs_no=    mdc_no=    situation=    order={"name":"display_id","sort":"asc"}
    Should Contain    ${getRes['msg']}    success

