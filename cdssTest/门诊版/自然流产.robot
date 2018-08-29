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

自然流产-病史：女，28岁，停经后阴道流血2天，腹部剧痛1小时，检查结果示：血HCG升高,推荐疑似诊断：自然流产
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，28岁，停经后阴道流血2天，腹部剧痛1小时，血HCG升高
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=28    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    Should Contain    ${aj[:5]}    自然流产
    #推荐检查
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]

自然流产-点击疑似诊断或手动输入：自然流产,推荐检查：尿妊娠试验、性激素检查、RH血型鉴定、ABO血型鉴定、血常规、凝血常规、B型超声检查
    [Documentation]
    ${assert}    Create List    尿妊娠试验    性激素检查    RH血型鉴定    ABO血型鉴定    血常规    凝血常规    B型超声检查
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，28岁，停经后阴道流血2天，腹部剧痛1小时，血HCG升高
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=28    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "自然流产"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #Should Contain    ${aj[:5]}    自然流产
    #推荐检查
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]

自然流产-点击疑似诊断或手动输入：自然流产,推荐治疗：保胎治疗、难免流产治疗、自然流产后感染治疗、不完全流产治疗、稽留流产治疗
    [Documentation]
    ${assert}    Create List     保胎治疗    难免流产治疗    自然流产后感染治疗    不完全流产治疗    稽留流产治疗
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，28岁，停经后阴道流血2天，腹部剧痛1小时，血HCG升高
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=28    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "自然流产"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #Should Contain    ${aj[:5]}    自然流产
    #推荐检查
    #${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #治疗方案
    ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]















