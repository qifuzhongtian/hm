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

drg医院费用分析hosFeeTJTable
    [Documentation]    :3027/profitTj/hosFeeTJTable
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg医院费用分析hosFeeTJTable    time_start=    time_end=    current_index=${1}    page_size=${20}
    ...    order={"name":"discharge_department","sort":"asc"}
    Should Contain    ${getRes['msg']}    success