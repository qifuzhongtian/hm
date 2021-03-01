*** Settings ***
Suite Setup       amcPc版_问诊记录列表    currentPage=1    pageSize=20    countmode=true    userGuid=    doctorGuid=    doctorName=
...               hospitalGuid=    serialNumber=    recordStart=2018-08-19 00:00    recordEnd=
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
问诊记录列表详情
    [Documentation]    apollo/amc/record_info
    ${getRes}    amcPc版_问诊记录列表详情    number=${number}
    Should Be Equal As Integers       ${getRes['head']['error']}    0
