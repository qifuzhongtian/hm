*** Settings ***
Suite Setup       庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种上报统计
    ${getRes}    庄周_单病种上报统计    startDate=2020-03-24    endDate=2020-03-30    type=2
    Should Contain    ${getRes['msg']}    success

单病种上报科室统计
    ${getRes}    庄周_单病种科室统计    startDate=2020-03-24    endDate=2020-03-30    type=1
    Should Contain    ${getRes['msg']}    success

单病种质控完成统计
    ${getRes}    庄周_病种质控完成统计    startDate=2020-03-24    endDate=2020-03-30    type=2
    Should Contain    ${getRes['msg']}    success
