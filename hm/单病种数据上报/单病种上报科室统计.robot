*** Settings ***
Suite Setup       单病种登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种上报科室统计
    [Documentation]    :3022/diseaseUp/diseaseDepartment
    ${getRes}    单病种科室统计    startDate=2020-03-24    endDate=2020-03-30    type=1
    Should Contain    ${getRes['msg']}    success
