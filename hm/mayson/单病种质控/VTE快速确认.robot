*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
快速确认
    [Documentation]    cdss/sentry/assess/save
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND  智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${getRes}    VTE2快速确认    aiResult={"assessId":439,"assessName":"内科住院患者静脉血栓栓塞症风险评估表(Padua评分表)","assessResult":"低危","assessResultItemList":[{"itemId":1,"itemName":"年龄≥70岁","score":"1","source":[],"wordId":132001}],"assessValue":"1","assessValueUnit":"分"}
    ...    assessId=439    assessItem=内科住院患者静脉血栓栓塞症风险评估表(Padua评分表)
    ...    assessPostil=患者入院24小时内应进行VTE初始风险评估
    ...    assessResultItemList={"aiChecked":1,"itemId":1,"itemName":"年龄≥70岁","score":"1","source":[],"wordId":132001}
    ...    compare=1    expressId=7903    fileName=Padua.html    ignore=0    productId=1024    projectId=1001
    ...    qcDiseaseDiagnosisList={"diseaseId":1001}    doctorGuid=1    pageSource=2    recordId=${recordId}    assessResultType=1
    Should Contain    ${getRes['body']}    保存评估历史成功!

暂不采用
    [Documentation]    cdss/sentry/assess/save
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND  智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${getRes}    VTE2快速确认    aiResult={"assessId":439,"assessName":"内科住院患者静脉血栓栓塞症风险评估表(Padua评分表)","assessResult":"低危","assessResultItemList":[{"itemId":1,"itemName":"年龄≥70岁","score":"1","source":[],"wordId":132001}],"assessValue":"1","assessValueUnit":"分"}
    ...    assessId=439    assessItem=内科住院患者静脉血栓栓塞症风险评估表(Padua评分表)
    ...    assessPostil=患者入院24小时内应进行VTE初始风险评估
    ...    assessResultItemList={"aiChecked":1,"itemId":1,"itemName":"年龄≥70岁","score":"1","source":[],"wordId":132001}
    ...    compare=1    expressId=7903    fileName=Padua.html    ignore=0    productId=1024    projectId=1001
    ...    qcDiseaseDiagnosisList={"diseaseId":1001}    doctorGuid=1    pageSource=2    recordId=${recordId}    assessResultType=2
    Should Contain    ${getRes['body']}    保存评估历史成功!



