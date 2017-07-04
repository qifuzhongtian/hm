*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

*** Test Cases ***
1.demo.妇产科诊断性别
    [Documentation]    断言:"[allCallbackWords]包含:血氧饱和度降低"
    ${getRes}    妇产科诊断性别    query=
    Should Be Equal As Strings    ${getRes['hits']['total']}    0




1.demo.妇产科诊断性别1
    [Documentation]    断言:"[allCallbackWords]包含:血氧饱和度降低"
    ${getRes}    妇产科诊断性别1    query=    department=妇产科
    Should Be Equal As Strings    ${getRes['hits']['total']}    0




