*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

drg医生盈亏分析doctorDetailOverAll
    [Documentation]    :3027/profitTj/doctorDetailOverAll
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg医生盈亏分析doctorDetailOverAll    time_start=2020-01    time_end=2020-10    doctor_name=11
    Should Contain    ${getRes['msg']}    success

