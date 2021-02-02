# *** Settings ***
# Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
# Resource          ../cdss.robot
# Library           Collections
# Library           RequestsLibrary
# Library           String
# Library           DateTime

# *** Variables ***

# *** Test Cases ***
# 单病种质控:急性心肌梗死,出院记录:推出治疗方案:出院抗血小板治疗
#     [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${Assessment}    Set Variable    急性心肌梗死
#     ${Subjective}    Set Variable
#     ${headers}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${mayson_url}    ${headers}

#     ${patientInfo}    Evaluate    {"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ${physicalSign}    Evaluate    {"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${definiteDiagnosis}    Evaluate    []
#     ${progressNoteList}    Evaluate    [{"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}]
#     ${labTestList}    Evaluate    []
#     ${examinationList}    Evaluate    []
#     ${newTestList}    Evaluate    []
#     ${operationRecord}    Evaluate    ()
#     ${prescriptions}    Evaluate    ()
#     ${medicalOrders}    Evaluate    []

#     ${data}    Create Dictionary    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo=${patientInfo}    physicalSign=${physicalSign}
#     ...    openInterdict=${1}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
#     ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=    medicalOrders=${medicalOrders}
#     log    ${data}
#     ${resp}     Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data}
#     ${getRes}    To Json    ${resp.content}
#     log    ${getRes}
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
#     Should Contain    ${aj}    出院抗血小板治疗




# VTE1:快速确认Caprini低危，推出外科出血风险 规则ID：HMvte5-2-RS
#     [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${headers}    Create Dictionary    Content-Type=application/json;charset=UTF-8    Huimei_id=${Huimei_id}
#     Create Session    api    ${mayson_url}    ${headers}

#     ${patientInfo}    Evaluate    {"gender":"0","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ${physicalSign}    Evaluate    {"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${definiteDiagnosis}    Evaluate    []
#     ${progressNoteList}    Evaluate    [{"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脓毒症，急性心肌梗死，活动性恶性肿瘤"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}]
#     ${labTestList}    Evaluate    []
#     ${examinationList}    Evaluate    []
#     ${newTestList}    Evaluate    []
#     ${operationRecord}    Evaluate    ()
#     ${prescriptions}    Evaluate    ()
#     ${medicalOrders}    Evaluate    []

#     #访问智能推荐接口获取 recordId    userGuid    serialNumber
#     ${data1}=    Create Dictionary    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2020-12-12    inpatientDepartment=呼吸科    patientInfo=${patientInfo}    physicalSign=${physicalSign}
#     ...    openInterdict=${1}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
#     ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=    medicalOrders=${medicalOrders}
#     log    ${data1}
#     ${res1}=    Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data1}
#     ${getRes1}    To Json    ${res1.content}
#     log    ${getRes1}

#     Set Global variable    ${recordId}    ${getRes1["body"]["recordId"]}
#     Set Global variable    ${userGuid}    ${getRes1["body"]["patientInfo"]["userGuid"]}
#     Set Global variable    ${serialNumber}    ${getRes1["body"]["patientInfo"]["serialNumber"]}

#     #通过recordId保存Caprini评估表
#     ${data2}=    Create Dictionary    assessDictName=Caprini评分    assessId=440    assessName=外科VTE风险评估(Caprini评分表)    assessResult=低危    assessValue=0    assessValueUnit=分    displayResult=低危    expressId=20487
#     ...    productId=${1024}    projectId=${1219}    assessResultItemList=    doctorGuid=1    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=2    recordId=${recordId}    assessResultType=${1}    ruleNumber=HMvte1    isConfirmNurse=0
#     ${res2}=    Post Request    api    sentry/assess/save    data=${data2}
#     ${getRes2}=    To Json    ${res2.content}
#     log    ${getRes2}


#     ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=tester    pageSource=2
#     ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2020-12-12    inpatientDepartment=呼吸科    patientInfo=${patientInfo}    physicalSign=${physicalSign}
#     ...    openInterdict=${1}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
#     ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=    medicalOrders=${medicalOrders}
#     log    ${data}
#     ${res}    Post Request    api    mayson/v_2_0/smart_recommend    data=${data}
#     ${getRes}    To Json    ${res.content}
#     log    ${getRes}

#     #得到返回值的list
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
#     Should Contain    ${aj}    外科出血风险评估
