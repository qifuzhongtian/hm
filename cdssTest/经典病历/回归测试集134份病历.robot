*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***


回归测试集-2行,推出疑似诊断top5:泌尿道感染
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难2年，加重伴发热2天。
    #现病史值
    ${presentHistory}    Set Variable    患者于2年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多，无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，2天前无明显诱因出现尿频尿急尿痛，频繁尿意，伴发热及意识烦躁。为进一步诊治今来我院，以"前列腺增生"收住院。 患者自发病以来，精神食欲可，大便轻度失禁，小便如上述，体力体重无明显改变。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：较差.既往有高血压病史2年，2018年7月中风病史，长期口服阿司匹林肠溶缓释片及非洛地平缓释片。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因请描述死因母： 描述患病情况 3.已故，死因请描述死因其他:无上述病史记录已经征得陈述者认同。（以上第 1 页至第 2 页共 2 页）;陈述者签名：2018年 10月 23日 12 时 39分。
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-2行,推出疑似诊断top10:前列腺增生
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难2年，加重伴发热2天。
    #现病史值
    ${presentHistory}    Set Variable    患者于2年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多，无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，2天前无明显诱因出现尿频尿急尿痛，频繁尿意，伴发热及意识烦躁。为进一步诊治今来我院，以"前列腺增生"收住院。 患者自发病以来，精神食欲可，大便轻度失禁，小便如上述，体力体重无明显改变。
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：较差.既往有高血压病史2年，2018年7月中风病史，长期口服阿司匹林肠溶缓释片及非洛地平缓释片。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：无 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因请描述死因母： 描述患病情况 3.已故，死因请描述死因其他:无上述病史记录已经征得陈述者认同。（以上第 1 页至第 2 页共 2 页）;陈述者签名：2018年 10月 23日 12 时 39分。
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-3行,推出疑似诊断top5:肠梗阻
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


回归测试集-3行,推出疑似诊断top10:急性胰腺炎,胃炎,肠易激综合征
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
    ${assert}    Create List    急性胰腺炎    胃炎    肠易激综合征
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-4行,推出疑似诊断top10:川崎病
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


回归测试集-5行,推出疑似诊断top5:痛风
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-6行,推出疑似诊断top5:急性乳腺炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-7行,推出疑似诊断top5:病态窦房结综合征
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-8行,推出疑似诊断top5:带状疱疹
    [Documentation]    带状疱疹""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左侧胸背部红斑、丘疱疹，伴痛4天。
    #现病史值
    ${presentHistory}    Set Variable    患者于4天前无明显诱因开始出现左侧胸背起红斑，并伴疼痛不适，无畏寒、发热、头昏、胸闷，无腹痛、腹泻、恶心、呕吐等不适。红斑逐渐增多，并在红斑基础上出现丘疱疹，自行以“阿昔洛韦片0.6 po qid”治疗，效果欠佳，遂来我院求诊，在门诊经检查后以"带状疱疹"收入院。起病以来，患者精神、食欲、睡眠可，大小便正常
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：较差。疾病史（含外伤）：：呼吸系统症状：无循环系统症状：冠状动脉狭窄病史6年，口服药物治疗，控制尚可。消化系统症状：无泌尿系统症状：无血液系统症状：无内分泌代谢症状：糖尿病病史10余年，口服药物及胰岛素治疗（具体不详），控制尚可。神经精神症状：无生殖系统症状：无运动系统症状：无传染病史：：无其他：无预防接种史：：不详
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均21支，持续30年 戒烟：否饮酒史：无 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病： 有，疾病名称 糖尿病 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因不详母： 2.患有糖尿病 请描述死因其他:无上述病史记录已经征得陈述者认同。（以上第 页至第 页共 页）陈述者签名：2018年 09月 06日 09 时 51分。
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-9行,推出疑似诊断top10:手足口病
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-10行,推出疑似诊断top10:帕金森病,帕金森综合征
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-11行,推出疑似诊断top10:支气管哮喘
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-12行,推出疑似诊断top10:急性扁桃体炎
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
    ${assert}    Create List    急性扁桃体炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-13行,推出疑似诊断top5:前列腺增生
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难5年余，排尿不下1天。
    #现病史值
    ${presentHistory}    Set Variable    患者于5年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多（4-5次），无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，3周前出现排尿不下，伴下腹胀痛，行泌尿系彩超提示：前列腺增生，前列腺炎改变，在当地医院行留置导尿，并给予哈乐对症治疗，病情好转后出院，留置尿道1周后拔除尿管再次出现不能自主排尿，后再次留置尿管。留置5日后再次拔除尿管，并继续口服哈乐，昨日再次出现不能自主排尿，伴小腹胀痛，无其他不适。为进一步诊治今来我院，以"前列腺增生伴急性尿潴留"收住院。 患者自发病以来，精神食欲可，大便正常，小便如上述，体力体重无明显改变
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均7支，持续20年 戒烟：是：15年饮酒史：有：日均3两，持续40年 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因不详母： 描述患病情况 3.已故，死因不详其他:无上述病史记录已经征得陈述者认同。（以上第 1 页至第 2 页共 2 页）陈述者签名：2018年 09月 10日 11 时 35分。
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-13行,推出疑似诊断top10:尿潴留
    [Documentation]
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    进行性排尿困难5年余，排尿不下1天。
    #现病史值
    ${presentHistory}    Set Variable    患者于5年前无明显诱因出现排尿等待、费力，尿线变细，射程变短，排尿时间变长，尿滴沥不尽，有尿频，夜尿增多（4-5次），无尿痛、血尿，无腰痛及发热。未到医院诊治。以上症状逐渐加重，3周前出现排尿不下，伴下腹胀痛，行泌尿系彩超提示：前列腺增生，前列腺炎改变，在当地医院行留置导尿，并给予哈乐对症治疗，病情好转后出院，留置尿道1周后拔除尿管再次出现不能自主排尿，后再次留置尿管。留置5日后再次拔除尿管，并继续口服哈乐，昨日再次出现不能自主排尿，伴小腹胀痛，无其他不适。为进一步诊治今来我院，以"前列腺增生伴急性尿潴留"收住院。 患者自发病以来，精神食欲可，大便正常，小便如上述，体力体重无明显改变
    #既往史值
    ${previousHistory}    Set Variable    一般健康状况标志：良好。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    常驻地：本地，无地方病地区居住史吸烟史：有：日均7支，持续20年 戒烟：是：15年饮酒史：有：日均3两，持续40年 戒酒：否无毒品接触史；其他:无。
    #家族史值
    ${familyHistory}    Set Variable    家族是否有类似疾病：无 否认家族性遗传病史及传染病史。 父： 描述患病情况 3.已故，死因不详母： 描述患病情况 3.已故，死因不详其他:无上述病史记录已经征得陈述者认同。（以上第 1 页至第 2 页共 2 页）陈述者签名：2018年 09月 10日 11 时 35分。
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-14行,推出疑似诊断top5:2型糖尿病
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-15行,推出疑似诊断top:附睾炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-16行,推出疑似诊断top:上消化道出血
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-17行,推出疑似诊断top10:急性阑尾炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-18行,推出疑似诊断top5:心房颤动
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-19行,推出疑似诊断top5:肺恶性肿瘤
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-20行,推出疑似诊断top5:肛周脓肿
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-21行,推出疑似诊断top10:溃疡性结肠炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-22行,推出疑似诊断top10:白内障
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-23行,推出疑似诊断top5:急性胰腺炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-24行,推出疑似诊断top10:银屑病
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-25行,推出疑似诊断top5:过敏性紫癜
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-26行,推出疑似诊断top10:过敏性紫癜
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-27行,推出疑似诊断top10:腹股沟疝
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-28行,推出疑似诊断top5:脑出血
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-29行,推出疑似诊断top:包皮过长
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-30行,推出疑似诊断top5:包皮过长
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-31行,推出疑似诊断top:慢性阻塞性肺病伴急性加重
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



回归测试集-32行,推出疑似诊断top5:泌尿系结石、输尿管结石、肾积水
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
    ${assert}    Create List    泌尿系结石    输尿管结石    肾积水
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-32行,推出疑似诊断top10:输尿管梗阻、肾结石
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
    ${assert}    Create List    输尿管梗阻    肾结石
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-33行,推出疑似诊断top5:卵巢扭转、盆腔积液
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-33行,推出疑似诊断top10:急性阑尾炎、卵巢蒂扭转
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
    ${assert}    Create List    急性阑尾炎    卵巢蒂扭转
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-34行,推出疑似诊断top5:甲状腺癌、甲状腺肿物、结节性甲状腺肿
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
    ${assert}    Create List    甲状腺癌    甲状腺肿物    结节性甲状腺肿
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-35行,推出疑似诊断top10:甲状腺功能亢进症
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
    ${assert}    Create List    甲状腺功能亢进症
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-35行,推出疑似诊断top5:水痘、手足口病、川崎病
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-35行,推出疑似诊断top10:带状疱疹
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-36行,推出疑似诊断top5:急性ST段抬高型心肌梗死
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
    ${assert}    Create List    急性ST段抬高型心肌梗死
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}



回归测试集-36行,推出疑似诊断top10:肺栓塞
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






回归测试集-37行,推出疑似诊断top5:输尿管结石
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
    ${assert}    Create List    输尿管结石
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}




回归测试集-37行,推出疑似诊断top10:泌尿道感染
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-38行,推出疑似诊断top5:骨盆骨折
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}






回归测试集-39行,推出疑似诊断top5:高血压性心脏病,心力衰竭
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}





回归测试集-40行,推出疑似诊断top:妊娠剧吐,妊娠
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





回归测试集-41行,推出疑似诊断top10:肺部感染
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




回归测试集-42行,推出疑似诊断top5:泌尿道感染
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:5]}    ${assert}








