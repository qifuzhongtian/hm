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
# 病历详情结果列表
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    病历查询患者列表    order={"name": "discharge_time","sort": "desc"}    time_start=2018-09-17    time_end=2029-10-16    inpatient_department=    serial_number=    patient_name=    doctor_name=    problem_start=0    problem_end=${1000}    status=    page_size=${20}    current_index=${1}
#     ...    AND    病历详情   record_id=${record_id}
#     ${getRes}    病历详情结果列表   record_id=${record_id}    result=
#     Should Contain    ${getRes['msg']}    success



