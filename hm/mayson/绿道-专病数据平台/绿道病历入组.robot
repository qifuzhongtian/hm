*** Settings ***
Suite Setup       绿道登录    name=admin    password=ff33b65e9a491a9f322da8b5e4379c4a    time=0    type=0
Suite Teardown    Delete All Sessions
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
病历入组
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    绿道入组    end=1581523200000    groupId=    index=1    joinWay=    needRecommend=
    ...    pageSize=20    reportId=    seachBody=    start=1580832000000
    Should Contain    ${getRes['msg']}    success
