*** Settings ***
Suite Setup       庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
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
