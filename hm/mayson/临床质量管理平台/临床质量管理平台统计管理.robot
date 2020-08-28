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
临床质量管理平台统计管理
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    临床质量管理平台统计管理    start_time=2019-11-02    end_time=2019-12-01    disease=true    doctor=true    patient=false
    ...    project=false    specialDisease=    time_type=${2}    query_type=null
    Should Contain    ${getRes['msg']}    success

临床质量管理平台出院人次
    ${getRes}    临床质量管理平台_出院人次    dept_code=    dept_name=    dept_type=    disease_class=    disease_code=
    ...    end_time=2020-05-27    query_type=1    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

临床质量管理平台住院天数
    ${getRes}    临床质量管理平台_住院天数    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

临床质量管理平台年龄分布
    ${getRes}    临床质量管理平台_年龄分布    dept_code=    dept_name=    dept_type=    disease_class=    disease_code=
    ...    end_time=2020-05-27    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

临床质量管理平台主管医生
    ${getRes}    临床质量管理平台_主管医生    dept_code=    dept_name=    dept_type=    disease_class=    disease_code=
    ...    end_time=2020-05-27    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

临床质量管理平台单病种概况
    ${getRes}    临床质量管理平台_单病种概况    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2    doctor_code=    doctor_name=    current_index=1
    Should Contain    ${getRes['msg']}    success

临床质量管理平台医生质控监测
    ${getRes}    临床质量管理平台_医生质控监测    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2    project_code=
    Should Contain    ${getRes['msg']}    success

临床质量管理平台科室质控监测
    ${getRes}    临床质量管理平台_科室质控监测    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2    project_code=
    Should Contain    ${getRes['msg']}    success
