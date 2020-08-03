*** Settings ***
Force Tags    skip
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
惠每用户中心首页列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    惠每用户中心登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
    ${getRes}    惠每用户中心首页列表
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['data']['loginList']]
    Should Contain    ${aj}    临床质量管理平台


