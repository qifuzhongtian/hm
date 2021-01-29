*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot    # Force Tags    skip
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种事中填报
    [Documentation]         /mayson/gc/report/operation
     [Setup]    Run Keywords    获取时间戳
     ...    AND    获取随机数
    ${getRes}   单病种事中填报  gzip=0  opetation=2  recordId=${random}  baseGroupId=8  branchGroupId=204
    ${aj}   Evaluate    [aj['reportName'] for aj in $getRes['body']['reportList']]
    Should Contain  ${aj}   脑梗死(首次住院)数据上报