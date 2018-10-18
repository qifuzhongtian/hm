*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

*** Variables ***
# ${assert}


*** Test Cases ***
# 2.1智能诊断接口_只填症状
#     [Documentation]    断言:"胆石病"
#     ${getRes}    智能诊断2.3    symptom=发热,胃痛,腹胀,腹痛,高热    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=
#     ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj[:3]}    胆石病


# 2.2 体格检查_体温>=37.5
#     [Documentation]    断言:"急性上呼吸道感染"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=37.5    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj}    急性上呼吸道感染

# 2.3 体格检查_体温>39
#     [Documentation]    断言:"diseaseName=败血症"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=39.1    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj}    败血症


2. 4体格检查_心率<60,心率过慢
    [Documentation]    断言:"diseaseName=心律失常"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=59    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    心律失常

# 2.5 体格检查_心率>100,心率过快
#     [Documentation]    断言:"diseaseName=心动过速"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=101    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases'][0]['subDiseases']]
#     log    ${aj}
#     Should Contain    ${aj}    心动过速


2.6 体格检查_收缩压>=140/90,高血压
    [Documentation]    断言:"diseaseName=高血压"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=90    highBldPress=140
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    高血压

# 2.7 体格检查_收缩压<90/60,低血压
#     [Documentation]    断言:"diseaseName=心律失常"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=59    highBldPress=89
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj}    心律失常




