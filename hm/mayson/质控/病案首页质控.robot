*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
# Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime


*** Variables ***

*** Test Cases ***

# 病案首页质控,推出"病案首页-籍贯未填写"
#     [Documentation]    断言:质控类型ruleCategory为形式'xs'
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    病历质控初始化数据    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=${1}    pageSource=${1}
#     ${getRes}    病案首页_病历质控    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=${1}    pageSource=${1}
#     ${aj}    Evaluate    [aj['ruleCategory'] for aj in $getRes['body']['otherProblerms']['completeList']]
#     Should Contain    ${aj}    xs
