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
泰山首页列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    泰山登录    name=admin    password=732cc37c8ec5a38f750889f1cf7129eb
    ${getRes}    泰山首页列表
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['data']['loginList']]
    Should Contain    ${aj}    临床质量管理平台


