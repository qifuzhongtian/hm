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
    List Should Contain Sub List    ${aj}    ${assert}






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
    List Should Contain Sub List    ${aj}    ${assert}




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
    List Should Contain Sub List    ${aj}    ${assert}

