*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
人工操作病历质控结果
    [Documentation]    cdss/sentry/mc/project_operate
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "1566805231782","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${getRes}    人工操作病历质控结果    recordId=${recordId}    touch=    operateItems={"projectNameId": "52","result": "1"}
    Should Be Equal As Strings    ${getRes['body']}    人工操作病历质控结果成功！


