*** Settings ***
Suite Setup       庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
入组患者列表
    [Documentation]        :3023/patient/getcasesList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    庄周_患者入组    end=1581523200000    groupId=    index=1    joinWay=    needRecommend=
    ...    pageSize=20    reportId=    seachBody=    start=1580832000000
    Should Contain    ${getRes['msg']}    success

卒中填报
    [Documentation]        :3023/patient/getPatientList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    庄周_患者填报    end=1581523200000    from=    index=1    pageSize=20    seachBody=
    ...    start=1580832000000    status=[0,1,2]
    Should Contain    ${getRes['msg']}    success

卒中全局
    [Documentation]        3023/patient/groupAll
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    庄周_全局
    Should Contain    ${getRes['msg']}    success

卒中填报汇总
    [Documentation]    :3023/fillSummary/list_v2
    ${getRes}    庄周_填报汇总    startDate=2020-03-24    endDate=2020-03-30    
    Should Contain    ${getRes['msg']}    success

静脉溶栓分析
    [Documentation]     :3023/fillSummary/analyse
    ${getRes}   庄周_静脉溶栓分析  startDate=2020-03-24  endDate=2020-03-30  type=1
    Should Contain  ${getRes['msg']}    success

桥接变化分析
    [Documentation]     :3023/fillSummary/drtAnalyse
    ${getRes}   庄周_桥接变化分析  startDate=2020-03-24  endDate=2020-03-30  type=1
    Should Contain  ${getRes['msg']}    success

桥接达标率
    [Documentation]     :3023/fillSummary/drtdptPass
    ${getRes}   庄周_桥接达标率     startDate=2020-03-24  endDate=2020-03-30    dpt=70  drt=110
    Should Contain  ${getRes['msg']}    success

溶栓达标率
    [Documentation]     :3023/fillSummary/dntPass
    ${getRes}   庄周_溶栓达标率     startDate=2020-03-24  endDate=2020-03-30    dnt=20
    Should Contain  ${getRes['msg']}    success

卒中绿道质控指标达标分布
    [Documentation]     :3023/fillSummary/qcRate
    ${getRes}   庄周_卒中绿道质控指标达标分布  startDate=2020-03-24  endDate=2020-03-30     itemList=2
    Should Contain  ${getRes['msg']}    success

卒中绿道质控指标配置
    [Documentation]     :3023/fillSummary/rateList
    ${getRes}   庄周_质控指标达标配置
    Should Contain  ${getRes['msg']}    success

卒中趋势
    [Documentation]     :3023/fillSummary/trendList
    ${getRes}   庄周_卒中趋势  startDate=2020-03-24  endDate=2020-03-30  type=1
    Should Contain     ${getRes['msg']}    success

DNT排名
    [Documentation]     :3023/fillSummary/topRanking
    ${getRes}   庄周_dnt排名  startDate=2020-03-24  endDate=2020-03-30  type=1  orderType=1
    Should Contain  ${getRes['msg']}    success

卒中患者统计
    [Documentation]    :3023/patientsStatistics/list
    ${getRes}    庄周_患者统计    startDate=2020-03-24    endDate=2020-03-30
    Should Contain    ${getRes['msg']}    success

卒中患者信息
    [Documentation]    :3023/patientsStatistics/patientInfo
    ${getRes}    庄周_患者信息    disease_duration_type=    endDate=2020-05-27    group_name=    index=1    not_treat_reason=
    ...    source_way=    startDate=2020-02-28
    Should Contain    ${getRes['msg']}    success

卒中统计项目
    [Documentation]     :3023/patientsStatistics/objectSelect
    ${getRes}   庄周_分组项目统计
    Should Contain    ${getRes['msg']}    success   
    