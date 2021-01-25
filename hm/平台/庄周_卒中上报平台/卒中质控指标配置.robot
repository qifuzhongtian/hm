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
卒中绿道质控指标配置
    [Documentation]     :3023/fillSummary/rateList
    ${getRes}   庄周_质控指标达标配置
    Should Contain  ${getRes['msg']}    success
