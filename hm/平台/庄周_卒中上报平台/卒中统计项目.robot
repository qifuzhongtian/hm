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
卒中统计项目
    [Documentation]     :3023/patientsStatistics/objectSelect
    ${getRes}   庄周_分组项目统计
    Should Contain    ${getRes['msg']}    success   
    