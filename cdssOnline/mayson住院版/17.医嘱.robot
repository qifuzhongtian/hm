*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           String
Resource          ../cdss接口关键字.robot

*** Test Cases ***
质控-医嘱--强化降脂
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    急性脑梗死
    ${Subjective}    Set Variable
    ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
    ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "1543389032730","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    should Not Contain    ${aj}    强化降脂治疗

质控-医嘱--检验-呼吸道病毒筛查
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    社区获得性肺炎
    ${Subjective}    Set Variable    群聚性发病
    ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
    ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderType":1,"sample":"","position":"","frequency":"","orderId":"1543391571024","description":"","orderCode":"138","orderContent":"呼吸道病原检测","orderFlag":1}
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    should Not Contain    ${aj}    呼吸道病毒筛查

质控-医嘱--检查-肺功能检查
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    支气管哮喘
    ${Subjective}    Set Variable
    ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
    ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderType":2,"sample":"","position":"","frequency":"","orderId":"1543391830421","description":"","orderCode":"110247","orderContent":"肺功能检查","orderFlag":1}
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    #should Not Contain    ${aj}    初始治疗前肺功能检查
    should Not Contain    ${getRes['body']['qualityControlResponse']}    examinationRecommendList

质控-医嘱--手术-PCI手术
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    冠状动脉粥样硬化性心脏病
    ${Subjective}    Set Variable
    ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 3,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
    ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderType":6,"operationType":"","executeTime":"","orderId":"1543392897489","description":"","orderCode":"2131","orderContent":"经皮冠状动脉支架置入术","orderFlag":1}
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    should Contain    ${aj}    SYNTAX评分
    #should Not Contain    ${getRes['body']['qualityControlResponse']}    examinationRecommendList
