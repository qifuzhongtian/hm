
*** Settings ***
Suite Teardown    Delete All Sessions
# Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***

卵巢肿瘤-病史：女，33岁，腹胀伴食欲减退2个月,推荐疑似诊断：肝炎
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，33岁，腹胀伴食欲减退2个月
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=33    ageType=岁    confirmDiagnosis=
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
    Should Contain    ${aj[:5]}    肝炎


卵巢肿瘤-补充病史:体检结果示：直肠子宫陷凹触及质硬结节，子宫一侧触及肿物,推荐疑似诊断：卵巢肿瘤
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，33岁，腹胀伴食欲减退2个月,体检结果示：直肠子宫陷凹触及质硬结节，子宫一侧触及肿物
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=33    ageType=岁    confirmDiagnosis=
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
    Should Contain    ${aj[:5]}    卵巢肿瘤



卵巢肿瘤-点击疑似诊断或手动输入：卵巢肿瘤,推荐检查:腹腔镜检查，血常规，尿常规，盆腔B超，肝功能，肾功能，盆腔MRI，血胸、腹水浓缩查肿瘤细胞，肿瘤标志物测定，冰冻切片病理诊断
    [Documentation]
    ${assert}    Create List    腹腔镜检查    血常规    尿常规    盆腔B超    肝功能    肾功能    盆腔MRI    血胸、腹水浓缩查肿瘤细胞    肿瘤标志物测定    冰冻切片病理诊断
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，33岁，腹胀伴食欲减退2个月,体检结果示：直肠子宫陷凹触及质硬结节，子宫一侧触及肿物
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=33    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "卵巢肿瘤"}
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
    # Should Contain    ${aj[:5]}    卵巢肿瘤
    Lists Should Be Equal    ${aj}    ${assert}



卵巢肿瘤-点击疑似诊断或手动输入：卵巢肿瘤,推荐治疗:手术治疗
    [Documentation]
    # ${assert}    Create List    腹腔镜检查    血常规    尿常规    盆腔B超    肝功能    肾功能    盆腔MRI    血胸、腹水浓缩查肿瘤细胞    肿瘤标志物测定    冰冻切片病理诊断
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，33岁，腹胀伴食欲减退2个月,体检结果示：直肠子宫陷凹触及质硬结节，子宫一侧触及肿物
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=33    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "卵巢肿瘤"}
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
    Should Contain    ${aj[:5]}    手术治疗
    # Lists Should Be Equal    ${aj}    ${assert}




