*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
5.1 诊断依据
    ${getRes}    诊断依据    diseaseId=8753C6A9E9
    Should Be Equal As Strings    ${getRes['body']['docName']}    胃食管反流病
