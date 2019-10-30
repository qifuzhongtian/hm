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
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=${1}    requestSource=
    ...    doctorGuid=1001    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"主诉"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"初步诊断"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    ...    medicalOrders={"orderType": "6","orderId": "1562668327867","uuid": "1219-20778","frequency": "","orderContent": "主动脉-冠状动脉搭桥术","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime":"2019-07-11 20:45:34","executeTime":"2019-07-11 20:45:34","stopTime":"2019-07-11 20:45:34","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "","orderCode": "2136"}
    ...    AND    病历质控初始化数据    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=1001    pageSource=${1}
    ${getRes}    病案首页_病历质控    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=1001    pageSource=${1}
    ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['completeList']]
    Should Contain    ${aj}    病案首页-籍贯未填写





病历质控_完整性:入院记录-既往史未填写
    [Documentation]    断言:心律失常
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
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
    ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['medicalRecordResult']['completeList']]
    #一致性
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['agreementList']]
    #####
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['completeList']]
    #####
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['reasonableList']]
    #####及时性
    # ${aj}    Evaluate    [aj['remark'] for aj in $getRes['body']['mediaclRecordResult']['timelyList']]
    Should Contain    ${aj}    入院记录-初步诊断、确定诊断未填写或初步诊断、确定诊断书写有缺陷
