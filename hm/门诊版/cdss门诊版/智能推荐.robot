*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
*** Test Cases ***
疑似诊断,主诉:发作性抽搐2年11+月,推荐诊断:癫痫
    [Documentation]    cdss/mayson/v_5_0/diagnose_through_interrogation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=发作性抽搐2年11+月
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [a['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    Should Contain    ${aj}    癫痫

推荐检查,推荐:尿常规
    [Documentation]    cdss/mayson/v_5_0/diagnose_through_interrogation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=荨麻疹
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    Should Contain    ${aj}    尿常规


检查解读,推荐:贫血
    [Documentation]    cdss/mayson/v_5_0/diagnose_through_interrogation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList={"labTestNumber":"${timestamp}${random}","labTestName":"血红蛋白(Hb)测定","labTestSample":"血液","recordTime":"","labTestItems":[{"labTestItemName":"血红蛋白(Hb)","labTestItemEnName":"","labTestResult":"110","labTestValueUnit":"g/L","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    newTestList=    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=
    ...    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=6    ageType=岁
    ...    confirmDiagnosis=    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    Should Contain    ${aj}    贫血

推荐评估表,推荐:荨麻疹病因分类与发病机制
    [Documentation]    cdss/mayson/v_5_0/diagnose_through_interrogation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    Should Contain    ${aj}    荨麻疹病因分类与发病机制



# 有确诊诊断,但没有推出疑似诊断,常见诊断中确诊诊断放到首位
#     [Documentation]    cdss/mayson/v_5_0/diagnose_through_interrogation
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
#     ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=高同型半胱氨酸血症
#     ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
#     ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "高同型半胱氨酸血症"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     #评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
#     Should Contain    ${aj}    高同型半胱氨酸血症


