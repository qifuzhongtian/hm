# *** Settings ***
# Suite Teardown    Delete All Sessions
# Resource          ../../cdss.robot
# Library           Collections
# Library           RequestsLibrary
# Library           String

# *** Variables ***
# # ${timestamp}${random}    Get Time    epoch

# *** Test Cases ***
# mayson问诊系统_症状搜索
#     [Documentation]    cdss/amc/v_4_0/symptom,断言问诊结果:呕吐导致持续腹痛>4小时未缓解
#     ${getRes}    症状搜索    symptom=发热
#     ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
#     Should Contain    ${aj}    发热
