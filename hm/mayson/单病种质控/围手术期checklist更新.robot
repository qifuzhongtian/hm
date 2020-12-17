*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
围手术期checklist更新
    [Documentation]    cdss/sentry/v_2_0/cl/update
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_围手术期    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=5    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"主诉"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"初步诊断"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    ...    medicalOrders={"orderType": "6","orderId": "1562668327867","uuid": "1294-20778","frequency": "","orderContent": "主动脉-冠状动脉搭桥术","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime":"2020-12-17 20:45:34","executeTime":"2020-12-17 20:45:34","stopTime":"2020-12-17 20:45:34","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "","orderCode": "2136"}
    ...    AND   围手术期checklist    operationId=${operationId}    recordId=${recordId}
    ${getRes}    围手术期checklist更新    recordId=${recordId}
    ...    checkListItem={"accessId":717,"checkItemName":"手术风险评估","checkListItemId":1014,"checkSource":0,"checkType":1,"checkTypeName":"术前评估","checkedStatus":1,"clOperationId":21,"completeNum":3,"customerId":1001,"id":${id},"ignoreStatus":0,"operationId":319484,"operationName":"CABG手术","recordId":${recordId},"remark":"需行CABG的患者，术前应完善术前病情评估及手术复杂程度分级评估","ruleId":8,"sortNum":8,"totalNum":3}
    Should Be Equal As Strings    ${getRes['head']['message']}    更新成功！



