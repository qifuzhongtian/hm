*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***

回归测试集-144行,推出疑似诊断top:111:直肠恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:腹痛半月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者半月余前感腹部不适，无里急后重感，无腹泻，无大小便失禁，无腹痛-便意-便后缓解症状，来本院就诊，肠镜提示结肠占位，入住本院肛肠外科，盆腔MRI增强报告2018-3-239:31:43检查结果:直肠恶性肿瘤考虑，双侧髋臼（以右侧明显）、骶骨、双侧髂骨转移性肿瘤考虑。前列腺增生首考，未见明显恶性征象。盆底少量积液。本院病理报告距肛10cm肠低分化癌，腺癌首先考虑，距肛40cm肠管状腺瘤伴低级别上皮内瘤变。予以对症处理，无明显好转，拟直肠恶性肿瘤、转移性骨肿瘤等出院，至浙江大学医学院附属第二医院住院，具体不详，于今办理出院，诊断直肠癌、前列腺癌伴多发骨转移、肝转移癌、肺转移癌考虑等，急诊查胸部(两肺、纵隔)CT平扫报告2018-4-618:04:57检查结果:右中肺结节灶，转移性病灶首考。冠脉多发钙化，主动脉壁局部钙化。;CT肺动脉造影成像（CTPA）报告2018-4-619:27:35检查结果:CTPA未见明显异常。急诊血常规+急诊CRP2018-4-617:53:26白细胞5.010^9/L;红细胞3.8410^12/L;血红蛋白125g/L;血小板10510^9/L;C反应蛋白13.68mg/L;急诊D-二聚体+急诊凝血功能2018-4-618:10:26凝血酶原时间13.3s;凝血酶原活动度78.9;凝血酶原率1.11;D-二聚体17.36mg/L;急诊BNP+急诊心肌酶谱+急诊cTnI2018-4-617:53:36谷草转氨酶211U/L;乳酸脱氢酶1618U/L;肌酸激酶279U/L;肌酸激酶同工酶630U/L，对症处理后，拟直肠恶性肿瘤入院本科。
    #既往史值
    ${previousHistory}    Set Variable
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable
    #月经史值
    ${menstrualHistory}    Set Variable
    #婚育史值
    ${obstericalHistory}    Set Variable
    #诊疗计划值
    ${assessmentPlan}    Set Variable
    #检查结果值
    ${examinationResult}    Set Variable
    #检验结果值
    ${labTestResult}    Set Variable
    #评分结果值
    ${gradeResult}    Set Variable
    #预防接种史值
    ${vaccinationHistory}    Set Variable
    #输血史值
    ${bloodTransfusionHistory}    Set Variable
    #生命体征值
    ${vitalSigns}    Set Variable
    #辅助检查
    ${assistCheck}    Set Variable
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    直肠恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"77","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    # ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:111]}    ${assert}










