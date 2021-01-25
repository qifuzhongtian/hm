*** Settings ***
Suite Setup       庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
卒中填报汇总
    [Documentation]    :3023/fillSummary/list_v2
    ${getRes}    庄周_填报汇总    startDate=2020-03-24    endDate=2020-03-30    
    Should Contain    ${getRes['msg']}    success
