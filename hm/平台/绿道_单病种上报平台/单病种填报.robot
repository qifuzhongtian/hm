*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

单病种病种列表
    [Documentation]     mayson/gc/baseGroup
 #获取用户登录ID   
    ${getRes}    单病种登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    type=0    time=0
    ${userId}   Evaluate    $getRes['data']['id']
    ${userName}     Evaluate    $getRes['data']['login_name']
    ${name}     Evaluate    $getRes['data']['doctor_name']
    log     ${userId}
    ${getRes}   单病种病种列表  endVisitTime=1610553600000  startVisitTime=1609430400000  timeType=2  userId=${userId}  baseGroupType=2
    ...  doctor=${name}    userName=${userName}
    ${aj}  Evaluate    [aj['name'] for aj in $getRes['body']['baseGroupList']]
    Should Contain  ${aj}   心力衰竭
