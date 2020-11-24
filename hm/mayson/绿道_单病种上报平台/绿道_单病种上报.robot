*** Settings ***
Suite Setup       绿道登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种患者状态
    [Documentation]     :3022/patient/getDiseaseStatus
    ${getRes}   绿道_单病种患者状态     baseGroupId=1
    Should Contain    ${getRes['msg']}    success   

单病种入组
    [Documentation]     :3022/patient/joinGroupList
    ${getRes}   绿道_单病种入组  
    Should Contain    ${getRes['msg']}    success  

单病种上报统计
    [Documentation]    :3022/diseaseUp/list
    ${getRes}    绿道_单病种上报统计    startDate=2020-03-24    endDate=2020-03-30    type=2
    Should Contain    ${getRes['msg']}    success

单病种上报科室统计
    [Documentation]    :3022/diseaseUp/diseaseDepartment
    ${getRes}    绿道_单病种科室统计    startDate=2020-03-24    endDate=2020-03-30    type=1
    Should Contain    ${getRes['msg']}    success

单病种质控指标数据统计
    [Documentation]     :3022/diseaseQuality/list
    ${getRes}   绿道_病种质控完成统计   startDate=2020-03-24    endDate=2020-03-30    type=1
     Should Contain    ${getRes['msg']}    success   

单病种质控管理
    [Documentation]     :3022/target/relationDic
    ${getRes}   绿道_单病种质控管理  end_time=2020-03-24  start_time=2020-03-30     disease=true
    ...     doctor=false    gender=false   patient=false     project=false      specialDisease=
    ...     query_type=     sub_time_type=      time_type=2
    Should Contain    ${getRes['msg']}    success     