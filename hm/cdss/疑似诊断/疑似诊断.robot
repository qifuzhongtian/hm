*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
*** Test Cases ***
疑似诊断,推荐:荨麻疹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
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
    Should Contain    ${aj}    荨麻疹

推荐检查,推荐:尿常规
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

检查解读,推荐:主要为变应性哮喘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=呼出气一氧化氮升高，男，年龄8岁，高热、流涕2天，流感病毒抗体滴度增高
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    newTestList=    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=
    ...    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=6    ageType=岁
    ...    confirmDiagnosis=    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
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
    Should Contain    ${aj}    主要为变应性哮喘

推荐评估表,推荐:荨麻疹病因分类与发病机制
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

推荐治疗方案,推荐:局部治疗
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
    Should Be Equal As Strings    ${getRes['body']['regimenInfo']['itemInfoResponseList'][0]['regimenItemName']}    局部治疗
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['maysonInfo']['examinationInterpretList']]
    # Should Contain    ${aj}    荨麻疹病因分类与发病机制

有确诊诊断,但没有推出疑似诊断,常见诊断中确诊诊断放到首位
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
    ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=高同型半胱氨酸血症
    ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList=    labTestList=    previousHistory=    personalHistory=
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



# ##
# 检验/检查合理性,相对禁忌:头颅MRI检查不建议用于变态反应性呼吸道疾病患者
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
#     ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=
#     ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList={"testType": 2,"testId": "69","testName": "头颅MRI"}    labTestList=    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
#     ...    highBldPress=    examInfo=    heartRate=    age=33    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"key": "35123","value": "过敏性肺炎"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     # Should Be Equal As Strings    ${getRes['body']['logicalExamInfo']['stopExamList'][0]['crowd']}    消化道穿孔患者
#     #评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['dangerTabooList']]
#     ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['dangerTabooList']]
#     Should Contain    ${aj}    变态反应性呼吸道疾病患者






# 诊断合理性提示:诊断 [睾丸恶性肿瘤] 不适宜于女性患者，请核实相关信息
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
#     ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=
#     ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList={"testType": 2,"testId": "69","testName": "头颅MRI"}    labTestList=    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
#     ...    highBldPress=    examInfo=    heartRate=    age=33    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"key": "33876","value": "睾丸癌"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     # Should Be Equal As Strings    ${getRes['body']['logicalExamInfo']['stopExamList'][0]['crowd']}    消化道穿孔患者
#     #评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['dangerTabooList']]
#     ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalDiseaseInfo']['dangerTabooList']]
#     Should Contain    ${aj}    女性






# 用药合理性提示:相互作用:阿立哌唑片与盐酸氟西汀分散片 谨慎合用
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片
#     ${getRes}    智能推荐门诊    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=    hospitalGuid=    symptom=
#     ...    drugCommonNames=${drugCommonNames}    examinationList=    newTestList={"testType": 2,"testId": "69","testName": "头颅MRI"}    labTestList=    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
#     ...    highBldPress=    examInfo=    heartRate=    age=33    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"key": "33876","value": "睾丸癌"}    presentHistory=    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     # Should Be Equal As Strings    ${getRes['body']['logicalExamInfo']['stopExamList'][0]['crowd']}    消化道穿孔患者
#     #评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['dangerTabooList']]
#     # ${aj}    Evaluate    [aj['grade'] for aj in $getRes['body']['logicalDrugInfo']]
#     # Should Contain    ${aj}    女性
#     Should Be Equal As Strings    ${getRes['body']['logicalDrugInfo']['interactionList'][0]['grade']}    2



