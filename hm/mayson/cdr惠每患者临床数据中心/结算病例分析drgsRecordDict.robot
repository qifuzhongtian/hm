*** Settings ***
Suite Setup       drgs登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
结算病例分析drgsRecordDict
    [Documentation]    :3027/tj/joinGroupRateTrend
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    结算病例分析drgsRecordDict
    Should Contain    ${getRes['msg']}    success

