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
    ${getRes}   肿瘤规则查询    diseaseId=    remindLevel=1,2    remindType=    ruleName=化疗前常规检查——血常规    status=    ruleSource=1   
    ...    pageNumber=1     pageSize=1
    ${ruleNumber}    Evaluate    $getRes['data']['list'][0]['ruleNumber']
    ${ruleSource}    Evaluate    $getRes['data']['list'][0]['ruleSource']
    ${id}    Evaluate    $getRes['data']['list'][0]['id']
    ${diseaseId}    Evaluate    $getRes['data']['list'][0]['diseaseId']
    ${remindLevel}    Evaluate     $getRes['data']['list'][0]['remindLevel']
    ${remindType}    Evaluate    $getRes['data']['list'][0]['remindType']
    ${status}    Evaluate    $getRes['data']['list'][0]['status']
    ${ruleExtend}    Evaluate    $getRes['data']['list'][0]['ruleExtend']
    ${ruleExtendId}    Evaluate     $getRes['data']['list'][0]['ruleExtendId']
    ${getRes}    肿瘤规则管理    remindLevel=${remindLevel}    remindType=${remindType}    status=${status}    
    ...    tcRuleBlackLists={"ruleNumber":"${ruleNumber}","ruleNode":"","ruleSource":${ruleSource},"projectId":"","id":${id},"ruleExtend":${ruleExtend},"ruleExtendId":${ruleExtendId},"blackId":""}
    Should Contain  ${getRes['msg']}    success

