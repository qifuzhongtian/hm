*** Settings ***
Suite Setup    Run Keywords    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
...    AND    amc管理端_问诊记录列表    recordStart=    recordEnd=    symptom=    patient_gender=88    subject=    index=${1}    pageSize=${10}
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明


*** Test Cases ***
# 16.1 问诊记录列表详情
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表详情    id=${id}
#     Should Be Equal As Strings    ${getRes['body']['symptom']}    体重问题（指南）

