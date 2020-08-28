*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
22.1 amcPc版科室统计图型
    [Documentation]    断言:"symptom存在睡眠问题"
    ${getRes}    amcPc版科室统计图型    enterTime=    recordTime=    symptom=    gender=    subject=
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    ${aj}    Evaluate    [aj['subject'] for aj in $getRes['body']]
    Should Contain    ${aj}    急诊医学科
