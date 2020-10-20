*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
统计_工作台_质控问题描述
    [Documentation]    :3021/work/workProblemDistribution
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    统计_工作台_质控问题描述    time_start=2020-07-04    time_end=2020-08-30
    Should Contain    ${getRes['msg']}    success

