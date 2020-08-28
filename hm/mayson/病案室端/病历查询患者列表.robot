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
病历查询患者列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    病历查询患者列表    order={"name": "discharge_time","sort": "desc"}
    ...    time_start=2018-09-17    time_end=2029-10-16    time_type=
    ...    inpatient_department=    patient_area=    display_id=    case_no=
    ...    serial_number=
    ...    patient_name=    doctor_name=    problem_start=0    problem_end=${1000}    status=    name_id_list=    display_type=    line_item_veto=    index_start=    index_end=    total_start=    total_end=    category_id=    page_size=${20}
    ...    current_index=${1}
    Should Contain    ${getRes['msg']}    success

