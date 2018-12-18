*** Settings ***
Suite Teardown    Delete All Sessions
# Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# userGuid String 是 患者ID（接入放定义）
# doctorGuid String 是 医生ID（接入放定义）
# serialNumber String 是 业务流水ID（接入方定义）
# hospitalGuid String 是 医院ID（惠每分配）
# gender Integer 否 性别1男,0女
# age double 否 年龄
# ageType String 否 岁、月、天
# bodyTempr Double 否 体温
# weight Double 否 体重
# heartRate Integer 否 心率
# lowBldPress Integer 否 收缩压
# highBldPress Integer 否 舒张压
# examInfo String 否 检查
# previousHistory String 否 既往史
# personalHistory String 否 个人史
# allergyHistory String 否 过敏史
# familyHistory String 否 家族史
# symptom String 否 主诉
# confirmDiagnosis String 否 已确定诊断

*** Test Cases ***




疑似诊断
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
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
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "鼻损伤"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
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
    Should Contain    ${aj}    头颅X线


检查解读
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=呼出气一氧化氮升高
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
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
    Should Contain    ${aj}    变应性哮喘


推荐评估表
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
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



推荐治疗方案
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=急性胸痛,长期卧床.肌钙蛋白T：0.5 ug/L,消化道穿孔
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "L50.900","key": "34146","value": "荨麻疹"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
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
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=高同型半胱氨酸血症
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "高同型半胱氨酸血症"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
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




