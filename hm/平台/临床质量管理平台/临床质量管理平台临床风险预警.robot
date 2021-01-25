*** Settings ***
Suite Setup       临床质量管理平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
临床质量管理平台临床风险预警
    [Documentation]    :3016/statistic/qcItemDetailList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    临床质量管理平台临床风险预警    start_time=2020-04-26    end_time=2020-05-25    dept_type=    dept_name=
    ...    disease_code=    disease_class=    doctor_code=    doctor_name=    patient_name=    time_type=${2}    order={"name": "discharge_date","sort": "asc"}    current_index=${1}    page_size=${20}
    Should Contain    ${getRes['msg']}    success


