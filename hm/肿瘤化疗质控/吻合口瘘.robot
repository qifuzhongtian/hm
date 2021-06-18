*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

吻合口瘘-推出评估表直肠癌前切除术后吻合口瘘
    [Setup]    Run Keywords    获取随机数
    ...    AND    获取时间戳
    ...    AND    时间
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=胃肠外科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"文档标题","value":""},{"key":"手术日期","value":""},{"key":"手术开始时间","value":""},{"key":"手术截止时间","value":""},{"key":"麻醉开始时间","value":""},{"key":"麻醉结束时间","value":""},{"key":"术前诊断","value":"直肠恶性肿瘤"},{"key":"术后诊断","value":""},{"key":"拟施手术名称","value":""},{"key":"手术名称","value":"直肠前切除术"},{"key":"手术医生姓名","value":""},{"key":"手术医师代码","value":""},{"key":"麻醉方式","value":""},{"key":"麻醉医生姓名","value":""},{"key":"麻醉医师代码","value":""},{"key":"手术经过","value":""},{"key":"术中出现的情况及处理","value":""},{"key":"术中出血","value":""},{"key":"术中输血","value":""},{"key":"医师签名","value":""},{"key":"录入时间","value":""}],"progressType":"13","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8288","orderContent": "顺铂氯化钠注射液","createTime":"${medicalOrders_create}","stopTime":"","dosage": "","unit": "","frequency": "","pathway": "","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 1}
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['tumorQcResponse']['tumorPerioperative']['tpList'][0]['tumorIllnessAssessList']]
    Should Contain    ${aj}    直肠癌前切除术后发生吻合口瘘预测模型-术中使用