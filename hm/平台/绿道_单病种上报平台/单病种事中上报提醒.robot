*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

单病种事中上报提醒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND     时间
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    急性脑梗死
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${admissionTime}    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment} "},{"key":"出院诊断","value":"${Assessment}"},{"key":"出院情况","value":""},{"key":"手术名称","value":""}],"progressType":${1},"progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2026911,"labTestName":"尿常规","labTestSample":"尿液","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"白细胞","labTestResult":"1","labTestValueUnit":"个/hpf","labTestValueChange":"","labTestMethod":"","normalRange":"0-5"},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "","orderContent": "","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['baseGroupName'] for aj in $getRes['body']['gcResp']['baseGroupResp']]
    Should Contain    ${aj}    脑梗死(首次住院)
