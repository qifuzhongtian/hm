*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***



# 呼吸科经典病历-2行,推出疑似诊断:慢性阻塞性肺病伴急性加重,心功能不全
#     [Documentation]    断言""
#     #Set Variable后边四个空格+中文是输入
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    咳嗽、咳痰20年，加重伴气促10天#####球结膜无水肿，口唇无发绀，颈静脉无怒张；两侧胸廓对称呈桶状，肋间隙增宽，两肺叩诊呈过清音，两肺呼吸音低，未闻及干湿性啰音；HR 80次/分，律齐，无杂音，腹软，无压痛、反跳痛。双下肢无水肿。
#     #现病史
#     ${presentHistory}    Set Variable    患者咳嗽、咳痰20年。10天前因受凉后出现咽痛、咳嗽、咳白色黏痰、气喘，活动后明显。3天前出现畏寒、发热，伴纳差、乏力。无双下肢水肿、夜间阵发性呼吸困难，能平卧。无意识障碍、大小便失禁等症状。自行服用头孢拉定、沐舒坦片等药物治疗未见明显好转。
#     #既往史
#     ${previousHistory}    Set Variable    曾患左侧结核性胸膜炎，正规服用抗结核治疗1年，复查胸片已治愈。有左侧股骨头坏死病史，4年前出现胃溃疡出血，已治愈。无高血压、糖尿病病史。
#     #过敏史
#     ${allergyHistory}    Set Variable
#     #个人史
#     ${personalHistory}    Set Variable    吸烟1200年支，饮白酒40年，每天约500ml，已戒烟4年，戒酒5年
#     #家族史
#     ${familyHistory}    Set Variable    妻及2子女健康，父母已故，兄弟姐妹健在
#     #月经史
#     ${menstrualHistory}    Set Variable
#     #婚育史
#     ${obstericalHistory}    Set Variable
#     #诊疗计划
#     ${assessmentPlan}    Set Variable
#     #检查结果
#     ${examinationResult}    Set Variable
#     #检验结果
#     ${labTestResult}    Set Variable
#     #评分结果
#     ${gradeResult}    Set Variable
#     #预防接种史
#     ${vaccinationHistory}    Set Variable
#     #输血史
#     ${bloodTransfusionHistory}    Set Variable
#     #生命体征
#     ${vitalSigns}    Set Variable
#     #辅助检查
#     ${assistCheck}    Set Variable
#     #主要健康问题
#     ${majorHealth}    Set Variable    血常规：WBC 18.72×109/L，N 89.6%，ESR 51mm/h，CRP205 mg/L。肝功能：ALB 33g/L，ALT 28IU/L。腹部B超：肝、胆、胰腺、脾脏、肾脏未见异常。心脏彩超示：心脏各房室大小正常；三尖瓣少量反流。肺功能：FEV1/FVC 55%，支气管舒张试验阴性。心电图：窦性心律，交界性早搏。胸部CT：慢性支气管炎、肺气肿伴肺大泡形成；两肺多发陈旧性灶伴左侧胸膜增厚、钙化。
#     ${assert}    Create List    慢性阻塞性肺病伴急性加重    心功能不全
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"1","age":"79","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "36","heartRate": "80","lowBldPress": "80","highBldPress": "130"}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"主要健康问题","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
#     ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}




# 呼吸科经典病历-3行,推出疑似诊断:肺栓塞,肺结核,肺炎
#     [Documentation]    断言""
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    咳嗽、咳痰伴发热10天#####Ht173cm。气管居中，浅表淋巴结未及肿大，左下肺呼吸音减弱，可闻及湿啰音，语音震颤较右侧增强。
#     #现病史值
#     ${presentHistory}    Set Variable    患者于10天前受凉后出现咳嗽、咳白黏痰，痰中偶带血丝，量少，伴发热，体温波动在37.5-39℃之间，伴寒战、大汗，时有胸闷、胸痛。查血常规示WBC 15×109/L，N 86%，胸片示左下肺炎症。给予美洛西林治疗3天后，体温无明显下降。加用阿奇霉素治疗3天后症状仍无改善，自觉胸痛加重
#     #既往史值
#     ${previousHistory}    Set Variable    既往体健，否认高血压、糖尿病、肝炎等慢性病，否认药物及食物过敏史，否认疫区及禽类接触史，否认冶游史。
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
#     ${assistCheck}    Set Variable    血常规：RBC 4.33×1012/L，Hb 140g/L，WBC 15.2×109/L，N 86%，PLT 277×109/L。胸片：左下肺炎症。3天后血常规：WBC 17.5×109/L，N 88%。肝肾功能及电解质均正常。ESR：70mm/h。CRP：65mg/L。D-二聚体：8.4μg/ml。血气分析：pH值7.40，PaCO280mmHg。肿瘤指标均正常。胸部CT示左下肺大片实变影。
#     #主要健康问题值
#     ${majorHealth}    Set Variable
#     ${assert}    Create List    肺栓塞    肺结核    肺炎
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#     ...    doctorGuid=0210497    doctorName=
#     ...    patientInfo={"gender":"","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "90","lowBldPress": "80","highBldPress": "120"}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"0201","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":"${presentHistory}"},{"key":"既往史","value":"${previousHistory}"},{"key":"初步诊断","value":"${Assessment}"},{"key":"过敏史","value":"${allergyHistory}"},{"key":"个人史","value":"${personalHistory}"},{"key":"家族史","value":"${familyHistory}"},{"key":"月经史","value":"${menstrualHistory}"},{"key":"婚育史","value":"${obstericalHistory}"},{"key":"其他诊断","value":""},{"key":"诊疗计划","value":"${assessmentPlan}"},{"key":"检查结果","value":"${examinationResult}"},{"key":"检验结果","value":"${labTestResult}"},{"key":"评分结果","value":"${gradeResult}"},{"key":"预防接种史","value":"${vaccinationHistory}"},{"key":"输血史","value":"${bloodTransfusionHistory}"},{"key":"生命体征","value":"${vitalSigns}"},{"key":"辅助检查","value":"${assistCheck}"},{"key":"","value":"${majorHealth}"}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ...    operationRecord=
#     ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
#     ...    newRecogFlag=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     List Should Contain Sub List    ${aj[:10]}    ${assert}



呼吸科经典病历-4行,推出疑似诊断:哮喘,心力衰竭,慢性支气管炎,肺癌
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
    ${assert}    Create List    哮喘    心力衰竭    慢性支气管炎    肺癌
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"","age":"37","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "120","lowBldPress": "75","highBldPress": "120"}
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
    ...    patientInfo={"gender":"1","age":"42","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "37","heartRate": "116","lowBldPress": "80","highBldPress": "140"}
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
    List Should Contain Sub List    ${aj}    ${assert}




呼吸科经典病历-6行,推出疑似诊断:大叶性肺炎,肺结核,肺脓肿
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
    ${assert}    Create List    大叶性肺炎    肺结核    肺脓肿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "40","heartRate": "100","lowBldPress": "75","highBldPress": "120"}
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






呼吸科经典病历-7行,推出疑似诊断:支气管扩张,慢性支气管炎,肺结核,肺脓肿
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
    ${assert}    Create List    支气管扩张    慢性支气管炎    肺结核    肺脓肿
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
    ...    newRecogFlag=
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



呼吸科经典病历-9行,推出疑似诊断:肺结核,肺炎,急性肺脓肿,肺癌,支气管扩张
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
    ${assert}    Create List    肺结核    肺炎    急性肺脓肿    肺癌    支气管扩张
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}


呼吸科经典病历-10行,推出疑似诊断:肺癌,肺炎,肺脓肿
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
    ${assert}    Create List    肺癌    肺炎    肺脓肿
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
    ...    newRecogFlag=
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
    ...    newRecogFlag=
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



呼吸科经典病历-13行,推出疑似诊断:哮喘,慢性支气管炎
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
    ${assistCheck}    Set Variable    肺CT检查结果：右肺上叶后段见斑块样钙化灶，无浸润病变。肺功能检查提示小气道功能轻度降低，支气管激发试验阳性。诱导痰细胞学检查：嗜酸细胞占18%。血清过敏原检测结果：猫狗皮毛（+），总IgE升高，外周血嗜酸细胞增高（9.8%）。PPD试验：  局部硬结直径5mm（+）。痰涂片查结核阴性。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    哮喘    慢性支气管炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-14行,推出疑似诊断:胸膜炎,肺炎,肺结核
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
    ${assert}    Create List    胸膜炎    肺炎    肺结核
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
    ...    newRecogFlag=
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




呼吸科经典病历-16行,推出疑似诊断:非小细胞肺癌,支气管扩张,肺结核,肺脓肿,急性肺栓塞,肺曲霉病
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
    ${assert}    Create List    非小细胞肺癌    支气管扩张    肺结核    肺脓肿    急性肺栓塞    肺曲霉病
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



呼吸科经典病历-17行,推出疑似诊断:肺癌,慢性肺脓肿,支气管扩张,间质性肺病,肺结核
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
    ${assistCheck}    Set Variable    "血常规：WBC 9.2×109/L，S 65%，L 20%，Hb 119g/ L。肝功能、肾功能、血糖正常，血肿瘤标志物正常。心脏扇扫正常。肝胆脾B超结果正常。肺CT：左肺下野降主动脉旁见一3.5cm×4.5cm大小块状影，有分叶，纵隔内见数个肿大淋巴结。纤维支气管镜结果：左肺下叶背段见菜花样肿物，余各级支气管黏膜光滑管腔通畅。病理结果：小细胞型肺癌"
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肺癌    慢性肺脓肿    支气管扩张    间质性肺病    肺结核
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}




呼吸科经典病历-18行,推出疑似诊断:哮喘,慢性支气管炎
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
    ${assert}    Create List    哮喘    慢性支气管炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





呼吸科经典病历-19行,推出疑似诊断:气管肿瘤,支气管哮喘
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
    ${assert}    Create List    气管肿瘤    支气管哮喘
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj}    ${assert}



呼吸科经典病历-20行,推出疑似诊断:哮喘
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
    ${assistCheck}    Set Variable    ①血常规：白细胞总数11.1×109/L，中性粒细胞77%。②血气分析（吸氧2L/min）：pH 7.321，PaO2  65.5mmHg，PaCO2 53.7mmHg，HCO3－ 22.1mmol/L。③床头胸片：双肺透过度增高。④心电图：窦性心动过速。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    哮喘
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
    ...    newRecogFlag=
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
    ...    newRecogFlag=
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-4行,推出疑似诊断:消化性溃疡
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    间断呕吐2个月#####患者消瘦体型，慢性病容，生命体征正常。浅表淋巴结未及。腹部可见巨大胃型，触诊张力高，振水音（+），肠鸣音正常，余未见异常。
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
    ${assistCheck}    Set Variable    立伟腹部平片：大量胃潴留，幽门梗阻。幽门螺杆菌（Hp）阳性。未见膈下游离气体。胃镜：十二指肠球部溃疡、球腔变形狭窄。活检病理：慢性炎症。腹部CT：幽门梗阻，十二指肠球部黏膜增厚。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    消化性溃疡,
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"27","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-6行,推出疑似诊断:肠易激综合征,感染性腹泻
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复腹痛、腹泻2年余#####营养良好。浅表淋巴结未触及肿大，心、肺查体正常。腹部平软，全腹无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音。
    #现病史值
    ${presentHistory}    Set Variable    患者2年前开始反复于进冰冷食物或冷水后出现脐周、下腹绞痛，程度不剧烈，不放射，不影响日常生活。伴腹泻，3～5次/日，为黄色稀水或稀糊便，不含油滴及未消化食物，无脓血，无恶臭，不伴里急后重。腹痛多在腹泻后缓解。上述症状多在每日上午出现，进早餐后加重，如不进早餐症状减轻，夜间无腹泻。不伴发热、皮疹、体重下降、水肿等。
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
    ${assistCheck}    Set Variable    粪常规：WBC、RBC（－），便潜血（－）×3次；便苏丹Ⅲ染色（－）。血常规：WBC 7﹒8 ×109/L，N 0﹒65，HGB 132g/L，PLT 257 ×109/L；肝肾功能、电解质正常。甲状腺功能：T3、T4、TSH均正常范围。ESR 10 mm/h；CRP 0.7 mg/dl。B超：肝胆胰脾及双肾未见明显异常。全消化道造影未见异常。结肠镜：进镜至末段回肠10c m，所经末段回肠、结肠、直肠黏膜未见异常。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    肠易激综合征    感染性腹泻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"1","age":"38","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "36.4","heartRate": "64","lowBldPress": "70","highBldPress": "120"}
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



消化科经典病历-7行,推出疑似诊断:原发性硬化性胆管炎,
    [Documentation]    断言""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    反复皮肤瘙痒5年，加重伴黄染半个月#####神志清楚，查体合作。皮肤巩膜中度黄染，心肺未见阳性体征，腹平软，无压痛，肝未触及、无叩痛，脾于左肋下2cm可触及，无压痛。移动性浊音阴性，双下肢无水肿。
    #现病史值
    ${presentHistory}    Set Variable    患者近5年来无明显诱因反复出现皮肤瘙痒，常感乏力不适，无皮疹，曾服抗过敏药物治疗，症状时轻时重。近半个月来皮肤巩膜黄染，瘙痒加重，无发热、腹痛，体重无减轻。
    #既往史值
    ${previousHistory}    Set Variable    无胆石症等胆道疾病，无手术史，否认肝炎、饮酒及服药史
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
    ${assistCheck}    Set Variable    尿胆原阳性。肝功能：总蛋白 61.4g/L、白蛋白 38.9g/L、球蛋白 22.5g/L、ALT 480U/L、AST 371U/L、ALP 134U/L、GGT 326U/L、TBA 196.2μmol/L、TBIL 99.9μmol/L、DBIL 67.7μmol/L、IBIL 32.2μmol/L；胆固醇 4.5μmol/L、甘油三酯 3.27mmol/L。MRCP 肝内外胆管变细、僵直，肝门区胆管显示欠佳。胆囊不大，壁稍厚，脾脏大。肝组织病理检查提示小胆管减少，胆管周围纤维组织明显增生。
    #主要健康问题值
    ${majorHealth}    Set Variable
    ${assert}    Create List    原发性硬化性胆管炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=0210497    doctorName=
    ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "35.2","heartRate": "90","lowBldPress": "85","highBldPress": "120"}
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}



消化科经典病历-9行,推出疑似诊断:急性细菌性痢疾,
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
    ${assert}    Create List    急性细菌性痢疾
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}




消化科经典病历-10行,推出疑似诊断:胃炎,消化性溃疡,胃癌,急性胰腺炎
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
    ${assert}    Create List    胃炎    消化性溃疡    胃癌    急性胰腺炎
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
    ...    newRecogFlag=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    List Should Contain Sub List    ${aj[:10]}    ${assert}





消化科经典病历-11行,推出疑似诊断:胃恶性肿瘤,消化不良,胃溃疡
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
    ${assert}    Create List    胃恶性肿瘤    消化不良    胃溃疡
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

