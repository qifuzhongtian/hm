*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           Collections
Library           DateTime

*** Variables ***

*** Test Cases ***
编码问题分析recordInfoCount
    [Documentation]    :3021/mc/recordInfoCount
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    编码问题分析recordInfoCount    time_start=2021-02-06
    ...    time_end=2021-03-07
    ...    inpatient_department=
    ...    patient_area=    type=${2}
    Should Contain    ${getRes['msg']}    success


