*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
# 手术合理性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    doctorGuid=0210497
#     ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    pageSource=2    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"发热"},{"key":"现病史","value":"妊娠"},{"key":"既往史","value":""},{"key":"初步诊断","value":"冠状动脉粥样硬化性心脏病。不稳定性心绞痛。颈椎病术后。高血压"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
#     ...    operationRecord={"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""}    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}

#     ${examId}    Create List    902    905
#     ${getRes}    手术合理性    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    department=儿科    doctorGuid=1    examId=${examId}    examType=2    customEnv=1
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     Should Contain    ${aj}    荨麻疹





