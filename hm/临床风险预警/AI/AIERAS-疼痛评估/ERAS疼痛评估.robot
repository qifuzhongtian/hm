*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
PAIN-1:入院推荐疼痛评分 规则ID PAIN-1
    [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    ${aj}    Evaluate    [aj['ruleNumber'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    PAIN-1


# PAIN-2:疼痛评分≥4分 推荐治疗方案 中重度疼痛镇痛治疗 规则ID PAIN-2
#     [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ...    AND    保存评估历史记录    recordId=${recordId}    assessId=930    assessName=面部表情疼痛评分量表（Wong-Banker）    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=4    assessRemark=    assessResult=轻微疼痛    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
#     ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     ######质控
#     #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #####质控推荐检查
#     ${aj}    Evaluate    [aj['ruleNumber'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
#     Should Contain    ${aj}    PAIN-2




