*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
*** Test Cases ***
疑似诊断
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    drugCommonNames=    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    Should Contain    ${aj}    荨麻疹

推荐检查
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=荨麻疹
    ...    drugCommonNames=    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
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

# 检查解读:主要为变应性哮喘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=呼出气一氧化氮升高，男，年龄8岁，高热、流涕2天，流感病毒抗体滴度增高
#     ...    drugCommonNames=    examinationList=    newTestList=    labTestList=    newTestList=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=
#     ...    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=6    ageType=岁
#     ...    confirmDiagnosis=    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     #评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
#     Should Contain    ${aj}    主要为变应性哮喘

# 推荐评估表
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
#     ...    drugCommonNames=    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
#     ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     #评估表
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
#     Should Contain    ${aj}    荨麻疹病因分类与发病机制

推荐治疗方案
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    drugCommonNames=    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    Should Be Equal As Strings    ${getRes['body']['regimenInfo']['itemInfoResponseList'][0]['regimenItemName']}    局部治疗
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    # Should Contain    ${aj}    荨麻疹病因分类与发病机制

有确诊诊断,但没有推出疑似诊断,常见诊断中确诊诊断放到首位
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=高同型半胱氨酸血症
    ...    drugCommonNames=    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "高同型半胱氨酸血症"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    Should Contain    ${aj}    高同型半胱氨酸血症

检查检验合理性:电视食道钡餐透视禁止用于消化道穿孔患者
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=消化道穿孔
    ...    drugCommonNames=    examinationList=    newTestList={"testType": 2,"testId": "905","testName": "电视食道钡餐透视"}    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}    presentHistory=    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    Should Be Equal As Strings    ${getRes['body']['logicalExamInfo']['stopExamList'][0]['crowd']}    消化道穿孔患者
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    # Should Contain    ${aj}    荨麻疹病因分类与发病机制
