*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
VTE1:入院外科VTE风险评估(Caprini评分表) 规则ID：HMvte1-RS
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    外科VTE风险评估(Caprini评分表)






VTE:判断是否有AI功能
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    ${assert}    Set Variable    外科VTE风险评估(Caprini评分表)
    ${index}    Get Index From List    ${aj}    ${assert}
    ${compare}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['compare']}
    Should Not Be Equal As Integers    ${compare}    ${0}


VTE1:外科VTE风险评估(Caprini评分表)--否定条件
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    下腔静脉栓塞
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should not Contain    $getRes['body']['qualityControlResponse']    illnessAssessList


VTE1:入院内科VTE风险评估(Padua评分表) 规则ID：HMvte2-RS
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    内科VTE风险评估(Padua评分表)



VTE1:快速确认Caprini低危，推出外科出血风险 规则ID：HMvte5-2-RS
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND  智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    外科出血风险评估



VTE1:外科出血风险差异对比
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ...    AND    快速确认评估表    assessDictName=外科住院患者出血风险评估    assessId=590    assessName=外科出血风险评估    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=22883
    ...    productId=${1024}    projectId=${589}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte5-2    isConfirmNurse=0
    ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"尿血"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    ${assert}    Set Variable    外科出血风险评估
    ${index}    Get Index From List    ${aj}    ${assert}
    ${isConfirm}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['isConfirm']}
    ${compare}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['compare']}

    Should Not Be Equal As Integers    ${compare}    ${2}
    Should Be Equal As Integers    ${isConfirm}    ${1}



# VTE1:推出术后Caprini规则
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    获取时间
#     # ${timestamp}    Get Time    epoch
#     ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
#     ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
#     ...    AND    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"progressGuid": "222222","progressType": 13,"msgType": 2,"messageList": [{"key": "术前诊断","value": ""}, {"key": "术后诊断","value": ""}, {"key": "手术名称","value": "${operation_name}"}, {"key": "手术经过","value": ""}, {"key": "医师签名","value": ""}, {"key": "拟施手术名称","value": ""}, {"key": "麻醉方式","value": ""}, {"key": "手术日期","value": "${startOperationDate}"}, {"key": "术中出现的情况及处理","value": ""}, {"key": "术中出血","value": ""}, {"key": "术中输血","value": ""}, {"key": "文档标题","value": ""}, {"key": "手术开始时间","value": "${startOperationTime}"}, {"key": "手术截止时间","value": "${finishOperation}"}, {"key": "麻醉开始时间","value": ""}, {"key": "麻醉结束时间","value": ""}, {"key": "手术医师代码","value": ""}, {"key": "手术医生姓名","value": ""}, {"key": "麻醉医师代码","value": ""}, {"key": "麻醉医生姓名","value": ""}],"recordTime": "${admissionTime}","doctorName": ""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"6","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
#     # log    ${size}

#     #得到返回值的list
#     ${aj}    Evaluate    [aj['assessPostil'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
#     Should Contain    ${aj}    患者术后24小时内应再次进行VTE风险评估（Caprini评分）



# VTE1:术后Caprini通过
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    获取时间
#     # ${timestamp}    Get Time    epoch
#     ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
#     ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
#     ...    AND    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"progressGuid": "222222","progressType": 13,"msgType": 2,"messageList": [{"key": "术前诊断","value": ""}, {"key": "术后诊断","value": ""}, {"key": "手术名称","value": "${operation_name}"}, {"key": "手术经过","value": ""}, {"key": "医师签名","value": ""}, {"key": "拟施手术名称","value": ""}, {"key": "麻醉方式","value": ""}, {"key": "手术日期","value": "${startOperationDate}"}, {"key": "术中出现的情况及处理","value": ""}, {"key": "术中出血","value": ""}, {"key": "术中输血","value": ""}, {"key": "文档标题","value": ""}, {"key": "手术开始时间","value": "${startOperationTime}"}, {"key": "手术截止时间","value": "${finishOperation}"}, {"key": "麻醉开始时间","value": ""}, {"key": "麻醉结束时间","value": ""}, {"key": "手术医师代码","value": ""}, {"key": "手术医生姓名","value": ""}, {"key": "麻醉医师代码","value": ""}, {"key": "麻醉医生姓名","value": ""}],"recordTime": "${admissionTime}","doctorName": ""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
#     ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
#     ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"6","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
#     # log    ${size}

#     #得到返回值的list
#     ${aj}    Evaluate    [aj['assessPostil'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
#     Should Not Contain    ${aj}    患者术后24小时内应再次进行VTE风险评估（Caprini评分）




# VTE1:推出转科后Caprini规则
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    获取时间
#     ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2020-02-02    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"诊断依据及鉴别诊断","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
#     ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
#     ...    AND    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=3    requestSource=
#     ...    doctorGuid=1    doctorName=测试医生    admissionTime=2020-02-02    inpatientDepartment=呼吸科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList=    deleteProgressNoteList=    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "374","orderContent": "转科","frequency": "","orderFlag": 1,"orderType": 4,"timelinessFlag": 2,"orderClass":1,"createTime":"${medicalOrdersTime}","stopTime":""}
#     ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2020-02-02    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"诊断依据及鉴别诊断","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
#     # log    ${size}

#     #得到返回值的list
#     ${aj}    Evaluate    [aj['assessPostil'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
#     Should Contain    ${aj}    患者转科后24小时内应再次进行VTE风险评估（Caprini评分）



VTE1:Caprini中危，推出VTE预防措施 规则ID：HMvte7-RS
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=中危    assessValue=3    assessValueUnit=分    displayResult=中危    expressId=20487
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    Should Contain    ${aj}    VTE预防措施




VTE妊娠:妊娠期及产褥期VTE危险因素评分 规则ID：vte1-RS
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    双胎妊娠
    ${Subjective}    Set Variable
    ${admissionTime}    Get time    timestamp
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${admissionTime}    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"诊断依据及鉴别诊断","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
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
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    妊娠期及产褥期VTE危险因素评分




VTE1:妊娠期及产褥期VTE危险因素评分差异对比
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2020-02-02    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"36","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"诊断依据及鉴别诊断","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=妊娠及产褥期VTE危险因素评分    assessId=434    assessName=妊娠期及产褥期VTE危险因素评分    assessResult=    assessValue=0    assessValueUnit=分    displayResult=0分    expressId=21248
    ...    productId=${1024}    projectId=${1001}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=vte1-RS    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2020-02-02    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"36","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"诊断依据及鉴别诊断","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
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
    # log    ${size}
    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    ${assert}    Set Variable    妊娠期及产褥期VTE危险因素评分
    ${index}    Get Index From List    ${aj}    ${assert}
    ${isConfirm}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['isConfirm']}
    ${compare}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['compare']}

    Should Not Be Equal As Integers    ${compare}    ${2}
    Should Be Equal As Integers    ${isConfirm}    ${1}



VTE4.0:Caprini差异对比
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ${getRes}    智能推荐v2    serialNumber=${serialNumber}    userGuid=${userGuid}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
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
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    ${assert}    Set Variable    外科VTE风险评估(Caprini评分表)
    ${index}    Get Index From List    ${aj}    ${assert}
    ${compare}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['compare']}
    ${isConfirm}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['isConfirm']}

    Should Not Be Equal As Integers    ${compare}    2
    Should Be Equal As Integers    ${isConfirm}    1





VTE4.0:深静脉血栓(DVT)Wells评分 规则ID：vteDVT-1
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2019-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"诊断依据及鉴别诊断","value":""},{"key":"现病史","value":"Caprini评分：3分"},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=中危    assessValue=3    assessValueUnit=分    displayResult=中危    expressId=20487
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ${getRes}    快速推荐    serialNumber=${serialNumber}    userGuid=${userGuid}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2019-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
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
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    深静脉血栓(DVT)Wells评分


VTE4.0:深静脉血栓(DVT)Wells差异对比
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=6    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2019-12-12    inpatientDepartment=呼吸科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=中危    assessValue=3    assessValueUnit=分    displayResult=中危    expressId=21001
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ...    AND    快速确认评估表    assessDictName=DVT-Wells评分    assessId=123    assessName=深静脉血栓(DVT)Wells评分    assessResult=患者发生DVT低度可能性    assessValue=0    assessValueUnit=分    displayResult=患者发生DVT低度可能性    expressId=21162
    ...    productId=${2048}    projectId=${1137}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvteDVT-1    isConfirmNurse=0
    ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2019-12-12    inpatientDepartment=呼吸科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}
    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    ${assert}    Set Variable    深静脉血栓(DVT)Wells评分
    ${index}    Get Index From List    ${aj}    ${assert}
    ${isConfirm}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['isConfirm']}
    ${compare}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['compare']}

    Should Not Be Equal As Integers    ${compare}    2
    Should Be Equal As Integers    ${isConfirm}    1



VTE4.0:修改文案 患者风险可能发生改变
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    #获取并返回外科VTE风险评估(Caprini评分表)索引
    ${assert}    Set Variable    外科VTE风险评估(Caprini评分表)
    ${index}    Get Index From List    ${aj}    ${assert}
    ${isConfirmNum}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['isConfirm']}
    Should Be Equal As Integers    ${isConfirmNum}    1





VTE4.0:医护与系统评估不一致
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=0分    assessRemark=    assessResult=低危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    #获取并返回外科VTE风险评估(Caprini评分表)索引
    ${assert}    Set Variable    外科VTE风险评估(Caprini评分表)
    ${index}    Get Index From List    ${aj}    ${assert}
    ${compare}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['compare']}
    ${isConfirm}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]}
    Should Be Equal As Integers    ${compare}    3
    Should Not Contain    ${isConfirm}    isConfirm




VTE4.2:护士确认的评估表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=6    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2019-12-12    inpatientDepartment=呼吸科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20294
    ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=6    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2019-12-12    inpatientDepartment=呼吸科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}
    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    ${assert}    Set Variable    外科VTE风险评估(Caprini评分表)
    ${index}    Get Index From List    ${aj}    ${assert}
    ${isConfirmNurse}    Set Variable    ${getRes['body']['qualityControlResponse']['illnessAssessList'][${index}]['isConfirmNurse']}

    Should Be Equal As Integers    ${isConfirmNurse}    1



VTE-PTE:做Caprini推急性肺栓塞（PTE）Wells评分 规则ID：HMvtePTE-1
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠，呼吸困难"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=妊娠及产褥期VTE危险因素评分    assessId=434    assessName=妊娠期及产褥期VTE危险因素评分    assessResult=    assessValue=3    assessValueUnit=分    displayResult=3分    expressId=21248
    ...    productId=${1024}    projectId=${1001}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=vte1-RS    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    急性肺栓塞（PTE）Wells评分




VTE-PTE:评估（PTE）Wells 急性肺栓塞（PTE）Wells评分消失 规则ID：HMvtePTE-1
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠，呼吸困难"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=妊娠及产褥期VTE危险因素评分    assessId=434    assessName=妊娠期及产褥期VTE危险因素评分    assessResult=    assessValue=3    assessValueUnit=分    displayResult=3分    expressId=21248
    ...    productId=${1024}    projectId=${1001}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=vte1-RS    isConfirmNurse=0
    ...    AND    快速确认评估表    assessDictName=Wells评分    assessId=4    assessName=急性肺栓塞（PTE）Wells评分    assessResult=低度可能急性肺栓塞    assessValue=0    assessValueUnit=分    displayResult=0分    expressId=22755
    ...    productId=${2048}    projectId=${1144}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=vtePTE-1    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Not Contain    ${aj}    急性肺栓塞（PTE）Wells评分



VTE-PTE,推荐:PTE筛查 规则ID：vtePTE-2
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠，呼吸困难"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=妊娠及产褥期VTE危险因素评分    assessId=434    assessName=妊娠期及产褥期VTE危险因素评分    assessResult=    assessValue=3    assessValueUnit=分    displayResult=3分    expressId=21248
    ...    productId=${1024}    projectId=${1001}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=vte1-RS    isConfirmNurse=0
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=609    assessName=肺血栓栓塞症(PTE)危险分层综合评估    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=高危    assessRemark=    assessResult=肺血栓栓塞症危险分层：高危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    Should Contain    ${aj}    PTE筛查



VTE-PTE,推荐:D-二聚体检测 规则ID：vtePTE-4
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠，呼吸困难"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    快速确认评估表    assessDictName=妊娠及产褥期VTE危险因素评分    assessId=434    assessName=妊娠期及产褥期VTE危险因素评分    assessResult=    assessValue=3    assessValueUnit=分    displayResult=3分    expressId=21248
    ...    productId=${1024}    projectId=${1001}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=vte1-RS    isConfirmNurse=0
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=4    assessName=急性肺栓塞（PTE）Wells评分    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=0分    assessRemark=    assessResult=低度可能急性肺栓塞    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    Should Contain    ${aj}    D-二聚体检测


VTE-PTE,推荐:抗凝治疗 规则ID：vtePTE-6
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=呼吸科    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"双胎妊娠，呼吸困难"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    检查结果    serialNumber=${serialNumber}    userGuid=${userGuid}    doctorGuid=1    doctorName=测试医生    inpatientDepartment=呼吸科    admissionTime=2018-12-12    inpatientArea=内科1病区    requestSource=1    patientName=tester    openInterdict=${1}    patientInfo={"gender":"1","age":"19","ageType":"岁"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    examinationList={"examinationNumber":"61e6cfe0-ba83-11ea-808c-0165d119bfea","examinationName":"肺动脉栓塞","examinationResult":"肺动脉栓塞","examinationDesc":"肺动脉栓塞","reportTime":"${time_now}","recordTime":"${time_now}"}
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=呼吸科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    Should Contain    ${aj}    抗凝治疗


VTE-复旦肿瘤,推荐:肿瘤妇科VTE风险因素评估（m-Caprini） 规则ID：FDcancer-vte-1
     [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch

    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    肿瘤妇科VTE风险因素评估（m-Caprini）


VTE-复旦肿瘤,推荐:外科住院患者出血风险评估 规则ID：FDcancer-vte-2
     [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch

    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=807    assessName=肿瘤妇科VTE风险因素评估（m-Caprini）    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=3分    assessRemark=    assessResult=中危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['assessPostil'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    Should Contain    ${aj}    抗凝预防存在风险，应对需要预防的住院患者进行出血风险评估



VTE-复旦肿瘤,推荐:出血低危推术前VTE预防措施 规则ID：FDcancer-vte-5
     [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch

    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=807    assessName=肿瘤妇科VTE风险因素评估（m-Caprini）    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=5分    assessRemark=    assessResult=高危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ...    AND    快速确认评估表    assessDictName=外科住院患者出血风险评估    assessId=590    assessName=外科出血风险评估    assessResult=低危    assessValue=    assessValueUnit=    displayResult=低危    expressId=23105
    ...    productId=${2048}    projectId=${2525}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=FDcancer-vte-2    isConfirmNurse=0
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    Should Contain    ${aj}    术前VTE预防措施


VTE-复旦肿瘤,推荐:出血高危推术前VTE预防措施 规则ID：FDcancer-vte-6
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch

    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=807    assessName=肿瘤妇科VTE风险因素评估（m-Caprini）    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=5分    assessRemark=    assessResult=高危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=590    assessName=外科出血风险评估    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=高危    assessRemark=    assessResult=高危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    Should Contain    ${aj}    术前VTE预防措施


VTE-复旦肿瘤,推荐:D-二聚体推PTE筛查 规则ID：FDcancer-vte-3
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch

    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=807    assessName=肿瘤妇科VTE风险因素评估（m-Caprini）    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=5分    assessRemark=    assessResult=高危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ...    AND    检验报告    serialNumber=${serialNumber}    userGuid=${userGuid}    doctorGuid=0210497    requestSource=1    doctorName=测试医生    patientName=tester    department=呼吸科    inpatientArea=内科1病区    patientInfo={"gender":"1","age":"19","ageType":"岁"}    labTestList={"labTestNumber":${2205093},"labTestName":"D-二聚体","labTestSample":"血液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"D-二聚体","labTestResult":"1.6","labTestValueUnit":"mg/L","labTestValueChange":"","labTestMethod":${null},"normalRange":" "}]}
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    Should Contain    ${aj}    PTE筛查





VTE-复旦肿瘤,推荐:D-二聚体推静脉超声检查 规则ID：FDcancer-vte-4
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch

    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=807    assessName=肿瘤妇科VTE风险因素评估（m-Caprini）    patientGuid=${userGuid}    serialNumber=${serialNumber}    assessValue=5分    assessRemark=    assessResult=高危    historyItemList=    source=    resultContent=    assessItemWordIds=    pageSource=2
    ...    AND    检验报告    serialNumber=${serialNumber}    userGuid=${userGuid}    doctorGuid=0210497    requestSource=1    doctorName=测试医生    patientName=tester    department=呼吸科    inpatientArea=内科1病区    patientInfo={"gender":"1","age":"19","ageType":"岁"}    labTestList={"labTestNumber":${2205093},"labTestName":"D-二聚体","labTestSample":"血液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"D-二聚体","labTestResult":"1.6","labTestValueUnit":"mg/L","labTestValueChange":"","labTestMethod":${null},"normalRange":" "}]}
    ${getRes}    快速推荐    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"盆腔肿物 阳性"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    Should Contain    ${aj}    静脉超声检查








VTE-复旦肿瘤,推荐:推术前停用低分子肝素 规则ID：FDcancer-vte-19
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    #获取此刻时间
    ...    AND    时间
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=5    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8065","orderContent": "剖宫产","createTime":"${time}","executeTime":"${operation_start_time}","orderFlag": 1,"orderType": 6,"orderFlag": 1}
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "10552","orderContent": "那屈肝素钙注射液","createTime":"${medicalOrders_time}","stopTime":"${medicalOrders_stop_time}","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${getRes}    智能推荐v2    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=妇科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders=
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
    # log    ${size}

    #得到返回值的list
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    Should Contain    ${aj}    术前停用低分子肝素












