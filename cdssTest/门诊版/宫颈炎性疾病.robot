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

宫颈炎性疾病-病史：女，30岁，外阴瘙痒2周,推荐疑似诊断：外阴瘙痒症
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，外阴瘙痒2周
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    Should Contain    ${aj[:5]}    外阴瘙痒症
    #推荐检查
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]

宫颈炎性疾病-补充病史：体检结果示：妇科检查见宫颈管粘膜易出血，子宫颈充血水肿,推荐疑似诊断：宫颈炎性疾病
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，外阴瘙痒2周，妇科检查见宫颈管粘膜易出血，子宫颈充血水肿
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    Should Contain    ${aj[:5]}    宫颈炎性疾病
    #推荐检查
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]

宫颈炎性疾病-点击疑似诊断或手动输入：宫颈炎性疾病,推荐检查：衣原体抗原测定、阴道分泌物常规（清洁度及滴虫）/白带常规、宫颈分泌物涂片检查、快速淋球菌检测
    [Documentation]
    ${assert}    Create List    阴道分泌物常规(清洁度及滴虫)/白带常规    宫颈分泌物涂片检查    衣原体抗原测定    快速淋球菌检测
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，外阴瘙痒2周，妇科检查见宫颈管粘膜易出血，子宫颈充血水肿
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "宫颈炎性疾病"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #Should Contain    ${aj[:5]}    宫颈炎性疾病
    #推荐检查
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #治疗方案
    # ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]

宫颈炎性疾病-点击疑似诊断或手动输入：宫颈炎性疾病,推荐治疗：药物治疗
    [Documentation]
    #${assert}    Create List    衣原体抗原测定    阴道分泌物常规（清洁度及滴虫）/白带常规    宫颈分泌物涂片检查    快速淋球菌检测
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    hasDetail=    symptomClickDiseaseId=
    ...    symptom=女，30岁，外阴瘙痒2周，妇科检查见宫颈管粘膜易出血，子宫颈充血水肿
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "宫颈炎性疾病"}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #Should Contain    ${aj[:5]}    宫颈炎性疾病
    #推荐检查
    #${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #治疗方案
    ${aj}    Evaluate    [aj['regimenItemName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    Should Contain    ${aj}    药物治疗
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]











