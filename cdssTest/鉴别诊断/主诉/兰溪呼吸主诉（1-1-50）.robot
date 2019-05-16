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
2-因“:反复咳嗽胸闷40余年，加重伴发热5天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽胸闷40余年，加重伴发热5天。
    ${assert}    Create List    胸膜炎    支气管肺炎    结核病    急性支气管炎    慢性阻塞性肺病
    ...    支气管哮喘    肺炎支原体性肺炎    慢性阻塞性肺病伴急性加重    慢性支气管炎    冠状动脉粥样硬化性心脏病    心力衰竭
    ...    不稳定型心绞痛    川崎病    结节病    支气管或肺恶性肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

3-因“:反复咳嗽咳痰、气闭1年余，加重1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭1年余，加重1周。
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

4-因“:摔伤致头晕伴纳差11天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:摔伤致头晕伴纳差11天
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

5-因“:右肺腺癌术后2月，入院行第1次化疗
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:右肺腺癌术后2月，入院行第1次化疗
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

6-因“:反复咳嗽咳痰伴胸闷10余年，再发3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰伴胸闷10余年，再发3天。
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺炎    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

7-因“:反复咳嗽咳痰气喘4余年，再发半月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气喘4余年，再发半月
    ${assert}    Create List    慢性支气管炎    慢性细支气管炎    支气管肺炎    毛细支气管炎    急性喉气管炎
    ...    慢性阻塞性肺病    慢性阻塞性肺病伴急性加重    肺炎    新生儿呼吸窘迫综合征    肺脓肿    心力衰竭
    ...    二尖瓣狭窄    支气管哮喘    喘息性支气管肺炎    肺部感染    肺曲霉病    支气管扩张
    ...    慢性充血性心力衰竭    气管内异物    房间隔缺损    间质性肺病    心功能不全    左心室衰竭
    ...    肺动脉高压
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

8-因“:反复咳嗽气急40余年，再发2周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽气急40余年，再发2周
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病    慢性阻塞性肺病伴急性加重    支气管肺炎    慢性细支气管炎
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

9-因“:反复咳嗽咳痰伴胸闷10余年，再发10天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰伴胸闷10余年，再发10天
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺炎    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

10-因“:反复咳嗽咳痰气闭10余年，再发加剧20天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发加剧20天。
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

11-因“:脑出血术后1月余，咳嗽气急1月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:脑出血术后1月余，咳嗽气急1月
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

12-因“:反复咳嗽气急5年，加重半天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽气急5年，加重半天
    ${assert}    Create List    毛细支气管炎    急性喉气管炎    新生儿呼吸窘迫综合征    支气管肺炎    慢性阻塞性肺病
    ...    慢性支气管炎    气管内异物    慢性细支气管炎    肺炎    二尖瓣狭窄    心力衰竭
    ...    支气管哮喘    喘息性支气管肺炎    慢性充血性心力衰竭    肺炎支原体性肺炎    房间隔缺损    间质性肺病
    ...    心功能不全    慢性阻塞性肺病伴急性加重    肺动脉高压
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

13-因“:反复咳嗽咳痰伴胸闷20余年，再发半月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰伴胸闷20余年，再发半月余。
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺炎    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

14-因“:反复咳嗽咳痰气闭20余年，加重1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭20余年，加重1周
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

15-因“:胸闷气闭3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:胸闷气闭3天。
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

16-因“:咳嗽5天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽5天
    ${assert}    Create List    急性上呼吸道感染    急性下呼吸道感染    毛细支气管炎    急性气管支气管炎    支气管肺炎
    ...    咳嗽变异性哮喘    疱疹性咽峡炎    咽结膜热    急性喉炎    急性化脓性扁桃体炎    大叶性肺炎
    ...    鼻窦炎    气管内异物    嗜酸细胞性肺炎    胃食管反流病    心因性咳嗽    肺结核
    ...    鼻后滴漏综合征    肺异物    耳内异物    免疫缺陷    间质性肺病    先天性气管食管瘘
    ...    百日咳
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

17-因“:反复咳嗽咳痰、气闭1年余，加重10余天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭1年余，加重10余天。
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

18-因“:反复咳嗽3月，加重半月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽3月，加重半月。
    ${assert}    Create List    慢性支气管炎    支气管肺炎    肺炎支原体性肺炎    慢性细支气管炎    气管内异物
    ...    二尖瓣狭窄    结核病    急性喉炎    急性细支气管炎    慢性阻塞性肺病伴急性加重    胸膜炎
    ...    支气管哮喘
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

19-因“:反复咳嗽咳痰气闭10余年，再发加重10余天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发加重10余天。
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

20-因“:发现左肺癌10月余，左腋下胀痛1月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:发现左肺癌10月余，左腋下胀痛1月。
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

21-因“:反复咳、痰、喘10余年，再发加重1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳、痰、喘10余年，再发加重1周。
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    肺脓肿    肺部感染    肺炎
    ...    急性细支气管炎    肺曲霉病    肺炎克雷伯杆菌感染    气管内异物    支气管扩张    支气管或肺恶性肿瘤
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

22-因“:反复咳嗽咳痰气闭10余年，伴加重1月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，伴加重1月。
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

23-因“:反复咳嗽咳痰气闭20余年，再发1小时
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭20余年，再发1小时
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

24-因“:反复咳嗽胸闷30余年，再发伴恶心10天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽胸闷30余年，再发伴恶心10天。
    ${assert}    Create List    支气管哮喘    冠状动脉粥样硬化性心脏病    慢性支气管炎    慢性阻塞性肺病    心力衰竭
    ...    胸膜炎    支气管肺炎    支气管或肺恶性肿瘤    不稳定型心绞痛    慢性阻塞性肺病伴急性加重    胆管结石
    ...    慢性细支气管炎
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

25-因“:反复咳嗽咳痰、气闭10余年，再发伴半小时
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭10余年，再发伴半小时
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

26-因“:反复咳嗽咳痰气闭10余年，加重2小时。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，加重2小时。
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

27-因“:反复咳嗽咳痰、气闭10余年，加重1小时
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰、气闭10余年，加重1小时
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

28-因“:反复咳嗽咳痰气闭30余年，加重20余天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭30余年，加重20余天。
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

29-因“:反复咳嗽咳痰气闭30余年，加重1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭30余年，加重1周
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

30-因“:反复咳嗽咳痰气闭30余年，再发1月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭30余年，再发1月
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

31-因“:咳嗽2周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽2周。
    ${assert}    Create List    急性上呼吸道感染    急性下呼吸道感染    毛细支气管炎    急性气管支气管炎    支气管肺炎
    ...    咳嗽变异性哮喘    疱疹性咽峡炎    咽结膜热    急性喉炎    急性化脓性扁桃体炎    大叶性肺炎
    ...    鼻窦炎    气管内异物    嗜酸细胞性肺炎    胃食管反流病    心因性咳嗽    肺结核
    ...    鼻后滴漏综合征    肺异物    耳内异物    免疫缺陷    间质性肺病    先天性气管食管瘘
    ...    百日咳
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

32-因“:反复咳嗽咳痰气闭10余年，再发伴加重3天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发伴加重3天。
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

33-因“:反复咳嗽咳痰10余年，胸闷4年，再发2周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰10余年，胸闷4年，再发2周
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病    慢性阻塞性肺病伴急性加重    慢性细支气管炎    支气管肺炎
    ...    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

34-因“:反复咳嗽咳痰气闭5年余，加重半天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭5年余，加重半天
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

35-因“:反复咳嗽咳痰气闭4年余，再发加剧1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭4年余，再发加剧1周。
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

36-因“:反复咳嗽咳痰气闭7年，再发10余天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭7年，再发10余天。
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

37-因“:反复咳嗽咳痰气闭10余年，再发1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发1周。
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

38-因“:反复咳嗽咳痰气急10余年，再发1月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气急10余年，再发1月
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

39-因“:反复咳嗽咳痰气闭6年余，再发4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭6年余，再发4天。
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

40-因“:反复咳嗽咳痰气闭10余年，再发半月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭10余年，再发半月。
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

41-因“:反复咳嗽咳痰气闭1年余，再发2天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气闭1年余，再发2天
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

42-因“:反复咳嗽咳痰伴胸闷5年，再发1月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰伴胸闷5年，再发1月
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺炎    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

43-因“:咳嗽、咳痰1月余。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽、咳痰1月余。
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

44-因“:反复咳嗽咳痰气闭40余年，再发1周。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽、咳痰1月余。
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

45-因“:反复咳嗽咳痰伴胸闷5年，再发2月。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰伴胸闷5年，再发2月。
    ${assert}    Create List    慢性支气管炎    慢性阻塞性肺病伴急性加重    慢性细支气管炎    慢性阻塞性肺病    支气管肺炎
    ...    肺炎    支气管哮喘    支气管扩张    支气管或肺恶性肿瘤    肺脓肿
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

46-因“:行走欠稳4天。
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:行走欠稳4天。
    ${assert}    Create List    脑梗死    急性酒精中毒    小脑梗死    脑动脉供血不足    血管性帕金森综合征
    ...    周围神经病    特发性正常压力性脑积水
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

47-因“:四肢震颤、活动障碍10余年，咳嗽气闭4小时
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:四肢震颤、活动障碍10余年，咳嗽气闭4小时
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

48-因“:反复胸闷气闭1年余，再发1月
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复胸闷气闭1年余，再发1月
    ${assert}    Create List    心力衰竭    心律失常    冠状动脉粥样硬化性心脏病    急性喉气管炎    肺炎
    ...    心动过缓    肺动脉高压    二尖瓣狭窄    心功能不全    新生儿呼吸窘迫综合征    支气管哮喘
    ...    毛细支气管炎    喘息性支气管肺炎    肥厚型心肌病    呼吸衰竭    慢性阻塞性肺病    新生儿低氧血症
    ...    慢性充血性心力衰竭    慢性肺源性心脏病    气管内异物    左心室衰竭    慢性阻塞性肺病伴急性加重    胸膜炎
    ...    房间隔缺损    肺栓塞    慢性细支气管炎    心肌病
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

49-因“:咳嗽、咳痰伴发热3天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:咳嗽、咳痰伴发热3天
    ${assert}    Create List    急性支气管炎    支气管肺炎    慢性阻塞性肺病伴急性加重    肺部感染    肺炎
    ...    急性细支气管炎    结核病    大叶性肺炎    支气管扩张
    ${getRes}    智能推荐_鉴别诊断    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    log    ${aj}
    List Should Contain Sub List    ${aj}    ${assert}

50-因“:反复咳嗽咳痰气急2年余，加重1周
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Subjective}    Set Variable    因“:反复咳嗽咳痰气急2年余，加重1周
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
