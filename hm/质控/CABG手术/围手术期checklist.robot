*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
CABG围手术期checklist
    [Documentation]    /cdss/sentry/v_2_0/cl/get_check_list
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_围手术期    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=5    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    doctorName=测试医生    admissionTime=${time_now}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"主诉"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"初步诊断"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    ...    medicalOrders={"orderType": "6","orderId": "1562668327867","uuid": "1294-20778","frequency": "","orderContent": "主动脉-冠状动脉搭桥术","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime":"${time_now}","executeTime":"${time_now}","stopTime":"${time_now}","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "","orderCode": "2136"}
    ${getRes}    围手术期checklist    operationId=${operationId}    recordId=${recordId}
    # ${aj}    Evaluate    [aj['checkTypeName'] for aj in $getRes['body']['checkListResp'][0]['checkListItem'][0]]
    # Should Contain    ${aj}    术前评估1
    Should Be Equal As Strings    ${getRes['head']['error']}    0
