*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***


推荐治疗:药接种疫苗,维持治疗
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    接种疫苗    维持治疗
    ${Assessment}    Set Variable    支气管哮喘
    ${Subjective}    Set Variable    双肺哮鸣音
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    List Should Contain Sub List    ${aj}    ${assert}


检验/检查合理性,相对禁忌:头颅MRI检查不建议用于变态反应性呼吸道疾病患者
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    过敏性肺炎
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment} "},{"key":"出院诊断","value":"${Assessment}"},{"key":"出院情况","value":""},{"key":"手术名称","value":""}],"progressType":${2},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
    ...    medicalOrders={"orderClass":1,"orderType":2,"sample":"","position":"","frequency":"","orderId":"1572252688999","description":"","createTime":"2019-10-28 16:51:23","orderCode":"69","orderContent":"头颅MRI","orderFlag":1}
    ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['dangerTabooList']]
    Should Contain    ${aj}    变态反应性呼吸道疾病患者




诊断合理性提示:诊断 [睾丸恶性肿瘤] 不适宜于女性患者，请核实相关信息
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    睾丸癌
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment} "},{"key":"出院诊断","value":"${Assessment}"},{"key":"出院情况","value":""},{"key":"手术名称","value":""}],"progressType":${2},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
    ...    medicalOrders={"orderClass":1,"orderType":2,"sample":"","position":"","frequency":"","orderId":"1572252688999","description":"","createTime":"2019-10-28 16:51:23","orderCode":"69","orderContent":"头颅MRI","orderFlag":1}
    ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalDiseaseInfo']['dangerTabooList']]
    Should Contain    ${aj}    女性





重复性合理性提示:5分钟禁止同时重复开具尿常规
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment} "},{"key":"出院诊断","value":"${Assessment}"},{"key":"出院情况","value":""},{"key":"手术名称","value":""}],"progressType":${2},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
    ...    medicalOrders={"orderClass":1,"orderType":1,"sample":"尿液","position":"","frequency":"","orderId":"1571975052451","description":"","createTime":"2019-10-25 11:44:10","orderCode":"32","orderContent":"尿常规","orderFlag":1},{"orderClass":1,"orderType":1,"sample":"","position":"","frequency":"","orderId":"1571974752291","description":"","createTime":"2019-10-25 11:40:10","orderCode":"32","orderContent":"尿常规","orderFlag":1}
    #####重复性合理性提示
    ${aj}    Evaluate    [aj['intervalDesc'] for aj in $getRes['body']['repeatabilityInfo']['stopTabooList']]
    Should Contain    ${aj}    5分钟内



手术合理性提示:全人工心脏移植术禁止用于肾衰竭者
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    急性肾衰竭
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment} "},{"key":"出院诊断","value":"${Assessment}"},{"key":"出院情况","value":""},{"key":"手术名称","value":""}],"progressType":${2},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
    ...    medicalOrders={"orderClass":1,"orderType":6,"sample":"","position":"","frequency":"","orderId":"1572252688999","description":"","createTime":"2019-10-28 16:51:23","orderCode":"2267","orderContent":"全人工心脏移植术","orderFlag":1}
    ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalOperationInfo']['stopTabooList']]
    Should Contain    ${aj}    肾衰竭者


异常指标推荐
    [Documentation]    断言:尿红细胞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}
    ...    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['testItemName'] for aj in $getRes['body']['abnormalIndexList']]
    Should Contain    ${aj}    尿红细胞



