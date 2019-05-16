*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Force Tags        skip    profileskip
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
201-因“:反复咳嗽咳痰气闭10余年，再发1月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发1月余。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

202-因“:反复咳嗽咳痰气闭70余年，加重伴嗜睡4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭70余年，加重伴嗜睡4天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    支气管哮喘    气管内异物    肺部感染
    ...    肺炎    二尖瓣狭窄    心力衰竭    喘息性支气管肺炎    呼吸衰竭    左心室衰竭
    ...    肺曲霉病    支气管扩张    慢性充血性心力衰竭    阻塞性睡眠呼吸暂停综合征    肺炎支原体性肺炎    急性呼吸衰竭
    ...    房间隔缺损    间质性肺病    心功能不全
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

203-因“:咳嗽伴痰中带血3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽伴痰中带血3天。
    ${assert}    Create List    支气管扩张    急性支气管炎    肺脓肿    支气管或肺恶性肿瘤    肺曲霉病
    ...    支气管肺炎    肺炎    肺部感染    结核病    慢性阻塞性肺病伴急性加重    大叶性肺炎
    ...    非小细胞肺癌    肺真菌感染    气管肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

204-因“:反复咳嗽、咳痰、胸闷气喘10月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽、咳痰、胸闷气喘10月余。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    毛细支气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    急性喉气管炎    心力衰竭    新生儿呼吸窘迫综合征    肺脓肿    气管内异物
    ...    冠状动脉粥样硬化性心脏病    肺炎    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎    肺部感染
    ...    肺曲霉病    支气管扩张    支气管或肺恶性肿瘤    慢性充血性心力衰竭    肺炎支原体性肺炎    胸膜炎
    ...    心律失常    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

205-因“:反复咳嗽咳痰气闭5年余，再发加重1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭5年余，再发加重1周。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

206-因“:突发胸闷气闭1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:突发胸闷气闭1天
    ${assert}    Create List    急性心肌梗死    心力衰竭    心律失常    急性心包炎    冠状动脉粥样硬化性心脏病
    ...    急性喉气管炎    肺炎    心动过缓    肺动脉高压    二尖瓣狭窄    心功能不全
    ...    新生儿呼吸窘迫综合征    支气管哮喘    毛细支气管炎    喘息性支气管肺炎    肥厚型心肌病    呼吸衰竭
    ...    新生儿低氧血症    急性呼吸衰竭    慢性充血性心力衰竭    气管内异物    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

207-因“:咳嗽咳痰、胸闷10余天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰、胸闷10余天。
    ${assert}    Create List    急性支气管炎    慢性阻塞性肺病伴急性加重    支气管肺炎    肺炎    支气管哮喘
    ...    支气管扩张    支气管或肺恶性肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

208-因“:反复咳嗽咳痰10余年，气闭1年，加重7天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，气闭1年，加重7天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

209-因“:咳嗽、咳痰2月，胸痛2天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽、咳痰2月，胸痛2天
    ${assert}    Create List    肺曲霉病    支气管肺炎    肺部感染    慢性阻塞性肺病伴急性加重    二尖瓣狭窄
    ...    肺脓肿    大叶性肺炎    纵隔肿瘤    气胸    肺炎    心绞痛
    ...    胸膜炎    急性支气管炎    冠状动脉粥样硬化性心脏病    急性细支气管炎    反流性食管炎    支气管或肺恶性肿瘤
    ...    不稳定型心绞痛    稳定型心绞痛    肺栓塞
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

210-因“:咳嗽咳痰4天，乏力2天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰4天，乏力2天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

211-因“:确诊肺恶性肿瘤半月，现为行第一次化疗
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:确诊肺恶性肿瘤半月，现为行第一次化疗
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

212-因“:发现颈部淋巴结恶性肿瘤6年余，咯血10天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发现颈部淋巴结恶性肿瘤6年余，咯血10天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

213-因“:反复咳嗽咳痰气闭20余年，再发20天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭20余年，再发20天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

214-因“:反复咳嗽咳痰气闭5年余，再发伴发热3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭5年余，再发伴发热3天
    ${assert}    Create List    支气管肺炎    肺炎    慢性支气管炎    慢性细支气管炎    慢性阻塞性肺病伴急性加重
    ...    肺部感染    急性喉气管炎    喘息性支气管肺炎    慢性阻塞性肺病    支气管扩张    毛细支气管炎
    ...    肺脓肿    急性支气管炎    肺曲霉病    结核病    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    肺炎支原体性肺炎    肺栓塞    间质性肺病
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

215-因“:反复咳嗽咳痰、气闭10余年，发热2天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭10余年，发热2天。
    ${assert}    Create List    支气管肺炎    慢性支气管炎    慢性细支气管炎    肺炎    慢性阻塞性肺病伴急性加重
    ...    肺部感染    慢性阻塞性肺病    急性喉气管炎    喘息性支气管肺炎    支气管扩张    毛细支气管炎
    ...    肺炎支原体性肺炎    肺脓肿    气管内异物    急性支气管炎    肺曲霉病    结核病
    ...    二尖瓣狭窄    心力衰竭    支气管哮喘    肺结核    肺栓塞    间质性肺病
    ...    结节病
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

216-因“:反复咳嗽咳痰气闭10余年，再发1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发1天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

217-因“:反复咳嗽咳痰20余年，再发伴发热5天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰20余年，再发伴发热5天
    ${assert}    Create List    支气管肺炎    慢性支气管炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    慢性细支气管炎    结核病    急性支气管炎    支气管扩张    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

218-因“:反复咳嗽咳痰、气闭10余天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭10余天
    ${assert}    Create List    急性支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病伴急性加重    毛细支气管炎
    ...    肺脓肿    气管内异物    肺炎    急性细支气管炎    二尖瓣狭窄    心力衰竭
    ...    支气管哮喘    严重急性呼吸道综合征    喘息性支气管肺炎    肺部感染    急性喉炎    肺曲霉病
    ...    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

219-因“:关节疼痛4月余，咯血2天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:关节疼痛4月余，咯血2天
    ${assert}    Create List    关节炎    老年性关节炎    痛风    系统性红斑狼疮    小细胞肺癌
    ...    支气管扩张    风湿热    肺出血    肺肾综合征    肺真菌感染    滑囊炎
    ...    化脓性关节炎    弥漫性肺泡出血综合征    痛风性关节炎    幼年型关节炎    支气管或肺恶性肿瘤    感染性关节炎
    ...    类风湿性关节炎    颞下颌关节炎    肺动脉高压    皮肌炎    子宫内膜异位症    感染性心内膜炎
    ...    肺曲霉病    非小细胞肺癌
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

220-因“:反复咳嗽咳痰气急20余年，再发1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气急20余年，再发1周
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

221-因“:反复咳嗽咳痰20余年，再发4天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰20余年，再发4天
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

222-因“:反复咳嗽咳痰气闭9年余，再发20天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭9年余，再发20天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

223-因“:反复咳嗽咳痰气闭6年余，再发1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭6年余，再发1天
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

224-因“:患者反复胸闷气喘8年余，再发伴咳嗽咳痰1天。\
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:患者反复胸闷气喘8年余，再发伴咳嗽咳痰1天。
    ${assert}    Create List    支气管肺炎    毛细支气管炎    急性支气管炎    慢性阻塞性肺病伴急性加重    急性喉气管炎
    ...    心力衰竭    肺炎    新生儿呼吸窘迫综合征    肺脓肿    冠状动脉粥样硬化性心脏病    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    支气管扩张    肺曲霉病    支气管或肺恶性肿瘤
    ...    慢性阻塞性肺病    慢性充血性心力衰竭    气管内异物    急性细支气管炎    胸膜炎    心律失常
    ...    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    慢性支气管炎    慢性细支气管炎
    ...    心动过缓
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

225-因“:反复咳嗽咳痰30余年，加重1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰30余年，加重1周
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    慢性阻塞性肺病伴急性加重
    ...    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

226-因“:反复咳嗽咳痰气闭6年余，加重2周。、
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭6年余，加重2周。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

227-因“:反复咳嗽咳痰10余年，再发加重1月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，再发加重1月。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    慢性阻塞性肺病伴急性加重
    ...    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

228-因“:发热伴咳嗽、咳痰5天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发热伴咳嗽、咳痰5天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

229-因“:反复咳嗽咳痰20余年，气闭10年，加重2周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰20余年，气闭10年，加重2周
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

230-因“:反复咳嗽胸闷10余年，再发伴发热4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽胸闷10余年，再发伴发热4天。
    ${assert}    Create List    胸膜炎    支气管肺炎    结核病    急性支气管炎    支气管哮喘
    ...    慢性阻塞性肺病伴急性加重    冠状动脉粥样硬化性心脏病    慢性支气管炎    慢性阻塞性肺病    心力衰竭    川崎病
    ...    肺炎支原体性肺炎    支气管或肺恶性肿瘤    结节病
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

231-因“:反复咳嗽咳痰气闭10余年，再发1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发1周
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

232-因“:反复咳嗽、胸闷1年余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽、胸闷1年余。
    ${assert}    Create List    慢性阻塞性肺病    支气管哮喘    慢性支气管炎    冠状动脉粥样硬化性心脏病    心力衰竭
    ...    胸膜炎    不稳定型心绞痛    支气管肺炎    支气管或肺恶性肿瘤    肺炎支原体性肺炎    慢性阻塞性肺病伴急性加重
    ...    心绞痛    心律失常    慢性细支气管炎    气管内异物
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

233-因“:咳嗽咳痰1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰1周
    ${assert}    Create List    急性上呼吸道感染    急性下呼吸道感染    慢性阻塞性肺病    左心室衰竭    支气管扩张
    ...    吸入性肺炎    肺结核    肺肿瘤    间质性肺病    间质性纤维化性肺泡炎    过敏性肺炎
    ...    嗜酸细胞性肺炎    喉恶性肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

234-因“:反复意识不清1年，咳嗽3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复意识不清1年，咳嗽3天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    脑膜炎    脑栓塞    蛛网膜下出血
    ...    颅内出血    结核病    支气管哮喘    肝性脑病    急性脑血管病    流行性乙型脑炎
    ...    脑干的脑内出血    脑血栓形成    缺氧缺血性脑病    细菌性脑膜炎    心室颤动    肺炎克雷伯杆菌感染
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

235-因“:反复咳嗽咳痰气闭7年余，再发加重1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭7年余，再发加重1周。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

236-因“:反复咳嗽胸痛9月，加重5天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽胸痛9月，加重5天
    ${assert}    Create List    胸膜炎    二尖瓣狭窄    慢性支气管炎    肺曲霉病    纵隔肿瘤
    ...    胸腔积液    心绞痛    冠状动脉粥样硬化性心脏病    反流性食管炎    稳定型心绞痛    不稳定型心绞痛
    ...    支气管肺炎    肺栓塞    肺炎支原体性肺炎    肥厚型心肌病    慢性阻塞性肺病    胸主动脉瘤
    ...    非小细胞肺癌    肺真菌感染    结节病    小细胞肺癌    肋间神经痛    结核病
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

237-因“:反复咳嗽咳痰20年余，气闭8年，再发20天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰20年余，气闭8年，再发20天
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

238-因“:反复咳嗽气喘40余年，再发1月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽气喘40余年，再发1月
    ${assert}    Create List    毛细支气管炎    急性喉气管炎    支气管肺炎    新生儿呼吸窘迫综合征    慢性支气管炎
    ...    慢性细支气管炎    肺炎    心力衰竭    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎
    ...    慢性阻塞性肺病    慢性充血性心力衰竭    气管内异物    房间隔缺损    间质性肺病    心功能不全
    ...    慢性阻塞性肺病伴急性加重    肺动脉高压
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

239-因“:反复咳嗽咳痰气闭10年余，再发伴加重1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10年余，再发伴加重1周。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

240-因“:反复咳嗽咳痰2月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰2月余。
    ${assert}    Create List    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿    急性细支气管炎    慢性支气管炎
    ...    肺部感染    大叶性肺炎    肺曲霉病    支气管扩张    支气管或肺恶性肿瘤    肺炎支原体性肺炎
    ...    急性喉炎    气管内异物
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

241-因“:反复咳嗽咳痰10余年，气闭5年，加重3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，气闭5年，加重3天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

242-因“:反复咳嗽咳痰4月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰4月。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

243-因“:咳嗽咳痰4天，发热1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰4天，发热1天
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

244-因“:发热伴咳嗽咳痰10余天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发热伴咳嗽咳痰10余天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

245-因“:反复咳嗽咳痰气闭20余年，再发4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭20余年，再发4天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病
    ...    慢性阻塞性肺病伴急性加重    肺炎    毛细支气管炎    肺脓肿    心力衰竭    二尖瓣狭窄
    ...    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭
    ...    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭    肺动脉高压
    ...    新生儿呼吸窘迫综合征
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

246-因“:反复咳嗽咳痰1月余
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰1月余
    ${assert}    Create List    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿    急性细支气管炎    慢性支气管炎
    ...    肺部感染    大叶性肺炎    肺曲霉病    支气管扩张    支气管或肺恶性肿瘤    肺炎支原体性肺炎
    ...    急性喉炎    气管内异物
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

247-因“:确诊肺癌2月余，胸闷气闭1月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:确诊肺癌2月余，胸闷气闭1月。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

248-因“:四肢震颤、活动障碍10余年，咳嗽气闭2小时
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:四肢震颤、活动障碍10余年，咳嗽气闭2小时
    ${assert}    Create List    急性喉气管炎    急性支气管炎    毛细支气管炎    支气管肺炎    肺炎
    ...    心力衰竭    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎    慢性充血性心力衰竭    气管内异物
    ...    房间隔缺损    间质性肺病    心功能不全
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

249-因“:反复咳嗽咳痰气闭8年，加重2天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭8年，加重2天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

250-因“:发现左肺癌1年半余，胸闷伴头痛7天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发现左肺癌1年半余，胸闷伴头痛7天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList
