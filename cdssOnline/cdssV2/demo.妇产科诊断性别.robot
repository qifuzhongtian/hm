*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions
#医生这边让加的一个脚本，如果一个诊断是妇产科的，那么必须给这个诊断加性别限制为女性
*** Test Cases ***
1.demo.妇产科诊断性别
    [Documentation]    断言:""
    ${getRes}    妇产科诊断性别    query=
    Should Be Equal As Strings    ${getRes['hits']['total']}    0

