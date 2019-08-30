*** Settings ***
# Suite Setup    获取时间戳
Suite Setup      adminse登录    name=qa    password=e3ceb5881a0a1fdaad01296d7554868d
# ...    AND    checkuser
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***


规则模板配置
    ${index}    Set Variable    1
    ${getRes}    规则模板配置    index=${index}
    ...    pageSize=
    ...    customerId=
    ...    systemId=
    ...    progressType=
    ...    templateName=
    ...    modifyDateBegin=
    ...    modifyDateEnd=
    Should Be Equal As Strings    ${getRes['code']}    200




检查检验查看
    ${getRes}    检查检验查看    customerId=1001
    ...    index=${1}
    ...    pageSize=${20}
    ...    orderBy=${2}
    ...    sourceType=1,2,3

    Should Be Equal As Strings    ${getRes['code']}    200



下发规则
    ${customerId}    Set Variable    1219

    ${getRes}    下发规则    customerId=${customerId}

    Should Be Equal As Strings    ${getRes['head']['error']}    0







