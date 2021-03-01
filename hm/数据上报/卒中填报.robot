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
卒中填报
    [Documentation]        :3023/patient/getPatientList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    庄周_患者填报    end=1581523200000    from=    index=1    pageSize=20    seachBody=
    ...    start=1580832000000    status=[0,1,2]
    Should Contain    ${getRes['msg']}    success
