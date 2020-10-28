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

drg盈亏分析depProfitTable
    [Documentation]    :3027/profitTj/depProfitTable
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg盈亏分析depProfitTable    time_start=2020-01    current_index=${1}    page_size=${20}    time_end=2020-09    order={"name":"discharge_department","sort":"asc"}
    Should Contain    ${getRes['msg']}    success

