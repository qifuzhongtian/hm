*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***



呼吸科经典病历-2行,推出疑似诊断:慢性阻塞性肺病伴急性加重,心力衰竭
    [Documentation]    断言""
    #Set Variable后边四个空格+中文是输入
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    咳嗽、咳痰20年，加重伴气促10天#####球结膜无水肿，口唇无发绀，颈静脉无怒张；两侧胸廓对称呈桶状，肋间隙增宽，两肺叩诊呈过清音，两肺呼吸音低，未闻及干湿性啰音；HR 80次/分，律齐，无杂音，腹软，无压痛、反跳痛。双下肢无水肿。
    #现病史
    ${presentHistory}    Set Variable    患者咳嗽、咳痰20年。10天前因受凉后出现咽痛、咳嗽、咳白色黏痰、气喘，活动后明显。3天前出现畏寒、发热，伴纳差、乏力。无双下肢水肿、夜间阵发性呼吸困难，能平卧。无意识障碍、大小便失禁等症状。自行服用头孢拉定、沐舒坦片等药物治疗未见明显好转。
    #既往史
    ${previousHistory}    Set Variable    曾患左侧结核性胸膜炎，正规服用抗结核治疗1年，复查胸片已治愈。有左侧股骨头坏死病史，4年前出现胃溃疡出血，已治愈。无高血压、糖尿病病史。
    #过敏史
    ${allergyHistory}    Set Variable
    #个人史
    ${personalHistory}    Set Variable    吸烟1200年支，饮白酒40年，每天约500ml，已戒烟4年，戒酒5年
    #家族史
    ${familyHistory}    Set Variable    妻及2子女健康，父母已故，兄弟姐妹健在
    #月经史
    ${menstrualHistory}    Set Variable
    #婚育史
    ${obstericalHistory}    Set Variable
    #诊疗计划
    ${assessmentPlan}    Set Variable
    #检查结果
    ${examinationResult}    Set Variable
    #检验结果
    ${labTestResult}    Set Variable
    #评分结果
    ${gradeResult}    Set Variable
    #预防接种史
    ${vaccinationHistory}    Set Variable
    #输血史
    ${bloodTransfusionHistory}    Set Variable
    #生命体征
    ${vitalSigns}    Set Variable
    #辅助检查
    ${assistCheck}    Set Variable
    #主要健康问题
    ${majorHealth}    Set Variable    血常规：WBC 18.72×109/L，N 89.6%，ESR 51mm/h，CRP205 mg/L。肝功能：ALB 33g/L，ALT 28IU/L。腹部B超：肝、胆、胰腺、脾脏、肾脏未见异常。心脏彩超示：心脏各房室大小正常；三尖瓣少量反流。肺功能：FEV1/FVC 55%，支气管舒张试验阴性。心电图：窦性心律，交界性早搏。胸部CT：慢性支气管炎、肺气肿伴肺大泡形成；两肺多发陈旧性灶伴左侧胸膜增厚、钙化。
    ${assert}    Create List    慢性阻塞性肺病伴急性加重    心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"79","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36","heartRate": "80","lowBldPress": "80","highBldPress": "130"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"主要健康问题","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    # ...    currentDiseaseName=
    ...    newRecogFlag=
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-3行,推出疑似诊断:肺炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    咳嗽、咳痰伴发热10天#####Ht173cm。气管居中，浅表淋巴结未及肿大，左下肺呼吸音减弱，可闻及湿啰音，语音震颤较右侧增强。
    #现病史值
    ${presentHistory}    Set Variable    患者于10天前受凉后出现咳嗽、咳白黏痰，痰中偶带血丝，量少，伴发热，体温波动在37.5-39℃之间，伴寒战、大汗，时有胸闷、胸痛。查血常规示WBC 15×109/L，N 86%，胸片示左下肺炎症。给予美洛西林治疗3天后，体温无明显下降。加用阿奇霉素治疗3天后症状仍无改善，自觉胸痛加重
    #既往史值
    ${previousHistory}    Set Variable    既往体健，否认高血压、糖尿病、肝炎等慢性病，否认药物及食物过敏史，否认疫区及禽类接触史，否认冶游史。
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
    ${assistCheck}    Set Variable    血常规：RBC 4.33×1012/L，Hb 140g/L，WBC 15.2×109/L，N 86%，PLT 277×109/L。胸片：左下肺炎症。3天后血常规：WBC 17.5×109/L，N 88%。肝肾功能及电解质均正常。ESR：70mm/h。CRP：65mg/L。D-二聚体：8.4μg/ml。血气分析：pH值7.40，PaCO280mmHg。肿瘤指标均正常。胸部CT示左下肺大片实变影。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "90","lowBldPress": "80","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



呼吸科经典病历-4行,推出疑似诊断:支气管哮喘,心力衰竭
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复发作性喘息20年，加重5年，再发3天#####发育正常，喘息状，端坐位，神志清晰。口唇发绀，咽充血，颈静脉充盈。吸气时可见三凹征，气管居中，胸廓饱满，双肺叩诊呈过清音，听诊呼气时间延长，双肺满布哮鸣音，未闻及湿啰音。心率120次／分，律齐，心脏各瓣膜听诊区未闻及病理性杂音。腹软，肝脾未触及，双下肢无水肿
    #现病史值
    ${presentHistory}    Set Variable    患者20年前无明显原因出现气喘，伴咳嗽，无咳痰，无心慌及心前区不适，经氨茶碱等平喘治疗后症状可完全缓解。此后每年发作1～3次，以春秋季节为主，发作间歇期一如常人。近5年来发作较前频繁，冬季亦有发作，多次因急性发作到医院就诊。3天前受凉后上述症状再次复发，自服氨茶碱、头孢氨苄等药物效果不佳。喘息加重，痰不易咳出，伴大汗淋漓。
    #既往史值
    ${previousHistory}    Set Variable    既往有过敏性鼻炎病史，否认有心脏病史。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    家族中其妹妹有类似疾病
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
    ${assert}    Create List    支气管哮喘    心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"42","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "120","lowBldPress": "75","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


呼吸科经典病历-5行,推出疑似诊断:慢性阻塞性肺病伴急性加重,慢性肺源性心脏病；呼吸衰竭；肺性脑病
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复咳嗽，咯痰30 余年，劳累性呼吸困难10年，反复双下肢水肿3年，近1周咳嗽加重，伴神志恍惚1天#####神志恍惚，烦躁不安，定向障碍，球结膜水肿，瞳孔等大，对光反射存在，口唇发绀，颈静脉充盈，气管居中，锁骨上淋巴结未扪及，桶状胸，心尖搏动在剑突下，扪诊双侧语颤减弱，叩诊为过清音，肝浊音界在锁中线7肋间，心率116次／分，律不齐，偶有早搏，肺动脉瓣区第二音亢进，三尖瓣区Ⅱ级收缩期杂音。双肺呼吸音减弱，可闻及散在干鸣音和中、细湿啰音。腹部稍膨隆，肝脏肋下2cm，质中，脾未扪及，腹软，无压痛，无移动性浊音，肠鸣音减弱。双下肢水肿（＋＋），腱反射减弱，锥体束征阳性，双手有扑翼样震颤。
    #现病史值
    ${presentHistory}    Set Variable    30余年前患者开始出现受凉后咳嗽，咯白色粘液泡沫痰，每年冬季加重，严重时可持续数月，服用抗生素、止咳化痰药等症状可得到控制。10年前在发作间期患者在上楼或爬坡时也感到呼吸困难。3年前在咳嗽发作时出现双下肢浮肿，多次以慢性支气管炎、肺气肿和肺心病、心衰收住院治疗。入院前1周患者因受凉咳嗽加重，咳黄色粘液脓痰，心累，气促，双下肢浮肿，在当地医院静脉注射头孢类抗生素、氨茶碱，口服利尿药等药物疗效不佳。昨日病情再度加重，并出现神志恍惚，胡言乱语，由救护车送到我院急诊收入。起病以来纳差，近3天几乎未进食，服用利尿药后尿量增多，但未计量。
    #既往史值
    ${previousHistory}    Set Variable    既往有吸烟史20 余年，已戒烟3年。无高血压、冠心病及结核病史。
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
    ${assistCheck}    Set Variable    大、小便常规正常。血常规Hb160g／L，WBC 11﹒0 ×109／L，N 0﹒82，L 0.18。肝功能ALT50U／L，AST35U／L。肾功能正常。动脉血气分析pH 7﹒42，PaO 2 6﹒8kPa（51mmHg），PaCO 2 11﹒6kPa（87mmHg），HCO3－ 48mmol／L，BE ＋16mmol／L，SaO 2 85%。血清电解质K＋3﹒2mmol／L，Na＋126mmol／L，Cl－80mmol／L。心电图示电轴右偏，肺性P波，右束枝传导阻滞，偶发性房性早搏。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    慢性阻塞性肺病伴急性加重    慢性肺源性心脏病    呼吸衰竭    肺性脑病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"63","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "116","lowBldPress": "80","highBldPress": "140"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




呼吸科经典病历-6行,推出疑似诊断:肺炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发寒战、高热、胸痛、咳嗽5天#####急性病容，发育正常，营养良好，神志清晰，鼻翼扇动，口唇周围可见疱疹，口唇微发绀，眼底无异常，气管居中，无颈静脉怒张，胸廓对称，呼吸运动两侧均等，右肺语颤增强，右肺上部叩浊。可闻及支气管呼吸音和少许湿啰音，左肺呼吸音正常，无胸膜摩擦音，心率110次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未及，双下肢无水肿，生理反射正常，病理反射未引出。
    #现病史值
    ${presentHistory}    Set Variable    患者于5天前在野外淋雨后突发寒战、高热，体温达40℃，同时有胸痛、咳嗽，痰初为少量白色粘痰，后转为铁锈色痰，无大量脓痰及咯血，伴头痛、疲乏、全身肌肉酸痛。曾自服“复方新诺明”和“去痛片”，效果欠佳。
    #既往史值
    ${previousHistory}    Set Variable    既往身体健康，有吸烟史10 余年，每日1 包。否认有咳嗽、低热和盗汗史。
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
    ${assistCheck}    Set Variable    血白细胞18.0×109／L，N 90%，可见核左移，胞质内有毒性颗粒及空泡，血沉15mm／h，军团菌血清抗体测定正常，痰涂片革兰氏染色可见成对阳性球菌，未找到抗酸杆菌，痰普通培养两次均见肺炎球菌生长，血气分析pH7.37，PaO 2 55mmHg，PaCO 2 38mmHg，SaO 2 85%，心电图呈窦性心动过速，胸部X 线示右肺上野大片均匀致密阴影，边缘模糊，肺门淋巴结不大，肋膈角清晰，侧位片病变位于右肺上叶，左肺未见异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"35","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "40","heartRate": "100","lowBldPress": "75","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






呼吸科经典病历-7行,推出疑似诊断:支气管扩张,肺脓肿
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性咳嗽、咳脓痰和反复咯血8年，再次发作并发热7天#####发育正常，营养欠佳，消瘦，神志清晰。眼结膜苍白，口唇无发绀，无颈静脉怒张，气管居中，胸廓对称，肋间隙无增宽，呼吸运动两侧均等，语颤正常，两肺叩清音，左下胸背部可闻及中、细湿啰音，咳嗽后不消失。心率102次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未触及，杵状指。
    #现病史值
    ${presentHistory}    Set Variable    患者于8年前开始出现受凉后咳嗽、咳脓痰，以晨起为重，并有少量咯血。曾多次到医院诊治，应用多种抗生素，病情时好时坏。近几年发作频繁且痰量增多，多时可达100ml／d。7天前因受凉后上述症状再次发作，咳大量黄脓痰，无臭味，少量痰中带血，并有发热，体温38℃。
    #既往史值
    ${previousHistory}    Set Variable    患者幼年时曾患百日咳，后继发支气管肺炎，住院治疗一个月后痊愈。
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
    ${assistCheck}    Set Variable    血红蛋白90g／L，白细胞11.2×109／L，血沉14mm／h，血气分析为pH7.38，PaO2 90mmHg，PaCO2 40mmHg，痰找结核菌3次阴性，痰培养为草绿色链球菌和奈瑟氏菌，ECG 正常，胸部X 线示双下肺纹理粗乱，以左侧为甚，内有不规则卷发样阴影及片状渗出阴影，肺功能检查时间肺活量和最大通气量轻度降低，残气占肺总量百分比正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    支气管扩张    肺脓肿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"24","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "102","lowBldPress": "80","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-8行,推出疑似诊断:肺脓肿,肺炎,肺结核
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发畏寒、高热、咳嗽、咳痰8天，咳大量脓臭痰2天#####急性病容，发育正常，营养良好，神志清晰，口唇无发绀，无颈静脉怒张，气管居中，胸廓对称，呼吸运动两侧均等，语颤右侧增强，右下胸部叩浊，听诊呼吸音低，右胸背部可闻及少许湿啰音。左肺正常。心率108次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未触及，无杵状指趾。
    #现病史值
    ${presentHistory}    Set Variable    患者于8天前受凉后突然感畏寒、高热，体温达40℃，伴咳嗽、咳少量粘痰，同时有右侧胸痛、气急，即到当地医院就诊，胸透示“右肺中部大片模糊炎性浸润阴影”，给予青霉素640万单位静脉滴注治疗，体温不降，2天前患者开始咳大量脓臭痰，达300ml／日，伴少量咯血，体温下降至38℃。自发病以来，患者乏力，食欲不振，无体重减轻。
    #既往史值
    ${previousHistory}    Set Variable    身体健康，1年前查体胸片未见异常
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    有吸烟史10年，10支／天
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
    ${assistCheck}    Set Variable    血白细胞20 ×10 9／L，N 90%，血沉15mm／h，痰查结核菌两次阴性，痰查癌细胞两次阴性，痰涂片革兰氏染色可见大量革兰氏阴性细菌，需氧培养未见细菌生长，厌氧培养见细菌生长，按标准方法鉴定为类杆菌，血培养阴性。ECG 示窦性心动过速，胸部X 线示右下肺大片浓密阴影，边缘不清，内有一约2 ×3cm 大小的空洞，内壁光滑，可见含气液平段，侧位片位于下叶背段，肺门淋巴结不大，左肺正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺脓肿    肺炎    肺结核
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "39","heartRate": "108","lowBldPress": "80","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



呼吸科经典病历-9行,推出疑似诊断:肺结核,肺脓肿,支气管扩张
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    低热、咳嗽1月余#####发育正常，营养一般，神志清晰。面颊潮红，口唇略苍白，眼底无异常，无颈静脉怒张，气管居中，甲状腺不大，胸廓无畸形，呼吸动度两侧均等，右肺上部叩浊，右上呼吸音稍低，轻咳时可于右侧肩胛间区闻及细湿啰音。心率92次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未及，双下肢无水肿，生理反射正常，病理反射未引出。
    #现病史值
    ${presentHistory}    Set Variable    患者于1个月前始出现低热，体温波动在37.5℃左右，无畏寒。发热多出现在午后和傍晚，热退时出汗不显著，同时伴轻微咳嗽、咳少量粘痰，偶有痰中带血，无胸痛及气急。去当地医院就诊，透视发现肺部病灶，予以抗感染治疗，症状不见好转。自发病以来，患者感乏力，食欲减退，体重减轻约3公斤。
    #既往史值
    ${previousHistory}    Set Variable    既往史：自幼体弱，但无慢性疾病史。
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
    ${assistCheck}    Set Variable    血红蛋白100g／L，白细胞8.0×10 9／L，血沉45mm／h，冷凝集试验（－），痰找癌细胞细胞3次（－），痰涂片抗酸染色2次（－），24小时浓缩集菌抗酸染色3次（＋）。PPD试验阳性。胸片示右肺上叶斑片状淡薄阴影，边缘模糊，在模糊阴影中可见一1cm×1cm密度减低的透亮区，侧位片示病变位于右肺上叶尖段，无肺门淋巴结肿大，左肺阴性。纤维支气管镜检查示右肺上叶管口充血，刷检涂片找到抗酸杆菌。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺结核    肺脓肿    支气管扩张
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"20","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "92","lowBldPress": "80","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


呼吸科经典病历-10行,推出疑似诊断:肺炎,肺脓肿
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热、咳嗽，咯脓痰2月#####发育正常，营养良好。神志清晰，精神好。口唇无发绀。颈部及锁骨上淋巴结无肿大。无颈静脉怒张，气管略向右侧移位。胸廓对称，呼吸运动两侧均等，语颤正常，右上肺叩浊，左肺叩诊清音，右上胸可闻及少许湿啰音及局限性哮鸣音，左肺呼吸音正常，无胸膜摩擦音。心率88次／分，律齐，心音有力，各瓣膜区未闻及杂音，腹软，肝脾未触及，无杵状指趾。
    #现病史值
    ${presentHistory}    Set Variable    两月前因受凉出现发热、咳嗽，咯脓痰，在当地医院胸片诊断为右肺上叶大叶性肺炎，给予头孢类抗生素治疗一周后，复查胸片病灶大部吸收，仅见肺门影较浓密。症状亦明显好转，但仍有阵发性干咳。一周前再次出现上诉类似症状，体温38.5℃，无畏寒，咳黄色粘液脓性痰，有少量痰中带血和夜间盗汗。自服抗生素效果不佳前来我院就诊。起病以来食欲正常，无胸痛及全身其他部位疼痛。
    #既往史值
    ${previousHistory}    Set Variable    40年前患者在大学读书时因咳嗽，低热，盗汗，在医院诊断为右肺上叶肺结核，经抗痨治疗一年，具体用药不详，复查谓之已愈。此后曾多次体检，右肺结核未再复发。最后一次体检是在两年前，当时未发现任何活动性结核病变和其他异常。2型糖尿病史3年，口服降糖灵及饮食控制，血糖基本控制在正常范围。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    吸烟每日一包三十余年。不嗜酒。
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
    ${assistCheck}    Set Variable    血红蛋白130g／L，白细胞12.3×10 9／L，N 0﹒85 血沉25mm／小时。空腹血糖6.2mmol／L。痰查结核菌2次阴性，痰找癌细胞一次阴性。胸部平片示右肺上叶大片密度不均增高影，下界不清，水平裂轻度上移，纵隔轻度右移，右横膈抬高。右侧位片见右肺上叶尖、后段密度增高。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺炎    肺脓肿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38","heartRate": "88","lowBldPress": "80","highBldPress": "140"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





呼吸科经典病历-11行,推出疑似诊断:自发性气胸,气胸,
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发性左侧胸痛伴胸闷、气急6小时#####发育正常，营养中等，神志清，烦躁，呼吸困难。口唇无发绀，气管向右侧移位，左侧胸廓饱满，肋间隙增宽，呼吸运动减弱，语音减弱，叩诊呈鼓音，呼吸音消失，右肺无异常，心率112次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音，腹软，肝上界位于右锁骨中线第5 肋间，全腹无压痛和反跳痛，生理反射正常，病理反射未引出。
    #现病史值
    ${presentHistory}    Set Variable    患者于6小时前打篮球时突感左侧胸痛，为锐痛，疼痛向左肩、臂放射，继有胸闷、气急，伴刺激性咳嗽，无痰、亦无咯血。立即静坐休息，病情未能缓解。患者无恶心、呕吐和昏倒。
    #既往史值
    ${previousHistory}    Set Variable    既往身体健康，无类似病史
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
    ${assistCheck}    Set Variable    血白细胞6.0×10 9／L，血气分析示pH7.44，PaO 2 70mmHg，PaCO 2 36mmHg，AB30mmol／L，SaO 2 90%，ECG 示窦性心动过速，胸部X 线示左肺向肺门萎陷呈圆球形阴影，有清楚的压缩带，左肺中外带透亮度增加，肺纹理消失，两侧肋膈角锐利。在左胸锁骨中线二肋间诊断性穿刺抽出气体。用气胸箱测初压为＋8～＋12cmH 2 O，抽气800ml 后呼吸困难好转，测压为＋1～＋4cmH 2 O，观察5分钟呼吸困难再次加重，测压为＋10～＋14cmH 2 O。立即在同一部位行闭式引流术，有大量气体引出，患者呼吸困难完全缓解。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    自发性气胸    气胸
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"25","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "112","lowBldPress": "75","highBldPress": "110"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





呼吸科经典病历-12行,推出疑似诊断:肺栓塞
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发胸痛、气急、咯血6小时#####发育正常，营养良好，神志清晰，口唇无发绀，眼底无异常，无颈静脉怒张，气管居中，胸廓对称，呼吸运动两侧均等，双肺叩清音，右肺可闻及胸膜摩擦音，以腋中线处明显，右肺底可闻及湿啰音，左肺呼吸音正常。心率112次／分，律不齐，可闻及早搏，4次／分，肺动脉瓣区第二心音亢进，各瓣膜区未闻及器质性杂音。腹软，肝脾未触及，全腹无压痛及反跳痛，双下肢可见静脉曲张，右下肢轻度肿胀。
    #现病史值
    ${presentHistory}    Set Variable    患者于6小时前起床后突感右侧胸痛，为钝痛，深呼吸或咳嗽后加重，伴出冷汗，随之出现发热，体温达38℃，胸闷、气急，不能平卧，舌下含化“硝酸甘油”，胸痛不缓解，并出现阵发性咳嗽，咯血少量，无晕厥和抽搐，无恶心及呕吐。
    #既往史值
    ${previousHistory}    Set Variable    既往有双下肢静脉曲张病史8年，上述症状出现前1天患者曾外出旅行，乘坐飞机两小时后感右下肢肿胀、疼痛，未予重视。否认活动后气急、心前区疼痛病史。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    其父3年前因冠心病病故，母健在，家族中无类似病史。
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
    ${assistCheck}    Set Variable    血白细胞8.0×10 9／L，N 0﹒75，血小板100 ×10 9／L，血沉25mm／h，血清谷草转氨酶、肌酸磷酸激酶和乳酸脱氢酶正常，血浆D‐二聚体阳性，血气分析示pH7.44，PaO 2 65mmHg，PaCO 2 30mmHg，AB 29mmol／L，ECG 呈窦性心律，偶发房性早搏，电轴右偏，完全性右束支传导阻滞，V 1～V 4导联T 波低平。胸部X 线，肺动脉段膨出，肺血减少，心影无增大，右下肺野可见大片密度均匀一致阴影，呈楔形，尖端指向肺门，基底靠近膈胸膜，右侧横膈抬高，肋膈角变钝，侧位阴影位于后基底段。肺通气灌注扫描示右肺下叶后基底段楔形缺损，通气正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺栓塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38","heartRate": "112","lowBldPress": "70","highBldPress": "105"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



呼吸科经典病历-13行,推出疑似诊断:支气管哮喘
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复咳嗽2年#####患者一般状况好，鼻黏膜苍白，咽部充血，扁桃体不大。肺部听诊呼吸音清，无干湿啰音，心脏查体无异常，腹部、四肢未见异常。
    #现病史值
    ${presentHistory}    Set Variable    患者2年来反复咳嗽，多在冬春和秋冬季节交替时发生。以干咳为主，偶有少许白痰，咽部痒感。有夜间咳嗽，多在凌晨咳嗽，重时可因咳嗽致醒，伴气短，坐起后咳嗽症状逐渐缓解。晨起经常打喷嚏，流清水样鼻涕，在空调的房间里也出现上述症状。有时有鼻后滴流感，鼻部分泌物从后鼻道滴入咽部。香烟、油烟气味刺激咳嗽加重，呼吸道感染后，咳嗽持续时间长，不易缓解。有胸部不适感。曾就诊于多家医院，做血常规、支原体抗体化验、心电图及胸部X线等各项检查均未见异常。应用抗生素、止咳药等治疗无明显效果，间断口服抗过敏药稍有效果。发病时无发热、盗汗、乏力、心悸等症状。
    #既往史值
    ${previousHistory}    Set Variable    既往健康，无高血压、消化系统疾病史；18岁时曾患肺结核，已治愈
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    无烟酒嗜好；3年前饲养一宠物狗；无职业性粉尘接触史
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
    ${assistCheck}    Set Variable    肺CT检查结果：右肺上叶后段见斑块样钙化灶，无浸润病变。肺功能检查提示小气道功能轻度降低，支气管激发试验阳性。诱导痰细胞学检查：嗜酸细胞占18%。血清过敏原检测结果：猫狗皮毛（+），总IgE升高，外周血嗜酸细胞增高（9.8%）。PPD试验：局部硬结直径5mm（+）。痰涂片查结核阴性。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    支气管哮喘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-14行,推出疑似诊断:胸膜炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    呼吸困难2周#####神志清楚，呼吸略促，半卧位，无三凹征，结膜无苍白，口唇无发绀，颈静脉无怒张，气管右移，浅表淋巴结未触及，左胸廓膨隆，呼吸运动减弱，触觉语颤减弱，左肺叩诊浊音，听诊呼吸音减弱，未闻及啰音，无胸膜摩擦音，心界不大，律齐，音纯，未闻及奔马律，腹软，无压痛，肝脾肋下未触及，双下肢无水肿，余查体正常。
    #现病史值
    ${presentHistory}    Set Variable    患者2周前无明显诱因出现左胸痛，针刺样疼痛，无放射痛，未在意，自行缓解，之后逐渐出现呼吸困难，活动及平卧时加重，干咳，发热，体温37.8℃，无咯血，口服对乙酰氨基酚后热见退，经4小时左右再发热，体重下降约2.5kg，二便正常
    #既往史值
    ${previousHistory}    Set Variable    既往体健，无循环系统疾病，无血液病、无肾脏疾病、肝脏疾病、结缔组织病
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
    ${assistCheck}    Set Variable    血常规：WBC 11.4×109/L，S 75%L 20%，M 3%，RBC 5.67×1012/L，Hb 150g/L，PLT 402×109/L。CRP：80mg/L。ESR：90mm/h。动脉血气分析（未吸氧）：pH 7.38，PaCO2 40mmHg，PaO2 86mmHg。D-二聚体：0.3mg/L。肺部X线：左肺外高内低致密影，初步诊断左侧胸腔积液。心电图：窦性心律。心肌酶谱：正常。胸腔积液常规：李凡他试验阳性，草黄色液体，细胞计数 800×106/L，淋巴细胞为主。胸腔积液生化：LDH 360U/L，蛋白 46g/L，葡萄糖3.2mmol/L。胸腔积液查CEA＜20mg/L。胸腔积液腺苷酸脱氧酶（ADA）120U/L。胸腔积液查结核菌阴性。胸腔积液细菌培养阴性。PPD：强阳性（硬结直径：25mm×22mm）。血LDH：204U/L。血CEA 1.6mg/L。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    胸膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"20","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38","heartRate": "102","lowBldPress": "70","highBldPress": "110"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-15行,推出疑似诊断:气胸,自发性气胸,肺栓塞
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    突发呼吸困难伴胸痛3天#####神志清楚，呼吸略促，口唇无发绀，气管居中，无三凹征。右胸部略饱满，触诊呼吸运动减弱，听诊右上肺呼吸音消失，双肺未闻及干湿啰音。心界不大，心率90次/分，律齐，未闻及奔马律，各瓣膜听诊区未闻及病理性杂音。腹部、四肢、神经系统检查未见异常。
    #现病史值
    ${presentHistory}    Set Variable    3天前打篮球后突然自觉右胸痛，伴胸闷、呼吸困难，无发热、咳嗽、咳痰及咯血，未介意，今日因气短加重来诊。无烦躁不安、冷汗、虚脱，可平卧。
    #既往史值
    ${previousHistory}    Set Variable    既往健康，无COPD、支气管哮喘及肺结核等呼吸系统疾病史，否认双下肢静脉血栓及长期用药史
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    不吸烟
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
    ${assistCheck}    Set Variable    ①血常规：白细胞总数、分类及血清IgE均正常；②痰及诱导痰无嗜酸细胞升高；③特异性变应原检测未找到变应原；④血D-二聚体定量正常；⑤未吸氧时PaO2、PaCO2、SaO2正常；⑥X线右肺中野可见外凸弧形细线条形阴影，线外透亮度增高，无肺纹理，线内可见压缩的肺组织，肺被压缩30%左右，提示右侧气胸；⑦心电图正常；⑧心脏超声、心功能正常；⑨双下肢静脉超声正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    气胸    自发性气胸    肺栓塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"21","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-16行,推出疑似诊断:支气管扩张,肺结核,肺脓肿,急性肺栓塞,肺曲霉病
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    间断咯血5个月，加重1周#####发育正常，呈慢性病容，神志清楚，自主体位，轻度贫血貌。皮肤黏膜无出血点和皮疹，浅表淋巴结未触及。眼睑黏膜苍白，巩膜无黄染，鼻腔无分泌物及出血，各鼻窦区无压痛，口唇无发绀，口腔黏膜和牙龈无出血，咽黏膜轻度充血，扁桃体无肿大，声音无嘶哑。颈静脉无怒张，肝颈静脉回流征阴性，气管居中，胸廓无畸形，右下肺触觉语颤增强，叩诊呈浊音，右下肺可闻及湿啰音、左肺听诊正常。心浊音界正常，心率88次/分，心律规整，各瓣膜区未闻及病理性杂音。腹平软，肝脾肋下未触及。无杵状指（趾）。脊柱四肢检查可见右下肢静脉曲张，无肿胀，皮色正常，余未见异常。神经系统查体正常。
    #现病史值
    ${presentHistory}    Set Variable    患者于5个月前因劳累后出现小量咯血，每日4～5口，为鲜红色、无血块，无胸痛及气短，无发热及咳黄痰，无恶心及腹痛，无血尿及便血，无牙龈出血，自行口服“云南白药”和“阿莫西林”。1个月后仍有血痰或痰中带血，并伴有乏力，午后发热，T 37.3～37.6℃，应用“第二代头孢菌素”和“左氧氟沙星”治疗2周，因体温下降恢复正常，血痰减少，停药观察。3个月前，劳累后偶有咳痰带血，活动后气短伴胸痛，休息后可缓解，无阵发性夜间呼吸困难，未就诊。1个半月前因着凉后，出现咳嗽、咳黄痰、咳痰带血，伴有发热、乏力，就诊于当地医院拍胸片见“肺内阴影”，给予抗感染治疗，2周后复查胸片肺部阴影未见吸收，放弃治疗。1周前无明显诱因突然整口咯血，每次咯血量为10～50ml，为整口鲜血，在当地医院予止血、抗感染治疗，病情未见好转，为进一步诊治转入我院。发病以来消瘦，体重下降4kg左右，近2个月有活动后气短，无夜间阵发性呼吸困难，无胸痛和心悸，睡眠尚可，二便正常。
    #既往史值
    ${previousHistory}    Set Variable    年轻时患过肺结核已愈。左下肢静脉曲张10年。糖尿病病史7年，间断自服“二甲双胍”等降糖药，很少检测血糖。高血压病5年，平素血压140～160/90～100mmHg，间断口服复方降压片。否认胃病、肝病和血液病，无外伤和手术史
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    吸烟30年×20支/日，少量饮白酒20年，2两/日，搬运工人，无有害粉尘接触史。否认疫区旅游史，无生食螃蟹史，无结核病患者密切接触史
    #家族史值
    ${familyHistory}    Set Variable    父母已故，同胞兄弟4人均健在，否认家族成员肿瘤患病史及遗传性疾病，家族成员无类似疾病
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
    ${assistCheck}    Set Variable    血常规：WBC 9.8×109/L，S 63%，L 15%，M 2%，RBC 3.01×1012/L，Hb 80g/L，PLT 234×109/L，B型血。ESR：50mm/h，结核抗体阴性，PPD实验（+），军团菌抗体阴性。血CEA、NSE、D-二聚体、凝血三项均在正常范围。空腹血糖10.1mmol/L，餐后2小时血糖14.7mmol/L，糖化血红蛋白7.7%。尿常规和肾功能均正常。3次痰涂片革兰染色均为阴性，3次痰涂片荧光染色未查到抗酸杆菌，3次痰细菌培养阴性，3次痰涂片和培养未查到真菌菌丝孢子和真菌生长，3次痰未查到瘤细胞。动脉血气分析（未吸氧）PaO2 87mmHg，PaCO2 40mmHg，pH 7.39。心电图和心脏扇扫未见异常。双下肢深静脉彩超未见血栓形成。肺CT：右肺空洞性病灶，病变位于右肺下叶背段。肺活检病理结果：查到腺癌细胞
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    支气管扩张    肺结核    肺脓肿    急性肺栓塞    肺曲霉病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"51","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "88","lowBldPress": "90","highBldPress": "150"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



呼吸科经典病历-17行,推出疑似诊断:肺脓肿,支气管扩张
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发现杵状指3个月#####神志清楚，查体合作。右锁骨上可触及一无痛肿大淋巴结，质硬，移动性差，口唇无发绀，颈软。双肺呼吸音清，左下肺呼吸音稍弱，心界不大，心律齐。腹软，无压痛、反跳痛，肝脾未触及，四肢活动自如，可见杵状指（趾）
    #现病史值
    ${presentHistory}    Set Variable    3个月前发现四肢指端变形，持续不缓解。近2个月出现咳嗽，有少量白痰，无咯血，无呼吸困难，无发热，无心悸、胸闷，无恶心、呕吐，无腹痛、腹泻。
    #既往史值
    ${previousHistory}    Set Variable    既往身体健康，无慢性呼吸系统疾病史及心脏疾病史
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
    ${assistCheck}    Set Variable    血常规：WBC 9.2×109/L，S 65%，L 20%，Hb 119g/ L。肝功能、肾功能、血糖正常，血肿瘤标志物正常。心脏扇扫正常。肝胆脾B超结果正常。肺CT：左肺下野降主动脉旁见一3.5cm×4.5cm大小块状影，有分叶，纵隔内见数个肿大淋巴结。纤维支气管镜结果：左肺下叶背段见菜花样肿物，余各级支气管黏膜光滑管腔通畅。病理结果：小细胞型肺癌
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺脓肿    支气管扩张
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"61","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36","heartRate": "80","lowBldPress": "80","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




呼吸科经典病历-18行,推出疑似诊断:支气管哮喘,慢性支气管炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复发作性喘息20年，加重1周#####一般状态差，神志清，端坐呼吸，满头大汗，话语不连贯，口唇颜面发绀。双肺满布哮鸣音，散在小水泡音。心界不大，心音纯，心率130次/分，节律规整。各瓣膜区未闻及心脏杂音和奔马律。腹部、四肢和神经系统检查未见异常。
    #现病史值
    ${presentHistory}    Set Variable    患者20年前无明确诱因喘息发作，发作时端坐呼吸、喘息伴咳嗽，咳少许白色稀薄痰，用地塞米松静脉注射可缓解症状。以后10年中喘息症状发作频繁，经常在冬春和秋冬季节交替、气候变化的时候喘息发作，月经期无症状加重。1周前感冒后喘息发作，夜间不能平卧，采用肘膝位，呼吸困难，伴满头大汗，呼吸时可听到拉风箱样的喘鸣音。喘息逐渐加重，持续48小时不缓解。发病以来无发热，二便正常。
    #既往史值
    ${previousHistory}    Set Variable    10年前有荨麻疹史
    #过敏史值
    ${allergyHistory}    Set Variable    既往有青霉素过敏性休克史，对多种抗生素过敏，对花粉过敏
    #个人史值
    ${personalHistory}    Set Variable    无吸烟史
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
    ${assistCheck}    Set Variable    ①血常规：WBC 12.0×109/L；S 76%，E 6%，L 18%。②动脉血气分析（未吸氧）：pH 7.321，PaO2 65.5 mmHg，PaCO2 43.7 mmHg，HCO3－ 22.1 mmol/L。③胸部X线：双肺透过度增强，余未见异常。④心电图：心动过速，心率130次/分，节律规整。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    支气管哮喘    慢性支气管炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"42","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "130","lowBldPress": "70","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





呼吸科经典病历-19行,推出疑似诊断:支气管哮喘
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    喘息、呼吸困难进行性加重20天#####一般状态尚可，神志清，半坐位，呼吸促，多汗，话语连贯，口唇轻度发绀。双肺满布哮鸣音，无水泡音，卧位时不用听诊器可听到大气道喘鸣音。心界不大，心音纯，心率130次/分，节律规整。各瓣膜区未闻及心脏杂音和奔马律。腹部、四肢和神经系统检查未见异常
    #现病史值
    ${presentHistory}    Set Variable    患者1个月前无明显诱因发生喘息，卧位时喘息症状加重，有时能听到气道内拉风匣样的喘鸣音，伴有呼吸困难，被迫坐起后数分钟可轻度缓解喘息症状。轻咳，无痰，无咯血，无发热，无鼻塞、流涕症状。1个月来喘息症状逐渐加重，曾在外院用青霉素和氨茶碱静脉滴注，症状有时缓解。来诊前1周，症状加重，经常夜间憋醒，不能平卧，伴颜面潮红，满头大汗，经急诊收入院。
    #既往史值
    ${previousHistory}    Set Variable    既往健康。待业在家，无特殊粉尘接触史；家居楼房，不潮湿，最近未装修房屋；未饲养宠物
    #过敏史值
    ${allergyHistory}    Set Variable    无花粉过敏史
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
    ${assistCheck}    Set Variable    ①血常规：WBC 8.0×109/L；S 70%，E 2%，L 28%。②动脉血气分析（未吸氧）：pH 7.50，PaO2 75.5 mmHg，PaCO2 28.7 mmHg，HCO3－ 23.5 mmol/L。③胸部X线：双肺未见明显异常。④心电图：窦性心动过速，心率120次/分，节律规整。⑤支原体抗体检测结果回报1∶160阳性。⑥肺CT三维重建提示肿物从气管左侧向管腔内生长，左侧根部有蒂，右侧位气管重建肿物将气管完全阻塞。⑦肺纤维支气管镜检查结果提示大气道占位病变
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    支气管哮喘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"21","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "120","lowBldPress": "70","highBldPress": "110"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



呼吸科经典病历-20行,推出疑似诊断:支气管哮喘
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复发作性喘息20年，再次发作1周，嗜睡1天#####一般状态差，半卧位，满头大汗，神志模糊，时有躁动，问话有时能正确回答，但话语不连贯。口唇颜面发绀，球结膜轻度水肿，可见“三凹征”，胸廓饱满，双肺叩诊过清音。双肺呼吸音弱，未闻及干鸣音，右肺下散在少量小水泡音。心率130次/分，节律规整。各瓣膜听诊区未闻及病理性杂音。腹软，肝肋下可触及1～2cm，质软，脾未触及。双下肢无水肿。
    #现病史值
    ${presentHistory}    Set Variable    20年前无明确诱因感到气短，喘息，呼气时可听到“咝咝”声，伴咳嗽，咳少许白色稀薄痰，持续数小时后自行缓解。1周前感冒后喘息发作，气短严重，夜间不能平卧，伴满头大汗。为缓解症状患者应用“异丙肾上腺素”青霉素、氨茶碱，喘息逐渐加重，1天前患者精神萎靡，嗜睡，偶有谵语来我院急诊。患者此次发病无发热，无黄痰，无咯血，无胸痛，进食量显著减少，排便成形，每日尿量500～700ml。
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
    ${assistCheck}    Set Variable    ①血常规：白细胞总数11.1×109/L，中性粒细胞77%。②血气分析（吸氧2L/min）：pH 7.321，PaO2 65.5mmHg，PaCO2 53.7mmHg，HCO3－ 22.1mmol/L。③床头胸片：双肺透过度增高。④心电图：窦性心动过速。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    支气管哮喘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"39","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "130","lowBldPress": "80","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



消化科经典病历-2行,推出疑似诊断:急性胰腺炎,
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛3天伴恶心、呕吐#####神志清楚，精神可；双肺呼吸音清晰，未闻及干湿性啰音。心界不大，心率91次/分，律齐。腹平坦，腹肌稍紧，上腹压痛明显，无反跳痛，Murphy 征阳性，移动性浊音阴性，肠鸣音2～3次/分，双下肢无水肿。
    #现病史值
    ${presentHistory}    Set Variable    发作性上腹痛3天，呈发作性绞痛，进食后加重，伴有恶心、呕吐，吐后腹痛缓解
    #既往史值
    ${previousHistory}    Set Variable
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    菜农
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
    ${assistCheck}    Set Variable    血常规示：WBC 9.3×10 9/L，NEUT%为80.4%，Hct 0.54；血清淀粉酶1238U/L，尿淀粉酶873U/L。腹部B 超提示：胆总管增宽，内可见条索状低信号影。上腹部CT 提示：胰头体积增大，周围可见少量渗出改变；腹部平片示：肠管少量积气。心电图及胸片正常，肝功能、肾功能、血糖、血脂未见异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    急性胰腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37.2","heartRate": "91","lowBldPress": "87","highBldPress": "105"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-3行,推出疑似诊断:肝硬化
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发现乙肝10年，间断乏力2年余，加重伴腹胀10天#####肝病面容，全身皮肤黏膜无黄染，无皮下出血、皮疹。可见肝掌及蜘蛛痣。全身浅表淋巴结未触及肿大。腹部膨隆，测腹围90cm，胁腹部及脐周未见瘀斑，无腹壁静脉曲张。腹肌不紧，无压痛及反跳痛，Murphy征阴性。肝脏肋下未触及，脾触诊肋下3cm，移动性浊音（＋）。
    #现病史值
    ${presentHistory}    Set Variable    患者10年前查体发现乙肝，因无任何不适，未行进一步诊治，期间未定期复查。2年前无明显诱因出现乏力，为间断性发作，劳累后加重，休息后症状可缓解，无腹痛、腹泻，无反酸、嗳气、恶心、呕吐。1年前体检行腹部B超检查示：脂肪肝，脾大，脾静脉扩张，未予重视。10天前无明显诱因自感乏力症状加重，同时感腹胀，休息后症状无缓解，无发冷、发热，无腹痛、腹泻，无呕血、黑便。发病近10天来，食纳差、小便量少，夜间睡眠差。
    #既往史值
    ${previousHistory}    Set Variable
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    母亲患胃癌去世，妹妹患有乙肝
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
    ${assistCheck}    Set Variable    血常规：WBC 2.49×109/L，RBC 2.67×1012/L，Hb 92g/L，PLT 57×109/L。肝功：TBIL 29.2μmol/L、TP 54g/L、A 28.6g/L。血凝全套：PT 17.3s、APTT 52.9s、FIB 0.96g/L，PTA 1.7%，INR　1.42。胃镜：食管胃底静脉重度曲张，红色征阳性，慢性胃炎。腹部彩超：肝硬化，门静脉内径增粗，血流通畅，脾大，腹水（大量）。。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肝硬化
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"69","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.8","heartRate": "82","lowBldPress": "70","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




# 消化科经典病历-4行,推出疑似诊断:消化性溃疡
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    间断呕吐2个月#####患者消瘦体型，慢性病容，生命体征正常。浅表淋巴结未及。腹部可见巨大胃型，触诊张力高，振水音（+），肠鸣音正常，余未见异常。
#     #现病史值
#     ${presentHistory}    Set Variable
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
#     ${assistCheck}    Set Variable    立伟腹部平片：大量胃潴留，幽门梗阻。幽门螺杆菌（Hp）阳性。未见膈下游离气体。胃镜：十二指肠球部溃疡、球腔变形狭窄。活检病理：慢性炎症。腹部CT：幽门梗阻，十二指肠球部黏膜增厚。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    消化性溃疡,
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"27","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
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



消化科经典病历-5行,推出疑似诊断:肠易激综合征,慢性结肠炎,消化不良
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹泻5年#####一般状态好，营养良好。心肺查体正常。腹部平软，未见静脉曲张，全腹无压痛，肝脾肋下未触及，胆囊未触及，Murphy征（－），移动性浊音（－），肠鸣音15次/分，双下肢无水肿。
    #现病史值
    ${presentHistory}    Set Variable    患者5年来，大便不规律，反复腹泻，大便2～4次/日，稀糊黏液便，无脓血，每次量少，便前腹痛，排便后缓解。排便多在晨起和早餐后，无里急后重。经常腹痛、腹胀、排气多。腹泻好转时即出现便秘，排便费力，1～2次/周。体重无明显变化。发病多与情绪、睡眠有关，与饮食关系不大，禁食后腹泻无明显改善。曾在外院查过便常规：正常；血生化正常。每次发病时应用抗生素、多种止泻药、益生菌、酵母片和中药等。各种药物治疗开始均有效，3～5天后效果不明显。发病以来睡眠差、精神不佳、心慌、心悸、腰背酸痛，无发热、盗汗等。
    #既往史值
    ${previousHistory}    Set Variable    发病前工作压力大、生活不规律、经常加班。既往体健，无肾炎、胰腺炎、糖尿病、甲状腺功能亢进、肺结核、急性痢疾等病史，无血吸虫疫水接触史。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    公司职员
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
    ${assistCheck}    Set Variable    便常规：正常。WBC 5﹒22 ×109/L，N 0﹒61，HGB 128g/L，PLT 352 ×109/L；肝肾功能和电解质正常，Alb 37﹒4g/L；ESR 2 mm/h；CRP 0﹒234 mg/dl；甲状腺功能正常。便培养（－）。便找阿米巴滋养体（－）。便苏丹Ⅲ染色（－）。PPD（－）。全消化道造影和胸片：未见异常。结肠镜：全结肠及直肠黏膜未见异常。B超和CT：肝、胆、脾、胰、双肾未见异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




# 消化科经典病历-6行,推出疑似诊断:肠易激综合征,感染性腹泻
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    反复腹痛、腹泻2年余#####营养良好。浅表淋巴结未触及肿大，心、肺查体正常。腹部平软，全腹无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音。
#     #现病史值
#     ${presentHistory}    Set Variable    患者2年前开始反复于进冰冷食物或冷水后出现脐周、下腹绞痛，程度不剧烈，不放射，不影响日常生活。伴腹泻，3～5次/日，为黄色稀水或稀糊便，不含油滴及未消化食物，无脓血，无恶臭，不伴里急后重。腹痛多在腹泻后缓解。上述症状多在每日上午出现，进早餐后加重，如不进早餐症状减轻，夜间无腹泻。不伴发热、皮疹、体重下降、水肿等。
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
#     ${assistCheck}    Set Variable    粪常规：WBC、RBC（－），便潜血（－）×3次；便苏丹Ⅲ染色（－）。血常规：WBC 7﹒8 ×109/L，N 0﹒65，HGB 132g/L，PLT 257 ×109/L；肝肾功能、电解质正常。甲状腺功能：T3、T4、TSH均正常范围。ESR 10 mm/h；CRP 0.7 mg/dl。B超：肝胆胰脾及双肾未见明显异常。全消化道造影未见异常。结肠镜：进镜至末段回肠10c m，所经末段回肠、结肠、直肠黏膜未见异常。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    肠易激综合征    感染性腹泻
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"38","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "36.4","heartRate": "64","lowBldPress": "70","highBldPress": "120"}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
    # ...    currentDiseaseName=#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]
# }
#     ...    newRecogFlag=
...    newModelFlag=1
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}



# 消化科经典病历-7行,推出疑似诊断:原发性硬化性胆管炎,
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    反复皮肤瘙痒5年，加重伴黄染半个月#####神志清楚，查体合作。皮肤巩膜中度黄染，心肺未见阳性体征，腹平软，无压痛，肝未触及、无叩痛，脾于左肋下2cm可触及，无压痛。移动性浊音阴性，双下肢无水肿。
#     #现病史值
#     ${presentHistory}    Set Variable    患者近5年来无明显诱因反复出现皮肤瘙痒，常感乏力不适，无皮疹，曾服抗过敏药物治疗，症状时轻时重。近半个月来皮肤巩膜黄染，瘙痒加重，无发热、腹痛，体重无减轻。
#     #既往史值
#     ${previousHistory}    Set Variable    无胆石症等胆道疾病，无手术史，否认肝炎、饮酒及服药史
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
#     ${assistCheck}    Set Variable    尿胆原阳性。肝功能：总蛋白 61.4g/L、白蛋白 38.9g/L、球蛋白 22.5g/L、ALT 480U/L、AST 371U/L、ALP 134U/L、GGT 326U/L、TBA 196.2μmol/L、TBIL 99.9μmol/L、DBIL 67.7μmol/L、IBIL 32.2μmol/L；胆固醇 4.5μmol/L、甘油三酯 3.27mmol/L。MRCP 肝内外胆管变细、僵直，肝门区胆管显示欠佳。胆囊不大，壁稍厚，脾脏大。肝组织病理检查提示小胆管减少，胆管周围纤维组织明显增生。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    原发性硬化性胆管炎
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "35.2","heartRate": "90","lowBldPress": "85","highBldPress": "120"}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
    # ...    currentDiseaseName=#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]
# }
#     ...    newRecogFlag=
...    newModelFlag=1
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}





消化科经典病历-8行,推出疑似诊断:胃食管反流病
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反酸、胸骨后烧灼感半年，吞咽不畅、胸痛半月#####腹部稍膨，腹壁未见曲张静脉，剑突下压迫隐痛不适，全腹未扪及包块，肝脾肋下未触及。肝肾区叩击痛（-），移动性浊音（-），肠鸣音正常。
    #现病史值
    ${presentHistory}    Set Variable    患者反酸、胸骨后烧灼感半年，常于饮酒后出现，反酸以进食后或卧位明显，空腹时或坐立位减轻，曾经间断服用“铝碳酸镁”等药物，烧心症状稍有减轻，但仍有反酸。近半月来渐出现胸骨后不适感，伴有间隙性吞咽不畅和轻度胸痛。病程中时有嗳气、反胃，伴有上腹饱胀不适。食欲稍差，二便正常。无反复咳嗽、喘息，无呕血、黑便，无节律性上腹痛，近期无明显消瘦。
    #既往史值
    ${previousHistory}    Set Variable    体检发现脂肪肝3年余，肝功能正常未予治疗。
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
    ${assistCheck}    Set Variable    B超提示脂肪肝。肝肾功能正常，甘油三酯轻度增高，血糖正常。24小时pH监测提示酸反流。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    胃食管反流病,
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"45","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37.2","heartRate": "70","lowBldPress": "80","highBldPress": "135"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-9行,推出疑似诊断:细菌性痢疾
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛、腹泻、发热2天#####一般情况尚可，腹平软，左下腹轻压痛，肠鸣音活跃。
    #现病史值
    ${presentHistory}    Set Variable    患者2天前进食剩饭、剩菜后出现腹痛和腹泻，腹痛为下腹阵发性绞痛，便前重，便后缓解，无放射痛，大便为黄色稀水样便，后为黏液脓血便，每日解5～7次，有里急后重感，稍感恶心，曾呕吐两次，非喷射性，为胃内容物，量不多，有轻微的畏寒、发热，自服“藿香正气液”，症状无缓解。发病来精神、睡眠欠佳，食欲差，尿量较少，体重无明显下降。
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
    ${assistCheck}    Set Variable    血常规：WBC 13.3×109/L，N 80%，L 14%，E 0.5%，M 5.5%，RBC 4.1 ×1012/L，HGB 145g/L，PLT 246×109/L。肝功能正常。肾功能正常。电解质：K＋3﹒8mmol/L，Na＋132﹒2mmol/L，CL－90﹒1mmol/L。血、尿淀粉酶正常。尿常规正常。大便常规：黏液脓血便，WBC 满视野，RBC 满视野，脓细胞4～7/HP，吞噬细胞3～5/HP，OB（＋），动力试验阴性。腹部B超正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    细菌性痢疾
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"26","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38.2","heartRate": "90","lowBldPress": "72","highBldPress": "118"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-10行,推出疑似诊断:消化性溃疡
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    上腹部隐痛、恶心、欲吐1天#####心肺（—）。腹平坦，未见胃肠型及蠕动波，未见腹壁静脉曲张，腹软，剑突下压痛，无反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性，肝浊音界位于右胸锁骨中线第5 肋间，肝区、脾区及双肾区无叩痛，肠鸣音4次/分，无气过水声。
    #现病史值
    ${presentHistory}    Set Variable    患者1天前晚餐进食凉菜及冰冻西瓜后稍感上腹部隐痛不适，疼痛部位较固定，无明显放射，间断发作，疼痛发作时感恶心、欲吐，伴食欲降低，无畏寒、发热、黄疸、胸痛、胸闷、反酸、嗳气。肛门排气、排便正常。自患病以来，精神、睡眠差、未进食，大小便正常，体重无明显变化。
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
    ${assistCheck}    Set Variable    血常规示：WBC 6.5×109/L，HGB 123g/L，PL T 202×109/L。胃镜检查示：胃体黏膜充血肿胀。血尿淀粉酶正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    消化性溃疡
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"36","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "85","lowBldPress": "77","highBldPress": "128"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





消化科经典病历-11行,推出疑似诊断:胃恶性肿瘤
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    上腹部隐痛不适2个月#####一般状况尚可，浅表淋巴结未及肿大，皮肤无黄染，结膜甲床苍白，心肺未见异常，腹平坦，未见胃肠型及蠕动波，腹软，肝脾未及，腹部未及包块，剑突下深压痛，无肌紧张，移动性浊音（－），肠鸣音正常，直肠指检未及异常。
    #现病史值
    ${presentHistory}    Set Variable    患者2个月前出现上腹部隐痛不适，进食后明显，伴饱胀感，食欲逐渐下降，无明显恶心、呕吐及呕血，治疗后稍好转。近半月自觉乏力，体重较2个月前下降6kg。近日大便色黑。
    #既往史值
    ${previousHistory}    Set Variable    吸烟20年，10支/天，其兄死于“消化道肿瘤”。
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
    ${assistCheck}    Set Variable    大便潜血（＋），血Hb 96g/L。上消化道钡剂造影示：胃角见约3cm大小龛影，位于胃轮廓内，周围黏膜僵硬粗糙；腹部B超检查未见肝异常，胃肠部分检查不满意。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    胃恶性肿瘤
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-12行,推出疑似诊断:急性胰腺炎,胆囊炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛、恶心、呕吐2天#####心肺未见异常。中上腹压痛、反跳痛，肌稍紧张，肝脾肋下未触及，Murphy 征阴性，肝上界位于右锁骨中线第5 肋间，肝脾肾区无叩痛，移动性浊音阴性，听诊肠鸣音正常，未闻及气过水声及血管杂音。
    #现病史值
    ${presentHistory}    Set Variable    患者2天前进食过量油腻食物后出现上腹疼痛，呈持续性胀痛，并向肩、背部放射，前倾位后可稍减轻。伴恶心、呕吐，共3次，为胃内容物，非喷射状。无头晕、头痛、发热、寒战，无返酸、嗳气、呕血，无腹泻、黑便等，予以输液治疗，症状仍无缓解。发病以来，精神差，未进食，大小便正常，体重无明显变化。
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
    ${assistCheck}    Set Variable    肝功：ALT 90U/L，AST 17U/L，GGT 140U/L，ALP 248U/L，TP 62g/L，Alb 24.1g/L；血常规WBC 16.37×109/L，Hb 101.2g/L，N 0.92；尿淀粉酶2228.7U/L，血淀粉酶687.4U/L；肾功：血钠133.7mmol/L，血磷0.61mmol/L；心电图提示：窦性心动过速。腹部立卧位片未见明显异常。CT提示：胰腺边缘模糊，周围大片状炎性渗出，增强扫描，胰腺强化不均匀。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    急性胰腺炎    胆囊炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"43","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37.8","heartRate": "120","lowBldPress": "90","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-13行,推出疑似诊断:胃炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    间断上腹隐痛2年#####腹平坦，腹软，剑突下压痛，无反跳痛、肌紧张，肠鸣音正常，余（－）。
    #现病史值
    ${presentHistory}    Set Variable    间断上腹隐痛2年，伴反酸、胃灼热，无呕吐、腹胀、消瘦、黑便等。饮食正常，大便干燥，3～4天1次。
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
    ${assistCheck}    Set Variable    血常规正常。胃镜提示食管下段可见条索状黏膜充血、糜烂，胃黏膜可见散在充血水肿。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List   胃炎
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-14行,推出疑似诊断:轮状病毒性肠炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热伴腹泻蛋花水样便2天#####轻度脱水貌，无皮疹，咽部充血，扁桃体无肿大，双肺呼吸音清楚，无干湿啰音，心音有力律齐，胸骨左缘未闻及杂音，腹软不胀，四肢端暖和。
    #现病史值
    ${presentHistory}    Set Variable    就诊前2天患儿出现发热，体温37.8～38.5℃，无寒战及抽搐，同时腹泻稀水样便，呈蛋花水样便，一天4～5次，每次量较多，无黏液及脓血，解大便时无坠胀，伴呕吐2次，呕吐物为胃内容物，无胆汁及咖啡色液体，呈非喷射状，无咳嗽及喉喘，无流涕，病后患儿口渴喜饮，哭时泪稍少，尿量稍减少，精神食欲下降。
    #既往史值
    ${previousHistory}    Set Variable    邻居家中有类似腹泻患儿，该患儿与邻居类似病儿有接触史。
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
    ${assistCheck}    Set Variable    大便常规：无白细胞、红细胞及吞噬细胞，仅见脂肪球。大便轮状病毒抗原阳性。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    轮状病毒性肠炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"10","ageType":"月","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38","heartRate": "135","lowBldPress": "","highBldPress": ""}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-15行,推出疑似诊断:胃炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    上腹痛3个月余#####腹部膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹软，全腹无压痛、无反跳痛，肝、脾肋下未触及，墨菲征(-)，肝区叩痛(-)，移动性浊音(-)，肠鸣音正常。
    #现病史值
    ${presentHistory}    Set Variable    患者3个月前无明显诱因出现上腹隐痛，伴上腹胀，症状为持续性，与进食无关，无后背及肩部牵涉痛，无恶心、呕吐，无食欲下降，无吞咽困难、声音嘶哑，无发热、纳差、乏力，无呕血、黑便，未规律诊治，自服治胃药物效果差。患者自发病以来，饮食睡眠可，大小便未见明显异常，体重下降2～3kg。
    #既往史值
    ${previousHistory}    Set Variable
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    吸烟10余年，约10支/天，饮酒10余年
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
    ${assistCheck}    Set Variable    钡餐：胃炎、胃窦明显。CEA 6.85ng/ml(参考值0～5ng/ml)，CA724 13.58U/ ml(参考值0～6.9U/ml)。幽门螺杆菌染色(++)。血常规、肝肾功、乙肝五项未见明显异常。胃镜：糜烂性胃炎、十二指肠球炎。胃肠镜病理：(胃窦)慢性浅表性胃炎(中度)，伴急性活动。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    胃炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"46","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.5","heartRate": "72","lowBldPress": "85","highBldPress": "145"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-16行,推出疑似诊断:结肠恶性肿瘤,贫血
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    间断黑便3个月#####消瘦，贫血貌，浅表淋巴结未及肿大。心、肺查体正常。腹部平软，全腹无包块，无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音，未及血管杂音。肛诊结果未见异常，指套退出无染血。
    #现病史值
    ${presentHistory}    Set Variable    患者半年来一直乏力、头晕，3个月前查体发现贫血，未诊治。间断黑便3个月，为黑色成形或糊状便，大便与粪质混合，冲水后呈黑红色，每天1～2次，量约200 ml/d，排便前后无明显不适。既往排便1天1次，均为成形黄便。近半年体重下降6kg，纳差、乏力明显，无低热、盗汗。
    #既往史值
    ${previousHistory}    Set Variable    否认结核病史及接触史，不喝生牛奶，无高血压、高血脂、冠心病等慢性疾病。
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
    ${assistCheck}    Set Variable    便潜血试验阳性。血常规：WBC 6.99×109/L，N 0.75，HGB 74g/L，PLT 144×109/L；肝肾功能和电解质正常，Alb 32.4g/L。CEA 457 U/L。结肠镜：直肠息肉。升结肠近肝曲可见1枚巨大隆起病变，约3cm×2cm大小，占据管腔1/3，无蒂，表面黏膜充血、糜烂，触之易出血，活检质脆。周围可见多枚小息肉。活检病理：绒毛状腺瘤，部分癌变。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    结肠恶性肿瘤    贫血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"79","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.5","heartRate": "70","lowBldPress": "70","highBldPress": "110"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




消化科经典病历-17行,推出疑似诊断:肝脓肿
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛、发热1周，加重3天#####腹部正中可见一纵行手术疤痕，大约14cm。腹部平坦，未见胃肠型及蠕动波，腹软，右上腹压痛明显，无反跳痛，未触及包块及胆囊，Murphy征（-），肝脾肋下未触及，移动性浊音（-），肝区叩痛明显，肠鸣音4次/分。肛门、直肠、外生殖器未见异常。
    #现病史值
    ${presentHistory}    Set Variable    患者于1周前无明显诱因出现右上腹疼痛，呈持续性胀痛，时轻时重，右侧肩部酸痛，伴发热、纳差，无胸痛，无畏寒、盗汗。在当地诊所治疗效果不佳。近3日感觉腹痛加重、周身乏力，伴寒战、高热，体温最高达39℃，多为午后发作。无咳嗽、咳痰及喘憋，无咯血，无胸疼，无头疼及头晕，无胸闷、心悸及呼吸困难，无反酸嗳气，时有恶心，无呕吐，无尿频、尿急、尿痛，无肉眼血尿。无关节疼痛及光过敏，无脱发、皮疹、牙龈出血，无腰部疼痛不适，为求诊治入院。自发病来，神志清，精神不振，饮食不佳，体重无明显改变。
    #既往史值
    ${previousHistory}    Set Variable    胆囊炎切除手术10余年，3个月前因胆总管结石行ERCP术，无输血史。
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
    ${assistCheck}    Set Variable    血常规：WBC 12.9×109/L，NEUT% 81.24%。肝功：ALT 366U/L，AST 186U/L，GGT 332U/L。腹部CT：肝右叶类圆形囊性低密度，肝内胆管结石，胆管扩张。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肝脓肿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"40","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38.5","heartRate": "104","lowBldPress": "80","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




# 消化科经典病历-18行,推出疑似诊断:原发性肝癌,肝硬化失代偿期,
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    乏力、纳差、肝区隐痛一月余#####神志清，精神软，慢性肝病面容，皮肤巩膜轻度黄染，可见肝掌，前胸可见蜘蛛痣，扑翼样震颤未引出，全身未见瘀点瘀斑。心肺听诊无殊。腹隆，软，无压痛，反跳痛，肝肋下未及，肝区扣痛（＋），脾肋下2指，移动性浊音（＋），双下肢轻度水肿。
#     #现病史值
#     ${presentHistory}    Set Variable    患者一月前无明显诱因下出现四肢酸软无力，胃纳下降，右上腹隐痛不适。一月来明显消瘦，体重下降5kg左右。
#     #既往史值
#     ${previousHistory}    Set Variable    既往有“慢性乙型肝炎”病史20余年，“肝硬化病史”4年。否认烟酒嗜好，否认外伤手术史，否认输血史，无家族遗传病史。
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
#     ${assistCheck}    Set Variable    肿瘤标志物 AFP＞1000U/L，CA199 45U/L。肝功能 TBil 375μmol/L，Dbil 15μmol/L，ALB 27g/L，ALT72U/L，AST 48U/L，GGT93U/L，AKP105U/L。乙肝五项提示大三阳、HBV‐DNA 1×106copy/ml，抗HAV IgM（－），抗HCV（－），抗HDV（－），抗HEV IgM（－）。上腹部增强CT提示肝右叶占位性病变
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    原发性肝癌    肝硬化失代偿期
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "36.8","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
    # ...    currentDiseaseName=#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]
# }
#     ...    newRecogFlag=
...    newModelFlag=1
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-19行,推出疑似诊断:食管癌
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    吞咽困难进行性加重2个月#####未见异常
    #现病史值
    ${presentHistory}    Set Variable    2月余前无明显诱因出现吞咽困难，不伴恶心呕吐，自述于当地医院行钡餐检查未见异常，给予输液治疗，未见好转，后吞咽困难呈进行性加重，渐出现饮水呛咳。患者自发病以来，饮食以流质饮食为主，睡眠可，大小便正常，体重较前没有明显变化。
    #既往史值
    ${previousHistory}    Set Variable
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    生活规律，吸烟30年，20支/天，饮酒30余年，500ml/天。
    #家族史值
    ${familyHistory}    Set Variable    母亲死于肺癌，父亲健在，否认家族遗传病及传染病史。
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
    ${assistCheck}    Set Variable    胃镜检查：食管进镜约18cm见一隆起性肿物阻塞管腔，致管腔狭窄，阻力明显，镜身未能通过。诊断：食管上段占位。胸部CT：①食管上端及中段占位性病变②右侧颌下淋巴结肿大；③右中叶、左下肺炎。上消化道造影：食管中下段可见黏膜破坏、中断，管壁僵硬，管腔狭窄，病灶长约3个椎体高度，钡剂通过受阻，贲门未见异常。胃内可见潴留液及食物残留，胃黏膜显示欠佳。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    食管癌
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"47","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.5","heartRate": "80","lowBldPress": "87","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



# 消化科经典病历-20行,推出疑似诊断:急性阿米巴痢疾
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    腹痛、腹泻15天，发热3天#####心、肺（-）。腹平软，无腹壁静脉曲张，无胃肠型、蠕动波，腹部无包块，右下腹压痛明显，无反跳痛及肌紧张，墨菲征阴性，肝、脾肋下未触及，肝、脾、双肾区无叩痛，移动性浊音阴性，肠鸣音正常。
#     #现病史值
#     ${presentHistory}    Set Variable    患者15天前无明显诱因出现右下腹隐痛，呈间断性发作，无放射痛，同时出现腹泻，大便呈黄色稀糊状，无脓血，每天5-6次，里急后重不明显。自服抗生素治疗3天，仍腹痛，且腹泻加重，大便为血性黏液样，呈暗红色果酱样，量较前增多，有腥臭味。给予补液、抗生素等治疗，病情无好转。3天前开始低热，体温波动在37-38℃，无盗汗、畏寒、头痛，无咳嗽、咳痰、咯血等。
#     #既往史值
#     ${previousHistory}    Set Variable
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable    平素从事农田劳动，有直接饮用河水和井水的习惯，喜欢生食黄瓜、番茄及其他水果。
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
#     ${assistCheck}    Set Variable    血常规：WBC 1.2×109/L，N74%，L 26%，RBC 4.5×1012/L，HGB 145g/L，PLT 278×109/L。肝、肾功能正常。尿常规正常。大便常规：暗红色、果酱样，味腥臭，WBC10-15/HP，RBC满视野，少量夏科-雷登结晶。腹部B超：肝、胆、脾、胰均正常。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    急性阿米巴痢疾
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"25","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "38","heartRate": "80","lowBldPress": "78","highBldPress": "120"}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
    # ...    currentDiseaseName=#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]
# }
#     ...    newRecogFlag=
...    newModelFlag=1
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj}    ${assert}



消化科经典病历-21行,推出疑似诊断:胰恶性肿瘤
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛、腹胀2个月#####神志清楚，皮肤、巩膜无黄染，心肺未见特殊阳性体征，腹膨隆，无压痛，无反跳痛，移动性浊音阳性，肠鸣音4次／分。
    #现病史值
    ${presentHistory}    Set Variable    患者2个月前无明显诱因出现腹痛、腹胀不适，伴尿少，尿黄。无畏寒、发热、头痛、头昏、胸痛、咳嗽、气促、腹痛、腹泻、便秘、便血、血尿、呕血、黑便、恶心、呕吐、厌油、皮肤巩膜黄染、心慌气急、呼吸困难、意识障碍等症状。未治疗。患者腹胀症状进行性加重，伴精神食欲下降，进食后腹胀加重。当地治疗症状无明显缓解。发病以来，精神、睡眠、食欲欠佳，小便正常，大便3～4天一次。体重下降约8kg。
    #既往史值
    ${previousHistory}    Set Variable
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    无烟酒及其他不良嗜好。
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
    ${assistCheck}    Set Variable    ALT 145U／L，AST 153U／L，GGT 265U／L，Alb 35U／L，血清5′‐核苷酸酶19U／L。肾功示：血钠测定134.3mmol／L，血尿素测定2.30mmol／L，血糖测定6.91mmol／L。肿瘤标志物CA19‐9 800U／ml，CEA 20U／ml。腹水生化示：腺苷酸脱氨酶17.12U／L 总蛋白37.53g／L。腹水常规示：血性腹水，胸腹水李凡它试验阳性。腹水淀粉酶500U／L，凝血四项：APTT 41﹒7秒，Fib 5﹒55g／L，TT 13﹒8秒。CT 示①胰腺改变，性质待定②腹腔系膜增厚③腹水
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    胰恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"73","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-22行,推出疑似诊断:胰恶性肿瘤
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左下腹痛3个月余，腹泻伴腰背痛2个月余#####皮肤黏膜无色素沉着，结膜无苍白，巩膜无黄染，浅表淋巴结未触及肿大，双肺呼吸音清，心律齐，未闻及杂音，腹软，无压痛，未触及包块，肠鸣音4次/分，双下肢不肿。
    #现病史值
    ${presentHistory}    Set Variable    患者3个月余前无明显诱因出现左下腹痛，为阵发性绞痛，多于夜间发作，持续数十分钟后自行缓解，无放射痛，无腹胀、腹泻、里急后重，无便血、黑便等不适，当时未诊治，此后疼痛反复发作，2个月前给予中药通便治疗后出现腹泻，为黄色稀水样便，含大量不消化食物，每天10余次，每次量约100～200ml，禁食后腹泻可明显缓解，便中未见黏液、脓血，伴腹部两侧钝痛，放射至腰背部，腹泻后疼痛加重，但尚可忍受，持续数小时后可自行缓解，1个月前予补液、补钾、止泻及调节肠道菌群等治疗后腹泻次数较前减少，约3～4次/日，为黄色稀糊样便，每次量约300～400ml，但腹痛较前加重，为进一步诊治至我院门诊就诊，近期体重下降约15kg。
    #既往史值
    ${previousHistory}    Set Variable    高血压病史1年余，长期服用“阿司匹林及硝酸异山梨酯”治疗，否认糖尿病、冠心病等慢性病病史；否认肝炎、结核病史；否认药物过敏史。
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
    ${assistCheck}    Set Variable    血常规示白细胞8.47×109/L，中性粒细胞62.5%，血红蛋白150g/L，血小板259×109/L。尿常规大致正常。便常规示黄色糊状便，潜血阴性，脂肪球和虫卵阴性。便细菌培养阴性。便涂片找真菌可见真菌孢子，涂片未见结核杆菌。菌群分析示革兰阴性杆菌50%，阳性杆菌45%，真菌孢子5%。CA19-9 322.9ng/ml，CA125 6.9ng/ml，CA153 10.2ng/ml，AFP 3.5ng/ml，CEA 3.4ng/ml。腹部增强CT示胰头体积增大，其内见一类圆形稍低密度灶，边界欠清，增强扫描各期强化程度均低于胰腺组织，大小约1.7cm×1.2cm，肠系膜上动脉被包绕，胆总管下段可疑受累。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    胰恶性肿瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"57","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "89","lowBldPress": "75","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




消化科经典病历-23行,推出疑似诊断:消化性溃疡
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹痛6小时伴血便3次#####发育正常，营养中等，神志清楚，精神反应可，呼吸平稳，面色稍苍白，全身皮肤无黄染，无皮疹，未见出血点、紫癜，皮肤弹性好，浅表淋巴结未及肿大，睑结膜稍苍白，口唇色淡，咽无充血，心肺查体未见异常，腹稍膨隆，未见胃肠型及蠕动波，无腹壁静脉曲张。左中上腹压痛阳性，无反跳痛及肌紧张，未及包块，叩诊鼓音，移动性浊音阴性，肠鸣音3次/分。四肢关节无肿胀及活动受限，肢端暖，CRT＜1秒，甲床稍苍白。神经系统查体未见异常。
    #现病史值
    ${presentHistory}    Set Variable    患儿于入院前6小时无明显诱因突发腹痛，位于左中上腹，呈阵发性隐痛，疼痛不剧烈，无肩背部放射痛，有恶心，无呕吐、发热、腹胀，随后出现血便，共3次，前2次为柏油样便，最后1次为暗红色血便，每次量多，患儿逐渐出现面色苍白、头晕，并伴有四肢无力，无晕厥及意识丧失，无皮疹及皮肤黄疸，无关节肿痛及鼻出血，家长遂带患儿至急诊。发病以来，一般情况差，精神反应尚可，小便少。发病前无暴饮暴食及不洁饮食史。
    #既往史值
    ${previousHistory}    Set Variable    偶有腹痛，无反酸、嗳气、便血史。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    否认家族胃炎及消化性溃疡病史。
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
    ${assistCheck}    Set Variable    血常规：WBC 7.94×109/L，RBC 3.05×1012/L，PLT 259×109/L，Hb 85g/L，MCV、MCHC正常。CRP ＜8mg/L，ESR2mm/h。便常规：黑便，潜血（+），白细胞（－），虫卵（－）。凝血三项检查正常。放射性核素检查：未见异位胃黏膜显影。胃镜：食管黏膜光滑柔软，未见糜烂及溃疡，胃窦黏膜充血水肿，呈颗粒样改变，幽门圆，开闭自然。十二指肠球部无畸形，黏膜充血水肿，球腔前壁可见0.5cm×0.5cm溃疡，表面覆薄白苔，周围黏膜明显充血水肿，球后及降部未见异常。幽门螺旋杆菌IgG抗体：阳性。腹部B超：小肠积气明显，反复探查未见明确异常形态肠襻，未见同心圆征象，肝、脾、胰腺、胆囊双肾未见异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    消化性溃疡
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"14","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37.2","heartRate": "95","lowBldPress": "60","highBldPress": "95"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




神经科经典病历-2行,推出疑似诊断:流行性乙型脑炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热1天、抽搐1次#####精神稍倦怠，口唇红润，咽部充血，双侧扁桃体Ⅰ度肿大颈软
    #现病史值
    ${presentHistory}    Set Variable    1天前无明显诱因出现发热，精神食欲差，偶有头痛，无咳嗽、腹痛等。半天前突然出现四肢抽搐、双眼上翻，伴口吐泡沫，即送急诊，对症治疗后缓解，但患儿体温仍反复。第2天起患儿渐出现嗜睡，又抽搐一次，伴呕吐3次，哭闹不安。
    #既往史值
    ${previousHistory}    Set Variable    “高热惊厥”病史
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
    ${assistCheck}    Set Variable    血常规示WBC 18.7×109/L，中性粒细胞85%。，腰椎穿刺示脑脊液压力偏高，无色透明，潘氏试验（+），细胞数62×106/L，脑脊液涂片检查未见结核菌，脑脊液乙型脑炎特异性IgM抗体阳性
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    流行性乙型脑炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "39.6","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



神经科经典病历-3行,推出疑似诊断:流行性乙型脑炎,脑膜炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热5天，意识不清1天#####浅昏迷，压眶有反应，面色红，呼吸急促，双侧瞳孔等大等圆，对光反射迟钝，颈抵抗阳性，心律齐，112次/分，各瓣膜听诊区未闻及病理性杂音。四肢肌张力较高，双膝反射未引出，左侧巴氏征阳性，右侧巴氏征阴性。
    #现病史值
    ${presentHistory}    Set Variable    5天前无明显诱因发热，体温38°C～40°C，全身乏力，恶心、呕吐。无腹痛、腹泻，无尿频尿急尿痛。在当地医院消炎抗病毒治疗后，体温不降，尿蛋白（++），1天前意识不清，呈谵妄状态，半天后出现牙关紧闭，四肢屈曲，转入我院。无外耳道流脓史，无咽痛、无传染病接触史。未注射乙脑疫苗。居住地蚊虫较多，当地无类似疾病发生。
    #既往史值
    ${previousHistory}    Set Variable    既往体健。无结核病史
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    已婚、未育、职业为护士。
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
    ${assistCheck}    Set Variable    血常规：Hb:165g/L,WBC:11×109/L,NEU:0.8,LYM:0.2,PLT:115×109/L.尿常规：尿蛋白（++）；K+:4.0mmol/L,.脑脊液常规检查：微混，总细胞500×106/L，白细胞460×106/L，分类多核细胞0.70，单核0.30；生化检查：蛋白：558mg/L，糖3.48mmol/L，颅脑CT显示局限性低密度阴影。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    流行性乙型脑炎    脑膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"32","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38.4","heartRate": "112","lowBldPress": "100","highBldPress": "150"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



神经科经典病历-4行,推出疑似诊断:脑膜炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主因“发热12天，视物成双7天，意识模糊3天”于2007年1月25日收入神经内科重症监护病房。#####神经系统检查：嗜睡，呼之能睁眼，能回答简单问题，言语流利，能执行简单指令。双侧瞳孔不等大，右侧直径5mm，对光反射迟钝；左侧直径2.5mm，对光反射灵敏。右眼球外展充分，但内收、上视和下视均不能；左眼球各方向运动充分。张口不偏。额纹对称，左侧鼻唇沟浅。软腭上抬可，悬雍垂不无偏，咽反射存在，伸舌左偏。颈项强直，向左侧强迫头位，Kernig征阳性，Lasague征阳性。左上肢肌力0级，下肢2级，肌张力低，腱反射减弱，Babinski征阳性；右上、下肢肌力5级，肌张力正常，腱反射正常，Babinski征阴性。左偏身痛觉减退。
    #现病史值
    ${presentHistory}    Set Variable    患者入院前12天因受凉而发热（体温最高达38.5℃）、咳嗽、头痛，按“上感”治疗，但效果不佳。入院前7天视物成双，但无意识障碍、头晕、呕吐等不适，日常生活尚能自理。入院前3天寒战、多语、幻觉。核中性粒细胞60%，淋巴细胞12%，单核细胞7%，未见中幼粒细胞、晚幼粒细胞、嗜酸粒细胞、嗜碱粒细胞及有核红细胞。骨髓穿刺细胞学检查：粒系增生活跃，红系增生减低，巨核细胞及血小板正常，考虑与感染有关。按“血小板减少原因待查、颅内病变性质待定”给予甘露醇（250ml静脉输注，6小时1次）脱水降颅压治疗，头孢唑肟钠（2g静脉输注，12小时1次）抗感染治疗，氢化可的松（200mg静脉输注）抗感染治疗和补充血小板（静脉输注1单位）治疗。为进一步诊治收入N‐ICU。患者发病以来饮食差，二便可，无抽搐发作。
    #既往史值
    ${previousHistory}    Set Variable    既往体健。发病前10天义务献血200ml。否认药物过敏、输血、重大手术及外伤史，否认毒物接触史。
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
    ${assistCheck}    Set Variable    头颅CT检查显示：右侧大脑半球肿胀，脑沟变浅，右侧脑室轻度受压，中线结构轻度左移；右额颞骨板下可见条形低密度影；左上颌窦、双侧筛窦内片状影；提示右额顶少量硬膜下积液，左上颌窦和双侧筛窦、蝶窦炎症。多次血常规检查血小板低于正常（9～16×109／L）。凝血四项检查大致正常。血网织红细胞计数0.1%。血涂片镜检：杆状核中性粒细胞21%，分叶。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    脑膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"24","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37.6","heartRate": "68","lowBldPress": "64","highBldPress": "107"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




神经科经典病历-5行,推出疑似诊断:脑膜炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热，头痛，言语困难3天#####体温：38.0℃；脉搏：80次／分；呼吸：20次／分；血压：120／70mmHg。发育正常，营养中等。烦躁，双上肢抖动。神经系统查体：神志清楚，语言流利，高级智能正常，双目失明，余颅神经（－），四肢肌力Ⅴ－，肌张力正常。双侧腱反射对称低下（＋），左侧巴宾斯基征，Chaddock征（＋），颈有抵抗，下腭距前胸5 指，双侧凯尔尼格征（＋）。
    #现病史值
    ${presentHistory}    Set Variable    入院3天前，晨8时出现全头爆裂样疼痛，持续存在，无恶心、呕吐，进食差，发热，烦躁，双上肢不自主抖动，尿潴留，对外界问题能正确回答。能自行走路，生活能自理，走路较前缓慢。当日下午1时（发病5小时后）不能言语，但对别人的问题能正确反应。当地医院行头CT 检查：未见明显异常。次日晨4时（发病20小时后），来我院急诊，查血常规：WBC：19.6× 109／L；NEUT：17.4× 109／L；NEUT%：89.2%。血生化全项示胆红素异常，CK：208U／L。晨6时（发病22小时后），患者能够说话，给予阿奇霉素等治疗，头痛较前减轻，头爆裂样疼痛呈阵发性，每次1分钟内缓解。为进一步诊治入院。
    #既往史值
    ${previousHistory}    Set Variable    6年前，因车祸双眼失明，平时无头痛，否认输血史，平时无流清涕症状，无手术史，无药物和食物过敏史，无中毒史，免疫接种史随当地。11岁患甲型肝炎，否认其他传染病史，否认疫区和疫水接触史。
    #过敏史值
    ${allergyHistory}    Set Variable    青霉素，头孢曲松过敏。
    #个人史值
    ${personalHistory}    Set Variable    生于内蒙古，16岁到山西大同市，并长期生活在大同市。22岁结婚，生有1子，配偶和儿子均体健。20岁开始吸烟，20支／日，偶有饮酒。
    #家族史值
    ${familyHistory}    Set Variable    否认家族性遗传病史。
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
    ${assistCheck}    Set Variable    CSF 检查：压力135mmH2O，淡黄色；CSF 常规：细胞总数8120 ×106／L，白细胞4850 ×106／L；CSF 生化：蛋白 483mg／dl，糖10mg／dl，氯112mmol／L；G 染色、墨汁染色、抗酸染色均阴性。血常规检查：WBC：19.6×109／L；NEUT：17.4×109／L；NEUT%：89.2%。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    脑膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"32","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "80","lowBldPress": "70","highBldPress": "120"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}






神经科经典病历-6行,推出疑似诊断:脑出血
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    因剧烈头痛伴频吐2天为主诉人院。#####T 36℃，P110次／分，R 20次／分，Bp13／9kPa（98／68mmHg）。发育营养佳，神清，痛苦面容，烦躁不安，查体合作。内科系统检查未见异常。神经系统颅神经及周围神经亦未见异常。脑膜刺激征颈强明显，布氏征阳性，病理反射未引出。
    #现病史值
    ${presentHistory}    Set Variable    2天前被母用毛巾抽打到头部，半小时后患儿突然出现剧烈头痛，似炸裂样痛，以前额及后头部为重。随即出现喷射状呕吐20 余次，吐后自觉疼痛稍有减轻可忍受，但仍持续疼痛不止。病后无发热、无抽搐、无肢瘫、无意识障碍等。近一年来，有间歇性头痛，可片刻缓解。
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
    ${assistCheck}    Set Variable    WBC13.3×10 9／L，RBC 4﹒35 ×10 12／L，Hb122g／L。EEG 右枕、中央顶慢波灶，中度异常。TCD 左侧大脑中A、前A 轻度痉挛，右侧大脑后A 供血不足。脑脊液为均匀一致血性，离心后上清液黄染，压力偏高，除细胞数94 ×10 6／L，蛋白1.178／L 改变外；其余均正常。头部CT 检查左顶叶脑出血破入脑室。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    脑出血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"10","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36","heartRate": "110","lowBldPress": "68","highBldPress": "98"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




神经科经典病历-7行,推出疑似诊断:脑出血,脑梗死
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左侧肢体无力15小时#####神经系统：嗜睡，精神较差，声音较低微。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球活动自如，双侧额纹对称，左侧鼻唇沟变浅，示齿时口角右偏，伸舌左偏。左侧肢体肌力Ⅲ级，右侧肢体肌力Ⅴ级，四肢肌张力正常，双侧腱反射（＋＋），左侧巴氏征（＋）。左侧肢体痛觉减退，共济检查欠合作。右侧肢体感觉共济检查未见明显异常。颈软。
    #现病史值
    ${presentHistory}    Set Variable    15小时前晨起后发现左侧肢体活动不利，伴头痛，以右侧为著，呈持续性胀痛。当时左手不能持物，尚能行走，但步态不稳，不伴恶心、呕吐，无视物模糊，无耳鸣，无寒战高热，无大小便失禁，急就诊于某市中医院，当时测血压为190／120mmHg，为求进一步诊治就诊。自发病以来，患者精神差、嗜睡，暂未进食，大小便正常，体重无明显变化。
    #既往史值
    ${previousHistory}    Set Variable    既往体健，未监测血压、血糖，否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。
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
    ${assistCheck}    Set Variable    血常规：WBC 8﹒21×109／L，NEUT%70﹒8%，RBC 4﹒5×1012／L，HGB 150﹒0（g／L），PLT 178×109／L。凝血常规：PT 14﹒20秒，PA 86﹒00，INR 1﹒08，APTT 31﹒80秒，APTT‐R 1﹒11，Fib 2﹒27g／L，TT 14﹒30秒，TT‐R 1﹒02。血生化：ALT 15﹒00U／L，AST 23﹒00U／L，BUN 5﹒80mmol／L，CREA 86﹒0μmol／L，Na＋137﹒8mmol／L，K＋4﹒19mmol／L，CHOL 4﹒38，TG 0﹒79mmol／L，HDL 1﹒91mmol／L↓，LDL 2﹒54mmol／L，Glu 5﹒00mmol／L。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    脑出血    脑梗死
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.4","heartRate": "62","lowBldPress": "120","highBldPress": "190"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



神经科经典病历-8行,推出疑似诊断:脑梗死
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    神清，双侧瞳孔直径3mm，对称等大，对光反射灵敏，口齿含糊不清，对答切题，颈软，右侧肢体肌力Ⅳ级，右侧浅感觉减退，肌张力正常，左侧肌力肌张力正常，感觉正常，左巴氏征（+）。
    #现病史值
    ${presentHistory}    Set Variable    发作性口齿不清伴右侧肢体无力20余天，20天前起出现口齿不清，伴右侧肢体无力，持续约半小时左右缓解，无肢体麻木，无意识障碍，无头痛，无恶心、呕吐。
    #既往史值
    ${previousHistory}    Set Variable    既往史：高血压病史13年，最高达160/100mm　Hg。否认心脏病、糖尿病史，不饮酒，吸烟史7年（每天5支）。
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
    ${assistCheck}    Set Variable    实验室检查：血糖5.42mmol/L，总胆固醇5.01mmol/L，高密度脂蛋白1.45mmol/L，低密度脂蛋白3.72mmol/L。辅助检查：头颅CT检查示左侧额、顶区低密度灶；头颅MRI检查示左侧额、顶叶T1W低信号，T2W高信号。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    脑梗死
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



神经科经典病历-9行,推出疑似诊断:偏头痛
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复右侧头部发作性疼痛10年，再发2天。#####神经系统检查：神清语利，双眼裂等大，眼球各方向活动充分，无眼球震颤，双瞳孔等大、正圆，直径3.0mm，直接间接对光反射灵敏，余脑神经检查无阳性体征；四肢肌力、肌张力、腱反射对称正常，未引出病理反射，共济运动协调，双侧深浅感觉对称正常；颈软，无抵抗，Kernig 征（-），Brudzinski征（-）。眼科检查：视力正常、眼压正常、眼底检查未见异常。
    #现病史值
    ${presentHistory}    Set Variable    患者于10年前无明显诱因开始出现右侧头部发作性疼痛。每次头痛发作前有视物模糊、星形闪光，持续10分钟左右，随后出现右侧眶后、额颞部搏动性疼痛，伴有恶心、呕吐、冷汗、面色苍白，对光和声音特别敏感，持续6～12小时。头痛发作时喜欢躲在黑暗的房间睡眠或服止痛药缓解头痛。月经、疲劳及情绪激动可诱发，病程中无发热、头晕，头痛与体位改变关系不大，每年发作5～10次不等，每次发病症状大致相同，无进行性加重趋势，不发作时如常。
    #既往史值
    ${previousHistory}    Set Variable    以往身体健康，否认头颈部外伤史、脑炎、脑膜炎及癫痫病史；否认眼耳鼻喉齿科疾病、高血压以及糖尿病等病史；无化学毒物接触及长期滥用药物史，月经正常。
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
    ${assistCheck}    Set Variable    1.头颅及颈椎CT、头颅MRI未见异常；脑电图正常；经颅超声多普勒提示椎基底动脉血流速度加快。2. 腰椎穿刺术 脑脊液检查压力、常规、生化均正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    偏头痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.7","heartRate": "86","lowBldPress": "70","highBldPress": "115"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



# 神经科经典病历-10行,推出疑似诊断:偏头痛,颅内肿瘤
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    因“左侧头痛、恶心、呕吐7天，视物成双5天”就诊。#####神志清楚，对答切题，头颅五官无畸形，左眼睑下垂，左侧瞳孔直径3.5mm，对光反射减弱，右侧瞳孔直径2.5mm，对光反射灵敏，左侧眼球运动内收、上下视受限，外展正常，无眼球震颤，右侧眼球活动正常。
#     #现病史值
#     ${presentHistory}    Set Variable    患者7天前无诱因出现左侧搏动性头痛，以左颞、额部及眼眶为主，伴恶心、呕吐，呕吐为胃内容物，无先兆症状及发热、鼻塞、流涕、流泪、畏光等症状，自服止痛片无好转。2天后感眼花、视物成双、自觉左眼睑上抬无力。病程中无肢体乏力、步态不稳，不伴头晕、耳鸣、听力下降、吞咽困难、饮水呛咳、言语含糊及胸闷、气促等症状。患者诉近4年来有类似发作3次，每次持续约20余天自行恢复，不遗留任何症状。无毒物接触史，无烟酒嗜好，家族中无偏头痛患者及慢性遗传性疾病病史。
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
#     ${assistCheck}    Set Variable    头颅MRI平扫+增强扫描显示两侧海绵窦不对称，左侧海绵窦扩大，局部可见块影病变，T1相呈等信号，T2相呈稍低信号；增强扫描显示左侧海绵窦区肿块病灶明显强化；头颅MRA提示：左侧颈内动脉海绵窦段狭窄、粗糙。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    偏头痛    颅内肿瘤
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "36.7","heartRate": "","lowBldPress": "65","highBldPress": "105"}
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



神经科经典病历-11行,推出疑似诊断:偏头痛
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复头痛3年#####心脏各瓣膜区未闻及病理性杂音。神经系统检查：神清，言语清晰，眼球各方向活动自如，瞳孔等大正圆，脑神经未见异常，四肢肌力5 级，肌张力适中。双侧膝反射、踝反射对称存在，双侧Babinski 征阴性，颈软。
    #现病史值
    ${presentHistory}    Set Variable    个性敏感，无高血压、糖尿病史，家族中无类似疾病史。反复头痛3年#####心脏各瓣膜区未闻及病理性杂音。神经系统检查：神清，言语清晰，眼球各方向活动自如，瞳孔等大正圆，脑神经未见异常，四肢肌力5 级，肌张力适中。双侧膝反射、踝反射对称存在，双侧Babinski 征阴性，颈软。患者3年前出现头痛，为双枕部持续性钝痛，如带子紧束头部或呈头周紧箍感、压迫感或沉重感，偶有恶心，不伴呕吐、畏光或畏声、视力障碍等，几乎每日均有不适，曾行头部CT 检查未发现异常。头痛重时服用对乙酰氨基酚，头痛略减轻。体位改变不加重，自觉生气、紧张等情绪变化时明显，注意力转移可减轻。曾就诊于北京某大医院，诊断枕大神经痛，采用风池穴局部封闭，症状稍有减轻。头痛频繁发作，但日常生活不受影响。10天前自觉工作压力大症状加重，行头部MRI 检查未见异常，EEG 正常。为明确诊治，以头痛待查入院。病来有头晕、心烦、失眠、焦虑等症状，同时颈肩背部肌肉有僵硬感，捏压时肌肉感觉舒适。无发热、体重减轻、复视或耳鸣，无抽搐发作，无意识障碍，尿便正常。
    #既往史值
    ${previousHistory}    Set Variable    个性敏感，无高血压、糖尿病史，家族中无类似疾病史。
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
    ${assistCheck}    Set Variable    头颅MRI、CT 检查和EEG 检查未见异常
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    偏头痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"29","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.3","heartRate": "64","lowBldPress": "114","highBldPress": "72"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


神经科经典病历-12行,推出疑似诊断:颅内感染,脑膜炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热、头痛、恶心、呕吐5天，烦躁不安、胡言乱语1天。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志模糊，谵妄状态，问话部分可回答，语言流利，查体不合作。双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，视乳头边界欠清晰，色淡红，A∶V＝2∶3。额纹对称，口角无偏斜，伸舌居中，咽反射存在。四肢可自主活动，双侧肱二头肌腱反射（＋＋），双膝腱反射（＋＋），四肢肌张力可，双侧病理征。颈抵抗，颏下2横指。感觉检查不配合。
    #现病史值
    ${presentHistory}    Set Variable    5天前出现发热，体温最高38.1℃，以午后为重，夜间有盗汗，伴有头痛，以双侧顶部为重，呈胀痛，难以忍受，伴恶心及喷射性呕吐，呕吐物为胃内容物，无咳嗽、咳痰，就诊于当地医院。给予抗病毒、抗感染、脱水降低颅内压等药物治疗，头痛稍缓解，但仍发热。1天前患者出现烦躁不安，胡言乱语，不能与人交流，仍高热，体温达39.0℃，并行脑电图检查：广泛中度异常，为求进一步诊治转入综合医院神经内科病房。
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
    ${assistCheck}    Set Variable    血常规：白细胞计数（WBC）14.5×109／L，中性粒细胞分类（NEUT%）88%↑，红细胞计数（RBC）4.1×1012／L，血小板计数（PLT）240×109／L。血生化：血钠离子：131mmol／L↓，钾离子：4.2mmol／L，葡萄糖：6.2mmol／L↑，余无异常。腰椎穿刺术检查：脑脊液压力300mmH2O，外观无色透明；脑脊液常规：总细胞数300×106／L，白细胞数220×106／L，单核80%，多核20%；脑脊液生化：蛋白：1.6g／L，葡萄糖：2.6mmol／L，氯化物：116mmol／L。脑电图：广泛中度异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    颅内感染    脑膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"36","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38.9","heartRate": "99","lowBldPress": "89","highBldPress": "139"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




神经科经典病历-13行,推出疑似诊断:病毒性脑炎,细菌性脑膜炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发热、头痛10天，意识障碍、小便失禁1天入院。#####体温38℃，心前区有收缩期及舒张期杂音，余一般内科检查未见异常。精神症状明显，有时问话可答，有时不答，检查不合作、违拗，颅神经检查未见明显异常，四肢均可动，无明显偏瘫，双下肢张力稍高，反射活跃，双上肢反射偏弱，双侧掌颌反射阳性，双侧巴氏征阳性，脑膜刺激征阴性。
    #现病史值
    ${presentHistory}    Set Variable    10天前感冒、发热、头痛，体温多在38℃上下，有时达40℃，1天前出现精神恍惚，小便失禁。平时身健。
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
    ${assistCheck}    Set Variable    胸片示双侧肺纹理增重。心脏彩超示主动脉瓣及二尖瓣关闭不全。脑电图轻度弥散异常。周围血白细胞11×10 9/L，中性粒细胞偏高，腰穿压力180mmH2O（脱水后），内容正常（白细胞数2个）。头颅CT，示双侧大脑多发斑片状及片状低密度影，以皮层为主，右颞枕部有一三角形低密度影，无占位效应；E～H为CT增强扫描，示软脑膜强化，病灶本身强化不明显，另见脑回水肿
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    病毒性脑炎    细菌性脑膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"23","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "38","heartRate": "","lowBldPress": "","highBldPress": ""}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


神经科经典病历-14行,推出疑似诊断:急性脊髓炎
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    以“发热10天，双下肢麻木、无力1周”为主诉入院。#####T：37.8℃，P：78次／分，R：21次／分，BP：104／70mmHg，心脏各瓣膜区未闻及病理性杂音。神经系统检查：脑神经检查未见异常。右下肢肌力4 级弱，左下肢及双上肢肌力4 级，T2 以下痛觉感觉减退。双上肢腱反射（＋），双下肢腱反射（＋＋＋），双侧踝阵挛（＋），双侧病理征（＋），大、小便困难。
    #现病史值
    ${presentHistory}    Set Variable    患者10天前发热37.3℃，并咽痛，1周前双下肢麻木，逐渐向上蔓延至胸部，同时伴有双下肢无力（以右下肢为主），双上肢麻木无力，逐渐出现排尿、排便困难、盗汗。为明确诊治以“脊髓炎？”入院。病来无头痛、恶心、呕吐，饮食、睡眠略差。
    #既往史值
    ${previousHistory}    Set Variable    否认特殊病史及近期接种史。
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
    ${assistCheck}    Set Variable    MRI 示：颈3～7 脊髓增粗，髓内片状异常信号（T1略低信号、T2 高信号）（图12‐1）。腰穿脑脊液检查：压力正常范围，脑脊液物色透明，单核细胞50 ×106／L，蛋白0.5g／L，糖及氯化物正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    急性脊髓炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"44","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37.8","heartRate": "78","lowBldPress": "70","highBldPress": "104"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



神经科经典病历-15行,推出疑似诊断:帕金森病
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    左下肢震颤半年。#####神志清楚，语言流利，近记忆力差，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，皱额有力，余颅神经检查未见明显异常，四肢肌力Ⅴ级，肌张力高，双侧腱反射（＋＋），双侧病理征未引出，感觉、共济检查未见明显异常。慌张步态，左下肢于静止时震颤较明显。
    #现病史值
    ${presentHistory}    Set Variable    患者缘于半年前在感冒输液治疗后出现左下肢震颤，震颤在静止时明显，活动时减轻，不伴肢体无力、肢体抽搐及舞蹈样动作，不伴头痛、头晕，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，近1个月患者左下肢震颤较前加重，伴左手不灵活。
    #既往史值
    ${previousHistory}    Set Variable    既往体健，否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。家族史
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable    吸烟史10年，现已戒烟，偶饮酒，量少。
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
    ${assistCheck}    Set Variable    血常规：WBC 7﹒18×109／L，NT%69﹒1%，RBC 4﹒3×1012／L，HGB 138g／L，PLT 212×109／L。血生化：CHOL 3﹒63mmol／L，TG 0﹒79mmol／L，HDL 1﹒02mmol／L↓，LDL 2﹒86mmol／L，余无异常。头颅MRI示：轻度脑萎缩。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    帕金森病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "72","lowBldPress": "67","highBldPress": "114"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}


神经科经典病历-16行,推出疑似诊断:特发性震颤
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    双手抖动3年#####神经系统查体：神清，语利，颅神经检查（－），四肢肌力5 级，右手可见姿势性震颤，四肢肌张力正常，深浅感觉正常，腱反射（＋＋），病理征（－）。
    #现病史值
    ${presentHistory}    Set Variable    3年前，患者逐渐出现双手抖动（右手较左手稍重），在拿东西、写字或紧张、情绪激动时抖动明显，静止时不抖动，近1年出现头部轻微震颤，情绪激动时加重。无肢体无力、麻木。
    #既往史值
    ${previousHistory}    Set Variable    既往史：糖尿病。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    家族史：母亲有类似病史。
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
    ${assistCheck}    Set Variable    头颅MRI 未见异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    特发性震颤
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



神经科经典病历-17行,推出疑似诊断:癫痫
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    发作性抽搐3天#####神志清楚，言语流利，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。双上肢肌力Ⅴ级，肱二头肌腱反射（＋＋），双下肢肌力Ⅴ级，膝腱反射（＋＋）。深浅感觉检查未见异常。双侧病理征阴性。颈软，无抵抗。共济运动检查稳准、协调。
    #现病史值
    ${presentHistory}    Set Variable    3天前无明显诱因突然出现抽搐，表现为双眼上吊，双上肢屈曲，双下肢伸直，伴有小便失禁，当时唤之不能答应，伴有舌咬伤，约20分钟后症状缓解，缓解后如正常人，遂就诊于当地医院，行头颅CT检查：平扫未见异常，随机血糖：7.4mmol／L，血常规检查：白细胞计数（WBC）5.6×109／L，血红蛋白（Hgb）123g／L，血小板计数（PLT）230×109／L，未予特殊治疗。1天前再次出现上述症状，表现为双眼上吊，双上肢屈曲，双下肢伸直，唤之不能应，伴有小便失禁、舌咬伤，约30分钟后缓解，缓解后如正常人，为求进一步诊治收入神经内科病房。
    #既往史值
    ${previousHistory}    Set Variable    既往体健。无发热、感冒史，否认高血压、心脏病病史，否认结核等传染病病史，无手术、外伤及输血史，预防接种史不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    父母均体健，家族中无此类疾病发生。
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
    ${assistCheck}    Set Variable    随机血糖：7.4mmol／L。心电图：窦性心律，正常心电图。头颅CT：平扫未见异常。脑电图：脑电图未见异常，无癫痫样异常放电。生化全项回报：肝功能、肾功能、电解质均在正常范围脑脊液检查回报：腰椎穿刺术检查：脑脊液压力150mmH2O，常规：外观无色透明，白细胞计数3×106／L，脑脊液生化：蛋白0.3g／L，葡萄糖2.6mmol／L，氯化物113mmol／L，提示均在正常范围。头颅MRI：平扫未见异常。脑电图：脑电图正常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"28","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "90","lowBldPress": "79","highBldPress": "126"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



神经科经典病历-18行,推出疑似诊断:低钾型周期性麻痹
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    四肢无力1天。#####发育正常，营养好，神志清，抬入病房，被动体位，查体合作。神志清，问答切题，定向力、记忆力、计算力正常。视力、视野粗测无异常，眼底视乳头边界清。双侧瞳孔等大等圆，对光反射存在。双眼球活动自如，无眼球震颤，双眼睑无下垂。面部痛觉正常，咀嚼运动对称有力，双侧角膜反射存在。双侧额纹及鼻唇沟对称，味觉无异常。听力正常。无吞咽困难、饮水呛咳及发音嘶哑。咽反射存在。胸锁乳头肌无萎缩，转颈、耸肩对称有力。伸舌居中。无肌萎缩，四肢肌张力减弱。双上肢肌力3级，双下肢肌力2级，腱反射消失。全身痛觉无异常。脑膜刺激征未引出。病理反射未引出。无共济运动失调。
    #现病史值
    ${presentHistory}    Set Variable    患者下午跑步时感双下肢肌肉疼痛，当时未引起重视。晚饭前感四肢乏力，行走困难。晚上病情逐渐加重，双下肢不能行走及站立，双上肢不能抬举，双手不能持物。排尿困难。无肢体麻木及抽搐。病程中无发热及腹泻。
    #既往史值
    ${previousHistory}    Set Variable    无类似发病史。否认慢性腹泻史。否认外伤及手术史。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    无类似发病史，无遗传性疾病史。
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
    ${assistCheck}    Set Variable    血钾1.9mmol /L，肝功能、肾功能、血糖、血脂均正常，血常规、尿常规、大便常规均正常，胸部平片正常。心电图提示低血钾。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    低钾型周期性麻痹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"22","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "80","lowBldPress": "75","highBldPress": "105"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}
######



神经科经典病历-19行,推出疑似诊断:蛛网膜下腔出血,高血压
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    头痛、恶心、呕吐3小时。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志清楚，语言流利，双瞳孔等大等圆，d＝4.0mm，对光反射灵敏，眼球活动自如，眼睑无下垂，额纹对称，鼻唇沟对称，示齿口角无偏斜，咬肌有力，咽反射存在，转头、耸肩有力，伸舌居中。四肢肌力Ⅴ级，四肢肌张力可。双肱二头肌腱反射（＋＋）、双膝腱反射（＋＋），右侧巴氏征，左侧巴氏征。颈抵抗，颏下4横指。克氏征阳性。无感觉障碍。
    #现病史值
    ${presentHistory}    Set Variable    3小时前打麻将时突然出现头痛，以整个顶部为著，呈胀痛，伴恶心、喷射性呕吐，呕吐物为胃内容物，无肢体活动障碍，无头晕、耳鸣等，无意识丧失、尿便失禁，无发热、咳嗽、咳痰，就诊于综合医院，脑CT示：脑沟、脑裂及外侧裂高密度影，考虑蛛网膜下腔出血。心电图：窦性心律，正常心电图，为求进一步治疗入神经内科病房。
    #既往史值
    ${previousHistory}    Set Variable    高血压病史3年，最高达160／90mmHg，平素服用卡托普利，一次12.5mg，每日3次，血压控制在130／70mmHg水平；否认糖尿病史；否认心脏病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    家族中无心、脑血管疾病患者。
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
    ${assistCheck}    Set Variable    脑CT：脑沟、脑裂及外侧裂高密度影。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    蛛网膜下腔出血    高血压
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"55","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.4","heartRate": "99","lowBldPress": "74","highBldPress": "130"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




神经科经典病历-20行,推出疑似诊断:癫痫样发作
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    1周内反复晕倒5次#####
    #现病史值
    ${presentHistory}    Set Variable    上课时，突然两眼上翻，头后仰，手上举，晕倒；面色苍白，四肢抽搐，呼之不应，2～3分钟后清醒，但不知有发作之事，全身瘫痪30分钟。23日、26日又有2次发作，发作时不伴有咬牙、粪尿失禁，亦无发作先兆症状。患者1天前常规注射A群脑膜炎球菌多糖疫苗0.5ml
    #既往史值
    ${previousHistory}    Set Variable    患儿既往身体健康，无任何相关疾病的过敏惊厥史和后遗症。曾接种过脊髓灰质炎糖丸疫苗、乙脑及百白破疫苗，均无癫痫发作。
    #过敏史值
    ${allergyHistory}    Set Variable
    #个人史值
    ${personalHistory}    Set Variable
    #家族史值
    ${familyHistory}    Set Variable    据调查患儿三代近亲亦无癫痫史。
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
    ${assistCheck}    Set Variable    脑电图左侧慢波，尖波较右侧显著，癫痫样异常放电
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    癫痫样发作
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"8","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
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
    ...    newModelFlag=1
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}





# 神经科经典病历-21行,推出疑似诊断:脑梗死,高血压,2型糖尿病
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。
#     #现病史值
#     ${presentHistory}    Set Variable    患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。
#     #既往史值
#     ${previousHistory}    Set Variable    既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
#     #过敏史值
#     ${allergyHistory}    Set Variable
#     #个人史值
#     ${personalHistory}    Set Variable    吸烟30年，40支／日，饮酒30年，白酒5两／日。
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
#     ${assistCheck}    Set Variable    尿常规：葡萄糖（＋＋＋＋）；OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    脑梗死    高血压    2型糖尿病
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"53","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "36.2","heartRate": "82","lowBldPress": "87","highBldPress": "148"}
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
