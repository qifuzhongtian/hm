*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
血脂异常,推出:完整项质控项 血脂异常诊断
    [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"主诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"10","doctorGid":"","recordTime":""}
    ...    labTestList={"labTestNumber":2226424,"labTestName":"3C-甘油三酯呼吸试验","labTestSample":"血清","sampleCollectTime":"2020-03-1018:38:37","recordTime":"2020-03-1018:37:37","labTestItems":[{"labTestItemName":"甘油三酯","labTestResult":"1.7","labTestValueUnit":"mmol/L","labTestValueChange":"","labTestMethod":"","normalRange":""},{"labTestItemName":"红细胞","labTestResult":"28","labTestValueUnit":"/HPF","labTestValueChange":"","labTestMethod":"","normalRange":"0-6"},{"labTestItemName":"尿妊娠试验","labTestResult":"阳性","labTestValueUnit":"","labTestValueChange":"","labTestMethod":"","normalRange":""}]}
    ...    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
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
    ${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    Should Contain    ${aj}    血脂异常诊断
