*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
amcPc版科室统计图型
    [Documentation]    cdss/amc/static_subject
    ${getRes}    amcPc版科室统计图型    enterTime=    recordTime=    symptom=    gender=    subject=
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    ${aj}    Evaluate    [aj['subject'] for aj in $getRes['body']]
    Should Contain    ${aj}    急诊医学科
