*** Settings ***
Suite Setup       庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Test Cases ***
患者统计
    [Documentation]    :3023/patientsStatistics/list
    ${getRes}    庄周_患者统计    startDate=2020-03-24    endDate=2020-03-30
    Should Contain    ${getRes['msg']}    success

患者信息
    [Documentation]    :3023/patientsStatistics/patientInfo
    ${getRes}    庄周_患者信息    disease_duration_type=    endDate=2020-05-27    group_name=    index=1    not_treat_reason=
    ...    source_way=    startDate=2020-02-28
    Should Contain    ${getRes['msg']}    success

