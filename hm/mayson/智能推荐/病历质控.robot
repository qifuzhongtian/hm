*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
# Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

病案首页质控,推出"病案首页-籍贯未填写"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    病历质控初始化数据    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=${1}    pageSource=${1}
    ${getRes}    病案首页_病历质控    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=${1}    pageSource=${1}
    ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['otherProblerms']['completeList']]
    Should Contain    ${aj}    病案首页-籍贯未填写


# 病历质控_完整性:入院记录-既往史未填写
#     [Documentation]    断言:心律失常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
#     ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
#     ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
#     ...    prescriptions={"presc]riptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #####完整性
#     ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['medicalRecordResult']['completeList']]
#     #一致性
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['agreementList']]
#     #####
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['completeList']]
#     #####
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['reasonableList']]
#     #####及时性
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['timelyList']]
#     Should Contain    ${aj}    入院记录-初步诊断、确定诊断未填写或初步诊断、确定诊断书写有缺陷


# 病历质控2.0_单项否决:未完成入院记录，单项否决
#     [Documentation]    断言:应显示 入院记录应在患者入院24小时内完成
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable
#     ${timestamp}    Get Time
#     # ${admissionTime}    Get SubString    ${timestamp}    0  10
#     ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
#     ...    doctorName=测试医生    admissionTime=${timestamp}    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"80","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
#     ...    prescriptions={"presc]riptionNumber":"","recordTime":"${timestamp}","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders=
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #####完整性
#     ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['medicalRecordResult']['vetoList']]
#     #一致性
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['agreementList']]
#     #####
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['completeList']]
#     #####
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['reasonableList']]
#     #####及时性
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['timelyList']]
#     Should Contain    ${aj}    入院记录应在患者入院24小时内完成



# 病历质控2.0_单项否决:未完成入院记录，完整性
#     [Documentation]    断言:不应显示 入院记录应在患者入院24小时内完成
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable
#     ${timestamp}    Get Time
#     # ${admissionTime}    Get SubString    ${timestamp}    0  10
#     ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
#     ...    doctorName=测试医生    admissionTime=${timestamp}    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"80","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    openInterdict=${1}    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
#     ...    prescriptions={"presc]riptionNumber":"","recordTime":"${timestamp}","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders=
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #####完整性
#     ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['medicalRecordResult']['completeList']]
#     #一致性
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['agreementList']]
#     #####
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['completeList']]
#     #####
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['reasonableList']]
#     #####及时性
#     # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['timelyList']]
#     Should not Contain    ${aj}    入院记录应在患者入院24小时内完成




病历质控v2.1_内涵质控,提示:入院记录主诉时间不完整
    [Documentation]    断言:心律失常
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"presc]riptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####完整性
    ${aj}    Evaluate    [aj['projectName'] for aj in $getRes['body']['medicalRecordResult']['completeList']]
    #一致性
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['agreementList']]
    #####
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['completeList']]
    #####
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['reasonableList']]
    #####及时性
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['timelyList']]
    Should Contain    ${aj}    入院记录主诉时间不完整


