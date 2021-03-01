*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
常见诊断
    [Documentation]    cdss/v_2_0/common_diseases
    ${getRes}    常见诊断
    Should Be Equal As Strings    ${getRes['body']['commonDiseases'][0]['diseaseName']}    急性上呼吸道感染
    # [Teardown]    Delete All Sessions
