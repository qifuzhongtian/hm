*** Settings ***
# Suite Setup    获取时间戳
Suite Setup      登录    name=admin    password=5416d7cd6ef195a0f7622a9c56b55e84
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***



# 新版质控统计明细
#     ${id}    Set Variable    32

#     ${getRes}    新版质控统计明细    id=${id}

#     Should Be Equal As Strings    ${getRes['code']}    200



新版质控统计
    ${id}    Set Variable    29

    ${getRes}    新版质控统计明细    id=${id}

    Should Be Equal As Strings    ${getRes['code']}    200