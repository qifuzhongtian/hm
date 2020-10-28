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
drg入组率趋势
    [Documentation]    :3027/tj/joinGroupRateTrend
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg入组率趋势    time_start=2020-07-04    time_end=2020-08-30    time_type=1
    Should Contain    ${getRes['msg']}    success


