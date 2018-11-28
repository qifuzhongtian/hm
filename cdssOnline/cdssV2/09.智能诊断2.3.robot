*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

*** Variables ***
# ${assert}


*** Test Cases ***
2.1智能诊断接口_只填症状
    [Documentation]    断言:"慢性浅表性胃炎"
    ${getRes}    智能诊断2.3    symptom=因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗未见好转    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:10]}    慢性浅表性胃炎


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


# 2. 4体格检查_心率<60,心率过慢
#     [Documentation]    断言:"diseaseName=心律失常"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=59    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj}    心律失常

# # 2.5 体格检查_心率>100,心率过快
# #     [Documentation]    断言:"diseaseName=心动过速"
# #     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
# #     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
# #     ...    examInfo=    heartRate=101    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
# #     ...    presentHistory=
# #     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases'][0]['subDiseases']]
# #     log    ${aj}
# #     Should Contain    ${aj}    心动过速


# 2.6 体格检查_收缩压>=140/90,高血压
#     [Documentation]    断言:"diseaseName=高血压"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=90    highBldPress=140
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj}    高血压

# 2.7 体格检查_收缩压<90/60,低血压
#     [Documentation]    断言:"diseaseName=心律失常"
#     ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=59    highBldPress=89
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj}    心律失常




