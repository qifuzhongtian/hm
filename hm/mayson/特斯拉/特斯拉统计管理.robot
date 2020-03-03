*** Settings ***
Suite Setup       特斯拉登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Force Tags    skip
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
特斯拉统计管理
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    特斯拉统计管理    start_time=2019-11-02    end_time=2019-12-01
    ...    disease=true    doctor=true    patient=false    project=false    specialDisease=    time_type=${2}    query_type=null
    Should Contain    ${getRes['msg']}    success



