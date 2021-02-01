*** Settings ***
#Suite Setup       单病种登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

单病种患者列表
    [Documentation]     mayson/gc/query
 #获取用户登录ID   
    ${getRes}    单病种登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    type=0    time=0
    ${userId}   Evaluate    $getRes['data']['id']
    ${userName}     Evaluate    $getRes['data']['login_name']
    ${name}     Evaluate    $getRes['data']['doctor_name']
    ${getRes}   单病种患者列表  endVisitTime=1612195200000  startVisitTime=1609516800000  userId=${userId}  baseGroupId=
    ...     branchGroupId=  customerId=1219  userName=${userName}  doctor=${name}  index=1  pageSize=10  caseNo=     searchBody=
    Should Be Equal As Strings   ${getRes['head']['error']}     0
