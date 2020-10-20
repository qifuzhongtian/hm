*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
常见症状
    #    [Documentation]    cdss/v_2_0/common_symptom
    ${getRes}    常见症状
    log    ${getRes}
    Should Be Equal As Strings    ${getRes['body']['commonSymptom'][0]}    发热
