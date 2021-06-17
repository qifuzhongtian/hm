*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

单病种回收站患者列表
    [Documentation]     mayson/gc/getRecycleInfo
    ${getRes}    单病种登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    type=0    time=0
    ${userId}   Evaluate    $getRes['data']['id']
    ${userName}     Evaluate    $getRes['data']['login_name']
    ${name}     Evaluate    $getRes['data']['doctor_name']
    ${getRes}    单病种回收站患者列表    timeType=1    baseGroupId=5    branchGroupId=201    currentPage=1    pageSize=10    userId=${userId}    
    ...    userName=${userName}        doctor=${name}     reportedSwitch=1    startVisitTime=1622476800000    endVisitTime=1623859200000
    Should Be Equal As Strings   ${getRes['head']['error']}     0