# *** Settings ***
# Suite Teardown    Delete All Sessions
# Resource          ../cdss.robot
# Library           Collections
# Library           RequestsLibrary

# *** Test Cases ***
# 问诊记录列表
#     [Documentation]    apollo/amc/record
#     ${getRes}    amcPc版_问诊记录列表    currentPage=1    pageSize=20    countmode=true    userGuid=    doctorGuid=
#     ...    doctorName=    hospitalGuid=    serialNumber=    recordStart=2018-08-19 00:00    recordEnd=
#     ${aj}    Evaluate    [aj['symptom'] for aj in $getRes['body']['recordList']]
#     Should Contain    ${aj}    体重问题（指南）
#     # Should Be Equal As Strings    ${getRes['body'][0]['subject']}    急诊医学科
