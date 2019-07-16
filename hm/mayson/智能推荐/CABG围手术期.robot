*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Force Tags        skip
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
CABG围手术期:急性心肌梗死,推出质控推荐检查,出院记录,推出治疗:术前抗凝桥接
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐_围手术期    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=5    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    # ...    medicalOrders={"orderType": 3,"orderId": "1562668327867","uuid": "1294-20778","frequency": "-","orderContent": "(小袋)0.9%氯化钠注射液 100ml/袋","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime": 1549531074000,"executeTime":"1549531074000","stopTime":"1549531074000","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "静脉泵入","orderCode": "2136"},{"orderType":3,"orderId":"1562669119074","uuid":"1294-20778","frequency":"-","orderContent":"(小袋)0.9%氯化钠注射液100ml/袋","recordId":20778,"incisionType":"","id":557765,"timelinessFlag":1,"level":"","operationType":"4","preoperativeDiagnose":"","orderCreateTime":1562860800000,"executeTime":"1549531074000","stopTime":"1549531074000","unit":"ml","dosageform":"","position":"","status":1,"dosage":"50","description":"低分子肝素钙注射液","orderClass":1,"anesthesia":"","customerId":1294,"doctorGuid":"0000012061","specification":"","sample":"","orderFlag":1,"pathway":"口服","orderCode":"561"}
    ...    medicalOrders={"orderType": "6","orderId": "1562668327867","uuid": "1294-20778","frequency": "","orderContent": "主动脉-冠状动脉搭桥术","recordId": 207781,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime":"2019-07-11 20:45:34","executeTime":"2099-07-11 20:45:34","stopTime":"2099-07-11 20:45:34","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "","orderCode": "2136"}
    #####推荐检查评估表
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    Should Contain    ${aj}    术前抗凝桥接


