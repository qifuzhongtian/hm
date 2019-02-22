*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***



#########
推荐疑似诊断:心律失常
    [Documentation]    断言:心律失常
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    心律失常

推荐检查:静息12导联心电图
    [Documentation]
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    静息12导联心电图
    ${Assessment}    Set Variable    QT间期延长
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩,先天性QT间期延长
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    List Should Contain Sub List    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    心率失常

推荐评估表：引起QT间期延长的常见药物
    [Documentation]
    # ${timestamp}    Get Time    epoch
    #${assert}    Create List    静息12导联心电图    甲状腺功能    血电解质
    ${Assessment}    Set Variable    QT间期延长
    ${Subjective}    Set Variable    男，年龄60岁，反复发作晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}    引起QT间期延长的常见药物
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    心率失常

推荐治疗:药接种疫苗,维持治疗
    [Documentation]
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    接种疫苗    维持治疗
    ${Assessment}    Set Variable    支气管哮喘
    ${Subjective}    Set Variable    双肺哮鸣音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Should Contain    ${aj}    引起QT间期延长的常见药物
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    List Should Contain Sub List    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    心率失常


推荐检查解读：败血症
    [Documentation]
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    急性发热，皮疹，肝脾肿大，尿路感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    败血症
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    急性上呼吸道感染



质控
    [Documentation]    断言:"NIHSS卒中量表"
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    急性脑梗死
    ${Subjective}    Set Variable
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    NIHSS卒中量表





出院指导
    [Documentation]    断言:"高血压"
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    妊娠,晚期恶性肿瘤 以“脑出血，急性胸痛,长期卧床，一侧肢体麻木”为主诉入院。 1年前无明显诱因出现右耳听力下降，伴间歇性耳鸣。体格检查：T：36.2℃，P：78次/分，R：16次/分，BP：133/74mmHg。一般状态可，心肺听诊无异常，肝脾肋下未触及，四肢活动自如。专科查体：右侧颞下颌关节肿胀，触之疼痛。右耳鼓室内似有积液。
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable    糖尿病，高血压，肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['dischargeInstruction']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    高血压
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}



护理记录,推荐处置:保暖
    [Documentation]    断言:"保暖"
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    妊娠,晚期恶性肿瘤 以“脑出血，急性胸痛,长期卧床，一侧肢体麻木”为主诉入院。 1年前无明显诱因出现右耳听力下降，伴间歇性耳鸣。体格检查：T：36.2℃，P：78次/分，R：16次/分，BP：133/74mmHg。一般状态可，心肺听诊无异常，肝脾肋下未触及，四肢活动自如。专科查体：右侧颞下颌关节肿胀，触之疼痛。右耳鼓室内似有积液
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable    糖尿病，高血压，肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=${6}
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "35","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    ${aj}    Evaluate    [aj['dispositionName'] for aj in $getRes['body']['dispositions']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    保暖
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}



护理记录,推荐评估表:患者健康问卷(PHQ-9)抑郁自评量表
    [Documentation]    断言:"患者健康问卷(PHQ-9)抑郁自评量表"
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    焦虑
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=${6}
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "35","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['nursingIllnessAssessList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    患者健康问卷(PHQ-9)抑郁自评量表
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}





手术并发症
    [Documentation]    断言:"皮瓣坏死"
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    妊娠,晚期恶性肿瘤 以“脑出血，急性胸痛,长期卧床，一侧肢体麻木”为主诉入院。 1年前无明显诱因出现右耳听力下降，伴间歇性耳鸣。体格检查：T：36.2℃，P：78次/分，R：16次/分，BP：133/74mmHg。一般状态可，心肺听诊无异常，肝脾肋下未触及，四肢活动自如。专科查体：右侧颞下颌关节肿胀，触之疼痛。右耳鼓室内似有积液。切口边缘坏死
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable    糖尿病，高血压，肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['dischargeInstruction']]
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['operationRecommendList'][0]['complications']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    皮瓣坏死
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}


手术禁忌
    [Documentation]    断言:"妊娠期女性"
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    妊娠,晚期恶性肿瘤 以“脑出血，急性胸痛,长期卧床，一侧肢体麻木”为主诉入院。 1年前无明显诱因出现右耳听力下降，伴间歇性耳鸣。体格检查：T：36.2℃，P：78次/分，R：16次/分，BP：133/74mmHg。一般状态可，心肺听诊无异常，肝脾肋下未触及，四肢活动自如。专科查体：右侧颞下颌关节肿胀，触之疼痛。右耳鼓室内似有积液。切口边缘坏死
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable    糖尿病，高血压，肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['dischargeInstruction']]
    # ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['operationRecommendList'][0]['complications']]
    ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalOperationInfo']['dangerOperationList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    妊娠期女性
    # Should Be Equal As Strings    ${getRes['body']['logicalOperationInfo']['dangerOperationList'][0]['operation']['orgOperationName']}    1
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}




合理性检验
    [Documentation]    胸部透视对妊娠期女性禁忌,断言:"妊娠期女性"
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    #诊断
    ${Assessment}    Set Variable
    #主诉
    ${Subjective}    Set Variable    消化道穿孔
    #现病史
    ${Subjective2}    Set Variable
    #既往史
    ${Subjective3}    Set Variable
    #出院诊断
    ${dischargeInstruction}    Set Variable
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${Subjective2}"},{"key":"既往史","value":"${Subjective3}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${dischargeInstruction}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList={"testType": 2,"testId": "905","testName": "食道钡餐透视"}
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['dischargeInstruction']]
    # ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['operationRecommendList'][0]['complications']]
    # ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalOperationInfo']['dangerOperationList']]
    ${aj}    Evaluate    [aj['crowd'] for aj in $getRes['body']['logicalExamInfo']['stopExamList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    消化道穿孔患者
    # Should Be Equal As Strings    ${getRes['body']['logicalOperationInfo']['dangerOperationList'][0]['operation']['orgOperationName']}    1
    # Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}



诊断鉴别:心律失常的鉴别依据,推出:晕厥
    [Documentation]    断言:晕厥
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄60岁，晕厥4年，心电图显示窦性心律，心率100次／分，QT 间期0.56秒，偶发室性期前收缩
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=心律失常
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj for aj in $getRes['body']['symptomTypes']]
    Should Contain    ${aj[:5]}    晕厥












#######




质控:急性脑梗死,推出质控治疗方案:强化降脂治疗
    [Documentation]
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    急性脑梗死
    ${Subjective}    Set Variable
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
    ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    强化降脂治疗


# 质控:急性脑梗死+质控消失条件:阿托伐他汀钙片,不应推出质控:强化降脂治疗
#     [Documentation]
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性脑梗死
#     ${Subjective}    Set Variable
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2
#     ...    doctorGuid=0210497    doct'1`orName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
#     ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"${timestamp}","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
#     ...    currentDiseaseName=
#     ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "8095","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     ######质控
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
#     # Should Contain    ${aj}    流行性感冒
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Not Contain    ${aj}    强化降脂治疗






########

# 质控-医嘱--强化降脂1111
#     [Documentation]
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性脑梗死
#     ${Subjective}    Set Variable
#     ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    doctorGuid=675    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
#     ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
#     ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
#     ...    medicalOrders={"orderType":6,"operationType":"","executeTime":"","orderId":"","description":"","orderCode":"","orderContent":"","orderFlag":1}
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
#     should Not Contain    ${aj}    强化降脂治疗

# 质控-医嘱--强化降脂
#     [Documentation]
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性脑梗死
#     ${Subjective}    Set Variable
#     ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester
#     ...    pageSource=2    doctorGuid=675    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
#     ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
#     ...    examinationList=    newTestList=    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
#     ...    currentDiseaseName=
#     ...    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
#     should Not Contain    ${aj}    强化降脂治疗





# 质控-医嘱--检验-呼吸道病毒筛查
#     [Documentation]
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    社区获得性肺炎
#     ${Subjective}    Set Variable    群聚性发病
#     ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    doctorGuid=675    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
#     ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
#     ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
#     ...    medicalOrders={"orderType":1,"sample":"","position":"","frequency":"","orderId":"1543391571024","description":"","orderCode":"138","orderContent":"呼吸道病原检测","orderFlag":1}
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
#     should Not Contain    ${aj}    呼吸道病毒筛查

# 质控-医嘱--检查-肺功能检查
#     [Documentation]
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    支气管哮喘
#     ${Subjective}    Set Variable
#     ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    doctorGuid=675    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
#     ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 2,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
#     ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
#     ...    medicalOrders={"orderType":2,"sample":"","position":"","frequency":"","orderId":"1543391830421","description":"","orderCode":"110247","orderContent":"肺功能检查","orderFlag":1}
#     #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
#     #should Not Contain    ${aj}    初始治疗前肺功能检查
#     should Not Contain    ${getRes['body']['qualityControlResponse']}    examinationRecommendList

# 质控-医嘱--手术-PCI手术
#     [Documentation]
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    冠状动脉粥样硬化性心脏病
#     ${Subjective}    Set Variable
#     ${getRes}    智能推荐_医生团队    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    doctorGuid=675    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科
#     ...    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "1542285932572","progressType": 3,"msgType": 2,"messageList": [{"key": "姓名","value": "lm--3.3-2"}, {"key": "科室","value": "内分泌科"}, {"key": "住院号","value": "1542285932572"}, {"key": "记录时间","value": ""}, {"key": "现病史","value": ""}, {"key": "体格检查","value": ""}, {"key": "主诊断","value": "${Assessment}"}, {"key": "其他诊断","value": ""}, {"key": "诊断依据","value": ""}, {"key": "诊疗计划","value": ""}, {"key": "检查结果","value": ""}, {"key": "检验结果","value": ""}, {"key": "评估结果","value": ""}, {"key": "诊断记录","value": ""}, {"key": "医生签名","value": ""}]}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=
#     ...    examinationList=    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=
#     ...    medicalOrders={"orderType":6,"operationType":"","executeTime":"","orderId":"1543392897489","description":"","orderCode":"2131","orderContent":"经皮冠状动脉支架置入术","orderFlag":1}
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['qualityControlResponse']['illnessAssessList']]
#     should Contain    ${aj}    SYNTAX评分
#     #should Not Contain    ${getRes['body']['qualityControlResponse']}    examinationRecommendList



##########