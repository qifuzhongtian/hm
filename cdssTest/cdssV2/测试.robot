*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
# test
#     [Documentation]    主诉:阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血'
#     ${getRes}    智能诊断2.3    symptom=阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
#     ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     # Run Keyword If    "宫颈原位癌"1 in ${aj[:10]}    log    2
#     ${assert}    Set Variable    "宫颈原位癌1"
#     Run Keyword If    ${assert} in ${aj}    LOG    hello
#     ...    ELSE    log    88
#     # Should Contain    ${aj[:10]}    宫颈原位癌1

# test1
#     [Documentation]    主诉:阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血'
#     ${getRes}    智能诊断2.3    symptom=阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
#     ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     # Run Keyword If    "宫颈原位癌"1 in ${aj[:10]}    log    2
#     ${assert}    Set Variable    "宫颈原位癌1"
#     Run Keyword If    ${assert} in ${aj[:10]}    set Variable    hello
#     ...    ELSE    log    88
#     # Should Contain    ${aj[:10]}    宫颈原位癌1

# test2
#     [Documentation]    主诉:阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血'
#     ${getRes}    智能诊断2.3    symptom=阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
#     ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     # Run Keyword If    "宫颈原位癌"1 in ${aj[:10]}    log    2
#     ${assert}    Set Variable    "宫颈原位癌"
#     ${assert}    Run Keyword If    ${assert} in ${aj[:10]}    set Variable    hello
#     \    ...    ELSE    set Variable    88
#     Should Contain    ${assert}    宫颈原位癌

# test3
#     [Documentation]    主诉:阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血'
#     ${getRes}    智能诊断2.3    symptom=阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
#     ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     # Run Keyword If    "宫颈原位癌"1 in ${aj[:10]}    log    2
#     #${i}    Set Variable    ${0}
#     :FOR    ${i}    IN RANGE    2
#     \    log    i=${i}
#     log    ${i}
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     ${aj1}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases'][${i}]['subDiseases']]
#     ${assert}    Set Variable    "宫颈原位癌"
#     ${aj}    Run Keyword If    ${assert} in ${aj[:10]}    Should Contain    ${aj}    细菌性阴道病1
#     \    ...
#     ...    ELSE    ${assert} in ${aj1[:10]}    Should Contain    ${aj1}    细菌性阴道病2
#     #log    ${aj1}
