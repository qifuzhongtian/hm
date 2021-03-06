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
drg盈亏分析depProfitTj
    [Documentation]    :3027/profitTj/depProfitTj
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg盈亏分析depProfitTj    time_start=2020-07-04    time_end=2020-10-30
    Should Contain    ${getRes['msg']}    success



