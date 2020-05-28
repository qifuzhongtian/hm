*** Settings ***
Suite Setup       特斯拉登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Suite Teardown    Delete All Sessions
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
特斯拉统计管理
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    特斯拉统计管理    start_time=2019-11-02    end_time=2019-12-01    disease=true    doctor=true    patient=false
    ...    project=false    specialDisease=    time_type=${2}    query_type=null
    Should Contain    ${getRes['msg']}    success

特斯拉出院人次
    ${getRes}    特斯拉_出院人次    dept_code=    dept_name=    dept_type=    disease_class=    disease_code=
    ...    end_time=2020-05-27    query_type=1    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

特斯拉住院天数
    ${getRes}    特斯拉_住院天数    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

特斯拉年龄分布
    ${getRes}    特斯拉_年龄分布    dept_code=    dept_name=    dept_type=    disease_class=    disease_code=
    ...    end_time=2020-05-27    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

特斯拉主管医生
    ${getRes}    特斯拉_主管医生    dept_code=    dept_name=    dept_type=    disease_class=    disease_code=
    ...    end_time=2020-05-27    start_time=2020-04-28    time_type=2
    Should Contain    ${getRes['msg']}    success

特斯拉单病种概况
    ${getRes}    特斯拉_单病种概况    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2    doctor_code=    doctor_name=    current_index=1
    Should Contain    ${getRes['msg']}    success

特斯拉医生质控监测
    ${getRes}    特斯拉_医生质控监测    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2    project_code=
    Should Contain    ${getRes['msg']}    success

特斯拉科室质控监测
    ${getRes}    特斯拉_科室质控监测    dept_name=    dept_type=    disease_class=    disease_code=    end_time=2020-05-27
    ...    start_time=2020-04-28    time_type=2    project_code=
    Should Contain    ${getRes['msg']}    success
