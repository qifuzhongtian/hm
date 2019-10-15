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
病历质控初始化数据
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=${2}    requestSource=
    # ...    doctorGuid=1001    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    # ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    definiteDiagnosis=
    # ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"主诉"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"初步诊断"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    # ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    # ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    # ...    medicalOrders={"orderType": "6","orderId": "1562668327867","uuid": "1219-20778","frequency": "","orderContent": "主动脉-冠状动脉搭桥术","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime":"2019-07-11 20:45:34","executeTime":"2019-07-11 20:45:34","stopTime":"2019-07-11 20:45:34","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "","orderCode": "2136"}
    ${getRes}    病历质控初始化数据    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=1001    pageSource=${1}
    Should Contain    ${getRes['body']}    患者基本信息测试数据初始化成功



