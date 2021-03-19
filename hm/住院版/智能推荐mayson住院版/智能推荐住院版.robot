*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***

推荐疑似诊断:晕厥
    [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation,断言:晕厥
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    晕厥


推荐疑似诊断:哮喘性支气管炎
    [Documentation]    断言:哮喘性支气管炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发作性喘息、气促1小时
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    哮喘性支气管炎



推荐检查:静息12导联心电图
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    静息12导联心电图
    ${Assessment}    Set Variable    先天性QT间期延长
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    List Should Contain Sub List    ${aj}    ${assert}

推荐评估表：引起QT间期延长的常见药物
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    #${assert}    Create List    静息12导联心电图    甲状腺功能    血电解质
    ${Assessment}    Set Variable    先天性QT间期延长
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}    引起QT间期延长的常见药物



推荐检查解读：心房颤动
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    心律不齐，S1强弱不等，脉搏短绌
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"辅助检查","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"体格检查","value":""}],"progressType":${2},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList={"examinationName":"","examinationNumber":"1","examinationDesc":"P波消失","examinationResult":"","examinationItem":[{"examinationItemCode":"123","examinationItemName":"2","examinationItemResult":"2"}]}    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    心房颤动

出院指导
    [Documentation]    断言:"高血压"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis={"name":"糖尿病","diseaseType":9},{"name":"高血压","diseaseType":9},{"name":"肺炎","diseaseType":9}
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['dischargeInstruction']]
    Should Contain    ${aj}    高血压    # Lists should Be Equal    ${aj}    ${assert}    # List should contain sub list





护理记录,推荐处置:保暖
    [Documentation]    断言:"患者健康问卷(PHQ-9)抑郁自评量表"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    焦虑
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=${6}    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "35","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"生命体征","value":"体温:35℃"}],"progressType":"2002","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","laxbTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['dispositionName'] for aj in $getRes['body']['dispositions']]
    Should Contain    ${aj}    保暖


护理记录,推荐评估表:患者健康问卷(PHQ-9)抑郁自评量表
    [Documentation]    断言:"患者健康问卷(PHQ-9)抑郁自评量表"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    焦虑
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=${6}    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "35","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['nursingIllnessAssessList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    患者健康问卷(PHQ-9)抑郁自评量表
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}

手术并发症
    [Documentation]    断言:"皮瓣坏死"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    切口边缘坏死
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable    糖尿病，高血压，肺炎
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['operationRecommendList'][0]['complications']]
    Should Contain    ${aj}    皮瓣坏死

# 手术禁忌
#     [Documentation]    断言:"妊娠期女性"
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     # ${assert}    Create List
#     #诊断
#     ${Assessment}    Set Variable
#     #主诉
#     ${Subjective}    Set Variable
#     #现病史
#     ${Subjective2}    Set Variable    妊娠
#     #既往史
#     ${Subjective3}    Set Variable
#     #出院诊断
#     ${dischargeInstruction}    Set Variable
#     ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
#     ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    openInterdict=${1}    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
# ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList={"testType": 2,"testId": "905","testName": "食道钡餐透视"}    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['dischargeInstruction']]
#     # ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['operationRecommendList'][0]['complications']]
#     ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['stopExamList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    妊娠期女性
#     # Should Be Equal As Strings    ${getRes['body']['logicalOperationInfo']['dangerOperationList'][0]['operation']['orgOperationName']}    1
#     # Lists should Be Equal    ${aj}    ${assert}
#     # List should contain sub list    ${aj}    ${assert}

诊断鉴别:心律失常的鉴别依据,推出:晕厥
    [Documentation]    断言:晕厥
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄60岁，晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒偶发室性期前收缩
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=血管迷走神经性晕厥    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj for aj in $getRes['body']['symptomTypes']]
    Should Contain    ${aj}    晕厥
    ######







# 参考来源:质控出血危险分层
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肺栓塞
#     ${Subjective}    Set Variable
#     ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}
#     ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=
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
#     ${aj}    Evaluate    [aj['sourceDetail'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList'][2]['ruleSources']]
#     Should Contain    ${aj}    深静脉血栓形成的诊断和治疗指南(第三版)（2017）
#     # log    $getRes['body']['qualityControlResponse']['illnessAssessList']
#     # Should Contain    $getRes['body']['qualityControlResponse']['illnessAssessList'][0]['ruleSources']    ruleSources


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
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}
    ...    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['testItemName'] for aj in $getRes['body']['abnormalIndexList']]
    Should Contain    ${aj}    尿红细胞

推荐文献速递:新生儿脑梗死39例病例分析
    [Documentation]    断言:新生儿脑梗死39例病例分析
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"${time_now}","recordTime":"${time_now}","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    Should not Contain    $getRes['body']['documentExpress']['docExpress']    cnTitle
