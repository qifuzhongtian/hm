*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***


回归测试集-2行,推出疑似诊断top:5:泌尿道感染
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难2年，加重伴发热2天。
    #现病史值
    ${presentHistory}    Set Variable    患者于2年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多，无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，2天前无明显诱因出现尿频尿急尿痛，频繁尿意，伴发热及意识烦躁。为进一步诊治今来我院，以前列腺增生收住院。患者自发病以来，精神食欲可，大便轻度失禁，小便如上述，体力体重无明显改变。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：较差.既往有高血压病史2年，2018年7月中风病史，长期口服阿司匹林肠溶缓释片及非洛地平缓释片。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因请描述死因母： 描述患病情况 3.已故，死因请描述死因其他:无上述病史记录已经征得陈述者认同。（以上第1页至第2页共2页）陈述者签名：2018年10月23日12时39分。
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
    ${assert}    Create List    泌尿道感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"72","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}


回归测试集-2行,推出疑似诊断top:10:前列腺增生
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难2年，加重伴发热2天。
    #现病史值
    ${presentHistory}    Set Variable    患者于2年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多，无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，2天前无明显诱因出现尿频尿急尿痛，频繁尿意，伴发热及意识烦躁。为进一步诊治今来我院，以前列腺增生收住院。 患者自发病以来，精神食欲可，大便轻度失禁，小便如上述，体力体重无明显改变。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：较差.既往有高血压病史2年，2018年7月中风病史，长期口服阿司匹林肠溶缓释片及非洛地平缓释片。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因请描述死因母： 描述患病情况 3.已故，死因请描述死因其他:无上述病史记录已经征得陈述者认同。（以上第1页至第2页共2页）;陈述者签名：2018年10月23日12时39分。
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
    ${assert}    Create List    前列腺增生
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"72","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-3行,推出疑似诊断top:5:肠梗阻
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛腹胀5小时余。
    #现病史值
    ${presentHistory}    Set Variable    患者5小时余前无明显诱因下出现腹部疼痛，呈持续性胀痛，以脐周为主，阵发性加重，无它处放射，伴肛门排气减少，大便有排，无伴恶心呕吐，无畏寒发热，无咳嗽咳痰，无胸闷气促，无尿频尿急尿痛，小便如常。现为求进一步治疗，拟“肠梗阻”收入我科。 患者自起病以来，精神尚可，睡眠可，未进食，大便少许，小便无异常。
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
    ${assert}    Create List    肠梗阻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"56","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


回归测试集-3行,推出疑似诊断top:10:胃炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛腹胀5小时余。
    #现病史值
    ${presentHistory}    Set Variable    患者5小时余前无明显诱因下出现腹部疼痛，呈持续性胀痛，以脐周为主，阵发性加重，无它处放射，伴肛门排气减少，大便有排，无伴恶心呕吐，无畏寒发热，无咳嗽咳痰，无胸闷气促，无尿频尿急尿痛，小便如常。现为求进一步治疗，拟“肠梗阻”收入我科。 患者自起病以来，精神尚可，睡眠可，未进食，大便少许，小便无异常。
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
    ${assert}    Create List    胃炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"56","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-4行,推出疑似诊断top:10:川崎病
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热5天。
    #现病史值
    ${presentHistory}    Set Variable    患儿于5天无明显诱因出现发热，呈不规则热，体温最高达39℃，无畏寒，无寒战及抽搐，予以退热后，体温可恢复正常，过数小时体温又上升，发热第2天全身出现红色皮疹，持续2天后皮疹消退，在黄石五医院住院治疗5天（消炎药、抗过敏等药物，具体治疗不详），住院期间热退1天，患儿现仍有发热，并出现手足肿胀，结膜充血，口唇皲裂，无明显咳嗽咳痰，无吐泻，为进一步治疗，前来我院就诊，门诊以“发热待查”收入我科，起病以来，患儿精神欠佳，饮食及睡眠一般，大小便正常。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：一般。疾病史（含外伤）：无。传染病史：无。预防接种史：按计划接种。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    出生史: 第1胎第1产；出生时体重3.6kg； 足月 胎龄39\script1 \script0 周；窒息：无生产情况: 自然产； 好；喂养史：母乳喂养； 添加辅食时间：6月； 母乳期营养及健康：好；生长发育史：抬头3月；坐6月；走12月；萌牙6月； 说话时间12月； 其他无； 饮食正常； 睡眠良好； 其它异常习惯：无； 入学状况：学龄前。
    #家族史值
    ${familyHistory}    Set Variable    （注意与患者现病史有关的遗传病及传染性疾病） 非近亲 无 无 无。
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
    ${assert}    Create List    川崎病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


回归测试集-5行,推出疑似诊断top:5:痛风
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复关节肿痛3年，再发3天。
    #现病史值
    ${presentHistory}    Set Variable    患者3年前无明显诱因下反复出现关节肿痛，起初为足趾关节，后逐渐累积踝关节、膝关节等，无皮疹出血，无发热畏寒，无胸闷气急，无恶心呕吐等，当地医院诊断为痛风，不规律予激素及止痛药物治疗后肿痛好转，但反复发作。3天前再次出现膝关节肿痛不适，活动受限，无发热畏寒，无恶心呕吐，无皮疹乏力，无胸闷气急等，当地医院输液治疗3天后肿痛好转，今来我院住院进一步诊治。 患者发病以来，神清，精神软，胃纳、睡眠尚可，小便正常，大便偶失禁，体重无明显增减。有高血压病史3年，最高血压180/90mmhg，未服药治疗，平素偶监测血压收缩压在140-150mmhg。
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
    ${assert}    Create List    痛风
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
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-6行,推出疑似诊断top:5:急性乳腺炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    非哺乳期右侧乳腺红肿疼痛并肿块4天。
    #现病史值
    ${presentHistory}    Set Variable    患者为非哺乳期女性，4天前无明显诱因出现右侧乳腺红肿疼痛并伴有鸽蛋大小肿块，伴畏寒，体温未测，无头昏、头痛，自行口服“乳康片”（具体用药不详），疼痛未见明显缓解。四天来右侧乳腺疼痛加重，肿块明显增大，遂来院就诊，门诊查体后以“右侧乳腺炎”收入院治疗。 起病以来，精神可，饮食睡眠可，体力无明显下降，大小便正常。
    #既往史值
    ${previousHistory}    Set Variable    平素健康情况良好。系统回顾：无无无无无无无无无无无不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    久居本地，无地方病地区居住史，无吸烟史、无饮酒史，无吸毒史。
    #家族史值
    ${familyHistory}    Set Variable    否认家族性遗传病史。上述病史记录已经征得陈述者认同。（以上第 1 页至第 1 页共 1 页）陈述者签名： 年 月 日 时 分。
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
    ${assert}    Create List    急性乳腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"39","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-7行,推出疑似诊断top:5:病态窦房结综合征
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发心悸伴晕厥1次半天。
    #现病史值
    ${presentHistory}    Set Variable    患者半天前无明显诱因突发心悸胸闷不适，随即发生晕厥1次伴跌倒在地，持续约1分钟后意识转清，清醒后感左髋部疼痛，无头痛头晕，无胸痛大汗，无恶心呕吐，无畏寒发热，无下肢浮肿，无腹痛腹泻等不适，遂到梅城二院门诊，行心电图提示“窦性心动过缓伴长P-P间期，提示窦性停搏”，今来我院门诊就诊，建议住院进一步诊治，遂拟“心律失常，病窦综合征”收住我科。 发病来，患者神志清，精神软，胃纳可，夜间睡眠差，二便如常，否认近期体重明显增减。
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
    ${assert}    Create List    病态窦房结综合征
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"82","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-8行,推出疑似诊断top:5:带状疱疹
    [Documentation]    带状疱疹""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左侧胸背部红斑、丘疱疹，伴痛4天。
    #现病史值
    ${presentHistory}    Set Variable    患者于4天前无明显诱因开始出现左侧胸背起红斑，并伴疼痛不适，无畏寒、发热、头昏、胸闷，无腹痛、腹泻、恶心、呕吐等不适。红斑逐渐增多，并在红斑基础上出现丘疱疹，自行以阿昔洛韦片0.6 po qid治疗，效果欠佳，遂来我院求诊，在门诊经检查后以带状疱疹收入院。起病以来，患者精神、食欲、睡眠可，大小便正常
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：较差。疾病史（含外伤）：呼吸系统症状：无循环系统症状：冠状动脉狭窄病史6年，口服药物治疗，控制尚可。消化系统症状：无泌尿系统症状：无血液系统症状：无内分泌代谢症状：糖尿病病史10余年，口服药物及胰岛素治疗（具体不详），控制尚可。神经精神症状：无生殖系统症状：无运动系统症状：无传染病史：：无其他：无预防接种史：：不详
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均21支，持续30年 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病： 有，疾病名称 糖尿病 否认家族性遗传病史及传染病史。 父：描述患病情况 3.已故，死因不详母：2.患有糖尿病 请描述死因其他:无上述病史记录已经征得陈述者认同。（以上第页至第页共页）陈述者签名：2018年09月06日09时51分。
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
    ${assert}    Create List    带状疱疹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"53","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-9行,推出疑似诊断top:10:手足口病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热伴双足底疱疹半天。
    #现病史值
    ${presentHistory}    Set Variable    患儿于昨日下午出现发热，哭吵不安，发现双足底出现散在少许小疱疹，伴四肢惊醒、抖动不安、拒食，无畏寒及抽搐，无咳嗽，无气促及呼吸困难，无腹泻，在浠水县人民医院感染科就诊，测体温39.7℃，无畏寒及抽搐，给予输液治疗（具体不详）后出现哭闹、呕吐，为进一步治疗，来我院就诊，以“手足口病”收入院。患儿自起病以来，精神尚可，食欲差，二便如常。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：一般。疾病史（含外伤）：39天因肺炎在浠水县妇幼保健院住院治疗；54天因肺炎在浠水县人民医院住院治疗；传染病史：无。预防接种史：按计划接种。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    出生史: 第2胎第2产；出生时体重3.3kg； 足月 胎龄40\script1 \script0 周；窒息：无生产情况: 剖宫产； 好；喂养史：母乳喂养； 添加辅食时间：6月； 母乳期营养及健康：好；生长发育史：抬头3月；坐6月；走13月；萌牙6月； 说话时间8月； 其他无； 饮食正常； 睡眠良好； 其它异常习惯：无； 入学状况：幼儿期。
    #家族史值
    ${familyHistory}    Set Variable    （注意与患者现病史有关的遗传病及传染性疾病） 非近亲 无 无 无。
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
    ${assert}    Create List    手足口病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"1","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-10行,推出疑似诊断top:10:帕金森病,帕金森综合征
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左肢震颤、运动迟缓3年。
    #现病史值
    ${presentHistory}    Set Variable    患者3年前起开始出现左肢震颤，运动迟缓，嗅觉减退，讲话声音音调减低，无意识不清，无胸闷胸痛，无恶心呕吐，无二便失禁，无抽搐等，患者担心病情，遂于8月3日至我院门诊就诊，查头颅MRI+DWI：两侧室旁白质疏松，多发腔隙灶；老年性脑改变，门诊未予特殊用药干预，直接拟“帕金森综合征”收入我科。 发病来，神清，精神软，胃纳睡眠一般，大小便无殊，近3月体重减轻4斤。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：一般。疾病史（含外伤）：39天因肺炎在浠水县妇幼保健院住院治疗；54天因肺炎在浠水县人民医院住院治疗；传染病史：无。预防接种史：按计划接种。
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
    ${assert}    Create List    帕金森病    帕金森综合征
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-11行,推出疑似诊断top:10:支气管哮喘
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复气急5年余，再发伴意识不清1小时。
    #现病史值
    ${presentHistory}    Set Variable    患者5年余前出现反复气急，活动后加重，吸入油烟气体气急明显，无明显咳嗽咳痰，无畏寒发热，未重视，未进一步诊治，4年余前因气急发作，曾至医院就诊，诊断为支气管哮喘，予信必可吸入治疗，气急好转，后一直不规则吸入治疗，病情尚稳定。1小时前患者上厕所时突发气急，晕厥倒地，意识不清，家属呼之不应，大小便失禁，伴大汗淋漓，无口吐白沫，无四肢抽搐，遂至我院急诊就诊，予相关检查，诊断为“支气管哮喘 危重”，予米乐松针 80mg 静推及多索茶碱针等平喘治疗，为求进一步诊治，拟“支气管哮喘 危重”收住入院。 患者此次起病以来，精神软，胃纳及睡眠可，二便失禁，近期体重无明显增减
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
    ${assert}    Create List    支气管哮喘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"54","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-12行,推出疑似诊断top:10:扁桃体炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热1天。
    #现病史值
    ${presentHistory}    Set Variable    患儿于1天前无明显诱因出现发热，为间断不规则发热，体温最高达40.0℃，伴四肢冷，伴流清鼻涕，呕吐胃内容物2次，非喷射状，无畏寒、寒战，无抽搐、咳嗽、腹泻、皮疹等，在家予以口服药物治疗（小儿翅鞘，布洛芬），患儿症状无好转，今来复诊，拟“发热待查”收入院。]病后精神、食欲、睡眠欠佳，大小便如常，体重无减轻。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。疾病史 无传染病史： 无输血史 无过敏史 无 外伤及手术史 无预防接种史 按计划接种。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    出生史: 第2胎第2产；出生时体重2.9kg； 出生时情况：足月胎龄40\script1 \script0 周；窒息：无生产情况: 剖宫产； 母孕期情况:好；喂养史：母乳喂养； 添加辅食时间：6月；母乳期营养及健康：好；生长发育史： 抬头2月；坐6月；走12月；萌牙7月； 说话时间12月； 其他无； 生活习惯：饮食正常； 睡眠良好；其它异常习惯：无； 入学状况：学龄前。
    #家族史值
    ${familyHistory}    Set Variable    家族史:（注意与患者现病史有关的遗传病及传染性疾病） 非近亲 无 无 无 居住地流行病及地方史无，居住环境良好。上述病史记录已经征得陈述者认同。（以上第 1 页至第 2 页共 2 页）陈述者签名：2018年 09月 12日 08 时 30分。
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
    ${assert}    Create List    扁桃体炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"1","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-13行,推出疑似诊断top:5:前列腺增生
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难5年余，排尿不下1天。
    #现病史值
    ${presentHistory}    Set Variable    患者于5年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多（4-5次），无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，3周前出现排尿不下，伴下腹胀痛，行泌尿系彩超提示：前列腺增生，前列腺炎改变，在当地医院行留置导尿，并给予哈乐对症治疗，病情好转后出院，留置尿道1周后拔除尿管再次出现不能自主排尿，后再次留置尿管。留置5日后再次拔除尿管，并继续口服哈乐，昨日再次出现不能自主排尿，伴小腹胀痛，无其他不适。为进一步诊治今来我院，以前列腺增生伴急性尿潴留收住院。 患者自发病以来，精神食欲可，大便正常，小便如上述，体力体重无明显改变
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均7支，持续20年 戒烟：是：15年饮酒史：有：日均3两，持续40年 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。父：描述患病情况 3.已故，死因不详母：描述患病情况 3.已故，死因不详其他:无上述病史记录已经征得陈述者认同。（以上第1页至第2页共2页）陈述者签名：2018年09月10日11时35分。
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
    ${assert}    Create List    前列腺增生
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"66","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-13行,推出疑似诊断top:10:尿潴留
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难5年余，排尿不下1天。
    #现病史值
    ${presentHistory}    Set Variable    患者于5年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多（4-5次），无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，3周前出现排尿不下，伴下腹胀痛，行泌尿系彩超提示：前列腺增生，前列腺炎改变，在当地医院行留置导尿，并给予哈乐对症治疗，病情好转后出院，留置尿道1周后拔除尿管再次出现不能自主排尿，后再次留置尿管。留置5日后再次拔除尿管，并继续口服哈乐，昨日再次出现不能自主排尿，伴小腹胀痛，无其他不适。为进一步诊治今来我院，以前列腺增生伴急性尿潴留收住院。 患者自发病以来，精神食欲可，大便正常，小便如上述，体力体重无明显改变
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均7支，持续20年 戒烟：是：15年饮酒史：有：日均3两，持续40年 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。父：描述患病情况 3.已故，死因不详母：描述患病情况 3.已故，死因不详其他:无上述病史记录已经征得陈述者认同。（以上第1页至第2页共2页）陈述者签名：2018年09月10日11时35分。
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
    ${assert}    Create List    尿潴留
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"66","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-14行,推出疑似诊断top:5:2型糖尿病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复口干多饮、多尿、消瘦5年，加重1周。
    #现病史值
    ${presentHistory}    Set Variable    患者5年前无明显诱因出现口干多饮、多尿、消瘦，曾就诊黄石港区红旗桥卫生院诊断为“2型糖尿病”，予对症治疗，症状缓解。之后病情反复发作，曾就诊我院诊断为“2型糖尿病并周围血管病变、并周围神经病变、糖尿病肾病”，予二甲双胍和诺和龙降血糖等治疗，症状缓解出院。1周前患者上述症状加重，伴右下腹疼痛、头晕、头痛、双下肢乏力及麻木疼痛、胃痛、心慌、胸闷痛、咳嗽，无发热，今为求治疗，遂就诊我院门诊，测空腹手指血糖9.0mmolL，遂拟“2型糖尿病”收入院。入院见：口干多饮、多尿、消瘦、右下腹疼痛、头晕、头痛、双下肢乏力及麻木疼痛、胃痛、心慌、胸闷痛、咳嗽。发病以来，精神差，纳差，大便干结，小便频，夜寐差。
    #既往史值
    ${previousHistory}    Set Variable    平素健康情况较差 系统回顾：否认有“肺炎、肺结核”病史。有“冠心病”1年余，否认有“高血压病”病史。有“脂肪肝、慢性胃炎”病史1年余。无无有“2型糖尿病”病史5年，有“2型糖尿病并周围血管病变、并周围神经病变、糖尿病肾病”病史1年余。有“高尿酸血症”病史1年。有“脑萎缩”病史1年。无无无有“前列腺增生”病史1年。不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    久居本地，无地方病地区居住史，疫水无，无吸烟史、无饮酒史，无吸毒史，其他无。
    #家族史值
    ${familyHistory}    Set Variable    否认家族性遗传病史。上述病史记录已经征得陈述者认同。（以上第 页至第 页共 页）陈述者签名： 年 月 日 时 分(一)望诊望神：萎靡情志：忧虑舌苔：薄白舌质：淡红（二）闻诊声音：正常气味：无 有（ ）其他（三）问诊寒热：正常汗： 正常感知：瘙痒 麻木 部位:双下肢性质:中度发作时间:2018年06月26日口渴：口渴欲饮听力：正常 下降 耳鸣（左 右）视力：正常 下降 失明（左 右）（四）切诊 脉：细。
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
    ${assert}    Create List    2型糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"74","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-15行,推出疑似诊断top::附睾炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左侧阴囊疼痛一天。
    #现病史值
    ${presentHistory}    Set Variable    患者一天前无明显诱因出现左侧阴囊肿痛，不伴尿频尿急尿痛，不伴发热，无寒战，无恶心呕吐，伴阴囊坠胀感，无腰痛等症，为求进一步诊治，遂来我院，门诊B超示左侧睾丸附睾炎，以“左侧急性睾丸附睾炎”收入院。 自起病以来，患者精神睡眠饮食尚可，大小便正常，体力体重无明显变化。
    #既往史值
    ${previousHistory}    Set Variable    平素健康情况良好。系统回顾：呼吸系统症状：无循环系统症状：无消化系统症状：无泌尿系统症状：无血液系统症状：无内分泌代谢症状：无神经精神症状：无生殖系统症状：无运动系统症状：无传染病史及免疫系统症状：无其他：无预防接种史：不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病： 否认家族性遗传病史及传染病史。 父：1.健在 母：1.健在 其他:。
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
    ${assert}    Create List    附睾炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"37","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-16行,推出疑似诊断top::上消化道出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    呕血3小时
    #现病史值
    ${presentHistory}    Set Variable    3小时前患者无明显诱因下出现呕血，鲜红色夹杂血块，量约300ml，伴全身冒冷汗，略感上腹不适，无黑便，无明显腹痛，无胸闷胸痛，无黑曚晕厥等，送来我院急诊，考虑消化道出血，监测血压较低，予以补液升压等治疗，血压渐升高，在100/60mmHg左右，红细胞带入病房，住院进一步诊治。 发病来，神清，精神软，未进食，睡眠差，小便减少，大便未解，体重无增减。1年前发现口腔肿瘤，曾在电力医院检查，病理提示肿瘤可能，曾在外院诊治，近4日来口服中药治疗，具体不详。
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
    ${assert}    Create List    上消化道出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"63","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-17行,推出疑似诊断top:10:急性阑尾炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    转移性右下腹部疼痛5小时。
    #现病史值
    ${presentHistory}    Set Variable    患者5小时前无明显诱因出现全腹部疼痛，阵发性加重，伴恶心无呕吐，无呕血黑便，无畏寒发热,无咳嗽咳痰,无血尿血便。遂来我院，遂转移至右下腹部固定，伴恶心明显。急诊我院行全腹部CT平扫检查结果:急性化脓性阑尾炎。遂拟诊“急性阑尾炎”收住院急诊手术治疗。 患者发病以来，神清精神软，纳差、睡眠差，二便如常，体重无明显变化。
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
    ${assert}    Create List    急性阑尾炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-18行,推出疑似诊断top:5:心房颤动
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复心悸、胸闷1月余。
    #现病史值
    ${presentHistory}    Set Variable    患者1月余前出现心悸、胸闷伴气促不适，阵发性发作，休息后可缓解,无胸痛咯血,无黒朦晕厥，至我院门诊就诊，心电图提示快室律房颤，转至急诊，予以西地兰针及单硝酸异山梨酯针对症处理后拟“冠心病 房颤 心功能不全 高血压”收入院。 患者起病来神清，精神软，睡眠不佳，胃纳差，二便正常，体重无明显变化。有高血压病史9年，服药治疗（药物不详），血压控制欠佳.
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
    ${assert}    Create List    心房颤动
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-19行,推出疑似诊断top:5:肺恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    咳嗽咯血1月。
    #现病史值
    ${presentHistory}    Set Variable    患者1月前因受凉后出现咳嗽，咳嗽阵发性，痰中带少许暗红色血块，无明显胸闷气促，无胸痛，无畏寒发热，无声音嘶哑，无畏寒寒战，无呕吐鲜血，无腹痛黑便，无四肢麻木等不适。口服“止咳糖浆”等药物无改善。13天前在建德市中医院住院，胸部CT:右肺下叶多发结节状及团块影，右肺下叶局部支气管狭窄伴闭塞，两下肺感染灶。予哌拉西林他唑巴坦针及左氧氟沙星针抗感染，治疗后症状无改善。复查胸部CT无改善。来我院门诊，要求支气管镜检查，为进一步治疗收住本科。 发病来，精神软，胃纳睡眠欠佳，二便无殊。体重无明显增减。患者3年前出现记忆力下降，反应迟钝，曾有多次跌倒致躯体疼痛，在浙一医院诊断为老年性痴呆，口服尼麦角林、舍曲林。
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
    ${assert}    Create List    肺恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"76","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-20行,推出疑似诊断top:5:肛周脓肿
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    肛周肿痛10余天，加剧2天。
    #现病史值
    ${presentHistory}    Set Variable    患者10余天前无明显诱因下出现肛旁肿痛不适，呈持续性胀痛，不向他处放射，无畏寒、发热，无大便次数改变，无解粘液血便，无腹痛及腹胀,一直未曾就诊，2天前感肛门肿痛明显，自用“鱼石酯软膏”外用后，效不佳，来院就诊，拟“肛周脓肿”收住入院。 发病来，精神尚可，胃纳睡眠可，大小便无殊，体重无增减。
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
    ${assert}    Create List    肛周脓肿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"32","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-21行,推出疑似诊断top:10:溃疡性结肠炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹泻10余年
    #现病史值
    ${presentHistory}    Set Variable    10余年前患者无明显诱因下出现腹泻，多于进食生冷及油腻等刺激性食物后出现，解黄色稀便、糊状便每日2-4次，有时大便带粘液，无明显腹胀腹痛，无黑便血便，无发热，无恶心呕吐等，调整饮食后大便能好转恢复正常。近2月来病情有加重，至建德市电力医院就诊，肠镜检查提示炎症性肠病，溃疡性结肠炎首先考虑，予以抑制肠道炎症，调节肠道菌群等治疗，效果不佳，今来住院进一步诊治。 患者起病来，神清，精神可，胃纳及睡眠可，大便如上述，小便如常，近期体重未见明显下降
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
    ${assert}    Create List    溃疡性结肠炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"54","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-22行,推出疑似诊断top:10:白内障
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    右眼视物模糊3年余
    #现病史值
    ${presentHistory}    Set Variable    患者3年前起无明显诱因，感右眼视力逐渐下降，无眼胀、眼痛，无畏光、流泪，未作特殊治疗，近日感影响生活，来我院门诊就诊，门诊经相关检查后为进一步治疗以“右眼后发现白内障”收治入院。 起病来患者精神、食欲、睡眠尚可，大小便如常
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好疾病史（含外伤）：：无； 高血压10年，口服药物控制； 无；无； 无； 无；无； 无； 无；传染病史：无； 无；预防接种史：不详；。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 3.已故，死因不详母：1.健在 其他:上述病史记录已经征得陈述者认同。（以上第 1 页至第 1 页共 1 页）陈述者签名：2018年 05月 08日 11 时 35分。
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
    ${assert}    Create List    白内障
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-23行,推出疑似诊断top:5:急性胰腺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛2天
    #现病史值
    ${presentHistory}    Set Variable    2天前患者无明显诱因下出现腹痛，位于中上腹，呈持续性，有阵发性加剧，无明显他处放射 ，有恶心感，无呕吐物，肛门排气排便减少 无畏寒发热，无胸闷胸痛等不适，曾在当地诊所输液治疗后好转，后腹痛再发来我院急诊，急诊生化血淀粉酶 216 U/L略偏高，腹部CT提示急性胰腺炎，考虑急性胰腺炎，予以抑制胰液分泌护胃止痛等治疗后收入院进一步诊治。 起病以来，神清，精神软，胃纳差，睡眠一般，小便尚可。近期体重未及明显减轻
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
    ${assert}    Create List    急性胰腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-24行,推出疑似诊断top:10:银屑病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    双下肢红斑、鳞屑5年，泛发至全身半月。
    #现病史值
    ${presentHistory}    Set Variable    患者5年前无明显诱因，头皮、四肢伸侧出现红斑，表面有鳞屑，伴有瘙痒，皮疹逐渐增多。无发热，畏寒，头痛、头昏、咳嗽、咳痰、胸痛、胸闷、腹痛、腹泻、黑便等伴随症状。起病后患者曾经来我院及外院口服外搽药物（具体药物不详）治疗多次，皮疹可缓解，但患者未注意饮食时皮疹可反复发作。半月前躯干、双上肢相继起红斑、丘疹，曾外用药（具体不详）治疗，效果不佳。今为进一步治疗来我院就诊，门诊以“银屑病”收治入院。 病程中，患者精神、食欲可，睡眠可，大小便正常，体力体重无明显改变。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。疾病史（含外伤）：：呼吸系统症状：无循环系统症状：无消化系统症状：无泌尿系统症状：无血液系统症状：无内分泌代谢症状：无神经精神症状：无生殖系统症状：无运动系统症状：无传染病史：：无其他：无预防接种史：：不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均20支，持续30年 戒烟：否饮酒史：有：日均1-2两，持续30年 戒酒：是：5年无毒品接触史；其他:请描述其他情况。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父：1.健在 描述患病情况 请描述死因母：1.健在 描述患病情况 请描述死因其他:请描述其他情况上述病史记录已经征得陈述者认同。（以上第 页至第 页共 页）陈述者签名：2018年 09月 07日 14 时 25分。
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
    ${assert}    Create List    银屑病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-25行,推出疑似诊断top:5:过敏性紫癜
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    下肢瘀斑4天，关节疼痛1天
    #现病史值
    ${presentHistory}    Set Variable    4天前无明显诱因下出现下肢皮肤瘀斑，呈紫色，双下肢瘀斑对称性分布，无瘙痒。在当地卫生院予“地塞米松针，头孢呋辛”等治疗4天，下肢瘀斑颜色变淡，无发热，无胸闷气短，无恶心呕吐，无腹痛腹泻。今晨出现膝关节，腕关节及肢体肿胀，伴活动受限。故来我院门诊，为进一步治疗，门诊拟“过敏性紫癜”收入住院。 自起病以来，神志清，精神可，胃纳睡眠一般，大小便无殊，近期体重未见明显增减。
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
    ${assert}    Create List    过敏性紫癜
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"18","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-26行,推出疑似诊断top:10:过敏性紫癜
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    双下肢瘀点、瘀斑伴腹痛3天，加重2天
    #现病史值
    ${presentHistory}    Set Variable    患儿于3天前无明显的诱因双下肢出现密集的瘀点、瘀斑，压之不褪色，无瘙痒及疼痛不适，时有间断脐周,左中上腹疼痛，未重视,近2天皮疹继续增多,向上蔓延至大腿根部, 腹痛,腹胀有所加重,无呕吐腹泻,无关节疼痛,无发热，畏寒，无头痛，头昏，无咳嗽，咳痰等伴随症状，为求进一步诊治今来我院中心院区门诊查血常规示：WBC 8.63×109L, GRA 72.9门诊以“过敏性紫癜”收治入院。 起病以来精神，饮食差，睡眠可，黄色大便，小便正常，体力体重变化不大
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。疾病史（含外伤）：：呼吸系统症状：无循环系统症状：无消化系统症状：无泌尿系统症状：无血液系统症状：无内分泌代谢症状：无神经精神症状：无生殖系统症状：无运动系统症状：无传染病史：：无其他：否认预防接种史：：不详
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:否认。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父：1.健在 母：1.健在 其他:否认上述病史记录已经征得陈述者认同。（以上第 页至第 页共 页）陈述者签名：2018年 04月 09日 17 时 52分。
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
    ${assert}    Create List    过敏性紫癜
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"17","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-27行,推出疑似诊断top:10:腹股沟疝
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发现左侧腹股沟可复性包块1年余
    #现病史值
    ${presentHistory}    Set Variable    患者1年余前无意中发现左腹股沟区有一质软肿块，突出体表，初始约核桃大小，久站及行走时包块明显，无疼痛不适，平卧后包块逐渐消失，无尿频尿急尿痛，无恶心呕吐，无畏寒发热、无胸闷气促、无呕血黑便，无腹胀腹痛等不适。当时未予特殊处理，后感包块反复脱出且逐渐增大，无好转，现约鸡蛋大小，偶伴有坠胀感，余无明显不适，为求诊治，今日遂至我院门诊就诊，拟“左侧腹股沟疝”收治入院。 患者神志清，精神可，胃纳及睡眠可，二便无殊，近期体重无明显增减
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
    ${assert}    Create List    腹股沟疝
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"52","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-28行,推出疑似诊断top:5:脑出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发左侧肢体活动障碍17天。
    #现病史值
    ${presentHistory}    Set Variable    患者17天前晚餐中突发左侧肢体活动障碍，坐立不稳，滑到在地，被立即被家人扶起，自诉左侧乏力，活动困难，当时左上肢基本无法抬举过肩，左下肢搀扶下勉强站立，否认头痛，无恶心，无呕吐，无流涎，无二便失禁，无肢体抽搐，立即被家人送至建德二院，行颅脑CT检查提示右侧基底节出血，建议转院，遂120转送我院急诊，复查颅脑CT提示右侧基底节血肿，量约27ml，脑外科会诊考虑有相对手术指征，家属商议后要求保守治疗，故急诊给予“尖吻蝮蛇血凝酶针、艾司奥美拉唑、吡拉西坦氯化钠”等药物治疗，患者病情无明显加重，拟“脑出血”收住我科。在我科给予脱水降颅压、维持水电解质平衡、控制血压、防治并发症等治疗，病情逐渐稳定，复查颅脑CT提示血肿吸收，但仍存在脑水肿，患者瘫痪肢体肌力有所恢复，仍需继续药物及康复治疗，今因医保结算，拟“脑出血”办理周转入院。 患者自发病以来，神清、精神软，二便性状可，睡眠一般，近期无明显体重减轻。患者既往有高血压病史10余年，长期服用苯磺酸氨氯地平片5mg 1/日，自诉血压控制良好。
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
    ${assert}    Create List    脑出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"57","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-29行,推出疑似诊断top::包皮过长
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发现包皮过长6年
    #现病史值
    ${presentHistory}    Set Variable    患者6年前被父母发现包皮过长，无尿频尿急尿痛，无肉眼血尿，无包皮红肿不适，一直无未重视，6年来病情无缓解，无畏寒发热，无胸闷气急，无咳嗽咳痰，无恶心呕吐等不适，今来院就诊，门诊拟“包茎”收住入院。 患者神清，精神可，胃纳、夜眠可，大小便无殊，近来体重无明显增减。
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
    ${assert}    Create List    包皮过长
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-30行,推出疑似诊断top:5:包皮过长
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    包皮过长26年
    #现病史值
    ${presentHistory}    Set Variable    患者于26年前被父母发现包皮过长，包皮不能上翻，无畏寒发热，无恶心呕吐，无胸闷气促，无咳嗽咳痰，无腰痛腹痛，无尿频尿急尿痛，无肉眼血尿，未予重视，26年来病情无缓解，今为进一步诊治就诊我院，拟“包茎”收住入我科。 病来神清，精神尚可，胃纳睡眠尚可，大便无明显异常，小便如上述近期体重无明显改变
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
    ${assert}    Create List    包皮过长
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"26","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-31行,推出疑似诊断top::慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复咳嗽咳痰30余年，气急5年，加重2天
    #现病史值
    ${presentHistory}    Set Variable    患者30余年前受凉后出现咳嗽咳痰，黄白痰能咳出，有时伴有喘鸣音，痰咳出后好转，曾至当地医院就诊，予抗感染治疗后好转，此后每年冬春季、受凉后反复，累计发作时间达3月以上，经治疗后均能好转。5年前始出现活动后气急，休息后能好转。曾多次至我院门诊，诊断“慢性阻塞性肺疾病、支气管扩张”，予相关治疗后症状仍反复。末次住院时间为2018.4.30-2018.5.9。平时规律吸入、赛托溴胺、舒利迭等药。2天前患者受凉后咳嗽咳痰气急较前加重，痰多不易咳出，不能胜任日常活动，无夜间阵发性呼吸困难，无发热乏力，无恶心呕吐，无腹痛腹泻等不适。今来本院门诊，为进一步治疗，收入本科。 发病来，神志清，精神软，胃纳睡眠欠佳，二便无殊。体重无明显增减。既往有矽肺I期病史20余年，铜矿工作多年。有胆囊结石病史3年，甲状腺腺瘤术后病史10余年。
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-32行,推出疑似诊断top:5:泌尿系结石、输尿管结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复左侧腰部疼痛1月余。
    #现病史值
    ${presentHistory}    Set Variable    患者约1月前无明显诱因出现左侧腰部疼痛，呈持续性胀痛，间歇性发作，疼痛能忍受，无远处放射性疼痛，改变体位疼痛无明显减轻，无恶心呕吐，无畏寒发热，无肉眼血尿，无脓尿，无尿频尿急尿痛，无排尿中断，发病期间未在附近医院就诊，未行特殊治疗，疼痛症状无明显缓解。近两天来，患者自觉左侧腰痛症状明显加重，为求进一步诊治，今来我院就诊，2018-02-01 泌尿系,左肾积水左侧输尿管末段结石并扩张。门诊以“左侧输尿管结石收入院”收入院。起病以来，患者精神食欲睡眠正常，大小便正常，体力体重无明显变化。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 3.已故，死因母： 3.已故，死因其他:上述病史记录已经征得陈述者认同。 陈述者签名：（以上第 1 页至第 2 页共 2 页） 2018年 02月 01日 16 时 47分。
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
    ${assert}    Create List    泌尿系结石    输尿管结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-32行,推出疑似诊断top:10:输尿管梗阻
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复左侧腰部疼痛1月余。
    #现病史值
    ${presentHistory}    Set Variable    患者约1月前无明显诱因出现左侧腰部疼痛，呈持续性胀痛，间歇性发作，疼痛能忍受，无远处放射性疼痛，改变体位疼痛无明显减轻，无恶心呕吐，无畏寒发热，无肉眼血尿，无脓尿，无尿频尿急尿痛，无排尿中断，发病期间未在附近医院就诊，未行特殊治疗，疼痛症状无明显缓解。近两天来，患者自觉左侧腰痛症状明显加重，为求进一步诊治，今来我院就诊，2018-02-01 泌尿系,左肾积水左侧输尿管末段结石并扩张。门诊以“左侧输尿管结石收入院”收入院。起病以来，患者精神食欲睡眠正常，大小便正常，体力体重无明显变化。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 3.已故，死因母： 3.已故，死因其他:上述病史记录已经征得陈述者认同。 陈述者签名：（以上第 1 页至第 2 页共 2 页） 2018年 02月 01日 16 时 47分。
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
    ${assert}    Create List    输尿管梗阻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}









回归测试集-33行,推出疑似诊断top:10:卵巢扭转、盆腔积液
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    阵发性腹痛12小时,加重9小时。
    #现病史值
    ${presentHistory}    Set Variable    绝经1年,04-11 23时左右出现右侧下腹隐痛,未处理,04-12 03:00明显加重,伴呕吐乏力,为胃内容物,无头痛心慌,于我院急诊科就诊.给予急诊行全腹部CT平扫（含三维重建）,1 宫旁右侧附件区异常密度影，建议超声检查。2 肝右叶稍低密度影，建议增强检查。3 少量盆腔积液。查体血压183102mmHg,给予镇静镇痛治疗,B超提示:,右侧附件区非均质性包块(3.7*2.9cm)盆腔积液(2.2cm)门诊以“腹痛原因待查：盆腔炎？”收入院。病程以来，神清，精神差，睡眠饮食差，体重体力无明显变化。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：：良好疾病史（含外伤）：：呼吸系统症状：无。循环系统症状：无。消化系统症状：无。泌尿系统症状：无。血液系统症状：无。内分泌系统症状：无。神经精神症状：无。生殖系统症状：无。运动系统症状：无。传染病史：：无。 其他：无。预防接种史不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父：1.健在 母：1.健在 其他:上述病史记录已经征得陈述者认同。（以上第 1 页至第 2 页共 页）陈述者签名：2018年 04月 12日 12 时 09分。
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
    ${assert}    Create List    卵巢扭转    盆腔积液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"49","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-34行,推出疑似诊断top:5:甲状腺癌、结节性甲状腺肿
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    体检发现右侧多发甲状腺结节1月余。
    #现病史值
    ${presentHistory}    Set Variable    患者于1月余前在本院体检发现右侧多发甲状腺结节，遂至浙二医院行甲状腺穿刺，2018年5月30日病理报告示：非典型滤泡上皮细胞，可见核沟，未见明确包涵体，癌疑，病程中患者无畏寒发热，无咳嗽咳痰，无胸闷气促，无血尿血便，无声音嘶哑，无脾气暴躁，无食欲亢进，无心慌心悸，今来我院就诊要求手术，门诊拟“甲状腺肿物”收入我科。 患者起病来，神志清，精神可，胃纳睡眠可，大小便无殊，体重无明显变化。
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
    ${assert}    Create List    甲状腺癌    结节性甲状腺肿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"39","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






# 回归测试集-35行,推出疑似诊断top:10:甲状腺功能亢进症
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    体检发现右侧多发甲状腺结节1月余。
#     #现病史值
#     ${presentHistory}    Set Variable    患者于1月余前在本院体检发现右侧多发甲状腺结节，遂至浙二医院行甲状腺穿刺，2018年5月30日病理报告示：非典型滤泡上皮细胞，可见核沟，未见明确包涵体，癌疑，病程中患者无畏寒发热，无咳嗽咳痰，无胸闷气促，无血尿血便，无声音嘶哑，无脾气暴躁，无食欲亢进，无心慌心悸，今来我院就诊要求手术，门诊拟“甲状腺肿物”收入我科。 患者起病来，神志清，精神可，胃纳睡眠可，大小便无殊，体重无明显变化。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    甲状腺功能亢进症
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"39","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-35行,推出疑似诊断top:5:水痘、手足口病、川崎病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热皮疹2天。
    #现病史值
    ${presentHistory}    Set Variable    患儿于2天前无明显诱因出现发热，具体体温不详，全身可见水痘样皮疹，伴咳嗽，呕吐一次，为胃内容物，无腹泻，在当地医院使用抗生素外用，在中心医院就诊，考虑为水痘，遂转入我院治疗，为进一步诊疗由门诊收入院，入院症见：全身皮肤可见散在红色疱疹，疱疹与结痂并见，无发热，无咳嗽，无呕吐、抽搐、腹泻等症，二便尚可，夜寐可。
    #既往史值
    ${previousHistory}    Set Variable    平素健康情况良好 系统回顾：无无无无无无无无无无无按计划接种疫苗。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    久居本地，无地方病地区居住史，疫水无，无吸烟史、无饮酒史，无吸毒史，其他第1胎足月剖腹产，出生体重3kg，无产伤窒息史，牛乳喂养，按计划接种疫苗。
    #家族史值
    ${familyHistory}    Set Variable    否认家族性遗传病史。上述病史记录已经征得陈述者认同。（以上第 页至第 页共 页）;陈述者签名： 年 月 日 时 分(一)望诊望神：有神情志：开朗舌苔：薄白舌质：淡红（二）闻诊声音：正常气味：无 有（ ）其他其他（三）问诊寒热：正常汗： 正常感知：瘙痒 麻木 部位: 性质: 发作时间: 年 月 日口渴：不渴听力：正常 下降 耳鸣（左 右）视力：正常 下降 失明（左 右）（四）切诊 脉：滑数。
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
    ${assert}    Create List    水痘    手足口病    川崎病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"9","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-35行,推出疑似诊断top:10:带状疱疹
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热皮疹2天。
    #现病史值
    ${presentHistory}    Set Variable    患儿于2天前无明显诱因出现发热，具体体温不详，全身可见水痘样皮疹，伴咳嗽，呕吐一次，为胃内容物，无腹泻，在当地医院使用抗生素外用，在中心医院就诊，考虑为水痘，遂转入我院治疗，为进一步诊疗由门诊收入院，入院症见：全身皮肤可见散在红色疱疹，疱疹与结痂并见，无发热，无咳嗽，无呕吐、抽搐、腹泻等症，二便尚可，夜寐可。
    #既往史值
    ${previousHistory}    Set Variable    平素健康情况良好 系统回顾：无无无无无无无无无无无按计划接种疫苗。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    久居本地，无地方病地区居住史，疫水无，无吸烟史、无饮酒史，无吸毒史，其他第1胎足月剖腹产，出生体重3kg，无产伤窒息史，牛乳喂养，按计划接种疫苗。
    #家族史值
    ${familyHistory}    Set Variable    否认家族性遗传病史。上述病史记录已经征得陈述者认同。（以上第 页至第 页共 页）;陈述者签名： 年 月 日 时 分(一)望诊望神：有神情志：开朗舌苔：薄白舌质：淡红（二）闻诊声音：正常气味：无 有（ ）其他其他（三）问诊寒热：正常汗： 正常感知：瘙痒 麻木 部位: 性质: 发作时间: 年 月 日口渴：不渴听力：正常 下降 耳鸣（左 右）视力：正常 下降 失明（左 右）（四）切诊 脉：滑数。
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
    ${assert}    Create List    带状疱疹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"9","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-36行,推出疑似诊断top:10:肺栓塞
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发胸闷痛1小时余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1小时前无明显诱因下突感胸闷痛，位于胸骨中下段后方，巴掌大范围，呈持续性，有窒息感，伴大汗，呕吐数次，吐出物为胃内容物，无呕血，无黑朦晕厥，无咳嗽咳痰，自服“阿司匹林300mg”无缓解，无遂至我院急诊，完善相关检查后考虑急性ST段抬高型下壁心肌梗死，予行急诊PCI术收住入院。病来，神志清，精神软，胃纳睡眠可，大小便正常，体重无增减。
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
    ${assert}    Create List    肺栓塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"61","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






# 回归测试集-37行,推出疑似诊断top:5:输尿管结石
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    主诉:反复右侧腰腹部疼痛1天余。
#     #现病史值
#     ${presentHistory}    Set Variable    现病史:患者昨天无明显诱因下感右腰腹疼痛，为持续性胀痛，阵发性加重，伴有尿频尿急，无尿痛，无肉眼血尿，1天来上述症状反复发作，无畏寒发热，无头晕头痛，无胸闷气急等，来院CT提示：右输尿管上段结石，遂拟“右输尿管结石”收入住院。患者自起病来，神清，精神可，胃纳睡眠可，大便无殊，小便如上述。既往有“高血压”病史7年，平素服用苯磺酸氨氯地平片，具体不详，有“糖尿病”病史10年，用优泌林70/30，22/24皮下注射，有“痛风”病史，平素口服秋水仙碱。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    输尿管结石
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"72","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ..    currentDiseaseName=
#     ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-37行,推出疑似诊断top:10:泌尿道感染
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复右侧腰腹部疼痛1天余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者昨天无明显诱因下感右腰腹疼痛，为持续性胀痛，阵发性加重，伴有尿频尿急，无尿痛，无肉眼血尿，1天来上述症状反复发作，无畏寒发热，无头晕头痛，无胸闷气急等，来院CT提示：右输尿管上段结石，遂拟“右输尿管结石”收入住院。患者自起病来，神清，精神可，胃纳睡眠可，大便无殊，小便如上述。既往有“高血压”病史7年，平素服用苯磺酸氨氯地平片，具体不详，有“糖尿病”病史10年，用优泌林70/30，22/24皮下注射，有“痛风”病史，平素口服秋水仙碱。
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
    ${assert}    Create List    泌尿道感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"72","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-38行,推出疑似诊断top:5:骨盆骨折
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:压伤致髋部疼痛2小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2小时前不慎被重物压伤致髋部疼痛，活动受限。无昏迷，无胸闷气急，无腹痛腹胀等不适，急诊摄片提示：骨盆骨折；急诊予补液止痛等对症治疗，生命体征平稳，为进一步治疗。收住入院。发病以来，精神体力可，饮食睡眠可，大小便无殊，近期体重无明显减轻。
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
    ${assert}    Create List    骨盆骨折
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"49","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-39行,推出疑似诊断top:5:高血压性心脏病,心力衰竭
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:血压升高伴胸闷气闭10余年，再发1周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前在当地诊所就诊时发现血压高，最高达185/90mmHg，不规律口服降压药，一直未监测血压。后无明显诱因出现活动后气急胸闷，伴双下肢水肿，经休息以后可缓解，无持续性胸痛大汗，无恶心呕吐，2012年曾在本科住院治疗，诊断“高血压病3级（高危组）高血压性心脏病,心房颤动,心功能Ⅲ级”出院后未规范服药。患者胸闷、气急时有反复，多次在我科住院，最近一次为2018.9.1-2018.9.09，诊断为“心力衰竭,高血压3级,高血压心脏病伴心力衰竭,心房颤动,心功能Ⅲ级,恶性淋巴瘤个人史,消化性溃疡”，经治疗后好转出院，出院后未规律服药治疗。1周前无诱因再次出现活动后气急胸闷加重，经休息能好转，走快步及爬楼梯是即感气急加重，伴双下肢轻度浮肿，夜间需高枕卧位，无头晕头痛，无持续性胸痛，无大汗淋漓，无视物模糊旋转，无言语不清及口角歪斜等伴随症状，今来本院门诊，拟“心力衰竭”收住院。,起病来，神志清，精神软，胃纳不佳，睡眠差，二便通畅，体重无明显增减。患有高血压病病史10余年，具体如现病史所述。,有消化性溃疡病史10余年，未正规治疗，近来发现有恶性淋巴瘤，已多处转移，未正规治疗。
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
    ${assert}    Create List    高血压性心脏病    心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"76","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-40行,推出疑似诊断top::妊娠剧吐,妊娠
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:停经61天，恶心、呕吐加重1天。
    #现病史值
    ${presentHistory}    Set Variable    主诉:停经61天，恶心、呕吐加重1天。
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
    ${assert}    Create List    妊娠剧吐    妊娠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-41行,推出疑似诊断top:10:肺部感染
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽4天，加剧伴喘鸣1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿4天前接触感冒的母亲及哥哥后出现咳嗽，单咳为主,不剧,白天咳嗽为主，无明显咳痰,无声嘶，无呕吐,无腹泻等不适.遂至建德第二人民医院就诊，查血常规+c反应蛋白，提示炎症指标不高，予“蒲地蓝、小儿豉翘及雾化（3天）”对症治疗，咳嗽症状未见缓解。1天前感咳嗽增多，呈阵发性，每次连咳2-3声,咳时较剧，喉间可及痰鸣音，伴有喘鸣，伴流清涕，量少，无声嘶，无鸡鸣样回勾声，无畏寒寒战，无抽搐，无呕吐，无腹泻等不适，今为求进一步治疗,来我院门诊,遂拟“肺炎”入院。发病以来，患儿反应可，吃奶可，大便较稀，尿量可，睡眠可，体重无明显下降。
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
    ${assert}    Create List    肺部感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-42行,推出疑似诊断top:5:泌尿道感染
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复尿频尿急伴下腹痛1月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1月前无明显诱因下出现尿频、尿急伴下腹部胀痛，无尿痛，偶可见肉眼血尿，与梅城二院予以检查提示：尿隐血（+++），未予特殊处理，今为进一步诊治，来我院诊治，无畏寒发热，无头晕头痛，有恶心无呕吐，无胸闷气急，无心悸咯血，无血便等，遂拟“泌尿道感染”收住入院。病来神志清，精神可，胃纳睡眠尚可，大便无殊，小便如上述，近期体重无明显改变。患者既往有“高血压”病史5余年，平素服用马来酸左旋氨氯地平片，具体不详，有“面瘫”病史5年余，“子宫切除术”、“阑尾炎”手术术后30余年，“胆结石”术后7年。
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
    ${assert}    Create List    泌尿道感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"71","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-43行,推出疑似诊断top::胆囊炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右上腹痛伴呕吐1周，再发疼痛伴尿黄1天。
    #现病史值
    ${presentHistory}    Set Variable
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
    ${assert}    Create List    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"47","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-44行,推出疑似诊断top:5:肺炎支原体性肺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽1周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿1周前无明显诱因下出现咳嗽，呈阵发性发作，有痰，不易咳出，夜间咳嗽剧烈，无发热，无声嘶，无鸡鸣样回勾声，无呕吐等不适，自行予“小儿肺咳、双扑”口服，症状未见缓解，为进一步治疗，遂至大同卫生院就诊，查肺炎支原体提示IgM弱阳性，予“阿奇霉素针”输液3天（10.10-10.13），仍有明显咳嗽。近2.3天感咳嗽增多，阵发性连咳3-4声，有痰不易咳出，夜间咳嗽多，无发热，无声嘶，无腹泻，无呕吐，无气促，无口周发绀等不适，今为求进一步治疗，至我院门诊，拟“支原体感染”收住入院。发病以来，患儿神志清,精神可，胃纳尚可，大便正常，尿量可，睡眠欠佳，体重无明显下降。
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
    ${assert}    Create List    肺炎支原体性肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"4","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}







回归测试集-45行,推出疑似诊断top:10:支气管肺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽7天，加剧2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿7天前无明显诱因下出现咳嗽，咳嗽阵发性发作，夜间较剧，咳末无鸡鸣样回勾声，无声嘶，无犬吠样咳嗽，体温正常，无畏寒暂，无抽搐，无皮疹，无恶心呕吐等情况，自备“小儿肺咳颗粒，氨酚伪麻那敏分散片”口服治疗，效果欠佳，2天前咳嗽加剧，遂于大同医院就诊，查肺支IgM弱阳性，予以阿奇霉素口服治疗2天，咳嗽无明显改善，今为求进一步治疗，遂于我院门诊，门诊拟“支原体肺炎”收入我院。患儿起病来神志清，精神尚可，胃纳可，睡眠可，大小便无殊。体重无明显变化。
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
    ${assert}    Create List    支气管肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-46行,推出疑似诊断top:5:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:认知功能减退10天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:急性起病。8小时前上厕所时突发右侧肢体无力，家属发现后扶出厕所，当时以右侧肢体无力为著，可行走，给予口服降压药物治疗，约11点吃中午饭时发现患者病情加重，右侧肢体不能活动，不能言语，病程中无恶心及呕吐，无胸闷及气短，无胸痛，无抽搐，症状持续存在，于急诊就诊，查头颅CT未见明显出血灶，予相关处理后，未见明显好转，拟“脑梗死”收入科。自病来，患者精神软，胃纳夜眠一般，大小便失禁，体重无明显减轻。既往房颤、心功能不全病史，高血压病史，长期口服降压药物，家属诉血压控制可，具体药物不详，胆囊结石、膀胱憩室、甲状腺结节病史，否认糖尿病病史，否认脑梗死病史，否认药物及食物过敏史，否认外伤史，既往因II度子宫阴道脱垂膀胱前壁膨出曾行手术治疗。
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"96","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}







回归测试集-47行,推出疑似诊断top:5:脑出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发口齿不清、左侧活动不利3小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3小时前午睡后起床，当即被发现口齿含糊不清，行走踉跄，恶心欲吐，数分钟后出现站立不稳，欲摔倒，被他人扶住，立即拨打120送入建德二院，行颅脑CT提示右侧基底节区出血，到院后患者意识不清，呼之能应，对答混乱，非喷射性呕吐数次，建德二院给予留置导尿、甘露醇125ml静滴+艾司奥美拉唑40mg静滴治疗，症状无改善，遂转入我院急诊就诊，复查颅脑CT提示右侧基底节区血肿，出血量约15-20ml，暂未达手术指征，为进一步治疗，急诊拟“脑出血”收住我科。患者自起病以来，逐渐意识障碍，未进食，大便少许，小便无异常。患者有高血压病史5年，近期在服用硝苯地平控释片30m1/日，血压控制尚可。
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
    ${assert}    Create List    脑出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"53","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-49行,推出疑似诊断top:5:2型糖尿病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:口干多饮多尿5年，视物模糊1月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者5年前无明显诱因下出现口干多饮多尿，饮水量达3000ml/日，尿量及排尿次数明显增多，体重减轻，具体不详，伴乏力，无头晕头痛，无胸闷气急等不适，来院测血糖偏高具体数值不详，诊断2型糖尿病，住院“胰岛素”治疗，出院后未监测血糖，目前“诺和灵30R 早18 晚19+拜糖平0.1g 3/日”，血糖未测。患者1月前出现视物模糊，晨起恶心，头昏，乏力，走路不稳，有泡沫尿，无呕吐，无腹痛腹胀，无腰背部疼痛等，来院要求住院治疗，拟“2型糖尿病”收住院。患者病来神清，精神可，胃纳及睡眠可，小便如上述，体重无明显变化。患者诉有扩张型心肌病3年，平素口服倍他乐克缓释片+速尿片+螺内酯片，自诉无胸闷气急。有便秘病史1年，每日一次，大便干结。
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
    ${assert}    Create List    2型糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"53","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-50行,推出疑似诊断top:5:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:头晕、左肢麻木1周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1周前开始，突感头部晕沉，无视物旋转，无恶心呕吐，无耳鸣耳痛或听力改变，同时感左侧肢体麻木，以上肢为甚，持物有不灵活感，行走略向左倾斜，无晕厥,无头痛,无咳嗽咳痰,无胸痛胸闷，无言语不清，无肢体抽搐，无饮水呛咳，无畏寒寒战，无二便失禁等，昨日来我院门诊检查，今日颅脑MR回报急性脑梗死，建议住院治疗，门诊直接拟“脑梗死”收入科。患者起病来，神清，精神软，睡眠及胃纳一般，大小便无殊，近来体重无明显变化。患者自诉有“血糖偏高”病史，具体不详。
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"71","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-51行,推出疑似诊断top:5:脑出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发右肢活动障碍4小时余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者4小时多前活动中突发右侧肢体活动不利，软瘫在地，被人发现口齿不清，恶心，非喷射性呕吐数次，无咖啡样物，无呕血，无发热，无意识不清，无晕厥，无头晕头痛，无呼吸困难，无肢体抽搐，无二便失禁，遂联系家属送入我院急诊，予吸氧、心电监护、留置导尿管，行颅脑CT检查提示：左侧基底节区脑出血破入脑室系统，脑外科会诊后考虑可暂不手术，建议先内科保守治疗，故急诊给予预防出血再发、扩血管降压、预防应激溃疡（尖吻蝮蛇血凝酶针、乌拉地尔针、奥美拉唑针）及补液等对症支持治疗，拟“脑出血”收入我科。患者起病来，嗜睡，留置导尿管带入我科，大便未解，近来体重无明显变化。患者有“高血压”病史10余年，平时不规律服用降压药，近期自行停用降压药物，具体药物不详，最高收缩压有190mmHg，平素不监测血压。既往有“脑梗死”病史8年，在中医院住院治疗，遗留左侧肢体活动不利后遗症。
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
    ${assert}    Create List    脑出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"78","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-52行,推出疑似诊断top:5:高热惊厥
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发热40小时，抽搐1次。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿38小时前明显诱因下出现发热，体温可达39.5℃，今晚抽搐1次，表现为双眼上翻，四肢强直性抽动，无大小便失禁情况，持续约1分钟发作停止，后无意识障碍，无咳嗽咳痰，无口唇发绀，无呕吐，无腹泻腹胀，无尿频，无手足硬肿，无皮疹，无结膜充血，无排尿前哭闹等。患儿发病以来，精神可，胃纳欠佳，大小便无殊，睡眠可。拟“高热惊厥？”诊断收入院。患儿起病来患儿发病以来，精神尚可，胃纳欠佳，尿量减少，体重无明显变化。
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
    ${assert}    Create List    高热惊厥
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-53行,推出疑似诊断top:5:左心室衰竭
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复胸闷、气急10余天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余天前出现反复胸闷、气急，多于活动后出现，休息后缓解，伴咳嗽、咳痰，曾在我院门诊就诊，考虑“心力衰竭慢性支气管炎伴感染”予以药物治疗无好转。近2天来感胸闷、气急加重，稍活动即可出现，夜间睡眠不能平卧，无黑懵晕厥，无胸痛咯血，今到我院急诊就诊，拟“心力衰竭肺部感染”收治入院。患者病来，神清，精神可，一般情况可，胃纳睡眠欠佳，二便如常，近期体重无明显增减。
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
    ${assert}    Create List    左心室衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"67","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-54行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复咳嗽咳痰20余年，气急5年，再发伴发热2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者20余年前始受凉后反复出现咳嗽咳痰，白痰，多于冬春季多发，每年发作达3月以上，曾在当地医院及本院就诊，诊断：慢性阻塞性肺病急性加重、慢性肺源性心脏病、心力衰竭，经相应治疗好转，平素长期家庭氧疗，予“噻托溴胺粉吸入剂，布地奈德福莫特罗粉吸入剂”扩张支气管治疗。2天前受凉后出现咳嗽咳痰增多，为白痰，气急明显，畏寒寒战、发热。无胸痛咯血盗汗；无恶心呕吐；无头痛晕厥；无嗜睡。于今日我院急诊，急查CT胸部(两肺、纵隔)CT平扫报告 2018/10/15 1:03:29 检查结果:左肺尖后段恶性肿瘤，对比前片（2018-07-24）增大。两侧支气管炎、肺气肿；右肺上叶感染；纵隔主动脉弓旁淋巴结及左肺门淋巴结增大，较前片相仿；主动脉弓壁钙化，冠脉少许钙化。遂急诊拟“慢性阻塞性肺疾病急性加重，II型呼吸衰竭”收住入院继续治疗。 发病来神清，精神软，食欲一般，睡眠可，二便如常，体重无明显改变。有长期抽烟史，戒烟10余年。4年前在本院住院诊断“2型糖尿病 糖尿病伴肾并发症 肾功能异常”。1年前本科住院，诊断为“脂肪肝、前列腺增生，双侧颈动脉硬化 双下肢动脉粥样硬化肺恶性肿瘤可能
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-55行,推出疑似诊断top:5:胎膜早破
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:停经41周，阴道流液伴见红2余小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:该孕妇平素月经规则，周期30天，经期6天，量及性状正常，无痛经，白带无殊。末次月经2018-1-1，量及性状同前，预产期2018-10-8，停经1月余测尿妊娠试验（HCG）“阳性”，停经2月余查B超提示“宫内单活胎”。孕2+月因少量阴道出血予中药间断保胎治疗。孕早期无恶心呕吐等早孕反应。孕11周建围产期保健卡，定期产检，孕早期无恶心、呕吐等早孕反应，无毒物、放射线接触史，无病毒感染史。孕期定期产检，孕期早筛中筛胎儿NT检查未见明显异常，孕期三维B超未及明显胎儿异常，孕期糖耐提示血糖正常范围。胎心胎动血压未见明显异常。孕4+月始自觉胎动，持续至今均良好。孕中晚期无头昏胸闷、皮肤巩膜黄染等不适，双下肢无明显水肿。孕34+周因胎心监护不达标在本院住院治疗，过程顺利。2小时余前感阴道流液伴见红，无下腹痛，自觉胎动如常，拟“胎膜早破，单胎孕1产0孕41周左枕前待产”入院。孕来，神志清，精神可，胃纳可，大小便无殊，睡眠安，体重增加10.5公斤。
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
    ${assert}    Create List    胎膜早破
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"26","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-55行,推出疑似诊断top:10:足月临产
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:停经41周，阴道流液伴见红2余小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:该孕妇平素月经规则，周期30天，经期6天，量及性状正常，无痛经，白带无殊。末次月经2018-1-1，量及性状同前，预产期2018-10-8，停经1月余测尿妊娠试验（HCG）“阳性”，停经2月余查B超提示“宫内单活胎”。孕2+月因少量阴道出血予中药间断保胎治疗。孕早期无恶心呕吐等早孕反应。孕11周建围产期保健卡，定期产检，孕早期无恶心、呕吐等早孕反应，无毒物、放射线接触史，无病毒感染史。孕期定期产检，孕期早筛中筛胎儿NT检查未见明显异常，孕期三维B超未及明显胎儿异常，孕期糖耐提示血糖正常范围。胎心胎动血压未见明显异常。孕4+月始自觉胎动，持续至今均良好。孕中晚期无头昏胸闷、皮肤巩膜黄染等不适，双下肢无明显水肿。孕34+周因胎心监护不达标在本院住院治疗，过程顺利。2小时余前感阴道流液伴见红，无下腹痛，自觉胎动如常，拟“胎膜早破，单胎孕1产0孕41周左枕前待产”入院。孕来，神志清，精神可，胃纳可，大小便无殊，睡眠安，体重增加10.5公斤。
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
    ${assert}    Create List    足月临产
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"26","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-56行,推出疑似诊断top::胆囊结石,胆囊炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复上腹疼痛1月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1月余前无明显诱因下反复出现上腹疼痛不适，呈持续性胀痛，无放射痛，程度不剧可以忍受，休息后可自行缓解，无恶心呕吐，无胸闷胸痛，无畏寒发热，肛门排气排便通畅，后腹痛自行缓解，期间未再发腹痛不适，今患者为求诊治，来我院就诊，拟“胆囊结石伴慢性胆囊炎”收治入院。患者起病来，神清，精神可，胃纳及睡眠尚可，大小便无殊，近期体重无明显变化。
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
    ${assert}    Create List    胆囊结石    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}







回归测试集-57行,推出疑似诊断top:5:胆囊结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:上腹胀痛4天伴恶心。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者4天前无明显诱因下感上腹部胀痛不适，呈持续性，疼痛尚可忍受，无其他处转移痛，无放射痛，有明显恶心，有腹泻3次，为水样稀便，自感四肢厥冷，无畏寒发热，无头晕头疼，无呕吐，无反酸嗳气，无呕血黑便，无腹胀，无胸痛心悸，无胸闷气急，无咳嗽咳痰，无四肢乏力，无四肢麻木，无尿频尿急，遂至我院急诊就诊，予以止痛抗炎解痉等对症治疗后，患者腹部胀痛缓解。患者为求进一步治疗，今至我院门诊就诊，为求进一步诊治，拟“胆囊结石伴慢性胆囊炎”收住入院。患者起病来，神清，精神可，胃纳及睡眠尚可，大小便无殊，近期体重无明显变化。既往高血压10年，具体用药不详，控制情况不详。发现糖尿病一周，具体用药不详。发现甲状腺功能减退3年，具体用药不详。发现心率不齐3年，具体用药不详。
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
    ${assert}    Create List    胆囊结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-57行,推出疑似诊断top:10:胆囊炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:上腹胀痛4天伴恶心。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者4天前无明显诱因下感上腹部胀痛不适，呈持续性，疼痛尚可忍受，无其他处转移痛，无放射痛，有明显恶心，有腹泻3次，为水样稀便，自感四肢厥冷，无畏寒发热，无头晕头疼，无呕吐，无反酸嗳气，无呕血黑便，无腹胀，无胸痛心悸，无胸闷气急，无咳嗽咳痰，无四肢乏力，无四肢麻木，无尿频尿急，遂至我院急诊就诊，予以止痛抗炎解痉等对症治疗后，患者腹部胀痛缓解。患者为求进一步治疗，今至我院门诊就诊，为求进一步诊治，拟“胆囊结石伴慢性胆囊炎”收住入院。患者起病来，神清，精神可，胃纳及睡眠尚可，大小便无殊，近期体重无明显变化。既往高血压10年，具体用药不详，控制情况不详。发现糖尿病一周，具体用药不详。发现甲状腺功能减退3年，具体用药不详。发现心率不齐3年，具体用药不详。
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
    ${assert}    Create List    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-58行,推出疑似诊断top:5:鼻咽恶性肿瘤,鼻息肉
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右鼻出血1年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1年前无明显诱因下自感出现右侧鼻出血及鼻塞，每次出血量不多，无嗅觉下降，无头晕头痛，无鼻腔恶臭，无胸痛胸闷。一直未重视未诊治，症状持续并逐渐加重。2天前来我院耳鼻咽喉科门诊就诊，行鼻内镜及鼻窦CT检查，建议住院手术治疗；今为求进一步诊治，门诊拟鼻腔肿物、高血压病予以收入住院手术治疗。起病来，患者神志清，精神可，大小便无殊，胃纳无影响，夜眠欠佳，体重无明显变化。
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
    ${assert}    Create List    鼻咽恶性肿瘤    鼻息肉
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"56","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-59行,推出疑似诊断top:5:输尿管结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复右侧腰腹部疼痛1月余，加重1周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于1月余前感右腰腹疼痛，为持续性胀痛，阵发性加重，伴恶心，无畏寒发热，无胸闷气急，曾到我院就诊，查B超提示：“泌尿系结石”，予以解痉止痛治疗，当时症状好转，1月来上述症状反复发作，1周前疼痛加重，余症状同前，现为进一步诊治遂来我院，拟“右输尿管结石”收入住院。自起病以来，患者神志清，精神软，胃纳睡眠差，二便难解，体重无明显增减。
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
    ${assert}    Create List    输尿管结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"54","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-60行,推出疑似诊断top:10:耳源性眩晕,梅尼埃病,良性阵发性眩晕,前庭周围性眩晕
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:头晕2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2天前无明显诱因下突发头晕，视物旋转，恶心呕吐胃内容物数次，闭眼卧位休息后好转，不敢睁眼，改变头位时头晕加重，头晕持续时间较长，约1-2小时后稍缓解，能睁眼及翻身、坐起，无新发耳鸣、听力减退，无意识丧失，无畏寒寒战，无肢体抽搐，无大小便失禁等，遂来我院门诊就诊，查头颅CT提示未见明显异常，门诊未予特殊用药，直接拟“眩晕综合征”收入住院。发病来，神清，精神差，胃纳差，睡眠一般，大小便无殊，体重无明显改变。既往发现高血压病史20年，最高收缩压达200mmhg，平素未服降压药物，自诉血压控制可。糖尿病5年，自服二甲双胍1g 每日二次，阿卡波糖 100g 每日三次，血糖控制差。
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
    ${assert}    Create List    耳源性眩晕    梅尼埃病    良性阵发性眩晕    前庭周围性眩晕
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"55","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-61行,推出疑似诊断top:5:输尿管结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右侧输尿管支架置入术后2周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2周前在我院住院治疗，当时诊断：双侧输尿管结石,肾功能异常。排除手术禁忌症后于2018-10-4日在局麻下行输尿管支架置入术，无畏寒发热，无胸闷气急，无尿痛，今为进一步治疗，门诊拟“输尿管结石”收治入院。自起病以来，患者神志清，精神好，胃纳睡眠佳，二便无殊，体重无明显增减。
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
    ${assert}    Create List    输尿管结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"男","age":"27","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-62行,推出疑似诊断top:5:单纯性下肢静脉曲张
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发现双侧下肢静脉曲张7年,伴溃疡形成3月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于7年前无明显诱因下发现双下肢静脉呈蚓状隆起，无酸胀麻木，无红肿瘙痒，无发热，无溃疡，未予以重视。期间静脉隆起逐渐加重，久站后偶有酸胀不适，1年前发现双下肢出现色素沉着，无酸胀麻木，无红肿瘙痒，无发热，无溃疡。3个月前患者左下肢踝附件出现核桃大小溃疡病灶，结痂后经久不愈，近来感左下肢胀痛不适，故来我院就诊，拟“右下肢静脉曲张”收住入院。患者发病以来,神清精神可,胃纳睡眠可，二便如常，体重无明显变化。
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
    ${assert}    Create List    单纯性下肢静脉曲张
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"44","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-63行,推出疑似诊断top:10:足月临产
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:停经39+周，要求入院待产。
    #现病史值
    ${presentHistory}    Set Variable    现病史:该孕妇平素月经规则，周期30天，经期4天，量及性状正常，无痛经，白带无殊。末次月经2018-1-11，量及性状同前，预产期2018-10-18。停经1月余测尿妊娠试验（HCG）“阳性”，停经2月余查B超提示“宫内单活胎”。早孕经过顺利，孕早期恶心呕吐明显，未予特殊处理，孕4+月后自行好转。孕期无毒物、放射线接触史，无病毒感染史。孕8+周建有保健卡，定期产检，胎心胎动血压未见明显异常。孕4+月始自觉胎动，持续至今均良好。孕中晚期无头昏胸闷、皮肤巩膜黄染等不适，双下肢无明显浮肿。孕期行胎儿NT正常，无创DNA提示低风险，孕期空腹糖耐量试验正常范围。停经32+周建德市妇保院产检查B超提示胎儿双顶径较实际孕周大，患者至浙江省妇保就诊，查磁共振提示“胎儿双顶径及头围大于孕周，股骨长与孕周大致相符”，未予特殊处理。现偶感下腹隐痛，无阴道流血流液，无胸闷气急，无恶心呕吐等不适，自觉胎动可，要求入院待产，拟“单胎 孕2产0孕39+周LOA待产”入院。孕来，神志清，精神可 ，胃纳可，大小便无殊，睡眠安，体重增加10公斤。
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
    ${assert}    Create List    足月临产
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"25","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-64行,推出疑似诊断top:5:心绞痛,不稳定型心绞痛
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复胸痛2月余，再发12小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2月前始出现胸痛，为左胸前阵发性压榨性疼痛不适，持续时间长短不一，与活动无关。12小时前，患者劳累后再发胸痛一次，伴背部放射痛，持续数分钟可缓解，无大汗，无胸闷气闭，无黑懵晕厥，无夜间阵发性呼吸困难，门诊拟“心绞痛”收住入院。患者病来，神清，精神可，一般情况可，胃纳睡眠欠佳，二便如常，近期体重无明显增减。
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
    ${assert}    Create List    心绞痛    不稳定型心绞痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-65行,推出疑似诊断top:5:支气管炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:因“咳嗽、痰鸣5天”入院。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿5天前无明显诱因下咳嗽，咳嗽呈阵发性，每次咳2-3声，伴喉头痰鸣声，稍鼻塞、流涕，无气促、气喘，无口周发绀，咳末无鸡鸣样回勾声，无异物吸入史，无肺结核病人密切接触史，无咯血。无发热，无呕吐、腹泻，无阵发性哭吵，无抽搐、昏迷，无皮疹，无血尿、浮肿，无排尿前哭闹等情况。来我院就诊，门诊予口服小儿肺咳、蒲地蓝，并予雾化治疗2天，咳嗽好转，今为进一步就诊，拟以“支气管炎”收住入院。发病以来，患儿精神软，胃纳欠佳，大便正常，尿量可，睡眠欠佳，体重无明显变化。
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
    ${assert}    Create List    支气管炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-66行,推出疑似诊断top:10:急性阑尾炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右下腹疼痛3小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于3小时前始无明显诱因下感右下腹疼痛，胀痛，阵发性加重，无他处放射痛，伴恶心呕吐一次，为胃内容物，有发热，无畏寒，无腹泻便秘，无胸闷气急，无胸痛心悸，无咳嗽咳痰，无尿频尿急尿痛等不适，疼痛不能忍受，现来本院急诊。急诊CT检查提示：阑尾增粗，急诊予以对症治疗后，拟以急性阑尾炎收入我科，进一步检查治疗。患者发病以来，神清精神软，纳差、睡眠差，解糊状大便一次，体重无明显变化。
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
    ${assert}    Create List    急性阑尾炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-67行,推出疑似诊断top:10:急性阑尾炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右下腹痛8小时余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者8小时前无明显诱因下突发右下腹痛，呈持续性钻孔样，无放射痛，无阵发性性加重，有恶心呕吐，呕吐5次，为胃内容物，感腹胀，有寒战发热，无腹泻，无头晕头痛，无胸闷气急，无咳嗽咳痰，无反酸嗳气，无呕血黑便，无四肢麻木，无四肢抽搐，不能忍受，现入我院急诊接受诊疗，腹部CT提示：急性阑尾炎。急诊拟以急性阑尾炎收治入院，拟以急诊手术治疗。患者发病以来，神清精神软，纳差、睡眠差，二便如常，体重无明显变化。
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
    ${assert}    Create List    急性阑尾炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"29","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-68行,推出疑似诊断top:5:急性支气管炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽10余天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿10余天前无明显诱因下出现咳嗽，单咳为主，不剧，无明显咳痰，伴鼻塞，无明显流涕，昼夜无明显差别，无发热,无声嘶，无鸡鸣样回勾声，无恶心呕吐,无腹泻等不适,遂至当地卫生院就诊,予小儿肺咳、蒲地蓝等止咳药物及雾化对症治疗,后感咳嗽加剧，阵发性咳嗽，有痰不易咳出，伴流涕，量少，无发热，无声嘶，无气促，无喘鸣等不适，至我院门诊就诊，予头孢克肟25mg，BID口服三天，症状未见明显好转，今为求进一步治疗，来我院门诊复查，门诊拟哮喘性支气管炎入院。发病以来，患儿反应可，吃奶可，大便正常，尿量可，睡眠可，体重无明显下降。
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
    ${assert}    Create List    急性支气管炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-69行,推出疑似诊断top:10:乳房恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发现乳房肿块半年余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者半年前无意中发现左侧乳房一肿块，约花生米大小，触摸时无感疼痛，无畏寒发热，无咳嗽咳痰，无胸闷气急，无乳头溢液，无腹痛腹胀，无尿频尿频，未予重视。后感肿块逐渐增大，伴左侧腋窝疼痛，无其他处放射痛，无畏寒发热，无胸闷气急，无咳嗽咳痰，无进食困难，无尿频尿急，遂来我院就诊，予以CT检查，CT检查提示：左乳腺肿块伴腋窝多发肿大淋巴结，皮下软组织水肿，建议专项检查。拟以左乳房肿块收入我科。患者自起病以来，精神、睡眠、食欲可，大小便无异常，体重无明显变化。既往有高血压病史14年，具体用药不详，控制情况不详;。
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
    ${assert}    Create List    乳房恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-70行,推出疑似诊断top:5:面神经麻痹
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:头晕、口角歪斜20天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者20天前无明显诱因出现口角歪斜，左眼闭合不紧，左眼流泪，鼓腮漏气，食物易残存于齿龈与颊部之间，感头晕，无恶心呕吐，无耳鸣耳痛，无听力改变，无肢体麻木乏力等，曾在当地卫生院行针灸治疗，面瘫稍有好转，但仍感头昏，遂于今来我院门诊就诊，门诊直接拟面神经麻痹收入院。患者自起病以来，精神尚可，睡眠可，未进食，大便少许，小便无异常。
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
    ${assert}    Create List    面神经麻痹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-71行,推出疑似诊断top:10:支气管肺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽3天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿3天前出现咳嗽，咳嗽阵发性发作，夜间咳嗽明显，时而有气促，喉头有痰，无气喘，咳末无鸡鸣样回勾声，无声嘶，无鸡鸣样回勾声，无发热，无抽搐，母乳喂养，无少吃，无恶心呕吐，无腹痛腹泻等情况，今来我院，予支气管肺炎住院治疗.发病以来，患儿精神软，胃纳欠佳，大便正常，尿量可，睡眠佳，体重无明显变化。
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
    ${assert}    Create List    支气管肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-72行,推出疑似诊断top:5:股骨颈骨折
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:跌伤致左髋疼痛、活动受限5小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者诉约5小时前上班途中跌倒致左髋疼痛、活动受限，无法站立与行走。伤后无昏迷，无胸闷气急，无腹痛腹胀，无恶心呕吐等不适。遂来我院急诊就诊，查骨盆CT示左股骨颈骨折，需行手术治疗，急诊给予卧床、止痛、活血等对症处理。后拟左侧股骨颈骨折收入我科。外伤以来，神清，精神可，未进食，无睡眠，小便如常，大便未解，近期体重无明显变化。
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
    ${assert}    Create List    股骨颈骨折
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"32","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-73行,推出疑似诊断top:5:支气管肺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复咳嗽1月余，加剧2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿1月前无明显诱因下出现咳嗽，有痰，不易咳出，少量流清涕。咳嗽为3、4声连咳,剧烈,无咳末鸡鸣样回购声，无气喘。无发热，无气急,无口唇发绀，无结膜充血，无腹痛腹胀，无呕吐腹泻，无皮肤瘀点瘀斑，无尿频尿急等不适。在本院门诊治疗，先后共口服阿奇霉素5天，及止咳药治疗，咳嗽较前好转，近2天咳嗽再次加剧，无胸闷、气喘，来本院复诊，门诊拟支气管肺炎入院。发病以来，患儿精神可，胃纳睡眠一般，大便正常，尿量可，体重无明显下降。
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
    ${assert}    Create List    支气管肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-74行,推出疑似诊断top:5:肾结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复右腰腹部疼痛10年余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前无明显诱因下出现右侧腰腹部疼痛，呈持续性，伴肉眼血尿，伴恶心，无呕吐，无畏寒发热，无胸闷气急，患者未重视，未就诊，10年来上述症状反复发作，症状未缓解，遂来我院，查CT提示：“右肾多发结石”，现为进一步处理，拟“右侧肾结石”收治入院。自起病以来，患者神志清，精神软，胃纳睡眠差，二便难解，体重无明显增减。患者既往有高血压病史，平时服药治疗，具体不详。
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
    ${assert}    Create List    肾结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"75","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-75行,推出疑似诊断top:5:变应性鼻炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:双鼻塞流涕10余年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前无明显诱因下出现双侧鼻塞，呈持续性，伴流涕，白色清涕为主，喷嚏多，无嗅觉下降，无头晕头痛，无恶心呕吐，无鼻出血，无其他明显特殊不适，未重视。10余年来鼻塞流涕反复发作，10天前至我院门诊就诊，查CT示：双侧筛窦炎症；两侧鼻甲、鼻中隔粘膜增厚。考虑变应性鼻炎，建议手术。门诊拟变应性鼻炎收住。起病来，患者神志清，精神可，大小便无殊，胃纳无影响，夜眠欠佳，体重无明显变化。患高血压10余年，服用硝苯地平片30mg一次/日口服治疗，患糖尿病10余年，服用二甲双胍1g二次/日，格列宁60mg二次/日。
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
    ${assert}    Create List    变应性鼻炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"70","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}







回归测试集-76行,推出疑似诊断top:10:子宫内膜息肉
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:异常阴道出血19天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者平素月经规则，周期30天，经期5天，量中等，性状正常，无痛经。末次月经2018-9-26，19天前出现阴道出血，量多，伴血块，一天用7-8片卫生巾，未湿透。11天前至我科门诊就诊，查B超示：子宫附件未见明显异常;内膜双层厚约7.7mm，予葆宫止血颗粒及裸花紫珠胶囊口服止血治疗，阴道出血减少，但淋漓不净，无明显腹痛，无头晕头痛，无发热畏寒，无恶心呕吐，无肛门坠胀等不适。昨日至我科门诊就诊，查血常规示：血红蛋白110g/L，查B超示：宫内偏强回声团,内膜息肉样变？内膜双层厚约12.9mm，建议住院治疗。今日来我科要求住院，门诊拟子宫内膜息肉可能，子宫内膜增厚收住入院。自起病来，患者神志清，精神可，大小便无殊，胃纳无影响，夜眠佳，体重无明显变化。

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
    ${assert}    Create List    子宫内膜息肉
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-77行,推出疑似诊断top:5:前列腺增生
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:尿频尿急进行性排尿困难1年余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1年余前出现尿频，白天3-4次，晚上2-3次，伴尿急、排尿费力、尿线变细、射程变近，排尿滴沥，无畏寒发热，无胸闷气急，无恶心呕吐，当时未给予重视，今为进一步治疗，遂来我院，门诊拟前列腺增生收住入院。自起病以来，患者神志清，精神软，胃纳睡眠欠佳，大便难解，小便如上诉，体重无明显增减。
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
    ${assert}    Create List    前列腺增生
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-78行,推出疑似诊断top:5:面神经麻痹
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:口角歪斜8小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者半天前睡醒后发现口角歪斜，右侧口角流涎，笑时口角歪向左侧，右眼闭合无力，无头痛头晕，无恶心呕吐，无耳鸣耳痛，无听力改变，无肢体麻木乏力，遂来门诊就诊，门诊行颅脑CT检查，提示：两侧大脑半球对称，颅脑实质密度均匀，未见明显异常密度影，脑室系统未见扩大，脑沟未见明显增宽，中线结构居中。检查结果:颅脑CT平扫未见明显异常。门诊未行相关处理，直接拟 面神经麻痹高血压病。发病以来神清精神软，食欲可，未睡，二便如常，体重无明显改变。
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
    ${assert}    Create List    面神经麻痹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-79行,推出疑似诊断top:5:急性乳腺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:产后16天，乳腺胀痛1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于16天前平产一子，母乳喂养，患者1天来出现乳房胀痛，伴发热，自测最高体温38.9度，无畏寒晕厥，无鼻塞流涕，无腹痛腹胀，无恶心、呕吐，无尿频尿痛等不适，遂来我院就诊，查血常规+CRP提示:白细胞 13.6 10^9/L;中性粒细胞% 87.3 %;C反应蛋白 61.48 mg/L;检查乳腺彩超提示：双乳外形无殊，左右对称，双乳乳腺组织增厚，乳腺导管扩张,内有液体状中等回声充填，内未及异常占位性病变。门诊拟 急性乳腺炎 收住入院。患者病来，一般情况可，胃纳好，大小便正常。
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
    ${assert}    Create List    急性乳腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-80行,推出疑似诊断top:5:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发口齿不清、右手欠灵活2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2天前夜间突发口齿不清，家人可模糊理解其含义，感右手欠灵活，表现为持筷不稳，无肢体抽搐，无意识不清，无恶心呕吐，症状持续，1天前症状加重，伴流涎不止，今门诊就诊，查头颅MR提示左侧放射冠区新近脑梗塞；右侧基底节区软化灶；血压：170/103mmHg，感口齿不清略好转，未进一步治疗，拟“脑梗死”收入科。起病以来，神清，精神软，胃纳可，睡眠可，二便无殊。近期体重未及明显减轻。中年男性，既往有脑梗死病史4年，未遗留明显运动及语言功能障碍，半年前自行停用阿司匹林肠溶片+阿托伐他汀钙片，长期服用血栓通及其他消炎药物（具体不详）。既往4年前有脑外伤病史，未手术。
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-81行,推出疑似诊断top:5:蛛网膜下出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发头痛，伴恶心、呕吐4天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于4天前无明显诱因突发头痛，并恶心、呕吐数次，为胃内容物，无肢体抽搐及意识不清发作，无二便失禁，无胸闷、胸痛、心悸、气促、腹胀、腹痛等不适，遂到我院急诊科就诊，急诊予头颅CT检查示蛛网膜下腔出血，予使用,纳美芬针、苏灵针等药后转浙二医院治疗，于2018.10.12-10.15在浙二医院住院治疗（行脑CTA及DSA检查未见动脉瘤及血管畸形），于今转我院，门诊拟自发性蛛网膜下腔出血收入住院，患者目前诉感头痛明显，感恶心、无呕吐，患者病程中无明确昏迷史，起病来精神软，食纳睡眠欠佳，留置导尿尿色清，大便未解。
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
    ${assert}    Create List    蛛网膜下出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"64","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-82行,推出疑似诊断top:5:胆囊炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:中上腹部胀痛伴呕吐6小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于6小时前无明显诱因下出现上腹部疼痛，呈持续性胀痛，进行性加重，向腰背部放射，伴恶心欲吐，呕吐物为胃内容物，无呕血，无畏寒发热，无胸闷胸痛，无腹泻，无呕血黑便，无晕厥等症状，遂来我院，考虑 腹痛，急性胆囊炎 收住院治疗。患者起病来，神清，精神可，胃纳及睡眠尚可，大小便无殊，近期体重无明显变化。
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
    ${assert}    Create List    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-83行,推出疑似诊断top:10:不稳定型心绞痛
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:胸闷、气促伴双下肢浮肿4天。现病史:患者4天前始出现阵发性胸闷，位于心前区后方，巴掌大范围，呈憋闷感，向下颌部放射，多于体力活动时或赶路时出现，休息半小时可缓解，伴双下肢浮肿，需高枕卧位休息，无寒战发热，无明显心悸胸痛，无咳嗽咳痰，无黑朦晕厥，无腹痛腹胀，开始未重视，在家休息上述症状未见好转，今来我院急诊就医，拟冠心病？高血压并心功能不全住院。患者病来神清，精神可，二便无殊，胃纳及睡眠一般，体重无明显变化。既往有高血压病2年余，定期服药治疗（复方利血平）。
    #现病史值
    ${presentHistory}    Set Variable
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
    ${assert}    Create List    不稳定型心绞痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-83行,推出疑似诊断top:10:不稳定型心绞痛
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:胸闷、气促伴双下肢浮肿4天。现病史:患者4天前始出现阵发性胸闷，位于心前区后方，巴掌大范围，呈憋闷感，向下颌部放射，多于体力活动时或赶路时出现，休息半小时可缓解，伴双下肢浮肿，需高枕卧位休息，无寒战发热，无明显心悸胸痛，无咳嗽咳痰，无黑朦晕厥，无腹痛腹胀，开始未重视，在家休息上述症状未见好转，今来我院急诊就医，拟冠心病？高血压并心功能不全住院。患者病来神清，精神可，二便无殊，胃纳及睡眠一般，体重无明显变化。既往有高血压病2年余，定期服药治疗（复方利血平）。
    #现病史值
    ${presentHistory}    Set Variable
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
    ${assert}    Create List    不稳定型心绞痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-84行,推出疑似诊断top:5:股骨颈骨折
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:跌倒致左髋疼痛活动受限13天。现病史:患者13天前走路时不慎跌倒，致左髋部疼痛、活动受限，无法站立，无神志不清史，无恶心无呕吐，无胸闷气促，无腹痛腹胀，无四肢抽搐，无大小便失禁，未予重视，症状无明显缓解，今日于当地医院拍片示左股骨颈骨折，为求进一步诊治来我院急诊，拟左股骨颈骨折收入我科。患者自受伤以来，神志清，精神软，胃纳可，睡眠可，大小便无殊，近期体重无明显减轻。
    #现病史值
    ${presentHistory}    Set Variable
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
    ${assert}    Create List    股骨颈骨折
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"78","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-85行,推出疑似诊断top:5:良性阵发性眩晕
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复头晕10余年,再发1年，加重10天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前无明显诱因下出现头晕，视物旋转，恶心呕吐胃内容物数次，闭眼卧位休息后好转，每次头晕持续数秒钟，改变头位时头晕发作，无耳鸣、听力减退，无意识丧失，无畏寒寒战，无肢体抽搐，无大小便失禁等，曾在邵逸夫诊治，诊断及治疗不详，予相应治疗后好转。1年前开始，患者头晕再发，但无视物旋转，多为一过性，偶有恶心感，症状时轻时重。10天前症状有所加重，遂来院就诊。门诊未予相关检查及对症处理，直接拟收治入院。发病来，神清，精神可，胃纳睡眠一般，大小便无殊，体重无明显改变。发现血压偏高5年，收缩压最高170mmHg，未用药，血压略偏高。
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
    ${assert}    Create List    良性阵发性眩晕
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-86行,推出疑似诊断top:5:前列腺增生
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:尿频尿急进行性排尿困难5年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者5年前出现尿频，白天3-4次，晚上4-5次，伴尿急、排尿费力、尿线变细、射程变近，无头晕头痛，无恶心呕吐，无畏寒发热，无咳嗽咳痰，无胸闷气促，一直未予重视，近来感尿频明显，伴尿痛，今为进一步治疗，拟前列腺增生收住入院。患者自起病来，神清，精神可，胃纳睡眠可，大便无殊，小便如上述患者既往有高血压病及冠脉支架置入病史，平时服药治疗，具体不详。5年余前外伤致右侧肋骨骨折病史2015年及2014年曾在杭州邵逸夫医院行PCI术。
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
    ${assert}    Create List    前列腺增生
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"85","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-87行,推出疑似诊断top:10:支气管扩张,肺恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咯血6天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者6天前无明显诱因下出现咯血，色鲜红，量约30-40ml，无胸痛，无胸闷气急，无咳嗽咳痰，无畏寒发热，无头晕头痛，无晕厥，无腹痛腹泻等不适，曾至当地卫生院配药治疗，效果欠佳，遂来我院门诊就诊，要求直接入院检查，故拟咯血待查收住入院。起病来神清，精神软，胃纳及睡眠一般，大小便正常，近期体重无明显变化。
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
    ${assert}    Create List    支气管扩张    肺恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-88行,推出疑似诊断top:5:急性冠脉综合征
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:胸闷、胸痛4小时余。
    #现病史值
    ${presentHistory}    Set Variable
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
    ${assert}    Create List    急性冠脉综合征
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"81","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-89行,推出疑似诊断top:5:蛛网膜下出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发头痛意识障碍5小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者5小时前无明显诱因下出现头痛，疼痛较剧烈，具体性质及部位叙述不清，意识水平下降，无明显呕吐，无大小便失禁，有家属拨打120送来我院急诊，急诊头颅CT提示蛛网膜下腔出血，右侧鞍上池动脉瘤可能。诊断考虑蛛网膜下腔出血高血压病，脑外科会诊后指出有手术指征，可行DSA检查及动脉栓塞术，家属综合考虑后要求保守治疗，且拒绝转杭州上级医院，故急诊予止血(尖吻蝮蛇血凝酶2单位+氨甲环酸氯化钠1g静脉注射)、控制血压、护胃（艾司奥美拉唑钠40mg静滴）等治疗后，拟脑血管意外高血压收入我科保守治疗。急性起病。发病来神志模糊，精神软，睡眠不佳，食欲一般，二便如常，体重无明显改变。患者高血压病史3年，自行服用吲达帕安片1#每日一次，平素血压未规律监测，控制情况不详。
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
    ${assert}    Create List    蛛网膜下出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"84","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-90行,推出疑似诊断top:5:脑出血
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:突发右肢活动障碍1月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1月前于活动中急性起病，突发全头刀割样疼痛，伴有恶心、欲呕，持续约半小时左右，自服藿香正气水1支，用药后呕吐1次，非喷射样，呕吐物为胃内容物，量约30ml，无咖啡样液。呕吐后头痛，恶心明显减轻，继续上班工作。1月来头痛持续性存在，程度与活动强度呈正相关性，头痛重时为全头痛中度胀痛，卧床休息时头痛最轻，主要为后枕部隐约胀痛。无发冷发热，无颈、背部疼痛，未出现意识不清、言语不利及肢体乏力、麻木等症状。今晨在本市电力医院就诊，做头颅CT（2017.05.11片号C598335）报：左侧脑室出血，三、四脑室内出血，蛛网膜下腔出血可能。电力医院医生建议转诊我院，予2018.09.18我院我科住院治疗，诊断脑出血，高血压病，低钾血症，肝功能异常”，药物上予甘露醇、马来酸左旋氨氯地平、厄贝沙坦、护肝片、文飞”等对症支持治疗。患者肢体活动障碍明显缓解，今为周转，拟脑出血”再次收治入院。病来神清，精神一般，睡眠尚可，食欲一般，二便如常，体重无明显改变。
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
    ${assert}    Create List    脑出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-91行,推出疑似诊断top:5:糖尿病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:体检发现血糖升高1月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1月前体检发现空腹血糖12.24mmol/L，当时餐后血糖未测，无明显口干多饮、手脚麻木、视物模糊，无胸闷冷汗、头晕头痛，无咳嗽咳痰、腹痛腹泻等不适，予饮食控制，1天前复查空腹血糖11.29mmol/L，餐后2小时血糖21.45mmol/L，尿酮体阴性，目前无口干多饮、视物模糊等情况，为进一步诊治，门诊拟2型糖尿病收住入院。病来神清，精神可，胃纳睡眠可，二便无殊，近期体重无明显变化。
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
    ${assert}    Create List    糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-92行,推出疑似诊断top:10:胫骨骨折
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:外伤致右踝部肿痛、畸形2小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2小时前不慎被钢板砸伤右踝部，肿痛明显，伴畸形，无明显出血，无畏寒发热，无恶心呕吐，无头痛头晕，无胸闷气急等；遂来我院急诊就诊，急诊右踝关节CT薄层平扫+三维重建检查报告提示：右侧胫腓骨下段骨折，踝关节半脱位考虑。予镇痛、补液等对症处理，拟以胫骨骨折收入我科住院治疗。患者自起病以来，神清，精神软，胃纳睡眠尚可，二便如常，近来体重无明显减轻。
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
    ${assert}    Create List    胫骨骨折
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-93行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复咳嗽咳痰气急10余年，加重20天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前起反复出现咳嗽咳痰气急，冬春季节受凉后易发作，每年持续时间累计达3月以上，曾多次在建德市中医院住院，诊断慢性阻塞性肺疾病、慢性肺源性心脏病，经治疗后好转，多次因症状再发在我院住院,最近一次为2018.09.02至09.06日，诊断为慢性阻塞性肺病慢性肺源性心脏病呼吸衰竭心房颤动心功能不全高血压病，予住院药物治疗好转出院。20天前患者过量服用中药后出现乏力明显，胸闷气急加重，伴下肢浮肿，口唇发绀，咳嗽咳痰，腹胀不适，无呕吐，无腹泻，无畏寒发热，在我院ICU住院治疗，予气管切开、平喘及抗感染等治疗后，气急较前好转，现仍有咳嗽咳痰，无畏寒发热，无腹痛腹胀，无恶心呕吐，故今拟慢性阻塞性肺疾病急性加重慢性肺源性心脏病，中药中毒转至我科继续治疗。起病来神清，精神软，胃纳及睡眠一般，大小便正常，近期体重无明显变化。既往有高血压病史3年，最高收缩压达180mmHg以上，平时服药治疗，血压控制可。
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"61","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-94行,推出疑似诊断top:5:前列腺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:尿频尿急尿痛伴畏寒发热3天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3天前无明显诱因下出现尿频、尿急、尿痛，伴畏寒发热及排尿困难，体温未测，无恶心呕吐，无胸闷气促，无咳嗽咳痰，无腰部疼痛，未治疗，病情无好转，今为进一步诊治，来我院门诊，血常规提示白细胞22.8*10^9/L;中性粒细胞%89.2%;血红蛋白152g/L;C反应蛋白116.08mg/L;尿常规提示红细胞20.0/HPF;白细胞198.0/HPF;总前列腺特异性抗原55.930ng/ml;游离前列腺特异性抗原21.060ng/ml;fpsa/TPSA0.38;门诊拟急性前列腺炎收住入院。患者自起病来，神清，精神可，胃纳睡眠可，大便无殊，小便如上述患者既往有高血压病病史，平时服用硝苯地平缓释片及厄贝沙坦片治疗，具体不详。
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
    ${assert}    Create List    前列腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}







回归测试集-95行,推出疑似诊断top:10:癫痫持续状态
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:全身抽搐7小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:7小时前患者被家属发现其晕倒在地,当时呼之不应,全身强制性抽搐,牙关紧闭,口吐白沫,持续抽搐10余分钟后自行停止,但数分钟后症状再次发作,症状持续不缓解,被家属送至我院急诊,予气管插管,安定等治疗后,ICU会诊,考虑癫痫持续状态,呼吸衰竭,气管插管呼吸机辅助呼吸,有ICU收入指征,故转入ICU继续治疗。有高血压病史7年,服用厄贝沙坦氢氯噻嗪片1粒每日一次2016-11-17因头部等处外伤9小时伴短暂昏迷”在我院脑外科住院,考虑脑挫伤颅内出血急性硬膜下出血脑梗死高血压病,后好转出院。
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
    ${assert}    Create List    癫痫持续状态
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-96行,推出疑似诊断top:10:泌尿道感染
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复尿频尿急6月，再发1月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者6月前无诱因下自觉排尿不适，尿频尿急感明显，无明显尿痛，无肉眼血尿，无泡沫尿，无腰痛，偶有发热，具体体温未测，平素口服消炎药（左氧氟沙星片）可缓解，停用后再发。1月前无明显诱因下再发尿频，尿急，伴下腹部胀痛，感畏寒，无发热，偶感恶心，无呕吐，无胸闷气急，曾到浙江省邵逸夫医院检查腹部增加CT提示双肾小结石”，并排除妇科疾病。予中草药治疗，症状有改善，5天前症状加重，在建德市中医院输液（克林霉素+左氧氟沙星针）4天，昨夜间尿频，尿急，腹胀再次加重，无肉眼血尿，无腰痛，无畏寒发热等不适。故今来本院门诊，为求进一步诊治，门诊拟泌尿道感染收入住院。患者自起病以来，神志清，精神软，胃纳睡眠一般，大便如常，小便如上述，近期体重无明显增减。患者发现高血压病史1年余(具体服药不详），最高血压160/95左右，平素血压控制可。
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
    ${assert}    Create List    泌尿道感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"59","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-97行,推出疑似诊断top:5:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:步态不稳1月余加重伴肢体无力半月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者家属发现患者于今年9月14日约17时无明显诱因摔倒，摔倒后无明显摔伤，未予以重视，21日发现患者步态不稳，不能自行走路，于23日左右进一步加重，主要表现为走路不稳，不能独自行走，27日前往大同当地医院就诊，至10月7日仍可行走，于8日病情加重，主要表现为不能行走，家属诉患者主要表现为左侧肢体无力，于前日发现患者右侧肢体无力，肢体不能抬起，仅可在床面平移。病程中无明显发热，有饮水呛咳，无咳嗽及咳痰，无口角歪斜，无胸闷气急，无肢体抽搐，症状持续存在，未见明显加重或缓解，今为进一步诊治，来我院就诊，查头颅CT未见明显出血灶，予相关处理后，未见明显好转，拟脑血管意外收入科。起病以来，意识不清，昏睡，精神软，胃纳可，喝水有呛咳，夜间偶有大叫，大便不能自理。近期体重未及明显下降。中年男性，既往自幼存在智能障碍；由家属提供病史，患者近一年时间活动减少，主要表现为走路困难；在当地医院就诊时，静滴某种药物时有过敏反应，主要表现为皮疹。
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-98行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽咳痰20年，气急10年，加重8月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者20年前慢性起病，表现为每天晨起咳嗽咯白痰，量不多，10年前起出现活动后气促，休息后能缓解，症状逐渐加剧，下午常有下肢水肿，呈指压凹陷性。平素长期口服茶碱”以及不明药物。曾在我科住院，诊断慢阻肺，肺心病。8月余前患者受凉后出现阵发性咳嗽咳痰，白痰，伴胸痛气急，无畏寒发热，无咯血晕厥，来我科住院，诊断：慢性阻塞性肺病伴急性加重，呼吸衰竭，慢性肺源性心脏病，胃手术后综合征”。入院后予抗感染，平喘，吸氧等治疗，患者症状较前好转,但活动后反复气促，因住院周期长，今因周转需要，重新办理入院。患者此次起病以来，精神可，胃纳及睡眠可，二便无殊，近期体重无明显异常。1982年患者因胃溃疡行胃大部切除术。时有反酸症状。有前列腺增生病史多年。反复便秘多年
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"83","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-99行,推出疑似诊断top:5:肺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发热伴咳嗽4天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者4天前出现畏寒发热，体温未量，伴少许咳嗽，咳白痰，无腹痛腹泻，无尿频尿急尿痛，起病初未予重视，并未诊治，上述症状反复发作，2天前就诊于大同卫生院，予输液治疗（具体诊治不详），患者症状无明显好转，遂今来我院急诊就诊，急查白细胞13.110^9/L;中性粒细胞%88.8%;C反应蛋白119.27mg/L;CT胸部(两肺、纵隔)CT平扫报告2018-10-1610:28:55检查结果:两侧基底节区缺血灶。老年脑改变。右肺下叶炎症；纵隔多发淋巴结钙化。;急诊科十二导心电图报告2018-10-1615:07:00检查结果:窦性心律电轴左偏-10度左室高电压ST-T改变;，急诊拟肺部感染收住入院。发病来神清，精神软，食欲一般，睡眠可，二便如常，体重无明显改变。既往有脑血管意外10余年，目前可正常生活；高血压病病史10余年，长期口服降压药，具体不详；有反流性食管炎病史；已戒烟，长期饮酒；否认药物食物过敏史。
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
    ${assert}    Create List    肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-100行,推出疑似诊断top:5:急性上呼吸道感染
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:流涕半月，发热、咽痛、咳嗽3天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者半月前流无明显诱因出现黄脓涕，起病初自服感冒药（具体不详）无明显好转。3天前出现发热，体温未测，伴有咽痛，阵发性咳嗽，咳黄脓痰，无恶心呕吐，无腹痛腹泻，无尿频尿急等不适，就诊建德怡生堂门诊部，予输液阿米卡星针和克林霉素针治疗2天后症状无明显好转，今来我院门诊就诊，门诊查CT胸部(两肺、纵隔)CT平扫报告2018-10-1611:37:34检查结果:胸部CT平扫未见明显异常。血常规+CRP2018-10-1610:50:48白细胞14.310^9/L;中性粒细胞数9.210^9/L;淋巴细胞数4.310^9/L;血红蛋白167g/L;血沉2018-10-1610:35:31血沉1mm/h;肺支Ig-M,Ig-G2018-10-1611:01:29肺支IgG阴性;肺支IgM阴性，门诊拟急性上呼吸道感染收住入院继续治疗。发病来神清，精神软，食欲一般，睡眠可，二便如常，体重无明显改变
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
    ${assert}    Create List    急性上呼吸道感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"23","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-101行,推出疑似诊断top:5:肺栓塞
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:呼吸困难3天，加重伴神志不清6小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3天前无明显诱因下出现胸闷气急不适，无发热，无咳嗽咳痰，无胸痛咯血，无腹痛腹胀，当时未重视，昨日到建德市第二人民医院住院，当时诊断冠心病、心功能不全。今凌晨5时许出现晕厥一次，约10分钟，逐渐恢复意识，无抽搐呕吐，今中午11时许患者出现呼吸困难加重，在解大便时突发意识不清，心跳停止，立即给予心肺复苏等抢救，约半小时恢复自主心跳，大剂量去甲肾上腺素维持血压，该院考虑肺动脉栓塞，给予阿替普酶50mg静脉溶栓一次，但之后患者循环心率极不稳定，多处出现心率下降，给予反复胸外心脏按压及肾上腺素针静注等抢救，心律逐步趋于平稳，大血压需要大剂量血管活性药物维持，考虑患者病情危重，故下午转我院进一步诊治。入我院急诊后完善CTPA检查提示右肺上叶、右中叶内外段动脉、右肺下叶前基底段动脉、左肺下叶前内基底段动脉栓塞。化验提示心肌酶升高、BNP升高、肾功能不全、肝功能不全。请我科会诊，考虑患者诊断大面积肺栓塞、心跳呼吸骤停心肺复苏术后，呼吸循环衰竭，多脏器功能不全，需要机械通气等脏器支持治疗，符合ICU收治指征，故在家属同意后给予收入ICU进一步诊治。发病来,神志不清,解暗红色血便一次,小便暗红,体重减轻不明显.高血压病史10余年,具体服用药物不详.
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
    ${assert}    Create List    肺栓塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"68","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-102行,推出疑似诊断top:5:急性会厌炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咽痛2小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2小时前无明显诱因下出现咽痛，吞咽时明显，口齿不清，吞咽困难，无发热，无胸闷、气急，无呼吸困难，无咳嗽咳痰，无恶心、吐，无其他明显不适。急来我院诊治，喉内镜检查示：会厌充血肿胀呈半球型，表面半透明状，声门区被覆盖，无法窥及声带，急诊拟急性会厌炎，喉水肿收治入院。起病来，患者神志清，精神软，大小便无殊，胃纳、睡眠欠佳，体重无明显变化。发现高血压10余年，吲达帕胺缓释片1片每日一次，苯磺酸氨氯地平分散片1片每日一次，发现糖尿病3年，目前口服格列齐特片1片每日一次。
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
    ${assert}    Create List    急性会厌炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"73","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}








回归测试集-103行,推出疑似诊断top:103:肠梗阻
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:肛门停止排便半月，腹痛2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:半月前无明显诱因下出现肛门停止排便，排气明显减少，无恶心呕吐，无畏寒发热，无咳嗽咳痰，无胸闷气促，无尿频尿急尿痛，无腹痛腹胀，患者未重视，未就诊。2天前口服番泻叶后出现腹痛，呈持续性胀痛，阵发性加重，无恶心呕吐。遂来我院急诊，全腹部CT检查结果:肠梗阻。请我科会诊后拟急性肠梗阻，高血压病收住入我科。患者自起病以来，精神尚可，睡眠可，未进食，大便少许，小便无异常。
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
    ${assert}    Create List    肠梗阻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"83","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:103]}    ${assert}






回归测试集-104行,推出疑似诊断top:10:变应性鼻炎,鼻息肉,慢性鼻窦炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:双鼻塞伴流涕2-3年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2-3年前无明显诱因下自感出现鼻塞及流脓涕，呈持续性，黄色脓涕，伴鼻痒及打喷嚏，嗅觉基本丧失，偶尔有鼻出血，量少，无咳嗽咳痰，无头晕头痛，无恶心呕吐，无其他明显特殊不适。一直未重视未诊治，症状持续并逐渐加重。2天前来我院耳鼻咽喉科门诊就诊，行鼻内镜及鼻窦CT检查，建议住院手术治疗；今再次来我院就诊，门诊慢性鼻窦炎鼻息肉变应性鼻炎收入住院进一步治疗；起病来，患者神志清，精神可，大小便无殊，胃纳无影响，夜眠欠一般体重无明显变化。
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
    ${assert}    Create List    变应性鼻炎    鼻息肉    慢性鼻窦炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"53","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-105行,推出疑似诊断top:5:声带息肉
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咽喉部异物感伴声嘶2月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2月前无明显诱因下出现声音嘶哑及咽喉部异物感，呈渐进性加重，尤以言语过多时明显，无胸闷气急，无咳嗽咳痰，无呼吸困难，无吞咽梗阻，无痰中带血，无其他不适。今来我院耳鼻咽喉科就诊，初步诊断为声带息肉，建议住院手术治疗。现患者为进一步诊治要求住院手术，门诊拟声带息肉慢性咽炎收住入院,起病来，患者神志清，精神可，大小便无殊，胃纳无影响，夜眠欠佳，体重无明显变化。
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
    ${assert}    Create List    声带息肉
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"29","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-106行,推出疑似诊断top:5:子宫平滑肌瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:经期延长，发现子宫肌瘤3年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者平素月经规则，周期30天，经期5-6天，量及性状正常，无痛经，白带无殊。患者3余年前体检发现子宫肌瘤（具体不详），未定期复查。3年前患者开始无明显诱因出现经期延长，7-10天，月经周期无明显改变，无血块，无腹痛，无头晕乏力等其他不适，未重视。末次月经2018年9月21日，量及性状如前次月经。2天前本院就诊，B超提示:子宫后位，形态失常，肌层见多个低回声团，界清，内部回声不均匀，较大约69.0*58.1mm，位于右侧壁。宫腔线分离，内可见宽约4.7mm液性暗区，内透声可，内膜单层厚约5.2mm，宫内未见明显异常。双侧附件区未见明显包块回声。检查结果:子宫多发肌瘤，宫腔少量积液;无腹痛及异常阴道流血，拟子宫平滑肌瘤收住入院。
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
    ${assert}    Create List    子宫平滑肌瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-107行,推出疑似诊断top:5:急性冠脉综合征
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复胸痛胸闷5年余，加重10小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者5年余前始出现阵发性胸闷胸痛，位于心前区后方，多于体力活动时出现，休息数分钟可缓解，因症状时间短能自行缓解，患者未重视。10小时前（夜间12点钟左右）突感胸闷、胸痛，位于心前区巴掌大范围，持续性发作未能缓解，伴气促，出冷汗，恶心欲吐，无咳嗽咳痰，无晕厥黑朦，遂至市二院急诊考虑急性冠脉综合征，转至我院急诊，用药后症状有所改善，但仍有阵发性胸闷发作，每次数分钟能缓解，复查心电图及肌钙蛋白有动态演变，完善相关检查后考虑急性非ST段抬高型心肌梗死，GRACE评分中危，目前症状有所改善，予住院药物治疗短期行PCI术治疗。
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
    ${assert}    Create List    急性冠脉综合征
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-108行,推出疑似诊断top:10:前庭周围性眩晕,良性阵发性眩晕,持续性姿势-感知性头晕,耳源性眩晕,梅尼埃病,短暂性脑缺血发作
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复眩晕5年，再发4小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:5年来患者反复活动时突发眩晕，视物旋转，无恶心呕吐。保持头位不变、闭眼休息约数十秒钟后可缓解，但睁眼再次出现眩晕，每次持续约数十分钟至数小时经治疗后眩晕停止发作。无发热，无听力改变，无头痛，曾于当地医院诊治，具体治疗经过及治疗方法不详。4天来出现双侧额部胀痛，程度轻，持续性，无恶心呕吐，无四肢麻木，无耳鸣耳闷，4小时前患者上述症状再发，遂来我院急诊就诊，行血化验、心电图及头颅CT检查，检查结果未见明显异常，行镇吐、护胃（盐酸甲氧氯普胺针10mg静脉注射，艾司奥美拉唑钠40mg静滴）治疗后，为进一步诊治，拟眩晕综合症收入我科。
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
    ${assert}    Create List    前庭周围性眩晕    良性阵发性眩晕    持续性姿势-感知性头晕    耳源性眩晕    梅尼埃病    短暂性脑缺血发作
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"66","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-109行,推出疑似诊断top:5:泌尿系结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:左腰腹部疼痛1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1天前无明显诱因下出现左侧腰腹部疼痛，呈持续性，无恶心呕吐，无畏寒发热，无胸闷气急，症状未缓解，遂来我院，查B超提示：左输尿管结石伴左肾积水，现为进一步诊治，拟泌尿系结石收治入院。
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
    ${assert}    Create List    泌尿系结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"72","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-110行,推出疑似诊断top:110:肠梗阻
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:间断腹胀痛3天，加重1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者约３天前无诱因出现腹胀、腹痛，脐周明显，持续性胀痛，阵发性绞痛，无放射及缓解体位，1天前排便2次，感腹部不适好转，1天前进食较多食物后腹部胀痛再发，伴肛门排气排便减少，恶心、呕吐明显，非喷射性，呕吐物为胃内容物，无发热，无畏寒寒战，无头痛头晕，无黑蒙晕厥，无咳嗽咳痰等不适，家属陪护下门诊来院，全腹部CT示:低位小肠部分肠管扩张、积液，拟肠梗阻收入住院。
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
    ${assert}    Create List    肠梗阻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"86","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:110]}    ${assert}




回归测试集-111行,推出疑似诊断top:5:面神经麻痹
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:口角右歪5小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于今日晨起约10点时无明显诱因下出现嘴角右偏，左口角饮水时漏出，笑时口角歪向右侧，伴口角流涎，左眼闭合无力，感左外耳道疼痛，症状持续未见明显好转，无头痛及头晕，无恶心及呕吐，无饮水呛咳，无言语不流利，无胸闷及气短，无胸痛，无肢体麻木乏力，暂无外耳道流液等，因担心病情故来我院门诊，直接拟面神经麻痹收住院。
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
    ${assert}    Create List    面神经麻痹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"31","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-112行,推出疑似诊断top:10:消化道出血,消化性溃疡,
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复呕血1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于1天前无诱因反复呕咖啡色液3次，每次量不等，总量约300ml，无血块，感上腹胀痛，伴反酸，无黑朦及出汗，无黑便，急诊至我院再次呕咖啡色液2次，量较多，约500ml，自觉腹痛好转，小便未解，急查血红蛋白91g/l，急诊行相关药物治疗后未再出现呕血，为行进一步治疗，拟消化性溃疡伴出血收入住院。
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
    ${assert}    Create List    消化道出血    消化性溃疡
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"77","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-113行,推出疑似诊断top:10:乳腺纤维腺瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发现左乳房肿块1年余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1年前无意中发现左侧乳房肿块，约核桃大小，触摸时无感疼痛，无畏寒发热，无咳嗽咳痰，无胸闷气急，无乳头溢液，无腹痛腹胀，无尿频尿频，近来感包块增大明显，遂来我院门诊就诊，经影像学检查提示:双侧乳腺小叶增生，患者为求进一步治疗，遂拟以左乳房肿块收治入院。
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
    ${assert}    Create List    乳腺纤维腺瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"39","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-114行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复咳嗽、气急3年，加重1周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3年前慢性起病，感冒后出现咳嗽、咯白痰、活动后气促、喘鸣音。缓解期咳嗽气促症状不明显，无长期用药。1周前无明显诱因下再次出现咳嗽、白痰、气促症状，夜间平卧位气促加剧。无发热畏寒寒战，无头痛头晕，无胸闷心悸心慌等不适症状。10-15日起在建德市中医院门诊就诊，静滴头孢米诺针、左氧氟沙星针3天，自觉症状改善不明显。今来我院门诊就诊，为进一步治疗，收入我科住院。
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"74","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-115行,推出疑似诊断top:10:肺炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽2天，发热、气喘1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿2天前出现咳嗽，单咳为主,不剧,有痰不易咳出,无发热,无呕吐,无腹泻，无声嘶等不适，当时未重视未就诊。昨夜出现发热,自测最高体温38.5℃,予物理降温处理，体温可降至正常，伴气喘，咳嗽，单咳为主，有痰，不易咳出，无声嘶，无鸡鸣样回勾声，无畏寒寒战，无抽搐，无呕吐，无结膜充血，无腹泻，四肢关节活动自如，无尿频尿急，无粘液血便，无皮肤瘀点瘀斑等不适。今为求治疗,来我院门诊,查血常规+CRP、胸片提示肺炎，遂拟肺炎支原体性肺炎入院。
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
    ${assert}    Create List    肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"4","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-116行,推出疑似诊断top:10:胆囊结石,胆囊炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右上腹疼痛3天余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3天前无明显诱因下感右上腹部胀痛不适，呈持续性，疼痛尚可忍受，无其他处转移痛，伴恶心，无呕吐，无畏寒发热，无头晕头疼，无呕吐，无反酸嗳气。遂至我院急诊就诊，予对症治疗后，患者腹部胀痛缓解。今至我院门诊就诊，为求进一步诊治，拟胆囊结石伴慢性胆囊炎收住入院。
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
    ${assert}    Create List    胆囊结石    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-117行,推出疑似诊断top:10:女性盆腔炎性疾病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:下腹痛1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者平素月经规则，周期30天，经期6-7天，末次月经2018.09.12，量及性状同前。1天前出现下腹痛，以中下腹疼痛明显，阵发性，伴肛门坠胀，无恶心呕吐，无腹泻，无尿痛尿频，无发热。至我院急诊就诊，查全腹CT示：未见明显急腹症征象，至我科就诊，查B超示：子宫多发肌瘤，盆腔压痛，门诊拟女性盆腔炎，子宫肌瘤，瘢痕子宫收住入院。
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
    ${assert}    Create List    女性盆腔炎性疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-118行,推出疑似诊断top:10:急性阑尾炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右下腹痛6小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者6小时前无明显诱因下突感右下腹隐胀痛不适，能忍，曾有恶心呕吐，无呕血黑便，当时未予特殊处理，后感症状较前无明显改善，甚至疼痛较前有所加重，为求进一步诊治，来院就诊，急诊予完善相关检查及对症处理后拟以急性阑尾炎收住入院
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
    ${assert}    Create List    急性阑尾炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"70","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-119行,推出疑似诊断top:5:子宫平滑肌瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:绝经4年，发现子宫肌瘤并渐增大4年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者绝经4年，绝经后无异常阴道流血流液不适；4年前因月经不规则省妇保就诊后查B超提示子宫肌瘤，大小约3.9*4.2*3.3cm，未治疗，患者定期复查发现子宫肌瘤渐增大，半月前妇保院复查B超提示子宫多发肌瘤，最大约65*71*66mm，患者无腹痛腹胀，无畏寒发热，无恶心呕吐，无胸闷气促，无腹泻，无尿频尿急尿痛等伴随不适，拟手术治疗，门诊拟子宫多发肌瘤收住入院。
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
    ${assert}    Create List    子宫平滑肌瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"47","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-120行,推出疑似诊断top:5:痔
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:肛门有物突出伴反复便时出鲜血3年余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3年来反复感便时肛门有物突出，不能回纳，无明显疼痛，有时伴有少量鲜血滴出，无粘液便，无便次增多，无畏寒发热，无头晕头痛，无恶心呕吐，无咳嗽咳痰，无腹痛、腹胀，无尿频尿急，今为求手术治疗，来我院门诊就诊，门诊拟混合痔收住入院。
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
    ${assert}    Create List    痔
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-121行,推出疑似诊断top:10:膀胱炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:尿痛1天，血尿2小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1天前出现尿痛，曾在建德市电力医院治疗效果不佳，2小时前出现血尿，鲜红色，无尿频尿急，无腰腹部疼痛，无头痛头昏，无胸闷气促，无恶心呕吐，今为进一步诊治，来我院诊治，遂拟膀胱炎收住入院
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
    ${assert}    Create List    膀胱炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"85","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-122行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽咳痰20余年，气急3年，加重伴发热4天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者20余年前受凉后出现咳嗽咳痰，少许白痰能咳出，曾至当地医院治疗后好转，但经治反复。此后患者每天均有少许咳嗽咳痰，冬春季受凉后症状加重，经治疗后能好转。3年前患者出现活动后气急，休息后好转，伴下肢浮肿，曾来我院住院，诊断慢阻肺，予相关治疗后好转出院，平素不用药。4天前患者受凉后感咳嗽咳痰气急加重，白痰难以咳出，感畏寒发热，低热为主，活动后气急明显，少许喘鸣音，伴头晕乏力，大便难解，曾至当地医院静滴克林霉素、左氧氟沙星、地塞米松、氨茶碱等药物静滴2天效果不佳，今来我院门诊，门诊拟慢性阻塞性肺疾病急性加重期收住入院。
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




# 回归测试集-123行,推出疑似诊断top:5:直肠恶性肿瘤
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    主诉:大便次数增多伴解血便7月余，加重5天。
#     #现病史值
#     ${presentHistory}    Set Variable    现病史:患者7月余来无明显诱因下发现大便次数增多，约2-3余次，为鲜红色血便，伴排便不尽感，无解稀便黑便，无解粘液便，无腹痛腹胀，无恶心呕吐，无返酸、嗳气，无胸痛、胸闷，无畏寒发热，无尿频、尿急、尿痛及肉眼血尿，患者未就诊，7月余来患者上述症状持续，5天前，患者无明显诱因下感解便次数明显增多，为10余次血便/天，伴排便不尽，无恶心呕吐，无腹痛腹胀，无稀便黑便，为求诊治，来我院门诊就诊，拟直肠肿瘤收住入院。病来患者神清，精神可，胃纳、睡眠一般，小便如常，大便同上，体重7月内减轻3kg。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    直肠恶性肿瘤
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    # ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-124行,推出疑似诊断top:5:过敏性紫癜
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:双下肢皮疹3天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿3天前无明显诱因下出现双下肢红色皮疹，对称分布，形态不一，大小不等，略高于皮肤，压之不退色，无搔痒，腰部疼痛明显，伴肿胀，右下肢膝关节疼痛，不能伸直，左侧正常，无发热，无咳嗽咳痰，无畏寒寒战，无结膜充血，无血尿、少尿，无口周发绀，无明显腹痛等情况,遂至我院皮肤科就诊，予氯雷他定、玉屏风颗粒口服治疗，症状未见缓解。今晨右侧头部出现肿胀，皮疹逐渐蔓延至臀部，无腹痛，无发热，无咳嗽，无口唇发绀，无抽搐嗜睡，无恶心呕吐，无结膜充血，无粘液血便，无尿频尿急，无血便等不适，今为进一步治疗，来我院门诊就诊，拟过敏性紫癜入院。
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
    ${assert}    Create List    过敏性紫癜
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-125行,推出疑似诊断top:5:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:头晕口齿不清2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2天前无明显诱因下出现头晕，口齿不清，右侧口角流涎，行走不稳，尚能独立行走，偶有饮水呛咳，无恶心呕吐，无复视，无肢体活动障碍，无咳嗽咳痰气促，未重视，未至当地医院行相关检查检验。昨日症状再发，无头昏头痛，无肢体抽搐，无畏寒发热，遂来我院门诊就诊，行头颅MRI提示：脑干新近梗塞灶。为进一步治疗，门诊拟脑梗死收入我科。
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"77","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-126行,推出疑似诊断top:5:肾结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:右侧腰腹部疼痛3小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于3小时前感右腰腹疼痛，为持续性胀痛，阵发性加重，3小时来上述症状反复发作，今来院超声提示检查结果:右肾积水伴多发结石左肾囊肿;，无畏寒发热，无胸闷气促，无血尿，无恶心呕吐，今为进一步诊治，拟右肾结石收入住院
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
    ${assert}    Create List    肾结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-127行,推出疑似诊断top:5:胃炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复腹部胀痛2月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于2月前，反复出现腹部不适，腹部胀痛，以脐周及上腹部明显，伴泛酸嗳气，进食后明显，无恶心呕吐，肛门排便、排气减少，无呕血、便血等，无心前区压榨样疼痛，曾来本院门诊就诊，给予药物治疗（具体不详），症状无缓解，今为求进一步诊治，来我院门诊，拟胃炎、消化不良收住入科。
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
    ${assert}    Create List    胃炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"84","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-128行,推出疑似诊断top:5:急性支气管炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发热1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患儿1天前无明显诱因下开始出现发热，最高体温38℃以上，体温上下波动，伴有咳嗽，咳嗽呈阵发性，每次咳2-3声，无明显咳痰，咳末无鸡鸣样回勾声，无声嘶，无气促，无口周发绀，无抽搐嗜睡，无皮疹，无恶心呕吐，无排尿前哭闹等情况。遂来我院门诊就诊，门诊拟以急性支气管炎收住入院。
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
    ${assert}    Create List    急性支气管炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-129行,推出疑似诊断top:5:急性阑尾炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:转移性右下腹痛1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者1天前无明显诱因下突发上腹疼痛不适，呈持续性胀痛，无放射痛，无恶心呕吐，无反酸嗳气，无呕血黑便，无寒战发热，后感疼痛逐渐转移至右下腹并固定，且疼痛加重，不能忍受，无畏寒发热，无恶心呕吐，无腹泻，至当地医院就诊，考虑急性阑尾炎，未予特殊处理。急诊至我院就诊，腹部CT提示急性阑尾炎，予以头孢米诺2g静滴抗感染等治疗后，拟急性阑尾炎收入我科。
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
    ${assert}    Create List    急性阑尾炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"42","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-130行,推出疑似诊断top:5:混合痔
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:肛门有物反复脱出伴出血10余年，加剧10月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年来感肛门有物脱出，不能自行回纳消失，用手能托回，劳累后有时出血，呈鲜红色，量少，无明显疼痛，无粘液便，无腹痛、腹胀及呕吐，无返酸、嗳气，无便次增多，无畏寒、发热，无胸闷、气急，曾在我院门诊治疗（具体药物不详），效欠佳，症状反复发作。近10月来感肛门肿物脱出后，用手不能托回，时伴出血，量少，有时感疼痛不适，再次来院门诊就诊治疗，效不佳，今来院门诊复诊，拟混合痔收入院。
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
    ${assert}    Create List    混合痔
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-131行,推出疑似诊断top:10:直肠恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:解血便1月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者于1月来无明显诱因发现解大便时有血解出，时呈鲜红色及暗红色，量中,与大便相粘连，大便每2-3天解1次，较干硬，无排便不尽感，无腹胀，无恶心、呕吐，无畏寒、发热，无返酸、嗳气，无头痛，无胸闷、气促，一直未曾就诊治疗，症状反复发作，今来院门诊就诊，拟下消化道出血收入院。
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
    ...    patientInfo={"gender":"0","age":"63","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-132行,推出疑似诊断top:5:急性ST段抬高型心肌梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:胸痛6小时，加重1小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者6小时前睡觉过程中突发胸骨下段闷痛，起初症状轻，未重视，1小时前患者症状加重，呈绞痛伴大汗，无恶心呕吐，无黑朦晕厥，故送来我院急诊，心电图提示前壁ST段抬高，血清肌钙蛋白0.276ng/ml，考虑急性ST段抬高型心肌梗死，予拜阿司匹林片300mg、替格瑞洛片180mg口服一次，与家属沟通后拟行急诊PCI术并收住入院治疗。
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
    ${assert}    Create List    急性ST段抬高型心肌梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"70","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






# 回归测试集-133行,推出疑似诊断top:10:癫痫
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    主诉:反复抽搐5月余。
#     #现病史值
#     ${presentHistory}    Set Variable    现病史:患者5月余前（2018.4.24）突发四肢抽搐，意识不清，口吐白沫,数分钟后抽搐停止，继而再次发作,无畏寒发热,无恶心呕吐,未予重视，当时到我院急诊就诊,予头颅CT示两侧脑室周围缺血性改变，老年脑改变,予对症处理后，为求进一步治疗，急诊拟癫痫持续状态收住入院。入神经内科会诊给予抗癫痫、营养神经等对症治疗，但入院数天后患者因咳嗽痰咳不出，血氧饱和度下降至82%左右,予以翻身拍背吸痰吸氧后,仍维持在90%以下。予气管插管送ICU治疗。给予气管插管机械通气、营养支持、加强褥疮换药等治疗，患者营养情况有所改善，感染情况好转，但痰液多，无法脱机拔管，故于2018-5-5行床边气管切开术，术后积极呼吸功能锻炼，2018-7-3脱机，予气管切开套管接导管吸氧下，呼吸平稳，但患者智能障碍，呈痴呆貌，住院期间反复肺部感染，予抗生素干预后能好转，今日因患者住院时间长，给予中途办理周转。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    癫痫
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    # ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-134行,推出疑似诊断top:5:女性盆腔炎性疾病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:下腹痛2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者平素月经规则，末次月经2018年10月8日；患者2天前无明显诱因下出现下腹阵发性绞痛，排便排气后略缓解，无畏寒发热，无恶心呕吐，无腹泻，无异常阴道流血等不适，今来我院就诊，查B超提示子宫前位，形态失常，后壁近宫底肌层探及一低回声结节，大小约17.2*16.4mm，界清，内部回声不均匀。宫腔线清，内膜双层厚13.0mm，宫内未见明显异常回声，妇检提示子宫压痛明显，门诊拟女性盆腔炎收住我科。
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
    ${assert}    Create List    女性盆腔炎性疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"43","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






# 回归测试集-135行,推出疑似诊断top:10:急性阑尾炎
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    主诉:右下腹痛伴呕吐1天。
#     #现病史值
#     ${presentHistory}    Set Variable    现病史:患者1天前无明显诱因下出现右下腹疼痛，呈持续性胀痛，无放射痛，伴恶心呕吐，吐出胃内容物，无咖啡色液体及宿食，吐后腹痛无缓解，无咳嗽咳痰，无反酸嗳气，无呕血黑便，无寒战发热，无腹泻，无尿频尿急尿痛，遂来我院就诊，全腹部CT提示：急性阑尾炎伴周围炎症；胆囊多发结石，左肾窦区囊性灶；肝内小囊性灶；左上腹部肠系膜混杂，考虑脂膜炎，拟急性阑尾炎收治入院。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    急性阑尾炎
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    # ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-136行,推出疑似诊断top:5:急性宫颈炎,急性阴道炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:绝经1年，白带异常1周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者平素月经规则，周期28天，经期4-7天，量中等，性状正常，无痛经不适。1年前绝经，绝经后无异常阴道流血流液及腹痛不适。1周前无明显诱因下出现白带有异味，量不多，伴血性分泌物，来我院就诊，查B超示宫腔积液，妇检示宫颈中糜，易出血，建议行阴道镜+宫腔镜检查，现无头晕头痛，无发热畏寒，无恶心呕吐，无腹胀腹痛，无阴道流血流液，无肛门坠胀等不适，门诊拟急性阴道炎，宫颈炎性疾病收住入院。
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
    ${assert}    Create List    急性宫颈炎    急性阴道炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"50","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-137行,推出疑似诊断top:5:肺恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发现肺部阴影3天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者3天前于外院体检时行肺部CT发现右中叶支气管轻微狭窄、慢性炎症，建议增强CT检查（影像未见）。无发热胸痛，无咯血盗汗，无胸闷心悸，无胸闷气急，无咳嗽咳痰，无恶心呕吐等不适，遂就诊我院急诊，急诊查血常规+CRP2018/10/2210:51:29白细胞5.010^9/L;中性粒细胞%75.9%;红细胞4.2810^12/L;血红蛋白141g/L;血小板17510^9/L;C反应蛋白<0.80mg/L;建议住院进一步检查，故急诊拟肺部阴影收入住院继续治疗。
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
    ${assert}    Create List    肺恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"61","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-138行,推出疑似诊断top:5:不稳定型心绞痛
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复心悸胸闷胸痛6年余，加重1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者6年余前始出现阵发性心悸胸闷，伴有胸痛，位于心前区，呈针刺样，无他处放射痛，活动时出现，持续数分钟可缓解，曾在我院门诊拟诊冠心病，室早配服药物治疗，具体不详。平时偶有一过性黑朦，无晕倒，患者未重视，1年前患者反复出现晕厥，持续数秒钟能自行醒转，醒转后感头昏乏力，并有阵发性心悸胸闷不适，曾在我院住院诊断冠心病，患者拒绝冠脉造影检查带药出院，出院后患者自行停用药物，仍有胸闷胸痛发作，无晕厥发作，无黒朦晕厥，无咳嗽、咳痰、咯血，无发热，无下肢浮肿，1天前胸痛加重，发作频繁，今来我院门诊就医，拟冠心病住院。
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
    ${assert}    Create List    不稳定型心绞痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-139行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复咳嗽、咳痰、气促10余年，加重5天，浮肿伴无尿半天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前反复出现咳嗽、咳痰、胸闷、气闭，冬春季及受凉后多发，每年发作时间大于3个月，曾在当地医院就诊，诊断慢性阻塞性肺疾病，肺源性心脏病，给予相关治疗后能有好转，具体诊疗措施不详，病情反复发作。5天前患者病情再发伴加重，咳嗽、咳痰、气促明显，无发热、胸痛、咯血等，在建德二院住院，诊断慢性阻塞性肺疾病急性加重,肺心病,心功能3级,冠心病,Ⅱ型呼衰,予抗炎抗心衰处理（具体治疗不详）,效果不佳,患者胸闷逐渐加重,下肢浮肿明显,今起尿量明显减少,7小时仅有60ml左右小便,今家属为求进一步诊疗,转来我院就诊.急诊查：谷草转氨酶1110U/L;肌酐170.3umol/L;B型纳尿肽18500.00pg/ml;氧分压48.2mmHg;乳酸18.04mmol/L;ICU医师会诊后认为患者，呼吸衰竭，心功能衰竭、肾功能衰竭，符合ICU收治指证，经家属同意后拟慢性阻塞性肺疾病急性加重，呼吸衰竭，心功能衰竭，肾衰竭收入我科继续治疗。
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"72","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





# 回归测试集-140行,推出疑似诊断top:5:癫痫
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    主诉:全身抽搐伴意识不清2小时余。
#     #现病史值
#     ${presentHistory}    Set Variable    现病史:2小时前，患者无明显诱因下突然出现全身抽搐，牙关紧闭，双眼球向上凝视，伴意识不清、尿失禁，呈持续状态，不能缓解。无口吐白沫。1小时前，家属送入我院急诊。急诊时昏迷，GCS3分，血压179/118mmHg,心率180次/分钟，CT平扫:右额颞叶软化灶；侧脑室周围缺血灶；老年性脑萎缩改变。两肺少许纤维灶；两侧胸腔积液伴左下肺膨胀不全性改变；心脏增大，少量心包积液，部分冠脉、瓣膜钙化。予气管插管机械通气，地西泮针10mg静注1次及胺碘酮针150mg稀释后静注1次抗癫痫抗心律失常等治疗。重症医学科会诊考虑：癫痫持续状态，气管插管机械通气等，有重症医学科住院指征，经过家属同意，故收重症医学科监护治疗。发病以来，未进食，大小便失禁，体重无明显减轻。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    癫痫
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"78","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    # ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:5]}    ${assert}




# 回归测试集-141行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
#     [Documentation]
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    主诉:反复咳嗽、气促伴反复发热5年余，气促浮肿近半月。
#     #现病史值
#     ${presentHistory}    Set Variable    现病史:5患者年余前开始，出现慢性咳嗽，咳少许白痰，伴进行性、活动后气促，有发热，最高体温不详，无寒战盗汗，无咯血心悸，2013年10月在浙江省邵逸夫医院诊断为间质性肺炎，长期口服美卓乐片，后体温正常，气促、咳嗽减轻，但上一层楼梯即气促需休息。并曾赴北京朝阳医院就诊，怀疑合并干燥综合症。后仍有反复发热伴咳嗽，于2014-1-23至1-27本院呼吸内科住院，诊断间质性肺病，出院后至上海中医药大学配服中药治疗，有慢性咳嗽及活动后气促，近半月出现下肢浮肿，夜间尚可平卧休息，有乏力，伴少许咳嗽咳痰，无畏寒发热，无胸闷盗汗，无腹痛腹泻，现为求进一步治疗来我院就诊，门诊拟间质性肺病高血压性心脏病收入院。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable
#     #家族史值
#     ${familyHistory}    Set Variable
#     #月经史值
#     ${menstrualHistory}    Set Variable
#     #婚育史值
#     ${obstericalHistory}    Set Variable
#     #诊疗计划值
#     ${assessmentPlan}    Set Variable
#     #检查结果值
#     ${examinationResult}    Set Variable
#     #检验结果值
#     ${labTestResult}    Set Variable
#     #评分结果值
#     ${gradeResult}    Set Variable
#     #预防接种史值
#     ${vaccinationHistory}    Set Variable
#     #输血史值
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征值
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    慢性阻塞性肺病伴急性加重
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"78","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    currentDiseaseName=
    # ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-142行,推出疑似诊断top:5:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:眩晕恶心呕吐1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:1天前活动中突发眩晕,视物旋转,恶心呕吐,非喷射性，无咖啡样物，保持体位不变数分钟后可逐渐缓解,但有头昏感。此后体位改变时,上述症状反复发作.患者能站立,搀扶下能行走,发病后无耳鸣听力改变，无发热，无头痛，无肢体无力麻木，无视物成双，无意识丧失。今日症状仍有发作,遂来我院.急诊头颅+肺部CT检查结果:左侧小脑大片低密度影，脑梗塞考虑，请结合临床；左侧侧脑室旁缺血灶；老年脑改变。两肺多发肉芽肿结节；两肺散在纤维增殖灶、肺气囊；左心增大，局部冠脉及主动脉壁钙化；纵膈内淋巴结稍大；两侧局部胸膜增厚、粘连。血常规示血红蛋白100g/L;C反应蛋白14.84mg/L;B型纳尿肽1680.00pg/ml;凝血功能急诊生化cTNI无明显异常。拟脑梗死予丹红针40ml、天麻针0.6静滴，眩晕略有好转，为进一步诊治，收入我科.
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"83","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-143行,推出疑似诊断top:5:病态窦房结综合征
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:发现心跳偏慢半年。
    #现病史值
    ${presentHistory}    Set Variable    现病史:半年前患者心电图检查发现心跳偏慢，偶有头昏不适，曾行心电图检查发现有长间歇，3天前我院动态心电图检查提示显著窦性心动过缓阵发性房颤，房颤终止后可见5.77S长RR间期，无明显头昏，无黑曚晕厥，无胸闷气急，建议行起搏器安装术，故今来住院治疗。
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
    ${assert}    Create List    病态窦房结综合征
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-144行,推出疑似诊断top:5:直肠恶性肿瘤
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
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-145行,推出疑似诊断top:5:胆囊炎
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复上腹痛2天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2天前无明显诱因下出现上腹部疼痛，伴有右侧肩背放射痛，感恶心欲吐，略有低热，无肛门排气排便减少，无胸闷胸痛，无头昏黑朦等不适，来我院急诊白细胞7.410^9/L;中性粒细胞88.6%;血红蛋白146g/L;C反应蛋白<0.80mg/L;血淀粉酶70U/L;全腹部CT平扫提示：胆囊内不规则密度影等，建议增强，考虑胆囊炎可能。给予抗炎止痛输液治疗后，腹痛缓解回家。今日凌晨3时许患者再次出现上腹部剧烈疼痛，伴右侧肩背放射痛伴恶心呕吐，呕吐出为少许胃内容物，呕吐后腹痛无明显缓解再次来院，急诊生化提示：总胆红素17.1μmol/L;结合胆红素0.0μmol/L;谷丙转氨酶17U/L;谷草转氨酶24U/L;肌酸激酶同工酶25U/L;钙2.35mmol/L;血淀粉酶531U/L;谷氨酰转肽酶37.3U/L;予以抗炎止痛等治疗后收入院进一步诊治。
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
    ${assert}    Create List    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-146行,推出疑似诊断top:5:阿尔茨海默病性痴呆
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:言语、活动减少5年，卧床3年余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者5年前开始出现言语、活动减少，问答渐不切题，记忆力下降，反应迟钝，在外院诊断为老年痴呆未给予药物治疗，症状逐渐加重，生活无法自理，由保姆照护。3年前开始无法活动，整日卧床，四肢活动少，胃纳下降，遂拟阿尔兹海默症收入我科,予补液、纠正电解质紊乱、抗炎、营养心肌、改善微循环等治疗后病情稳定，今办理周转，继续入院治疗。
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
    ${assert}    Create List    阿尔茨海默病性痴呆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-147行,推出疑似诊断top:5:慢性阻塞性肺病伴急性加重
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:咳嗽咳痰10年余，气急6年，发热6小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者10余年前始反复冬春季受凉后出现咳嗽咳痰，累计发作时间达3个月以上。多次在当地医院就诊，诊断慢性支气管炎，予相应治疗后能好转。6年前起，快步、上坡感气促，未经相关治疗。1年来先后多次因激发呼吸系统感染在我院住院，末次住院时间为本院综合内科2018-3-22至4-1。6小时前无故出现寒战发热,痰液转白，增多，遂来我院急诊室就诊。测体温39.9℃，肺部CT示：肺部感染，动脉血气示低氧血症，予肌注安乃近一次，为进一步治疗，拟肺部感染收入我科住院。
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
    ${assert}    Create List    慢性阻塞性肺病伴急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-148行,推出疑似诊断top:5:胆囊结石
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复上腹疼痛2年余，再发1天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2年余前无明显诱因下反复出现上腹疼痛不适，呈持续性胀痛，向腰背部放射痛，静息下可缓解，无恶心呕吐，无胸闷胸痛，无畏寒发热，当时未予以重视，未正规治疗，后感上述症状反复出现，休息后好转。1天前再次出现上腹部疼痛不适，来我院门诊，拟胆囊结石收入我科。
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
    ${assert}    Create List    胆囊结石
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-149行,推出疑似诊断top:5:肺部感染
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:反复咳嗽咳痰2周。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2周前受凉后出现咳嗽咳痰，少量白痰，易咳出，自诉感畏寒发热，体温未测，曾至当地卫生院就诊，检查胸片示：两肺纹理增粗，予阿莫西林克拉维酸钾，异帕米星针及地塞米松针等相关药物补液及中药对症治疗数天后感症状无明显改善，仍有咳嗽咳痰，咳嗽时感胸前区疼痛，伴流清涕，活动后感胸闷气急明显，感乏力，偶有头痛，右颞侧为主，昨晚测得体温37.6℃，无畏寒寒战，无心悸咯血，无恶心呕吐，无夜间阵发性呼吸困难等不适，今来我院门诊，要求住院进一步治疗，故门诊拟肺部感染收住入院。
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
    ${assert}    Create List    肺部感染
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-150行,推出疑似诊断top:5:胰恶性肿瘤
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:进食梗阻感1月余，加重伴腹胀半月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者约1月余前开始感进食梗阻，进食流质可，无明显反酸烧心、腹痛腹胀等不适，未重视，近半月感梗阻较前加重，纳差明显，伴腹胀不适，就诊于建德市中医院，腹部CT增强提示胰腺体部恶性肿瘤，考虑胰腺癌；肿块包绕腹腔干、脾动脉及左肾静脉，部分受侵；病灶侵犯十二指肠升部；腹膜后及胰周多发淋巴结肿大。肝内多发异常强化灶，考虑转移。肝内多发囊肿；双肾多发囊肿。肝内外胆管明显扩张。胃镜提示胃潴留。考虑胰腺癌，予制酸护胃、抗感染及支持治疗，腹胀加重，伴恶心呕吐、肛门排便、排气减少，患者及家属要求转来我院继续治疗，门诊拟胰腺恶性肿瘤收住院。
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
    ${assert}    Create List    胰恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"88","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-151行,推出疑似诊断top:5:系统性红斑狼疮
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:四肢关节疼痛4月。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者4月前无明显诱因下开始出现四肢关节疼痛，累及趾趾关节，无特定关节，程度不剧，可自行缓解，无肢体变形，伴有少许咳嗽，胸闷不适，无乏力纳差，无恶心呕吐，无畏寒发热，无皮疹，无光过敏等，曾多次在我院门诊就诊，均未明确诊断，2018.03.01抗核抗体全套：抗双链DNA(抗dsDNA)553KIU/L;抗核抗体1：1000;症状持续无缓解，2018.03.21至浙二医院就诊，复查抗核抗体多项阳性，且当时伴有颜面蝶形红斑，考虑SLE，2018.03.23-04.10住院治疗，予甲强龙针60mgBID，羟氯喹、赛可平250mgBID控制原发病及抗血小板聚集，改善微循环及补钙、护胃等对症支持治疗，治疗后出现肝功能异常及上腹部不适，现考虑病情稳定，建议回当地医院继续甲强龙治疗，规律减量。遂转至我院,现无明显咳嗽咳痰，无胸闷气闭，无皮疹，无蝶形红斑，拟系统性红斑狼疮收入我科继续治疗。
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
    ${assert}    Create List    系统性红斑狼疮
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-152行,推出疑似诊断top:10:脑梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:一过性行走不稳2小时余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:2小时余前坐位休息时感轻度视物模糊，数分钟后出现行走不稳，症状持续，无恶心呕吐，无黑矇昏厥，无头痛，无肢体抽搐和麻木，无口角歪斜，无言语不清，此后数分钟后坐车来我院。下车时无明显异常。急诊检查过程中出现一过性向左侧注视时视物成双，约1-2秒钟后好转。急诊头颅CT无明显异常。血清肌钙蛋白0.012ng/ml;B型纳尿肽50.00pg/ml;急诊生化血常规凝血功能无明显异常，神经内科会诊，考虑脑梗死，NIHSS评分0分，溶栓相对禁忌症，家属表示拒绝溶栓。急诊遂拟脑梗死予拜阿司匹林片100mg、波利维片300mg口服，鼠神经生长因子针30ug肌注、泮托拉唑针40mg、丹红针40ml静滴等治疗，症状无再发，为进一步诊治，遂收入我科。
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
    ${assert}    Create List    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"58","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-153行,推出疑似诊断top:5:急性ST段抬高型心肌梗死
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:胸背痛6小时。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者6小时前始出现胸痛，位于胸骨中下段后方，性质难以描述，放射至后背部，伴出汗，休息后未缓解，无咯血，无黑朦晕厥，无寒战发热，无咳嗽咳痰，无恶心呕吐，无头晕头痛，无肢体活动障碍。遂至我院急诊，完善相关检查后考虑急性ST段抬高型心肌梗死，予行急诊PCI术后收入住院。
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
    ${assert}    Create List    急性ST段抬高型心肌梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"82","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-154行,推出疑似诊断top:5:痛风
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:四肢关节反复肿痛4年，加重6天。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者4年前无明显诱因下出现肘关节及双手掌指关节肿痛不适，呈游走性，无恶心呕吐,无皮疹出血点，无浮肿溃疡，无发热畏寒等，当地医院诊断为痛风，予相关对症治疗后好转，但反复发作。10天前曾黑矇，呕吐一次，无晕厥，无胸闷气急，具体不详。6天前出现双下肢踝关节及膝关节肿痛明显，伴不能行走，无发热咳嗽，无恶心呕吐,无皮疹出血点，无浮肿溃疡，诉自行敷中药治疗，肿痛稍有好转，今为进一步诊治，来我院门诊，拟痛风收住我科。
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
    ${assert}    Create List    痛风
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"62","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-155行,推出疑似诊断top:5:声带息肉
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉:声嘶2月余。
    #现病史值
    ${presentHistory}    Set Variable    现病史:患者2月前无明显诱因下出现声音嘶哑，为持续性，休声无好转，伴说话费力，无咳嗽，无咽痛，无气急，无吞咽困难，无反酸，无恶心呕吐，无其他明显不适，曾于我院门诊就诊，具体诊治不详。2天前再来我院诊治，体检：喉内镜下可见梨状窝光滑，右声带前中1/3交界处可见息肉新生物，双声带活动对称，闭合有裂隙，建议住院手术治疗。现患者为进一步诊治要求住院手术，门诊拟声带息肉收住入院。
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
    ${assert}    Create List    声带息肉
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"43","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}














