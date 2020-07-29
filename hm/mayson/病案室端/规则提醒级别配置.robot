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
规则提醒级别配置
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    规则提醒级别配置    group_code=syzzd33333333    recommend_level=1    type=2
    Should Contain    ${getRes['msg']}    success




