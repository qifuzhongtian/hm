# *** Settings ***
# Suite Teardown    Delete All Sessions
# Resource          ../cdss.robot
# Library           Collections
# Library           RequestsLibrary

# *** Test Cases ***
# 问诊症状统计
#     [Documentation]    apollo/amc/static_symptom
#     ${getRes}    amcPc版_问诊症状统计    currentPage=1    pageSize=20    countmode=true    userGuid=    doctorGuid=
#     ...    doctorName=    hospitalGuid=    serialNumber=
#     # ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']]
#     # Should Contain    ${aj}    体重问题（指南）
#     Should Be Equal As Strings    ${getRes['body'][0]['symptom']}    体重问题（指南）
