*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../cdss.robot    # Force Tags    skip
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
卒中绿道填报
    [Documentation]         mayson/green_channel/report/show
     [Setup]    Run Keywords    获取时间戳
     ...    AND    获取随机数
    ${getRes}   卒中绿道填报  groupId=1  recordId=${random}  reportId=1  reportProject=卒中静脉溶栓治疗
    ${aj}    Evaluate   [aj['reportName'] for aj in $getRes['body']['reportData']]
    Should Contain      ${aj}   卒中静脉溶栓治疗