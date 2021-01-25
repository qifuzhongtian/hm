*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
amcPc版症状搜索
    [Documentation]    cdss/amc/symptom,断言:"symptom存在睡眠问题"
    ${getRes}    amcPc版症状搜索    symptom=头疼
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']]
    Should Contain    ${aj}    偏头疼
