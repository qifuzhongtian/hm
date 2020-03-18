*** Settings ***
Force Tags    skip
Suite Setup       嵩山登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
统计_获取基本信息_day
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    统计_获取基本信息    type=day    date=2019-10-16
    Should Contain    ${getRes['msg']}    success


统计_获取基本信息_week
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    统计_获取基本信息    type=week    date=2019-10-16
    Should Contain    ${getRes['msg']}    success


统计_获取基本信息_month
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    统计_获取基本信息    type=month    date=2019-10-16
    Should Contain    ${getRes['msg']}    success









# 统计_获取基本信息
#     [Arguments]    ${type}    ${date}
#     # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
#     # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
#     # Create Session    api    ${songshan_url}    ${dict}
#     ${data}    Create Dictionary    type=${type}    date=${date}
#     ${addr}    Post Request    api    /tj/getTJBasInfo    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     [Return]    ${responsedata}
