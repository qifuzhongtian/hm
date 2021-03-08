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
编码问题分析codeRuleProblemList
    [Documentation]    :3021/mc/codeRuleProblemList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    编码问题分析codeRuleProblemList    time_start=
    ...    order={"name": "project_cnt","sort": "desc"}
    ...    time_end=true
    ...    inpatient_department=    patient_area=    type=    project_id=    chapter_dict_id=    major_type=
    ...    current_index=${1}    page_size=${20}
    Should Contain    ${getRes['msg']}    success



