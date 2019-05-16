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
151-因“:咳嗽咳痰半月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰半月
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

152-因“:反复咳嗽咳痰30余年，气闭4年，加重1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰30余年，气闭4年，加重1周
    ${assert}    Create List    急性上呼慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭吸道感染
    ...    急性下呼吸道感染    慢性阻塞性肺病    左心室衰竭    支气管扩张    吸入性肺炎    肺结核
    ...    肺肿瘤    间质性肺病    间质性纤维化性肺泡炎    过敏性肺炎    嗜酸细胞性肺炎    喉恶性肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

153-因“:反复咳嗽咳痰、气闭2周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭2周
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

154-因“:反复咳嗽、咳痰3年余，加重伴发热1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽、咳痰3年余，加重伴发热1天。
    ${assert}    Create List    慢性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    慢性细支气管炎
    ...    结核病    急性支气管炎    肺炎    慢性阻塞性肺病    支气管扩张    肺炎支原体性肺炎
    ...    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

155-因“:反复咳嗽咳痰气闭30余年，再发1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭30余年，再发1天。
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

156-因“:反复咳嗽咳痰10余天，发热1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余天，发热1周。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    急性细支气管炎
    ...    结核病    严重急性呼吸道综合征    肺炎    急性喉炎    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

157-因“:发热、咳嗽咳痰4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发热、咳嗽咳痰4天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

158-因“:反复咳嗽咳痰气闭8年，加剧1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭8年，加剧1天
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

159-因“:确诊肺癌7月余，再次化疗入院。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:确诊肺癌7月余，再次化疗入院。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

160-因“:咳嗽咳痰伴胸闷半月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰伴胸闷半月余。
    ${assert}    Create List    急性支气管炎    慢性阻塞性肺病伴急性加重    支气管肺炎    肺炎    支气管哮喘
    ...    支气管扩张    支气管或肺恶性肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

161-因“:反复咳嗽咳痰、气闭1月余
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭1月余
    ${assert}    Create List    支气管肺炎    急性喉气管炎    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿
    ...    气管内异物    肺炎    急性细支气管炎    二尖瓣狭窄    心力衰竭    支气管哮喘
    ...    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张    慢性充血性心力衰竭    肺炎支原体性肺炎
    ...    房间隔缺损    间质性肺病    心功能不全    慢性支气管炎    左心室衰竭    肺动脉高压
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

162-因“:发现肺癌23个月，入院化疗。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发现肺癌23个月，入院化疗。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

163-因“:确诊肺腺癌10月余，发热1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:确诊肺腺癌10月余，发热1天。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

164-因“:咳嗽咳痰伴发热3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰伴发热3天
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

165-因“:反复咳嗽气闭6年余，再发加剧5天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽气闭6年余，再发加剧5天。
    ${assert}    Create List    急性喉气管炎    毛细支气管炎    支气管肺炎    慢性阻塞性肺病    慢性支气管炎
    ...    气管内异物    慢性细支气管炎    肺炎    二尖瓣狭窄    心力衰竭    支气管哮喘
    ...    喘息性支气管肺炎    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

166-因“:反复咳嗽咳痰、气闭7年余，再发半月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭7年余，再发半月
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

167-因“:反复咳嗽咳痰气闭20余年，再发2天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭20余年，再发2天。
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

168-因“:反复咳嗽咳痰气闭10余年，再发3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发3天
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

169-因“:咳嗽咳痰3月，加重半月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰3月，加重半月。
    ${assert}    Create List    慢性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿    肺曲霉病
    ...    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

170-因“:咳嗽咳痰3天，加重伴发热1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽咳痰3天，加重伴发热1天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    支气管扩张    急性细支气管炎    结核病    肺曲霉病    大叶性肺炎
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

171-因“:反复胸闷气喘30年余，再发1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复胸闷气喘30年余，再发1天。
    ${assert}    Create List    新生儿呼吸窘迫综合征    冠状动脉粥样硬化性心脏病    心力衰竭    毛细支气管炎    心律失常
    ...    急性喉气管炎    肺炎    心动过缓
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

172-因“:反复咳嗽咳痰10余天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余天
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿    急性喉炎
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

173-因“:反复咳嗽气闭3年余，再发1月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽气闭3年余，再发1月。
    ${assert}    Create List    急性喉气管炎    毛细支气管炎    支气管肺炎    慢性支气管炎    慢性细支气管炎
    ...    肺炎    心力衰竭    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎    慢性阻塞性肺病
    ...    慢性充血性心力衰竭    气管内异物    房间隔缺损    间质性肺病    心功能不全
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

174-因“:突发咯血半天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:突发咯血半天。
    ${assert}    Create List    肺炎    支气管扩张    慢性支气管炎    支气管肺癌    肺结核
    ...    支气管结核    二尖瓣狭窄    慢性阻塞性肺病    肺动脉高压    肺水肿    肺栓塞
    ...    结节性多动脉炎    喉肿瘤    支气管结石    支气管腺瘤    肺真菌感染    气管肿瘤
    ...    系统性红斑狼疮    曲霉病    流行性出血热    白塞病    ANCA相关性血管炎    抗磷脂综合征
    ...    肺挫伤    气管内异物    弥散性血管内凝血    肺出血型钩端螺旋体病    先天性肺动静脉瘘    支气管动静脉瘘
    ...    肺含铁血黄素沉积症
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

175-因“:反复咳嗽咳痰气闭10年余，再发1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10年余，再发1周。
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

176-因“:确诊肺恶性肿瘤半月，突发气闭2天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:确诊肺恶性肿瘤半月，突发气闭2天
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病    急性喉气管炎
    ...    慢性阻塞性肺病伴急性加重    毛细支气管炎    肺脓肿    气管内异物    肺炎    二尖瓣狭窄
    ...    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #log    ${aj}
    #List Should Contain Sub List    ${aj}    ${assert}
    Should Not Contain    ${getRes['body']}    diseaseHospitalList

177-因“:发热伴咳嗽、咳痰3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发热伴咳嗽、咳痰3天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

178-因“:反复咳嗽咳痰1月余，发热2天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰1月余，发热2天
    ${assert}    Create List    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    急性细支气管炎    结核病
    ...    急性支气管炎    肺炎    大叶性肺炎    支气管扩张    肺炎支原体性肺炎    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

179-因“:咯血1天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咯血1天。
    ${assert}    Create List    肺炎    支气管扩张    慢性支气管炎    支气管肺癌    肺结核
    ...    支气管结核    二尖瓣狭窄    慢性阻塞性肺病    肺动脉高压    肺水肿    肺栓塞
    ...    结节性多动脉炎    喉肿瘤    支气管结石    支气管腺瘤    肺真菌感染    气管肿瘤
    ...    系统性红斑狼疮    曲霉病    流行性出血热    白塞病    ANCA相关性血管炎    抗磷脂综合征
    ...    肺挫伤    气管内异物    弥散性血管内凝血    肺出血型钩端螺旋体病    先天性肺动静脉瘘    支气管动静脉瘘
    ...    肺含铁血黄素沉积症
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

180-因“:反复咳嗽咳痰60余年，气闭10年，再发3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰60余年，气闭10年，再发3天。
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

181-因“:反复咳嗽咳痰10余年，气闭6年，再发1月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，气闭6年，再发1月。
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

182-因“:胸闷伴咳嗽咳痰1月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:胸闷伴咳嗽咳痰1月余。
    ${assert}    Create List    慢性阻塞性肺病伴急性加重    支气管肺炎    肺炎    支气管哮喘    支气管扩张
    ...    支气管或肺恶性肿瘤    肺脓肿    冠状动脉粥样硬化性心脏病    急性细支气管炎    心力衰竭    胸膜炎
    ...    肺部感染    慢性细支气管炎    大叶性肺炎    肺曲霉病
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

183-因“:咳嗽、咳痰伴气闭4天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽、咳痰伴气闭4天
    ${assert}    Create List    急性支气管炎    支气管肺炎    急性喉气管炎    慢性阻塞性肺病伴急性加重    肺炎
    ...    毛细支气管炎    肺脓肿    急性细支气管炎    心力衰竭    二尖瓣狭窄    支气管哮喘
    ...    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

184-因“:反复咳嗽咳痰气闭20余年，加重3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭20余年，加重3天。
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

185-因“:反复咳嗽咳痰气闭30余年，再发4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭30余年，再发4天。
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

186-因“:反复咳嗽咳痰10余年，再发半月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，再发半月余。
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

187-因“:反复咳嗽咳痰气闭7年，再发3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭7年，再发3天
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

188-因“:反复咳嗽咳痰气闭7年余，再发1月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭7年余，再发1月余。
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

189-因“:反复咳嗽咳痰30年，气闭5年，再发5小时
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰30年，气闭5年，再发5小时
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

190-因“:反复咳嗽气闭2年余，再发2月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽气闭2年余，再发2月。
    ${assert}    Create List    急性喉气管炎    毛细支气管炎    支气管肺炎    慢性支气管炎    慢性细支气管炎
    ...    肺炎    心力衰竭    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎    慢性阻塞性肺病
    ...    慢性充血性心力衰竭    气管内异物    房间隔缺损    间质性肺病    心功能不全
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

191-因“:反复咳嗽咳痰气闭3年余，再发10余天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭3年余，再发10余天
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

192-因“:反复咳嗽咳痰气闭40余年，再发10天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭40余年，再发10天。
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

193-因“:反复咯血8年余，再发2天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咯血8年余，再发2天。
    ${assert}    Create List    肺炎    支气管扩张    慢性支气管炎    支气管肺癌    肺结核
    ...    支气管结核    二尖瓣狭窄    慢性阻塞性肺病    肺动脉高压    肺水肿    肺栓塞
    ...    结节性多动脉炎    喉肿瘤    支气管结石    支气管腺瘤    肺真菌感染    气管肿瘤
    ...    系统性红斑狼疮    曲霉病    流行性出血热    白塞病    ANCA相关性血管炎    抗磷脂综合征
    ...    肺挫伤    气管内异物    弥散性血管内凝血    肺出血型钩端螺旋体病    先天性肺动静脉瘘    支气管动静脉瘘
    ...    肺含铁血黄素沉积症
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

194-因“:反复咳嗽咳痰伴胸闷10年，再发5天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰伴胸闷10年，再发5天
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺炎    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

195-因“:发热伴咳嗽咳痰4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发热伴咳嗽咳痰4天。
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

196-因“:反复咳嗽咳痰气急10余年，加重3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气急10余年，加重3天
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    毛细支气管炎    慢性阻塞性肺病
    ...    急性喉气管炎    慢性阻塞性肺病伴急性加重    新生儿呼吸窘迫综合征    肺脓肿    气管内异物    肺炎
    ...    二尖瓣狭窄    心力衰竭    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病
    ...    支气管扩张    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病    心功能不全
    ...    左心室衰竭
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

197-因“:反复咳嗽咳痰气闭10余年，加重1小时。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，加重1小时。
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

198-因“:反复咳嗽咳痰10余年，再发伴发热2天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，再发伴发热2天
    ${assert}    Create List    支气管肺炎    慢性支气管炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    慢性细支气管炎    结核病    急性支气管炎    支气管扩张    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

199-因“:反复气闭10余年，再发伴咳嗽4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复气闭10余年，再发伴咳嗽4天。
    ${assert}    Create List    急性喉气管炎    毛细支气管炎    支气管肺炎    肺炎    心力衰竭
    ...    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎    慢性充血性心力衰竭    气管内异物    急性支气管炎
    ...    房间隔缺损    间质性肺病    心功能不全
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

200-因“:反复咳嗽咳痰70年，气闭3年，再发3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰70年，气闭3年，再发3天
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
