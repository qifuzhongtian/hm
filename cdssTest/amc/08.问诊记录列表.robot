*** Settings ***
Suite Setup    amc管理端_用户登录    name=tester    password=9d06407716dd900dc25e2771cbdfa1dc
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明


*** Test Cases ***
6.1 问诊记录列表
    [Documentation]    断言:"symptom存在睡眠问题"
    ${getRes}    amc管理端_问诊记录列表    recordStart=    recordEnd=    symptom=
    ...    patient_gender=88    subject=    index=${1}    pageSize=${10}
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']['rows']]
    Should Contain    ${aj}    睡眠问题（指南）


# 6.2 就诊时间搜索
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=2017-07-02 00:00    recordEnd=2017-07-02 15:45    symptom=
#     ...    patient_gender=88    subject=    index=${1}    pageSize=${10}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0


# 6.3 就诊时间搜索_只有开始时间
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=2017-07-01 00:00    recordEnd=    symptom=
#     ...    patient_gender=88    subject=    index=${1}    pageSize=${10}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0


# 6.4 就诊时间搜索_只有结束时间
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=    recordEnd=2017-07-02 00:00    symptom=
#     ...    patient_gender=88    subject=    index=${1}    pageSize=${10}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

# 6.5 就诊时间搜索_症状-精确搜索
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=    recordEnd=    symptom=咽
#     ...    patient_gender=88    subject=    index=${1}    pageSize=${20}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

# 6.6 就诊时间搜索_症状-模糊搜索
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=    recordEnd=    symptom=咽痛
#     ...    patient_gender=88    subject=    index=${1}    pageSize=${20}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0


# 6.5 就诊时间搜索_科室-精确搜索
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=    recordEnd=    symptom=
#     ...    patient_gender=88    subject=急诊医学科    index=${1}    pageSize=${20}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0



# 6.6 就诊时间搜索_科室-模糊搜索
#     [Documentation]    断言:" error=0"
#     ${getRes}    amc管理端_问诊记录列表    recordStart=    recordEnd=    symptom=
#     ...    patient_gender=88    subject=急诊    index=${1}    pageSize=${20}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0




