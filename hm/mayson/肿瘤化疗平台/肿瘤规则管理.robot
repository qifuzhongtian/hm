*** Settings ***
Suite Setup       肿瘤平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
肿瘤规则管理-修改规则提醒级别
    # [Documentation]    cdss/sentry/assess/save
    [Setup]    Run Keywords    获取时间戳
    ${getRes}    肿瘤规则管理    remindLevel=1    remindType=1    status=0    tcRuleBlackLists={"ruleNumber":"chemo-1","ruleSource":"1"}
    Should Contain    ${getRes['data']}    批量修改肿瘤配置成功

