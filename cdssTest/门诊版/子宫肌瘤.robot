
*** Settings ***
Suite Teardown    Delete All Sessions
# Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***

子宫肌瘤-病史：女，30岁，下腹坠胀不适、经量增多,推荐疑似诊断：慢性女性盆腔炎
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，下腹坠胀不适、经量增多
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]
    Should Contain    ${aj[:5]}    慢性女性盆腔炎




子宫肌瘤-补充病史：检查结果示：子宫触及肿块，B超示：子宫肌壁间圆形或椭圆形回声,推荐疑似诊断：子宫肌瘤
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，下腹坠胀不适、经量增多,检查结果示：子宫触及肿块，B超示：子宫肌壁间圆形或椭圆形回声
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]
    Should Contain    ${aj[:5]}    子宫肌瘤



子宫肌瘤-点击意思诊断或手动输入：子宫肌瘤,推荐检查：盆腔B超、宫腔镜检查
    [Documentation]
    ${assert}    Create List    盆腔B超    宫腔镜检查
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，下腹坠胀不适、经量增多,检查结果示：子宫触及肿块，B超示：子宫肌壁间圆形或椭圆形回声,
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "子宫肌瘤"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #推荐检查
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]
    # Should Contain    ${aj[:5]}    子宫肌瘤
    Lists Should Be Equal    ${aj}    ${assert}


子宫肌瘤-点击意思诊断或手动输入：子宫肌瘤,推荐治疗:药物治疗、手术治疗
    [Documentation]
    ${assert}    Create List    药物治疗    手术治疗
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，下腹坠胀不适、经量增多,检查结果示：子宫触及肿块，B超示：子宫肌壁间圆形或椭圆形回声,
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "子宫肌瘤"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #推荐检查
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]
    # Should Contain    ${aj[:5]}    子宫肌瘤
    Lists Should Be Equal    ${aj}    ${assert}



