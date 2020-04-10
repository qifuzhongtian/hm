*** Settings ***
Suite Setup       庄周登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Test Cases ***
患者统计
    ${getRes}    庄周_患者统计    startDate=2020-03-24    endDate=2020-03-30
    Should Contain    ${getRes['msg']}    success




