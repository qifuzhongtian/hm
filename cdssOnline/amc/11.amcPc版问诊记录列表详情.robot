*** Settings ***
Suite Setup      amcPc版_问诊记录列表    currentPage=1    pageSize=20    countmode=true    userGuid=    doctorGuid=    doctorName=    hospitalGuid=    serialNumber=    recordStart=2018-08-19 00:00    recordEnd=
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明


*** Test Cases ***
16.1 问诊记录列表详情
    [Documentation]    断言:" error=0"
    ${getRes}    amcPc版_问诊记录列表详情    number=${number}
    Should Be Equal As Strings    ${getRes['body']['symptom']}    体重问题（指南）


