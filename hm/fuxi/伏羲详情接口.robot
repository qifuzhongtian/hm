*** Settings ***
# Suite Setup    获取时间戳
Suite Setup      登录    name=qa    password=b98ad386ccff23f74fed60bda2e586f0
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
    ${id}    Set Variable    257


    ${getRes}    新版质控统计明细    id=${id}

    Should Be Equal As Strings    ${getRes['code']}    200


