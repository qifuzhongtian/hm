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
肿瘤规则管理-规则查询
    # [Documentation]    rule/findRuleListByParams
    [Setup]    Run Keywords    获取时间戳
    ${getRes}   肿瘤规则查询    diseaseId=    remindLevel=1,2    remindType=    ruleName=化疗前常规检查——血常规    status=    ruleSource=1   
    ...    pageNumber=1     pageSize=1
    Should Contain  ${getRes['msg']}    success

