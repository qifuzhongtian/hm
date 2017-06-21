*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

*** Test Cases ***
2.1智能诊断接口_只填症状
    [Documentation]    断言:"胆石病"
    ${getRes}    智能诊断2.3    symptom=发热,胃痛,腹胀,腹痛,高热    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:3]}    胆石病


2.2 体格检查_体温>=37.5
    [Documentation]    断言:"急性上呼吸道感染"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=37.5    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    急性上呼吸道感染

2.3 体格检查_体温>39
    [Documentation]    断言:"diseaseName=败血症"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=39.1    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    败血症


2. 4体格检查_心率<60,心率过慢
    [Documentation]    断言:"diseaseName=心律失常"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=59    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    心律失常

2.5 体格检查_心率>100,心率过快
    [Documentation]    断言:"diseaseName=心动过速"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=101    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases'][0]['subDiseases']]
    log    ${aj}
    Should Contain    ${aj}    心动过速


2.6 体格检查_收缩压>=140/90,高血压
    [Documentation]    断言:"diseaseName=高血压"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=90    highBldPress=140
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    高血压

2.7 体格检查_收缩压<90/60,低血压
    [Documentation]    断言:"diseaseName=心律失常"
    ${getRes}    智能诊断2.3    symptom=    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=59    highBldPress=89
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    心律失常


2.8 推出的子诊断是危重疾病，则单独在危重疾病中显示，在其父疾病的相关疾病中不再显示
    [Documentation]    '中暑痉挛'分数比'中暑'低,因为是危重疾病,所以单独在危重疾病中显示,不用显示在相关疾病中
    ${getRes}    智能诊断2.3    symptom=高温环境，头晕，中暑    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    中暑痉挛



2.9 推出的子疾病召回得分高于父疾病，则在第一页面中显示，，在其父疾病的相关疾病中不再显示
    [Documentation]    该case中'原发性高血压'分数比'高血压'高,所以单独在危重疾病中显示,不用显示在相关疾病中
    ${getRes}    智能诊断2.3    symptom=A2＞P2，主动脉瓣区收缩期吹风样杂音，心尖部收缩期吹风样杂音，心界向左下扩大    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj}    原发性高血压

