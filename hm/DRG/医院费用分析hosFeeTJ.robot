*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
医院费用分析hosFeeTJ
    [Documentation]    :3027/profitTj/hosFeeTJ
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    医院费用分析hosFeeTJ    time_start=2020-01-04    time_end=2020-08-30
    Should Contain    ${getRes['msg']}    success



