*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions



*** Test Cases ***
5.1 诊断依据
    [Documentation]
    ${getRes}    诊断依据    diseaseId=8753C6A9E9
    Should Be Equal As Strings    ${getRes['body']['docName']}    胃食管反流病

