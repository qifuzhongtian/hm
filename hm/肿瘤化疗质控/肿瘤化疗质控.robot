*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

化疗稽查:特异性化疗药物,推出:血常规,规则ID：chemo-1
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——血常规

化疗稽查:特异性化疗药物,推出:肝功能检查,规则ID：chemo-2
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——肝功能

化疗稽查:特异性化疗药物,推出:肾功能检查,规则ID：chemo-3
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——肾功能

化疗稽查:特异性化疗药物,推出:电解质检查,规则ID：chemo-4
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——电解质

化疗稽查:特异性化疗药物,推出:凝血功能检查,规则ID：chemo-5
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——凝血功能

化疗稽查:特异性化疗药物,推出:BNP检查,规则ID：chemo-6
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——BNP

化疗稽查:特异性化疗药物,推出:心肌酶检查,规则ID：chemo-7
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——心肌酶

化疗稽查:特异性化疗药物,推出:心电图检查,规则ID：chemo-8
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=4    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['tumorQcResponse']['tumorChemotherapy']['tumorExaminationRecommendList']]
    Should Contain    ${aj}    化疗前常规检查——心电图
