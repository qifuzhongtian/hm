*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Delete All Sessions    # 字段名 类型 是否必须 说明    # userGuid String 是 患者ID（接入放定义）    # doctorGuid String 是 医生ID（接入放定义）    # serialNumber String 是 业务流水ID（接入方定义）
...               # hospitalGuid String 是 医院ID（惠每分配）    # gender Integer 否 性别1男,0女    # age double 否 年龄    # ageType String 否 岁、月、天    # bodyTempr Double 否 体温    # weight Double 否 体重    # heartRate Integer 否 心率
...               # lowBldPress Integer 否 收缩压    # highBldPress Integer 否 舒张压    # examInfo String 否 检查    # previousHistory String 否 既往史    # personalHistory String 否 个人史    # allergyHistory String 否 过敏史    # familyHistory String 否 家族史
...               # symptom String 否 主诉    # confirmDiagnosis String 否 已确定诊断    # assistCheck    辅助检查
Force Tags        skip    profileskip
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***

*** Test Cases ***
神经科经典病历2行
    [Documentation]    断言:""
    # 神经科经典病历L
    #    [Documentation]    断言:""
    #    ${getRes}    智能诊断3.0    symptom=
    #    ...    previousHistory=
    #    ...    personalHistory=
    #    ...    allergyHistory=
    #    ...    familyHistory=
    #    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    #    ...    confirmDiagnosisMap={"key": "","value":"流行性乙型脑炎"}
    #    ...    presentHistory=
    #    ...    assistCheck=
    #    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    #    Should Contain    ${aj[:10]}    胆石病
    ######神经科经典病历
    ${getRes}    智能诊断3.0    age=2    ageType=岁    allergyHistory=    bodyTempr=39.6    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=“高热惊厥”病史
    ...    symptom=发热1天、抽搐1次#####精神稍倦怠，口唇红润，咽部充血，双侧扁桃体Ⅰ度肿大颈软 1天前无明显诱因出现发热，精神食欲差，偶有头痛，无咳嗽、腹痛等。半天前突然出现四肢抽搐、双眼上翻，伴口吐泡沫，即送急诊，对症治疗后缓解，但患儿体温仍反复。第2天起患儿渐出现嗜睡，又抽搐一次，伴呕吐3次，哭闹不安。    weight=    assistCheck=血常规示WBC 18.7×109/L，中性粒细胞85%。，腰椎穿刺示脑脊液压力偏高，无色透明，潘氏试验（+），细胞数62×106/L，脑脊液涂片检查未见结核菌，脑脊液乙型脑炎特异性IgM抗体阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    流行性乙型脑炎

神经科经典病历3行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=发热5天，意识不清1天#####浅昏迷，压眶有反应，面色红，呼吸急促，双侧瞳孔等大等圆，对光反射迟钝，颈抵抗阳性，心律齐，112次/分，各瓣膜听诊区未闻及病理性杂音。四肢肌张力较高，双膝反射未引出，左侧巴氏征阳性，右侧巴氏征阴性。5天前无明显诱因发热，体温38°C～40°C，全身乏力，恶心、呕吐。无腹痛、腹泻，无尿频尿急尿痛。在当地医院消炎抗病毒治疗后，体温不降，尿蛋白（++），1天前意识不清，呈谵妄状态，半天后出现牙关紧闭，四肢屈曲，转入我院。无外耳道流脓史，无咽痛、无传染病接触史。未注射乙脑疫苗。居住地蚊虫较多，当地无类似疾病发生。    previousHistory=既往体健。无结核病史    personalHistory=已婚、未育、职业为护士。    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=38.4    lowBldPress=100    highBldPress=150    examInfo=
    ...    heartRate=112    age=32    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=血常规：Hb:165g/L,WBC:11×109/L,NEU:0.8,LYM:0.2,PLT:115×109/L.尿常规：尿蛋白（++）；K+:4.0mmol/L,.脑脊液常规检查：微混，总细胞500×106/L，白细胞460×106/L，分类多核细胞0.70，单核0.30；生化检查：蛋白：558mg/L，糖3.48mmol/L，颅脑CT显示局限性低密度阴影。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    # log    ${aj}
    Should Contain    ${aj}    流行性乙型脑炎

神经科经典病历4行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=发热、头痛6天，加重伴意识模糊、左侧肢体无力1天#####T38.8℃，P86次／分，R20次／分，Bp150／80mmHg。神经系统检查：意识模糊，轻度烦躁。双眼裂等大，眼球居中，各方向活动不受限。双侧瞳孔不等大，左侧3.5mm3右侧2.5mm，对光反射灵敏。眼底检查不配合。角膜反射存在。额纹及鼻唇沟对称。咽反射存在，伸舌居中。左上下肢肌力3级，右上下肢肌力5级；四肢肌张力正常；腱反射正常；双侧Hoffman征阳性，左Chaddock征阳性，双Babinski征阴性。颈抵抗阳性，Kernig征阳性。其他神经系统检查不配合。6天前淋雨后出现畏寒、发热（39℃）、头痛、头晕，按“上呼吸道感染”予以静脉输注氧氟沙星，3天后体温降至正常停止使用。入院前1天再次发热（40℃），头痛加重，多次呕吐胃内容物，但为非喷射性；意识模糊，不认家人，答不切题；左侧肢体无力。我院急诊头颅CT扫描显示：“右侧基底核区占位性病变，性质待定”（图14－1）。    previousHistory=既往无高血压病和糖尿病史，无中耳炎、鼻窦炎、皮肤疖肿等感染史，无颅脑外伤史；无慢性疾病及传染病史。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=38.8    lowBldPress=80    highBldPress=150    examInfo=
    ...    heartRate=86    age=68    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=血常规：WBC16.3×109／L，NE80%，RBC4.66×1012／L，Hb154g／L，PLT150×109／L。血生化：GLU173mg／dl，Ca2＋8﹒1mg／dl，Cl－94mmol／L，其余指标正常。发病第8天腰椎穿刺脑脊液检查：外观淡黄微浊；压力170mmH2O；WBC814×106／L，多核粒细胞18%，单核细胞82%；葡萄糖1.4mmol／L（25mg／dl），氯化物128mmol／L，蛋白3.92g／L（392mg／dl）；革兰染色未找到细菌，细菌培养阴性，墨汁染色未见隐球菌，抗酸染色未见结核杆菌；结核抗体（同期血液结核抗体阴性）、病毒抗体、囊虫抗体均阴性。发病第9天头颅MRI显示：“右侧丘脑T1WI高信号、T2WI不规则高信号，边缘模糊；Gd‐DTPA强化显示病灶呈环形强化，形态规则，壁薄，约2.8×2.3cm大小，周边水肿，右侧侧脑室和第三脑室受压，右侧中脑受压”
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    log    ${aj}
    Should Contain    ${aj}    脑脓肿

神经科经典病历5行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因反复头痛2个月，伴右侧肢体不全性偏瘫15天入院#####体温36.7℃，神清，双视乳头轻度水肿，右上肢肌力Ⅲ级，下肢为Ⅱ级，感觉无缺失，病理征未及。CT：左枕部可见一等密度影，附近可见大片状低密度影，左侧脑室受压变小并向右移，增强后可见多个边缘性强化之囊状肿块，考虑为Ⅱ～Ⅲ级星形细胞瘤.因反复头痛2个月，伴右侧肢体不全性偏瘫15天入院，在术中发现此占位为囊性肿块，包膜完整有韧性，予以穿刺抽出稠厚脓液有臭味，遂肉眼下全切。术后病检为“脑脓肿胞膜形成期”。    previousHistory=10年前患有肝脓肿，于3月前“感冒”“发热”一次，因无大碍，故未引起重视。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=36.7    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=46    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=白细胞计数：10.6×109／L
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑脓肿

神经科经典病历6行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因发热、恶寒、伴头痛1天，以“发热待查”收住我院内科治疗。#####入院体查：体温38.9℃，嗜睡状，指鼻试验及跟膝胫试验均阳性，双肺有大量湿性罗音，可闻及喉中痰鸣音，呼吸急促30次／分，因发热、恶寒、伴头痛1天，以“发热待查”收住我院内科治疗。经内科治疗5天，体温虽得到控制，但头痛不减反而增剧，且逐渐出现意识障碍，追问病史患者起病后即有行走困难，右侧肢体协调运动障碍。    previousHistory=既往有慢性化脓性中耳炎。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=38.9    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=36    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap={"key": "","value":""}    presentHistory=
    ...    assistCheck=CT检查：右侧小脑占位性病变、双侧脑室积水，考虑右小脑半球脑脓肿
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑脓肿

6.神经科经典病历7行-1
    [Documentation]    断言:"化脓性脑膜炎"
    ${getRes}    智能诊断3.0    symptom=主因“发热12天，视物成双7天，意识模糊3天”于2007年1月25日收入神经内科重症监护病房。#####神经系统检查：嗜睡，呼之能睁眼，能回答简单问题，言语流利，能执行简单指令。双侧瞳孔不等大，右侧直径5mm，对光反射迟钝；左侧直径2.5mm，对光反射灵敏。右眼球外展充分，但内收、上视和下视均不能；左眼球各方向运动充分。张口不偏。额纹对称，左侧鼻唇沟浅。软腭上抬可，悬雍垂不无偏，咽反射存在，伸舌左偏。颈项强直，向左侧强迫头位，Kernig征阳性，Lasague征阳性。左上肢肌力0级，下肢2级，肌张力低，腱反射减弱，Babinski征阳性；右上、下肢肌力5级，肌张力正常，腱反射正常，Babinski征阴性。左偏身痛觉减退。患者入院前12天因受凉而发热（体温最高达38.5℃）、咳嗽、头痛，按“上感”治疗，但效果不佳。入院前7天视物成双，但无意识障碍、头晕、呕吐等不适，日常生活尚能自理。入院前3天寒战、多语、幻觉。核中性粒细胞60%，淋巴细胞12%，单核细胞7%，未见中幼粒细胞、晚幼粒细胞、嗜酸粒细胞、嗜碱粒细胞及有核红细胞。骨髓穿刺细胞学检查：粒系增生活跃，红系增生减低，巨核细胞及血小板正常，考虑与感染有关。按“血小板减少原因待查、颅内病变性质待定”给予甘露醇（250ml静脉输注，6小时1次）脱水降颅压治疗，头孢唑肟钠（2g静脉输注，12小时1次）抗感染治疗，氢化可的松（200mg静脉输注）抗感染治疗和补充血小板（静脉输注1单位）治疗。为进一步诊治收入N‐ICU。患者发病以来饮食差，二便可，无抽搐发作。    previousHistory=既往体健。发病前10天义务献血200ml。否认药物过敏、输血、重大手术及外伤史，否认毒物接触史。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=37.6    lowBldPress=64    highBldPress=107    examInfo=
    ...    heartRate=68    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    化脓性脑膜炎

6.神经科经典病历7行-2
    [Documentation]    断言:"血小板减少症"
    ${getRes}    智能诊断3.0    symptom=主因“发热12天，视物成双7天，意识模糊3天”于2007年1月25日收入神经内科重症监护病房。#####神经系统检查：嗜睡，呼之能睁眼，能回答简单问题，言语流利，能执行简单指令。双侧瞳孔不等大，右侧直径5mm，对光反射迟钝；左侧直径2.5mm，对光反射灵敏。右眼球外展充分，但内收、上视和下视均不能；左眼球各方向运动充分。张口不偏。额纹对称，左侧鼻唇沟浅。软腭上抬可，悬雍垂不无偏，咽反射存在，伸舌左偏。颈项强直，向左侧强迫头位，Kernig征阳性，Lasague征阳性。左上肢肌力0级，下肢2级，肌张力低，腱反射减弱，Babinski征阳性；右上、下肢肌力5级，肌张力正常，腱反射正常，Babinski征阴性。左偏身痛觉减退。患者入院前12天因受凉而发热（体温最高达38.5℃）、咳嗽、头痛，按“上感”治疗，但效果不佳。入院前7天视物成双，但无意识障碍、头晕、呕吐等不适，日常生活尚能自理。入院前3天寒战、多语、幻觉。核中性粒细胞60%，淋巴细胞12%，单核细胞7%，未见中幼粒细胞、晚幼粒细胞、嗜酸粒细胞、嗜碱粒细胞及有核红细胞。骨髓穿刺细胞学检查：粒系增生活跃，红系增生减低，巨核细胞及血小板正常，考虑与感染有关。按“血小板减少原因待查、颅内病变性质待定”给予甘露醇（250ml静脉输注，6小时1次）脱水降颅压治疗，头孢唑肟钠（2g静脉输注，12小时1次）抗感染治疗，氢化可的松（200mg静脉输注）抗感染治疗和补充血小板（静脉输注1单位）治疗。为进一步诊治收入N‐ICU。患者发病以来饮食差，二便可，无抽搐发作。现病史:入院3天前，晨8时出现全头爆裂样疼痛，持续存在，无恶心、呕吐，进食差，发热，烦躁，双上肢不自主抖动，尿潴留，对外界问题能正确回答。能自行走路，生活能自理，走路较前缓慢。当日下午1时（发病5小时后）不能言语，但对别人的问题能正确反应。当地医院行头CT 检查：未见明显异常。次日晨4时（发病20小时后），来我院急诊，查血常规：WBC：19.6× 109／L；NEUT：17.4× 109／L；NEUT%：89.2%。血生化全项示胆红素异常，CK：208U／L。晨6时（发病22小时后），患者能够说话，给予阿奇霉素等治疗，头痛较前减轻，头爆裂样疼痛呈阵发性，每次1分钟内缓解。为进一步诊治入院。    previousHistory=既往体健。发病前10天义务献血200ml。否认药物过敏、输血、重大手术及外伤史，否认毒物接触史。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=37.6    lowBldPress=64    highBldPress=107    examInfo=
    ...    heartRate=68    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    血小板减少症

神经科经典病历8行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=发热，头痛，言语困难3天#####体温：38.0℃；脉搏：80次／分；呼吸：20次／分；血压：120／70mmHg。发育正常，营养中等。烦躁，双上肢抖动。神经系统查体：神志清楚，语言流利，高级智能正常，双目失明，余颅神经（－），四肢肌力Ⅴ－，肌张力正常。双侧腱反射对称低下（＋），左侧巴宾斯基征，Chaddock征（＋），颈有抵抗，下腭距前胸5 指，双侧凯尔尼格征（＋）。    previousHistory=6年前，因车祸双眼失明，平时无头痛，否认输血史，平时无流清涕症状，无手术史，无药物和食物过敏史，无中毒史，免疫接种史随当地。11岁患甲型肝炎，否认其他传染病史，否认疫区和疫水接触史。    personalHistory=生于内蒙古，16岁到山西大同市，并长期生活在大同市。22岁结婚，生有1 子，配偶和儿子均体健。20岁开始吸烟，20支／日，偶有饮酒。    allergyHistory=青霉素，头孢曲松过敏。    familyHistory=否认家族性遗传病史。
    ...    weight=65    gender=1    bodyTempr=38    lowBldPress=70    highBldPress=120    examInfo=
    ...    heartRate=80    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="CSF 检查：压力135mmH2O，淡黄色；CSF 常规：细胞总数8120 ×106／L，白细胞4850 ×106／L；CSF 生化：蛋白 483mg／dl，糖10mg／dl，氯112mmol／L；G 染色、墨汁染色、抗酸染色均阴性。血常规检查：WBC：19.6×109／L；NEUT：17.4×109／L；NEUT%：89.2%。"
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    化脓性脑膜炎

神经科经典病历9行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因剧烈头痛伴频吐2天为主诉人院。#####T 36℃，P110次／分，R 20次／分，Bp13／9kPa（98／68mmHg）。发育营养佳，神清，痛苦面容，烦躁不安，查体合作。内科系统检查未见异常。神经系统颅神经及周围神经亦未见异常。脑膜刺激征颈强明显，布氏征阳性，病理反射未引出。现病史:2天前被母用毛巾抽打到头部，半小时后患儿突然出现剧烈头痛，似炸裂样痛，以前额及后头部为重。随即出现喷射状呕吐20 余次，吐后自觉疼痛稍有减轻可忍受，但仍持续疼痛不止。病后无发热、无抽搐、无肢瘫、无意识障碍等。近一年来，有间歇性头痛，可片刻缓解。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=36    lowBldPress=68    highBldPress=98    examInfo=
    ...    heartRate=120    age=10    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=WBC13.3×10 9／L，RBC 4﹒35 ×10 12／L，Hb122g／L。EEG 右枕、中央顶慢波灶，中度异常。TCD 左侧大脑中A、前A 轻度痉挛，右侧大脑后A 供血不足。脑脊液为均匀一致血性，离心后上清液黄染，压力偏高，除细胞数94 ×10 6／L，蛋白1.178／L 改变外；其余均正常。头部CT 检查左顶叶脑出血破入脑室。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    脑出血

神经科经典病历10行-1
    [Documentation]    断言:"脑出血"
    ${getRes}    智能诊断3.0    symptom=左侧肢体无力15小时#####神经系统：嗜睡，精神较差，声音较低微。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球活动自如，双侧额纹对称，左侧鼻唇沟变浅，示齿时口角右偏，伸舌左偏。左侧肢体肌力Ⅲ级，右侧肢体肌力Ⅴ级，四肢肌张力正常，双侧腱反射（＋＋），左侧巴氏征（＋）。左侧肢体痛觉减退，共济检查欠合作。右侧肢体感觉共济检查未见明显异常。颈软。现病史:    previousHistory=既往体健，未监测血压、血糖，否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=75    gender=1    bodyTempr=36.4    lowBldPress=120    highBldPress=190    examInfo=
    ...    heartRate=64    age=48    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="血常规：WBC 8﹒21×109／L，NEUT%70﹒8%，RBC 4﹒5×1012／L，HGB 150﹒0（g／L），PLT 178×109／L。凝血常规：PT 14﹒20秒，PA 86﹒00，INR 1﹒08，APTT 31﹒80秒，APTT‐R 1﹒11，Fib 2﹒27g／L，TT 14﹒30秒，TT‐R 1﹒02。血生化：ALT 15﹒00U／L，AST 23﹒00U／L，BUN 5﹒80mmol／L，CREA 86﹒0μmol／L，Na＋137﹒8mmol／L，K＋4﹒19mmol／L，CHOL 4﹒38，TG 0﹒79mmol／L，HDL 1﹒91mmol／L↓，LDL 2﹒54mmol／L，Glu 5﹒00mmol／L。"
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑出血

神经科经典病历10行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    symptom=左侧肢体无力15小时#####神经系统：嗜睡，精神较差，声音较低微。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球活动自如，双侧额纹对称，左侧鼻唇沟变浅，示齿时口角右偏，伸舌左偏。左侧肢体肌力Ⅲ级，右侧肢体肌力Ⅴ级，四肢肌张力正常，双侧腱反射（＋＋），左侧巴氏征（＋）。左侧肢体痛觉减退，共济检查欠合作。右侧肢体感觉共济检查未见明显异常。颈软。现病史:    previousHistory=既往体健，未监测血压、血糖，否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=75    gender=1    bodyTempr=36.4    lowBldPress=120    highBldPress=190    examInfo=
    ...    heartRate=64    age=48    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="血常规：WBC 8﹒21×109／L，NEUT%70﹒8%，RBC 4﹒5×1012／L，HGB 150﹒0（g／L），PLT 178×109／L。凝血常规：PT 14﹒20秒，PA 86﹒00，INR 1﹒08，APTT 31﹒80秒，APTT‐R 1﹒11，Fib 2﹒27g／L，TT 14﹒30秒，TT‐R 1﹒02。血生化：ALT 15﹒00U／L，AST 23﹒00U／L，BUN 5﹒80mmol／L，CREA 86﹒0μmol／L，Na＋137﹒8mmol／L，K＋4﹒19mmol／L，CHOL 4﹒38，TG 0﹒79mmol／L，HDL 1﹒91mmol／L↓，LDL 2﹒54mmol／L，Glu 5﹒00mmol／L。"
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

神经科经典病历11行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因左侧肢体麻木，无力4个月，头痛伴喷射样呕吐2个月入院。#####入院检查：神清，双眼视乳头水肿，左半身痛觉减退，左上、下肢肌张力增高，肌力4 级。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=腰穿脑脊液压力2.75kPa，细胞数9 ×10 6／L，蛋白定量0.6g／L。脑电图示右额顶区局灶性慢波，头颅平片无异常。头颅CT 显示右颞顶大片不规则低密度阴影，范围为2.8cm×3.6cm，病灶外缘达皮质。脑皮质密度稍高，右侧脑室轻度受压与移位。增强后低密度区未见强化，脑皮质呈现回状轻度强化（CT 值由平扫时39 H 增至59 H）。CT 诊断：右顶叶胶质瘤。行右前开颅肿块切除术，病变组织活检证实为脑型血吸虫病。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑型血吸虫病

神经科经典病历12行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=#####神清，双侧瞳孔直径3mm，对称等大，对光反射灵敏，口齿含糊不清，对答切题，颈软，右侧肢体肌力Ⅳ级，右侧浅感觉减退，肌张力正常，左侧肌力肌张力正常，感觉正常，左巴氏征（+）。现病史:发作性口齿不清伴右侧肢体无力20余天，20天前起出现口齿不清，伴右侧肢体无力，持续约半小时左右缓解，无肢体麻木，无意识障碍，无头痛，无恶心、呕吐。    previousHistory=既往史：高血压病史13年，最高达160/100mm　Hg。否认心脏病、糖尿病史，不饮酒，吸烟史7年（每天5支）。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=66    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=实验室检查：血糖5.42mmol/L，总胆固醇5.01mmol/L，高密度脂蛋白1.45mmol/L，低密度脂蛋白3.72mmol/L。辅助检查：头颅CT检查示左侧额、顶区低密度灶；头颅MRI检查示左侧额、顶叶T1W低信号，T2W高信号。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    #    Should Contain    ${aj}    脑梗死

神经科经典病历13行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=#####血压105/75mm　Hg，心肺查体未见异常。现病史:入院3天前，患者在工作疲劳后出现右颞部持续胀痛，当时未予诊治。入院1天前夜间起床上厕所时自觉左侧肢体活动不利，不能站立，伴恶心、呕吐及头痛。无意识障碍，无头昏，无肢体抽搐。    previousHistory=既往史：10年前发现心脏病，心电图检查示早博。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=51    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑梗死

神经科经典病历14行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=#####神清，口齿含糊不清，对答切题，颈软，左侧肢体肌力正常，左侧浅感觉正常，肌张力正常，左侧巴氏征（−）。现病史:左侧同向性偏盲2小时，视动性眼震颤，双侧瞳孔对光反射正常，双侧眼球运动正常；无意识障碍，无头昏，无肢体抽搐。高血压病史10年，血压145/100mm　Hg，血糖18.24mmol/L。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=68    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=辅助检查：头颅CT检查示右侧枕区低密度灶；头颅MRI检查示右侧枕区T1WI低信号，T2WI高信号；
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑梗死

神经科经典病历15行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=#####神志清，反应迟钝，口齿模糊，对答切题，右侧鼻唇沟浅，伸舌偏右，咽壁反射减退，洼田饮水试验2级（可疑），右侧肢体肌张力减退，左侧肢体肌张力正常，右侧肢体肌力0级，四肢腱反射（++），双侧Hoffmann征（−），双侧巴氏征（−）。现病史:因右侧肢体无力伴口齿不清1天，加重5小时入院。    previousHistory=既往有高血压病史    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=80    highBldPress=140    examInfo=
    ...    heartRate=    age=77    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="辅助检查：头颅　MRI检查示左侧基底节区新鲜梗死灶。头颅MRA检查示左侧大脑中动脉M1段明显狭窄、闭塞，周围见少量侧支血管；左侧后交通动脉局部狭窄。左侧椎动脉上段多发狭窄。影像学诊断：左侧基底节脑梗死（图1-137）。美国国立卫生院神经功能缺损评分（NIHSS）12分。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑梗死

神经科经典病历16行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=1994年5月以四肢运动障碍5个月为主诉来诊#####状态尚好，神志清，搀扶入病房，呼吸平稳，颈短，后发际低。无面瘫，双眼球运动灵活，双瞳孔等大正圆，有水平眼震，伸舌居中，张口下颌不偏，转头受限。四肢肌张力增强，肌力I V 级，无肌萎缩。走路不稳，两足距离宽，昂白征（闭目直立征）阳性，Mann 征（足尖对另一足跟站立）阳性，指鼻不准，跟膝胫试验阳性。腱反射亢进，巴彬斯基征双侧均阳性，霍夫曼征左可疑，右阳性。脑膜刺激征阴性。现病史:无明显诱因患儿于5个月前出现双下肢无力，继之双上肢无力，双手无力，吃饭拿筷子及穿衣困难，不能系纽扣及提裤子。近3个月出现走路不稳如喝醉酒样；走路跌跤，站立不稳。近1个月来除上述症状加重外出现吐字不清；饮水呛咳、眼球震颤。病来无颈痛及肢体麻木，无尿便及痛温觉障碍，无头痛、呕吐，无热。    previousHistory=既往无脑疾患史，生时无窒息，生长发育良好，智力正常。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=11    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=颅侧位片：颅底测量见环椎和枢椎齿突向枕骨大孔内突出，齿突上端位于腭‐枕线以上10mm。齿突向后仰。头部MRI：各序列扫描双侧大脑半球、小脑及桥脑未见异常，脑室、脑池正常，中线结构不偏。枕骨斜坡畸形变大，枢椎齿突向后移位，位置高压迫颈髓，使颈部脊髓成角畸形。MRI结合X 线片诊断颅底凹陷症，枢椎齿突后移压迫颈髓成角畸形。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    颅底凹陷症

神经科经典病历17行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=头晕、四肢麻木2年，行走不稳5天#####短颈，后发际低。现病史:主因“头晕、四肢麻木2年，行走不稳5天”入院，摔倒当时有短暂昏迷，苏醒后自觉四肢麻木症状加重。伴有头晕，声音嘶哑、吞咽困难、构音障碍和舌肌萎缩。查体：眼球震颤。颈部及上肢疼痛。有躯干束带感，行走乏力，大、小便障碍，气短，说话无力。    previousHistory=有外伤史；无高血压、糖尿病、梅尼埃综合征病史    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=53    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=X线片显示寰枕融合，颅底畸形。头颅MRI：颈椎无不稳，椎间孔无狭窄。肺功能检查：肺功能轻度下降
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    颅底凹陷症

神经科经典病历18行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=产后2天，头痛、恶心、呕吐及间断性抽搐#####体检：神志清楚，舌咬伤，肌张力正常，未引出病理反射，血压150/95mmHg。    previousHistory=有外伤史；无高血压、糖尿病、梅尼埃综合征病史    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=95    highBldPress=150    examInfo=
    ...    heartRate=    age=22    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=CT平扫：双侧额顶叶皮质下及半卵圆中心（图44a）、两侧颞枕叶（未列出）多发斑片状低密度影。T1WI病变呈低信号（图44b）。T2WI及FLAIR图像显示上述病变呈斑片状高信号，对称性分布，皮质也见受累，局部脑回肿胀
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压性脑病

神经科经典病历19行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=#####神清、面色苍白、肺无音，心无杂音，节律正，神经系统无异常体征。现病史:自3岁半起经常头痛，为一侧或双侧太阳穴痛，每次持续1～3小时，无视觉先兆，间隔时间不定。每2个月左右或3～4个月发作一次，间歇期正常。近半年头痛比以前加重，每月1～2次，表现为先双眼前闪光、暗点、视物模糊，而后部分视野缺失，20分钟后头晕以后偏头痛，常为右侧有搏动感，伴恶心、呕吐、畏光、厌烦声音和气味，让家长闭灯、遮窗帘、用被或衣服蒙头，持续2小时左右入睡。醒后头痛已减轻，感到头痛，发胀，2日后消失。10日前第2次来诊正值头痛发作，家人搀扶入诊室，用手捂着左侧太阳穴，不时呻吟。本次发作已1小时，先是视觉先兆，眼前闪光出现“马赛克” 状的图形，而后左眼眶痛，很快波及额颞部，恶心，腹痛就诊中吐过2次胃内容。自3岁半起做头CT3次，头MRI 4次，均未见异常。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=父母均有偏头痛史。
    ...    weight=    gender=1    bodyTempr=    lowBldPress=95    highBldPress=150    examInfo=
    ...    heartRate=    age=22    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=数字减影脑血管造影（DSA）无脑血管畸形。经颅多普勒（TCD）大脑前A、中A 供血不足。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    偏头痛

神经科经典病历20行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=反复右侧头部发作性疼痛10年，再发2天。#####神经系统检查：神清语利，双眼裂等大，眼球各方向活动充分，无眼球震颤，双瞳孔等大、正圆，直径3.0mm，直接间接对光反射灵敏，余脑神经检查无阳性体征；四肢肌力、肌张力、腱反射对称正常，未引出病理反射，共济运动协调，双侧深浅感觉对称正常；颈软，无抵抗，Kernig 征（-），Brudzinski征（-）。眼科检查：视力正常、眼压正常、眼底检查未见异常。现病史: 患者于10年前无明显诱因开始出现右侧头部发作性疼痛。每次头痛发作前有视物模糊、星形闪光，持续10分钟左右，随后出现右侧眶后、额颞部搏动性疼痛，伴有恶心、呕吐、冷汗、面色苍白，对光和声音特别敏感，持续6～12小时。头痛发作时喜欢躲在黑暗的房间睡眠或服止痛药缓解头痛。月经、疲劳及情绪激动可诱发，病程中无发热、头晕，头痛与体位改变关系不大，每年发作5～10次不等，每次发病症状大致相同，无进行性加重趋势，不发作时如常。    previousHistory=以往身体健康，否认头颈部外伤史、脑炎、脑膜炎及癫痫病史；否认眼耳鼻喉齿科疾病、高血压以及糖尿病等病史；无化学毒物接触及长期滥用药物史，月经正常。    personalHistory=    allergyHistory=    familyHistory=家族中无类似病史；家族中无慢性遗传性疾病。
    ...    weight=    gender=0    bodyTempr=36.7    lowBldPress=70    highBldPress=115    examInfo=
    ...    heartRate=86    age=30    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="1.头颅及颈椎CT、头颅MRI未见异常；脑电图正常；经颅超声多普勒提示椎基底动脉血流速度加快。2. 腰椎穿刺术 脑脊液检查压力、常规、生化均正常。"
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先兆偏头痛

神经科经典病历21行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因“左侧头痛、恶心、呕吐7天，视物成双5天”就诊。#####神志清楚，对答切题，头颅五官无畸形，左眼睑下垂，左侧瞳孔直径3.5mm，对光反射减弱，右侧瞳孔直径2.5mm，对光反射灵敏，左侧眼球运动内收、上下视受限，外展正常，无眼球震颤，右侧眼球活动正常。现病史:患者7天前无诱因出现左侧搏动性头痛，以左颞、额部及眼眶为主，伴恶心、呕吐，呕吐为胃内容物，无先兆症状及发热、鼻塞、流涕、流泪、畏光等症状，自服止痛片无好转。2天后感眼花、视物成双、自觉左眼睑上抬无力。病程中无肢体乏力、步态不稳，不伴头晕、耳鸣、听力下降、吞咽困难、饮水呛咳、言语含糊及胸闷、气促等症状。患者诉近4年来有类似发作3次，每次持续约20余天自行恢复，不遗留任何症状。无毒物接触史，无烟酒嗜好，家族中无偏头痛患者及慢性遗传性疾病病史。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=36.7    lowBldPress=65    highBldPress=105    examInfo=
    ...    heartRate=    age=35    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=头颅MRI平扫+增强扫描显示两侧海绵窦不对称，左侧海绵窦扩大，局部可见块影病变，T1相呈等信号，T2相呈稍低信号；增强扫描显示左侧海绵窦区肿块病灶明显强化；头颅MRA提示：左侧颈内动脉海绵窦段狭窄、粗糙。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    偏头痛

神经科经典病历22行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=“反复头痛3年”#####心脏各瓣膜区未闻及病理性杂音。神经系统检查：神清，言语清晰，眼球各方向活动自如，瞳孔等大正圆，脑神经未见异常，四肢肌力5 级，肌张力适中。双侧膝反射、踝反射对称存在，双侧Babinski 征阴性，颈软。现病史:患者3年前出现头痛，为双枕部非搏动性、持续性钝痛，如带子紧束头部或呈头周紧箍感、压迫感或沉重感，偶有恶心，不伴呕吐、畏光或畏声、视力障碍等，几乎每日均有不适，曾行头部CT 检查未发现异常。头痛重时服用对乙酰氨基酚，头痛略减轻。体位改变不加重，自觉生气、紧张等情绪变化时明显，注意力转移可减轻。曾就诊于北京某大医院，诊断枕大神经痛，采用风池穴局部封闭，症状稍有减轻。头痛频繁发作，但日常生活不受影响。10天前自觉工作压力大症状加重，行头部MRI 检查未见异常，EEG 正常。为明确诊治，以“头痛待查”入院。病来有头晕、心烦、失眠、焦虑等症状，同时颈肩背部肌肉有僵硬感，捏压时肌肉感觉舒适。无发热、体重减轻、复视或耳鸣，无抽搐发作，无意识障碍，尿便正常。    previousHistory=个性敏感，无高血压、糖尿病史，家族中无类似疾病史。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=36.3    lowBldPress=72    highBldPress=114    examInfo=
    ...    heartRate=64    age=29    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=头颅MRI、CT 检查和EEG 检查未见异常
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    紧张性头痛

神经科经典病历23行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=发热、头痛、恶心、呕吐5天，烦躁不安、胡言乱语1天。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志模糊，谵妄状态，问话部分可回答，语言流利，查体不合作。双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，视乳头边界欠清晰，色淡红，A∶V＝2∶3。额纹对称，口角无偏斜，伸舌居中，咽反射存在。四肢可自主活动，双侧肱二头肌腱反射（＋＋），双膝腱反射（＋＋），四肢肌张力可，双侧病理征。颈抵抗，颏下2横指。感觉检查不配合。现病史:5天前出现发热，体温最高38.1℃，以午后为重，夜间有盗汗，伴有头痛，以双侧顶部为重，呈胀痛，难以忍受，伴恶心及喷射性呕吐，呕吐物为胃内容物，无咳嗽、咳痰，就诊于当地医院。给予抗病毒、抗感染、脱水降低颅内压等药物治疗，头痛稍缓解，但仍发热。1天前患者出现烦躁不安，胡言乱语，不能与人交流，仍高热，体温达39.0℃，并行脑电图检查：广泛中度异常，为求进一步诊治转入综合医院神经内科病房。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=65    gender=    bodyTempr=38.9    lowBldPress=89    highBldPress=139    examInfo=
    ...    heartRate=99    age=36    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="血常规：白细胞计数（WBC）14.5×109／L，中性粒细胞分类（NEUT%）88%↑，红细胞计数（RBC）4.1×1012／L，血小板计数（PLT）240×109／L。血生化：血钠离子：131mmol／L↓，钾离子：4.2mmol／L，葡萄糖：6.2mmol／L↑，余无异常。腰椎穿刺术检查：脑脊液压力300mmH2O，外观无色透明；脑脊液常规：总细胞数300×106／L，白细胞数220×106／L，单核80%，多核20%；脑脊液生化：蛋白：1.6g／L，葡萄糖：2.6mmol／L，氯化物：116mmol／L。脑电图：广泛中度异常。"
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性脑膜炎

神经科经典病历24行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因发热10天，头昏7天而入院。#####现病史:入院后有发热38℃，间有头昏、头痛及呕吐，颈有抵抗力，脑膜刺激征、病理反射阴性。入院后10天出现左侧面瘫，左侧上下肢瘫痪，膝、踝反射活跃，Babinski征、Chaddock征阳性。提示右侧大脑中动脉炎。脑CT有多发散在性高密度阴影及梗阻性脑积水。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=6    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=腰穿：脑脊液清亮，白细胞162×106／L，中性0.95，淋巴0.05，Pandy试验（＋），蛋白质326mg／L，糖2.4mmol／L，氯化物105mmol／L，细菌培养（─），新隐球菌阴性，抗PPD‐IgM2次（─），血抗PPD‐IgM（＋），血沉15mm／h。肺部X线摄片正常。血清CMV‐IgM阳性。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性脑膜炎

神经科经典病历25行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因“双下肢皮疹5小时”入院。#####T 37.8℃，神志清醒，精神稍倦怠，双下肢可见3～10mm大小的出血性皮疹，双侧大致对称。前囟已闭合，口唇红润，咽部充血，双侧扁桃体无肿大，心肺听诊无异常，腹软，无压痛，肝脾未触及，神经系统无明显阳性体征。现病史:5小时前家属为患儿洗澡时发现其双下肢出现皮疹，精神稍差，无咳嗽及呕吐等，送急诊，查体温37.4℃，血常规示：WBC 9.9×109/L，血小板 75×1012/L，以“原发性血小板减少性紫癜？”收治。予静脉滴注地塞米松和静脉丙种球蛋白等治疗。2小时后巡房时发现患儿病情急剧变化，出现高热寒战，四肢冰凉，脉搏微弱，烦躁不安，皮疹较前范围扩大至全身，且局部融合成片。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=37.8    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=2    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=白细胞：16.7×109/L，血小板：52×1012/L；脑脊液常规、生化检查及脑脊液涂片检查均正常；血浆纤维蛋白原明显降低，3P试验阳性；颅脑CT未见异常；皮疹淤点处挑破压片找到革兰阴性双球菌疑似脑膜炎奈瑟菌
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    流行性脑膜炎

神经科经典病历26行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因“发作性右眼闪光感3次，进行性言语欠清3个月”于2011年5月23日收入院。#####查体：神志清楚，言语欠流利，近记忆力差，计算力差。双眼裂等大，左瞳孔中等偏小，对光反应弱，调节反射好，为阿-罗瞳孔（Argyll Robertson pupil），双眼外展露白2mm，余各方向运动充分，鼻唇沟对称，伸舌略偏左，软腭活动好。四肢肌力5级，双上肢肌张力稍高，腱反射偏低对称，双侧病理征阴性。双手指鼻欠准，跟膝胫稳准，Romberg征（−），深浅感觉无异常。颈部无抵抗，脑膜刺激征（−）。现病史:患者于2011年2月2日无明显诱因发作4次右眼外侧视野闪光感，闪光呈红、黄、蓝三色，持续1分钟左右自行缓解。2月12日出现言语欠流利，就诊于北京某医院，行头颅MRI检查显示左侧顶叶皮质下缺血灶，左侧脑干长T1长T2信号，考虑为缺血性脑血管病，并给予阿司匹林口服治疗。闪光感未再发作，而言语不清进行性加重，并出现计算力、记忆力减退，书写缓慢等症状，为进一步诊治收入北京医院神经内科。    previousHistory=患者承认10余年前有冶游史。高血压病史10余年。无乙肝、结核病史。无输血及外伤、手术史。无药物过敏史。    personalHistory=吸烟史20余年，每日30支。饮酒史20余年，平均每日1两。    allergyHistory=    familyHistory=否认家族遗传病史。
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=42    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck="动态脑电图：左侧后部导联散在中-高波幅尖波、尖慢波及慢活动。血常规：WBC 13.39×109/L，PLT 325×109/L，中性粒细胞78.4%，淋巴细胞14.7%。血梅毒抗体测定（TPAB）阳性。腰穿：脑脊液（CSF）压力50mmH2O，无色，Pandy试验（++），WBC 18/mm3，RBC 2/mm3，单核70%，多核30%。蛋白1482mg/L（150～450mg/L），糖正常，氯化物111.6mmol/L（120～130mmol/L）。脑电图示双侧额颞部多发的单个棘波、棘慢波、尖波。头颅MRI平扫示双侧海马、岛叶、丘脑、内囊后肢和下丘脑T2、T2FLAIR高信号，增强T1WI呈轻度强化。颞叶病灶MRS呈代谢活跃改变。脑脊液梅毒快速血清反应素试验（RPR）阳性（1∶64），梅毒螺旋体凝集试验（TPHA）和性病研究实验室试验（VDRL）均为阳性。"
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    神经梅毒

神经科经典病历27行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=患者因反应迟钝4年，记忆减退2年，近来加重来我院就诊#####神志清楚，轻度构音障碍，时间、人物和地点定向力明显减退，查体不能完全合作。眼球运动尚充分，未见眼球震颤。额纹和鼻唇沟两侧对称，颜面部肌肉无不自主运动，舌不能完全伸出口腔前庭，未见舌肌萎缩和纤颤。张口不充分，咽反射迟钝。四肢及躯干针刺觉存在，两侧对称。四肢罕见主动运动，肌力Ⅳ级，肌张力普遍增高，指鼻试验和踵膝试验不能完成。四肢腱反射低，无病理反射。颈软，Kernig征阴性。现病史:家属反映患者近两个月来注意力不集中，精神恍惚，工作时常常出错、与人交流明显减少。近一周来缄默不语，不能独立行走和主动进食。追问病史发现患者4年前即有反应迟钝，貌似装傻充愣，当时家人以为患者工作劳累所致，未予充分重视。此后发现患者好忘事，丢三落四。近来逐渐不认得家人，不能辨认周围环境。患者发病以来无发热、头痛、恶心、呕吐等症状，无抽搐发作，无二便失禁。入院后1周出现幻觉，尿失禁，入院20天出现肌阵挛。脑活检术后一直昏迷，间断发作抽搐。抗癫痫药物治疗及对症支持治疗无效。入院46天死亡。    previousHistory=患者既往体健，家属否认患者有结核病、肝炎等传染病病史。无药物、食物过敏史。无外伤、手术史。预防接种史不详。否认疫区居住史。    personalHistory=患者出生并生长在北京，在工厂从事机加工工作。    allergyHistory=    familyHistory=其母58岁时出现不自主运动、智能减退及抽搐样动作，曾在外院诊断“小脑萎缩”，半年后死亡。患者外祖父58岁时“又瘫又傻”，卧床不起，半年后死亡。
    ...    weight=    gender=0    bodyTempr=36    lowBldPress=80    highBldPress=110    examInfo=
    ...    heartRate=72    age=47    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=腰穿脑脊液初压90mmH2O，脑脊液标本红细胞和白细胞计数均为0，蛋白20mg/dl，糖79mg/ dl，氯化物99mg/dl。脑电图检查呈重度不正常，可见阵发性三相波出现。病理学检查：脑活检见皮质内弥漫性神经元变性，数目减少，变性坏死，部分呈缺血性改变，皮质基质可见空泡形成，呈明显海绵样改变，部分融合成较大空泡。血管周围间隙增宽，呈水肿表现。轻度星形胶质细胞增生，未见炎性细胞浸润。电镜检测结果可见神经元及神经胶质细胞明显变性，膜系统溶解破坏，细胞器溶解、减少，核染色质呈块状凝集，可见细胞碎片。有髓神经纤维解离并有部分溶解，轴索溶解消失或呈空泡样变。特殊检查：活检脑组织抽提DNA后经蛋白印迹法检测结果提示可能有PRNP基因插入突变。长片段序列分析发现有168bp插入，为7个八肽重复序列的插入突变
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    克罗伊茨费尔特-雅各布病

神经科经典病历28行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=发热、头痛10天，意识障碍、小便失禁1天入院。#####体温38℃，心前区有收缩期及舒张期杂音，余一般内科检查未见异常。精神症状明显，有时问话可答，有时不答，检查不合作、违拗，颅神经检查未见明显异常，四肢均可动，无明显偏瘫，双下肢张力稍高，反射活跃，双上肢反射偏弱，双侧掌颌反射阳性，双侧巴氏征阳性，脑膜刺激征阴性。现病史:10天前感冒、发热、头痛，体温多在38℃上下，有时达40℃，1天前出现精神恍惚，小便失禁。平时身健。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=38    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=23    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=胸片示双侧肺纹理增重。心脏彩超示主动脉瓣及二尖瓣关闭不全。脑电图轻度弥散异常。周围血白细胞11×10 9/L，中性粒细胞偏高，腰穿压力180mmH2O（脱水后），内容正常（白细胞数2个）。头颅CT，示双侧大脑多发斑片状及片状低密度影，以皮层为主，右颞枕部有一三角形低密度影，无占位效应；E～H为CT增强扫描，示软脑膜强化，病灶本身强化不明显，另见脑回水肿
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病毒性脑炎

神经科经典病历29行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=#####呼吸18次/分。发育正常，营养一般，体型偏瘦。双侧呼吸动度一致，双肺呼吸音粗。右侧面颊部痛觉较左侧减退，双侧角膜反应存在。左侧额纹较右侧稍浅，闭目有力，左侧鼻纹稍浅，示齿鼓腮有力。颈有抵抗，颏胸距两横指，Kernig征阴性。现病史:患者住院前2日无明显诱因出现头痛，双颞侧为主，呈持续性胀痛，不能缓解，就诊于附近医院并行头颅CT扫描检查，结果未见异常。服用“泰诺林”后病情并未缓解。患者于住院前1日出现发热，体温为37.6℃，并且出现恶心，曾呕吐一次。转诊于我院急诊，腰穿脑脊液初压为130mmH2O，脑脊液标本白细胞计数60×106/L，蛋白64.2mg/dl，脑脊液涂片抗酸染色及墨汁染色均呈阴性。患者住院前8日在深圳出差时出现腹泻，持续2日，未发现脓血便，自行服用“黄连素”后缓解。患者住院头几日仍有间断腹泻，为少量水样便，自觉左上腹隐痛，无恶心和呕吐。    previousHistory=患者有左侧面瘫史20余年。否认高血压、糖尿病、冠心病等病史。否认肝炎、结核病等传染病病史。否认食物及药物过敏史。无手术及输血史。    personalHistory=    allergyHistory=    familyHistory=无家族性遗传病病史。
    ...    weight=    gender=0    bodyTempr=37.2    lowBldPress=75    highBldPress=120    examInfo=
    ...    heartRate=63    age=35    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=患者住院前2日无明显诱因出现头痛，双颞侧为主，呈持续性胀痛，不能缓解，就诊于附近医院并行头颅CT扫描检查，结果未见异常。服用“泰诺林”后病情并未缓解。患者于住院前1日出现发热，体温为37.6℃，并且出现恶心，曾呕吐一次。转诊于我院急诊，腰穿脑脊液初压为130mmH2O，脑脊液标本白细胞计数60×106/L，蛋白64.2mg/dl，脑脊液涂片抗酸染色及墨汁染色均呈阴性。患者住院前8日在深圳出差时出现腹泻，持续2日，未发现脓血便，自行服用“黄连素”后缓解。患者住院头几日仍有间断腹泻，为少量水样便，自觉左上腹隐痛，无恶心和呕吐。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    病毒性脑膜炎

神经科经典病历30行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=因发热，剧烈头痛和呕吐半月余住院。#####体温38℃，脉搏76次/分，血压120/80mmHg。神志清楚，双眼外展欠充分，眼底可见视神经乳头水肿，颈抵抗，骈四指，Kernig征阳性。现病史:无明显诱因可寻。体温38℃左右，在当地曾用青霉素、链霉素短期治疗无效。住院前1日出现谵语，抽搐。在某医院腰穿，脑脊液压力325mmH2 O，白细胞计数305×106/L，Pandy试验阳性，脑脊液标本涂片找到隐球菌，以隐球菌性脑膜炎转入我院。给予两性霉素B，大蒜液和肾上腺皮质激素等治疗，不显效。视力逐渐下降，至近乎失明。出现双侧病理反射。经脑室穿刺引流，病情一度稳定。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=38    lowBldPress=80    highBldPress=120    examInfo=
    ...    heartRate=76    age=21    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=脑室Conray造影显示“两侧脑室，第三脑室，导水管和第四脑室轻度扩大，未见梗阻。左侧脑室前角有一囊性影向前突出，大小约为2.0cm×2.0cm，内有造影液，显示较淡，不甚规则。大脑导水管和第四脑室未见移位。”血红蛋白9.4g/dl，外周血白细胞计数6.8×109/L，血沉25mm/第一小时末。尿常规检查有白细胞（0.02～0.03）×109/L，蛋白（±）。病理解剖：脑重1350g，脑膜表面淤血、稍混浊，略呈毛玻璃样。双侧大脑半球对称，脑回增宽，脑沟变浅。主要病变位于颅底脑膜处，从视交叉至脑桥周围及大脑外侧裂深处有大量淡黄绿色胶冻样渗出物，颅底动脉环与基底动脉，视交叉及乳头体均埋于渗出物中，结构难以辨认。双侧小脑扁桃体疝，未见钩回疝。冠状切面示侧脑室轻度扩大，透明中隔向右移位左侧脑室最宽处2.2cm，右侧脑室最宽处1.0cm。第三脑室最宽处0.8cm。中脑处大脑导水管管腔高度狭窄，呈受压状。第四脑室未见扩大。双侧侧脑室之脉络丛均增厚呈灰白、暗褐色。镜检：病变主要位于脑膜，以颅底明显，有大量渗出物，并呈干酪样坏死，于血管周围可见栅栏样排列的上皮细胞，并于多处见到朗格汉斯细胞，上述病变亦累及双侧侧脑室脉络丛和大脑半球浅部皮质。肺内找到结核结节，其他脏器有淤血和营养不良。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    结核性脑膜炎

神经科经典病历30行-2
    [Documentation]    断言:"枕骨大孔疝"
    ${getRes}    智能诊断3.0    symptom=因发热，剧烈头痛和呕吐半月余住院。#####体温38℃，脉搏76次/分，血压120/80mmHg。神志清楚，双眼外展欠充分，眼底可见视神经乳头水肿，颈抵抗，骈四指，Kernig征阳性。现病史:无明显诱因可寻。体温38℃左右，在当地曾用青霉素、链霉素短期治疗无效。住院前1日出现谵语，抽搐。在某医院腰穿，脑脊液压力325mmH2 O，白细胞计数305×106/L，Pandy试验阳性，脑脊液标本涂片找到隐球菌，以隐球菌性脑膜炎转入我院。给予两性霉素B，大蒜液和肾上腺皮质激素等治疗，不显效。视力逐渐下降，至近乎失明。出现双侧病理反射。经脑室穿刺引流，病情一度稳定。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=38    lowBldPress=80    highBldPress=120    examInfo=
    ...    heartRate=76    age=21    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=脑室Conray造影显示“两侧脑室，第三脑室，导水管和第四脑室轻度扩大，未见梗阻。左侧脑室前角有一囊性影向前突出，大小约为2.0cm×2.0cm，内有造影液，显示较淡，不甚规则。大脑导水管和第四脑室未见移位。”血红蛋白9.4g/dl，外周血白细胞计数6.8×109/L，血沉25mm/第一小时末。尿常规检查有白细胞（0.02～0.03）×109/L，蛋白（±）。病理解剖：脑重1350g，脑膜表面淤血、稍混浊，略呈毛玻璃样。双侧大脑半球对称，脑回增宽，脑沟变浅。主要病变位于颅底脑膜处，从视交叉至脑桥周围及大脑外侧裂深处有大量淡黄绿色胶冻样渗出物，颅底动脉环与基底动脉，视交叉及乳头体均埋于渗出物中，结构难以辨认。双侧小脑扁桃体疝，未见钩回疝。冠状切面示侧脑室轻度扩大，透明中隔向右移位左侧脑室最宽处2.2cm，右侧脑室最宽处1.0cm。第三脑室最宽处0.8cm。中脑处大脑导水管管腔高度狭窄，呈受压状。第四脑室未见扩大。双侧侧脑室之脉络丛均增厚呈灰白、暗褐色。镜检：病变主要位于脑膜，以颅底明显，有大量渗出物，并呈干酪样坏死，于血管周围可见栅栏样排列的上皮细胞，并于多处见到朗格汉斯细胞，上述病变亦累及双侧侧脑室脉络丛和大脑半球浅部皮质。肺内找到结核结节，其他脏器有淤血和营养不良。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    枕骨大孔疝

神经科经典病历31行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=50天前咽痛，咳嗽，1周后发热呕吐，精神异常。#####现病史:入院后舌及咽喉出现单纯疱疹，入院时体查示脑膜刺激征阳性；腰穿：压力280mmH2O脑脊液WBC 24/μl，蛋白质106mg/gl，潘氏试验阳性，Glu 2.6mmol/L，氯化物111mmol/L；脑脊液细胞学示淋巴细胞异型性。    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=50    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=核磁：T1WI：双侧额叶眶直回、右侧颞叶外侧及内侧皮质、左侧海马旁回等多处脑回肿胀，相应区域皮层及皮层下见片状低信号，边界不清。T2WI：病灶为稍高信号，占位效应不明显。增强扫描T1WI：病灶呈“脑回样”强化。脑脊液TORCH结果示单纯疱疹病毒（HSV）－ IgG（+）。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    疱疹病毒性脑炎

神经科经典病历32行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    symptom=发热、头痛1周，抽搐伴意识不清2天。#####T 39.5℃，P 124次/分，R 22次/分，BP 150/80mmHg。呼吸促，发热面容，口唇无发绀，未见皮肤黏膜出血点，双肺呼吸音清，未闻及干湿啰音，心音钝，节律规整，腹软。嗜睡，刺激睁眼，双瞳孔等大，对光反射（-，-），面瘫（-，-），四肢肌张力正常，四肢无瘫痪，BCR（++，++），PSR（++，++），Babinski征（+，+），颈强（+）。现病史:病前受凉、感冒、有口唇疱疹及全身不适症状。1周前出现发热，体温达39.5℃，持续发热，伴有头痛，为全头胀痛，有呕吐，为喷射性，3天前开始出现反应迟钝，胡言乱语，不认识家人，2天前出现抽搐发作，表现为不明白，双眼上翻，尿失禁，约4～5分钟缓解，反复发作，3～4次逐渐至意识不清。    previousHistory=病前受凉、感冒、有口唇疱疹及全身不适症状。1周前出现发热，体温达39.5℃，持续发热，伴有头痛，为全头胀痛，有呕吐，为喷射性，3天前开始出现反应迟钝，胡言乱语，不认识家人，2天前出现抽搐发作，表现为不明白，双眼上翻，尿失禁，约4～5分钟缓解，反复发作，3～4次逐渐至意识不清。    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=39.5    lowBldPress=80    highBldPress=150    examInfo=
    ...    heartRate=123    age=23    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ...    assistCheck=血常规：WBC 11.0×109/L。脑电图：全导联弥漫性高波幅慢波，提示重度异常改变。头颅MRI检查：可见双侧颞叶内侧、额叶及岛叶片状长T1长T2异常信号。FLAIR呈高信号。头颅CT检查：一侧或双侧颞叶、额叶低密度灶，若低密度灶中有点状高密度灶，提示有出血。脑脊液检查：压力：200mmH2O；细胞数：103×106/L，淋巴细胞比率：70%；蛋白：897g/ L；糖及氯化物正常。
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    疱疹病毒性脑炎

神经科经典病历33行-1
    [Documentation]    断言:"结核性脑膜炎"
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=105    lowBldPress=70    personalHistory=    previousHistory=30年前诊断肺结核，否认其他慢性病和传染病史。
    ...    symptom=间断发热、头痛2个月。#####血压：105／70mmHg，神志清楚，高级皮质功能正常，言语流利，双侧瞳孔等大等圆，直径3mm，对光反应灵敏，无面舌瘫，眼震（－），复视（－），余颅神经查体无异常。四肢肌力Ⅴ级，肌张力正常，双上肢腱反射（＋＋），双下肢膝腱反射跟腱反射消失。感觉（－），共济（－），双侧病理征（－），心肺查体无异常。现病史:患者于入院2个月前无明显诱因开始出现头痛，呈间断性钝痛，以前额部为主，时而伴呕吐，于当地按“感冒” 治疗，疗效欠佳。后头痛加重，为进一步诊断和治疗来我院。该患者在外院共行3次腰穿，脑脊液压力波动于150～200mmH2O，2次结核抗体阳性，1次PCR 阳性，2次隐球菌阳性。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性脑膜炎

神经科经典病历33行-2
    [Documentation]    断言:"隐球菌性脑膜炎"
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=105    lowBldPress=70    personalHistory=    previousHistory=30年前诊断肺结核，否认其他慢性病和传染病史。
    ...    symptom=间断发热、头痛2个月。#####血压：105／70mmHg，神志清楚，高级皮质功能正常，言语流利，双侧瞳孔等大等圆，直径3mm，对光反应灵敏，无面舌瘫，眼震（－），复视（－），余颅神经查体无异常。四肢肌力Ⅴ级，肌张力正常，双上肢腱反射（＋＋），双下肢膝腱反射跟腱反射消失。感觉（－），共济（－），双侧病理征（－），心肺查体无异常。现病史:患者于入院2个月前无明显诱因开始出现头痛，呈间断性钝痛，以前额部为主，时而伴呕吐，于当地按“感冒” 治疗，疗效欠佳。后头痛加重，为进一步诊断和治疗来我院。该患者在外院共行3次腰穿，脑脊液压力波动于150～200mmH2O，2次结核抗体阳性，1次PCR 阳性，2次隐球菌阳性。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    隐球菌性脑膜炎

神经科经典病历34行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=家族史无特殊记载。
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=中学生，中午常在外就餐。月经史：12岁初潮，经期不规律，3～6个月1次，每次3天，量不多。    previousHistory=
    ...    symptom=以“乏力12天，黄染、右上腹不适10天”为主诉入院#####体温36.4℃，脉搏76次／分，呼吸18次／分，血压120／70mmHg。神清语明，周身皮肤及巩膜黄染，睑结膜苍白，口唇无发绀，浅表淋巴结未触及肿大。双肺呼吸音清，未闻及干湿啰音。心音纯，律齐，各瓣膜听诊区未闻及病理性杂音。全腹无压痛、反跳痛及肌紧张，肝未触及，脾肋下1cm，Murphy征阴性，肝区无叩痛，肠鸣音约4次／分。双下肢无水肿。现病史:患者12天前跑3000米后感乏力，10天前出现巩膜黄染，未重视，7天前出现皮肤黄染，无瘙痒，渐加重，伴食欲不振，无厌油腻，曾恶心，呕吐胃内容物2次，曾疑为“病毒性肝炎”，但两次肝炎病毒表面标志物均阴性，未能确诊。病来偶有阵发性右上腹不适，与饮食及排便无明显关系。无发热，无寒战，无尿频、尿急及尿痛，尿色略有加深，无腰疼，大便颜色正常，无陶土便。入院后给予补充清蛋白及凝血酶原复合物等对症支持治疗。患者未输血，1周后血红蛋白升至100g／L，之后突然出现发热、寒战，最高体温达到40.4℃，血压下降至90／60mmHg，伴有腰背痛，化验血红蛋白95g／L，次日升至101g／L。又接连2天发作后，血红蛋白降至80g／L，尿潜血3＋，血清总胆红素升至246.5μmol／L，直接胆红素129.5μmol／L。考虑有溶血性贫血。    weight=    assistCheck="血常规：白细胞3.3×109／L，中性粒细胞44.9%，血红蛋白66g／L，HCV：100fl，MCHC：34%，血小板73×109／L。肝功能：总蛋白68.1g／L，清蛋白27.1g／L，谷丙转氨酶17U／L，谷草转氨酶71U／L，碱性磷酸酶14U／L，总胆红素53.4μmol／L，直接胆红素35.3μmol／L。凝血功能：凝血酶原时间24.0秒，活化部分凝血活酶时间54.0秒。尿常规：蛋白＋＋，胆红素＋，尿胆原2＋，红细胞10～15／HP，白细胞40～50／HP。血清肿瘤标记物：AFP：21.93ng／ml（正常值0～13ng／ml），CA19-9：60.60U／ml（正常值0～37U／ml），CEA正常。腹部彩超：肝脏大小正常，肝实质回声普遍略粗糙；门脉直径0.9cm；胆囊明显增大，13.07cm×4.54cm，内可见少量淤积性胆汁，壁厚0.45cm；脾稍大，肋间厚4.28cm；结论：符合肝脏慢性弥漫性损伤；胆汁淤积。肝脏MRI检查：肝脏表面略不光滑，肝叶比例失调，左叶增大，弥漫网格样异常信号，T1WI稍高，T2WI低信号；胆囊体积增大，12.85cm×4.86cm；脾厚4.1cm。结论：符合肝硬化表现。化验血清铜蓝蛋白0.16g／L，血清铜33.1mg／L，24小时尿铜测定1002.5μg。眼科裂隙灯下角膜K-F环阳性。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝豆状核变性

神经科经典病历35行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=父母均体健，家族中无此类疾病发生。
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往体健。入院前7天开始发热，伴鼻塞、流涕、咽痛，就诊于社区医院，查血常规示：白细胞计数8.0×109／L，中性粒细胞百分比80%，拟诊“上呼吸道感染”，给予青霉素钠640万单位／日，静脉滴注，共治疗3天，症状好转。否认高血压、心脏病病史，否认结核等传染病病史，无手术、外伤及输血史，预防接种史不详。
    ...    symptom="突然双下肢无力3天#####神志清楚，言语流利，双侧瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。双上肢肌力正常，肱二头肌腱反射（＋＋），双下肢肌力Ⅱ级，膝腱反射（＋），T10以下针刺觉减退，深感觉消失。双侧病理征（＋）。颈软，无抵抗。"现病史:患者，女，39岁，3天前无明显诱因突然出现双下肢无力，不能行走，需要人搀扶，伴有小便失禁，就诊于神经内科门诊，行腰椎穿刺术检查：脑脊液（CSF）压力140mmH2O；脑脊液（CSF）常规：外观无色透明，总细胞数295×106／L，白细胞数20×106／L；脑脊液生化：蛋白质0.46g／L，葡萄糖及氯化物正常。血常规示：白细胞计数（WBC）7.8×109／L，中性粒细胞百分比（NEUT%）72%。血电解质：钾离子4.2mmol／L。为求进一步诊治，入神经内科病房。    weight=    assistCheck="血常规：白细胞计数7.8×109／L，中性粒细胞百分比72% 血生化：钾离子4.2mmol／L心电图：窦性心律，正常心电图腰椎穿刺检查：CSF压力：140mmH2O。脑脊液常规：外观无色透明脑脊液，总细胞数295×106／L，白细胞20×106／L；脑脊液生化：蛋白0.46g／L，葡萄糖、氯化物正常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性脊髓炎

神经科经典病历36行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=    heartRate=78    highBldPress=104    lowBldPress=70    personalHistory=    previousHistory=否认特殊病史及近期接种史。
    ...    symptom=以“发热10天，双下肢麻木、无力1周”为主诉入院。#####T：37.8℃，P：78次／分，R：21次／分，BP：104／70mmHg，心脏各瓣膜区未闻及病理性杂音。神经系统检查：脑神经检查未见异常。右下肢肌力4 级弱，左下肢及双上肢肌力4 级，T2 以下痛觉感觉减退。双上肢腱反射（＋），双下肢腱反射（＋＋＋），双侧踝阵挛（＋），双侧病理征（＋），大、小便困难。现病史:患者10天前发热37.3℃，并咽痛，1周前双下肢麻木，逐渐向上蔓延至胸部，同时伴有双下肢无力（以右下肢为主），双上肢麻木无力，逐渐出现排尿、排便困难、盗汗。为明确诊治以“脊髓炎？”入院。病来无头痛、恶心、呕吐，饮食、睡眠略差。    weight=    assistCheck="MRI 示：颈3～7 脊髓增粗，髓内片状异常信号（T1略低信号、T2 高信号）（图12‐1）。腰穿脑脊液检查：压力正常范围，脑脊液物色透明，单核细胞50 ×106／L，蛋白0.5g／L，糖及氯化物正常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性脊髓炎

神经科经典病历37行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=72    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=既往无高血压、糖尿病、心脏疾病、肺炎结核等病史。其父50岁时有类似症状，62岁时不能行走，70岁因肺部感染死亡。
    ...    symptom=主因进行性步态不稳3年收入院。#####神志清楚，言语呈吟诗样，对答切题，检查合作，计算力、记忆力及定向力正常。双眼侧视时可见水平和旋转眼震，无复视。双侧面部感觉对称存在，张口下颌不偏。额纹对称，鼻唇沟等深。听力粗测正常。悬雍垂居中，双侧软腭上抬有力，双侧咽反射灵敏。双侧转头耸肩有力。伸舌居中。双上肢远端肌肉轻度萎缩，四肢肌力4级，肌张力减低。双手指鼻均不准确、有意向性震颤、轮替动作缓慢，双侧跟膝胫试验阳性，Romberg征睁闭眼均不稳。针刺觉、关节位置觉及音叉振动觉无异常。腹壁反射对称引出，四肢腱反射对称亢进，双侧Babinski征阳性。颈无抵抗，Kernig征（─）、Brudzinski征（─）。现病史:患者3年前无明显诱因出现步态不稳，走路摇晃，容易跌倒，走路步基宽。继而出现发音困难，言语含糊，呈吟诗样，双手笨拙，运动时震颤明显，持物不准。无头痛、呕吐，无抽搐、意识障碍，无视物模糊及视物成双，无尿便障碍。因病情进展缓慢，未诊治。近1年来出现手部肌肉的轻度萎缩，为明确诊断来院就诊。    weight=    assistCheck=颅脑MRI示小脑、脑干萎缩。心电图示窦性心律，心电图大致正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    遗传性共济失调

神经科经典病历38行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=24    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=75    highBldPress=100    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=双下肢僵硬、无力伴智能差10 余年，加重5年。#####神经系统检查：意识清楚，构音欠清，计算力差（86－7＝？），定向力及记忆力可。视力、视野粗测正常，双侧瞳孔等大等圆，直径约3mm，对光反射灵敏，双眼水平注视时可见细小水平眼震，无复视。双上肢肌容积、肌力、肌张力均正常，双下肢远端肌肉萎缩，双下肢近端肌力4 级，足背屈肌力2 级，跖屈肌力3 级，肌张力折刀样增高。双足音叉振动觉消失。双侧膝腱、跟腱反射对称活跃，双侧踝阵挛阳性，双侧Babinski 征、Chaddock 征阳性。现病史:自幼精神运动发育迟滞，2岁会走路，4岁会说话；言语含糊，反应较同龄儿童迟钝，学习成绩一直差。10岁后逐渐出现双下肢僵硬、无力。近5年症状加重，行走困难，走路时双足尖着地，呈剪刀步态，易摔跤。无发热、抽搐、头痛、恶心、呕吐、视力下降、吞咽困难、饮水呛咳等，无肌肉萎缩，无上肢力弱。    weight=    assistCheck="神经电生理 针极肌电图未见异常；神经传导示胫神经、腓总神经运动传导速度减慢伴部分CMAP 波幅降低，腓肠神经感觉传导速度减慢。体感诱发电位 双侧正中神经N9、N13潜伏期均延长，双侧胫神经未引出反应。简易智能量表（MMSE）评分21／30分。头颅MRI 示胼胝体变薄，脑沟及脑裂略增宽。颈椎MRI 未见异常。胸椎MRI 示胸段脊髓变细"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    遗传性痉挛性截瘫

神经科经典病历39行-1
    [Documentation]    断言:"帕金森病"
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=79    personalHistory=不吸烟，偶饮酒，1两／日，约30年    previousHistory=既往高血压史病史10年，血压最高达180／110mmHg，规律口服苯磺酸左旋氨氯地平片，2.5mg，1次／日，血压控制在130～140／80～90mmHg之间。否认心脏病病史、糖尿病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。无前列腺增生病史。
    ...    symptom=右手震颤1年，伴走路不稳半年。#####心率90次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；面部无表情，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。四肢肌力Ⅴ级，双下肢肌张力稍高，右手震颤，频率约3～4次／秒，双侧肱二头肌腱反射（＋＋），双下肢膝腱反射（＋）。双侧病理征阴性。颈软，感觉未见异常。慌张步态。 现病史:1年前无明显诱因出现右手震颤，不能控制，频率为3～4次／秒，紧张时加重，休息时减轻，睡眠后消失，无肢体无力，无肢体麻木，无大小便失禁，就诊于当地医院，给予“盐酸苯海索片，1mg，2次／日，口服”，震颤较前好转。半年前出现走路不稳，启动困难，走起路来不能停下，仍伴有震颤，为求进一步诊治收入院。    weight=    assistCheck="血常规：白细胞5.6×109／L，中性粒细胞百分比72%，血红蛋白130g／L，血小板220×109／L。生化：CHOL 6﹒8mmol／L↑，TG 2﹒4mmol／L↑，余未见异常。心电图：窦性心律，正常心电图。便常规：镜检未见异常，OB。辅助检查：脑CT平扫未见异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    帕金森病

神经科经典病历39行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=79    personalHistory=不吸烟，偶饮酒，1两／日，约30年    previousHistory=既往高血压史病史10年，血压最高达180／110mmHg，规律口服苯磺酸左旋氨氯地平片，2.5mg，1次／日，血压控制在130～140／80～90mmHg之间。否认心脏病病史、糖尿病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。无前列腺增生病史。
    ...    symptom=右手震颤1年，伴走路不稳半年。#####心率90次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；面部无表情，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。四肢肌力Ⅴ级，双下肢肌张力稍高，右手震颤，频率约3～4次／秒，双侧肱二头肌腱反射（＋＋），双下肢膝腱反射（＋）。双侧病理征阴性。颈软，感觉未见异常。慌张步态。 现病史:1年前无明显诱因出现右手震颤，不能控制，频率为3～4次／秒，紧张时加重，休息时减轻，睡眠后消失，无肢体无力，无肢体麻木，无大小便失禁，就诊于当地医院，给予“盐酸苯海索片，1mg，2次／日，口服”，震颤较前好转。半年前出现走路不稳，启动困难，走起路来不能停下，仍伴有震颤，为求进一步诊治收入院。    weight=    assistCheck="血常规：白细胞5.6×109／L，中性粒细胞百分比72%，血红蛋白130g／L，血小板220×109／L。生化：CHOL 6﹒8mmol／L↑，TG 2﹒4mmol／L↑，余未见异常。心电图：窦性心律，正常心电图。便常规：镜检未见异常，OB。辅助检查：脑CT平扫未见异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

神经科经典病历40行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=72    highBldPress=114    lowBldPress=67    personalHistory=吸烟史10年，现已戒烟，偶饮酒，量少。    previousHistory="既往体健，否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。家族史"
    ...    symptom=左下肢震颤半年。#####神志清楚，语言流利，近记忆力差，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，皱额有力，余颅神经检查未见明显异常，四肢肌力Ⅴ级，肌张力高，双侧腱反射（＋＋），双侧病理征未引出，感觉、共济检查未见明显异常。慌张步态，左下肢于静止时震颤较明显。现病史:患者缘于半年前在感冒输液治疗后出现左下肢震颤，震颤在静止时明显，活动时减轻，不伴肢体无力、肢体抽搐及舞蹈样动作，不伴头痛、头晕，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，近1个月患者左下肢震颤较前加重，伴左手不灵活。    weight=78    assistCheck=血常规：WBC 7﹒18×109／L，NT%69﹒1%，RBC 4﹒3×1012／L，HGB 138g／L，PLT 212×109／L。血生化：CHOL 3﹒63mmol／L，TG 0﹒79mmol／L，HDL 1﹒02mmol／L↓，LDL 2﹒86mmol／L，余无异常。头颅MRI示：轻度脑萎缩。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    帕金森病

神经科经典病历41行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=家族史：母亲及妹妹有类似病史。
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=家族史：母亲及妹妹有类似病史。
    ...    symptom=右手抖动5年#####神经系统查体：神清，语利，颅神经检查（－），四肢肌力5 级，右手可见姿势性震颤，四肢肌张力正常，深浅感觉正常，腱反射（＋＋），病理征（－）。现病史:5年前，患者逐渐出现右手抖动，主要在拿东西、端杯子和写字时抖动明显，静止时不抖动，饮酒后右手抖动好转。无肢体无力、麻木。    weight=    assistCheck=头颅MRI 未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    特发性震颤

神经科经典病历42行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往史：糖尿病。
    ...    symptom=双手抖动3年#####神经系统查体：神清，语利，颅神经检查（－），四肢肌力5 级，右手可见姿势性震颤，四肢肌张力正常，深浅感觉正常，腱反射（＋＋），病理征（－）。现病史:3年前，患者逐渐出现双手抖动（右手较左手稍重），在拿东西、写字或紧张、情绪激动时抖动明显，静止时不抖动，近1年出现头部轻微震颤，情绪激动时加重。无肢体无力、麻木。    weight=    assistCheck=头颅MRI 未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    特发性震颤

神经科经典病历43行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=以“记忆减退5年，加重伴行为异常1年”为主诉就诊。#####神清，表情淡漠，定向力、记忆力、判断力、计算力明显减退，言语减少，面部老年斑多而色深，四肢肌力5－级，双侧腱反射对称活跃。现病史:患者5年前逐渐出现记忆力减退，表现为丢三落四，尤以近记忆力减退明显。后渐出现远记忆力减退，反应迟钝，重复言语。近1年来症状加重，行为异常，表情淡漠，出门找不到家，有时不认识身边亲人。于2006年1月门诊求诊。    weight=    assistCheck="颅脑CT 及MRI 检测显示广泛的脑沟变深，皮质萎缩，脑室扩大的全脑萎缩征象。尤其额、颞叶和顶叶萎缩明显的影像学图像。简易精神状态测试（Mini‐mental State Ex amination，M MSE）≤17分；日常生活量表（Activity of Daily Living，ADL）评分45分。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    阿尔茨海默病

神经科经典病历44行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无家族遗传史。
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=无脑卒中史，无脑器质病史。
    ...    symptom=出门不认识回家的路、亲戚朋友都不认识数月。##### 现病史:患者退休10年，记忆力逐渐减退，进而对老同事名字都忘了，渐渐连拜访探视者、老朋友见面也不认识了。退休7年后对亲戚、子女渐不认识，见人表现欣快、有时呆滞。在家全靠人照顾吃喝，自己不知饥、饱。睡眠尚可，叫睡即睡，叫醒即醒，生活不能自理。前几天，由于看管不严，自己单独出外，乱跑乱窜，在外3天，经派出所收容，家属报警正好送回。    weight=    assistCheck=MRI 显示弥漫性脑皮质萎缩，脑室显著扩大，脑沟回退缩。EEG 出现各导联弥散性慢波，以θ波为主，δ波屡屡出现。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    阿尔茨海默病

神经科经典病历45行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=78    highBldPress=125    lowBldPress=70    personalHistory=    previousHistory=既往无高血压、糖尿病史，否肝炎、结核病史，无长期大量饮酒史，无家族史。
    ...    symptom=主因“眩晕伴步态不稳2年”第二次住院。#####神志清楚，言语流利，计算力、记忆力及定向力均正常。视力视野粗测正常，双眼球各向活动正常，可见水平眼震，双瞳孔等大同圆，对光反射灵敏。无面部感觉障碍，张口下颌居中。双侧额纹对称，鼻唇沟等深。听力粗测正常。无声音嘶哑、饮水返呛及吞咽困难，双侧咽反射存在。双侧转头耸肩对称有力，伸舌居中，舌肌无萎缩。四肢肌力5级，肌张力正常，双手指鼻试验、轮替试验、双下肢跟膝胫试验均差，轻度共济失调步态，Romberg征睁、闭目均不稳。深浅感觉正常。四肢腱反射对称正常，病理反射未引出。现病史:患者2年前无任何诱因出现步态不稳伴眩晕，视物晃动感，15个月前第一次入院治疗。当时体检：双眼水平眼震，双侧指鼻试验不稳，双侧跟膝胫试验不准，Romberg征阳性，病理反射未引出。辅助检查：头颅CT正常，血糖、肾功能、肝功能、TCD、EEG均未见异常。乙肝六项检查示：HBsAg（＋），抗HBcAg（＋），HBeAg（＋）。给予对症治疗症状无缓解，以“共济失调待查”出院。出院后上述症状持续存在并渐出现双手震颤，系纽扣等精细活动受限而第二次住院。    weight=    assistCheck=患者2年前无任何诱因出现步态不稳伴眩晕，视物晃动感，15个月前第一次入院治疗。当时体检：双眼水平眼震，双侧指鼻试验不稳，双侧跟膝胫试验不准，Romberg征阳性，病理反射未引出。辅助检查：头颅CT正常，血糖、肾功能、肝功能、TCD、EEG均未见异常。乙肝六项检查示：HBsAg（＋），抗HBcAg（＋），HBeAg（＋）。给予对症治疗症状无缓解，以“共济失调待查”出院。出院后上述症状持续存在并渐出现双手震颤，系纽扣等精细活动受限而第二次住院。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    小脑变性

神经科经典病历46行-1
    [Documentation]    断言:"多发性硬化"
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=9个月前反复出现右侧季肋部疼痛，数天后突然出现左眼失明。#####查体：嗜睡、构音障碍，左眼视力指动2 尺，左眼直接对光反射迟钝，四肢肌力3 级，双膝腱反射亢进，双侧Hoff man 征（＋），双侧Babinski 征（＋），深浅感觉正常。诊断：①多发性硬化；②低钠血症；③脑桥中央髓鞘溶解症 现病史:查眼底：左眼视乳头边界模糊，考虑为视神经病变。给予球后注射地塞米松，口服“卡马西平”等治疗后右侧季肋部疼痛好转，左眼视力恢复到指动2 尺。7个月前再次出现右侧季肋部疼痛伴双下肢麻木、无力。行胸椎MRI示中胸段（T5～T9）脊髓异常信号。诊断为“视神经脊髓炎”，予甲泼尼龙冲击治疗后上述症状好转。20天前再次出现头晕、呃逆、伴恶心、呕吐。查电解质：血钠126.5mmol／L，头颅MRI 示双侧脑室旁白质长T1、长T2 信号。给予补钠治疗，3天后突然出现四肢无力，言语不清，饮水呛咳，    weight=    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    多发性硬化

神经科经典病历46行-2
    [Documentation]    断言:"低钠血症"
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=9个月前反复出现右侧季肋部疼痛，数天后突然出现左眼失明。#####查体：嗜睡、构音障碍，左眼视力指动2 尺，左眼直接对光反射迟钝，四肢肌力3 级，双膝腱反射亢进，双侧Hoff man 征（＋），双侧Babinski 征（＋），深浅感觉正常。诊断：①多发性硬化；②低钠血症；③脑桥中央髓鞘溶解症 现病史:查眼底：左眼视乳头边界模糊，考虑为视神经病变。给予球后注射地塞米松，口服“卡马西平”等治疗后右侧季肋部疼痛好转，左眼视力恢复到指动2 尺。7个月前再次出现右侧季肋部疼痛伴双下肢麻木、无力。行胸椎MRI示中胸段（T5～T9）脊髓异常信号。诊断为“视神经脊髓炎”，予甲泼尼龙冲击治疗后上述症状好转。20天前再次出现头晕、呃逆、伴恶心、呕吐。查电解质：血钠126.5mmol／L，头颅MRI 示双侧脑室旁白质长T1、长T2 信号。给予补钠治疗，3天后突然出现四肢无力，言语不清，饮水呛咳，    weight=    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    低钠血症

神经科经典病历46行-3
    [Documentation]    断言:"脑桥中央髓鞘溶解症"
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=9个月前反复出现右侧季肋部疼痛，数天后突然出现左眼失明。#####查体：嗜睡、构音障碍，左眼视力指动2 尺，左眼直接对光反射迟钝，四肢肌力3 级，双膝腱反射亢进，双侧Hoff man 征（＋），双侧Babinski 征（＋），深浅感觉正常。诊断：①多发性硬化；②低钠血症；③脑桥中央髓鞘溶解症 现病史:查眼底：左眼视乳头边界模糊，考虑为视神经病变。给予球后注射地塞米松，口服“卡马西平”等治疗后右侧季肋部疼痛好转，左眼视力恢复到指动2 尺。7个月前再次出现右侧季肋部疼痛伴双下肢麻木、无力。行胸椎MRI示中胸段（T5～T9）脊髓异常信号。诊断为“视神经脊髓炎”，予甲泼尼龙冲击治疗后上述症状好转。20天前再次出现头晕、呃逆、伴恶心、呕吐。查电解质：血钠126.5mmol／L，头颅MRI 示双侧脑室旁白质长T1、长T2 信号。给予补钠治疗，3天后突然出现四肢无力，言语不清，饮水呛咳，    weight=    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑桥中央髓鞘溶解症

神经科经典病历47行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=28    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均体健，家族中无此类疾病发生。
    ...    gender=1    heartRate=90    highBldPress=126    lowBldPress=79    personalHistory=    previousHistory=既往体健。无发热、感冒史，否认高血压、心脏病病史，否认结核等传染病病史，无手术、外伤及输血史，预防接种史不详。
    ...    symptom=发作性抽搐3天#####神志清楚，言语流利，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。双上肢肌力Ⅴ级，肱二头肌腱反射（＋＋），双下肢肌力Ⅴ级，膝腱反射（＋＋）。深浅感觉检查未见异常。双侧病理征阴性。颈软，无抵抗。共济运动检查稳准、协调。现病史:3天前无明显诱因突然出现抽搐，表现为双眼上吊，双上肢屈曲，双下肢伸直，伴有小便失禁，当时唤之不能答应，伴有舌咬伤，约20分钟后症状缓解，缓解后如正常人，遂就诊于当地医院，行头颅CT检查：平扫未见异常，随机血糖：7.4mmol／L，血常规检查：白细胞计数（WBC）5.6×109／L，血红蛋白（Hgb）123g／L，血小板计数（PLT）230×109／L，未予特殊治疗。1天前再次出现上述症状，表现为双眼上吊，双上肢屈曲，双下肢伸直，唤之不能应，伴有小便失禁、舌咬伤，约30分钟后缓解，缓解后如正常人，为求进一步诊治收入神经内科病房。    weight=    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    癫痫

神经科经典病历48行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=否认家族性遗传疾病。
    ...    gender=    heartRate=68    highBldPress=152    lowBldPress=83    personalHistory=    previousHistory=既往有癫痫病史5年，服用苯妥英钠0.1g，每日二次，控制尚可，近1年未发作，因服药后出现齿龈增生、头晕、视物不清，近一周未服用药物。否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。
    ...    symptom= 2小时内连续全身性抽搐4次。#####神志不清，唤之不能应答。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球可活动，双侧额纹对称，鼻唇沟无变浅，伸舌不合作。四肢可活动，四肢肌张力正常，双侧腱反射（＋＋），双侧巴氏征阴性。感觉检查、共济检查不合作。颈软，双侧克氏征。现病史:缘于2小时前突然出现意识丧失，唤之不能应答，抽搐表现为双眼上吊，口吐白沫，双上肢屈曲，双下肢伸直，伴有小便失禁，无寒战高热，无摔伤，约持续20分钟抽搐缓解，唤之不能应答。1.5小时前再次出现上述症状，约持续20分钟缓解，仍意识不清，共发作4次，急就诊于当地医院，当时测血压为150／80mmHg，未经特殊诊治而来我院，急诊查头颅CT示：平扫未见异常，为求进一步诊治入我院神经内科。自发病以来，患者神志不清，暂未进食，小便失禁，体重无明显变化。    weight=    assistCheck="血生化：ALT 18﹒00U／L，AST 23﹒00U／L，BUN 5﹒40mmol／L，CREA 86﹒0μmol／L，Na＋139mmol／L，K＋4﹒49mmol／L。随机血糖：5.6mmol／L。头颅CT平扫：未见异常。脑电图：左额及左中央导联可见癫痫样异常放电。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    癫痫持续状态

神经科经典病历49行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=148    lowBldPress=94    personalHistory=    previousHistory=
    ...    symptom=头晕月余，时轻时重，近1周来有眩晕感，头重脚轻，走路有轻飘感。发现血压高半年，未正规治疗。#####神经系统检查未见异常。现病史:    weight=    assistCheck=TCD报告：椎-基底动脉供血不足。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    椎-基底动脉供血不足

神经科经典病历50行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=28    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=105    lowBldPress=69    personalHistory=    previousHistory=
    ...    symptom=口角歪斜，右眼闭合无力2天#####体重55kg，身高165cm，发育正常，营养良好，无急性病容；神志清楚，言语流利，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，右侧周围性面瘫，示齿口角左偏，伸舌居中，右侧额纹及鼻唇沟变浅、右眼闭合无力，右侧口角下垂，双耳听力正常，咽反射存在，四肢肌力、肌张力正常，感觉共济无异常，双侧腱反射（＋＋），双侧病理征未引出。现病史:3天前洗澡受凉后出现右耳后疼痛，2天前晨起出现口角向左侧歪斜，右眼闭合无力，讲话漏风，无耳鸣、耳聋及味觉异常，无言语障碍及四肢活动障碍，遂前往医院就诊。    weight=    assistCheck="尿常规：无异常 血常规：无异常 生化：无异常 心电图：窦性心律，正常心电图"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    特发性面神经麻痹

神经科经典病历51行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=无遗传病病史、无重症肌无力疾病史、无甲状腺疾病病史、无肌营养不良疾病史。
    ...    gender=1    heartRate=106    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=无肿瘤病史、无肺病病史、无药物过敏史。
    ...    symptom=双眼睑下垂8个月，颈部及四肢无力5个月，伴呼吸困难10天。#####口唇轻度发绀，声音嘶哑低微，讲话疲劳后失声。头颅无畸形，面部、背部可见痤疮。呼吸急促，双肺无啰音，心音有力，无病理性杂音，腹部正常。神志清楚，精神差，智能正常。双眼视力、视野粗测正常，眼底正常，双侧上眼睑下垂，左眼裂2mm，右眼裂3mm，双瞳孔直径3mm，直接、间接对光反射正常，双眼球各方向活动充分。张口无偏斜，面部感觉正常，咀嚼肌反复咀嚼动作后力量递减，无肌肉萎缩。双侧额纹对称，闭目力弱，鼓腮有力。听力正常，无眼球震颤，软腭上抬可，咽下运动差，咽反射存在。耸肩、转颈无力。伸舌居中，舌肌无萎缩及纤颤。四肢肌肉无萎缩，初查四肢肌力Ⅴ级，反复运动后肌力递减，肌张力正常，四肢腱反射正常，腹壁反射存在。深、浅感觉均正常。指鼻试验、跟膝胫试验均稳准。双侧Hoffmann征，Babinski征，Chaddock征均阴性。颈部无抵抗，Kernig征阴性。现病史:    weight=    assistCheck=乙酰胆碱受体（AChR）抗体阳性。抗胸腺瘤抗体间接血凝实验1∶2为阴性。 低频重复电刺激波幅递减。单纤维肌电图显示颤抖增宽。 CT检查未发现胸腺肿瘤或增生肥大。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    重症肌无力

神经科经典病历52行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=37    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=因握拳松开不易17年，双手变细无力8年，言语含糊5年就诊。患者于17年前偶有疲劳后持物放松不易，渐发展为握拳松开困难。8年前发现双手臂变细、无力，活动发僵感，伴颈部酸胀乏力。5年前言语含糊，时有进食呛咳，行走乏力易跌跤，呈缓慢进行加重。#####血压16／11kPa，心、肺、肝、肾等内科无异常，智能正常，咬肌和颞肌平削呈斧头脸，口唇尚不翘，面肌力弱，示齿差，闭眼尚不紧。轻度脱发，颈部细长前屈，眼底正常，轻度白内障，双侧瞳孔等大同圆，光反应灵敏，无眼震及眼球运动受限，构音不清，腭弓升高，咽反射迟钝，伸舌居中，舌体小无舌肌萎缩、纤颤，舌肌见叩击性肌强直。双侧胸锁乳突肌、前臂和手部肌肉、胫前肌等萎缩，前臂和手部肌肉见叩击性肌强直，双手用力握紧后放松困难，四肢肌力-级、腱反射减低，深浅感觉正常，共济运动无异常，未引出病理反射，睾丸小，性功能障碍。患者兄弟姊妹4人，一弟的症状较患者重，一妹的症状较患者轻。    weight=    assistCheck="血清CK 685IU/L，AST 44IU/L，LDH 134IU/L。心电图示右束支传导阻滞，电生理检查见肌强直电位，VEP为P100潜伏期延长，MCV、SCV减慢。肌肉活检取自左股外侧肌，经冷冻切片，各种酶组织化学染色，HE见散在分布的部分肌纤维轻度-中度萎缩，无肌内膜，肌束膜增生。明显的组织学改变是大多数肌纤维内见肌核内移（图5-57，图5-58）。ATPase染色见萎缩的肌纤维主要是 型纤维。 电镜观察见萎缩肌纤维肌核增多，肌膜破损，基膜增生，肌膜核内移。肌膜下见排列紊乱的肌丝团和肌膜下肌质块。部分肌纤维内见小灶性肌纤维溶解，线粒体肿胀。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    萎缩性肌强直

神经科经典病历53行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=22    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=无类似发病史，无遗传性疾病史。
    ...    gender=1    heartRate=80    highBldPress=105    lowBldPress=75    personalHistory=    previousHistory=无类似发病史。否认慢性腹泻史。否认外伤及手术史。
    ...    symptom=四肢无力1天。#####发育正常，营养好，神志清，抬入病房，被动体位，查体合作。神志清，问答切题，定向力、记忆力、计算力正常。视力、视野粗测无异常，眼底视乳头边界清。双侧瞳孔等大等圆，对光反射存在。双眼球活动自如，无眼球震颤，双眼睑无下垂。面部痛觉正常，咀嚼运动对称有力，双侧角膜反射存在。双侧额纹及鼻唇沟对称，味觉无异常。听力正常。无吞咽困难、饮水呛咳及发音嘶哑。咽反射存在。胸锁乳头肌无萎缩，转颈、耸肩对称有力。伸舌居中。无肌萎缩，四肢肌张力减弱。双上肢肌力3级，双下肢肌力2级，腱反射消失。全身痛觉无异常。脑膜刺激征未引出。病理反射未引出。无共济运动失调。现病史:患者下午跑步时感双下肢肌肉疼痛，当时未引起重视。晚饭前感四肢乏力，行走困难。晚上病情逐渐加重，双下肢不能行走及站立，双上肢不能抬举，双手不能持物。排尿困难。无肢体麻木及抽搐。病程中无发热及腹泻。    weight=    assistCheck=血钾1.9mmol /L，肝功能、肾功能、血糖、血脂均正常，血常规、尿常规、大便常规均正常，胸部平片正常。心电图提示低血钾。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    低钾型周期性麻痹

神经科经典病历54行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=本家系3 代共10 人，年龄3～69岁，其母亲有低血钾瘫痪史2次，均在夏天活动后出汗休息时发生，分别发生在34岁和40岁时，当时出现乏力、四肢活动不能，曾诊断为低钾型周期性瘫痪，予补钾治疗症状缓解，血钾恢复正常。
    ...    gender=1    heartRate=72    highBldPress=130    lowBldPress=70    personalHistory=    previousHistory=患者平素体健。
    ...    symptom=因“反复发作性四肢活动不灵2年”于2008年3月12日入神经内科病房。#####T：36.5℃，P：72次／分，R：18次／分，BP：130／70mmHg，神清，语明，扶入病房，查体合作。甲状腺无肿大，双肺呼吸音清，未闻及干湿啰音，心率：72次／分，律齐，各瓣膜听诊区未闻及杂音，腹平软，无压痛。神经系统专科检查：神志清楚，言语流利，双瞳孔等大等圆，直径2.5mm，直接、间接对光反应灵敏，双眼各方向运动充分，无复视，无眼震，双侧额纹、鼻唇沟对称，双眼闭目有力，耸肩、转颈对称有力，伸舌居中。四肢肌力3 级，肌张力低，双侧腱反射对称减弱，双侧病理征阴性。双侧肢体、躯干包括面部痛觉对称存在。颈软，克、布鲁津斯基征阴性。现病史:患者2年前清晨睡醒后感四肢活动不灵，表现为双下肢不能移动，手指尚能屈曲，但肘部不能抬起及移动，轻微胸闷、心慌，无呼吸困难及吞咽困难，于当地医院就诊，测血钾2.2mmol／L，经补钾治疗约5～6h 后即恢复正常，四肢活动自如，继续口服氯化钾每次500mg，2次／日，1周后停药。1.5年前饮酒后再次发作，自觉四肢乏力，疲劳，渐出现四肢活动不灵伴头颈部活动障碍，胸闷，说话困难，当地医院查血钾2.1mmol／L，经补钾治疗约6～7h 后好转，未再服药。8个月前腹泻2天后再次发作，口服止泻药物后腹泻停止，但出现四肢活动不能，无胸闷、言语障碍，经补钾治疗症状缓解后未再服药。本次入院前1天，无诱因再次发作，症状同前，入院急诊行心电图未见异常，血钾2.34mmol／L，予口服10%氯化钾20ml 后收入神经内科。入院后经补钾治疗，血钾7h 后恢复正常，住院期间监测血钾3次均正常。    weight=    assistCheck="血钠、氯及尿同步电解质均正常。空腹血糖、餐后2h 血糖、血醛固酮、尿醛固酮、甲状腺功能均正常。尿可滴定酸测定、血皮质醇节律检查、促肾上腺皮质激素测定、血浆肾素活性测定及血管紧张素测定均正常。B超肝胆胰脾肾、肾上腺均无异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    低钾型周期性麻痹

神经科经典病历55行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=6    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=其母亲孕龄25岁，患儿为第一胎，早产，剖宫产，双胞胎，出生时低体重。其双胞胎妹妹具有相似障碍且症状更严重。
    ...    symptom=双下肢活动障碍，行走困难5年。#####神清，言语清晰，对答切题，心、肺、腹无明显异常。可独立站立，髋膝屈曲，足尖着地，足放平时双膝过伸。能短距离独立步行，行走时屈膝屈髋，跳跃剪刀步态，呈尖足。双侧髋关节后伸、外展、外旋受限，双足跖屈内翻，踝关节背伸活动受限。双下肢内收肌、绳肌、小腿三头肌张力增高，跟腱挛缩。双侧臀大肌、臀中肌、股四头肌、胫骨前肌、趾长伸肌肌力减弱（4 级）。长坐位平衡及站立平衡差。双膝、跟腱反射亢进，髌阵挛（－），踝阵挛（＋）。Ely 征、Thomas 征（＋），Babinski 征（＋）。TLR、ATNR、STNR、MORO（－）。现病史:5年前，患儿家人逐渐发现其双下肢强硬，活动不灵活，爬行困难，不能独坐，扶站时双腿紧靠，双下肢呈尖足，足跟不能着地，站立困难。因家中经济困难，未到医院就医及治疗。2岁时屈膝屈髋位能独坐。3＋岁，扶持下站立足跟放平困难，放平时膝过伸；在扶持下短距离行走，行走时屈膝屈髋，呈跳跃剪刀步态。双上肢活动及语言、智力无明显异常。4岁可独站。4＋岁能独立短距离行走，但行走困难，仍呈跳跃剪刀步态。现在亲友支持下到康复中心治疗。    weight=    assistCheck=头颅CT 未见明显异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑性瘫痪

神经科经典病历56行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=9    ageType=月    allergyHistory=    bodyTempr=36.7    familyHistory=家族中否认同类病史。
    ...    gender=1    heartRate=120    highBldPress=    lowBldPress=    personalHistory=个人史无特殊记载，    previousHistory=既往健康，母孕期正常，出生史正常，
    ...    symptom=因发现头大8天入院。#####一般状态较差，精神不振，易激惹，营养发育中等，R 36次／分，颅缝开大，头围44cm，前囟1.0×1.0cm，紧张，稍膨隆。双侧球结膜无水肿，颈软，心、肺、腹无异常。神经系统 双瞳孔等大正常，瞳孔＝2.5mm，光反应迅速，眼球各方向运动充分，无落日征，无面瘫，痛觉存在，四肢肌力、肌张力、肌容积正常，角膜反射存在，腹壁反射（上、中、下）消失，肱二头、三头肌反射减弱，膝反射、跟腱反射正常，双侧巴氏征阳性，脑膜刺激征阴性，植物神经系统正常。现病史:"近10天，患儿烦躁，精神不振，用手拍头。家人发现患儿头逐渐增大，并有运动发育倒退，爬站、翻身均不能，不认人。无热，不吐，未抽。1个月前，患化脓性脑膜炎，曾发热、抽搐伴吐。CSF 呈典型化脓性改变。用先锋Ⅴ、氯霉素、地塞米松等治疗，痊愈。"    weight=9    assistCheck=血常规10.0×10 9／L，N 0﹒62，L 0﹒38，RBC5.08 ×10 12／L，Hb 130 g／L。CSF 外观无色透明，细胞数0 ×10 6／L，潘氏试验阴性，葡萄糖2.5mmol／L，蛋白0.2g／L，氯化物114 mmol／L，涂片未找到细菌，培养无细菌生长。头MRI 扫描 后颅窝扩大，天幕上抬，小脑下蚓部缺如，小脑半球发育不良，后颅窝可见巨大囊肿（小脑延髓池内）并与第四脑室相通，侧脑室第三脑室积水扩张，脑室旁围绕以长T 1长T 2信号影，胼胝体变薄，印象诊断符合变异型Dandy‐walker 综合征改变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    脑积水

神经科经典病历57行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=43    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=突起头晕、呕吐3天，加重伴意识障碍1天。#####现病史:头晕当天患者神志清楚，当地医院查头颅CT未见明显异常。给以改善循环治疗过程中患者逐渐出现意识障碍，神志清楚变为嗜睡。意识障碍当天复查头颅CT示：小脑梗死，幕上脑积水。在脱水降颅压过程中患者神志障碍进一步加重，由嗜睡变为昏迷。意识障碍第二天至我院复查头颅CT，并行侧脑室穿刺引流术放脑脊液。患者意识障碍减轻，扩大脑室明显缩小。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑积水

神经科经典病历58行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=体位性头痛，表现为坐位或立位症状加重，平卧位症状消失或明显减轻；偶有恶心、呕吐、头晕、视物模糊等。##### 现病史:    weight=    assistCheck=腰穿CSF压力低于588Pa（60mmH2O），脑脊液轻度白细胞增高，蛋白含量增高。影像学表现：T2WI平扫横断面，显示第四脑室变窄；T2-FLAIR平扫横断面，显示双侧大脑表面硬脑膜增厚（箭）；T1WI平扫矢状面，显示小脑下垂（箭），脑干前移、桥前池变窄（箭）；MRM图，显示外漏的脑脊液（箭）；T1WI增强冠状面，显示脑表面弥漫性对称性线样强化的硬脑膜（箭）；T1WI增强矢状面，显示脑膜均匀强化与枕大池变小，提示小脑下垂（箭）；T1WI增强横断面，显示脑表面弥漫性对称性线样强化的硬脑膜（箭）；T1WI平扫矢状面，显示扩张的窦汇后下缘向外凸呈弧形改变（箭）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    低颅压综合征

神经科经典病历59行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=左下肢进行性肌肉萎缩10年，加重1年入院。#####查体：左下肢肌肉萎缩，肌力3级，体表感觉减退，左踝不能背曲（肌力0级），左胫骨前肌、趾伸肌、腓骨长肌肌力0肌。左膝腱反射、跟腱反射减退，左足不能内外翻，未引出病理反射。肌电图示：①左腓总神经受损（轴索为主）；②左股四头肌、左胫前肌神经源性损害。    weight=    assistCheck=MRI T1WI显示T12-S1平面椎管内髓外硬膜下混杂信号灶，病灶以等或稍低信号为主。T2WI显示病灶呈明显高、低混杂信号，主要位于脊髓及马尾神经前方，T12水平脊髓受压轻度前移，脊髓信号无异常。T1增强扫描示：病灶未见明确强化。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    椎管内肿物

神经科经典病历60行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=双眼视物模糊3天，伴头痛半月。#####视力双眼裸视0.1，Jr4，矫正视力 0.1（不提高），眼压右眼13mmHg，左眼15mmHg，双眼睑无下垂，结膜无充血，角膜清亮，KP（–），前房深度正常，Tyn（+），虹膜纹理清晰，瞳孔等大同圆，光反射存在，RAPD征（–），晶状体较透明，玻璃体混浊，视盘边界略模糊，C/D约0.3，A/V约2∶3，黄斑水肿，后极部视网膜灰白色水肿，脱离。双眼球无突出，运动自如。现病史:半月前出现感冒样症状，随后自觉双眼视物模糊，无头晕、虹视等症状，后于我院门诊就诊。患者应用环孢素联合糖皮质激素治疗3个月后，双眼眼底脉络膜色素脱失，呈“晚霞状”改变，周边网膜出现Dalen-Fuchs结节。患者自行停药2周后，出现视物不清，再次就诊，眼科常规检查见：双角膜后羊脂状KP，Tyn（+++），虹膜后粘连，瞳孔缘可见Koeppe结节，眼底不能窥入。再次应用全身应用环孢素联合糖皮质激素治疗，局部应用糖皮质激素眼药及散瞳眼药水治疗，症状得到缓解。患者此后一直按医嘱治疗，整个口服药物疗程大约为1年左右，最终患者的视力双眼保持在1.0。停药半年后，睫毛根部、背部皮肤出现脱色素。    weight=    assistCheck=眼底荧光血管造影（FFA）该例患者双眼造影早期，视乳头轻度着染，后极部视网膜下点状强荧光斑，造影晚期形成“多糊状”荧光积存。实验室检查 白细胞密度为9.78×109个/L，肝、肾功能检查均未见异常；抗结核抗体检查阴性，弓形虫抗体IgM为阴性，梅毒血清特异性抗体为阴性；病毒抗体（抗单纯疱疹病毒抗体、抗巨细胞病毒抗体）、免疫抗体、乙型肝炎病毒、艾滋病病毒等检查均为阴性。 B超检查 双眼玻璃体点状混浊，后极部脉络膜低至中度反射性增厚，伴视网膜脱离。眼眶CT和头颅MRI检查 未见眼部肿物及颅内占位性病变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原田病

神经科经典病历61行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=患者1周前无明显原因出现眩晕，平卧向两侧翻身时均出现眩晕，感觉整个身体向一侧翻转，持续几十秒后停止。患者多家医院就诊，曾行中药治疗，无明显好转。现病史:因体位改变眩晕发作1周来我院就诊。#####查体：一般情况可，双侧外耳道通畅，鼓膜完整，标志清。音叉试验：双耳RT（＋），WT居中。Romberg征阴性，指鼻试验正常。Dix‐Hallpike试验无眼震及眩晕发作，水平翻转试验左右转头导致眩晕发作，伴有向地性眼震，其中左转头时眩晕和眼震持续时间长。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    良性阵发性眩晕

神经科经典病历62行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=1    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=左眼眉弓部黄豆大皮肤硬结节#####T36.2℃，发育营养良好。面色红润，神志清，反应佳，全身皮肤未见出血点。浅表淋巴结未及。心肺未见异常。腹软，肝肋下1cm，剑突下约1.5cm，脾未及。左眼上睑下垂，眼裂变小，左眼上睑眉弓部可见一鸽蛋大肿块，本皮本色，囊性感。眼底检查未见异常改变。现病史:生后第5个月时于左眼眉弓部出现黄豆大皮肤硬结节，口服抗生素一个月不见好转且进行性增大（鸽卵大）。先后在国内多家眼科医院诊治达7个月，未能确诊而来我院。    weight=    assistCheck=血常规：WBC 4﹒2 ×10 9／L，N 0﹒56，L 0﹒44，分数外偶见有核红细胞，Hb120g／L，PLT148 ×10 9／L。尿便检查正常。全肝功、肾功能正常。X 线：胸片未见异常。骨髓像：粒、红、巨三系大致正常，于片尾偶见瘤样细胞（裸核退化状）。尿V MA 点片法：可疑阳性。B 超检查：先用腹部超声探查腹部未能查到肿物（探头大探查不方便）。后改用二维心脏超声探查（探头小）于左肾上腺发现3 ×3cm 2实质性肿块，内部回声不均匀。肿物穿刺：于左眼眉梢部行肿物穿刺，抽吸困难，取0.5ml 血性液体涂片染色，镜检，发现大量神经母细胞瘤，再行桥联酶标AP 再生障碍性贫血P 法做单克隆抗体F 3系列检测结果为阳性表达，百分率82%，同时用抗急淋、急非淋抗体做对照检测，结果均为阴性表达（可除外白血病）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    神经母细胞瘤

神经科经典病历63行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=右足跟疼痛，跛行1年半。#####T37.8℃，意识清楚，消瘦，痛苦面容，跛行。面色黄白全身皮肤未见淤点，双颌下及右腹股沟部可触及黄豆大小淋巴结数个，心肺未见异常。腹软，肝肋下2cm，剑突下3cm。右足跟、足掌部肿胀，轻度发红，活动受限，拒触拒按，脊柱生理弯曲正常，活动自如。现病史:右足跟疼痛，跛行先后在国内多所医院就诊，按风湿热，类风湿性关节炎治疗长达18个月，未见好转。骨穿6次未能确诊，来我院。    weight=    assistCheck="血常规WBC 2﹒4 ×10 9／L，St0.30，晚幼粒0.10，N 0﹒38，L 0﹒10 异淋0.10，分数外偶见幼红细胞，Hb 85g／L，PLT 118 ×10 9／L，NAP 阳性反应，积分186分。ESR：32mmH 2 O／1h 80 mmH 2 O／2h，ASO：1∶800，CRP 阳性，类风湿因子阳性，尿常规、肝、肾功能检查未见异常，X线检查胸片未见异常，右踝关节及右足掌正位像：可见软组织肿胀，骨膜反应性增生，骨质有虫蚀样改变。B超检查二维心脏超生探头于腹后壁脊柱左侧查到3 ×5cm 实质性肿块，内部回声不均匀且有钙化区。骨髓检查：外院骨穿5次，未能明确诊断。来我院后易位骨穿3次，取材极困难，抽吸出少量淡黄色骨髓液，特殊腥臭味。涂片染色镜下所见：增生极度低下，呈现一片荒芜，部分呈空白区，有核与无核细胞呈破碎溶解状，片尾部偶见3～5个瘤细胞团，多为裸核细胞，粒、红、巨三系受抑。尿VMA 点片法：阳性。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    神经母细胞瘤

神经科经典病历64行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=头痛、恶心、呕吐1个月，加重10天。#####左侧肢体肌力下降（Ⅱ～Ⅲ级）。现病史:    weight=    assistCheck=右额叶见一椭圆形囊状病变，大小为6.4cm×5.0cm×4.6cm，囊壁呈T1WI等信号（图5a）、T2WI（图5b）稍高信号及FLAIR高信号，壁厚薄不均匀，下壁较厚，且见局限结节样隆起凸向腔内，囊内为长T1、长T2信号与FLAIR低信号，病变周围见晕状轻度T1WI低信号与T2WI高信号带环绕。病变局部脑沟裂变浅，右侧侧脑室受压变形。增强T1WI（图5c～e）显示病变囊壁呈花环状明显强化，内壁毛糙，见数个棘状突起向腔内延伸。病变周围相邻脑膜未见异常强化。病理诊断：多形性胶质母细胞瘤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胶质母细胞瘤

神经科经典病历65行-1
    [Documentation]    断言:"脑栓塞"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=81    highBldPress=118    lowBldPress=67    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
    ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。    weight=72    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    脑栓塞

神经科经典病历65行-2
    [Documentation]    断言:"风湿性心脏病"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=81    highBldPress=118    lowBldPress=67    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
    ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。    weight=72    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    风湿性心脏病

神经科经典病历65行-3
    [Documentation]    断言:"二尖瓣狭窄"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=81    highBldPress=118    lowBldPress=67    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
    ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。    weight=72    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    二尖瓣狭窄

神经科经典病历65行-4
    [Documentation]    断言:"心房颤动"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=81    highBldPress=118    lowBldPress=67    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
    ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。    weight=72    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心房颤动

神经科经典病历66行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=13    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=105    lowBldPress=68    personalHistory=    previousHistory=
    ...    symptom=因头痛、呕吐3天，发热1天为主诉来诊。#####发育营养良，神志清，痛苦面容，被动体位。内科系统检查心尖搏动于锁中线外第5 肋间10cm，胸骨左缘第2 肋间处可闻及Ⅳ级以上收缩期粗糙喷射性杂音并可扪及细震颤，余无异常。神经系统检查，颅神经、周围神经均未见异常。脑膜刺激征：颈强明显，布氏征及克氏征阳性。现病史:3天前在用力大便时，突然出现剧烈头痛难忍，以左侧前额部为重，为持续爆裂样痛，随之出现喷射状呕吐，约数十次；吐物为胃内容。吐后头痛自觉稍有减轻。来诊前1天出现发热T 38℃，无流涕、咳、泻。无抽搐、昏迷、失语及肢体活动障碍。既往自幼好头痛，患有先天性心脏病主动脉瓣狭窄。    weight=    assistCheck=WBC 20﹒7 ×10 9／L，Hb116g／L，PLT150 ×10 9／L。头部CT：左半侧环池、小脑幕上及大脑大静脉池内可见高密度灶，左侧海绵窦内亦见高密度灶，提示蛛网膜下腔出血，不除外海绵窦内血管畸形。脑脊液检查为均匀一致血性，离心上清液黄染。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    蛛网膜下腔出血

神经科经典病历67行-1
    [Documentation]    断言:"蛛网膜下腔出血"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=家族中无心、脑血管疾病患者。
    ...    gender=0    heartRate=99    highBldPress=130    lowBldPress=74    personalHistory=    previousHistory=高血压病史3年，最高达160／90mmHg，平素服用卡托普利，一次12.5mg，每日3次，血压控制在130／70mmHg水平；否认糖尿病史；否认心脏病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。
    ...    symptom=头痛、恶心、呕吐3小时。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志清楚，语言流利，双瞳孔等大等圆，d＝4.0mm，对光反射灵敏，眼球活动自如，眼睑无下垂，额纹对称，鼻唇沟对称，示齿口角无偏斜，咬肌有力，咽反射存在，转头、耸肩有力，伸舌居中。四肢肌力Ⅴ级，四肢肌张力可。双肱二头肌腱反射（＋＋）、双膝腱反射（＋＋），右侧巴氏征，左侧巴氏征。颈抵抗，颏下4横指。克氏征阳性。无感觉障碍。现病史:3小时前打麻将时突然出现头痛，以整个顶部为著，呈胀痛，伴恶心、喷射性呕吐，呕吐物为胃内容物，无肢体活动障碍，无头晕、耳鸣等，无意识丧失、尿便失禁，无发热、咳嗽、咳痰，就诊于综合医院，脑CT示：脑沟、脑裂及外侧裂高密度影，考虑蛛网膜下腔出血。心电图：窦性心律，正常心电图，为求进一步治疗入神经内科病房。    weight=68    assistCheck="血常规：白细胞计数（WBC）8.6×109／L，中性粒细胞百分比：68%，血红蛋白（Hb）132g／L，血小板计数（PLT）206×109／L。血生化：电解质：血钠：140mmol／L，血钾：4.1mmol／L，余检查正常。脑CT：脑沟、脑裂及外侧裂高密度影。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    蛛网膜下腔出血

神经科经典病历67行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=家族中无心、脑血管疾病患者。
    ...    gender=0    heartRate=99    highBldPress=130    lowBldPress=74    personalHistory=    previousHistory=高血压病史3年，最高达160／90mmHg，平素服用卡托普利，一次12.5mg，每日3次，血压控制在130／70mmHg水平；否认糖尿病史；否认心脏病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。
    ...    symptom=头痛、恶心、呕吐3小时。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志清楚，语言流利，双瞳孔等大等圆，d＝4.0mm，对光反射灵敏，眼球活动自如，眼睑无下垂，额纹对称，鼻唇沟对称，示齿口角无偏斜，咬肌有力，咽反射存在，转头、耸肩有力，伸舌居中。四肢肌力Ⅴ级，四肢肌张力可。双肱二头肌腱反射（＋＋）、双膝腱反射（＋＋），右侧巴氏征，左侧巴氏征。颈抵抗，颏下4横指。克氏征阳性。无感觉障碍。现病史:3小时前打麻将时突然出现头痛，以整个顶部为著，呈胀痛，伴恶心、喷射性呕吐，呕吐物为胃内容物，无肢体活动障碍，无头晕、耳鸣等，无意识丧失、尿便失禁，无发热、咳嗽、咳痰，就诊于综合医院，脑CT示：脑沟、脑裂及外侧裂高密度影，考虑蛛网膜下腔出血。心电图：窦性心律，正常心电图，为求进一步治疗入神经内科病房。    weight=68    assistCheck="血常规：白细胞计数（WBC）8.6×109／L，中性粒细胞百分比：68%，血红蛋白（Hb）132g／L，血小板计数（PLT）206×109／L。血生化：电解质：血钠：140mmol／L，血钾：4.1mmol／L，余检查正常。脑CT：脑沟、脑裂及外侧裂高密度影。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

神经科经典病历68行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=00    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=生后发现左眼睑裂较右眼小3年。#####远视力：右眼0.5，左眼0.1（欠合作），近视力检查不合作。右眼睑裂高度正常，瞳孔大小相对恒定，左眼睑裂及瞳孔大小则呈现周期性变化。麻痹期：左眼睑裂3mm，瞳孔直径5mm，对光反射消失，左眼外斜–8°，左眼外转轻度受限，内转、上、下转均不能过中线。痉挛期：左眼睑裂7mm，瞳孔直径2mm，对光反射消失，双眼正位，左眼外转轻度受限，程度与麻痹期大致相同，可轻度内转、上转及下转。麻痹期持续时间约50s，痉挛期持续时间约15s（图36-1～图36-4）。散瞳眼底检查正常。其余脑神经检查未见异常。现病史:女性，3岁，足月顺产，无吸氧史，无严重感染史，无类似疾病家族史。于生后即出现左眼睑裂较右眼小，在强光刺激下症状更加明显，同时左眼间断呈现外斜状态，于2岁时就诊于当地医院诊断为“左眼先天性动眼神经不全麻痹，左眼弱视”，并于该院行左眼外直肌减弱术（后徙9mm）。术后外斜稍有好转，效果不满意。为纠正左眼小来我院就诊。    weight=    assistCheck=" Bell征 右眼（阳性），左眼（弱阳性）。睑裂高度和瞳孔周期性变化的动态观察：（1）麻痹期：睑裂高度3mm，持续时间约50秒，瞳孔直径5mm，对光反射消失（2）痉挛期：睑裂高度7mm，持续时间约15秒，瞳孔直径2mm，对光反射消失。颅脑磁共振检查（MRI）未见明显异常改变。脑血管超声检查（TCD）双侧大脑中动脉血流不对称。肌电图检查 麻痹期内直肌、提上睑肌和上、下直肌均无自发电位产生，痉挛期可见内直肌有较强的动作电位痉挛相持续15秒，然后又回到麻痹相，如此循环不已。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    动眼神经麻痹

神经科经典病历69行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=19    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=进行性双下肢无力伴肌萎缩2年。#####现病史:双下肢肌无力以远端重，行走呈足下垂，肌萎缩呈“鹤腿”或倒立的香槟酒瓶状，双膝反射正常，踝反射引不出，双足呈弓形足，伴有营养障碍，深浅感觉障碍不明显（似有短袜套痛觉减退）。肌电图显示以轴索损害为主，运动神经传导速度稍减慢。双手肌萎缩不明显。    weight=    assistCheck=影像学检查示：“鹤腿”或倒立的香槟酒瓶样改变    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    腓骨肌萎缩症

神经科经典病历70行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=54    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=无高血压、糖尿病史。
    ...    symptom=2009年5月26日突然出现复视，伴头晕，28日出现上睑下垂，无头痛及视力下降，无肢体运动障碍，2009年6月3日就诊于解放军总医院神经眼科门诊。#####眼部检查：视力右眼1.2、左眼0.9，左上睑下垂、完全不能上抬，瞳孔直径右眼3mm、左眼6mm，左眼对光反射消失，双眼视盘色淡红、界清，左眼球固定于外下斜位，向上、内、下运动受限。现病史:    weight=    assistCheck=头颅CT及MRI未见异常；磁共振动脉成像（MRA）报告左侧后交通动脉起始处见一6.1mm×8.8mm的动脉瘤，瘤顶指向后外下方，瘤颈宽4.4mm    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    颅内动脉瘤

神经科经典病历71行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=19    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=因“发现皮肤奶油咖啡斑9年，多发皮肤结节4年，脊柱侧弯2年”入院。#####患者全身皮肤见散在多发性奶油咖啡斑及皮肤结节，大小不一。皮肤结节直径约0.5～1.5cm，质软，边界清，无压痛，以颈、肩部为密集。脊柱胸腰段后凸畸形，并向右轻度侧弯畸形，各棘突及棘旁无压痛，活动功能尚好，双下肢肌力Ⅴ级，肌张力和感觉功能良好，各腱反射正常引出。    weight=    assistCheck=胸腰椎正侧位平片示：T11、T12椎体呈不规则楔形，前缘和左侧缘见弧形压迹，压迹旁骨质轻度硬化，椎间隙未见明显变窄；左侧第11、12肋骨头变尖。脊柱下胸上腰段后凸、轻度右侧弯畸形。CT平扫示：T11、T12椎体旁见软组织样肿块影，椎体、附件及相邻肋骨骨质不同程度受破坏。MRIT1WI示：肿块呈等信号，部分经左侧椎间孔向椎管内延伸；主动脉、双侧膈肌脚受推移、向前；椎体、附件及相邻肋骨受侵犯，信号混杂。T2WI示：肿块以高信号为主，呈“葡萄串”样，内见散在多发点状低信号“葡萄籽”，横断面呈“孔雀开屏”状；脊髓信号未见明确异常。T1WI+C示：肿块中等强化，部分“葡萄籽”强化明显。背部照片示：皮肤多发奶油咖啡斑和结节。病理诊断：神经纤维瘤。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    神经纤维瘤病

神经科经典病历72行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=据调查患儿三代近亲亦无癫痫史。
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=患儿既往身体健康，无任何相关疾病的过敏惊厥史和后遗症。曾接种过脊髓灰质炎糖丸疫苗、乙脑及百白破疫苗，均无癫痫发作。
    ...    symptom=1周内反复晕倒5次##### 现病史:上课时，突然两眼上翻，头后仰，手上举，晕倒；面色苍白，四肢抽搐，呼之不应，2～3分钟后清醒，但不知有发作之事，全身瘫痪30分钟。23日、26日又有2次发作，发作时不伴有咬牙、粪尿失禁，亦无发作先兆症状。患者1天前常规注射A群脑膜炎球菌多糖疫苗0.5ml    weight=    assistCheck=实验室检查（血清钙3.0mmol/L，钠328.9mmol/L），脑电图左侧慢波，尖波较右侧显著    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    癫痫样发作

神经科经典病历73行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=4    ageType=月    allergyHistory=    bodyTempr=37.6    familyHistory=家族史：父母非近亲结婚，无遗传代谢病家族史，也无同类病史。
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=个人史：母孕期健康，足月顺产，生后无窒息。现4个月不会大笑，见母亲无特殊表现。已添加蛋黄及维生素D、钙等。    previousHistory=既往史：患儿生后3个月在我院眼科做过青光眼手术。
    ...    symptom=生后即发现整个面部均由血管痣覆盖，唇部向上突出也为血管痣所致，近1天因出现抽搐来就诊。#####R32次／分，神清，状态可，呼吸平稳，无发绀。前囟平坦。颜面部皮肤均为血管痣所覆盖，暗红色，不突出于皮肤表面，唇向上突出，也呈暗红色。浅表淋巴结肿大，颈软，心肺未闻及异常，腹平，肢温。神经系统检查未见异常。现病史:抽时双眼凝视，牙关紧闭，四肢屈曲强直、抖动，持续至1～2分钟自缓。抽时意识不清，无二便失禁，不伴发热。    weight=    assistCheck=脑CT显示双侧脑皮质有异常钙化区，当时未行脑血管造影及MRI检查。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    斯特奇－卡利舍－韦伯综合征

神经科经典病历74行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=28    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=双侧上肢无力及行走困难2年，加重1个月。#####现病史:    weight=    assistCheck=矢状位T1WI及T2WI显示第4～7颈椎水平脊髓增粗、局部蛛网膜下腔变窄，脊髓内椭圆形T1WI低信号与T2WI高信号病变。矢状位增强扫描，病变中央轻度条状强化，边缘模糊。病理诊断：脊髓星形细胞瘤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    星形细胞瘤

神经科经典病历75行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=左侧面部抽搐5个月余。#####现病史:    weight=    assistCheck=影像学表现：脑实质内室管膜瘤图1-15-1A～C为横断面T1WI、T2WI及矢状T1WI，图1-15-1D为冠状水抑制，图1-15-1E、F为增强后横断面、矢状位。右侧额叶内可见一团状异常信号影，边界清楚，大小约为27mm×23mm×22mm，在T2WI和T2 FLAIR上 病灶中央呈稍高、高信号，周围可见环状低信号影，在 T1WI上呈高、等混杂信号，增强扫描病灶不均匀强化。术中所见：右额后回皮层及皮层下见一肿物，边界较清，周围可见含铁血黄素沉着，脑组织水肿轻，行全瘤切除。病理结果：送检组织内可见呈乳头状生长的异型细胞，细胞核大，核分裂象可见。免疫组化显示异型 细 胞GFAP（+），P53（部 分+），EMA（少 数+），Vimentin（+），Ki-67 1%（+），CK（－）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室管膜瘤

神经科经典病历76行-1
    [Documentation]    断言:"颅脑损伤"
    ${getRes}    智能诊断3.0    age=44    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=64    highBldPress=107    lowBldPress=75    personalHistory=    previousHistory=吸烟史20年，每日20-40支。有饮酒史，具体不详。
    ...    symptom=摔伤后意识障碍进行性加重1小时10分钟#####昏迷状态，查体不合作，皮肤无黄染，无水肿，无脱水。双侧瞳孔等大等圆，对光反射迟钝。左外耳道可见血性液体流出，鼻无堵塞，无流液。咽部查体不合作。双肺叩诊音清，肺肝相对浊音界位于右侧锁骨中线第5肋间，双肺呼吸音粗，未闻及干湿性啰音。脊柱四肢无畸形。现病史:患者于1小时10分钟前，饮大约3两白酒6瓶啤酒后不慎摔倒，可唤醒但言语不清，伴左耳道流血，约半小时后呼之不应，无抽搐、无呕吐，无大小便失禁。院外未做特殊处理，120送院。急诊以“重度颅脑损伤”收入病房。患病以来，患者意识障碍进行性加重，目前呈昏迷状态，未进饮食，呕吐一次，无大便失禁。    weight=    assistCheck=头颅CT：脑干损伤，广泛蛛网膜下腔出血、脑挫裂伤、颅底骨折。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    颅脑损伤

神经科经典病历76行-2
    [Documentation]    断言:"脑挫伤"
    ${getRes}    智能诊断3.0    age=44    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=64    highBldPress=107    lowBldPress=75    personalHistory=    previousHistory=吸烟史20年，每日20-40支。有饮酒史，具体不详。
    ...    symptom=摔伤后意识障碍进行性加重1小时10分钟#####昏迷状态，查体不合作，皮肤无黄染，无水肿，无脱水。双侧瞳孔等大等圆，对光反射迟钝。左外耳道可见血性液体流出，鼻无堵塞，无流液。咽部查体不合作。双肺叩诊音清，肺肝相对浊音界位于右侧锁骨中线第5肋间，双肺呼吸音粗，未闻及干湿性啰音。脊柱四肢无畸形。现病史:患者于1小时10分钟前，饮大约3两白酒6瓶啤酒后不慎摔倒，可唤醒但言语不清，伴左耳道流血，约半小时后呼之不应，无抽搐、无呕吐，无大小便失禁。院外未做特殊处理，120送院。急诊以“重度颅脑损伤”收入病房。患病以来，患者意识障碍进行性加重，目前呈昏迷状态，未进饮食，呕吐一次，无大便失禁。    weight=    assistCheck=头颅CT：脑干损伤，广泛蛛网膜下腔出血、脑挫裂伤、颅底骨折。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑挫伤

神经科经典病历77行-1
    [Documentation]    断言:"脑梗死"
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=82    highBldPress=148    lowBldPress=87    personalHistory=吸烟30年，40支／日，饮酒30年，白酒5两／日。    previousHistory=既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
    ...    symptom=头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。现病史:患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。    weight=80    assistCheck="尿常规：葡萄糖（＋＋＋＋）.血常规：红细胞5.85×1012／L，血红蛋白195.0g／L，血细胞比容0.542l／L生化：总胆红素21.70μmol／L，间接胆红素18.70μmol／L，葡萄糖12.81mmol／L，总胆固醇7.36mmol／L，甘油三酯3.37mmol／L，低密度脂蛋白5.13mmol／L。血同型半胱氨酸：27.60μmol／L。糖化血红蛋白：11.1%。OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。颈部血管超声：①双侧颈总动脉、颈内外动脉起始处及椎动脉硬化症；②双侧颈总动脉、颈内外动脉起始处及椎动脉管壁毛糙，内膜增厚；③左侧颈总动脉膨大处硬化斑块形成；④右侧椎动脉内径狭窄，右侧颈部低回声反射；⑤淋巴结肿大可能。头部CT：左侧顶枕区低密度影。头MRI：左侧顶枕区急性脑梗死；双侧半卵圆中心、左侧基底节区腔隙性脑梗死；左侧颈内动脉虹吸部狭窄。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑梗死

神经科经典病历77行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=82    highBldPress=148    lowBldPress=87    personalHistory=吸烟30年，40支／日，饮酒30年，白酒5两／日。    previousHistory=既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
    ...    symptom=头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。现病史:患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。    weight=80    assistCheck="尿常规：葡萄糖（＋＋＋＋）.血常规：红细胞5.85×1012／L，血红蛋白195.0g／L，血细胞比容0.542l／L生化：总胆红素21.70μmol／L，间接胆红素18.70μmol／L，葡萄糖12.81mmol／L，总胆固醇7.36mmol／L，甘油三酯3.37mmol／L，低密度脂蛋白5.13mmol／L。血同型半胱氨酸：27.60μmol／L。糖化血红蛋白：11.1%。OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。颈部血管超声：①双侧颈总动脉、颈内外动脉起始处及椎动脉硬化症；②双侧颈总动脉、颈内外动脉起始处及椎动脉管壁毛糙，内膜增厚；③左侧颈总动脉膨大处硬化斑块形成；④右侧椎动脉内径狭窄，右侧颈部低回声反射；⑤淋巴结肿大可能。头部CT：左侧顶枕区低密度影。头MRI：左侧顶枕区急性脑梗死；双侧半卵圆中心、左侧基底节区腔隙性脑梗死；左侧颈内动脉虹吸部狭窄。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

神经科经典病历77行-3
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=82    highBldPress=148    lowBldPress=87    personalHistory=吸烟30年，40支／日，饮酒30年，白酒5两／日。    previousHistory=既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
    ...    symptom=头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。现病史:患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。    weight=80    assistCheck="尿常规：葡萄糖（＋＋＋＋）.血常规：红细胞5.85×1012／L，血红蛋白195.0g／L，血细胞比容0.542l／L生化：总胆红素21.70μmol／L，间接胆红素18.70μmol／L，葡萄糖12.81mmol／L，总胆固醇7.36mmol／L，甘油三酯3.37mmol／L，低密度脂蛋白5.13mmol／L。血同型半胱氨酸：27.60μmol／L。糖化血红蛋白：11.1%。OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。颈部血管超声：①双侧颈总动脉、颈内外动脉起始处及椎动脉硬化症；②双侧颈总动脉、颈内外动脉起始处及椎动脉管壁毛糙，内膜增厚；③左侧颈总动脉膨大处硬化斑块形成；④右侧椎动脉内径狭窄，右侧颈部低回声反射；⑤淋巴结肿大可能。头部CT：左侧顶枕区低密度影。头MRI：左侧顶枕区急性脑梗死；双侧半卵圆中心、左侧基底节区腔隙性脑梗死；左侧颈内动脉虹吸部狭窄。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    2型糖尿病

神经科经典病历78行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往有高血压病史5年左右，未规律服用降压药物，血压控制差，收缩压最高达200mmHg，2年前发生过“脑室出血”，在当地医院住院治疗，未遗留后遗症。
    ...    symptom=因“突发昏迷不醒3小时”入院#####入院查体: T 36. 8℃，P 92 次/分，R 20次/分，BP 225/114mmHg，深昏迷，查体不合作，GCS评分: E1V1M2，双侧瞳孔针尖样，光反射消失。颈部有抵抗感，克氏征( +)。双侧鼻唇沟无变浅，口角无歪斜。双侧肢体深浅感觉检查不合作。四肢肌力0级，肌张力减弱，双侧膝腱及跟腱反射亢进，双侧巴氏征( +)。现病史:本次入院前3小时患者无明显诱因突发头痛、头晕，呈全头性胀痛，伴喷射性恶心呕吐及左侧肢体活动不灵，数分钟后意识不清，呕吐物为胃内容物，无发热寒战，无肢体抽搐，无大小便失禁。    weight=    assistCheck=颅脑CT扫描发现“脑干出血”。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑干出血

神经科经典病历79行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=1    heartRate=101    highBldPress=95    lowBldPress=60    personalHistory=    previousHistory=2年来出现类似四肢无力2次，两次发作时均不能行走，发作间期肌力正常。每次查电解质血钾均正常。
    ...    symptom=发作性四肢无力8天#####神清，心肺腹未见明显异常。颅神经（-）。双上肢肌力近端IV级，远端V级，双下肢肌力近端IV级，远端III级。四肢腱反射正常，肌张力减弱，深浅感觉正常，病理征未引出。现病史:患者8天前受凉后轻微发热，继而四肢无力，不能行走。口服药物治疗后，热退，但仍有四肢无力，不能行走。    weight=    assistCheck=电解质：血钾：4.12mmol/l,血钠：135mmol/l。心电图正常，心肌酶正常，甲状腺功能正常。肌电图传导速度正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    正常钾型周期性麻痹

神经科经典病历80行-1
    [Documentation]    断言:"腔隙性脑梗死"
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=150    lowBldPress=90    personalHistory=    previousHistory=既往高血压病史2年，未规律服用降压药物。
    ...    symptom=主因突发言语笨拙1天就诊#####右侧颈内动脉听诊区可及血管杂音。神志清晰，左侧轻度舌瘫，双侧瞳孔等大同圆，对光反射灵敏，余颅神经检查未见异常。四肢肌力肌张力正常，左侧Chaddock 征阳性。    weight=    assistCheck=头部CT 示右侧基底节区腔隙性脑梗死。血管超声示右侧颈内动脉中‐重度狭窄，左侧锁骨下动脉中度狭窄。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    腔隙性脑梗死

神经科经典病历80行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=150    lowBldPress=90    personalHistory=    previousHistory=既往高血压病史2年，未规律服用降压药物。
    ...    symptom=主因突发言语笨拙1天就诊#####右侧颈内动脉听诊区可及血管杂音。神志清晰，左侧轻度舌瘫，双侧瞳孔等大同圆，对光反射灵敏，余颅神经检查未见异常。四肢肌力肌张力正常，左侧Chaddock 征阳性。    weight=    assistCheck=头部CT 示右侧基底节区腔隙性脑梗死。血管超声示右侧颈内动脉中‐重度狭窄，左侧锁骨下动脉中度狭窄。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

神经科经典病历81行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=57    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无家族性遗传病史及传染病人密切接触史。父亲已故，自然死亡；母亲体健。
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=无吸烟饮酒史，无毒品接触史。已婚，结婚年龄24岁，配偶健康状况良好。    previousHistory=平素健康状况良好，无传染病史，无手术外伤史，无过敏史。
    ...    symptom=突发头痛3天#####神志清楚，GCS评分15分，双瞳等大等圆，直径2.5mm，对光反射灵敏，伸舌居中，四肢肌力、肌张力正常，病理征（－），心肺腹（－）。 现病史:病人3天前无明显诱因突发头痛伴呕吐，有小便失禁，在当地人民医院行头颅CT检查示左侧脑室三角区占位，脑室出血，今为求进一步诊治转来我院。起病以来，病人精神、食欲差，大便未解，体力下降。    weight=    assistCheck=CT提示左侧脑室脑膜瘤。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    脑膜瘤
    ##########消化科经典病例##############

消化科经典病历2行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=30    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=0    heartRate=91    highBldPress=105    lowBldPress=87    personalHistory=菜农    previousHistory=
    ...    symptom=腹痛3天伴恶心、呕吐#####神志清楚，精神可；双肺呼吸音清晰，未闻及干湿性啰音。心界不大，心率91次/分，律齐。腹平坦，腹肌稍紧，上腹压痛明显，无反跳痛，Murphy 征阳性，移动性浊音阴性，肠鸣音2～3次/分，双下肢无水肿。 现病史:发作性上腹痛3天，呈发作性绞痛，进食后加重，伴有恶心、呕吐，吐后腹痛缓解    weight=    assistCheck=血常规示：WBC 9.3×10 9/L，NEUT%为80.4%，Hct 0.54；血清淀粉酶1238U/L，尿淀粉酶873U/L。腹部B 超提示：胆总管增宽，内可见条索状低信号影。上腹部CT 提示：胰头体积增大，周围可见少量渗出改变；腹部平片示：肠管少量积气。心电图及胸片正常，肝功能、肾功能、血糖、血脂未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性胰腺炎

消化科经典病历3行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=31    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=既往无肺结核史，肝炎病史5年
    ...    symptom=咳嗽，低热，右胸胀痛一个月，双下肢浮肿十天#####皮肤无黄染、皮疹及出血点，全身浅表淋巴结不大，巩膜不黄，心率80次/分，律齐，各瓣膜区未闻杂音，肺部呼吸音减低，未闻干湿啰音及胸膜摩擦音，腹平软，无压痛，肝肋下1cm，脾未及，未触及包块，无腹水征，下肢轻度水肿。 现病史:患者1个月前因受凉后出现低热，体温在38℃以下，右侧胸部胀痛，咳嗽，乏力，食欲减退，腹胀，无痰。二便正常。    weight=    assistCheck=血红蛋白110g/L，白细胞4.0 ×109/L，血小板120 ×109/L，尿、便常规正常，胸透示右侧胸腔少量积液，肾功能正常，腹部B超示肝脾大，有少量腹水。肝功能：谷丙转氨酶中度升高，血清白蛋白降低，球蛋白升高，蛋白电泳r球蛋白明显升高，HBsAg阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝硬化

消化科经典病历4行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=69    ageType=岁    allergyHistory=    bodyTempr=38.6    familyHistory=母亲患胃癌去世，妹妹患有乙肝
    ...    gender=1    heartRate=82    highBldPress=130    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=发现乙肝10年，间断乏力2年余，加重伴腹胀10天#####肝病面容，全身皮肤黏膜无黄染，无皮下出血、皮疹。可见肝掌及蜘蛛痣。全身浅表淋巴结未触及肿大。腹部膨隆，测腹围90cm，胁腹部及脐周未见瘀斑，无腹壁静脉曲张。腹肌不紧，无压痛及反跳痛，Murphy征阴性。肝脏肋下未触及，脾触诊肋下3cm，移动性浊音（＋）。 现病史:患者10年前查体发现乙肝，因无任何不适，未行进一步诊治，期间未定期复查。2年前无明显诱因出现乏力，为间断性发作，劳累后加重，休息后症状可缓解，无腹痛、腹泻，无反酸、嗳气、恶心、呕吐。1年前体检行腹部B超检查示：脂肪肝，脾大，脾静脉扩张，未予重视。10天前无明显诱因自感乏力症状加重，同时感腹胀，休息后症状无缓解，无发冷、发热，无腹痛、腹泻，无呕血、黑便。发病近10天来，食纳差、小便量少，夜间睡眠差。    weight=71    assistCheck=血常规：WBC 2.49×109/L，RBC 2.67×1012/L，Hb 92g/L，PLT 57×109/L。肝功：TBIL 29.2μmol/L、TP 54g/L、A 28.6g/L。血凝全套：PT 17.3s、APTT 52.9s、FIB 0.96g/L，PTA 1.7%，INR　1.42。胃镜：食管胃底静脉重度曲张，红色征阳性，慢性胃炎。腹部彩超：肝硬化，门静脉内径增粗，血流通畅，脾大，腹水（大量）。。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝硬化失代偿期

消化科经典病历5行-1
    [Documentation]    断言:"十二指肠溃疡"
    ${getRes}    智能诊断3.0    age=27    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=间断呕吐2个月#####患者消瘦体型，慢性病容，生命体征正常。浅表淋巴结未及。腹部可见巨大胃型，触诊张力高，振水音（+），肠鸣音正常，余未见异常。 现病史:患者自6年前起无明显诱因出现反复上腹烧灼痛，夜间、餐前明显，服用抗酸药物有效，未规律诊治。近2年来腹痛逐渐加重，2个月来开始反复于下午和夜间呕吐隔夜宿食。    weight=    assistCheck=立伟腹部平片：大量胃潴留，幽门梗阻。幽门螺杆菌（Hp）阳性。未见膈下游离气体。胃镜：十二指肠球部溃疡、球腔变形狭窄。活检病理：慢性炎症。腹部CT：幽门梗阻，十二指肠球部黏膜增厚。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    十二指肠溃疡

消化科经典病历5行-2
    [Documentation]    断言:"幽门梗阻"
    ${getRes}    智能诊断3.0    age=27    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=间断呕吐2个月#####患者消瘦体型，慢性病容，生命体征正常。浅表淋巴结未及。腹部可见巨大胃型，触诊张力高，振水音（+），肠鸣音正常，余未见异常。 现病史:患者自6年前起无明显诱因出现反复上腹烧灼痛，夜间、餐前明显，服用抗酸药物有效，未规律诊治。近2年来腹痛逐渐加重，2个月来开始反复于下午和夜间呕吐隔夜宿食。    weight=    assistCheck=立伟腹部平片：大量胃潴留，幽门梗阻。幽门螺杆菌（Hp）阳性。未见膈下游离气体。胃镜：十二指肠球部溃疡、球腔变形狭窄。活检病理：慢性炎症。腹部CT：幽门梗阻，十二指肠球部黏膜增厚。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    幽门梗阻

消化科经典病历6行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=公司职员    previousHistory=发病前工作压力大、生活不规律、经常加班。既往体健，无肾炎、胰腺炎、糖尿病、甲状腺功能亢进、肺结核、急性痢疾等病史，无血吸虫疫水接触史。
    ...    symptom=腹泻5年#####一般状态好，营养良好。心肺查体正常。腹部平软，未见静脉曲张，全腹无压痛，肝脾肋下未触及，胆囊未触及，Murphy征（－），移动性浊音（－），肠鸣音15次/分，双下肢无水肿。 现病史:患者5年来，大便不规律，反复腹泻，大便2～4次/日，稀糊黏液便，无脓血，每次量少，便前腹痛，排便后缓解。排便多在晨起和早餐后，无里急后重。经常腹痛、腹胀、排气多。腹泻好转时即出现便秘，排便费力，1～2次/周。体重无明显变化。发病多与情绪、睡眠有关，与饮食关系不大，禁食后腹泻无明显改善。曾在外院查过便常规：正常；血生化正常。每次发病时应用抗生素、多种止泻药、益生菌、酵母片和中药等。各种药物治疗开始均有效，3～5天后效果不明显。发病以来睡眠差、精神不佳、心慌、心悸、腰背酸痛，无发热、盗汗等。    weight=    assistCheck=便常规：正常。WBC 5﹒22 ×109/L，N 0﹒61，HGB 128g/L，PLT 352 ×109/L；肝肾功能和电解质正常，Alb 37﹒4g/L；ESR 2 mm/h；CRP 0﹒234 mg/dl；甲状腺功能正常。便培养（－）。便找阿米巴滋养体（－）。便苏丹Ⅲ染色（－）。PPD（－）。全消化道造影和胸片：未见异常。结肠镜：全结肠及直肠黏膜未见异常。B超和CT：肝、胆、脾、胰、双肾未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肠易激综合征

消化科经典病历7行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=64    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复腹痛、腹泻2年余#####营养良好。浅表淋巴结未触及肿大，心、肺查体正常。腹部平软，全腹无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音。 现病史:患者2年前开始反复于进冰冷食物或冷水后出现脐周、下腹绞痛，程度不剧烈，不放射，不影响日常生活。伴腹泻，3～5次/日，为黄色稀水或稀糊便，不含油滴及未消化食物，无脓血，无恶臭，不伴里急后重。腹痛多在腹泻后缓解。上述症状多在每日上午出现，进早餐后加重，如不进早餐症状减轻，夜间无腹泻。不伴发热、皮疹、体重下降、水肿等。    weight=    assistCheck=粪常规：WBC、RBC（－），便潜血（－）×3次；便苏丹Ⅲ染色（－）。血常规：WBC 7﹒8 ×109/L，N 0﹒65，HGB 132g/L，PLT 257 ×109/L；肝肾功能、电解质正常。甲状腺功能：T3、T4、TSH均正常范围。ESR 10 mm/h；CRP 0.7 mg/dl。B超：肝胆胰脾及双肾未见明显异常。全消化道造影未见异常。结肠镜：进镜至末段回肠10c m，所经末段回肠、结肠、直肠黏膜未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肠易激综合征

消化科经典病历8行-1
    [Documentation]    断言:"乙型病毒性肝炎"
    ${getRes}    智能诊断3.0    age=33    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往体健无特殊传染病
    ...    symptom=反复乏力，食欲低下，肝区不适3年#####慢性病容，神志清，巩膜轻度黄染，颜面及颈部有数枚蜘蛛痣，未见明显肝掌，心肺无异常发现，腹平软，无压痛，未扪及包块，肝右肋下2cm，质中等，无明显触痛，肝侧位可及，无移动性浊音。 现病史:患者3年前感乏力、食欲减退，肝功能检查发现转氨酶升高、HBsAg 阳性，经当地医院保肝治疗，效果不明显，间断有肝区不适等症状。近1个月来因症状加重而就诊。    weight=    assistCheck=肝功能：ALT 1945U/L，AST 1562U/L，血清白蛋白30g/L，球蛋白42g/L，TBIL 30μmol/L；血清乙肝标志物检测：HBsAg（＋），抗-HBs（－），HBeAg（＋），抗-HBe（－），抗-HBc（＋）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    乙型病毒性肝炎

消化科经典病历8行-2
    [Documentation]    断言:"慢性病毒性肝炎"
    ${getRes}    智能诊断3.0    age=33    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往体健无特殊传染病
    ...    symptom=反复乏力，食欲低下，肝区不适3年#####慢性病容，神志清，巩膜轻度黄染，颜面及颈部有数枚蜘蛛痣，未见明显肝掌，心肺无异常发现，腹平软，无压痛，未扪及包块，肝右肋下2cm，质中等，无明显触痛，肝侧位可及，无移动性浊音。 现病史:患者3年前感乏力、食欲减退，肝功能检查发现转氨酶升高、HBsAg 阳性，经当地医院保肝治疗，效果不明显，间断有肝区不适等症状。近1个月来因症状加重而就诊。    weight=    assistCheck=肝功能：ALT 1945U/L，AST 1562U/L，血清白蛋白30g/L，球蛋白42g/L，TBIL 30μmol/L；血清乙肝标志物检测：HBsAg（＋），抗-HBs（－），HBeAg（＋），抗-HBe（－），抗-HBc（＋）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性病毒性肝炎

消化科经典病历9行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=70    highBldPress=120    lowBldPress=70    personalHistory=高校学生    previousHistory=既往体健，否认结核、肝炎、伤寒等传染病史。“国庆”期间曾与同学外出旅游2天。
    ...    symptom=恶心、呕吐、腹痛3天#####急性病容，巩膜轻度黄染，未见皮疹和出血点。浅表淋巴结无肿大。心、肺（－）。腹平软，无明显压痛和反跳痛，肝肋下2cm，质软，轻触痛，脾未及，肠鸣音正常。 现病史:患者3天前突起畏寒、发热，全身乏力，体温39℃，自服“板蓝根”等药，第2天热退，出现恶心、呕吐，每天10余次，为胃内容物，量不多，无咖啡色样物。同时伴有腹泻、腹痛，大便黄色，为稀水样便，无脓血，每天4次。病后几乎未进食，小便浓茶样。    weight=    assistCheck=血细胞分析：Hb 135g/L，WBC 8.5×109/L，N 0.55，L 0.45，PLT 185×109/L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性病毒性肝炎

消化科经典病历10行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=19    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=高校学生    previousHistory=既往体健，否认结核、肝炎、伤寒等传染病史。“五一”期间曾与同学外出旅游3天。
    ...    symptom=恶心、呕吐、腹痛4天#####急性病容，巩膜轻度黄染，未见皮疹和出血点。浅表淋巴结无肿大。心、肺未见异常。腹平软，无明显压痛和反跳痛，肝肋下1cm，质软，轻触痛，脾未及，肠鸣音正常。 现病史:患者4天前突起畏寒、发热，全身乏力，体温39.3℃，自服“抗病毒冲剂”等药，第2天热退，出现恶心、呕吐，同时伴有腹泻、腹痛，大便黄色，为稀水样便，无脓血。病后几乎未进食，小便浓茶样。    weight=    assistCheck=ALT 235U/L，AST 166U/L，TBIL 73μmol/L；尿液Bil（＋＋＋）；Uro（＋＋）；血清甲肝IgM抗体阳性；血清乙肝标志物检测：HBsAg（－），抗‐HBs（＋），HBeAg（－），抗‐HBe（－），抗‐HBc（－）；血清丙肝抗体检测（－）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性病毒性肝炎

消化科经典病历11行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=37    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=右下腹痛12小时#####右下腹明显压痛，反跳痛，肌紧张，肝浊音界缩小，移动性浊音阳性 现病史:12小时前突起转移性右下腹痛，伴恶心、呕吐、发热    weight=    assistCheck=血常规白细胞17×109/L，N 0.88    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性腹膜炎

消化科经典病历12行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=75    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=64    highBldPress=140    lowBldPress=100    personalHistory=    previousHistory=
    ...    symptom=反复发作右上腹胀痛5年余，加重5天#####腹部平坦，未见胃肠型及蠕动波，无腹壁静脉曲张。腹软，右上腹部轻压痛，无反跳痛，无胃区震水音，未触及腹部及腹壁包块。肝脾肋下未触及肿大，Murphy征（-），麦氏点压痛。腹部叩诊呈鼓音，肝肾区无叩痛，移动性浊音（-）。肠鸣音5次/分。 现病史:患者5年前无诱因出现右上腹部疼痛，呈持续性胀痛，进食后疼痛尤为明显，间断行止痛抗感染治疗。近5天来，腹痛加重，伴纳差，腹胀，心悸，全身乏力，无恶心呕吐，无呕血。无头痛及头晕，无咳嗽及咳痰，无咯血及呼吸困难，无喘憋，无尿频、尿急及尿痛，无肉眼血尿。为求进一步诊治入院。自患病以来，神志清，精神一般，饮食差，睡眠欠佳，大小便正常。    weight=    assistCheck=腹部彩超：胆囊壁厚约0.3cm。血常规：WBC　10×109/L，中性细胞比率74．14%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性胆囊炎

消化科经典病历13行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=85    personalHistory=    previousHistory=无胆石症等胆道疾病，无手术史，否认肝炎、饮酒及服药史
    ...    symptom=反复皮肤瘙痒5年，加重伴黄染半个月#####神志清楚，查体合作。皮肤巩膜中度黄染，心肺未见阳性体征，腹平软，无压痛，肝未触及、无叩痛，脾于左肋下2cm可触及，无压痛。移动性浊音阴性，双下肢无水肿。 现病史:患者近5年来无明显诱因反复出现皮肤瘙痒，常感乏力不适，无皮疹，曾服抗过敏药物治疗，症状时轻时重。近半个月来皮肤巩膜黄染，瘙痒加重，无发热、腹痛，体重无减轻。    weight=    assistCheck=尿胆原阳性。肝功能：总蛋白 61.4g/L、白蛋白 38.9g/L、球蛋白 22.5g/L、ALT 480U/L、AST 371U/L、ALP 134U/L、GGT 326U/L、TBA 196.2μmol/L、TBIL 99.9μmol/L、DBIL 67.7μmol/L、IBIL 32.2μmol/L；胆固醇 4.5μmol/L、甘油三酯 3.27mmol/L。MRCP 肝内外胆管变细、僵直，肝门区胆管显示欠佳。胆囊不大，壁稍厚，脾脏大。肝组织病理检查提示小胆管减少，胆管周围纤维组织明显增生。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原发性硬化性胆管炎

消化科经典病历14行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=体检发现脂肪肝3年余，肝功能正常未予治疗。
    ...    symptom=反酸、胸骨后烧灼感半年，吞咽不畅、胸痛半月#####腹部稍膨，腹壁未见曲张静脉，剑突下压迫隐痛不适，全腹未扪及包块，肝脾肋下未触及。肝肾区叩击痛（-），移动性浊音（-），肠鸣音正常。 现病史:患者反酸、胸骨后烧灼感半年，常于饮酒后出现，反酸以进食后或卧位明显，空腹时或坐立位减轻，曾经间断服用“铝碳酸镁”等药物，烧心症状稍有减轻，但仍有反酸。近半月来渐出现胸骨后不适感，伴有间隙性吞咽不畅和轻度胸痛。病程中时有嗳气、反胃，伴有上腹饱胀不适。食欲稍差，二便正常。无反复咳嗽、喘息，无呕血、黑便，无节律性上腹痛，近期无明显消瘦。    weight=    assistCheck=B超提示脂肪肝。肝肾功能正常，甘油三酯轻度增高，血糖正常。24小时pH监测提示酸反流。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胃食管反流病

消化科经典病历15行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=44    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=76    highBldPress=105    lowBldPress=75    personalHistory=    previousHistory=身体健康，无外伤及手术史，无药物过敏史
    ...    symptom=咽下困难5年，加重伴胸骨后疼痛1年#####营养中等，皮肤黏膜无黄染，浅表淋巴结未触及肿大，心肺未见异常，未见胃肠型、蠕动波，腹软，振水音（－），肝脾肋下未触及，移动性浊音（－），肠鸣音正常。 现病史:患者于5年前无明显诱因出现咽下困难，开始进硬质食物时明显，用水送服后食物可咽下，近1年出现上述症状加重，同时出现进食时胸骨后疼痛，不能进硬食，经 常有食物反流至咽喉部引起咳嗽，无恶心、呕吐、腹痛、嗳气、腹胀、腹泻、黑便，无黄疸、鼻出血、胸痛，曾服用硝苯地平治疗，症状一度缓解，近1年服用该药物无明显效果，为进一步诊治收入院。自发病以来，患者食欲尚好，睡眠及大小便正常，体重减轻约10kg。    weight=    assistCheck=食管造影：食管下端呈鸟嘴样狭窄    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    贲门失弛缓症

消化科经典病历16行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=73    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=85    lowBldPress=50    personalHistory=    previousHistory=1个月前患者曾心肌梗死入住心内科，行冠状动脉支架植入术，术后规律服用氯吡格雷及阿司匹林双抗治疗。
    ...    symptom=呕吐咖啡样胃内容物9小时#####贫血貌，双肺呼吸音清。腹平软，无压痛或反跳痛，肝脾肋下未触及，肠鸣音活跃。 现病史:患者入院前9小时无明显诱因出现眩晕，伴剧烈呕吐，先呕出胃内容物，继而出现呕血，为暗红色血液，总量约600ml，并伴头昏、心慌。    weight=    assistCheck=血红蛋白65g/L。胃镜下见食管贲门处黏膜12点、3点处线性撕裂伤，有活动性鲜血渗出，胃腔内大量咖啡样胃液，球部未见明显病变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    食管贲门粘膜撕裂综合征

消化科经典病历17行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=26    ageType=岁    allergyHistory=    bodyTempr=38.2    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=118    lowBldPress=72    personalHistory=    previousHistory=
    ...    symptom=腹痛、腹泻、发热2天#####一般情况尚可，腹平软，左下腹轻压痛，肠鸣音活跃。 现病史:患者2天前进食剩饭、剩菜后出现腹痛和腹泻，腹痛为下腹阵发性绞痛，便前重，便后缓解，无放射痛，大便为黄色稀水样便，后为黏液脓血便，每日解5～7次，有里急后重感，稍感恶心，曾呕吐两次，非喷射性，为胃内容物，量不多，有轻微的畏寒、发热，自服“藿香正气液”，症状无缓解。发病来精神、睡眠欠佳，食欲差，尿量较少，体重无明显下降。    weight=    assistCheck=血常规：WBC 13.3×109/L，N 80%，L 14%，E 0.5%，M 5.5%，RBC 4.1 ×1012/L，HGB 145g/L，PLT 246×109/L。肝功能正常。肾功能正常。电解质：K＋3﹒8mmol/L，Na＋132﹒2mmol/L，CL－90﹒1mmol/L。血、尿淀粉酶正常。尿常规正常。大便常规：黏液脓血便，WBC 满视野，RBC 满视野，脓细胞4～7/HP，吞噬细胞3～5/HP，OB（＋），动力试验阴性。腹部B超正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性细菌性痢疾

消化科经典病历18行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=85    highBldPress=128    lowBldPress=77    personalHistory=    previousHistory=
    ...    symptom=上腹部隐痛、恶心、欲吐1天#####心肺（—）。腹平坦，未见胃肠型及蠕动波，未见腹壁静脉曲张，腹软，剑突下压痛，无反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性，肝浊音界位于右胸锁骨中线第5 肋间，肝区、脾区及双肾区无叩痛，肠鸣音4次/分，无气过水声。 现病史:患者1天前晚餐进食凉菜及冰冻西瓜后稍感上腹部隐痛不适，疼痛部位较固定，无明显放射，间断发作，疼痛发作时感恶心、欲吐，伴食欲降低，无畏寒、发热、黄疸、胸痛、胸闷、反酸、嗳气。肛门排气、排便正常。自患病以来，精神、睡眠差、未进食，大小便正常，体重无明显变化。    weight=    assistCheck=血常规示：WBC 6.5×109/L，HGB 123g/L，PL T 202×109/L。胃镜检查示：胃体黏膜充血肿胀。血尿淀粉酶正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性胃炎

消化科经典病历19行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=吸烟20年，10支/天，其兄死于“消化道肿瘤”。
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=上腹部隐痛不适2个月#####一般状况尚可，浅表淋巴结未及肿大，皮肤无黄染，结膜甲床苍白，心肺未见异常，腹平坦，未见胃肠型及蠕动波，腹软，肝脾未及，腹部未及包块，剑突下深压痛，无肌紧张，移动性浊音（－），肠鸣音正常，直肠指检未及异常。 现病史:患者2个月前出现上腹部隐痛不适，进食后明显，伴饱胀感，食欲逐渐下降，无明显恶心、呕吐及呕血，治疗后稍好转。近半月自觉乏力，体重较2个月前下降6kg。近日大便色黑。    weight=    assistCheck=大便潜血（＋），血Hb 96g/L。上消化道钡剂造影示：胃角见约3cm大小龛影，位于胃轮廓内，周围黏膜僵硬粗糙；腹部B超检查未见肝异常，胃肠部分检查不满意。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胃癌

消化科经典病历20行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=腹泻2个月、便血11天#####生命体征平稳，贫血貌，心肺未见明显异常阳性体征，腹平、软，无压痛、反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性。双下肢无水肿。 现病史:患者2个月前无明显诱因出现腹泻，每日黄色稀便2～3次，不成形，无黏液脓血，不伴腹痛、腹胀、里急后重、畏寒、发热，未予特殊处理。11天前患者进食辛辣食物后，出现便血，鲜红色血液便，共5次，量不多，伴夜间潮热、盗汗、食欲减退等表现，无腹痛、腹胀、里急后重，无黏液脓血，无便不尽感，无头昏、心慌、乏力等表现。患者患病以来，精神欠佳，食欲尚可，大便如上述，小便基本正常，体重下降约4kg。    weight=    assistCheck=血常规示WBC 4.85 ×109/L，Hb 69.2g/L，PLT 225×109/L，N 70.11%。肝、肾功能正常。电解质示血钾3.31mmol/L，血氯111.5mmol/L，余无异常。血沉为51mm/h，大小便常规无异常，大便隐血阴性。PPD（＋＋＋）。腹部彩超示：①右肝钙化灶；②左肾小囊肿；③胰、脾、右肾超声未见明显异常。心电图正常。胸片示右肋膈角胸膜增厚。肠镜示：升结肠、结肠肝曲各见一糜烂，黏膜颗粒不平，息肉样增生，回盲部及升结肠见多个息肉，黏膜活检示：黏膜组织慢性炎症。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肠结核

消化科经典病历21行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=反复腹泻、黏液脓血便17年，再发3个月，加重伴腹痛1周余#####心、肺未见异常，腹部平坦，未见肠型及蠕动波，无腹壁静脉曲张，全腹软，左下腹部压痛，无反跳痛及肌紧张，未扪及包块，肝、脾肋缘下均未扪及，肝、脾、双肾区无叩痛，移动性浊音阴性，肠鸣音正常，未闻及气过水声。双下肢无水肿。 现病史:患者17年前无明显诱因开始出现腹泻，为黏液脓血便，具体次数不详，每天最多20 余次，每次量少，伴发热、里急后重感，最高体温为41.0℃，无反酸、恶心、呕吐、腹痛，无咳嗽、咳痰、心慌、胸闷、气短等，对症治疗后缓解。3个月前，上述症状再次发作，药物治疗无明显好转。近1周来腹泻逐渐加重，每天20余次，量少，为黏液脓血便，伴厌食、恶心、腹痛，腹痛以左下腹部为主，为间断性隐痛，无放射痛，最长持续几分钟，便后腹痛可缓解。    weight=    assistCheck=血常规：Hb 108g/L、WBC 4.8 ×109/L、N 74%；凝血三项基本正常；肝功示Alb 33.2g/L，余正常；尿常规示尿酮体阳性，余正常；乙肝两对半阴性；肾功示血钾3.06mmol/L、钠129.2mmol/L；大便隐血试验阳性，大便常规示白细胞0～3/HP、红细胞0～2/HP；大便普通培养无致病菌生长；胸片示双肺未见异常，胸椎骨质增生；心电图示窦性心律。行肠镜检查示全结直肠黏膜弥漫性充血、糜烂，并见息肉样增生，黏膜质脆易出血，印象：全结直肠病变，考虑炎症性肠病。病理结果示（结肠）黏膜组织慢性炎伴局部糜烂及中性粒细胞浸润。多肿瘤标志物蛋白芯片检查未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    溃疡性结肠炎

消化科经典病历22行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=26    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=腹痛、纳差6个月，腹泻、消瘦3月余#####生命体征平稳，体型消瘦，皮肤黏膜无苍白黄染，无口舌溃疡，无杵状指（趾），心肺未见异常阳性体征，腹平、软，无压痛、反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性。双下肢无水肿。 现病史:患者6个月前无明显诱因出现间歇性上腹隐痛不适，以下午及夜间较明显，与进食、体位、排便无明显关系，精神食欲差，伴反酸、嗳气，无潮热盗汗，无腹泻、呕血、便血、黑便，无头昏、心悸、黄疸。予抑酸、对症支持治疗，腹痛无明显缓解。3个月前逐渐出现腹泻，4～5次/天，大便呈黄色糊状，内含少量食物残渣，无黏液脓血，仍有间歇性上腹隐痛，伴反酸、嗳气、消瘦、纳差。患者患病以来，精神食欲差，小便正常，大便如前述，体重下降15kg。    weight=    assistCheck=血常规示WBC 6.40 ×109/L，RBC 3.53×1012/L，HGB 88g/L，HCT 28.8，PLT 364×109/L，NEUT 69.4%；肝功示ALT 5U/L，AST 6U/L，GGT 12U/L，ALP 81U/L，TP 62.2g/L，Alb 26.9g/L，TBIL 6.1μmol/L，DBIL 1.1μmol/L，肾功示电解质：钾3.47mmol/L，余正常，乙肝三对、输血前ICT均阴性，大小便常规、凝血三项均正常，大便培养未见虫卵。多肿瘤标志物均阴性。妇科超声示：子宫体、卵巢超声未见明显异常。上腹部增强CT示：小肠、结肠肠壁增厚改变，肠系膜淋巴结肿大，考虑感染可能性大。结肠镜检查：乙状结肠横结肠见横形溃疡，底部糜烂，有周围增生性息肉隆起，呈节段性分布。升结肠及回盲部见大量息肉样隆起，广泛直径0.1～0.2cm憩室腔，肠壁增厚变硬，肠腔狭窄。回盲瓣变形未闭，未能观察回肠末端。病理示：（回盲部）黏膜组织慢性炎症伴部分炎性坏死。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    克罗恩病

消化科经典病历23行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=纳差、上腹肿物感、消瘦1年余#####体温、血压正常范围，明显消瘦，浅表淋巴结无肿大，皮肤黏膜无黄染，无肝掌、蜘蛛痣，心肺听诊无异常，腹软、上腹部有压痛，未见包块，肝脾未触及，腹水征阴性。 现病史:1年前因其姐姐患胃癌后感上腹不适、纳差、进食量逐渐减少，上腹肿物感，唯恐自己患了与姐姐同样的病，夜间入睡差。发病后二便正常，食欲差，睡眠不好，体重减轻7kg。    weight=    assistCheck=血、尿、大便常规检查，肝功能、腹部B超、胸片、心电图及胃肠镜检查均无明显异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    消化不良

消化科经典病历24行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=43    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=130    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=腹痛、恶心、呕吐2天#####心肺未见异常。中上腹压痛、反跳痛，肌稍紧张，肝脾肋下未触及，Murphy 征阴性，肝上界位于右锁骨中线第5 肋间，肝脾肾区无叩痛，移动性浊音阴性，听诊肠鸣音正常，未闻及气过水声及血管杂音。 现病史:患者2天前进食过量油腻食物后出现上腹疼痛，呈持续性胀痛，并向肩、背部放射，前倾位后可稍减轻。伴恶心、呕吐，共3次，为胃内容物，非喷射状。无头晕、头痛、发热、寒战，无返酸、嗳气、呕血，无腹泻、黑便等，予以输液治疗，症状仍无缓解。发病以来，精神差，未进食，大小便正常，体重无明显变化。    weight=    assistCheck=肝功：ALT 90U/L，AST 17U/L，GGT 140U/L，ALP 248U/L，TP 62g/L，Alb 24.1g/L；血常规WBC 16.37×109/L，Hb 101.2g/L，N 0.92；尿淀粉酶2228.7U/L，血淀粉酶687.4U/L；肾功：血钠133.7mmol/L，血磷0.61mmol/L；心电图提示：窦性心动过速。腹部立卧位片未见明显异常。CT提示：胰腺边缘模糊，周围大片状炎性渗出，增强扫描，胰腺强化不均匀。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性胰腺炎

消化科经典病历25行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=57    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=间断上腹隐痛2年#####腹平坦，腹软，剑突下压痛，无反跳痛、肌紧张，肠鸣音正常，余（－）。 现病史:间断上腹隐痛2年#####腹平坦，腹软，剑突下压痛，无反跳痛、肌紧张，肠鸣音正常，余（－）。    weight=    assistCheck=血常规正常。胃镜提示食管下段可见条索状黏膜充血、糜烂，胃黏膜可见散在充血水肿。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性胃炎

消化科经典病历26行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=34    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=上腹饱胀、恶心、呕吐3个月，加重1周#####消瘦、皮肤干燥、脱水，腹部可见胃型及胃蠕动波，无压痛、反跳痛，未触及肿块，可闻及振水音，肠鸣音稍弱，移动性浊音阴性。 现病史:无消化道溃疡病史，呕吐间歇发作，最近1周加重，量大，主要是所进食物，含有胆汁。仅有饱胀感，无明显腹痛，亦不影响食欲，俯卧或胸膝位时，呕吐及饱胀感减轻。    weight=    assistCheck=纤维胃镜检查可见胃及十二指肠扩张，潴留液较多，且有胆汁反流，幽门口开放。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    十二指肠淤积

消化科经典病历27行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=28    ageType=岁    allergyHistory=    bodyTempr=39    familyHistory=
    ...    gender=0    heartRate=88    highBldPress=109    lowBldPress=63    personalHistory=    previousHistory=
    ...    symptom=恶心、呕吐20天，发热、腹胀1周#####神清，精神可。皮肤巩膜无黄染，未及全身浅表淋巴结，颈静脉无充盈，肝颈静脉回流征阴性；心肺查体无异常；腹膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹肌柔韧，有揉面感，无压痛，无反跳痛，全腹未及包块，肝脾未及肿大，移动性浊音（＋），肠鸣音6次/分。双下肢无凹陷性水肿。 现病史:患者20天前出现恶心、呕吐，进食或饮水后几分钟即吐出，无呕血、腹痛、吞咽困难，无视物旋转。1周前出现腹胀，自觉腹围进行性增大，伴发热、盗汗、腹水。无头晕、胸闷、心慌、气喘。患者食欲减退，1周来尿量明显减少，体重下降3kg。    weight=    assistCheck=胸片：正常；血常规：WBC3.0×109/L，N78.2%，RBC3.85×1012/L，Hb93g/L，PLT 336×109/L，尿常规：胆红素2＋，尿蛋白2＋。粪常规正常。生化检查ALT、AST、TB、DB均正常，ALB30.7g/L；凝血三项、心肌酶谱、ANCA正常。CA125340U/ml，AFP、CA724、CA199、CA153均正常，肺癌三项示NSE36.46ng/ml。全腹CT：大量腹水，网膜密度增高，局部胃壁及肠壁稍厚。腹水常规：黄色，浑浊，白细胞计数0.26×109/L，N10.0%，L90.0%，蛋白定性阳性；腹水生化示LDH429U/L，ALB26.8g/L，ADA46.7U/L，腹水CA125433U/ml。PPD试验：阴性。心电图在正常范围。抗心磷脂抗体：12.1RU/ml。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性腹膜炎

消化科经典病历28行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=2    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发热6小时、腹泻1小时伴惊厥1次#####神委思睡，反应较差，面色苍白，皮肤未见大理石花纹；颈阻阴性；双侧瞳孔等大等圆，直径0.2cm，对光反射存在；双肺呼吸音粗；心音低钝，律齐；腹软不胀，肝肋下2.0cm，质软缘锐，四肢肌张力高，手足稍凉，甲床微绀。病理征阴性。肛指检查：见黏液血丝便。 现病史:患者6小时前开始出现发热、畏寒、寒战，神委、思睡，有恶心，无皮疹、咳嗽、呕吐，1小时前出现腹泻稀水样便含少量粪质，可见黏液少许血丝，伴有里急后重；尿量减少；面色差，并突然出现双眼凝视，牙关紧闭，口吐白沫，四肢强直性抽动。病前有可疑不洁饮食史（冰冻西瓜）。    weight=    assistCheck=WBC 19.5 ×10 9/L，N 0.85，L 0.15，Hb 125g/L，PLT 385×10 9/L；大便常规为黏液血丝便，WBC ＋＋＋，RBC ＋，吞噬细胞5～8/HP。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    中毒型细菌性痢疾

消化科经典病历29行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=39.2    familyHistory=
    ...    gender=1    heartRate=98    highBldPress=113    lowBldPress=68    personalHistory=    previousHistory=
    ...    symptom=发热、肝区闷痛3周#####神志清，对答切题，定向力良好，急性病容。皮肤巩膜无黄染，未见肝掌及蜘蛛痣，全身未见出血点。心肺体检未见异常。腹软，无压痛、反跳痛，肝肋下约1.0cm，剑突下2.5cm，质地软，边缘光滑，触痛明显，脾肋下未触及，肝区轻度叩痛，移动性浊音阴性，双下肢无水肿。 现病史:患者近3周来无诱因出现高热、寒战。病后乏力明显，感肝区闷痛。当地曾用环丙沙星等药治疗5天无效就诊。    weight=    assistCheck=血常规：白细胞20.4×109/L，N 0.86。ESR 142mm/1h。腹部B超检查:肝右叶最大径14.7cm，右肝后叶及左肝各有一7.6cm×5.6cm×6.0cm及9.8cm×8.4cm×8.5cm低回声区，边缘不规则，其内回声不匀，有少许不规则液性暗区。肝穿刺液培养有类鼻疽假单胞菌生长。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    细菌性肝脓肿

消化科经典病历30行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=10    ageType=月    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=135    highBldPress=    lowBldPress=    personalHistory=    previousHistory=邻居家中有类似腹泻患儿，该患儿与邻居类似病儿有接触史。
    ...    symptom=发热伴腹泻蛋花水样便2天#####轻度脱水貌，无皮疹，咽部充血，扁桃体无肿大，双肺呼吸音清楚，无干湿啰音，心音有力律齐，胸骨左缘未闻及杂音，腹软不胀，四肢端暖和。 现病史:就诊前2天患儿出现发热，体温37.8～38.5℃，无寒战及抽搐，同时腹泻稀水样便，呈蛋花水样便，一天4～5次，每次量较多，无黏液及脓血，解大便时无坠胀，伴呕吐2次，呕吐物为胃内容物，无胆汁及咖啡色液体，呈非喷射状，无咳嗽及喉喘，无流涕，病后患儿口渴喜饮，哭时泪稍少，尿量稍减少，精神食欲下降。    weight=    assistCheck=大便常规：无白细胞、红细胞及吞噬细胞，仅见脂肪球。大便轮状病毒抗原阳性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    轮状病毒肠炎

消化科经典病历31行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=36.9    familyHistory=
    ...    gender=0    heartRate=    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=间断上腹痛4个月，加重10余天#####皮肤及黏膜无黄染、皮疹及出血点，无肝掌、蜘蛛痣，全身浅表淋巴结未触及肿大。眼睑无水肿，巩膜无黄染，口唇无发绀。双肺呼吸音清，未闻及干湿啰音。腹部平坦，腹软，无压痛及反跳痛，肝脾肋下未触及。双下肢无水肿。 现病史:患者4个月前自觉无明显诱因间断出现上腹痛，多于进食后及平卧时加重，伴有腹胀，有乏力，无反酸胃灼热，无恶心呕吐，无发热。10余天前患者上述症状加重。患者病来精神可，饮食睡眠良好，无发热寒战，二便正常，体重无明显变化。    weight=    assistCheck=上腹部CT平扫：胃窦黏膜下占位；腹、盆部多发肿大淋巴结；脾大；盆腔积液。肺CT平扫：未见异常。胃粘膜病理检查：胃窦肉芽肿样病变。结核抗体弱阳性；结核菌素试验（＋＋）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胃结核

消化科经典病历32行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=无消化道肿瘤及病毒性肝炎家族史。
    ...    gender=1    heartRate=95    highBldPress=110    lowBldPress=70    personalHistory=长期居住于北京，从事机械维修工作，无烟酒嗜好    previousHistory=否认慢性肝胆疾病及结核病史
    ...    symptom=发热伴右上腹胀痛3个月#####体型较瘦，体重指数20.1kg/m2。未见皮肤色素沉着、肝掌、蜘蛛痣。浅表淋巴结无肿大。心肺查体（－）。腹部平软，右上腹压痛，无反跳痛和肌紧张，肝肋下4cm，质地中等，边缘较钝，脾肋下未及，肝脏叩痛（＋），移动性浊音（－），肠鸣音正常。双下肢不肿。 现病史:患者体温最高38.3℃，午后显著，可自行降至正常，伴右上腹钝痛、程度较轻，盗汗明显。无咳嗽、寒颤、恶心、呕吐、黄疸、腹泻、黑便等。食欲可，3个月体重下降6kg。    weight=    assistCheck=肝功能：ALT 95U/L，AST 62 U/L，ALP 355 U/L，GGT 45U/L，Alb 27g/L，TBil 11.6μmol/L，TBA 2.6μmol/L。血常规：Hb 78g/L，WBC、PLT正常。乙肝五项、丙肝抗体、AFP均阴性。PPD阴性。免疫球蛋白：IgG 32.7g/L，余（－），未见M蛋白。腹部平片：肝脏内少许钙化灶。肝穿刺：在超声引导下穿刺右肝病灶，病理回报见干酪样肉芽肿，抗酸染色（＋）可见结核杆菌。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝结核

消化科经典病历33行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=未到过牧区，家中养狗，未食过生鱼。    previousHistory=
    ...    symptom=反复发热、腹痛半年#####肝肋下未触及，剑下4cm、无压痛，脾不大。 现病史:患者半年来反复发热、腹痛，近1个月加重。体温时达39℃，腹痛多为隐痛、有时剧痛伴恶心、呕吐，皮肤出现荨麻疹。    weight=    assistCheck=血常规：嗜酸性粒细胞占0.14、嗜酸性粒细胞计数2464×10 6/L。B超及CT检查提示肝占位病变。AFP、GPT、γ‐GT 等均正常，便虫卵3次检查（－）。骨髓涂片中粒：嗜酸细胞2.8：1，但后者各阶段比值、细胞形态正常。心电图正常。结肠镜检示粘膜慢性炎症，活检未见嗜酸粒细胞浸润。胃镜：胃粘膜充血、水肿，镜检有淋巴细胞、浆细胞及嗜酸粒细胞浸润。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    嗜酸细胞性胃肠炎

消化科经典病历34行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=61    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=94    highBldPress=124    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=上腹胀痛2周#####神志清楚，急性病容，精神欠佳。腹部平软，上腹部有压痛，无反跳痛。 现病史:2周前空腹食用柿子后出现上腹胀痛，伴恶心、嗳气，在家自服助消化药，症状无明显缓解，2天前开始解黑色糊状便。    weight=    assistCheck=血生化：ALT 55IU/L，AST 40IU/L，TP 72g/L，TBIL 141μmol/L，Cr 107μmol/L。血常规示：Hb 100g/L，RBC 3×1012/L，WBC11×109/L。大便隐血试验（+++）。心电图示窦性心律，正常范围。胃镜检查示胃内有单个3.5cm×5.5cm，卵圆形胃石，表面较光滑，呈黄红褐色，胃角处有溃疡，创面糜烂，溃疡病理活检为良性，行14C尿素呼气试验示幽门螺杆菌（Hp）感染阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胃结石

消化科经典病历35行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=57    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=父亲：结肠癌
    ...    gender=0    heartRate=72    highBldPress=128    lowBldPress=82    personalHistory=    previousHistory=失眠5年。4个月前钡灌肠无明显异常。高血压病史5年。
    ...    symptom=便秘10年，加重伴左下腹痛6个月#####营养状况可，焦虑状态。浅表淋巴结未及。心、肺无异常。腹部平软，全腹无压痛、反跳痛和肌紧张，肝脾肋下未及，未及腹部包块，肠鸣音4次/分，无减弱。肛门直肠指诊：可及内痔2枚，未及直肠肿物，肛门括约肌紧张度可，缩肛有力，用力排便时肛门括约肌不能松弛。 现病史:患者便秘源于10年前与丈夫吵架后，多年来因为家庭琐事夫妻关系不融洽，心情不悦。排便4～5日1次，缺乏便意，粪便呈干球状，排便费力，每次排便需要30分钟以上，使用过麻仁润肠胶囊、排毒养颜胶囊等，初用有效，经常使用开塞露刺激排便，排便不尽感明显，致使排便后反复如厕但并无粪便排出。近6个月症状加重，需服用酚酞方可排便，伴左下腹痛，排便前明显，排便后缓解，无明显便血，粪便无变扁、切迹。无消瘦。    weight=    assistCheck=便潜血试验阳性。血常规、肝肾功能和电解质正常。血CEA正常。结肠镜：发现结肠黑变病；乙状结肠距肛门30cm处有直径2cm亚蒂息肉，表面发红，电烧切除；有内痔。息肉病理为绒毛状腺管状腺瘤。动力功能检查①胃肠传输试验：48小时排出40%标志物，残留标志物主要位于直肠；②肛门直肠测压：直肠感觉阈值增高，直肠推进力减弱，存在不协调收缩。心理评估提示其存在明显抑郁和焦虑。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    功能性便秘

消化科经典病历36行-1
    [Documentation]    断言:"慢性胃炎"
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=72    highBldPress=145    lowBldPress=85    personalHistory=吸烟10余年，约10支/天，饮酒10余年    previousHistory=
    ...    symptom=上腹痛3个月余#####腹部膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹软，全腹无压痛、无反跳痛，肝、脾肋下未触及，墨菲征(-)，肝区叩痛(-)，移动性浊音(-)，肠鸣音正常。 现病史:上腹痛3个月余#####腹部膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹软，全腹无压痛、无反跳痛，肝、脾肋下未触及，墨菲征(-)，肝区叩痛(-)，移动性浊音(-)，肠鸣音正常。    weight=    assistCheck=钡餐：胃炎、胃窦明显。CEA 6.85ng/ml(参考值0～5ng/ml)，CA724 13.58U/ ml(参考值0～6.9U/ml)。幽门螺杆菌染色(++)。血常规、肝肾功、乙肝五项未见明显异常。胃镜：糜烂性胃炎、十二指肠球炎。胃肠镜病理：(胃窦)慢性浅表性胃炎(中度)，伴急性活动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性胃炎

消化科经典病历36行-2
    [Documentation]    断言:"十二指肠球炎"
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=72    highBldPress=145    lowBldPress=85    personalHistory=吸烟10余年，约10支/天，饮酒10余年    previousHistory=
    ...    symptom=上腹痛3个月余#####腹部膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹软，全腹无压痛、无反跳痛，肝、脾肋下未触及，墨菲征(-)，肝区叩痛(-)，移动性浊音(-)，肠鸣音正常。 现病史:上腹痛3个月余#####腹部膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹软，全腹无压痛、无反跳痛，肝、脾肋下未触及，墨菲征(-)，肝区叩痛(-)，移动性浊音(-)，肠鸣音正常。    weight=    assistCheck=钡餐：胃炎、胃窦明显。CEA 6.85ng/ml(参考值0～5ng/ml)，CA724 13.58U/ ml(参考值0～6.9U/ml)。幽门螺杆菌染色(++)。血常规、肝肾功、乙肝五项未见明显异常。胃镜：糜烂性胃炎、十二指肠球炎。胃肠镜病理：(胃窦)慢性浅表性胃炎(中度)，伴急性活动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    十二指肠球炎

消化科经典病历37行-1
    [Documentation]    断言:"结肠癌"
    ${getRes}    智能诊断3.0    age=79    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=否认结核病史及接触史，不喝生牛奶，无高血压、高血脂、冠心病等慢性疾病。
    ...    symptom=间断黑便3个月#####消瘦，贫血貌，浅表淋巴结未及肿大。心、肺查体正常。腹部平软，全腹无包块，无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音，未及血管杂音。肛诊结果未见异常，指套退出无染血。 现病史:患者半年来一直乏力、头晕，3个月前查体发现贫血，未诊治。间断黑便3个月，为黑色成形或糊状便，大便与粪质混合，冲水后呈黑红色，每天1～2次，量约200 ml/d，排便前后无明显不适。既往排便1天1次，均为成形黄便。近半年体重下降6kg，纳差、乏力明显，无低热、盗汗。    weight=    assistCheck=便潜血试验阳性。血常规：WBC 6.99×109/L，N 0.75，HGB 74g/L，PLT 144×109/L；肝肾功能和电解质正常，Alb 32.4g/L。CEA 457 U/L。结肠镜：直肠息肉。升结肠近肝曲可见1枚巨大隆起病变，约3cm×2cm大小，占据管腔1/3，无蒂，表面黏膜充血、糜烂，触之易出血，活检质脆。周围可见多枚小息肉。活检病理：绒毛状腺瘤，部分癌变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    结肠癌

消化科经典病历37行-2
    [Documentation]    断言:"贫血"
    ${getRes}    智能诊断3.0    age=79    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=否认结核病史及接触史，不喝生牛奶，无高血压、高血脂、冠心病等慢性疾病。
    ...    symptom=间断黑便3个月#####消瘦，贫血貌，浅表淋巴结未及肿大。心、肺查体正常。腹部平软，全腹无包块，无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音，未及血管杂音。肛诊结果未见异常，指套退出无染血。 现病史:患者半年来一直乏力、头晕，3个月前查体发现贫血，未诊治。间断黑便3个月，为黑色成形或糊状便，大便与粪质混合，冲水后呈黑红色，每天1～2次，量约200 ml/d，排便前后无明显不适。既往排便1天1次，均为成形黄便。近半年体重下降6kg，纳差、乏力明显，无低热、盗汗。    weight=    assistCheck=便潜血试验阳性。血常规：WBC 6.99×109/L，N 0.75，HGB 74g/L，PLT 144×109/L；肝肾功能和电解质正常，Alb 32.4g/L。CEA 457 U/L。结肠镜：直肠息肉。升结肠近肝曲可见1枚巨大隆起病变，约3cm×2cm大小，占据管腔1/3，无蒂，表面黏膜充血、糜烂，触之易出血，活检质脆。周围可见多枚小息肉。活检病理：绒毛状腺瘤，部分癌变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    贫血

消化科经典病历38行-1
    [Documentation]    断言:"肝脓肿"
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=104    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=胆囊炎切除手术10余年，3个月前因胆总管结石行ERCP术，无输血史。
    ...    symptom=腹痛、发热1周，加重3天#####腹部正中可见一纵行手术疤痕，大约14cm。腹部平坦，未见胃肠型及蠕动波，腹软，右上腹压痛明显，无反跳痛，未触及包块及胆囊，Murphy征（-），肝脾肋下未触及，移动性浊音（-），肝区叩痛明显，肠鸣音4次/分。肛门、直肠、外生殖器未见异常。 现病史:患者于1周前无明显诱因出现右上腹疼痛，呈持续性胀痛，时轻时重，右侧肩部酸痛，伴发热、纳差，无胸痛，无畏寒、盗汗。在当地诊所治疗效果不佳。近3日感觉腹痛加重、周身乏力，伴寒战、高热，体温最高达39℃，多为午后发作。无咳嗽、咳痰及喘憋，无咯血，无胸疼，无头疼及头晕，无胸闷、心悸及呼吸困难，无反酸嗳气，时有恶心，无呕吐，无尿频、尿急、尿痛，无肉眼血尿。无关节疼痛及光过敏，无脱发、皮疹、牙龈出血，无腰部疼痛不适，为求诊治入院。自发病来，神志清，精神不振，饮食不佳，体重无明显改变。    weight=    assistCheck=血常规：WBC 12.9×109/L，NEUT% 81.24%。肝功：ALT 366U/L，AST 186U/L，GGT 332U/L。腹部CT：肝右叶类圆形囊性低密度，肝内胆管结石，胆管扩张。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝脓肿

消化科经典病历38行-2
    [Documentation]    断言:"肝内胆管结石"
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=104    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=胆囊炎切除手术10余年，3个月前因胆总管结石行ERCP术，无输血史。
    ...    symptom=腹痛、发热1周，加重3天#####腹部正中可见一纵行手术疤痕，大约14cm。腹部平坦，未见胃肠型及蠕动波，腹软，右上腹压痛明显，无反跳痛，未触及包块及胆囊，Murphy征（-），肝脾肋下未触及，移动性浊音（-），肝区叩痛明显，肠鸣音4次/分。肛门、直肠、外生殖器未见异常。 现病史:患者于1周前无明显诱因出现右上腹疼痛，呈持续性胀痛，时轻时重，右侧肩部酸痛，伴发热、纳差，无胸痛，无畏寒、盗汗。在当地诊所治疗效果不佳。近3日感觉腹痛加重、周身乏力，伴寒战、高热，体温最高达39℃，多为午后发作。无咳嗽、咳痰及喘憋，无咯血，无胸疼，无头疼及头晕，无胸闷、心悸及呼吸困难，无反酸嗳气，时有恶心，无呕吐，无尿频、尿急、尿痛，无肉眼血尿。无关节疼痛及光过敏，无脱发、皮疹、牙龈出血，无腰部疼痛不适，为求诊治入院。自发病来，神志清，精神不振，饮食不佳，体重无明显改变。    weight=    assistCheck=血常规：WBC 12.9×109/L，NEUT% 81.24%。肝功：ALT 366U/L，AST 186U/L，GGT 332U/L。腹部CT：肝右叶类圆形囊性低密度，肝内胆管结石，胆管扩张。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝内胆管结石

消化科经典病历39行-1
    [Documentation]    断言:"原发性肝癌"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往有“慢性乙型肝炎”病史20余年，“肝硬化病史”4年。否认烟酒嗜好，否认外伤手术史，否认输血史，无家族遗传病史。
    ...    symptom=乏力、纳差、肝区隐痛一月余#####神志清，精神软，慢性肝病面容，皮肤巩膜轻度黄染，可见肝掌，前胸可见蜘蛛痣，扑翼样震颤未引出，全身未见瘀点瘀斑。心肺听诊无殊。腹隆，软，无压痛，反跳痛，肝肋下未及，肝区扣痛（＋），脾肋下2指，移动性浊音（＋），双下肢轻度水肿。 现病史:患者一月前无明显诱因下出现四肢酸软无力，胃纳下降，右上腹隐痛不适。一月来明显消瘦，体重下降5kg左右。    weight=    assistCheck=肿瘤标志物 AFP＞1000U/L，CA199 45U/L。肝功能 TBil 375μmol/L，Dbil 15μmol/L，ALB 27g/L，ALT72U/L，AST 48U/L，GGT93U/L，AKP105U/L。乙肝五项提示大三阳、HBV‐DNA 1×106copy/ml，抗HAV IgM（－），抗HCV（－），抗HDV（－），抗HEV IgM（－）。上腹部增强CT提示肝右叶占位性病变    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原发性肝癌

消化科经典病历39行-2
    [Documentation]    断言:"肝硬化失代偿期"
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往有“慢性乙型肝炎”病史20余年，“肝硬化病史”4年。否认烟酒嗜好，否认外伤手术史，否认输血史，无家族遗传病史。
    ...    symptom=乏力、纳差、肝区隐痛一月余#####神志清，精神软，慢性肝病面容，皮肤巩膜轻度黄染，可见肝掌，前胸可见蜘蛛痣，扑翼样震颤未引出，全身未见瘀点瘀斑。心肺听诊无殊。腹隆，软，无压痛，反跳痛，肝肋下未及，肝区扣痛（＋），脾肋下2指，移动性浊音（＋），双下肢轻度水肿。 现病史:患者一月前无明显诱因下出现四肢酸软无力，胃纳下降，右上腹隐痛不适。一月来明显消瘦，体重下降5kg左右。    weight=    assistCheck=肿瘤标志物 AFP＞1000U/L，CA199 45U/L。肝功能 TBil 375μmol/L，Dbil 15μmol/L，ALB 27g/L，ALT72U/L，AST 48U/L，GGT93U/L，AKP105U/L。乙肝五项提示大三阳、HBV‐DNA 1×106copy/ml，抗HAV IgM（－），抗HCV（－），抗HDV（－），抗HEV IgM（－）。上腹部增强CT提示肝右叶占位性病变    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝硬化失代偿期

消化科经典病历40行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=47    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=母亲死于肺癌，父亲健在，否认家族遗传病及传染病史。
    ...    gender=1    heartRate=80    highBldPress=130    lowBldPress=87    personalHistory=生活规律，吸烟30年，20支/天，饮酒30余年，500ml/天。    previousHistory=
    ...    symptom=吞咽困难进行性加重2个月#####未见异常 现病史:2月余前无明显诱因出现吞咽困难，不伴恶心呕吐，自述于当地医院行钡餐检查未见异常，给予输液治疗，未见好转，后吞咽困难呈进行性加重，渐出现饮水呛咳。患者自发病以来，饮食以流质饮食为主，睡眠可，大小便正常，体重较前没有明显变化。    weight=65    assistCheck=胃镜检查：食管进镜约18cm见一隆起性肿物阻塞管腔，致管腔狭窄，阻力明显，镜身未能通过。诊断：食管上段占位。胸部CT：①食管上端及中段占位性病变②右侧颌下淋巴结肿大；③右中叶、左下肺炎。上消化道造影：食管中下段可见黏膜破坏、中断，管壁僵硬，管腔狭窄，病灶长约3个椎体高度，钡剂通过受阻，贲门未见异常。胃内可见潴留液及食物残留，胃黏膜显示欠佳。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    食管癌

消化科经典病历41行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=35.5    familyHistory=
    ...    gender=1    heartRate=72    highBldPress=110    lowBldPress=70    personalHistory=否认近期用药史。患者为政府官员，由于工作关系长期大量饮酒，近10年来平均每日饮高度白酒300g。不吸烟。    previousHistory=既往否认慢性肝病史。
    ...    symptom=右上腹胀痛3个月，黄疸2周#####神志清楚，计算力、定向力和记忆力正常。体型偏瘦，体重指数21.6kg/m2。未见皮肤色素沉着、肝掌、蜘蛛痣、扑翼样震颤。浅表淋巴结无肿大。心肺查体（－）。腹部平软，全腹无压痛、反跳痛和肌紧张，肝肋下2c m，质软，边缘较钝，压痛（＋），脾肋下未及。移动性浊音（－），肠鸣音正常。双下肢不肿。 现病史:患者右上腹轻度胀痛，劳累后比较明显。黄疸此前未曾发现，感乏力，纳差，有低热，体温最高38℃，不伴畏寒、寒战。无瘙痒、呕吐、腹泻、黑便等。近3个月来腹痛性质和程度没有变化。    weight=    assistCheck=血常规：WBC 10﹒9 ×109/L，N 0﹒76，H GB 124g/L，MCV 116fl，PL T 344 ×109/L。肝功能：AL T 125 U/L（参考范围5～40 U/L），AST 388 U/L（参考范围5～37U/L），ALP 145 U/L（参考范围30～120 U/L），GGT 415 U/L（参考范围10～67 U/L），Alb 42g/L（参考范围35～51g/L），TBil 72﹒6μmol/L（参考范围5.1～22.2μmol/L），DBil 40﹒1μmol/L（参考范围0～8.6μmol/L）。PT：18﹒7秒，INR 1﹒6。超声：肝大，肝脏弥漫性回声增强，形态尚可。肝脏血管、胆管、胆囊及胰腺未见异常。乙肝五项及丙肝抗体均（－）。Ⅳ型胶原和大便常规/潜血均（－）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    酒精性肝炎

消化科经典病历42行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=36    ageType=天    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=频繁喷射样呕吐3周，渐加重#####一般情况尚可，哭有力，轻度营养不良及脱水貌，上腹可见明显胃型及蠕动波，右上腹可及包块，长型，1.5cm×2.0cm，活动，无触痛，肠鸣音正常。 现病史:足月顺产，出生体重3100克，孕末无异常，生后喂养胎便排出正常，生后16天始呕吐，喷射样，量多，胃内容物，无黄绿色液体，吐后食欲好，近一周尿便渐少，体重下降约300克，对症处理症状无改善。    weight=    assistCheck=腹部平片可见胃泡增大，腹部生理含气少。B超胃壁增厚，幽门管延长，幽门腔明显狭窄，幽门环肌厚3.8mm，胃蠕动较强。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性肥大性幽门狭窄

消化科经典病历43行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=38.7    familyHistory=
    ...    gender=1    heartRate=102    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=呕吐3天，发热1天#####患儿神志清楚，精神委靡，腹软，无压痛、反跳痛。 现病史:患儿三天前无明显诱因下出现呕吐，为胃内容物，非喷射性，4～5次/日，无腹痛、呕血、黑便。一天前患儿发热，体温最高达39℃，无寒战。    weight=    assistCheck=血常规：WBC：24.4×109/L，N：53.1%。CRP28g/L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    感染性胃炎

消化科经典病历44行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=82    highBldPress=120    lowBldPress=84    personalHistory=    previousHistory=患者既往体健，无肠道寄生虫病史，否认有特殊食物、药物过敏史。
    ...    symptom=间断性腹痛1个月余#####一般状况良好，体型瘦长，全身皮肤无黄染，未见皮疹及出血点，无肝掌、蜘蛛痣。巩膜无黄染，心肺无异常。腹平坦，无腹壁静脉曲张，腹部柔软，剑突下压之有轻微不适，无明显压痛、反跳痛，腹部无包块。肝脾肋下未触及，Murphy征阴性，肾区无叩击痛，移动性浊音可疑(+)。肠鸣音未见异常，4次/分。 现病史:患者1个月前无明显诱因出现中上腹疼痛，以隐痛、胀痛为主，呈阵发性发作，疼痛难忍，偶有剧烈腹痛伴恶心、呕吐。发作间期无明显腹部症状。大便次数增多，每日3～5次，不成形，自述呕吐物及粪便多为“墨绿色”。无畏寒、发热、盗汗，无咳嗽、咳痰。给予口服质子泵抑制剂等治疗，效差。患者发病以来食欲食量、精神状态、体力情况均较差，体重下降10kg，小便无异常。    weight=    assistCheck=肝肾功能:总胆红素17.7μmol/L，结合胆红素8.6μmol/L，白蛋白45g/L，丙氨酸转氨酶29U/L，碱性磷酸酶60U/L，天冬氨酸转氨酶26U/L，肌酐100μmol/L，尿素4.8mmol/L。血常规:白细胞22.79×109/L，中性粒细胞9.9%，嗜酸性粒细胞的比例高达72.5%，;血小板303×109/L，血红蛋白170g/L。尿常规正常。粪常规:潜血阴性，虫卵阴性，红细胞、白细胞阴性。血糖类抗原CA19-9 7.08U/m l，癌胚抗原0.83μg/L。心电图提示窦性心律。胸片正常。腹部B超提示少量腹水，肝胆胰脾肾均未见异常。上腹部CT提示少量腹水，胃窦部改变。胃镜提示:糜烂性胃炎(轻度)，十二指肠降部多发浅溃疡；病理回报:中～大量嗜酸性粒细胞浸润，累及黏膜和黏膜下层。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    嗜酸细胞性胃肠炎

消化科经典病历45行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=14    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=学生    previousHistory=
    ...    symptom=体检发现胆红素升高1年#####生命体征平稳，全身皮肤、巩膜轻度黄染，腹部查体未见明显异常。 现病史:患者1年前体检中发现胆红素升高，无任何不适症状，就诊于当地医院，化验肝炎系列均阴性，B超提示肝胆胰脾均正常。给予保肝治疗后胆红素可下降，但停药后又升高，最高达72μmol/L，为求进一步诊治就诊。    weight=    assistCheck=肝功能示总胆红素59μmol/L，直接胆红素12μmol/L，间接胆红素47μmol/L。低热卡及苯巴比妥试验阳性。病毒及自身免疫性肝病系列均阴性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    吉尔伯特综合征

消化科经典病历46行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=电脑工程师    previousHistory=
    ...    symptom=皮肤巩膜黄染5年#####皮肤巩膜中度黄染，无肝掌及蜘蛛痣，腹软，肝脾未触及。 现病史:患者于5年前因患阑尾炎行阑尾切除手术，术后患者一般情况好，精神及食纳正常。术后复查肝功能时发现胆红素增高，无恶心、呕吐、皮肤瘙痒及白陶土样大便。    weight=    assistCheck=尿常规：尿胆红素阳性，尿胆原阳性。乙肝、丙肝病毒阴性，转氨酶正常，总胆红素112μmol/L，直接胆红素100μmol/L，间接胆红素12μmol/L。低热卡试验阴性，苯巴比妥试验阴性。腹部B超未见异常。静脉胆囊造影未见异常。胃镜检查：无异常。肝活检：未见异常。免疫组化证实：MRP2 抗体染色阳性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    罗托综合征

消化科经典病历47行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=平素健康
    ...    symptom=发现肝功能异常1个月#####步入病房，一般状态佳，神志清楚，查体合作。皮肤及巩膜无黄染，前胸可见2枚蜘蛛痣。浅表淋巴结未触及肿大。双肺呼吸音清，未闻及干湿性啰音。心音有力，心率70次/分，节律齐，各瓣膜听诊区未闻及病理性杂音。腹软，无压痛无反跳痛，肝脾肋下未触及，肝区无叩痛，移动性浊音阴性，双下肢无水肿。未见肝掌。 现病史:患者一个月前健康体检时发现肝功能轻度异常，自觉无任何不适，无发热，无恶心呕吐，无厌油食，无腹痛、腹泻、腹胀，无尿色加深。无咳嗽咳痰，无鼻衄及齿龈出血，无皮疹及关节肿痛，无皮肤瘙痒及灰白便。无尿频、尿急、尿痛，饮食及睡眠可。二便正常。    weight=    assistCheck=ALT429IU/L，AST176.9IU/L，ALP464IU/L，GGT391IU/L，TBIL16.1μmol/L，ESR63mm/h，胆固醇10.13mmol/L。甲、乙、丙、戊型肝炎病毒血清学指标均为阴性。抗线粒体抗体（AMA）阳性。肝穿刺病理报告：肝小叶结构存在，部分汇管区小胆管缺如，有类上皮样细胞，少量淋巴、嗜酸粒细胞浸润，窦间隙见淋巴细胞浸润。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原发性胆汁性肝硬变

消化科经典病历48行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=49    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=反复腹泻、便秘交替1年#####消瘦，贫血貌，右耻区压痛，局部可触及3cm×5cm包块 现病史:反复腹泻、便秘交替1年#####消瘦，贫血貌，右耻区压痛，局部可触及3cm×5cm包块    weight=    assistCheck=Hb76g/L，ESR66mm/h，便WBC（+）。X线钡餐透视示回盲部狭窄，钡剂充盈缺损。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性阿米巴痢疾

消化科经典病历49行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=120    lowBldPress=78    personalHistory=平素从事农田劳动，有直接饮用河水和井水的习惯，喜欢生食黄瓜、番茄及其他水果。    previousHistory=
    ...    symptom=腹痛、腹泻15天，发热3天#####心、肺（-）。腹平软，无腹壁静脉曲张，无胃肠型、蠕动波，腹部无包块，右下腹压痛明显，无反跳痛及肌紧张，墨菲征阴性，肝、脾肋下未触及，肝、脾、双肾区无叩痛，移动性浊音阴性，肠鸣音正常。 现病史:患者15天前无明显诱因出现右下腹隐痛，呈间断性发作，无放射痛，同时出现腹泻，大便呈黄色稀糊状，无脓血，每天5-6次，里急后重不明显。自服抗生素治疗3天，仍腹痛，且腹泻加重，大便为血性黏液样，呈暗红色果酱样，量较前增多，有腥臭味。给予补液、抗生素等治疗，病情无好转。3天前开始低热，体温波动在37-38℃，无盗汗、畏寒、头痛，无咳嗽、咳痰、咯血等。    weight=    assistCheck=血常规：WBC 1.2×109/L，N74%，L 26%，RBC 4.5×1012/L，HGB 145g/L，PLT 278×109/L。肝、肾功能正常。尿常规正常。大便常规：暗红色、果酱样，味腥臭，WBC10-15/HP，RBC满视野，少量夏科-雷登结晶。腹部B超：肝、胆、脾、胰均正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性阿米巴痢疾

消化科经典病历50行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=6    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=轻咳3周，间歇性痰中带血2次伴发热1天#####肝大右肋下1cm，剑突下3cm 现病史:1年前因轻咳3周，间歇性痰中带血2次伴发热1天，X线胸片发现右肺上叶中带密度增高阴影，OT试验阴性，先后给予抗生素、抗结核治疗，病情无好转。    weight=    assistCheck=肝B超检查：肝右后叶见2.5cm×4.9cm的囊性包块，肝包虫抗原皮内试验呈阳性。X线胸片发现右肺上叶后段不规则块状病变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺棘球蚴病

消化科经典病历51行-1
    [Documentation]    断言:"胃内异物"
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往无腹部手术史、外伤史、腹部感染史。
    ...    symptom=间断腹痛伴呕吐1个月，加重1周#####脱水貌，腹稍膨隆，右下腹可见肠型，压痛（−），反跳痛（−），肌紧张（−），未及包块，右下腹肠鸣音亢进。 现病史:为右下腹痛，阵发性；腹痛后即出现呕吐，近一周腹痛加重，呕吐频繁；停止排气排便3天，无发热；无大量食柿子、黑枣病史，家里小吸铁石有数枚失踪。    weight=    assistCheck=X线：胃内偏右水平短条形高密度影，大小约0.5cm × 1.2cm，怀疑是金属异物。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胃内异物

消化科经典病历51行-2
    [Documentation]    断言:"肠梗阻"
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往无腹部手术史、外伤史、腹部感染史。
    ...    symptom=间断腹痛伴呕吐1个月，加重1周#####脱水貌，腹稍膨隆，右下腹可见肠型，压痛（−），反跳痛（−），肌紧张（−），未及包块，右下腹肠鸣音亢进。 现病史:为右下腹痛，阵发性；腹痛后即出现呕吐，近一周腹痛加重，呕吐频繁；停止排气排便3天，无发热；无大量食柿子、黑枣病史，家里小吸铁石有数枚失踪。    weight=    assistCheck=X线：胃内偏右水平短条形高密度影，大小约0.5cm × 1.2cm，怀疑是金属异物。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肠梗阻

消化科经典病历52行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=38.8    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往体健
    ...    symptom=腹泻、腹泻2天#####腹软，下腹部轻压痛，无反跳痛，听诊肠鸣音亢进。 现病史:患者2天前进食可疑不洁食物后出现阵发性下腹绞痛、腹泻、恶心、呕吐，排便后腹痛可缓解，大便每日8～10次，为糊状或稀水状，伴有黏液，无里急后重等。    weight=    assistCheck=血常规：WBC 13.4×109/L，NEUT% 87.6%；大便化验显示：白细胞8～10/Hp，红细胞3～5/Hp，未见吞噬细胞。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    感染性腹泻

消化科经典病历53行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=工人    previousHistory=10年前因“感冒”在某医院查HBV为“大三阳”，肝功能正常，服中药治疗。其后多次复查肝功能轻度异常。
    ...    symptom=反复乏力、腹胀2年，加重伴黄疸10天#####慢性病容，中度黄疸，有肝掌及蜘蛛痣。心肺无异常发现。腹平软，肝肋下2cm，剑下3cm，质中等，表面光滑，边缘锐利；脾脏肋下3cm，质中等。 现病史:2年前出现乏力、进食后腹胀，肝功能显示ALT 轻度升高，用中、西药治疗3个月后肝功能恢复正常。入院前10天因劳累后出现食欲明显减退、腹胀、恶心、牙龈出血及皮肤巩膜黄疸。经口服复方益肝灵、肌苷、复合维生素B，静脉输入葡萄糖溶液等，2周后病情无缓解，并有痔疮出血。    weight=    assistCheck=肝功TB 204﹒6μmol／L，DB 121﹒3μmol／L，ALT 321U／L，AST 123U／L，A 35g／L，G 34g／L，γ‐球蛋白26%，凝血酶原活动度（PTA）45%，血小板86 ×109／L。B 超显示肝脏体积增大，肝右叶斜径15.5cm，肝实质回声增强、增粗，门静脉横径1.1cm，脾脏厚度6cm，长13cm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    重症肝炎

消化科经典病历54行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=73    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=无烟酒及其他不良嗜好。    previousHistory=
    ...    symptom=腹痛、腹胀2个月#####神志清楚，皮肤、巩膜无黄染，心肺未见特殊阳性体征，腹膨隆，无压痛，无反跳痛，移动性浊音阳性，肠鸣音4次／分。 现病史:患者2个月前无明显诱因出现腹痛、腹胀不适，伴尿少，尿黄。无畏寒、发热、头痛、头昏、胸痛、咳嗽、气促、腹痛、腹泻、便秘、便血、血尿、呕血、黑便、恶心、呕吐、厌油、皮肤巩膜黄染、心慌气急、呼吸困难、意识障碍等症状。未治疗。患者腹胀症状进行性加重，伴精神食欲下降，进食后腹胀加重。当地治疗症状无明显缓解。发病以来，精神、睡眠、食欲欠佳，小便正常，大便3～4天一次。体重下降约8kg。    weight=    assistCheck=ALT 145U／L，AST 153U／L，GGT 265U／L，Alb 35U／L，血清5′‐核苷酸酶19U／L。肾功示：血钠测定134.3mmol／L，血尿素测定2.30mmol／L，血糖测定6.91mmol／L。肿瘤标志物CA19‐9 800U／ml，CEA 20U／ml。腹水生化示：腺苷酸脱氨酶17.12U／L 总蛋白37.53g／L。腹水常规示：血性腹水，胸腹水李凡它试验阳性。腹水淀粉酶500U／L，凝血四项：APTT 41﹒7秒，Fib 5﹒55g／L，TT 13﹒8秒。CT 示①胰腺改变，性质待定②腹腔系膜增厚③腹水    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胰腺癌

消化科经典病历55行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=57    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=89    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=高血压病史1年余，长期服用“阿司匹林及硝酸异山梨酯”治疗；心悸1年余，间断服用“普罗帕酮”，否认糖尿病、冠心病等慢性病病史；否认肝炎、结核病史；否认药物过敏史。
    ...    symptom=左下腹痛3个月余，腹泻伴腰背痛2个月余#####皮肤黏膜无色素沉着，结膜无苍白，巩膜无黄染，浅表淋巴结未触及肿大，双肺呼吸音清，心律齐，未闻及杂音，腹软，无压痛，未触及包块，肠鸣音4次/分，双下肢不肿。 现病史:患者3个月余前无明显诱因出现左下腹痛，为阵发性绞痛，多于夜间发作，持续数十分钟后自行缓解，无放射痛，无腹胀、腹泻、里急后重，无便血、黑便等不适，当时未诊治，此后疼痛反复发作，2个月前给予中药通便治疗后出现腹泻，为黄色稀水样便，含大量不消化食物，每天10余次，每次量约100～200ml，禁食后腹泻可明显缓解，便中未见黏液、脓血，伴腹部两侧钝痛，放射至腰背部，腹泻后疼痛加重，但尚可忍受，持续数小时后可自行缓解，1个月前予补液、补钾、止泻及调节肠道菌群等治疗后腹泻次数较前减少，约3～4次/日，为黄色稀糊样便，每次量约300～400ml，但腹痛较前加重，为进一步诊治至我院门诊就诊，近期体重下降约15kg。    weight=    assistCheck=血常规示白细胞8.47×109/L，中性粒细胞62.5%，血红蛋白150g/L，血小板259×109/L。尿常规大致正常。便常规示黄色糊状便，潜血阴性，脂肪球和虫卵阴性。便细菌培养阴性。便涂片找真菌可见真菌孢子，涂片未见结核杆菌。菌群分析示革兰阴性杆菌50%，阳性杆菌45%，真菌孢子5%。生化示ALT 41U/L，AST 77U/L，TBIL及DBIL正常，TP 50.4g/L，Alb 31.5g/L，TBA 43.2μmol/L，GGT 55U/L，ALP 93U/L，BUN 8.03mmol/L，Cr 96mmol/L，Glu 8.24mmol/L，Amy 142U/L，血钾2.57mmol/L，凝血大致正常。CA19-9 322.9ng/ml，CA125 6.9ng/ml，CA153 10.2ng/ml，AFP 3.5ng/ml，CEA 3.4ng/ml。腹部增强CT示胰头体积增大，其内见一类圆形稍低密度灶，边界欠清，增强扫描各期强化程度均低于胰腺组织，大小约1.7cm×1.2cm，肠系膜上动脉被包绕，胆总管下段可疑受累。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胰腺癌

消化科经典病历56行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发热、腹痛16小时#####腹平坦，软。无肌卫、肌紧张；右下腹深压痛。肠鸣音4次/分，无高调肠鸣音，无气过水声。 现病史:16个小时前，无诱因出现发热、腹痛，腹痛有时重、有时轻，腹痛喜按。不吐，最高体温38.6℃。排便一次，干。    weight=    assistCheck=血常规：WBC：14×109/L，中性：72%，淋巴：27%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肠系膜淋巴结炎

消化科经典病历57行-1
    [Documentation]    断言:"肝功能不全"
    ${getRes}    智能诊断3.0    age=    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=平时酗酒明显，1年前诊断为酒精性肝硬化
    ...    symptom=腰痛5个月，肉眼血尿1次#####慢性病容，皮肤巩膜明显黄染，未见出血点及蜘蛛痣，肝掌（－），肝脾肋下未及 现病史:近5个月来渐出现腰痛，间有尿色发深，伴午后潮热，无咳嗽咳痰，无胸闷、气促、水肿，入院前1天出现明显肉眼血尿。    weight=50    assistCheck=肝功能：ALT68U／L，AST 72U／L，肾功能正常。病毒学检查示：甲、乙、丙、戊肝炎病毒为阴性。尿液中检查到抗酸杆菌阳性。B超示：弥漫性肝损伤。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肝功能不全

消化科经典病历57行-2
    [Documentation]    断言:"肾结核"
    ${getRes}    智能诊断3.0    age=    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=平时酗酒明显，1年前诊断为酒精性肝硬化
    ...    symptom=腰痛5个月，肉眼血尿1次#####慢性病容，皮肤巩膜明显黄染，未见出血点及蜘蛛痣，肝掌（－），肝脾肋下未及 现病史:近5个月来渐出现腰痛，间有尿色发深，伴午后潮热，无咳嗽咳痰，无胸闷、气促、水肿，入院前1天出现明显肉眼血尿。    weight=50    assistCheck=肝功能：ALT68U／L，AST 72U／L，肾功能正常。病毒学检查示：甲、乙、丙、戊肝炎病毒为阴性。尿液中检查到抗酸杆菌阳性。B超示：弥漫性肝损伤。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肾结核

消化科经典病历58行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=家族中否认类似疾病史
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=无输血史，无结核、血吸虫病史，无长期嗜酒史，无毒物接触史，很少使用药物。
    ...    symptom=反复皮肤及巩膜黄染、尿黄40余年，伴右上腹痛2天#####巩膜及皮肤中度黄染，无肝掌，未见蜘蛛痣，腹平软，无压痛，肝、脾未扪及，肝区有叩痛。 现病史:患者自幼就经常出现皮肤及眼睛黄、尿黄，无皮肤瘙痒，亦无其它不适。年轻时曾在当地医院住院诊治，经肝穿刺病理检查发现肝细胞内有棕褐色色素颗粒。以后上述症征反复出现，由于无特效治疗，也就未进一步诊治。近2天出现右上腹痛，遂来本院就诊。    weight=    assistCheck=上腹CT检查示肝右叶可见一直径约1.7cm囊肿，胆、胰、脾、肾未见异常。化验检查示血清总蛋白69.7g/L，白蛋白（A）48.1g/L，球蛋白（G）21.6g/L，A/G2.23，总胆红素174.2μmol/L，直接胆红素145.8μmol/L，间接胆红素28.4μmol/L，丙氨酸转氨酶25U/L，天门冬氨酸转氨酶22U/L，碱性磷酸酶75U/L，谷氨酰转肽酶143U/L。甲、乙、丙、丁及戊肝炎病毒血清标志物均为阴性。口服胆囊造影提示胆囊不显影。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    迪宾-约翰逊综合征

消化科经典病历59行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=4    ageType=天    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=腹泻2天#####明显脱水症 现病史:因孕36周早产住我院新生儿病房,生后Apgar评分8分。生后6h开奶,牛乳喂养。住院当日排胎便,次日排过渡便,尿量正常.住院第3天起大便增多,6～10次/d,为黄色糊状,无奶块,无异味，改为母乳喂养并口服妈咪爱,治疗2d后无好转,且体重下降至1900g。    weight=    assistCheck=大便PH值5,粪便还原糖试验阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    乳糖不耐受症

消化科经典病历60行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=上腹不适20天，发热3小时#####生命体征稳定，神清，精神可，反应灵敏，回答准确，全身皮肤巩膜黄染明显，腹平软，右上腹部有深压痛，全腹无反跳痛，肝脾肋缘下未触及，Murphy征阴性，肠鸣音正常。 现病史:20多天前出现上腹部不适，伴恶心、呕吐2次，曾到当地医院就诊，检查了胃镜，无特殊发现。几天后出现黄疸。3小时前突发畏寒、高热，达到了40.2℃。行物理降温和退热栓治疗，效果不好，但患者一直没有腹痛。    weight=    assistCheck=经内镜逆行胰胆管造影（ERCP）检查：胆总管下段结石。B超提示胆总管扩张。血常规：白细胞21.0×109／L，中性粒细胞96%；血、尿淀粉酶正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性化脓性梗阻性胆管炎

消化科经典病历61行-1
    [Documentation]    断言:"梗阻性黄疸"
    ${getRes}    智能诊断3.0    age=50    ageType=天    allergyHistory=    bodyTempr=    familyHistory=患儿母亲乙型肝炎病史9年
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=黄疸至今未退，伴大便颜色变白1月余#####全身皮肤、巩膜中度黄染，腹胀，未见腹壁静脉曲张，肝肋下3cm，触之尚软，叩诊为鼓音，移动性浊音（−），肠鸣音正常。 现病史:生后2天开始出现黄疸，持续半月后缓解，数日后再次出现黄疸且进行性加重。生后排淡黄色大便，生后3周开始排白色陶土样大便，尿为深茶色。    weight=    assistCheck=实验室检查：HBeAb（+）、HBcAb（+），ALP、AST、ALT、γ-GGT、TBIL显著高于正常，α-抗胰蛋白酶正常，尿胆红素（+++），尿胆原正常，粪胆原呈阴性，TORCH呈阴性。B超：肝肋下4.4cm，剑下1.2cm，肝实质回声均匀，肝内外胆管未见扩张，胆囊充盈，形态自然，大小约1.9cm × 0.4cm，壁不厚，餐后胆囊体积未见改变，未见腹水及占位，肝门淋巴结肿大。肝脏核素扫描：静脉注射Tc-99m-EHIDA 5mCi，分别在注射后5、10、15、30分钟及1、6、24小时采集，肝胆显影24小时显像剂未能达到肠道。肝脏磁共振：肝影轻度增大，肝内胆管略少，胆囊小，MRCP胆总管未见明确显示    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    梗阻性黄疸

消化科经典病历61行-2
    [Documentation]    断言:"胆管闭锁"
    ${getRes}    智能诊断3.0    age=50    ageType=天    allergyHistory=    bodyTempr=    familyHistory=患儿母亲乙型肝炎病史9年
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=黄疸至今未退，伴大便颜色变白1月余#####全身皮肤、巩膜中度黄染，腹胀，未见腹壁静脉曲张，肝肋下3cm，触之尚软，叩诊为鼓音，移动性浊音（−），肠鸣音正常。 现病史:生后2天开始出现黄疸，持续半月后缓解，数日后再次出现黄疸且进行性加重。生后排淡黄色大便，生后3周开始排白色陶土样大便，尿为深茶色。    weight=    assistCheck=实验室检查：HBeAb（+）、HBcAb（+），ALP、AST、ALT、γ-GGT、TBIL显著高于正常，α-抗胰蛋白酶正常，尿胆红素（+++），尿胆原正常，粪胆原呈阴性，TORCH呈阴性。B超：肝肋下4.4cm，剑下1.2cm，肝实质回声均匀，肝内外胆管未见扩张，胆囊充盈，形态自然，大小约1.9cm × 0.4cm，壁不厚，餐后胆囊体积未见改变，未见腹水及占位，肝门淋巴结肿大。肝脏核素扫描：静脉注射Tc-99m-EHIDA 5mCi，分别在注射后5、10、15、30分钟及1、6、24小时采集，肝胆显影24小时显像剂未能达到肠道。肝脏磁共振：肝影轻度增大，肝内胆管略少，胆囊小，MRCP胆总管未见明确显示    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胆管闭锁

消化科经典病历62行-1
    [Documentation]    断言:"腹水"
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=无饮酒史    previousHistory=慢性乙型肝炎病史15年，未定期随访
    ...    symptom=乏力、纳差伴腹胀一月余#####神志清，对答切题，定向力良好，肝病面容。皮肤巩膜无黄染，可见肝掌及蜘蛛痣，全身未见出血点。心肺体检未见异常。腹部对称性中度膨隆，软，无压痛、反跳痛，肝肋下未及，剑突下3指，肝区无叩痛，脾肋下2指，边缘锐，无明显触痛，移动性浊音阳性，双下肢无水肿。 现病史:患者1月前无明显诱因出现乏力，纳差，伴腹胀，休息后可稍有缓解；自觉食欲减退，腹部较前增大，并逐渐加重。无眼黄、尿黄，无消瘦。体重较前增加2kg。    weight=    assistCheck=HBsAg（＋）、HBsAb（－）、HBeAg（＋）、HBeAb（－）、HBcAb（＋）；HBV DNA 6﹒3×106copies／ml。抗HAV IgM（－），抗HCV（－），抗HDV（－），抗HEV IgM（－），肝肾功能：TBil 32μmol／L，Dbil 12μmol／L，ALB 28g／L，ALT 147U／L，AST 102U／L，GGT 134U／L，CHE 6467U／L，肌酐69μmol／L。凝血酶原时间14.5s，INR 1﹒20。AFP正常。上腹部B超：肝脏体积缩小，表面不光整，肝实质回声增粗，增强，肝内血管走行不清，肝内外胆管未见扩张。脾脏增大。腹腔探及液性暗区，最深约4cm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    腹水

消化科经典病历62行-2
    [Documentation]    断言:"肝硬化失代偿期"
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=无饮酒史    previousHistory=慢性乙型肝炎病史15年，未定期随访
    ...    symptom=乏力、纳差伴腹胀一月余#####神志清，对答切题，定向力良好，肝病面容。皮肤巩膜无黄染，可见肝掌及蜘蛛痣，全身未见出血点。心肺体检未见异常。腹部对称性中度膨隆，软，无压痛、反跳痛，肝肋下未及，剑突下3指，肝区无叩痛，脾肋下2指，边缘锐，无明显触痛，移动性浊音阳性，双下肢无水肿。 现病史:患者1月前无明显诱因出现乏力，纳差，伴腹胀，休息后可稍有缓解；自觉食欲减退，腹部较前增大，并逐渐加重。无眼黄、尿黄，无消瘦。体重较前增加2kg。    weight=    assistCheck=HBsAg（＋）、HBsAb（－）、HBeAg（＋）、HBeAb（－）、HBcAb（＋）；HBV DNA 6﹒3×106copies／ml。抗HAV IgM（－），抗HCV（－），抗HDV（－），抗HEV IgM（－），肝肾功能：TBil 32μmol／L，Dbil 12μmol／L，ALB 28g／L，ALT 147U／L，AST 102U／L，GGT 134U／L，CHE 6467U／L，肌酐69μmol／L。凝血酶原时间14.5s，INR 1﹒20。AFP正常。上腹部B超：肝脏体积缩小，表面不光整，肝实质回声增粗，增强，肝内血管走行不清，肝内外胆管未见扩张。脾脏增大。腹腔探及液性暗区，最深约4cm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝硬化失代偿期

消化科经典病历63行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=会阴瘙痒3个月#####外阴稍红，见抓痕，无分泌物，无湿疹。 现病史:3个月前出现会阴部瘙痒，尤以夜间为甚，有时有遗尿。夜间突发惊哭，睡眠不安。患儿心情烦躁、焦虑不安，食欲减退，注意力不集中、好咬指甲。会阴局部皮肤被患儿搔破。病程中患儿胃纳差，近日来有尿频、尿急等症状。    weight=    assistCheck=血常规：RBC 3.96×1012／L，Hb112g／L，WBC 7.98×109／L，中性粒细胞48%，嗜酸性粒细胞3%，血小板307×109/L，粪便常规正常，尿常规：蛋白(—)，镜检(—)。血生化正常。家长在患儿熟睡后检查肛周见乳白色线头样小虫在爬动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    蛲虫病

消化科经典病历64行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=2    ageType=月    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=皮肤黄染2个月#####皮肤、黏膜黄染，肝右肋下4cm 现病史:生后6天发现患儿皮肤、黏膜黄染，无发热，无呕吐、腹泻，无白陶土样便。    weight=    assistCheck=TBIL 243﹒7μmol／L，DBIL 79﹒9μmol／L，IBIL 163﹒8μmol／L，AST 74﹒0U／L。99mTc‐EHIDA 肝胆动态显像示肝脏24小时内持续显影，双肾及心脏明显显影，2～6小时显示肠道影，24小时后仍可见肝影和双肾显影。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝细胞性黄疸

消化科经典病历65行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=岁    allergyHistory=    bodyTempr=38.6    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=110    lowBldPress=60    personalHistory=    previousHistory=既往健康，无慢性肝病病史
    ...    symptom=腹胀半月、发热3天、呕血3小时#####神志清楚，呼吸平稳，面色灰暗，表情淡漠，睑结膜略苍白，口唇无发绀。未见肝掌和蜘蛛痣，全身皮肤无出血点和紫癜。双肺呼吸音清。腹部膨隆，全腹压痛及反跳痛，无肌紧张。肺肝界第6肋间，移动性浊音阳性，双下肢无水肿。 现病史:近半月自觉腹胀且腹部逐渐增大，当时无发热，食欲尚可，无腹痛及腹泻，无恶心呕吐等消化道症状，二便正常，未进行治疗。3天前开始发热，体温38℃左右，无发冷及寒战，但腹胀加重且有腹痛，经应用抗生素治疗症状无明显缓解。3小时前进食后突然呕暗紫色血液约300ml，带有血块，排黑便。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    门静脉高压

消化科经典病历66行-1
    [Documentation]    断言:"肝硬化"
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=其母为乙肝病毒感染者。其兄2年前死于肝硬化上消化道出血。
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=饮酒10余年，每日白酒半斤左右，未戒酒    previousHistory=既往健康，无慢性肝病病史
    ...    symptom=腹胀、食欲下降3年，黑便2天#####神志清楚，查体合作，问话可正确回答，计算力及定向力正常。面色晦暗，巩膜黄染，前胸部及双上肢散在数枚蜘蛛痣，肝掌阳性。无颈静脉充盈及怒张，颈前、颈后、锁骨上淋巴结未触及。双肺呼吸音清，未闻及干湿啰音，心律规整，各瓣膜区未闻及病理性杂音。腹软，略膨隆，剑突下有压痛，无反跳痛及肌紧张，肝脏肋下未触及，脾脏肋下2cm，质地Ⅱ度硬，有触痛，肝上界位于右侧锁骨中线第6肋间，脾上界位于左侧腋中线第8肋间，移动性浊音（+），双下肢指压痕（+）。 现病史:患者近3年间断出现腹胀和食欲下降，进食油腻饮食及饮酒后大便不成形，无反酸、烧心，自服氨基酸胶囊、水飞蓟宾等药，未予系统诊治。2天前，无明显诱因出现黑便，糊状，每日2～3次，每次量约100g，便前腹部不适，便后好转，伴头晕、心悸、乏力。无发热，无咳嗽、咳痰，有鼻出血和齿龈出血，尿色黄，无尿频、尿急、尿痛，24小时尿量约800ml，体重无明显下降。    weight=    assistCheck="肝功能：ALT 125U/L，AST 70U/L，ALP 150U/L，GGT 196U/L，T-Bil 86μmol/L，D-Bil 60μmol/L，TP 50g/L，ALB 25.6g/L。凝血三项：PT 18.7秒，活动度 60%。血常规：WBC 3.8×109/L，Hb 100g/L，PLT 56×109/L。血氨12μmol/L。腹水常规：细胞数80×106/L，中性粒细胞比例50%，淋巴细胞比例50%。蛋白10g/L，黏蛋白试验阳性。肝炎病毒标志物检查：HbsAg阳性，HbeAg阳性，抗HBc-IgM阳性。HBVDNA 5.76×106copy/L。抗线粒体抗体、抗平滑肌抗体、免疫球蛋白、补体、血清蛋白电泳、血清铁、血清铜蓝蛋白均正常。肝脏增强CT检查：肝脏体积缩小、表面凸凹不平、脾大、腹水。食管点片检查：食管下段呈虫蚀样或蚯蚓状充盈缺损。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝硬化

消化科经典病历66行-2
    [Documentation]    断言:"肝硬化失代偿期"
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=其母为乙肝病毒感染者。其兄2年前死于肝硬化上消化道出血。
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=饮酒10余年，每日白酒半斤左右，未戒酒    previousHistory=既往健康，无慢性肝病病史
    ...    symptom=腹胀、食欲下降3年，黑便2天#####神志清楚，查体合作，问话可正确回答，计算力及定向力正常。面色晦暗，巩膜黄染，前胸部及双上肢散在数枚蜘蛛痣，肝掌阳性。无颈静脉充盈及怒张，颈前、颈后、锁骨上淋巴结未触及。双肺呼吸音清，未闻及干湿啰音，心律规整，各瓣膜区未闻及病理性杂音。腹软，略膨隆，剑突下有压痛，无反跳痛及肌紧张，肝脏肋下未触及，脾脏肋下2cm，质地Ⅱ度硬，有触痛，肝上界位于右侧锁骨中线第6肋间，脾上界位于左侧腋中线第8肋间，移动性浊音（+），双下肢指压痕（+）。 现病史:患者近3年间断出现腹胀和食欲下降，进食油腻饮食及饮酒后大便不成形，无反酸、烧心，自服氨基酸胶囊、水飞蓟宾等药，未予系统诊治。2天前，无明显诱因出现黑便，糊状，每日2～3次，每次量约100g，便前腹部不适，便后好转，伴头晕、心悸、乏力。无发热，无咳嗽、咳痰，有鼻出血和齿龈出血，尿色黄，无尿频、尿急、尿痛，24小时尿量约800ml，体重无明显下降。    weight=    assistCheck="肝功能：ALT 125U/L，AST 70U/L，ALP 150U/L，GGT 196U/L，T-Bil 86μmol/L，D-Bil 60μmol/L，TP 50g/L，ALB 25.6g/L。凝血三项：PT 18.7秒，活动度 60%。血常规：WBC 3.8×109/L，Hb 100g/L，PLT 56×109/L。血氨12μmol/L。腹水常规：细胞数80×106/L，中性粒细胞比例50%，淋巴细胞比例50%。蛋白10g/L，黏蛋白试验阳性。肝炎病毒标志物检查：HbsAg阳性，HbeAg阳性，抗HBc-IgM阳性。HBVDNA 5.76×106copy/L。抗线粒体抗体、抗平滑肌抗体、免疫球蛋白、补体、血清蛋白电泳、血清铁、血清铜蓝蛋白均正常。肝脏增强CT检查：肝脏体积缩小、表面凸凹不平、脾大、腹水。食管点片检查：食管下段呈虫蚀样或蚯蚓状充盈缺损。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肝硬化失代偿期

消化科经典病历66行-3
    [Documentation]    断言:"乙型病毒性肝炎"
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=其母为乙肝病毒感染者。其兄2年前死于肝硬化上消化道出血。
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=饮酒10余年，每日白酒半斤左右，未戒酒    previousHistory=既往健康，无慢性肝病病史
    ...    symptom=腹胀、食欲下降3年，黑便2天#####神志清楚，查体合作，问话可正确回答，计算力及定向力正常。面色晦暗，巩膜黄染，前胸部及双上肢散在数枚蜘蛛痣，肝掌阳性。无颈静脉充盈及怒张，颈前、颈后、锁骨上淋巴结未触及。双肺呼吸音清，未闻及干湿啰音，心律规整，各瓣膜区未闻及病理性杂音。腹软，略膨隆，剑突下有压痛，无反跳痛及肌紧张，肝脏肋下未触及，脾脏肋下2cm，质地Ⅱ度硬，有触痛，肝上界位于右侧锁骨中线第6肋间，脾上界位于左侧腋中线第8肋间，移动性浊音（+），双下肢指压痕（+）。 现病史:患者近3年间断出现腹胀和食欲下降，进食油腻饮食及饮酒后大便不成形，无反酸、烧心，自服氨基酸胶囊、水飞蓟宾等药，未予系统诊治。2天前，无明显诱因出现黑便，糊状，每日2～3次，每次量约100g，便前腹部不适，便后好转，伴头晕、心悸、乏力。无发热，无咳嗽、咳痰，有鼻出血和齿龈出血，尿色黄，无尿频、尿急、尿痛，24小时尿量约800ml，体重无明显下降。    weight=    assistCheck="肝功能：ALT 125U/L，AST 70U/L，ALP 150U/L，GGT 196U/L，T-Bil 86μmol/L，D-Bil 60μmol/L，TP 50g/L，ALB 25.6g/L。凝血三项：PT 18.7秒，活动度 60%。血常规：WBC 3.8×109/L，Hb 100g/L，PLT 56×109/L。血氨12μmol/L。腹水常规：细胞数80×106/L，中性粒细胞比例50%，淋巴细胞比例50%。蛋白10g/L，黏蛋白试验阳性。肝炎病毒标志物检查：HbsAg阳性，HbeAg阳性，抗HBc-IgM阳性。HBVDNA 5.76×106copy/L。抗线粒体抗体、抗平滑肌抗体、免疫球蛋白、补体、血清蛋白电泳、血清铁、血清铜蓝蛋白均正常。肝脏增强CT检查：肝脏体积缩小、表面凸凹不平、脾大、腹水。食管点片检查：食管下段呈虫蚀样或蚯蚓状充盈缺损。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    乙型病毒性肝炎

消化科经典病历66行-4
    [Documentation]    断言:"上消化道出血"
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=其母为乙肝病毒感染者。其兄2年前死于肝硬化上消化道出血。
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=饮酒10余年，每日白酒半斤左右，未戒酒    previousHistory=既往健康，无慢性肝病病史
    ...    symptom=腹胀、食欲下降3年，黑便2天#####神志清楚，查体合作，问话可正确回答，计算力及定向力正常。面色晦暗，巩膜黄染，前胸部及双上肢散在数枚蜘蛛痣，肝掌阳性。无颈静脉充盈及怒张，颈前、颈后、锁骨上淋巴结未触及。双肺呼吸音清，未闻及干湿啰音，心律规整，各瓣膜区未闻及病理性杂音。腹软，略膨隆，剑突下有压痛，无反跳痛及肌紧张，肝脏肋下未触及，脾脏肋下2cm，质地Ⅱ度硬，有触痛，肝上界位于右侧锁骨中线第6肋间，脾上界位于左侧腋中线第8肋间，移动性浊音（+），双下肢指压痕（+）。 现病史:患者近3年间断出现腹胀和食欲下降，进食油腻饮食及饮酒后大便不成形，无反酸、烧心，自服氨基酸胶囊、水飞蓟宾等药，未予系统诊治。2天前，无明显诱因出现黑便，糊状，每日2～3次，每次量约100g，便前腹部不适，便后好转，伴头晕、心悸、乏力。无发热，无咳嗽、咳痰，有鼻出血和齿龈出血，尿色黄，无尿频、尿急、尿痛，24小时尿量约800ml，体重无明显下降。    weight=    assistCheck="肝功能：ALT 125U/L，AST 70U/L，ALP 150U/L，GGT 196U/L，T-Bil 86μmol/L，D-Bil 60μmol/L，TP 50g/L，ALB 25.6g/L。凝血三项：PT 18.7秒，活动度 60%。血常规：WBC 3.8×109/L，Hb 100g/L，PLT 56×109/L。血氨12μmol/L。腹水常规：细胞数80×106/L，中性粒细胞比例50%，淋巴细胞比例50%。蛋白10g/L，黏蛋白试验阳性。肝炎病毒标志物检查：HbsAg阳性，HbeAg阳性，抗HBc-IgM阳性。HBVDNA 5.76×106copy/L。抗线粒体抗体、抗平滑肌抗体、免疫球蛋白、补体、血清蛋白电泳、血清铁、血清铜蓝蛋白均正常。肝脏增强CT检查：肝脏体积缩小、表面凸凹不平、脾大、腹水。食管点片检查：食管下段呈虫蚀样或蚯蚓状充盈缺损。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    上消化道出血

消化科经典病历67行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=43    ageType=岁    allergyHistory=    bodyTempr=36.9    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=117    lowBldPress=71    personalHistory=    previousHistory=
    ...    symptom=反酸、烧心、咽痛10余天#####发育正常，体型中等，自主体位，步入病房，神清语晰，查体合作。心肺（－）。腹平坦，未见胃肠型及蠕动波，未见腹壁静脉曲张，腹软，全腹无压痛、无反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性，肝浊音界位于右胸锁骨中线第5 肋间，肝区、脾区及双肾区无叩痛，肠鸣音4次／分，无气过水声。 现病史:患者10天前晨起后无明显诱因感反酸、烧心，伴有咽喉部干痛不适，无畏寒、发热、胸痛、胸闷、恶心、呕吐、腹痛、腹胀，当时因症状尚能忍受，未到医院诊治，其后自觉上述症状反复出现，进食过饱时明显，空腹时可自然缓解，因近几日症状明显加重，且影响夜间睡眠，遂就诊。自患病以来精神、睡眠、食欲差，大小便正常，体重无明显变化。    weight=    assistCheck=血常规、肝肾功能、大小便常规均正常。心电图正常。胃镜示：食道下段黏膜见数条纵行充血糜烂灶；胃底少量清亮胃液，胃体脑回状，桔红色；胃角形态正常；胃窦黏膜光滑，蠕动正常，色泽红白相间，大致相等；幽门圆形，开闭自如；十二指肠球部黏膜光滑，未见糜烂、溃疡。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胃食管反流病

消化科经典病历68行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=70    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=吞咽困难10年，加重1年#####营养状况差，体重指数为18.5kg／m2。浅表淋巴结未及。心、肺无异常。腹部平软，全腹无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音4次／分，无减弱。 现病史:10年前家人遇严重车祸，患者闻讯后出现进食吞咽困难。病初进干食需用大量水送咽，每次进餐时间约30分钟，只能进半流食及流食，体重明显下降。给予消心痛能有效减轻症状，1年后效果不明显。病程中症状反复波动，严重时仅能进少量流食，伴严重呛咳。症状加重与情绪有关，情绪好时能完成正常进餐，而情绪差时即使进流食也出现严重的吞咽困难。近1年症状加重，出现咳嗽、夜间常憋醒，需要起床活动或诱发呕吐，症状才能减轻，无明显反酸、烧心，近1年体重减轻5kg。    weight=    assistCheck=粪便常规和便潜血：正常。血常规、肝肾功能和电解质：正常。食管钡剂造影：食管近端明显扩张，立位可见液气平面，食管远端贲门处呈“鸟嘴征”。胃镜：食管腔明显增宽，内见大量潴留液体及食物残渣，食管壁呈环状，贲门紧闭，内镜不易通过，局部黏膜无异常；胃、十二指肠球及降部未见异常。食管动力检查：下食管括约肌松弛率＜50%（＜85%为异常），食管体部蠕动收缩波幅低于30 mmHg（＜30 mmHg为无效收缩），同步收缩波80%（同步收缩＞30%为无效收缩）；上食管括约肌功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    贲门失弛缓症

消化科经典病历69行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=150    lowBldPress=95    personalHistory=    previousHistory=
    ...    symptom=吞咽困难2天#####间接喉镜检查示梨状窝积液 现病史:患者2天前误咽枣核后出现吞咽困难、吞咽疼痛、发热，曾强吞饭团，并继续进流质饮食。目前，胸骨后疼痛明显。    weight=    assistCheck=血常规：WBC13.0×109／L。食管泛影葡胺造影：食管入口处充盈缺损，纵膈无明显增宽。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    食管内异物

消化科经典病历70行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=14    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=否认家族胃炎及消化性溃疡病史。
    ...    gender=1    heartRate=95    highBldPress=95    lowBldPress=60    personalHistory=    previousHistory=自幼容易发生鼻出血，但短时自行停止且无全身其他部位出血史，并有偶尔腹痛，无反酸、嗳气、便血史。
    ...    symptom=腹痛6小时伴血便3次#####发育正常，营养中等，神志清楚，精神反应可，呼吸平稳，面色稍苍白，全身皮肤无黄染，无皮疹，未见出血点、紫癜，皮肤弹性好，浅表淋巴结未及肿大，睑结膜稍苍白，口唇色淡，咽无充血，心肺查体未见异常，腹稍膨隆，未见胃肠型及蠕动波，无腹壁静脉曲张。左中上腹压痛阳性，无反跳痛及肌紧张，未及包块，叩诊鼓音，移动性浊音阴性，肠鸣音3次/分。四肢关节无肿胀及活动受限，肢端暖，CRT＜1秒，甲床稍苍白。神经系统查体未见异常。 现病史:患儿于入院前6小时无明显诱因突发腹痛，位于左中上腹，呈阵发性隐痛，疼痛不剧烈，无肩背部放射痛，有恶心，无呕吐、发热、腹胀，随后出现血便，共3次，前2次为柏油样便，最后1次为暗红色血便，每次量多，患儿逐渐出现面色苍白、头晕，并伴有四肢无力，无晕厥及意识丧失，无皮疹及皮肤黄疸，无关节肿痛及鼻出血，家长遂带患儿至急诊。发病以来，一般情况差，精神反应尚可，小便少。发病前无暴饮暴食及不洁饮食史。    weight=48    assistCheck=血常规：WBC 7.94×109/L，RBC 3.05×1012/L，PLT 259×109/L，Hb 85g/L，MCV、MCHC正常。CRP ＜8mg/L，ESR2mm/h。便常规：黑便，潜血（+），白细胞（－），虫卵（－）。凝血三项检查正常。放射性核素检查：未见异位胃黏膜显影。胃镜：食管黏膜光滑柔软，未见糜烂及溃疡，胃窦黏膜充血水肿，呈颗粒样改变，幽门圆，开闭自然。十二指肠球部无畸形，黏膜充血水肿，球腔前壁可见0.5cm×0.5cm溃疡，表面覆薄白苔，周围黏膜明显充血水肿，球后及降部未见异常。幽门螺旋杆菌IgG抗体：阳性。腹部B超：小肠积气明显，反复探查未见明确异常形态肠襻，未见同心圆征象，肝、脾、胰腺、胆囊双肾未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    消化性溃疡

消化科经典病历71行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=43    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=140    lowBldPress=95    personalHistory=    previousHistory=
    ...    symptom=腹痛、腹泻2个月#####步入病房，神清语明，查体合作。巩膜无黄染，结膜无苍白，口唇无发绀。浅表淋巴结未扪及肿大。心肺（-）。腹平软，未扪及腹部包块，脐周压痛，无反跳痛及肌紧张，肝脾肋下未触及，Murphy征阴性，移动性浊音阴性，肠鸣音4次／分。双下肢无水肿。 现病史:患者2个月前进食海鲜及大量饮酒后出现腹痛、腹泻，腹痛部位位于脐周，为持续性疼痛，无放射性痛，无恶心呕吐，排稀便，无黏液脓血，腹痛在排便后可有所缓解，经抗炎治疗后病情未见明显改善。2个月来患者腹痛、腹泻症状持续存在，腹痛仍以脐周明显，腹泻7～8次／天，最多达10次／天，自服药物后腹痛程度较前略有缓解，腹泻次数较前减少，约5～6次／天。病来无发热，2个月前有反酸、胃灼热，自服药物后缓解，饮食睡眠可，小便正常，体重近2个月下降12.5kg。    weight=    assistCheck=血常规：嗜酸性粒细胞数8.56×109／L。大便常规：虫卵均为阴性。胃镜：红斑渗出性胃炎，十二指肠球多发息肉；肠镜：大肠黏膜炎症，直肠多发息肉。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    嗜酸细胞性胃肠炎

消化科经典病历72行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=22    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=100    highBldPress=90    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=间断发热3个月，腹泻2个月，间断排黏液脓血便10天#####神清语明，步入病房。浅表淋巴结未触及肿大。巩膜轻度黄染，结膜无苍白，口唇发绀。双肺听诊呼吸音清，未闻及干湿啰音。心律齐，未闻及杂音。腹软，中上腹及下腹有压痛，无反跳痛及肌紧张，肝脾肋下未触及，Murphy征阴性，肝肾区无叩痛，移动性浊音阴性，肠鸣音4次／分。双下肢无水肿。 现病史:患者3个月前剖宫产术后出现高热，伴抽搐、意识不清，诊断为“结核性脑膜炎、肺结核”，予抗结核治疗。2个月前患者出现腹泻，日排黄色稀便3～7次，无黏液及脓血，便前有中上腹隐痛，便后腹痛减轻，伴腹胀及里急后重，同时有皮肤及巩膜黄染、尿色加深、低热症状，多发生于夜间七八点，停用抗结核药物，给予输血、补液、降黄等治疗后黄疸消退，但腹泻及低热症状未见明显缓解。10天前起患者间断出现排黏液脓血便，便血混合，血少，每日3～7次，有便前腹痛、便后腹痛缓解及里急后重，予止泻对症等治疗，近2天腹泻症状有所缓解，为明确诊断就诊于我院。患者病来无咳嗽、咳痰，无胸闷、气短，有乏力、头晕，无夜间盗汗，常有口腔溃疡，无脱发及光过敏，偶有膝关节疼痛，无恶心、呕吐，无反酸、胃灼热，饮食睡眠较差，无黑便，小便现正常，体重未见明显变化。    weight=    assistCheck=血常规：白细胞6.4×109／L，中性粒细胞39.09%，淋巴细胞51.9%，血红蛋白103g／L，血小板219×109／L。便常规：白细胞8～10／HP，红细胞0～1／HP，潜血2＋。便培养：未见志贺菌、沙门菌生长。血沉：26mm／h。血清离子：钙1.80mmol／L，磷1.54mmol／L，镁0.78mmol／L，钾、钠、氯正常。肝炎病毒阴性，风湿三项、补体、免疫球蛋白、抗核抗体系列及ANCA均正常，肝功能、肾功能、血脂、血糖基本正常，血清肿瘤标志物AFP、CEA、CA199正常。PPD试验：强阳性。结肠镜：横结肠可见2处溃疡性病变，直径约1.2～1.8cm，表面薄白苔，周围黏膜充血水肿明显，分别取组织2块，病理可见干酪样肉芽肿    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肠结核
    ###########内分泌科经典病历############

内分泌科经典病历2行-1
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=无食物及药物过敏史    bodyTempr=36.6    familyHistory=无糖尿病家族史，无其他遗传病及传染病病史
    ...    gender=1    heartRate=    highBldPress=125    lowBldPress=80    personalHistory=生于原籍，久居当地，未到过疫区及牧区。少量饮酒，不抽烟    previousHistory=高脂血症1年
    ...    symptom=多尿、烦渴、多饮3个月，体重下降1个月#####BMI 27.75kg／m2，体型肥胖 现病史:患者3个月前无诱因出现多尿、烦渴、多饮，近1个月来体重下降约3kg。    weight=85    assistCheck=1﹒HbA1c 9.6%。2﹒随机血糖17mmol／L，空腹血糖11.2mmol／L。 3﹒尿常规 尿糖（4 ＋），尿酮体阴性，尿蛋白阴性。4﹒血脂 三酰甘油2.1mmol／L，总胆固醇、HDL、LDL均正常。5﹒肝功能正常。6﹒肾功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    2型糖尿病

内分泌科经典病历2行-2
    [Documentation]    断言:"高脂血症"
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=无食物及药物过敏史    bodyTempr=36.6    familyHistory=无糖尿病家族史，无其他遗传病及传染病病史
    ...    gender=1    heartRate=    highBldPress=125    lowBldPress=80    personalHistory=生于原籍，久居当地，未到过疫区及牧区。少量饮酒，不抽烟    previousHistory=高脂血症1年
    ...    symptom=多尿、烦渴、多饮3个月，体重下降1个月#####BMI 27.75kg／m2，体型肥胖 现病史:患者3个月前无诱因出现多尿、烦渴、多饮，近1个月来体重下降约3kg。    weight=85    assistCheck=1﹒HbA1c 9.6%。2﹒随机血糖17mmol／L，空腹血糖11.2mmol／L。 3﹒尿常规 尿糖（4 ＋），尿酮体阴性，尿蛋白阴性。4﹒血脂 三酰甘油2.1mmol／L，总胆固醇、HDL、LDL均正常。5﹒肝功能正常。6﹒肾功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高脂血症

内分泌科经典病历3行-1
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=无食物及药物过敏史    bodyTempr=36.5    familyHistory=无糖尿病家族史，无其他遗传病及传染病病史
    ...    gender=1    heartRate=20    highBldPress=140    lowBldPress=80    personalHistory=生于原籍，久居当地，未到过疫区及牧区。不饮酒，不抽烟    previousHistory=高血压史10年，慢性胃炎病史5年
    ...    symptom=多尿、烦渴、多饮5个月，加重伴乏力、视力下降15天#####腰围78cm，BMI 26.7kg／m2，体型肥胖 现病史:患者5个月前无诱因出现多尿、烦渴、多饮，曾在社区医院查空腹血糖5.1mmol／L，未检测餐后血糖。近15天来上述症状加重，乏力明显，视力下降。    weight=80    assistCheck=1﹒HbA1c 8.5%。2﹒随机血糖16.3mmol／L,空腹血糖6.6mmol／L，3﹒尿常规 尿糖（3 ＋），尿酮体阴性，尿蛋白（±）。 4﹒血脂 三酰甘油1.7mmol／L，总胆固醇4.5mmol／L，HDL 1.2 mmol／L，LDL 3.2mmol／L。5﹒肾功能BUN 7﹒6mmol／L，Crea 140μmol／L。6﹒肝功能 正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    2型糖尿病

内分泌科经典病历3行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=无食物及药物过敏史    bodyTempr=36.5    familyHistory=无糖尿病家族史，无其他遗传病及传染病病史
    ...    gender=1    heartRate=20    highBldPress=140    lowBldPress=80    personalHistory=生于原籍，久居当地，未到过疫区及牧区。不饮酒，不抽烟    previousHistory=高血压史10年，慢性胃炎病史5年
    ...    symptom=多尿、烦渴、多饮5个月，加重伴乏力、视力下降15天#####腰围78cm，BMI 26.7kg／m2，体型肥胖 现病史:患者5个月前无诱因出现多尿、烦渴、多饮，曾在社区医院查空腹血糖5.1mmol／L，未检测餐后血糖。近15天来上述症状加重，乏力明显，视力下降。    weight=80    assistCheck=1﹒HbA1c 8.5%。2﹒随机血糖16.3mmol／L,空腹血糖6.6mmol／L，3﹒尿常规 尿糖（3 ＋），尿酮体阴性，尿蛋白（±）。 4﹒血脂 三酰甘油1.7mmol／L，总胆固醇4.5mmol／L，HDL 1.2 mmol／L，LDL 3.2mmol／L。5﹒肾功能BUN 7﹒6mmol／L，Crea 140μmol／L。6﹒肝功能 正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

内分泌科经典病历4行-1
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=41    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=其母亲患有高血压，无糖尿病家族史，无家族性遗传病及传染病史
    ...    gender=1    heartRate=18    highBldPress=130    lowBldPress=80    personalHistory=吸烟20余年，20～40支／d；饮酒20余年，40～50g／d。    previousHistory=17年前患甲肝，已治愈
    ...    symptom=多尿、多饮伴消瘦半个月，视物模糊2天##### 现病史:患者于半个月前无明显诱因出现多尿，夜尿增多，6～7次／晚，伴有口干，多饮，每日饮水量＞3 000ml，体重下降约12kg，无头晕、头疼，无四肢麻木，无手足发凉、皮肤瘙痒，患者未予以重视，期间未监测血糖及进行任何治疗。2天前，患者多尿及口干、多饮症状加重，伴有视物模糊，1天前视物模糊较前加重，伴有头晕，无视物旋转，无恶心、呕吐。    weight=73    assistCheck=1﹒入院随机血糖41.18mmol／L，尿酮体（3 ＋）。 2﹒血气分析p H 7.425，PCO235.7mmHg，PO2135mmHg，Na 128mmol／L，K 4.1mmol／L。3﹒血常规WBC 7.0 ×109／L，NE%59.7%，RBC 4.2 ×10^12／L，HGB 143g／L。4﹒HbA1c 13.1%。 5﹒肾功能BUN 6.0mmol／L，Crea 118μmol／L。 6﹒血脂CHOL 5.40mmol／L，TG 2.22mmol／L，HDL 0.87mmol／L，LDL 4.10mmol／L。 7﹒腹部超声示肝、胆、胰、脾未见占位性病变；双肾体积稍大，结构未见异常；膀胱、前列腺未见占位性病变，膀胱内未见残余尿    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    2型糖尿病

内分泌科经典病历4行-2
    [Documentation]    断言:"糖尿病酮症"
    ${getRes}    智能诊断3.0    age=41    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=其母亲患有高血压，无糖尿病家族史，无家族性遗传病及传染病史
    ...    gender=1    heartRate=18    highBldPress=130    lowBldPress=80    personalHistory=吸烟20余年，20～40支／d；饮酒20余年，40～50g／d。    previousHistory=17年前患甲肝，已治愈
    ...    symptom=多尿、多饮伴消瘦半个月，视物模糊2天##### 现病史:患者于半个月前无明显诱因出现多尿，夜尿增多，6～7次／晚，伴有口干，多饮，每日饮水量＞3 000ml，体重下降约12kg，无头晕、头疼，无四肢麻木，无手足发凉、皮肤瘙痒，患者未予以重视，期间未监测血糖及进行任何治疗。2天前，患者多尿及口干、多饮症状加重，伴有视物模糊，1天前视物模糊较前加重，伴有头晕，无视物旋转，无恶心、呕吐。    weight=73    assistCheck=1﹒入院随机血糖41.18mmol／L，尿酮体（3 ＋）。 2﹒血气分析p H 7.425，PCO235.7mmHg，PO2135mmHg，Na 128mmol／L，K 4.1mmol／L。3﹒血常规WBC 7.0 ×109／L，NE%59.7%，RBC 4.2 ×10^12／L，HGB 143g／L。4﹒HbA1c 13.1%。 5﹒肾功能BUN 6.0mmol／L，Crea 118μmol／L。 6﹒血脂CHOL 5.40mmol／L，TG 2.22mmol／L，HDL 0.87mmol／L，LDL 4.10mmol／L。 7﹒腹部超声示肝、胆、胰、脾未见占位性病变；双肾体积稍大，结构未见异常；膀胱、前列腺未见占位性病变，膀胱内未见残余尿    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    糖尿病酮症

内分泌科经典病历5行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=14    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=外祖母1型糖尿病史38年
    ...    gender=0    heartRate=84    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=多饮多尿2周伴轻度体重下降#####患者发育正常，营养中等 现病史:    weight=    assistCheck=1.尿试纸检查示尿糖及尿酮体强阳性2.空腹血糖8.4mmol／L，餐后血糖为19.5mmol／L，血酮0.49mmol／L3.谷氨酸脱羧酶（GAD）抗体和胰岛细胞抗体（ICA）为阳性，胰岛素自身抗体阴性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    1型糖尿病

内分泌科经典病历6行-1
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=82    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=2型糖尿病10年，恶心、呕吐、腹胀4月##### 现病史:糖尿病病史10年，间断应用口服降糖药物治疗，饮食控制不严格。4个月前出现呃逆、食欲缺乏，病情渐进性加重，逐渐出现恶心、呕吐、腹胀，不伴有胃灼热感、反酸、腹泻    weight=    assistCheck=1.上消化道造影示胃蠕动减慢，胃镜检查示浅表性胃炎。2.空腹血糖11.0mmol／L，随机血糖9.6mmol／L，HbA1c8.0%3.眼科眼底检查未见微动脉瘤、出血、渗出    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    2型糖尿病

内分泌科经典病历6行-2
    [Documentation]    断言:"糖尿病性胃轻瘫"
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=82    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=2型糖尿病10年，恶心、呕吐、腹胀4月##### 现病史:糖尿病病史10年，间断应用口服降糖药物治疗，饮食控制不严格。4个月前出现呃逆、食欲缺乏，病情渐进性加重，逐渐出现恶心、呕吐、腹胀，不伴有胃灼热感、反酸、腹泻    weight=    assistCheck=1.上消化道造影示胃蠕动减慢，胃镜检查示浅表性胃炎。2.空腹血糖11.0mmol／L，随机血糖9.6mmol／L，HbA1c8.0%3.眼科眼底检查未见微动脉瘤、出血、渗出    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    糖尿病性胃轻瘫

内分泌科经典病历6行-3
    [Documentation]    断言:"慢性浅表性胃炎"
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=82    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=2型糖尿病10年，恶心、呕吐、腹胀4月##### 现病史:糖尿病病史10年，间断应用口服降糖药物治疗，饮食控制不严格。4个月前出现呃逆、食欲缺乏，病情渐进性加重，逐渐出现恶心、呕吐、腹胀，不伴有胃灼热感、反酸、腹泻    weight=    assistCheck=1.上消化道造影示胃蠕动减慢，胃镜检查示浅表性胃炎。2.空腹血糖11.0mmol／L，随机血糖9.6mmol／L，HbA1c8.0%3.眼科眼底检查未见微动脉瘤、出血、渗出    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性浅表性胃炎

内分泌科经典病历7行-1
    [Documentation]    断言:"糖尿病足"
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=18    highBldPress=160    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=发现血糖升高10余年，左足趾破溃、红肿疼痛2个月#####左足背动脉波动微弱。左足趾根部可见1.5cm×1.5cm大小皮肤溃疡，有稀薄渗出液，局部红肿，皮肤温度高 现病史:患者10余年前查体发现血糖升高，而后间断口服格列苯脲4年，血糖控制不佳，后改服中成药1年（具体成分不详），继之口服二甲双胍、阿卡波糖。2个月前，无明显诱因出现四肢麻木，热水洗脚时不慎烫伤，左足趾破溃，红肿疼痛，自行外用红霉素软膏及外敷中药（具体不详），病情无好转，入院。    weight=    assistCheck="血常规：白细胞计数11.2×109／L，中性粒细胞比率79%。血生化：随机血糖16.1mmol／L，糖化血红蛋白9.0%。丙氨酸氨基转移酶、天冬氨酸氨基转移酶、尿素氮、肌酐均在正常范围。下肢血管多普勒超声示：左侧肢体动脉轻度狭窄；左足X线片：左足趾骨质破坏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    糖尿病足

内分泌科经典病历7行-2
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=18    highBldPress=160    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=发现血糖升高10余年，左足趾破溃、红肿疼痛2个月#####左足背动脉波动微弱。左足趾根部可见1.5cm×1.5cm大小皮肤溃疡，有稀薄渗出液，局部红肿，皮肤温度高 现病史:患者10余年前查体发现血糖升高，而后间断口服格列苯脲4年，血糖控制不佳，后改服中成药1年（具体成分不详），继之口服二甲双胍、阿卡波糖。2个月前，无明显诱因出现四肢麻木，热水洗脚时不慎烫伤，左足趾破溃，红肿疼痛，自行外用红霉素软膏及外敷中药（具体不详），病情无好转，入院。    weight=    assistCheck="血常规：白细胞计数11.2×109／L，中性粒细胞比率79%。血生化：随机血糖16.1mmol／L，糖化血红蛋白9.0%。丙氨酸氨基转移酶、天冬氨酸氨基转移酶、尿素氮、肌酐均在正常范围。下肢血管多普勒超声示：左侧肢体动脉轻度狭窄；左足X线片：左足趾骨质破坏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    2型糖尿病

内分泌科经典病历7行-3
    [Documentation]    断言:"糖尿病周围神经病变"
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=18    highBldPress=160    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=发现血糖升高10余年，左足趾破溃、红肿疼痛2个月#####左足背动脉波动微弱。左足趾根部可见1.5cm×1.5cm大小皮肤溃疡，有稀薄渗出液，局部红肿，皮肤温度高 现病史:患者10余年前查体发现血糖升高，而后间断口服格列苯脲4年，血糖控制不佳，后改服中成药1年（具体成分不详），继之口服二甲双胍、阿卡波糖。2个月前，无明显诱因出现四肢麻木，热水洗脚时不慎烫伤，左足趾破溃，红肿疼痛，自行外用红霉素软膏及外敷中药（具体不详），病情无好转，入院。    weight=    assistCheck="血常规：白细胞计数11.2×109／L，中性粒细胞比率79%。血生化：随机血糖16.1mmol／L，糖化血红蛋白9.0%。丙氨酸氨基转移酶、天冬氨酸氨基转移酶、尿素氮、肌酐均在正常范围。下肢血管多普勒超声示：左侧肢体动脉轻度狭窄；左足X线片：左足趾骨质破坏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    糖尿病周围神经病变

内分泌科经典病历7行-4
    [Documentation]    断言:"糖尿病周围血管病变"
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=18    highBldPress=160    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=发现血糖升高10余年，左足趾破溃、红肿疼痛2个月#####左足背动脉波动微弱。左足趾根部可见1.5cm×1.5cm大小皮肤溃疡，有稀薄渗出液，局部红肿，皮肤温度高 现病史:患者10余年前查体发现血糖升高，而后间断口服格列苯脲4年，血糖控制不佳，后改服中成药1年（具体成分不详），继之口服二甲双胍、阿卡波糖。2个月前，无明显诱因出现四肢麻木，热水洗脚时不慎烫伤，左足趾破溃，红肿疼痛，自行外用红霉素软膏及外敷中药（具体不详），病情无好转，入院。    weight=    assistCheck="血常规：白细胞计数11.2×109／L，中性粒细胞比率79%。血生化：随机血糖16.1mmol／L，糖化血红蛋白9.0%。丙氨酸氨基转移酶、天冬氨酸氨基转移酶、尿素氮、肌酐均在正常范围。下肢血管多普勒超声示：左侧肢体动脉轻度狭窄；左足X线片：左足趾骨质破坏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    糖尿病周围血管病变

内分泌科经典病历8行-1
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=165    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=反复活动后胸闷、气促1年，加重3天入院#####入院查血压165／90mmHg，双下肺闻及少量湿啰音。心界轻度向左扩大，双下肢中度凹陷性水肿，余无明显异常 现病史:12年前体检发现高血压，未规范治疗。6年前发现餐后血糖高，具体数值不详，3年前出现蛋白尿，给予“贝那普利片”和“厄贝沙坦片”治疗，血压一般控制130～140／80～90mmHg    weight=    assistCheck=尿常规检查：蛋白2＋，24小时尿蛋白定量1.86g。血液生化检查：血白蛋白35g／L，血肌酐300μmol／L，BUN9.0mmol／L，血钾5.4mmol／L。空腹血糖8.5mmol／L，HbA1c7.6%。心脏彩超示：符合糖尿病性心肌病改变，心脏缩舒功能减退，LVEF31%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

内分泌科经典病历8行-2
    [Documentation]    断言:"2型糖尿病"
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=165    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=反复活动后胸闷、气促1年，加重3天入院#####入院查血压165／90mmHg，双下肺闻及少量湿啰音。心界轻度向左扩大，双下肢中度凹陷性水肿，余无明显异常 现病史:12年前体检发现高血压，未规范治疗。6年前发现餐后血糖高，具体数值不详，3年前出现蛋白尿，给予“贝那普利片”和“厄贝沙坦片”治疗，血压一般控制130～140／80～90mmHg    weight=    assistCheck=尿常规检查：蛋白2＋，24小时尿蛋白定量1.86g。血液生化检查：血白蛋白35g／L，血肌酐300μmol／L，BUN9.0mmol／L，血钾5.4mmol／L。空腹血糖8.5mmol／L，HbA1c7.6%。心脏彩超示：符合糖尿病性心肌病改变，心脏缩舒功能减退，LVEF31%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    2型糖尿病

内分泌科经典病历8行-3
    [Documentation]    断言:"糖尿病性心肌病"
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=165    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=反复活动后胸闷、气促1年，加重3天入院#####入院查血压165／90mmHg，双下肺闻及少量湿啰音。心界轻度向左扩大，双下肢中度凹陷性水肿，余无明显异常 现病史:12年前体检发现高血压，未规范治疗。6年前发现餐后血糖高，具体数值不详，3年前出现蛋白尿，给予“贝那普利片”和“厄贝沙坦片”治疗，血压一般控制130～140／80～90mmHg    weight=    assistCheck=尿常规检查：蛋白2＋，24小时尿蛋白定量1.86g。血液生化检查：血白蛋白35g／L，血肌酐300μmol／L，BUN9.0mmol／L，血钾5.4mmol／L。空腹血糖8.5mmol／L，HbA1c7.6%。心脏彩超示：符合糖尿病性心肌病改变，心脏缩舒功能减退，LVEF31%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    糖尿病性心肌病

内分泌科经典病历8行-4
    [Documentation]    断言:"糖尿病肾病"
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=165    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=反复活动后胸闷、气促1年，加重3天入院#####入院查血压165／90mmHg，双下肺闻及少量湿啰音。心界轻度向左扩大，双下肢中度凹陷性水肿，余无明显异常 现病史:12年前体检发现高血压，未规范治疗。6年前发现餐后血糖高，具体数值不详，3年前出现蛋白尿，给予“贝那普利片”和“厄贝沙坦片”治疗，血压一般控制130～140／80～90mmHg    weight=    assistCheck=尿常规检查：蛋白2＋，24小时尿蛋白定量1.86g。血液生化检查：血白蛋白35g／L，血肌酐300μmol／L，BUN9.0mmol／L，血钾5.4mmol／L。空腹血糖8.5mmol／L，HbA1c7.6%。心脏彩超示：符合糖尿病性心肌病改变，心脏缩舒功能减退，LVEF31%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    糖尿病肾病

内分泌科经典病历9行-1
    [Documentation]    断言:"糖尿病"
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=140    lowBldPress=90    personalHistory=吸烟史近50年，每日30支左右，少量饮酒    previousHistory=
    ...    symptom=#####双足背动脉搏动减弱，双足皮温低 现病史:糖尿病病史20年，5年前出现双下肢乏力，3天前因双下肢无力加重伴双足发凉，之后患者出现排尿困难来诊    weight=75    assistCheck=心电图：窦性心动过速（心率105次／分）。腹部超声：肝胆胰脾肾未见异常。泌尿系超声：前列腺肥大。眼底：未见微动脉瘤，出血、渗出。尿常规：蛋白（－），尿糖（－），尿酮体（－）。空腹血糖6.3mmol／L，餐后血糖12.6mmol／L，HbA1c7.8%。血脂及肝、肾功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    糖尿病

内分泌科经典病历9行-2
    [Documentation]    断言:"糖尿病周围神经病变"
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=140    lowBldPress=90    personalHistory=吸烟史近50年，每日30支左右，少量饮酒    previousHistory=
    ...    symptom=#####双足背动脉搏动减弱，双足皮温低 现病史:糖尿病病史20年，5年前出现双下肢乏力，3天前因双下肢无力加重伴双足发凉，之后患者出现排尿困难来诊    weight=75    assistCheck=心电图：窦性心动过速（心率105次／分）。腹部超声：肝胆胰脾肾未见异常。泌尿系超声：前列腺肥大。眼底：未见微动脉瘤，出血、渗出。尿常规：蛋白（－），尿糖（－），尿酮体（－）。空腹血糖6.3mmol／L，餐后血糖12.6mmol／L，HbA1c7.8%。血脂及肝、肾功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    糖尿病周围神经病变

内分泌科经典病历9行-3
    [Documentation]    断言:"糖尿病周围血管病变"
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=140    lowBldPress=90    personalHistory=吸烟史近50年，每日30支左右，少量饮酒    previousHistory=
    ...    symptom=#####双足背动脉搏动减弱，双足皮温低 现病史:糖尿病病史20年，5年前出现双下肢乏力，3天前因双下肢无力加重伴双足发凉，之后患者出现排尿困难来诊    weight=75    assistCheck=心电图：窦性心动过速（心率105次／分）。腹部超声：肝胆胰脾肾未见异常。泌尿系超声：前列腺肥大。眼底：未见微动脉瘤，出血、渗出。尿常规：蛋白（－），尿糖（－），尿酮体（－）。空腹血糖6.3mmol／L，餐后血糖12.6mmol／L，HbA1c7.8%。血脂及肝、肾功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    糖尿病周围血管病变

内分泌科经典病历9行-4
    [Documentation]    断言:"前列腺增生"
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=140    lowBldPress=90    personalHistory=吸烟史近50年，每日30支左右，少量饮酒    previousHistory=
    ...    symptom=#####双足背动脉搏动减弱，双足皮温低 现病史:糖尿病病史20年，5年前出现双下肢乏力，3天前因双下肢无力加重伴双足发凉，之后患者出现排尿困难来诊    weight=75    assistCheck=心电图：窦性心动过速（心率105次／分）。腹部超声：肝胆胰脾肾未见异常。泌尿系超声：前列腺肥大。眼底：未见微动脉瘤，出血、渗出。尿常规：蛋白（－），尿糖（－），尿酮体（－）。空腹血糖6.3mmol／L，餐后血糖12.6mmol／L，HbA1c7.8%。血脂及肝、肾功能正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    前列腺增生

内分泌科经典病历10行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=61    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=多饮、多尿、多食、消瘦4个月，血糖升高1周入院#####体型偏瘦 现病史:    weight=    assistCheck=空腹血糖19mmol/L，餐后23mmol/L，HbA1c 12.4%，ICA阳性，GADA阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    成人隐匿性自身免疫性糖尿病

内分泌科经典病历11行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=母亲患妊娠糖尿病
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=体检发现血糖升高25天#####BMI 19.34kg／m^2 现病史:    weight=    assistCheck=OGTT:空腹血糖7.2mmol/L，2h血糖10.8mmol/L，HbA1c6.7%，ICA阴性，GADA阴性，IAA阴性，基因检测：GCK杂合突变，突变位置Exon7,行Sanger测序验证提示突变基因同母亲    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    青年起病成年型糖尿病

内分泌科经典病历12行-1
    [Documentation]    断言:"低血糖症"
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=胰岛素瘤
    ...    symptom=突发意识不清#####面色苍白，皮肤湿冷，呼之不应 现病史:    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    低血糖症

内分泌科经典病历12行-2
    [Documentation]    断言:"胰岛素瘤"
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=胰岛素瘤
    ...    symptom=突发意识不清#####面色苍白，皮肤湿冷，呼之不应 现病史:    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胰岛素瘤

内分泌科经典病历13行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=#####双眼球不突，眼裂不大，甲状腺Ⅱ度肿大，质软，无压痛，右叶上极可触及结节，大小1.0cm×0.5cm，未闻及血管杂音。两肺呼吸音清，未闻及干湿性啰音，心率90次／分，各瓣膜听诊区未闻及杂音，腹部查体未见异常。未见胫前黏液性水肿 现病史:2年前出现手抖，全身哆嗦，乏力    weight=    assistCheck=甲状腺功能：FT310.8pmol／L（3.2～7.2pmol／L），FT431.5pmol／L（8.75～22.5pmol／L），TSH0.02mU／L（0.32～4.31mU／L），甲状腺超声：甲状腺弥漫性肿大，内部回声不均匀，可见多个等回声结节，右叶最大结节1.3cm×0.7cm，部分液化。血常规：白细胞计数5.9×109／L，HGB115g／L，PLT158×109／L。肝功能：ALT35U／L，AST32U／L，TBIL20μmol／L，均在正常范围    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺功能亢进症

内分泌科经典病历14行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=查体发现颈部增粗10天#####全身皮肤潮湿，双眼球不突，眼裂不大，甲状腺Ⅱ度肿大 现病史:    weight=    assistCheck=甲状腺功能：FT318.61pmol／L（3.5～6.5pmol／L），FT447.11pmol／L（11.5～22.7pmol／L），TSH＜0.01mU／L（0.64～6.27mU／L），T37.12nmol／L（1.09～2.60nmol／L），T4251.82nmol／L（63.5～167.3nmol／L），TRAb（＋），滴度10.8U／L（0～1.75U／L），TPOAb＞1300U／ml，摄131I率：26%（2小时），44%（4小时），48%（6小时），血常规：白细胞计数7.8×109／L，HGB112g／L，PLT104×109／L。肝功能：ALT 41U／L，AST32U／L，ALP126U／L，TBIL17μmol／L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    格雷夫斯病

内分泌科经典病历15行-1
    [Documentation]    断言:"甲状腺功能亢进症"
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=39.5    familyHistory=
    ...    gender=0    heartRate=150    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=#####烦躁、谵语。双眼球不突，咽部充血，甲状腺Ⅰ度肿大，双手颤阳性 现病史:2年前开始出现乏力、多食易饥、心悸、多汗、怕热、体重下降。经检查后诊断为甲状腺功能亢进症，应用甲巯咪唑治疗，半年后患者乏力易饥、心悸等症状消失，未复查甲状腺功能，自行停用药物治疗。近3个月患者再次出现乏力、怕热、心悸，3天前出现发热，体温高达39.5℃，烦躁、焦虑不安、恶心、呕吐、腹泻、不能进食，来诊    weight=    assistCheck=甲状腺功能TSH＜0.01mU／L，FT330pmol／L，FT4＞167.2pmol／L。TPOAb＞1000U／ml，TGAb4000U／ml，TRAb强阳性，28U／L（0～1.75U／L）。白细胞总数15.8×109／L，中性粒细胞75%，肝、肾功能，电解质，血脂均正常。空腹血糖5.5mmol／L，胸部X线：心肺膈未见异常。ECG：窦性心动过速，Ⅰ、aVL、V5、V6导联T波低平    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺功能亢进症

内分泌科经典病历15行-2
    [Documentation]    断言:"甲状腺危象"
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=39.5    familyHistory=
    ...    gender=0    heartRate=150    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=#####烦躁、谵语。双眼球不突，咽部充血，甲状腺Ⅰ度肿大，双手颤阳性 现病史:2年前开始出现乏力、多食易饥、心悸、多汗、怕热、体重下降。经检查后诊断为甲状腺功能亢进症，应用甲巯咪唑治疗，半年后患者乏力易饥、心悸等症状消失，未复查甲状腺功能，自行停用药物治疗。近3个月患者再次出现乏力、怕热、心悸，3天前出现发热，体温高达39.5℃，烦躁、焦虑不安、恶心、呕吐、腹泻、不能进食，来诊    weight=    assistCheck=甲状腺功能TSH＜0.01mU／L，FT330pmol／L，FT4＞167.2pmol／L。TPOAb＞1000U／ml，TGAb4000U／ml，TRAb强阳性，28U／L（0～1.75U／L）。白细胞总数15.8×109／L，中性粒细胞75%，肝、肾功能，电解质，血脂均正常。空腹血糖5.5mmol／L，胸部X线：心肺膈未见异常。ECG：窦性心动过速，Ⅰ、aVL、V5、V6导联T波低平    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺危象

内分泌科经典病历16行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=49    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发现甲状腺功能亢进13年#####查体：双眼外突，手颤抖，左叶甲状腺触及约3.0cm ×4.0cm 大小肿块，质韧，随吞咽上下移动 现病史:“甲亢”13年，甲巯咪唑治疗4～5年，常反复，近半年来出现白细胞减少后停药    weight=    assistCheck=TSH：0.006μIU／ml，FT4：38.55pmol／L；FT3：14.1pmol／L；TGAb：5.0IU／ml，TPOAb：＜5.0IU／ml，甲状腺摄I 率：3h／34.14%；6h／52.61%；24h／59.87%。甲状腺显像：左叶“热结节”，右叶甲状腺受到抑制，显影不清    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高功能腺瘤伴甲状腺功能亢进症

内分泌科经典病历17行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=#####查体：患儿于暖箱中，早产儿貌，皮肤轻度黄染，无黏液水肿面容，前囟平，大小约2.5c m×3c m，心音尚有力，心率124次／分，腹稍胀，肢端温暖。 现病史:因早产入新生儿病房（胎龄32＋5w，出生体重2.23kg），生后进乳及排便尚可，体温持续偏低    weight=    assistCheck=化验检查：游离三碘甲状腺原氨酸（FT3）2.68p mol／L，游离甲状腺素（FT4）7.48p mol／L，TSH＞100μI U／ml    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性甲状腺功能减退症

内分泌科经典病历18行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=0    heartRate=72    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=发现右侧颈部肿块半年#####颈部对称，质地柔软，右颈部可及一个4cm×3c m肿块，界清，活动，质韧，随吞咽上下活动。左颈部未及异常肿块，颈部未触及肿大淋巴结 现病史:半年前无明显诱因出现颈部肿块，约花生米大小，无其他不适，当时未行特殊处理。半年来肿块逐渐增大，近来感觉有呼吸不畅症状    weight=    assistCheck=彩超提示：甲状腺右叶混合型包块    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺肿瘤

内分泌科经典病历19行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=12    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=颈前肿物3年，颈前紧缩感伴轻微疼痛5天入院#####查体：颈前正中甲状软骨上方触及3×2cm肿物，与皮肤无粘连。 现病史:    weight=    assistCheck=B超：甲状腺形态正常，甲状腺上方探及26×16cm边界清楚、实性、液性混合回声光团，甲功正常    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    异位甲状腺肿

内分泌科经典病历20行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=140    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=心悸气短乏半年力#####双眼突出，瞬目减少，甲状腺Ⅱ度肿大，质地硬，心律不齐，心尖部闻及2/6级收缩期吹风样杂音，双手细颤 现病史:半年前无诱因出现心悸气短 ，活动后明显，伴有乏力，怕热多汗，多食易饥，焦躁易怒    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲状腺功能亢进症

内分泌科经典病历20行-2
    [Documentation]    断言:"甲状腺功能亢进性心脏病"
    ${getRes}    智能诊断3.0    age=50    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=140    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=心悸气短乏半年力#####双眼突出，瞬目减少，甲状腺Ⅱ度肿大，质地硬，心律不齐，心尖部闻及2/6级收缩期吹风样杂音，双手细颤 现病史:半年前无诱因出现心悸气短 ，活动后明显，伴有乏力，怕热多汗，多食易饥，焦躁易怒    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲状腺功能亢进性心脏病

内分泌科经典病历21行-1
    [Documentation]    断言:"甲状腺功能亢进性肌病"
    ${getRes}    智能诊断3.0    age=29    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复出现四肢无力7年，多食易饥伴心悸6年#####消瘦，甲状腺Ⅰ度肿大，双上肢肌力3+级，双下肢肌力2级，肌张力低，四肢腱反射弱，病理反射未引出，无感觉障碍 现病史:    weight=    assistCheck=1.血钾2.0mmol/L，2.血清FT3、FT4增高，TSH减低    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺功能亢进性肌病

内分泌科经典病历21行-2
    [Documentation]    断言:"甲亢性周期性麻痹"
    ${getRes}    智能诊断3.0    age=29    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复出现四肢无力7年，多食易饥伴心悸6年#####消瘦，甲状腺Ⅰ度肿大，双上肢肌力3+级，双下肢肌力2级，肌张力低，四肢腱反射弱，病理反射未引出，无感觉障碍 现病史:    weight=    assistCheck=1.血钾2.0mmol/L，2.血清FT3、FT4增高，TSH减低    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲亢性周期性麻痹

内分泌科经典病历21行-3
    [Documentation]    断言:"低钾型周期性麻痹"
    ${getRes}    智能诊断3.0    age=29    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复出现四肢无力7年，多食易饥伴心悸6年#####消瘦，甲状腺Ⅰ度肿大，双上肢肌力3+级，双下肢肌力2级，肌张力低，四肢腱反射弱，病理反射未引出，无感觉障碍 现病史:    weight=    assistCheck=1.血钾2.0mmol/L，2.血清FT3、FT4增高，TSH减低    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    低钾型周期性麻痹

内分泌科经典病历22行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=#####甲状腺右叶肿大，可触及一约1. 5cm×1. 2cm的结节，表面尚光滑，质中，随吞咽上下移动 现病史:1年前无明显诱因下颈前出现一拇指样大小肿物    weight=    assistCheck=CT示甲状腺右叶明显增大，其内可见一约3. 0cm×2. 4cm的低密度区，位于甲状腺包膜内，边界尚清晰光整，其内密度较均匀，气管轻度受压左移，颈部周围未见明确肿大淋巴结；增强扫描时病灶明显强化，强化程度低于正常甲状腺，周边可见不强化的“晕环征”    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺癌

内分泌科经典病历23行-1
    [Documentation]    断言:"格雷夫斯病"
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=颈部肿大、怕热多汗、心悸乏力、消瘦1年#####甲状腺Ⅱ度肿大，质软，未扪及结节，无压痛 现病史:1年前出现颈部肿大、乏力、怕热多汗、多食易饥、消瘦、手抖    weight=    assistCheck=FT36.9pg／ml（正常0.80～1.70pg／ml），FT43.02pg／ml（正常2.20～4.20pg／ml），TSH ＜0.004mIU／L（正常0.30～3.60mIU／L），甲状腺摄碘率2小时50%，4小时70%，24小时75%。99mTcO4－甲状腺显像表现：甲状腺双叶弥漫性肿大，摄99mTcO4－功能增强，显像剂摄取增加，分布均匀    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    格雷夫斯病

内分泌科经典病历23行-2
    [Documentation]    断言:"甲状腺功能亢进症"
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=颈部肿大、怕热多汗、心悸乏力、消瘦1年#####甲状腺Ⅱ度肿大，质软，未扪及结节，无压痛 现病史:1年前出现颈部肿大、乏力、怕热多汗、多食易饥、消瘦、手抖    weight=    assistCheck=FT36.9pg／ml（正常0.80～1.70pg／ml），FT43.02pg／ml（正常2.20～4.20pg／ml），TSH ＜0.004mIU／L（正常0.30～3.60mIU／L），甲状腺摄碘率2小时50%，4小时70%，24小时75%。99mTcO4－甲状腺显像表现：甲状腺双叶弥漫性肿大，摄99mTcO4－功能增强，显像剂摄取增加，分布均匀    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺功能亢进症

内分泌科经典病历24行-1
    [Documentation]    断言:"库欣综合征"
    ${getRes}    智能诊断3.0    age=30    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=86    highBldPress=140    lowBldPress=100    personalHistory=    previousHistory=
    ...    symptom=颜面发红、肿胀、间断头痛、体重增加2年，加重1个月#####BMI26.1，全身皮肤未见出血点、瘀斑及色素沉着，满月脸，颜面发红，眉毛浓密，发际不低 现病史:2年前人工流产后患者开始逐渐出现颜面发红、肿胀，伴双手肿胀，体重增加，伴头痛，期间月经周期延长，经量减少。1年半前出现停经，一直服用“黄体酮”维持月经周期。1个月前出现体重迅速增加（约5kg），伴上腹饱胀感及手足麻木。近期手足麻木出现加重趋势，并出现双下肢水肿    weight=61    assistCheck=1.血皮质醇：712nmol／L（8：00），811nmol／L（16：00），737nmol／L（0：00）。 2.基础24小时尿游离皮质醇：1563nmol／24h。 3.小剂量地塞米松抑制试验：尿游离皮质醇2699nmol／24h 。4.大剂量地塞米松抑制试验：尿游离皮质醇183.6nmol／24h 。5.血ACTH水平正常：47.0pg／ml（8：00），20.6pg／ml（16：00），42.9pg／ml（0：00）。6.立卧位的血浆肾素-血管紧张素-醛固酮水平均正常。7.肾上腺CT示左肾上腺区类圆形等密度影；强化CT示左侧肾上腺区可见一类圆形病灶，考虑肾上腺腺瘤。8.心电图：窦性心律，正常心电图。9.胸部X线：心肺膈未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    库欣综合征

内分泌科经典病历24行-2
    [Documentation]    断言:"肾上腺肿瘤"
    ${getRes}    智能诊断3.0    age=30    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=86    highBldPress=140    lowBldPress=100    personalHistory=    previousHistory=
    ...    symptom=颜面发红、肿胀、间断头痛、体重增加2年，加重1个月#####BMI26.1，全身皮肤未见出血点、瘀斑及色素沉着，满月脸，颜面发红，眉毛浓密，发际不低 现病史:2年前人工流产后患者开始逐渐出现颜面发红、肿胀，伴双手肿胀，体重增加，伴头痛，期间月经周期延长，经量减少。1年半前出现停经，一直服用“黄体酮”维持月经周期。1个月前出现体重迅速增加（约5kg），伴上腹饱胀感及手足麻木。近期手足麻木出现加重趋势，并出现双下肢水肿    weight=61    assistCheck=1.血皮质醇：712nmol／L（8：00），811nmol／L（16：00），737nmol／L（0：00）。 2.基础24小时尿游离皮质醇：1563nmol／24h。 3.小剂量地塞米松抑制试验：尿游离皮质醇2699nmol／24h 。4.大剂量地塞米松抑制试验：尿游离皮质醇183.6nmol／24h 。5.血ACTH水平正常：47.0pg／ml（8：00），20.6pg／ml（16：00），42.9pg／ml（0：00）。6.立卧位的血浆肾素-血管紧张素-醛固酮水平均正常。7.肾上腺CT示左肾上腺区类圆形等密度影；强化CT示左侧肾上腺区可见一类圆形病灶，考虑肾上腺腺瘤。8.心电图：窦性心律，正常心电图。9.胸部X线：心肺膈未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肾上腺肿瘤

内分泌科经典病历25行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=140    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom= 现病史:1年前无明显诱因突然出现头晕、心悸，大汗，皮肤苍白，伴轻微恶心、无呕吐，无视物旋转，无肢体活动障碍及言语不利，当时测血压180／100mmHg，今日上述类似发作2次，每次发作自开始至血压恢复正常大约持续10分钟，不用降压药血压也能恢复正常    weight=80    assistCheck=辅助检查：心电图：窦性心律，正常心电图。尿常规：未见异常。电解质：血钾3.0mmol／L，血钠、血氯正常，血钙2.8mmol／L。肾上腺CT：左肾上腺区低密度病变，考虑肾上腺腺瘤。发作时尿VMA测定135μmol／24h（↑），血肾上腺素2300pg／ml（↑）、去甲肾上腺素480pg／ml（↑）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    嗜铬细胞瘤

内分泌科经典病历26行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=14    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom= 现病史:1年前无明显诱因出现皮肤变黑，呈渐进性加重，伴有牙龈、口腔黏膜、舌发黑，面部、肘关节、手掌掌纹等处皮肤为著    weight=59    assistCheck=血ACTH和皮质醇：8：00 ACTH＞1250pg／ml（10～63pg／ml），皮质醇231nmol／L（279～991nmol／L）；16：00ACTH367pg／ml，皮质醇323nmol／L；0：00 ACTH114pg／ml，皮质醇141nmol／L。尿游离皮质醇：106nmol／24h（100～379nmol／24h），肾上腺CT：未见异常    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原发性肾上腺皮质功能减退症

内分泌科经典病历27行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=右食指屈侧无痛性肿块致功能障碍#####右食指屈侧有椭圆形、1.0c m×1.5cm、边缘清楚、无压痛的肿块，致活动受限但被动活动正常 现病史:    weight=    assistCheck=血尿酸498μmol／L，肿块内液体组织镜检显示尿酸结晶    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    痛风

内分泌科经典病历28行-1
    [Documentation]    断言:"高泌乳素血症"
    ${getRes}    智能诊断3.0    age=34    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=109    lowBldPress=84    personalHistory=    previousHistory=
    ...    symptom=闭经溢乳10个月余#####胸廓对称，无畸形，乳晕颜色变淡，按压乳腺可见有少量乳汁流出 现病史:患者缘于10个月前无明显诱因出现闭经、溢乳，无头痛、头晕，无视物模糊，无视野缺损，伴怕冷、便秘，大便1次／3～5日，无多汗、怕热，无心慌、腹泻及消瘦，无乳晕颜色变淡，无阴毛、腋毛脱落现象    weight=56    assistCheck=1.PRL 850.8ng／ml，L H、FSH、E2（雌二醇）、P（孕酮）、T（睾酮）均正常.28﹒垂体MRI：垂体微腺瘤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高泌乳素血症

内分泌科经典病历28行-2
    [Documentation]    断言:"催乳素瘤"
    ${getRes}    智能诊断3.0    age=34    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=109    lowBldPress=84    personalHistory=    previousHistory=
    ...    symptom=闭经溢乳10个月余#####胸廓对称，无畸形，乳晕颜色变淡，按压乳腺可见有少量乳汁流出 现病史:患者缘于10个月前无明显诱因出现闭经、溢乳，无头痛、头晕，无视物模糊，无视野缺损，伴怕冷、便秘，大便1次／3～5日，无多汗、怕热，无心慌、腹泻及消瘦，无乳晕颜色变淡，无阴毛、腋毛脱落现象    weight=56    assistCheck=1.PRL 850.8ng／ml，L H、FSH、E2（雌二醇）、P（孕酮）、T（睾酮）均正常.28﹒垂体MRI：垂体微腺瘤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    催乳素瘤

内分泌科经典病历29行-1
    [Documentation]    断言:"甲亢性肝损害"
    ${getRes}    智能诊断3.0    age=41    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=86    highBldPress=120    lowBldPress=63    personalHistory=    previousHistory=
    ...    symptom=心慌、怕热、多汗、消瘦、乏力9个月，#####患者消瘦，精神稍亢奋。皮肤湿润，眼睑无水肿，无眼征，口唇无发绀，颈软无抵抗，甲状腺Ⅱ度肿大 现病史:患者9个月前无明显诱因出现心慌，活动后加剧，烦躁易怒，睡眠差，怕热、多汗、乏力，饮食量变化不大，体重较原来下降5kg，大便次数增多，月经量减少，色变浅；近2个月出现手颤    weight=    assistCheck=1.甲状腺功能：FT3 8.47pmol/L，FT473.8pmol/L，TT37.49nmol/L，TT4201.8nmol/L，TSH＜0.01mU/L。2.肝功能异常：ALT　98.8U/L、AST　62.5U/L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲亢性肝损害

内分泌科经典病历29行-2
    [Documentation]    断言:"甲状腺功能亢进症"
    ${getRes}    智能诊断3.0    age=41    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=86    highBldPress=120    lowBldPress=63    personalHistory=    previousHistory=
    ...    symptom=心慌、怕热、多汗、消瘦、乏力9个月，#####患者消瘦，精神稍亢奋。皮肤湿润，眼睑无水肿，无眼征，口唇无发绀，颈软无抵抗，甲状腺Ⅱ度肿大 现病史:患者9个月前无明显诱因出现心慌，活动后加剧，烦躁易怒，睡眠差，怕热、多汗、乏力，饮食量变化不大，体重较原来下降5kg，大便次数增多，月经量减少，色变浅；近2个月出现手颤    weight=    assistCheck=1.甲状腺功能：FT3 8.47pmol/L，FT473.8pmol/L，TT37.49nmol/L，TT4201.8nmol/L，TSH＜0.01mU/L。2.肝功能异常：ALT　98.8U/L、AST　62.5U/L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲状腺功能亢进症

内分泌科经典病历30行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=生长发育缓慢#####身高130cm（-3.1SD），阴毛1期，双睾丸各1ml，阴茎长3cm，周径4.5cm， 现病史:    weight=28    assistCheck=1.骨龄：7~8岁。2.垂体MRI：大小形态正常，垂体后叶高信号存在；垂体柄居中。3.胰岛素低血糖GH兴奋试验，GH最大值6.06ng/ml（小于10）.4.左旋多巴生长激素兴奋试验，GH最大值5.8ng/ml（小于10）。5.IGF-1：40ng/ml。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    生长激素缺乏症

内分泌科经典病历31行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=72    highBldPress=128    lowBldPress=97    personalHistory=    previousHistory=
    ...    symptom=多尿2个月余，加重伴烦渴、多饮1个月##### 现病史:患者缘于2个月前跌倒后摔伤头部出现昏迷，行头颅核磁检查发现“蛛网膜下腔出血，脑干损伤”，住院期间家属发现患者尿量较前增多，色清如水，1个月前患者尿量较前又明显增加，每日8 000～10 000ml，伴烦渴、多饮    weight=    assistCheck=1.尿比重＜1.005。2.垂体MRI：①平扫显示垂体稍萎小，神经垂体高信号消失，垂体柄下端萎细。3.禁水加压试验结果：患者禁水后尿量有减少，尿比重仍＜1.005，尿渗透压低于血渗透压，注射ADH后，尿渗透压增高＞50%，并大于血渗透压    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    中枢性尿崩症

内分泌科经典病历32行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=17    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=间断鼻出血十余年，加重伴腹胀半年入院#####贫血貌，双下肢皮肤散在分布小块瘀斑，胸骨中下段叩痛，腹部饱满，肝肋缘下未触及，脾大平脐，表面光滑，质中等，无触痛 现病史:    weight=    assistCheck=血常规：RBC 4.9×1012/L，Hb 65g/L，WBC 2.4×109/L，中性粒细胞5%，淋巴细胞44%，单核细胞5%，嗜酸性粒细胞1%，PLT 33×109/L。骨髓象：骨髓有核细胞增生明显活跃（图112-1）。粒、红二系细胞形态无异常。巨核细胞全片79只，血小板散在可见。片中及片尾可见大量散在或成堆戈谢细胞。细胞化学：PAS：阳性，POX：阴性，ACP：阳性，SBB：阴性，甲苯胺蓝：阴性，NSE：弱阳性。生化：血清酸性磷酸酶99.1U/L（参考值＜6.0U/L），骨髓病理检查：见到大量戈谢细胞，银染色（+++）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    戈谢病

内分泌科经典病历33行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=2    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发现胸骨前突、腰后突约半年，生长发育落后#####查体：身材矮小、驼背、头下降、肩高耸 现病史:    weight=    assistCheck=影像学表现： 胸、腰椎曲度呈后突改变，椎体上、下缘突出，近似卵圆形，腰椎椎体前下缘呈“鸟嘴状”突出。右手尺、桡骨远端，干骺变宽，尺侧变尖，第2～5掌骨远端变宽，近端变尖    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    粘多糖贮积症

内分泌科经典病历34行-1
    [Documentation]    断言:"胰岛素瘤"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=否认食物、药物过敏史    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=105    lowBldPress=96    personalHistory=平素健康，否认结核、肝炎等传染病史    previousHistory=否认高血压、糖尿病史
    ...    symptom=反复发作性神志不清1年余#####无明显异常 现病史:患者1年前开始发生清晨时神志不清、呼之不应，伴出汗较多，每次持续几分钟至2小时不等，进食后缓解，之后每1～2个月发作1次。今晨家人发现患者神志不清，呼之不应，伴出汗，来急诊查末梢血糖为1.1mmol／L，高糖静推后苏醒    weight=    assistCheck=血、尿常规、粪常规正常，生化全项：正常。抗胰岛素抗体、抗谷氨酸脱羧酶抗体、胰岛细胞抗体：阴性。糖化血红蛋白：正常。凝血三项：正常。肿瘤标志物：AFP、CEA、CA199、CA125正常。胸片、心电图未见异常。腹部CT平扫＋增强示：胰腺体部结节影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胰岛素瘤

内分泌科经典病历34行-2
    [Documentation]    断言:"低血糖症"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=否认食物、药物过敏史    bodyTempr=36.6    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=105    lowBldPress=96    personalHistory=平素健康，否认结核、肝炎等传染病史    previousHistory=否认高血压、糖尿病史
    ...    symptom=反复发作性神志不清1年余#####无明显异常 现病史:患者1年前开始发生清晨时神志不清、呼之不应，伴出汗较多，每次持续几分钟至2小时不等，进食后缓解，之后每1～2个月发作1次。今晨家人发现患者神志不清，呼之不应，伴出汗，来急诊查末梢血糖为1.1mmol／L，高糖静推后苏醒    weight=    assistCheck=血、尿常规、粪常规正常，生化全项：正常。抗胰岛素抗体、抗谷氨酸脱羧酶抗体、胰岛细胞抗体：阴性。糖化血红蛋白：正常。凝血三项：正常。肿瘤标志物：AFP、CEA、CA199、CA125正常。胸片、心电图未见异常。腹部CT平扫＋增强示：胰腺体部结节影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    低血糖症

内分泌科经典病历35行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=多饮多尿2个月##### 现病史:监测尿量24小时饮水量约为5400ml，尿量为5400ml    weight=    assistCheck="1.多次监测尿比重均不超过1.002 2.行禁水试验，禁水后患儿口渴难忍，尿量未见明显减少，最高尿比重未超过1.005，禁水后血钠升高至148mmol／L 3.垂体加压素实验，注射垂体后叶素后多尿及口渴表现明显缓解，尿比重最高升至1.012"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    中枢性尿崩症

内分泌科经典病历36行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=体检发现尿糖阳性半月##### 现病史:    weight=    assistCheck=1.多次肾功能、血糖、糖化血红蛋白、尿酸及离子检查均正常，氯化铵负荷试验阴性，尿磷酸盐、氨基酸检测阴性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肾性糖尿

内分泌科经典病历37行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=27    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=#####体格检查无异常 现病史:半年来多次出现心慌、出汗，发作时伴有明显无力、思想难以集中，持续约0.5h，经休息症状可缓解，但如立即进食，症状可消失    weight=    assistCheck=血压、心电图、血糖、肝功能、甲状腺功能均正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    反应性低血糖症

内分泌科经典病历38行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=15    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=偶感吞咽不适3月#####查体于甲状舌骨前方触及囊性结节，可随吞咽移动 现病史:    weight=    assistCheck=超声描述 甲状舌骨前方见一囊性结节，边界清楚，内透声好，后方回声明显增强。CDFI示其内未见血流信号    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲状舌管囊肿

内分泌科经典病历39行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发现颈部偏右侧肿物3月#####颈前有一圆形肿物，随吞咽活动 现病史:    weight=    assistCheck=1.甲状腺功能正常。2.超声：右侧甲状腺不均匀增大，回声不均匀，探及等回声结节，大小为50mm×28mm，边界清晰，形态尚规则，内部回声不均匀，部分呈无回声；彩色多普勒超声显示周边血流环绕    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    甲状腺腺瘤
    ####################心脏科经典病历#行######################

心脏科经典病历2行-1
    [Documentation]    断言:"稳定型心绞痛"
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=无药物过敏史    bodyTempr=36.5    familyHistory=其父有高血压病史
    ...    gender=1    heartRate=86    highBldPress=180    lowBldPress=100    personalHistory=吸烟十几年，1包/天    previousHistory=有高血压病史5年，血压150-180/90- 100mmHg，无冠心病史
    ...    symptom=心前区痛一周，加重二天#####一般情况好，肺叩诊清，无啰音，下肢不肿 现病史:一周前骑车上坡时感心前区痛，并向左肩放射，经休息可缓解，二天来走路快时亦有类似情况发作，每次持续 3-5分钟，含硝酸甘油可缓解    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    稳定型心绞痛

心脏科经典病历2行-2
    [Documentation]    断言:"高血压"
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=无药物过敏史    bodyTempr=36.5    familyHistory=其父有高血压病史
    ...    gender=1    heartRate=86    highBldPress=180    lowBldPress=100    personalHistory=吸烟十几年，1包/天    previousHistory=有高血压病史5年，血压150-180/90- 100mmHg，无冠心病史
    ...    symptom=心前区痛一周，加重二天#####一般情况好，肺叩诊清，无啰音，下肢不肿 现病史:一周前骑车上坡时感心前区痛，并向左肩放射，经休息可缓解，二天来走路快时亦有类似情况发作，每次持续 3-5分钟，含硝酸甘油可缓解    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

心脏科经典病历3行-1
    [Documentation]    断言:"慢性支气管炎"
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=父母已故，死亡原因不详，兄妹3人，均体健，否认家族遗传病
    ...    gender=1    heartRate=92    highBldPress=90    lowBldPress=60    personalHistory=出生于新疆策勒，未到过疫区，生活起居条件可，性格平和，饮食平淡， 无烟酒等不良嗜好。于20岁结婚，育有4子女，均体健，爱人体健    previousHistory=既往体健，否认乙肝、结核、伤寒等慢性传染性疾病，否认高血压、冠心病、糖尿病病史，否认中毒、输血史，手术、外伤等病史
    ...    symptom=阵发性咳嗽，气短4年，尿少，浮肿2年，加重4天#####发育正常，营养中等，神志清，精神差，头颅五官端正，口唇及舌头明显发紫,颈软，无抗力，颈静脉怒张,胸廓对称，双肺呼吸音粗，双肺可闻及湿性罗音，心率92次/分，律齐，未闻及器质性杂音及早博，腹软，肝大，肋下3指宽,脾未触及,移动性浊音阴性，肠鸣音正常，脊柱及四肢无奇形，活动自如，双下肢膝关节以下凹陷性浮肿,生理反射存在，病理反射未引出 现病史:患者4年前开始冬春季节变化时出现阵发性咳嗽、气短，痰呈白色粘痰、量少，无发热、盗汗，无呼吸困难，经抗炎、平喘治疗后好转。近2年症状加重，出现活动困难、活动量受限、浮肿、尿量减少、食欲不振，经对症治疗后好转。近4日来患者尿少、浮肿加重，走路、平卧时气短加重，口服利尿药无效。发病以来患者精神，饮食，睡眠差，大小便减少。    weight=    assistCheck=心电图示：窦性心律，右室肥厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性支气管炎

心脏科经典病历3行-2
    [Documentation]    断言:"肺部感染"
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=父母已故，死亡原因不详，兄妹3人，均体健，否认家族遗传病
    ...    gender=1    heartRate=92    highBldPress=90    lowBldPress=60    personalHistory=出生于新疆策勒，未到过疫区，生活起居条件可，性格平和，饮食平淡， 无烟酒等不良嗜好。于20岁结婚，育有4子女，均体健，爱人体健    previousHistory=既往体健，否认乙肝、结核、伤寒等慢性传染性疾病，否认高血压、冠心病、糖尿病病史，否认中毒、输血史，手术、外伤等病史
    ...    symptom=阵发性咳嗽，气短4年，尿少，浮肿2年，加重4天#####发育正常，营养中等，神志清，精神差，头颅五官端正，口唇及舌头明显发紫,颈软，无抗力，颈静脉怒张,胸廓对称，双肺呼吸音粗，双肺可闻及湿性罗音，心率92次/分，律齐，未闻及器质性杂音及早博，腹软，肝大，肋下3指宽,脾未触及,移动性浊音阴性，肠鸣音正常，脊柱及四肢无奇形，活动自如，双下肢膝关节以下凹陷性浮肿,生理反射存在，病理反射未引出 现病史:患者4年前开始冬春季节变化时出现阵发性咳嗽、气短，痰呈白色粘痰、量少，无发热、盗汗，无呼吸困难，经抗炎、平喘治疗后好转。近2年症状加重，出现活动困难、活动量受限、浮肿、尿量减少、食欲不振，经对症治疗后好转。近4日来患者尿少、浮肿加重，走路、平卧时气短加重，口服利尿药无效。发病以来患者精神，饮食，睡眠差，大小便减少。    weight=    assistCheck=心电图示：窦性心律，右室肥厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺部感染

心脏科经典病历3行-3
    [Documentation]    断言:"慢性阻塞性肺疾病"
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=父母已故，死亡原因不详，兄妹3人，均体健，否认家族遗传病
    ...    gender=1    heartRate=92    highBldPress=90    lowBldPress=60    personalHistory=出生于新疆策勒，未到过疫区，生活起居条件可，性格平和，饮食平淡， 无烟酒等不良嗜好。于20岁结婚，育有4子女，均体健，爱人体健    previousHistory=既往体健，否认乙肝、结核、伤寒等慢性传染性疾病，否认高血压、冠心病、糖尿病病史，否认中毒、输血史，手术、外伤等病史
    ...    symptom=阵发性咳嗽，气短4年，尿少，浮肿2年，加重4天#####发育正常，营养中等，神志清，精神差，头颅五官端正，口唇及舌头明显发紫,颈软，无抗力，颈静脉怒张,胸廓对称，双肺呼吸音粗，双肺可闻及湿性罗音，心率92次/分，律齐，未闻及器质性杂音及早博，腹软，肝大，肋下3指宽,脾未触及,移动性浊音阴性，肠鸣音正常，脊柱及四肢无奇形，活动自如，双下肢膝关节以下凹陷性浮肿,生理反射存在，病理反射未引出 现病史:患者4年前开始冬春季节变化时出现阵发性咳嗽、气短，痰呈白色粘痰、量少，无发热、盗汗，无呼吸困难，经抗炎、平喘治疗后好转。近2年症状加重，出现活动困难、活动量受限、浮肿、尿量减少、食欲不振，经对症治疗后好转。近4日来患者尿少、浮肿加重，走路、平卧时气短加重，口服利尿药无效。发病以来患者精神，饮食，睡眠差，大小便减少。    weight=    assistCheck=心电图示：窦性心律，右室肥厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性阻塞性肺疾病

心脏科经典病历3行-4
    [Documentation]    断言:"慢性肺源性心脏病"
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=父母已故，死亡原因不详，兄妹3人，均体健，否认家族遗传病
    ...    gender=1    heartRate=92    highBldPress=90    lowBldPress=60    personalHistory=出生于新疆策勒，未到过疫区，生活起居条件可，性格平和，饮食平淡， 无烟酒等不良嗜好。于20岁结婚，育有4子女，均体健，爱人体健    previousHistory=既往体健，否认乙肝、结核、伤寒等慢性传染性疾病，否认高血压、冠心病、糖尿病病史，否认中毒、输血史，手术、外伤等病史
    ...    symptom=阵发性咳嗽，气短4年，尿少，浮肿2年，加重4天#####发育正常，营养中等，神志清，精神差，头颅五官端正，口唇及舌头明显发紫,颈软，无抗力，颈静脉怒张,胸廓对称，双肺呼吸音粗，双肺可闻及湿性罗音，心率92次/分，律齐，未闻及器质性杂音及早博，腹软，肝大，肋下3指宽,脾未触及,移动性浊音阴性，肠鸣音正常，脊柱及四肢无奇形，活动自如，双下肢膝关节以下凹陷性浮肿,生理反射存在，病理反射未引出 现病史:患者4年前开始冬春季节变化时出现阵发性咳嗽、气短，痰呈白色粘痰、量少，无发热、盗汗，无呼吸困难，经抗炎、平喘治疗后好转。近2年症状加重，出现活动困难、活动量受限、浮肿、尿量减少、食欲不振，经对症治疗后好转。近4日来患者尿少、浮肿加重，走路、平卧时气短加重，口服利尿药无效。发病以来患者精神，饮食，睡眠差，大小便减少。    weight=    assistCheck=心电图示：窦性心律，右室肥厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

心脏科经典病历4行-1
    [Documentation]    断言:"慢性阻塞性肺疾病"
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=114    highBldPress=100    lowBldPress=60    personalHistory=有35年吸烟史，每口20支左右。无饮酒嗜好。    previousHistory=既往幼年曾患“麻疹”，
    ...    symptom=反复咳嗽、咳痰25年，活动后气促12年，加重伴反复下肢浮肿3年#####慢性重病容，半坐卧位。颈静脉充盈，桶状胸，肋间隙增宽。两侧呼吸运动对称，触觉语颤减弱，无胸膜摩擦感，叩诊过清音。两肺呼吸音减弱，双肺下野可闻及细湿啰音。心前区无隆起，剑突下可见心尖搏动，未触及震颤，心界叩不出，心音遥远，心率114次/分，律齐，肺动脉瓣区第二心音亢进，三尖瓣区可闻及Ⅲ/ Ⅵ期收缩期杂音。腹平软，肝肋缘下2cm，，剑突下3cm，质中，边缘钝，触痛不明显，肝颈静脉回流征阳性，移动性浊音阴性。双下肢轻度凹陷性水肿。 现病史:患者自1979年起受凉后渐起咳嗽、咳脓痰，经青霉素静脉滴注治疗后好转。每年发作1-2次，多在冬春季，工作和日常生活不受影响。2000年后发作频率增加，2001年9月受凉后咳嗽加重、咳黄色脓性痰伴发热，体温38℃左右，伴明显气促、心悸和双下肢浮肿，曾在省某医院住院，经药物治疗，心悸、气促好转，浮肿消退后出院，在家日常生活不能完全自理，有时静卧亦感气促。2003年11月18日受凉后上述症状加重，咯黄色脓性痰，痰量增至每天l00ml左右，难咳出，心悸、气促加重伴双下肢浮肿，尿量减少。无发热、盗汗、胸痛及咯血。    weight=    assistCheck=血常规:白细胞9.0×109/L，中性81.7%，淋巴18.3%。血气分析:pH7.391，动脉血氧分压(PaO2) 73. lOmmHg，二氧化碳分压(PaCO2) 56. 20mmHg。一秒量占预计值%( FEV1,%)39%，，一秒量(FEV1 /FVC%)35%，一氧化碳弥散量占预计值%( DLCO% ) 48%，气道阻力占预计值%(Raw%) 208%。胸部X线:胸片示两肺透亮度增加，肺纹理紊乱、增多。右肺下动脉干横径18mm，右心室增大。心电图检查:右心室肥大的改变:电轴右偏，额面平均电轴)≥+90O，重度顺钟向转位，Rv1+Sv5 ≥1. 05mV及肺型P波。超声心动图检查:右室前壁搏动幅度增强，右心室流出道内径35mm，右心室前壁的厚度6 mm，右心房增大27mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性阻塞性肺疾病

心脏科经典病历4行-2
    [Documentation]    断言:"慢性肺源性心脏病"
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=114    highBldPress=100    lowBldPress=60    personalHistory=有35年吸烟史，每口20支左右。无饮酒嗜好。    previousHistory=既往幼年曾患“麻疹”，
    ...    symptom=反复咳嗽、咳痰25年，活动后气促12年，加重伴反复下肢浮肿3年#####慢性重病容，半坐卧位。颈静脉充盈，桶状胸，肋间隙增宽。两侧呼吸运动对称，触觉语颤减弱，无胸膜摩擦感，叩诊过清音。两肺呼吸音减弱，双肺下野可闻及细湿啰音。心前区无隆起，剑突下可见心尖搏动，未触及震颤，心界叩不出，心音遥远，心率114次/分，律齐，肺动脉瓣区第二心音亢进，三尖瓣区可闻及Ⅲ/ Ⅵ期收缩期杂音。腹平软，肝肋缘下2cm，，剑突下3cm，质中，边缘钝，触痛不明显，肝颈静脉回流征阳性，移动性浊音阴性。双下肢轻度凹陷性水肿。 现病史:患者自1979年起受凉后渐起咳嗽、咳脓痰，经青霉素静脉滴注治疗后好转。每年发作1-2次，多在冬春季，工作和日常生活不受影响。2000年后发作频率增加，2001年9月受凉后咳嗽加重、咳黄色脓性痰伴发热，体温38℃左右，伴明显气促、心悸和双下肢浮肿，曾在省某医院住院，经药物治疗，心悸、气促好转，浮肿消退后出院，在家日常生活不能完全自理，有时静卧亦感气促。2003年11月18日受凉后上述症状加重，咯黄色脓性痰，痰量增至每天l00ml左右，难咳出，心悸、气促加重伴双下肢浮肿，尿量减少。无发热、盗汗、胸痛及咯血。    weight=    assistCheck=血常规:白细胞9.0×109/L，中性81.7%，淋巴18.3%。血气分析:pH7.391，动脉血氧分压(PaO2) 73. lOmmHg，二氧化碳分压(PaCO2) 56. 20mmHg。一秒量占预计值%( FEV1,%)39%，，一秒量(FEV1 /FVC%)35%，一氧化碳弥散量占预计值%( DLCO% ) 48%，气道阻力占预计值%(Raw%) 208%。胸部X线:胸片示两肺透亮度增加，肺纹理紊乱、增多。右肺下动脉干横径18mm，右心室增大。心电图检查:右心室肥大的改变:电轴右偏，额面平均电轴)≥+90O，重度顺钟向转位，Rv1+Sv5 ≥1. 05mV及肺型P波。超声心动图检查:右室前壁搏动幅度增强，右心室流出道内径35mm，右心室前壁的厚度6 mm，右心房增大27mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性肺源性心脏病

心脏科经典病历5行-1
    [Documentation]    断言:"心脏瓣膜病"
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=130    lowBldPress=90    personalHistory=    previousHistory=患者既往身体健康，无心血管疾病史
    ...    symptom=活动后气促10年，加重伴胸痛1周#####神志清楚，呼吸急促，端坐位。口唇无发绀，气管居中，颈静脉充盈，胸廓对称，双肺呼吸音粗糙，双肺底听诊可闻及少量湿啰音。心界扩大，律齐，主动脉听诊区可闻及收缩期喷射样杂音，双下肢轻度凹陷性水肿。腹部、神经系统检查未见异常。 现病史:10年前开始常于活动时出现气促症状，休息后能逐渐缓解，未出现过晕厥，夜间一直能平卧入睡，无端坐呼吸，双下肢水肿等其他心衰症状。5年前，由于体力活动稍受限，到当地医院就诊发现心脏瓣膜病，主动脉瓣轻-中度狭窄，间断服用药物，症状缓解不明显，后自行停服。一周前轻微活动时就可出现气促不适，症状较前加重，并且伴有胸痛，为行进一步诊治来我院    weight=    assistCheck=血常规 中性粒细胞百分比77%↑，NT-proBNP 850pg/ml↑ 心脏超声 ：主动脉瓣瓣缘回声增强、瓣叶变形、僵硬，瓣叶开放明显受限，左室增大，室壁增厚。 胸部影像学：双肺轻度瘀血，左心增大。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心脏瓣膜病

心脏科经典病历5行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=130    lowBldPress=90    personalHistory=    previousHistory=患者既往身体健康，无心血管疾病史
    ...    symptom=活动后气促10年，加重伴胸痛1周#####神志清楚，呼吸急促，端坐位。口唇无发绀，气管居中，颈静脉充盈，胸廓对称，双肺呼吸音粗糙，双肺底听诊可闻及少量湿啰音。心界扩大，律齐，主动脉听诊区可闻及收缩期喷射样杂音，双下肢轻度凹陷性水肿。腹部、神经系统检查未见异常。 现病史:10年前开始常于活动时出现气促症状，休息后能逐渐缓解，未出现过晕厥，夜间一直能平卧入睡，无端坐呼吸，双下肢水肿等其他心衰症状。5年前，由于体力活动稍受限，到当地医院就诊发现心脏瓣膜病，主动脉瓣轻-中度狭窄，间断服用药物，症状缓解不明显，后自行停服。一周前轻微活动时就可出现气促不适，症状较前加重，并且伴有胸痛，为行进一步诊治来我院    weight=    assistCheck=血常规 中性粒细胞百分比77%↑，NT-proBNP 850pg/ml↑ 心脏超声 ：主动脉瓣瓣缘回声增强、瓣叶变形、僵硬，瓣叶开放明显受限，左室增大，室壁增厚。 胸部影像学：双肺轻度瘀血，左心增大。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    主动脉瓣狭窄

心脏科经典病历6行-1
    [Documentation]    断言:"先天性心脏病"
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=160    lowBldPress=60    personalHistory=    previousHistory=患者既往有高血压病史7年，最高血压160/60mmHg
    ...    symptom=胸闷、气促1年余，加重1月#####双肺呼吸音清晰，未闻及明显干湿性啰音。心界扩大，心尖搏动向左下移位，呈心尖抬举性搏动。心率80次/分，节律整齐，主动脉听诊区可闻及高调叹气样递减型舒张早期杂音，以前倾坐位最易听清。有水冲脉及毛细血管搏动征，周围血管可听到枪击音和Duroziez双重杂音。现病史:7年前因为高血压病就诊时行心脏超声检查发现有心脏瓣膜病。未予以药物治疗。一年来反复出现胸闷、气促，行利尿、扩管等治疗后症状可缓解。近一月来症状加重，轻微活动就可出现气促症状，同时伴有心前区束缚感。夜间一直能平卧入睡，无端坐呼吸，双下肢水肿等其他心衰症状，为求进一步诊治来诊    weight=    assistCheck=NT-proBNP 850pg/ml↑ 心脏超声：主动脉瓣先天二瓣畸形，明显钙化。主动脉瓣轻度狭窄并极重度关闭不全。二尖瓣轻度狭窄并中度关闭不全。左心室肥厚扩大，左室收缩功能临界，舒张功能降低 胸部影像学：双肺轻度瘀血，左心增大    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历6行-2
    [Documentation]    断言:"主动脉瓣狭窄"
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=160    lowBldPress=60    personalHistory=    previousHistory=患者既往有高血压病史7年，最高血压160/60mmHg
    ...    symptom=胸闷、气促1年余，加重1月#####双肺呼吸音清晰，未闻及明显干湿性啰音。心界扩大，心尖搏动向左下移位，呈心尖抬举性搏动。心率80次/分，节律整齐，主动脉听诊区可闻及高调叹气样递减型舒张早期杂音，以前倾坐位最易听清。有水冲脉及毛细血管搏动征，周围血管可听到枪击音和Duroziez双重杂音。现病史:7年前因为高血压病就诊时行心脏超声检查发现有心脏瓣膜病。未予以药物治疗。一年来反复出现胸闷、气促，行利尿、扩管等治疗后症状可缓解。近一月来症状加重，轻微活动就可出现气促症状，同时伴有心前区束缚感。夜间一直能平卧入睡，无端坐呼吸，双下肢水肿等其他心衰症状，为求进一步诊治来诊    weight=    assistCheck=NT-proBNP 850pg/ml↑ 心脏超声：主动脉瓣先天二瓣畸形，明显钙化。主动脉瓣轻度狭窄并极重度关闭不全。二尖瓣轻度狭窄并中度关闭不全。左心室肥厚扩大，左室收缩功能临界，舒张功能降低 胸部影像学：双肺轻度瘀血，左心增大    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉瓣狭窄

心脏科经典病历6行-3
    [Documentation]    断言:"主动脉瓣关闭不全"
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=160    lowBldPress=60    personalHistory=    previousHistory=患者既往有高血压病史7年，最高血压160/60mmHg
    ...    symptom=胸闷、气促1年余，加重1月#####双肺呼吸音清晰，未闻及明显干湿性啰音。心界扩大，心尖搏动向左下移位，呈心尖抬举性搏动。心率80次/分，节律整齐，主动脉听诊区可闻及高调叹气样递减型舒张早期杂音，以前倾坐位最易听清。有水冲脉及毛细血管搏动征，周围血管可听到枪击音和Duroziez双重杂音。现病史:7年前因为高血压病就诊时行心脏超声检查发现有心脏瓣膜病。未予以药物治疗。一年来反复出现胸闷、气促，行利尿、扩管等治疗后症状可缓解。近一月来症状加重，轻微活动就可出现气促症状，同时伴有心前区束缚感。夜间一直能平卧入睡，无端坐呼吸，双下肢水肿等其他心衰症状，为求进一步诊治来诊    weight=    assistCheck=NT-proBNP 850pg/ml↑ 心脏超声：主动脉瓣先天二瓣畸形，明显钙化。主动脉瓣轻度狭窄并极重度关闭不全。二尖瓣轻度狭窄并中度关闭不全。左心室肥厚扩大，左室收缩功能临界，舒张功能降低 胸部影像学：双肺轻度瘀血，左心增大    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉瓣关闭不全

心脏科经典病历7行-1
    [Documentation]    断言:"慢性缩窄性心包炎"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=135    lowBldPress=60    personalHistory=    previousHistory=否认家族性遗传病史，除5年前可疑“结核性胸膜炎、腹膜炎”病史以外，否认其他传染病病史，无食物、药物过敏史。无烟酒嗜好。患者近年一直外出打工，没有从事特殊工种工作。否认先天性心脏病、慢性肺部及支气管疾病史，无慢性消化、内分泌、血液及神经系统疾病病史。
    ...    symptom=反复心慌、气促6年，再发加重伴咳嗽、腹胀1月#####巩膜轻度黄染。口唇及面颊可见轻度发绀，面色潮红，咽部稍充血，颈软，颈静脉怒张。双肺呼吸音粗糙，双肺散在干啰音，双下肺可闻及湿啰音，心界向左下扩大，心音尚可，心率104次/分，律齐，主动脉瓣听诊区可闻及2～3/6级舒张期叹气样杂音，未闻及心包摩擦音和心包叩击音，腹膨隆，肝肋下约4～5cm，质地中等，压痛（+），肝颈静脉回流征（+），移动性浊音可疑（+），肠鸣音正常存在，双下肢轻度凹陷性水肿，双侧足背动脉搏动正常，水冲脉及毛细血管搏动征等周围血管征（+）。 现病史:自6年前一次感冒受凉后开始出现心慌、气促，当时持续性发热达1月余，伴有咳嗽、咳痰、乏力、盗汗、腹胀纳差等症状，于我院进行相关检查发现“心脏扩大，心功能下降”，同时伴有胸腔和腹腔积液，常规抗感染治疗效果不佳，改用抗结核治疗后体温逐渐正常，且心慌、气促等症状明显缓解。此后患者因外出务工，没有进行复诊和继续坚持抗结核治疗，经常于劳累和感冒受凉后略感心慌、气短，但休息调养后均能缓解，未行正规诊疗。1月前受凉后心慌、气促症状再发加重，稍微活动即可出现症状，伴咳嗽、咳白色泡沫痰，腹胀纳差，在当地给以抗感染（具体不详）及支持对症治疗效果不佳，此后夜间咳嗽、咳痰频繁，严重时有阵发性呼吸困难，并出现双下肢轻微水肿。    weight=    assistCheck=心电图检查：窦性心动过速，电轴不偏NT-proBNP：1820pg/ml 胸片检查：双肺纹理增多、模糊，双下肺慢性感染并胸膜增厚，心影增大，心包广泛钙化 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液 超声心动图检查：双房增大，左室增大，右室饱满。主动脉瓣瓣尖增厚，回声增强，瓣缘粗糙，可见舒张期大量反流。心包增厚，回声增强，右室侧壁心包内可见强回声斑后伴声影，脏壁层粘连，心肌舒张受限，M型运动曲线示室间隔“弹跳征”，符合缩窄性心包炎声像图改变。可见肝静脉及下腔静脉扩张 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液。肺部CT平扫：双侧胸膜及心包明显增厚，并可见多发结节状及条片状钙化，双侧叶间胸膜增厚，左侧后下胸腔局限性包裹性积液，右侧水平裂叶间积液，考虑胸膜炎及心包炎所致 肺功能测定：重度混合性肺通气功能障碍，最大通气量下降（FEV1/FVC：68.04%）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性缩窄性心包炎

心脏科经典病历7行-2
    [Documentation]    断言:"心脏瓣膜病"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=135    lowBldPress=60    personalHistory=    previousHistory=否认家族性遗传病史，除5年前可疑“结核性胸膜炎、腹膜炎”病史以外，否认其他传染病病史，无食物、药物过敏史。无烟酒嗜好。患者近年一直外出打工，没有从事特殊工种工作。否认先天性心脏病、慢性肺部及支气管疾病史，无慢性消化、内分泌、血液及神经系统疾病病史。
    ...    symptom=反复心慌、气促6年，再发加重伴咳嗽、腹胀1月#####巩膜轻度黄染。口唇及面颊可见轻度发绀，面色潮红，咽部稍充血，颈软，颈静脉怒张。双肺呼吸音粗糙，双肺散在干啰音，双下肺可闻及湿啰音，心界向左下扩大，心音尚可，心率104次/分，律齐，主动脉瓣听诊区可闻及2～3/6级舒张期叹气样杂音，未闻及心包摩擦音和心包叩击音，腹膨隆，肝肋下约4～5cm，质地中等，压痛（+），肝颈静脉回流征（+），移动性浊音可疑（+），肠鸣音正常存在，双下肢轻度凹陷性水肿，双侧足背动脉搏动正常，水冲脉及毛细血管搏动征等周围血管征（+）。 现病史:自6年前一次感冒受凉后开始出现心慌、气促，当时持续性发热达1月余，伴有咳嗽、咳痰、乏力、盗汗、腹胀纳差等症状，于我院进行相关检查发现“心脏扩大，心功能下降”，同时伴有胸腔和腹腔积液，常规抗感染治疗效果不佳，改用抗结核治疗后体温逐渐正常，且心慌、气促等症状明显缓解。此后患者因外出务工，没有进行复诊和继续坚持抗结核治疗，经常于劳累和感冒受凉后略感心慌、气短，但休息调养后均能缓解，未行正规诊疗。1月前受凉后心慌、气促症状再发加重，稍微活动即可出现症状，伴咳嗽、咳白色泡沫痰，腹胀纳差，在当地给以抗感染（具体不详）及支持对症治疗效果不佳，此后夜间咳嗽、咳痰频繁，严重时有阵发性呼吸困难，并出现双下肢轻微水肿。    weight=    assistCheck=心电图检查：窦性心动过速，电轴不偏NT-proBNP：1820pg/ml 胸片检查：双肺纹理增多、模糊，双下肺慢性感染并胸膜增厚，心影增大，心包广泛钙化 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液 超声心动图检查：双房增大，左室增大，右室饱满。主动脉瓣瓣尖增厚，回声增强，瓣缘粗糙，可见舒张期大量反流。心包增厚，回声增强，右室侧壁心包内可见强回声斑后伴声影，脏壁层粘连，心肌舒张受限，M型运动曲线示室间隔“弹跳征”，符合缩窄性心包炎声像图改变。可见肝静脉及下腔静脉扩张 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液。肺部CT平扫：双侧胸膜及心包明显增厚，并可见多发结节状及条片状钙化，双侧叶间胸膜增厚，左侧后下胸腔局限性包裹性积液，右侧水平裂叶间积液，考虑胸膜炎及心包炎所致 肺功能测定：重度混合性肺通气功能障碍，最大通气量下降（FEV1/FVC：68.04%）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心脏瓣膜病

心脏科经典病历7行-3
    [Documentation]    断言:"主动脉瓣关闭不全"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=135    lowBldPress=60    personalHistory=    previousHistory=否认家族性遗传病史，除5年前可疑“结核性胸膜炎、腹膜炎”病史以外，否认其他传染病病史，无食物、药物过敏史。无烟酒嗜好。患者近年一直外出打工，没有从事特殊工种工作。否认先天性心脏病、慢性肺部及支气管疾病史，无慢性消化、内分泌、血液及神经系统疾病病史。
    ...    symptom=反复心慌、气促6年，再发加重伴咳嗽、腹胀1月#####巩膜轻度黄染。口唇及面颊可见轻度发绀，面色潮红，咽部稍充血，颈软，颈静脉怒张。双肺呼吸音粗糙，双肺散在干啰音，双下肺可闻及湿啰音，心界向左下扩大，心音尚可，心率104次/分，律齐，主动脉瓣听诊区可闻及2～3/6级舒张期叹气样杂音，未闻及心包摩擦音和心包叩击音，腹膨隆，肝肋下约4～5cm，质地中等，压痛（+），肝颈静脉回流征（+），移动性浊音可疑（+），肠鸣音正常存在，双下肢轻度凹陷性水肿，双侧足背动脉搏动正常，水冲脉及毛细血管搏动征等周围血管征（+）。 现病史:自6年前一次感冒受凉后开始出现心慌、气促，当时持续性发热达1月余，伴有咳嗽、咳痰、乏力、盗汗、腹胀纳差等症状，于我院进行相关检查发现“心脏扩大，心功能下降”，同时伴有胸腔和腹腔积液，常规抗感染治疗效果不佳，改用抗结核治疗后体温逐渐正常，且心慌、气促等症状明显缓解。此后患者因外出务工，没有进行复诊和继续坚持抗结核治疗，经常于劳累和感冒受凉后略感心慌、气短，但休息调养后均能缓解，未行正规诊疗。1月前受凉后心慌、气促症状再发加重，稍微活动即可出现症状，伴咳嗽、咳白色泡沫痰，腹胀纳差，在当地给以抗感染（具体不详）及支持对症治疗效果不佳，此后夜间咳嗽、咳痰频繁，严重时有阵发性呼吸困难，并出现双下肢轻微水肿。    weight=    assistCheck=心电图检查：窦性心动过速，电轴不偏NT-proBNP：1820pg/ml 胸片检查：双肺纹理增多、模糊，双下肺慢性感染并胸膜增厚，心影增大，心包广泛钙化 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液 超声心动图检查：双房增大，左室增大，右室饱满。主动脉瓣瓣尖增厚，回声增强，瓣缘粗糙，可见舒张期大量反流。心包增厚，回声增强，右室侧壁心包内可见强回声斑后伴声影，脏壁层粘连，心肌舒张受限，M型运动曲线示室间隔“弹跳征”，符合缩窄性心包炎声像图改变。可见肝静脉及下腔静脉扩张 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液。肺部CT平扫：双侧胸膜及心包明显增厚，并可见多发结节状及条片状钙化，双侧叶间胸膜增厚，左侧后下胸腔局限性包裹性积液，右侧水平裂叶间积液，考虑胸膜炎及心包炎所致 肺功能测定：重度混合性肺通气功能障碍，最大通气量下降（FEV1/FVC：68.04%）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉瓣关闭不全

心脏科经典病历7行-4
    [Documentation]    断言:"心功能不全"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=135    lowBldPress=60    personalHistory=    previousHistory=否认家族性遗传病史，除5年前可疑“结核性胸膜炎、腹膜炎”病史以外，否认其他传染病病史，无食物、药物过敏史。无烟酒嗜好。患者近年一直外出打工，没有从事特殊工种工作。否认先天性心脏病、慢性肺部及支气管疾病史，无慢性消化、内分泌、血液及神经系统疾病病史。
    ...    symptom=反复心慌、气促6年，再发加重伴咳嗽、腹胀1月#####巩膜轻度黄染。口唇及面颊可见轻度发绀，面色潮红，咽部稍充血，颈软，颈静脉怒张。双肺呼吸音粗糙，双肺散在干啰音，双下肺可闻及湿啰音，心界向左下扩大，心音尚可，心率104次/分，律齐，主动脉瓣听诊区可闻及2～3/6级舒张期叹气样杂音，未闻及心包摩擦音和心包叩击音，腹膨隆，肝肋下约4～5cm，质地中等，压痛（+），肝颈静脉回流征（+），移动性浊音可疑（+），肠鸣音正常存在，双下肢轻度凹陷性水肿，双侧足背动脉搏动正常，水冲脉及毛细血管搏动征等周围血管征（+）。 现病史:自6年前一次感冒受凉后开始出现心慌、气促，当时持续性发热达1月余，伴有咳嗽、咳痰、乏力、盗汗、腹胀纳差等症状，于我院进行相关检查发现“心脏扩大，心功能下降”，同时伴有胸腔和腹腔积液，常规抗感染治疗效果不佳，改用抗结核治疗后体温逐渐正常，且心慌、气促等症状明显缓解。此后患者因外出务工，没有进行复诊和继续坚持抗结核治疗，经常于劳累和感冒受凉后略感心慌、气短，但休息调养后均能缓解，未行正规诊疗。1月前受凉后心慌、气促症状再发加重，稍微活动即可出现症状，伴咳嗽、咳白色泡沫痰，腹胀纳差，在当地给以抗感染（具体不详）及支持对症治疗效果不佳，此后夜间咳嗽、咳痰频繁，严重时有阵发性呼吸困难，并出现双下肢轻微水肿。    weight=    assistCheck=心电图检查：窦性心动过速，电轴不偏NT-proBNP：1820pg/ml 胸片检查：双肺纹理增多、模糊，双下肺慢性感染并胸膜增厚，心影增大，心包广泛钙化 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液 超声心动图检查：双房增大，左室增大，右室饱满。主动脉瓣瓣尖增厚，回声增强，瓣缘粗糙，可见舒张期大量反流。心包增厚，回声增强，右室侧壁心包内可见强回声斑后伴声影，脏壁层粘连，心肌舒张受限，M型运动曲线示室间隔“弹跳征”，符合缩窄性心包炎声像图改变。可见肝静脉及下腔静脉扩张 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液。肺部CT平扫：双侧胸膜及心包明显增厚，并可见多发结节状及条片状钙化，双侧叶间胸膜增厚，左侧后下胸腔局限性包裹性积液，右侧水平裂叶间积液，考虑胸膜炎及心包炎所致 肺功能测定：重度混合性肺通气功能障碍，最大通气量下降（FEV1/FVC：68.04%）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历7行-5
    [Documentation]    断言:"肺结核"
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=135    lowBldPress=60    personalHistory=    previousHistory=否认家族性遗传病史，除5年前可疑“结核性胸膜炎、腹膜炎”病史以外，否认其他传染病病史，无食物、药物过敏史。无烟酒嗜好。患者近年一直外出打工，没有从事特殊工种工作。否认先天性心脏病、慢性肺部及支气管疾病史，无慢性消化、内分泌、血液及神经系统疾病病史。
    ...    symptom=反复心慌、气促6年，再发加重伴咳嗽、腹胀1月#####巩膜轻度黄染。口唇及面颊可见轻度发绀，面色潮红，咽部稍充血，颈软，颈静脉怒张。双肺呼吸音粗糙，双肺散在干啰音，双下肺可闻及湿啰音，心界向左下扩大，心音尚可，心率104次/分，律齐，主动脉瓣听诊区可闻及2～3/6级舒张期叹气样杂音，未闻及心包摩擦音和心包叩击音，腹膨隆，肝肋下约4～5cm，质地中等，压痛（+），肝颈静脉回流征（+），移动性浊音可疑（+），肠鸣音正常存在，双下肢轻度凹陷性水肿，双侧足背动脉搏动正常，水冲脉及毛细血管搏动征等周围血管征（+）。 现病史:自6年前一次感冒受凉后开始出现心慌、气促，当时持续性发热达1月余，伴有咳嗽、咳痰、乏力、盗汗、腹胀纳差等症状，于我院进行相关检查发现“心脏扩大，心功能下降”，同时伴有胸腔和腹腔积液，常规抗感染治疗效果不佳，改用抗结核治疗后体温逐渐正常，且心慌、气促等症状明显缓解。此后患者因外出务工，没有进行复诊和继续坚持抗结核治疗，经常于劳累和感冒受凉后略感心慌、气短，但休息调养后均能缓解，未行正规诊疗。1月前受凉后心慌、气促症状再发加重，稍微活动即可出现症状，伴咳嗽、咳白色泡沫痰，腹胀纳差，在当地给以抗感染（具体不详）及支持对症治疗效果不佳，此后夜间咳嗽、咳痰频繁，严重时有阵发性呼吸困难，并出现双下肢轻微水肿。    weight=    assistCheck=心电图检查：窦性心动过速，电轴不偏NT-proBNP：1820pg/ml 胸片检查：双肺纹理增多、模糊，双下肺慢性感染并胸膜增厚，心影增大，心包广泛钙化 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液 超声心动图检查：双房增大，左室增大，右室饱满。主动脉瓣瓣尖增厚，回声增强，瓣缘粗糙，可见舒张期大量反流。心包增厚，回声增强，右室侧壁心包内可见强回声斑后伴声影，脏壁层粘连，心肌舒张受限，M型运动曲线示室间隔“弹跳征”，符合缩窄性心包炎声像图改变。可见肝静脉及下腔静脉扩张 腹部B超检查：肝脏体积增大，肝静脉增宽（考虑肝瘀血），脾脏增大，腹腔积液。肺部CT平扫：双侧胸膜及心包明显增厚，并可见多发结节状及条片状钙化，双侧叶间胸膜增厚，左侧后下胸腔局限性包裹性积液，右侧水平裂叶间积液，考虑胸膜炎及心包炎所致 肺功能测定：重度混合性肺通气功能障碍，最大通气量下降（FEV1/FVC：68.04%）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺结核

心脏科经典病历8行-1
    [Documentation]    断言:"感染性心内膜炎"
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=39.8    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=124    lowBldPress=30    personalHistory=    previousHistory=患者于7岁发现有先天性心脏病，四年前出现活动后胸闷，气促，伴呼吸困难，间断伴双下肢轻度水肿，心脏B超提示先天性心脏病，室间隔缺损（2cm），主动脉瓣二叶瓣畸形，行室间隔修补术和主动脉瓣置换手术，术后一般情况良好，坚持服用华法林抗凝治疗，能够胜任工作（司机），每半年复查一次心脏超声，术后前2年B超结果大致正常，2007年后多次复查心脏B超提示主动脉人工瓣存在瓣周漏，患者未行进一步住院治疗。无其他慢性病史。
    ...    symptom=发热伴乏力、体重下降1周#####患者贫血貌，精神很差，无力体型，被动体位。口唇轻度发绀，气管居中，无三凹征。心界略向左下扩大，主动脉瓣听诊区可闻及明显舒张期杂音，向腋下和胸骨左缘广泛传导，未闻及奔马律，颈静脉略充盈，肝颈征阳性，双下肢不肿。神经等系统检查未见异常。全身皮肤黏膜可见散在瘀点，可见指甲甲床出血，Osler结和Janeway损害 现病史:患者，男性，36岁，货车司机。一周前无明显诱因出现高热，最高体温41℃，发热时伴有寒战和头痛，同时伴明显的纳差、乏力、体重下降明显，同时，足趾和眼结膜处出现多发出血点，在当地医院给予抗生素联合治疗，体温下降不明显。因为患者有机械瓣置换手术史，当地医院考虑感染性心内膜炎可能，心脏B超提示主动脉瓣中至重度反流。其他化验检查结果提示中度贫血（HGB 84g/L），血小板减少（PLT 30×109/L）血沉稍快，    weight=    assistCheck=血常规．WBC 13.3G/L；HGB 84g/L；PLT 28×109/L。ESR40mm/h 动脉血气分析（未吸氧）：pH7.44，PaO2 68mmHg，PaCO2 34.2mmHg 心脏B超：主动脉瓣人工瓣置换术后伴重度关闭不全，瓣周脓肿形成。主动脉瓣多发赘生物形成，室间隔修补术后未见残余分流 血培养：金葡菌感染    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    感染性心内膜炎

心脏科经典病历8行-2
    [Documentation]    断言:"先天性心脏病"
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=39.8    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=124    lowBldPress=30    personalHistory=    previousHistory=患者于7岁发现有先天性心脏病，四年前出现活动后胸闷，气促，伴呼吸困难，间断伴双下肢轻度水肿，心脏B超提示先天性心脏病，室间隔缺损（2cm），主动脉瓣二叶瓣畸形，行室间隔修补术和主动脉瓣置换手术，术后一般情况良好，坚持服用华法林抗凝治疗，能够胜任工作（司机），每半年复查一次心脏超声，术后前2年B超结果大致正常，2007年后多次复查心脏B超提示主动脉人工瓣存在瓣周漏，患者未行进一步住院治疗。无其他慢性病史。
    ...    symptom=发热伴乏力、体重下降1周#####患者贫血貌，精神很差，无力体型，被动体位。口唇轻度发绀，气管居中，无三凹征。心界略向左下扩大，主动脉瓣听诊区可闻及明显舒张期杂音，向腋下和胸骨左缘广泛传导，未闻及奔马律，颈静脉略充盈，肝颈征阳性，双下肢不肿。神经等系统检查未见异常。全身皮肤黏膜可见散在瘀点，可见指甲甲床出血，Osler结和Janeway损害 现病史:患者，男性，36岁，货车司机。一周前无明显诱因出现高热，最高体温41℃，发热时伴有寒战和头痛，同时伴明显的纳差、乏力、体重下降明显，同时，足趾和眼结膜处出现多发出血点，在当地医院给予抗生素联合治疗，体温下降不明显。因为患者有机械瓣置换手术史，当地医院考虑感染性心内膜炎可能，心脏B超提示主动脉瓣中至重度反流。其他化验检查结果提示中度贫血（HGB 84g/L），血小板减少（PLT 30×109/L）血沉稍快，    weight=    assistCheck=血常规．WBC 13.3G/L；HGB 84g/L；PLT 28×109/L。ESR40mm/h 动脉血气分析（未吸氧）：pH7.44，PaO2 68mmHg，PaCO2 34.2mmHg 心脏B超：主动脉瓣人工瓣置换术后伴重度关闭不全，瓣周脓肿形成。主动脉瓣多发赘生物形成，室间隔修补术后未见残余分流 血培养：金葡菌感染    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历9行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=64    highBldPress=105    lowBldPress=60    personalHistory=    previousHistory=既往身体健康，否认家族遗传病史；月经、脾气正常
    ...    symptom=胸闷胸痛1月#####神智清晰，唇无发绀，颈静脉无怒张，胸廓无畸形，无胸膜摩擦感，双肺呼吸音清，未闻及干湿啰音，心界不大，无震颤，心率64次/分，律齐，未及病理性杂音，腹部查体未及异常，双下肢不肿，病理征未引出。 现病史:患者主要从事家务；起病前两周受凉后发生发热，最高达38.5℃，咽痛，咳嗽，全身乏力等症状，服用清热解痛药物效果不佳，后在当地予以静滴头孢类抗生素及对症，病情好转；1月前出现胸痛胸闷，无明显诱因发作，以左胸为主，运动时有所加重，不伴有咯血，晕厥，大汗情况    weight=    assistCheck=胸片：肺纹理稍粗，余未见异常 心电图：窦性心律，T波改变 结核芯片及抗体：正常；ENA正常；肿瘤全套正常。甲免全套FT3 3.9pmol/l，FT4 15.1pmol/l，TSH 4.433uIu SPECT：静息状态下左心室部分前壁缺血，左心室收缩功能稍低。运动状态下，左心室心尖缺血前壁及下壁血流灌注减低 冠脉造影：三支主干及主要分支未见异常；中间支中远端壁冠状动脉；左室前壁局部强化程度略低， 病毒检查 CoxB3-IgM（+），巨细胞病毒IgM（+），EVsRNA（+）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病毒性心肌炎

心脏科经典病历10行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=110    lowBldPress=80    personalHistory=    previousHistory=既往身体健康，其父48岁时猝死，吸烟史30年；
    ...    symptom=间断发作性胸痛3年，再发加重1天#####心率80次/分，律齐，胸骨左缘第3～4肋间可及Ⅳ/6SM，喷射样。腹平软，肝脾肋下未触及肿大，双肾区无叩痛，腹部未及血管杂音，肠鸣音正常。 现病史:患者为农民，男，56岁，间断性发作胸痛3年，再发加重1天入院；患者3年前出现胸痛，主要在活动时或者情绪激动中发生，数分钟内可逐渐缓解，部位以左侧为重，间断发作过6次，未有晕厥等其他不适，未曾去医疗机构诊疗。入院前一天，患者在劳作时再次出现胸痛，且明显比以前重，立即停下休息，半小时不能缓解，伴有胸闷，大汗；无头昏晕厥，无咯血、咳泡沫痰情况，无心慌、心悸，也未伴有恶心呕吐发生。    weight=    assistCheck=大生化检查：肝功能：TB 21.2μmol/L；CB 8.3μmol/L；ALT 14 U/L；AST 11 U/L；TP 52.9g/L；A 36.2g/L；Glu 5.76mmol/L；TC 2.63mmol/L；TG 0.82mmol/L；HDL 1.25mmol/L；LDL 1.21mmol/L 心电图：窦性心律，ST-T改变 胸片：双肺纹理略粗，左心影稍大 超声心电图：室间隔中段增厚，左室流出道血流稍快，不排除非对称性肥厚型心肌病 胸腹CTA：升主动脉局部呈“双边”样改变，考虑血管搏动伪影所致，余血管未见异常；左肾两支动脉供血。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肥厚型心肌病

心脏科经典病历11行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=84    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=否认家族性遗传病史，无结核、乙肝、血吸虫病史，无药物过敏史。有吸烟史、饮酒（3两/日）史20余年
    ...    symptom=劳力性气促12年，腹胀、下肢水肿4个月#####慢性病容，步入病房，自动体位，查体合作。巩膜轻-中度黄染。颈软，颈静脉怒张，肝颈静脉回流征阳性。双肺呼吸音清，心率84次/分，律不齐，各瓣膜听诊区未及杂音，心浊音界扩大。肝肋下7cm质中等，脾肋下约5cm，移动性浊音（＋）。肠鸣音正常存在，双下肢中度凹陷性水肿，双侧足背动脉搏动正常。 现病史:患者于12年（1995年）前上四层楼时心慌气促。2001年2月28日突发咳嗽、咯血、咳脓痰、痰带血，不伴发热，体检心前区2/6级收缩期杂音，两肺可闻及干性啰音，胸片示肺部感染、心脏扩大，出院后一直服用培哚普利和比索洛尔等治疗，平时无明显症状。4个月前无明显诱因出现腹胀、双下肢水肿，伴有夜间阵发性呼吸困难，患者无腹痛，无恶心呕吐，食欲正常。大便每日1～2次，均为成形黄色软便，尿色黄、无尿痛、尿量800毫升/日左右，肝脏超声示“肝瘀血肿大，脾脏肿大，腹腔积液”，8月1日转心内科。发病来睡眠可，体重逐渐增加。    weight=    assistCheck=心电图检查：心房颤动，电轴右偏，极度顺向转位；TⅠ、Ⅱ、avF、avL、V5-V6低平、双向、倒置；STV6下移0.15mv腹部B超：肝瘀血肿大，门静脉增宽并门静脉高压，脾脏增大，腹腔积液，下腔静脉增宽 心脏平扫示：左心房、右心房体积明显增大 超声心动图检查：升主动脉3.4，肺动脉主干3.1；左房横径7.6，左室4.7，室间隔1.4，巨大右房横径9.1cm、长径15cm，右室5.2；二尖瓣形态、开放可、闭合不良，三尖瓣形态、开放可、闭合不良，见1.3cm的缝隙；室间隔增厚，与左后室壁呈同向运动，左室后壁基底段稍薄，厚约0.7cm，增厚部位室壁活动幅度减低；心脏各结构未见连续中断；FS 30%，EF 57%。CDFI：二尖瓣口舒张期频谱示E/A＞2，可见E-E不等。E峰减速时间110ms，左室流出道收缩血流未见明显梗阻。心包腔内见少量液性暗区，后室间沟暗区厚约1.3cm，右房顶部暗区约0.6cm，未见心包膜增厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    限制型心肌病

心脏科经典病历11行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=84    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=否认家族性遗传病史，无结核、乙肝、血吸虫病史，无药物过敏史。有吸烟史、饮酒（3两/日）史20余年
    ...    symptom=劳力性气促12年，腹胀、下肢水肿4个月#####慢性病容，步入病房，自动体位，查体合作。巩膜轻-中度黄染。颈软，颈静脉怒张，肝颈静脉回流征阳性。双肺呼吸音清，心率84次/分，律不齐，各瓣膜听诊区未及杂音，心浊音界扩大。肝肋下7cm质中等，脾肋下约5cm，移动性浊音（＋）。肠鸣音正常存在，双下肢中度凹陷性水肿，双侧足背动脉搏动正常。 现病史:患者于12年（1995年）前上四层楼时心慌气促。2001年2月28日突发咳嗽、咯血、咳脓痰、痰带血，不伴发热，体检心前区2/6级收缩期杂音，两肺可闻及干性啰音，胸片示肺部感染、心脏扩大，出院后一直服用培哚普利和比索洛尔等治疗，平时无明显症状。4个月前无明显诱因出现腹胀、双下肢水肿，伴有夜间阵发性呼吸困难，患者无腹痛，无恶心呕吐，食欲正常。大便每日1～2次，均为成形黄色软便，尿色黄、无尿痛、尿量800毫升/日左右，肝脏超声示“肝瘀血肿大，脾脏肿大，腹腔积液”，8月1日转心内科。发病来睡眠可，体重逐渐增加。    weight=    assistCheck=心电图检查：心房颤动，电轴右偏，极度顺向转位；TⅠ、Ⅱ、avF、avL、V5-V6低平、双向、倒置；STV6下移0.15mv腹部B超：肝瘀血肿大，门静脉增宽并门静脉高压，脾脏增大，腹腔积液，下腔静脉增宽 心脏平扫示：左心房、右心房体积明显增大 超声心动图检查：升主动脉3.4，肺动脉主干3.1；左房横径7.6，左室4.7，室间隔1.4，巨大右房横径9.1cm、长径15cm，右室5.2；二尖瓣形态、开放可、闭合不良，三尖瓣形态、开放可、闭合不良，见1.3cm的缝隙；室间隔增厚，与左后室壁呈同向运动，左室后壁基底段稍薄，厚约0.7cm，增厚部位室壁活动幅度减低；心脏各结构未见连续中断；FS 30%，EF 57%。CDFI：二尖瓣口舒张期频谱示E/A＞2，可见E-E不等。E峰减速时间110ms，左室流出道收缩血流未见明显梗阻。心包腔内见少量液性暗区，后室间沟暗区厚约1.3cm，右房顶部暗区约0.6cm，未见心包膜增厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心房颤动

心脏科经典病历11行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=84    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=否认家族性遗传病史，无结核、乙肝、血吸虫病史，无药物过敏史。有吸烟史、饮酒（3两/日）史20余年
    ...    symptom=劳力性气促12年，腹胀、下肢水肿4个月#####慢性病容，步入病房，自动体位，查体合作。巩膜轻-中度黄染。颈软，颈静脉怒张，肝颈静脉回流征阳性。双肺呼吸音清，心率84次/分，律不齐，各瓣膜听诊区未及杂音，心浊音界扩大。肝肋下7cm质中等，脾肋下约5cm，移动性浊音（＋）。肠鸣音正常存在，双下肢中度凹陷性水肿，双侧足背动脉搏动正常。 现病史:患者于12年（1995年）前上四层楼时心慌气促。2001年2月28日突发咳嗽、咯血、咳脓痰、痰带血，不伴发热，体检心前区2/6级收缩期杂音，两肺可闻及干性啰音，胸片示肺部感染、心脏扩大，出院后一直服用培哚普利和比索洛尔等治疗，平时无明显症状。4个月前无明显诱因出现腹胀、双下肢水肿，伴有夜间阵发性呼吸困难，患者无腹痛，无恶心呕吐，食欲正常。大便每日1～2次，均为成形黄色软便，尿色黄、无尿痛、尿量800毫升/日左右，肝脏超声示“肝瘀血肿大，脾脏肿大，腹腔积液”，8月1日转心内科。发病来睡眠可，体重逐渐增加。    weight=    assistCheck=心电图检查：心房颤动，电轴右偏，极度顺向转位；TⅠ、Ⅱ、avF、avL、V5-V6低平、双向、倒置；STV6下移0.15mv腹部B超：肝瘀血肿大，门静脉增宽并门静脉高压，脾脏增大，腹腔积液，下腔静脉增宽 心脏平扫示：左心房、右心房体积明显增大 超声心动图检查：升主动脉3.4，肺动脉主干3.1；左房横径7.6，左室4.7，室间隔1.4，巨大右房横径9.1cm、长径15cm，右室5.2；二尖瓣形态、开放可、闭合不良，三尖瓣形态、开放可、闭合不良，见1.3cm的缝隙；室间隔增厚，与左后室壁呈同向运动，左室后壁基底段稍薄，厚约0.7cm，增厚部位室壁活动幅度减低；心脏各结构未见连续中断；FS 30%，EF 57%。CDFI：二尖瓣口舒张期频谱示E/A＞2，可见E-E不等。E峰减速时间110ms，左室流出道收缩血流未见明显梗阻。心包腔内见少量液性暗区，后室间沟暗区厚约1.3cm，右房顶部暗区约0.6cm，未见心包膜增厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

心脏科经典病历11行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=84    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=否认家族性遗传病史，无结核、乙肝、血吸虫病史，无药物过敏史。有吸烟史、饮酒（3两/日）史20余年
    ...    symptom=劳力性气促12年，腹胀、下肢水肿4个月#####慢性病容，步入病房，自动体位，查体合作。巩膜轻-中度黄染。颈软，颈静脉怒张，肝颈静脉回流征阳性。双肺呼吸音清，心率84次/分，律不齐，各瓣膜听诊区未及杂音，心浊音界扩大。肝肋下7cm质中等，脾肋下约5cm，移动性浊音（＋）。肠鸣音正常存在，双下肢中度凹陷性水肿，双侧足背动脉搏动正常。 现病史:患者于12年（1995年）前上四层楼时心慌气促。2001年2月28日突发咳嗽、咯血、咳脓痰、痰带血，不伴发热，体检心前区2/6级收缩期杂音，两肺可闻及干性啰音，胸片示肺部感染、心脏扩大，出院后一直服用培哚普利和比索洛尔等治疗，平时无明显症状。4个月前无明显诱因出现腹胀、双下肢水肿，伴有夜间阵发性呼吸困难，患者无腹痛，无恶心呕吐，食欲正常。大便每日1～2次，均为成形黄色软便，尿色黄、无尿痛、尿量800毫升/日左右，肝脏超声示“肝瘀血肿大，脾脏肿大，腹腔积液”，8月1日转心内科。发病来睡眠可，体重逐渐增加。    weight=    assistCheck=心电图检查：心房颤动，电轴右偏，极度顺向转位；TⅠ、Ⅱ、avF、avL、V5-V6低平、双向、倒置；STV6下移0.15mv腹部B超：肝瘀血肿大，门静脉增宽并门静脉高压，脾脏增大，腹腔积液，下腔静脉增宽 心脏平扫示：左心房、右心房体积明显增大 超声心动图检查：升主动脉3.4，肺动脉主干3.1；左房横径7.6，左室4.7，室间隔1.4，巨大右房横径9.1cm、长径15cm，右室5.2；二尖瓣形态、开放可、闭合不良，三尖瓣形态、开放可、闭合不良，见1.3cm的缝隙；室间隔增厚，与左后室壁呈同向运动，左室后壁基底段稍薄，厚约0.7cm，增厚部位室壁活动幅度减低；心脏各结构未见连续中断；FS 30%，EF 57%。CDFI：二尖瓣口舒张期频谱示E/A＞2，可见E-E不等。E峰减速时间110ms，左室流出道收缩血流未见明显梗阻。心包腔内见少量液性暗区，后室间沟暗区厚约1.3cm，右房顶部暗区约0.6cm，未见心包膜增厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肝硬化

心脏科经典病历12行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=140    highBldPress=107    lowBldPress=60    personalHistory=    previousHistory=既往体健，5个月前顺产一子，目前为哺乳期。否认“高血压”、“糖尿病”、“冠心病”病史，否认“肝炎”、“结核”等传染病病史，否认手术史、外伤史、输血史，否认药物及食物过敏史
    ...    symptom=间断心悸5年，加重1天#####痛苦面容，心率140次/分，律齐，心音正常，各瓣膜区未闻及病理性杂音 现病史:患者近5年间断出现心悸，与活动、情绪激动无关，发作呈突发突止，持续约1～2分钟，行下蹲或闭气等动作可缓解，后心悸发作渐频繁，但均可自行终止，未引起重视。于昨日晚餐后无诱因再次感心悸，不伴胸闷、气短、出汗、肢体麻木、恶心、呕吐等，行下蹲或闭气等动作症状不缓解，于今晨就诊。    weight=    assistCheck=心电图示：心律失常：阵发性室上性心动过速 化验心肌酶、血细胞分析、胸片等正常 血细胞分析：白细胞5.2×109/L，红细胞4.62×1012/L，血小板221×109/L，中性粒细胞百分比0.573 心脏彩超：各瓣膜未见病理性反流，左室收缩、舒张功能正常    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心律失常

心脏科经典病历12行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=140    highBldPress=107    lowBldPress=60    personalHistory=    previousHistory=既往体健，5个月前顺产一子，目前为哺乳期。否认“高血压”、“糖尿病”、“冠心病”病史，否认“肝炎”、“结核”等传染病病史，否认手术史、外伤史、输血史，否认药物及食物过敏史
    ...    symptom=间断心悸5年，加重1天#####痛苦面容，心率140次/分，律齐，心音正常，各瓣膜区未闻及病理性杂音 现病史:患者近5年间断出现心悸，与活动、情绪激动无关，发作呈突发突止，持续约1～2分钟，行下蹲或闭气等动作可缓解，后心悸发作渐频繁，但均可自行终止，未引起重视。于昨日晚餐后无诱因再次感心悸，不伴胸闷、气短、出汗、肢体麻木、恶心、呕吐等，行下蹲或闭气等动作症状不缓解，于今晨就诊。    weight=    assistCheck=心电图示：心律失常：阵发性室上性心动过速 化验心肌酶、血细胞分析、胸片等正常 血细胞分析：白细胞5.2×109/L，红细胞4.62×1012/L，血小板221×109/L，中性粒细胞百分比0.573 心脏彩超：各瓣膜未见病理性反流，左室收缩、舒张功能正常    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    阵发性室上性心动过速

心脏科经典病历13行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历13行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性心肌梗死

心脏科经典病历13行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心律失常

心脏科经典病历13行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    Ⅱ度房室传导阻滞

心脏科经典病历13行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    Ⅲ度房室传导阻滞

心脏科经典病历13行-6
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历13行-7
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均死于肺部疾病，否认其他家族遗传及传染病史
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，现居于原籍。未到过疫区，无有害及放射物接触史。吸烟史30余年，2～3盒/日。近2个月有间断大量饮酒史    previousHistory=既往有糖尿病史及高血压史，平素血糖及血压均控制欠佳。4年前有脑梗死病史，目前右侧肢体活动尚可。
    ...    symptom=发作性胸闷1天#####BP 104/78mmHg，唇无发绀，双肺呼吸音粗，左肺底偶可闻及湿啰音。心率54次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未触及。右下肢无水肿，左下肢缺如。 现病史:进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    weight=    assistCheck=进食后出现胸闷伴心悸，之后出现恶心、呕吐，呕吐物为胃内容物，且伴有出汗，呕吐后胸闷症状缓解，但仍有恶心，持续3～4小时后就诊于本院，当时测血压为129/95mmHg，行心电图提示Ⅱ、Ⅲ、aVF、V4～V9导联ST段抬高0.1～0.5mV，V3R～V5R导联ST段抬高0.1～0.3mV，Ⅰ、aVL导联ST段压低0.1～0.3mV，三度房室传导阻滞，室性及交界性逸搏心律。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    脑梗死

心脏科经典病历14行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=52    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=100    highBldPress=199    lowBldPress=87    personalHistory=    previousHistory=患者2010年患脑出血时发现血压高，最高 230/140mmHg，不规律服用利血平，血压控制不详。否认糖尿病及家族史。无吸烟史。
    ...    symptom=持续性心前区憋痛伴背痛、大汗3天#####BP 199/87mmHg，口唇无发绀。颈静脉无怒张。双肺呼吸音清，未闻及干、湿啰音。HR 100次/分，律齐，各瓣膜听诊区未闻及杂音。腹软，无压痛、反跳痛，肝、脾未触及。双下肢无水肿 现病史:患者于2010年4月27日午餐后劳动过程中突发心前区闷痛，以剑突下憋胀为著，伴气短、心悸，后背胀痛、大汗。就诊于当地县医院，测血压200/100mmHg，心电图示：Ⅰ、aVL、V5～V9导联ST段压低，V1～V3导联ST段抬高，诊断“高血压3级，急性冠脉综合征”，予降压、扩冠及对症处理，症状持续3～4小时后缓解。为求进一步诊治于4月30日转入本科。转入本科后仍感腹胀，给予灌肠一次，解少许稀水样便    weight=    assistCheck="心电图：窦性心律，Ⅰ、aVL、V5～V9导联ST段压低，V1～V3导联r波递增不良，ST段抬高0.1～0.2mV。胸片：双肺感染，心影增大。心脏彩超：左房（29mm）、左室（42mm）室壁运动协调，各瓣膜回声及活动正常，未见异常血流，EF值59%。胸腔B超：双侧胸腔少量积液，心包腔少量积液。化验：心肌酶：CK 672.5IU/L，CK-MB 64.2IU/L。心肌梗死三项：肌红蛋白19.4ng/ml，CK-MB 0.60ng/ml，cTnI 0.01ng/ml。血生化：正常 主动脉增强CT示：主动脉夹层伴血栓形成。血常规：WBC 13.44×109/L，N 85.5%，L 8.6%，Hb 143g/L。血气：PO2 55.1mmHg，PCO2 42.2mmHg，SaO2 90.7%，pH 7.477。血沉68mm/h。凝血检查：APTT 24.2秒，FIB-C 5.83g/L，D-二聚体1076ng/ml"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉夹层

心脏科经典病历14行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=52    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=100    highBldPress=199    lowBldPress=87    personalHistory=    previousHistory=患者2010年患脑出血时发现血压高，最高 230/140mmHg，不规律服用利血平，血压控制不详。否认糖尿病及家族史。无吸烟史。
    ...    symptom=持续性心前区憋痛伴背痛、大汗3天#####BP 199/87mmHg，口唇无发绀。颈静脉无怒张。双肺呼吸音清，未闻及干、湿啰音。HR 100次/分，律齐，各瓣膜听诊区未闻及杂音。腹软，无压痛、反跳痛，肝、脾未触及。双下肢无水肿 现病史:患者于2010年4月27日午餐后劳动过程中突发心前区闷痛，以剑突下憋胀为著，伴气短、心悸，后背胀痛、大汗。就诊于当地县医院，测血压200/100mmHg，心电图示：Ⅰ、aVL、V5～V9导联ST段压低，V1～V3导联ST段抬高，诊断“高血压3级，急性冠脉综合征”，予降压、扩冠及对症处理，症状持续3～4小时后缓解。为求进一步诊治于4月30日转入本科。转入本科后仍感腹胀，给予灌肠一次，解少许稀水样便    weight=    assistCheck="心电图：窦性心律，Ⅰ、aVL、V5～V9导联ST段压低，V1～V3导联r波递增不良，ST段抬高0.1～0.2mV。胸片：双肺感染，心影增大。心脏彩超：左房（29mm）、左室（42mm）室壁运动协调，各瓣膜回声及活动正常，未见异常血流，EF值59%。胸腔B超：双侧胸腔少量积液，心包腔少量积液。化验：心肌酶：CK 672.5IU/L，CK-MB 64.2IU/L。心肌梗死三项：肌红蛋白19.4ng/ml，CK-MB 0.60ng/ml，cTnI 0.01ng/ml。血生化：正常 主动脉增强CT示：主动脉夹层伴血栓形成。血常规：WBC 13.44×109/L，N 85.5%，L 8.6%，Hb 143g/L。血气：PO2 55.1mmHg，PCO2 42.2mmHg，SaO2 90.7%，pH 7.477。血沉68mm/h。凝血检查：APTT 24.2秒，FIB-C 5.83g/L，D-二聚体1076ng/ml"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胸腔积液

心脏科经典病历14行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=52    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=100    highBldPress=199    lowBldPress=87    personalHistory=    previousHistory=患者2010年患脑出血时发现血压高，最高 230/140mmHg，不规律服用利血平，血压控制不详。否认糖尿病及家族史。无吸烟史。
    ...    symptom=持续性心前区憋痛伴背痛、大汗3天#####BP 199/87mmHg，口唇无发绀。颈静脉无怒张。双肺呼吸音清，未闻及干、湿啰音。HR 100次/分，律齐，各瓣膜听诊区未闻及杂音。腹软，无压痛、反跳痛，肝、脾未触及。双下肢无水肿 现病史:患者于2010年4月27日午餐后劳动过程中突发心前区闷痛，以剑突下憋胀为著，伴气短、心悸，后背胀痛、大汗。就诊于当地县医院，测血压200/100mmHg，心电图示：Ⅰ、aVL、V5～V9导联ST段压低，V1～V3导联ST段抬高，诊断“高血压3级，急性冠脉综合征”，予降压、扩冠及对症处理，症状持续3～4小时后缓解。为求进一步诊治于4月30日转入本科。转入本科后仍感腹胀，给予灌肠一次，解少许稀水样便    weight=    assistCheck="心电图：窦性心律，Ⅰ、aVL、V5～V9导联ST段压低，V1～V3导联r波递增不良，ST段抬高0.1～0.2mV。胸片：双肺感染，心影增大。心脏彩超：左房（29mm）、左室（42mm）室壁运动协调，各瓣膜回声及活动正常，未见异常血流，EF值59%。胸腔B超：双侧胸腔少量积液，心包腔少量积液。化验：心肌酶：CK 672.5IU/L，CK-MB 64.2IU/L。心肌梗死三项：肌红蛋白19.4ng/ml，CK-MB 0.60ng/ml，cTnI 0.01ng/ml。血生化：正常 主动脉增强CT示：主动脉夹层伴血栓形成。血常规：WBC 13.44×109/L，N 85.5%，L 8.6%，Hb 143g/L。血气：PO2 55.1mmHg，PCO2 42.2mmHg，SaO2 90.7%，pH 7.477。血沉68mm/h。凝血检查：APTT 24.2秒，FIB-C 5.83g/L，D-二聚体1076ng/ml"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压
    # 心脏科经典病历15行
    #    [Documentation]    断言:""
    #    ${getRes}    智能诊断3.0
    #    ...    age=25    ageType=岁
    #    ...    allergyHistory=
    #    ...    bodyTempr=
    #    ...    familyHistory=生于原籍，无放射性等有害物质接触史，不吸烟，饮酒史10年，半斤/次，约2次/月
    #    ...    gender=1
    #    ...    heartRate=75
    #    ...    highBldPress=160
    #    ...    lowBldPress=120
    #    ...    personalHistory=生于原籍，无放射性等有害物质接触史，不吸烟，饮酒史10年，半斤/次，约2次/月
    #    ...    previousHistory=2008年偶测血压升高，当时血压为130/90mmHg，无症状，未治疗。2011年7月25日感冒后饮酒时出现头晕、恶心，当时未测血压，但症状持续不缓解。7月28日上述症状再次发生，伴视物模糊，当时血压220/160mmHg，就诊于当地医院，诊断为高血压3级，化验血肌酐、尿素氮升高，血钾偏低（具体数值不详），先后给予美托洛尔、左氨氯地平、硝苯地平控释片、替米沙坦、吲达帕胺等药物降压治疗，血压控制于115/80mmHg
    #    ...    symptom=发现血压高3年，加重伴头晕、黑矇10天#####BP左180/120mmHg，右160/120mmHg，肥胖体型，神志清，查体合作。全身皮肤无黄染，无出血点。双侧眼睑无水肿，双侧瞳孔等大圆，对光反射灵敏。唇无发绀。双肺呼吸音清，未闻及干、湿啰音。心尖搏动有力，心界叩诊向左扩大，心率75次/分，律齐，A2＞P2，各瓣膜区未闻及杂音。腹平软，无压痛，未闻及血管杂音。双下肢无水肿。 现病史:2008年偶测血压升高，当时血压为130/90mmHg，无症状，未治疗。2011年7月25日感冒后饮酒时出现头晕、恶心，当时未测血压，但症状持续不缓解。7月28日上述症状再次发生，伴视物模糊，当时血压220/160mmHg，就诊于当地医院，诊断为高血压3级，化验血肌酐、尿素氮升高，血钾偏低（具体数值不详），先后给予美托洛尔、左氨氯地平、硝苯地平控释片、替米沙坦、吲达帕胺等药物降压治疗，血压控制于115/80mmHg
    #    ...    weight=
    #    ...    assistCheck=血常规RBC 3.75×1012/L↓，Hb 119g/L↓。尿蛋白＋。血沉30mm/h。hs-CRP 7.96mg/L。尿素氮18.18mmol/L，血肌酐424.3μmol/L。血钾3.21mmol/L。超声心动图：LA 39mm，LV 59mm，EF 61%。双侧肾上腺CT未见明显异常。颅脑及脑动脉成像未见明显异常。肾脏及肾动脉彩超：双肾实质回声增强，双肾动脉未见异常。眼底视网膜动脉硬化。卧位肾素活性3304.1pg/（ml • h），醛固酮0.1pg/ml；立位肾素活性5406.8pg/（ml • h），醛固酮0.13pg/ml
    #    ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    #    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    #    Should Contain    ${aj[:10]}    高血压

心脏科经典病历16行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=父亲患高血压。
    ...    gender=0    heartRate=48    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压6年，最高血压160/100mmHg，自述一直规律服利血平，血压控制可。无糖尿病及高脂血症。无传染病史，无药物过敏史。
    ...    symptom=发作性晕厥9天#####神志清楚，呼吸平稳，自动体位。双肺呼吸音清，未及干湿啰音。心界不大，心率48次/分，律不齐，各瓣膜区未及杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者为农民，主要从事家务。9天前晨起时突发心慌，自觉心跳不规则，伴头晕、乏力、恶心，起床小便途中发生晕厥，家属诉伴面色苍白，冷汗，大小便失禁，意识丧失约3分钟后自行恢复，不伴肢体抽搐与偏瘫。为求进一步诊治而来我院，门诊以“晕厥原因待查”收入。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病窦综合征

心脏科经典病历16行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=父亲患高血压。
    ...    gender=0    heartRate=48    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压6年，最高血压160/100mmHg，自述一直规律服利血平，血压控制可。无糖尿病及高脂血症。无传染病史，无药物过敏史。
    ...    symptom=发作性晕厥9天#####神志清楚，呼吸平稳，自动体位。双肺呼吸音清，未及干湿啰音。心界不大，心率48次/分，律不齐，各瓣膜区未及杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者为农民，主要从事家务。9天前晨起时突发心慌，自觉心跳不规则，伴头晕、乏力、恶心，起床小便途中发生晕厥，家属诉伴面色苍白，冷汗，大小便失禁，意识丧失约3分钟后自行恢复，不伴肢体抽搐与偏瘫。为求进一步诊治而来我院，门诊以“晕厥原因待查”收入。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    窦性停搏

心脏科经典病历16行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=父亲患高血压。
    ...    gender=0    heartRate=48    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压6年，最高血压160/100mmHg，自述一直规律服利血平，血压控制可。无糖尿病及高脂血症。无传染病史，无药物过敏史。
    ...    symptom=发作性晕厥9天#####神志清楚，呼吸平稳，自动体位。双肺呼吸音清，未及干湿啰音。心界不大，心率48次/分，律不齐，各瓣膜区未及杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者为农民，主要从事家务。9天前晨起时突发心慌，自觉心跳不规则，伴头晕、乏力、恶心，起床小便途中发生晕厥，家属诉伴面色苍白，冷汗，大小便失禁，意识丧失约3分钟后自行恢复，不伴肢体抽搐与偏瘫。为求进一步诊治而来我院，门诊以“晕厥原因待查”收入。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

心脏科经典病历17行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=66    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压病史，血压最高达180/90mmHg，有高脂血症病史。近1年不规律应用降压药物，具体不详，血压未监测
    ...    symptom=胸闷、心悸5天，加重2小时#####发育正常，营养良好，肥胖体型，神志清楚，精神不振。T 36.7℃；P 66次/分；R 24次/分；BP 140/70mmHg；SaO299%。体重70kg，身高160cm。胸部：胸廓对称，双肺叩清音，双肺听诊呼吸音粗，双肺底闻及少量湿啰音 现病史:患者5天前活动时出现胸闷、心悸，主要于爬坡及提重物上楼时出现，持续3～5分钟，休息后略有缓解，无心前区压榨样疼痛，未予诊治。今日上述症状明显加重，于轻微体力活动时即可出现，伴有压榨样疼痛，自服救心丸，缓解不明显。并在2小时前于休息时突发胸痛伴大汗，有腹胀，遂来医院急诊。患者自发病来，神志清楚，精神不佳，今日未进食，尿量正常，未排大便    weight=70    assistCheck="血常规：WBC 13.9×109/L；N 48.5%；Hb 112g/L；PLT 123×109/L。 心肌标志物：CK-MB 1.8ng/ml；MB 95.3ng/ml；cTnI＜0.05ng/ml。 BNP：25.6pg/ml。 D-二聚体：1150ng/ml。 心电图示：Ⅱ、Ⅲ、aVF导联T波直立高耸，Ⅰ、aVL、V3～V5导联T波倒置。Ⅲ、aVF导联ST段抬高0.05mV，Ⅰ、aVL、V4～V6导联ST段下移0.05～0.15mV"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历17行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=66    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压病史，血压最高达180/90mmHg，有高脂血症病史。近1年不规律应用降压药物，具体不详，血压未监测
    ...    symptom=胸闷、心悸5天，加重2小时#####发育正常，营养良好，肥胖体型，神志清楚，精神不振。T 36.7℃；P 66次/分；R 24次/分；BP 140/70mmHg；SaO299%。体重70kg，身高160cm。胸部：胸廓对称，双肺叩清音，双肺听诊呼吸音粗，双肺底闻及少量湿啰音 现病史:患者5天前活动时出现胸闷、心悸，主要于爬坡及提重物上楼时出现，持续3～5分钟，休息后略有缓解，无心前区压榨样疼痛，未予诊治。今日上述症状明显加重，于轻微体力活动时即可出现，伴有压榨样疼痛，自服救心丸，缓解不明显。并在2小时前于休息时突发胸痛伴大汗，有腹胀，遂来医院急诊。患者自发病来，神志清楚，精神不佳，今日未进食，尿量正常，未排大便    weight=70    assistCheck="血常规：WBC 13.9×109/L；N 48.5%；Hb 112g/L；PLT 123×109/L。 心肌标志物：CK-MB 1.8ng/ml；MB 95.3ng/ml；cTnI＜0.05ng/ml。 BNP：25.6pg/ml。 D-二聚体：1150ng/ml。 心电图示：Ⅱ、Ⅲ、aVF导联T波直立高耸，Ⅰ、aVL、V3～V5导联T波倒置。Ⅲ、aVF导联ST段抬高0.05mV，Ⅰ、aVL、V4～V6导联ST段下移0.05～0.15mV"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    不稳定性心绞痛

心脏科经典病历17行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=66    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压病史，血压最高达180/90mmHg，有高脂血症病史。近1年不规律应用降压药物，具体不详，血压未监测
    ...    symptom=胸闷、心悸5天，加重2小时#####发育正常，营养良好，肥胖体型，神志清楚，精神不振。T 36.7℃；P 66次/分；R 24次/分；BP 140/70mmHg；SaO299%。体重70kg，身高160cm。胸部：胸廓对称，双肺叩清音，双肺听诊呼吸音粗，双肺底闻及少量湿啰音 现病史:患者5天前活动时出现胸闷、心悸，主要于爬坡及提重物上楼时出现，持续3～5分钟，休息后略有缓解，无心前区压榨样疼痛，未予诊治。今日上述症状明显加重，于轻微体力活动时即可出现，伴有压榨样疼痛，自服救心丸，缓解不明显。并在2小时前于休息时突发胸痛伴大汗，有腹胀，遂来医院急诊。患者自发病来，神志清楚，精神不佳，今日未进食，尿量正常，未排大便    weight=70    assistCheck="血常规：WBC 13.9×109/L；N 48.5%；Hb 112g/L；PLT 123×109/L。 心肌标志物：CK-MB 1.8ng/ml；MB 95.3ng/ml；cTnI＜0.05ng/ml。 BNP：25.6pg/ml。 D-二聚体：1150ng/ml。 心电图示：Ⅱ、Ⅲ、aVF导联T波直立高耸，Ⅰ、aVL、V3～V5导联T波倒置。Ⅲ、aVF导联ST段抬高0.05mV，Ⅰ、aVL、V4～V6导联ST段下移0.05～0.15mV"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心肌梗塞

心脏科经典病历17行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=66    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压病史，血压最高达180/90mmHg，有高脂血症病史。近1年不规律应用降压药物，具体不详，血压未监测
    ...    symptom=胸闷、心悸5天，加重2小时#####发育正常，营养良好，肥胖体型，神志清楚，精神不振。T 36.7℃；P 66次/分；R 24次/分；BP 140/70mmHg；SaO299%。体重70kg，身高160cm。胸部：胸廓对称，双肺叩清音，双肺听诊呼吸音粗，双肺底闻及少量湿啰音 现病史:患者5天前活动时出现胸闷、心悸，主要于爬坡及提重物上楼时出现，持续3～5分钟，休息后略有缓解，无心前区压榨样疼痛，未予诊治。今日上述症状明显加重，于轻微体力活动时即可出现，伴有压榨样疼痛，自服救心丸，缓解不明显。并在2小时前于休息时突发胸痛伴大汗，有腹胀，遂来医院急诊。患者自发病来，神志清楚，精神不佳，今日未进食，尿量正常，未排大便    weight=70    assistCheck="血常规：WBC 13.9×109/L；N 48.5%；Hb 112g/L；PLT 123×109/L。 心肌标志物：CK-MB 1.8ng/ml；MB 95.3ng/ml；cTnI＜0.05ng/ml。 BNP：25.6pg/ml。 D-二聚体：1150ng/ml。 心电图示：Ⅱ、Ⅲ、aVF导联T波直立高耸，Ⅰ、aVL、V3～V5导联T波倒置。Ⅲ、aVF导联ST段抬高0.05mV，Ⅰ、aVL、V4～V6导联ST段下移0.05～0.15mV"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历17行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=66    highBldPress=140    lowBldPress=70    personalHistory=    previousHistory=既往有高血压病史，血压最高达180/90mmHg，有高脂血症病史。近1年不规律应用降压药物，具体不详，血压未监测
    ...    symptom=胸闷、心悸5天，加重2小时#####发育正常，营养良好，肥胖体型，神志清楚，精神不振。T 36.7℃；P 66次/分；R 24次/分；BP 140/70mmHg；SaO299%。体重70kg，身高160cm。胸部：胸廓对称，双肺叩清音，双肺听诊呼吸音粗，双肺底闻及少量湿啰音 现病史:患者5天前活动时出现胸闷、心悸，主要于爬坡及提重物上楼时出现，持续3～5分钟，休息后略有缓解，无心前区压榨样疼痛，未予诊治。今日上述症状明显加重，于轻微体力活动时即可出现，伴有压榨样疼痛，自服救心丸，缓解不明显。并在2小时前于休息时突发胸痛伴大汗，有腹胀，遂来医院急诊。患者自发病来，神志清楚，精神不佳，今日未进食，尿量正常，未排大便    weight=70    assistCheck="血常规：WBC 13.9×109/L；N 48.5%；Hb 112g/L；PLT 123×109/L。 心肌标志物：CK-MB 1.8ng/ml；MB 95.3ng/ml；cTnI＜0.05ng/ml。 BNP：25.6pg/ml。 D-二聚体：1150ng/ml。 心电图示：Ⅱ、Ⅲ、aVF导联T波直立高耸，Ⅰ、aVL、V3～V5导联T波倒置。Ⅲ、aVF导联ST段抬高0.05mV，Ⅰ、aVL、V4～V6导联ST段下移0.05～0.15mV"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高脂血症

心脏科经典病历18行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=有高血压、糖尿病病史
    ...    symptom=突然出现上腹部疼痛，呈持续性伴胸闷，左肩部疼痛持续40分钟#####查体：BP153／98mmHg，心率80次／分，律齐，未闻及杂音 现病史:    weight=    assistCheck=电图示：急性下壁心肌梗死    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性心肌梗死

心脏科经典病历19行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=115    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=因活动后呼吸困难17年，加重伴发绀、咯血1年来院就诊#####R28次／分，慢性面容，半卧位，口唇、肢端轻度发绀。心率115次／分，胸骨左缘第三肋间可闻Ⅲ／6级收缩期杂音，P2＞A2，腹部查体可触及肝脏于肋弓下6c m，质地软，有轻压痛。四肢可见杵状指。 现病史:患者于2岁时诊断先天性心脏病，室间隔缺损，当时未行手术治疗。近17年来，常在活动时出现呼吸困难，近1年活动耐量明显降低，夜间有阵发性呼吸困难，并出现口唇和指甲发绀及咯血，多次于当地医院就诊，症状未能缓解，转至上级医院，否认有家族遗传病史及其他特殊病史    weight=    assistCheck=心电图：右心房增大、右心室肥厚、电轴右偏（图26‐14）。胸片：右心室扩大，胸骨后间隙消失，肺动脉段明显突出，肺血量减少，周围肺血管影稀疏。超声心动图：右心室显著肥厚和心房显著扩大（图26‐15）。原发孔房间隔缺损，缺损直径19mm；室间隔缺损，缺损直径约20mm，肺动脉压力95mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历19行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=115    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=因活动后呼吸困难17年，加重伴发绀、咯血1年来院就诊#####R28次／分，慢性面容，半卧位，口唇、肢端轻度发绀。心率115次／分，胸骨左缘第三肋间可闻Ⅲ／6级收缩期杂音，P2＞A2，腹部查体可触及肝脏于肋弓下6c m，质地软，有轻压痛。四肢可见杵状指。 现病史:患者于2岁时诊断先天性心脏病，室间隔缺损，当时未行手术治疗。近17年来，常在活动时出现呼吸困难，近1年活动耐量明显降低，夜间有阵发性呼吸困难，并出现口唇和指甲发绀及咯血，多次于当地医院就诊，症状未能缓解，转至上级医院，否认有家族遗传病史及其他特殊病史    weight=    assistCheck=心电图：右心房增大、右心室肥厚、电轴右偏（图26‐14）。胸片：右心室扩大，胸骨后间隙消失，肺动脉段明显突出，肺血量减少，周围肺血管影稀疏。超声心动图：右心室显著肥厚和心房显著扩大（图26‐15）。原发孔房间隔缺损，缺损直径19mm；室间隔缺损，缺损直径约20mm，肺动脉压力95mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室间隔缺损

心脏科经典病历19行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=115    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=因活动后呼吸困难17年，加重伴发绀、咯血1年来院就诊#####R28次／分，慢性面容，半卧位，口唇、肢端轻度发绀。心率115次／分，胸骨左缘第三肋间可闻Ⅲ／6级收缩期杂音，P2＞A2，腹部查体可触及肝脏于肋弓下6c m，质地软，有轻压痛。四肢可见杵状指。 现病史:患者于2岁时诊断先天性心脏病，室间隔缺损，当时未行手术治疗。近17年来，常在活动时出现呼吸困难，近1年活动耐量明显降低，夜间有阵发性呼吸困难，并出现口唇和指甲发绀及咯血，多次于当地医院就诊，症状未能缓解，转至上级医院，否认有家族遗传病史及其他特殊病史    weight=    assistCheck=心电图：右心房增大、右心室肥厚、电轴右偏（图26‐14）。胸片：右心室扩大，胸骨后间隙消失，肺动脉段明显突出，肺血量减少，周围肺血管影稀疏。超声心动图：右心室显著肥厚和心房显著扩大（图26‐15）。原发孔房间隔缺损，缺损直径19mm；室间隔缺损，缺损直径约20mm，肺动脉压力95mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    房间隔缺损

心脏科经典病历19行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=115    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=因活动后呼吸困难17年，加重伴发绀、咯血1年来院就诊#####R28次／分，慢性面容，半卧位，口唇、肢端轻度发绀。心率115次／分，胸骨左缘第三肋间可闻Ⅲ／6级收缩期杂音，P2＞A2，腹部查体可触及肝脏于肋弓下6c m，质地软，有轻压痛。四肢可见杵状指。 现病史:患者于2岁时诊断先天性心脏病，室间隔缺损，当时未行手术治疗。近17年来，常在活动时出现呼吸困难，近1年活动耐量明显降低，夜间有阵发性呼吸困难，并出现口唇和指甲发绀及咯血，多次于当地医院就诊，症状未能缓解，转至上级医院，否认有家族遗传病史及其他特殊病史    weight=    assistCheck=心电图：右心房增大、右心室肥厚、电轴右偏（图26‐14）。胸片：右心室扩大，胸骨后间隙消失，肺动脉段明显突出，肺血量减少，周围肺血管影稀疏。超声心动图：右心室显著肥厚和心房显著扩大（图26‐15）。原发孔房间隔缺损，缺损直径19mm；室间隔缺损，缺损直径约20mm，肺动脉压力95mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    艾森门格综合征

心脏科经典病历19行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=115    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=因活动后呼吸困难17年，加重伴发绀、咯血1年来院就诊#####R28次／分，慢性面容，半卧位，口唇、肢端轻度发绀。心率115次／分，胸骨左缘第三肋间可闻Ⅲ／6级收缩期杂音，P2＞A2，腹部查体可触及肝脏于肋弓下6c m，质地软，有轻压痛。四肢可见杵状指。 现病史:患者于2岁时诊断先天性心脏病，室间隔缺损，当时未行手术治疗。近17年来，常在活动时出现呼吸困难，近1年活动耐量明显降低，夜间有阵发性呼吸困难，并出现口唇和指甲发绀及咯血，多次于当地医院就诊，症状未能缓解，转至上级医院，否认有家族遗传病史及其他特殊病史    weight=    assistCheck=心电图：右心房增大、右心室肥厚、电轴右偏（图26‐14）。胸片：右心室扩大，胸骨后间隙消失，肺动脉段明显突出，肺血量减少，周围肺血管影稀疏。超声心动图：右心室显著肥厚和心房显著扩大（图26‐15）。原发孔房间隔缺损，缺损直径19mm；室间隔缺损，缺损直径约20mm，肺动脉压力95mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性心力衰竭

心脏科经典病历20行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=37.6    familyHistory=
    ...    gender=1    heartRate=108    highBldPress=68    lowBldPress=45    personalHistory=    previousHistory=
    ...    symptom=持续性疼痛伴胸痛、气短、出汗来诊#####T 37﹒6℃，BP 68／45mmHg，面色苍白，心律整，心音低钝，108次／分。腹上区有压痛，肝、脾未触及。 现病史:3天前饭后腹上区痛，伴胸闷、憋气，疼痛呈阵发性，多持续3～5分钟，恶心、呕吐，稀便2次无脓血。县医院诊断为“急性胰腺炎”，给抗菌、镇痛、补液治疗症状减轻。1天前上述症状再发，再用镇痛药缓解。1小时前呈持续性疼痛伴胸痛、气短、出汗来诊入院。    weight=    assistCheck=心电图示急性下壁心肌梗死。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性心肌梗死

心脏科经典病历21行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=否认高血压、糖尿病病史
    ...    symptom=间断胸闷10余年#####神清，精神可，端坐呼吸，双下肺呼吸音低，可闻及少许湿罗音，心率86次/分，律不齐，心音强弱不等，二尖瓣听诊区可闻及金属音，腹平软，肝肋下约4cm处可触及。肝-颈征阳性，双下肢重度指凹性水肿 现病史:10余年前开始活动后出现胸闷、气短，休息半小时左右缓解，反复发作，到我院诊断为“风心，二尖瓣狭窄，心律失常，房颤，心功能不全”。7年前行二尖瓣置换术，术后活动耐量明显提高。两年前开始再发胸闷、气短、伴双下肢水肿，偶有阵发性呼吸困难。10余天前受凉后加重来诊。    weight=    assistCheck=心电图：室性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    风湿性心脏病

心脏科经典病历21行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=否认高血压、糖尿病病史
    ...    symptom=间断胸闷10余年#####神清，精神可，端坐呼吸，双下肺呼吸音低，可闻及少许湿罗音，心率86次/分，律不齐，心音强弱不等，二尖瓣听诊区可闻及金属音，腹平软，肝肋下约4cm处可触及。肝-颈征阳性，双下肢重度指凹性水肿 现病史:10余年前开始活动后出现胸闷、气短，休息半小时左右缓解，反复发作，到我院诊断为“风心，二尖瓣狭窄，心律失常，房颤，心功能不全”。7年前行二尖瓣置换术，术后活动耐量明显提高。两年前开始再发胸闷、气短、伴双下肢水肿，偶有阵发性呼吸困难。10余天前受凉后加重来诊。    weight=    assistCheck=心电图：室性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心律失常

心脏科经典病历21行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=否认高血压、糖尿病病史
    ...    symptom=间断胸闷10余年#####神清，精神可，端坐呼吸，双下肺呼吸音低，可闻及少许湿罗音，心率86次/分，律不齐，心音强弱不等，二尖瓣听诊区可闻及金属音，腹平软，肝肋下约4cm处可触及。肝-颈征阳性，双下肢重度指凹性水肿 现病史:10余年前开始活动后出现胸闷、气短，休息半小时左右缓解，反复发作，到我院诊断为“风心，二尖瓣狭窄，心律失常，房颤，心功能不全”。7年前行二尖瓣置换术，术后活动耐量明显提高。两年前开始再发胸闷、气短、伴双下肢水肿，偶有阵发性呼吸困难。10余天前受凉后加重来诊。    weight=    assistCheck=心电图：室性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心房颤动

心脏科经典病历21行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=否认高血压、糖尿病病史
    ...    symptom=间断胸闷10余年#####神清，精神可，端坐呼吸，双下肺呼吸音低，可闻及少许湿罗音，心率86次/分，律不齐，心音强弱不等，二尖瓣听诊区可闻及金属音，腹平软，肝肋下约4cm处可触及。肝-颈征阳性，双下肢重度指凹性水肿 现病史:10余年前开始活动后出现胸闷、气短，休息半小时左右缓解，反复发作，到我院诊断为“风心，二尖瓣狭窄，心律失常，房颤，心功能不全”。7年前行二尖瓣置换术，术后活动耐量明显提高。两年前开始再发胸闷、气短、伴双下肢水肿，偶有阵发性呼吸困难。10余天前受凉后加重来诊。    weight=    assistCheck=心电图：室性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历22行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=否认药物、食物过敏史    bodyTempr=36.2    familyHistory=父亲有冠心病、高血压病史
    ...    gender=0    heartRate=70    highBldPress=161    lowBldPress=84    personalHistory=否认吸烟、饮酒史    previousHistory=高血压病史10年，最高血压160/90mmHg。否认糖尿病、高脂血症病史
    ...    symptom=反复发作性胸痛、胸闷5年#####神志清醒，气平，无贫血貌，甲状腺II度肿大。心尖搏动正常，心率70次/分，律齐，主动脉瓣听诊区可闻及4/6级收缩期杂音。 现病史:5年前开始出现反复胸闷、胸痛，疼痛为心前区钝痛，伴头晕，无放射痛，无恶心、呕吐，活动时发作，每次持续5分钟以下，休息后可缓解。    weight=    assistCheck=冠脉CT：冠状动脉粥样硬化、狭窄改变。甲状腺超声：双侧甲状腺肿瘤，较大者伴有内部出血可能。颈部肿块及淋巴结超声：双侧颈部见淋巴结，形态饱满。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历22行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=否认药物、食物过敏史    bodyTempr=36.2    familyHistory=父亲有冠心病、高血压病史
    ...    gender=0    heartRate=70    highBldPress=161    lowBldPress=84    personalHistory=否认吸烟、饮酒史    previousHistory=高血压病史10年，最高血压160/90mmHg。否认糖尿病、高脂血症病史
    ...    symptom=反复发作性胸痛、胸闷5年#####神志清醒，气平，无贫血貌，甲状腺II度肿大。心尖搏动正常，心率70次/分，律齐，主动脉瓣听诊区可闻及4/6级收缩期杂音。 现病史:5年前开始出现反复胸闷、胸痛，疼痛为心前区钝痛，伴头晕，无放射痛，无恶心、呕吐，活动时发作，每次持续5分钟以下，休息后可缓解。    weight=    assistCheck=冠脉CT：冠状动脉粥样硬化、狭窄改变。甲状腺超声：双侧甲状腺肿瘤，较大者伴有内部出血可能。颈部肿块及淋巴结超声：双侧颈部见淋巴结，形态饱满。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    稳定型心绞痛

心脏科经典病历22行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=否认药物、食物过敏史    bodyTempr=36.2    familyHistory=父亲有冠心病、高血压病史
    ...    gender=0    heartRate=70    highBldPress=161    lowBldPress=84    personalHistory=否认吸烟、饮酒史    previousHistory=高血压病史10年，最高血压160/90mmHg。否认糖尿病、高脂血症病史
    ...    symptom=反复发作性胸痛、胸闷5年#####神志清醒，气平，无贫血貌，甲状腺II度肿大。心尖搏动正常，心率70次/分，律齐，主动脉瓣听诊区可闻及4/6级收缩期杂音。 现病史:5年前开始出现反复胸闷、胸痛，疼痛为心前区钝痛，伴头晕，无放射痛，无恶心、呕吐，活动时发作，每次持续5分钟以下，休息后可缓解。    weight=    assistCheck=冠脉CT：冠状动脉粥样硬化、狭窄改变。甲状腺超声：双侧甲状腺肿瘤，较大者伴有内部出血可能。颈部肿块及淋巴结超声：双侧颈部见淋巴结，形态饱满。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历22行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=否认药物、食物过敏史    bodyTempr=36.2    familyHistory=父亲有冠心病、高血压病史
    ...    gender=0    heartRate=70    highBldPress=161    lowBldPress=84    personalHistory=否认吸烟、饮酒史    previousHistory=高血压病史10年，最高血压160/90mmHg。否认糖尿病、高脂血症病史
    ...    symptom=反复发作性胸痛、胸闷5年#####神志清醒，气平，无贫血貌，甲状腺II度肿大。心尖搏动正常，心率70次/分，律齐，主动脉瓣听诊区可闻及4/6级收缩期杂音。 现病史:5年前开始出现反复胸闷、胸痛，疼痛为心前区钝痛，伴头晕，无放射痛，无恶心、呕吐，活动时发作，每次持续5分钟以下，休息后可缓解。    weight=    assistCheck=冠脉CT：冠状动脉粥样硬化、狭窄改变。甲状腺超声：双侧甲状腺肿瘤，较大者伴有内部出血可能。颈部肿块及淋巴结超声：双侧颈部见淋巴结，形态饱满。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲状腺肿瘤

心脏科经典病历23行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=168    lowBldPress=96    personalHistory=嗜烟，少量饮酒    previousHistory=原发性高血压病史10年，血压控制不详
    ...    symptom=阵发性劳力性心前区疼痛2年，加重2个月#####神清，眼睑无苍白，口唇无发绀。颈软，颈静脉不怒张。双肺呼吸音清，无干湿性啰音。心率70次/分，心音有力，律齐，各瓣膜区未闻及杂音。 现病史:患者因活动后心前区疼痛2年，加重2月入院。患者2年前开始出现劳力后心前区疼痛，呈闷痛，伴左上肢酸痛，每次持续1分钟以内，休息后可缓解，每个月发作1～2次。2个月前开始出现后心前区闷痛，持续达10分钟，伴冷汗、头昏、乏力，同时伴有左上肢酸痛或不适，经休息或含服药物后缓解。每个月发作5～6次。    weight=    assistCheck=心电图：窦性心律，V5、V6ST段水平下移0.05～0.075mV，T波低平。实验室检查：血红蛋白：120g/L，白细胞：5.2X109/L。尿常规：正常。肌酐：115umol/L,磷酸激酶同工酶：13U/L,肌钙蛋白I：0.01ng/L。超声心动图：示左室、左房略大，室间隔中下部及心尖部运动幅度降低，与左室后壁运动不协调。平板试验：运动试验阳性，运动中，V4～V6导联ST段压低0.2～0.4mV。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历23行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=168    lowBldPress=96    personalHistory=嗜烟，少量饮酒    previousHistory=原发性高血压病史10年，血压控制不详
    ...    symptom=阵发性劳力性心前区疼痛2年，加重2个月#####神清，眼睑无苍白，口唇无发绀。颈软，颈静脉不怒张。双肺呼吸音清，无干湿性啰音。心率70次/分，心音有力，律齐，各瓣膜区未闻及杂音。 现病史:患者因活动后心前区疼痛2年，加重2月入院。患者2年前开始出现劳力后心前区疼痛，呈闷痛，伴左上肢酸痛，每次持续1分钟以内，休息后可缓解，每个月发作1～2次。2个月前开始出现后心前区闷痛，持续达10分钟，伴冷汗、头昏、乏力，同时伴有左上肢酸痛或不适，经休息或含服药物后缓解。每个月发作5～6次。    weight=    assistCheck=心电图：窦性心律，V5、V6ST段水平下移0.05～0.075mV，T波低平。实验室检查：血红蛋白：120g/L，白细胞：5.2X109/L。尿常规：正常。肌酐：115umol/L,磷酸激酶同工酶：13U/L,肌钙蛋白I：0.01ng/L。超声心动图：示左室、左房略大，室间隔中下部及心尖部运动幅度降低，与左室后壁运动不协调。平板试验：运动试验阳性，运动中，V4～V6导联ST段压低0.2～0.4mV。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    不稳定性心绞痛

心脏科经典病历23行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36.6    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=168    lowBldPress=96    personalHistory=嗜烟，少量饮酒    previousHistory=原发性高血压病史10年，血压控制不详
    ...    symptom=阵发性劳力性心前区疼痛2年，加重2个月#####神清，眼睑无苍白，口唇无发绀。颈软，颈静脉不怒张。双肺呼吸音清，无干湿性啰音。心率70次/分，心音有力，律齐，各瓣膜区未闻及杂音。 现病史:患者因活动后心前区疼痛2年，加重2月入院。患者2年前开始出现劳力后心前区疼痛，呈闷痛，伴左上肢酸痛，每次持续1分钟以内，休息后可缓解，每个月发作1～2次。2个月前开始出现后心前区闷痛，持续达10分钟，伴冷汗、头昏、乏力，同时伴有左上肢酸痛或不适，经休息或含服药物后缓解。每个月发作5～6次。    weight=    assistCheck=心电图：窦性心律，V5、V6ST段水平下移0.05～0.075mV，T波低平。实验室检查：血红蛋白：120g/L，白细胞：5.2X109/L。尿常规：正常。肌酐：115umol/L,磷酸激酶同工酶：13U/L,肌钙蛋白I：0.01ng/L。超声心动图：示左室、左房略大，室间隔中下部及心尖部运动幅度降低，与左室后壁运动不协调。平板试验：运动试验阳性，运动中，V4～V6导联ST段压低0.2～0.4mV。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    原发性高血压

心脏科经典病历24行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=82    highBldPress=101    lowBldPress=57    personalHistory=吸烟30年，戒烟15年，无嗜酒史    previousHistory=既往高血压病史20年，自服药物控制，监测情况不详。
    ...    symptom=上腹痛1天#####神志清楚，急性病容，皮肤巩膜轻度黄染，全身淋巴结未触及肿大。 现病史:1天前无诱因出血上腹痛，伴反酸、嗳气，恶心，无胸痛，心累、气紧，无呕吐，抽搐、大小便失禁等症，持续2小时后自行缓解。当地医院就诊时发现心动过缓。心电图示：Ⅲ°房室传导阻滞，病窦综合征    weight=    assistCheck=心电图：窦性心律，心率：82次/分。ST-T改变。白细胞计数：13.62X109/L中性分页核粒细胞百分率87.3% 。生化：钾3.51mmol/L，ALT:150IU/L,AST:156IU/L,淀粉酶：783U/L,脂肪酶：1258U/L，肌钙蛋白T11.5ng/L。腹部CT:腹主动脉壁钙化，腹主动脉夹层伴附壁血栓形成。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    主动脉夹层

心脏科经典病历25行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=64    highBldPress=140    lowBldPress=80    personalHistory=否认高血压、糖尿病病史，无吸烟史    previousHistory=
    ...    symptom=发作性心前区闷痛7天，再发1天##### 现病史:7天前，患者出现劳力性胸骨后闷痛，闷痛持续3-5分钟，停止活动后半分钟可缓解，无放射痛。每天发作2-3次。未治疗。入院前，患者睡眠过程中胸骨后憋痛再发，范围为巴掌大小，无放射痛，持续10分钟略有缓解。1小时后上述症状再发。    weight=    assistCheck=动态心电图：室早250次/2h，均为单发。房性早搏17次/24h，单发9次。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    冠状动脉粥样硬化性心脏病

心脏科经典病历25行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=64    highBldPress=140    lowBldPress=80    personalHistory=否认高血压、糖尿病病史，无吸烟史    previousHistory=
    ...    symptom=发作性心前区闷痛7天，再发1天##### 现病史:7天前，患者出现劳力性胸骨后闷痛，闷痛持续3-5分钟，停止活动后半分钟可缓解，无放射痛。每天发作2-3次。未治疗。入院前，患者睡眠过程中胸骨后憋痛再发，范围为巴掌大小，无放射痛，持续10分钟略有缓解。1小时后上述症状再发。    weight=    assistCheck=动态心电图：室早250次/2h，均为单发。房性早搏17次/24h，单发9次。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    不稳定性心绞痛

心脏科经典病历26行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=108    highBldPress=80    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=因“腹胀、肝脏肿大半年，加重1个月”，以“肝大原因待查”入院#####神志清，精神差，口唇微绀，强迫体位，颈静脉明显怒张，肝颈静脉回流征阳性，双肺呼吸音稍粗糙，未闻及啰音，心尖搏动点消失，心音遥远无力，未闻及胸膜及心包摩擦音，未闻及杂音。腹膨隆，肝右肋缘下5cm，剑突下8cm，质硬如鼻尖，并有触痛，移动性浊音阳性，双下肢有中等程度凹陷性水肿。 现病史:半年前逐渐出现腹胀、食欲缺乏、气促、下肢水肿，体检肝脏肿大，于外院治疗，诊断为“肝大原因待查”。    weight=    assistCheck=肝功能示谷丙转氨酶112U/L，谷草转氨酶88U/L。腹部B超示肝大、肝淤血。心脏搏动减弱，上腔静脉影轻度增宽。心电图示各波低电压、T波低平。超声心动图示心包增厚。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    缩窄性心包炎

心脏科经典病历27行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=69    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=75    highBldPress=110    lowBldPress=75    personalHistory=    previousHistory=40年前曾患“结核”，具体已不详。否认饮酒史。否认肝炎病史。否认近期中草药接触史。否认食物、药物过敏史。
    ...    symptom=主因“间断腹胀伴水肿4个月“入院#####肝于肋下可及边缘，剑突下约4cm可及，质韧，无压痛。脾肋下未触及，Murphy征阴性，移动性浊音可疑(+)，肝区叩痛(+)，肾区无叩痛，肠鸣音3～4次/分，未闻及血管杂音。双下肢略有可凹性水肿。 现病史:患者4个月前无明显诱因出现腹胀，为全腹胀，呈持续性。伴颜面部及双下肢对称性凹陷性水肿。伴活动后呼吸困难，活动耐量较前明显下降。无夜间阵发性呼吸困难，伴纳差，无恶心、呕吐，无腹痛、腹泻，无胸痛、胸闷，无咳嗽、咳痰，无发热等不适。患者于当地医院诊为“心衰”。半月前患者症状较前加重，当地医院就诊，胸片及腹部CT提示“胸、腹腔积液”，对症治疗后症状较前有所缓解，但仍有腹胀及活动后呼吸困难。发病以来，患者精神、饮食、睡眠均差，大、小便正常，体重无明显变化。    weight=    assistCheck=腹部超声：“大量腹水，肝静脉增宽”腹部CT:大量腹水。胸片:右侧胸腔积液。腹部超声:肝静脉增宽，胆囊结石，胆囊壁水肿，腹水(中等量)，盆腔积液。超声心动图:右侧胸腔积液，LVEF 66%。胸部CT(平扫+增强)检查，结果提示:右膈抬高，右侧胸腔积液，右侧胸膜局限性增厚，心包增厚。双肺支气管血管束增多，小支气管管壁增厚    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    缩窄性心包炎

心脏科经典病历28行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=患者青少年时期反复发作扁桃体炎。经常感到双膝关节疼痛，天气变化时疼痛出现。
    ...    symptom=因“反复气促40＋年，复发加重3个月”入院#####平车推入病房，高枕卧位，二尖瓣面容。嘴唇发绀，颈静脉怒张，双肺未闻及干湿啰音。心界叩诊向左扩大，心率66次／分，律不齐，第一心音强弱不等，心尖区舒张期隆隆样杂音，脉搏短绌。腹软，无压痛，肝大，剑突下6cm，肋下4cm。双下肢轻度水肿。 现病史:40＋年前，活动后出现气促，呼吸困难，乏力，无头晕、黑蒙，无胸痛胸闷，休息后可缓解。31年前因妊娠发现心脏有杂音，诊断为“风心病，二尖瓣狭窄伴关闭不全，房颤”。正常分娩后开始反复气促、乏力，于活动后加重，伴间断双下肢水肿，夜间不能平卧，受凉感冒易诱发，无晕厥，无胸痛，无咯血，无发热。曾多次住院。3个月前，患者因受凉后再次出现气促、乏力，双下肢水肿，活动后气促加重，夜间间断平卧，无胸痛、咯血、发热，无关节疼痛，服“地高辛”等药物治疗略有改善，入院治疗    weight=    assistCheck=超声心动图示二尖瓣狭窄（重度），三尖瓣反流（中度），主动脉瓣反流（轻度），左室收缩功能测值正常。心三位片示：左心房、左右心室长大，伴双肺淤血改变。ECG 示：心房纤颤。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性充血性心力衰竭

心脏科经典病历29行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往患者无卒中、心脏病、高血压、高血脂及糖尿病史，否认吸烟、饮酒史。
    ...    symptom="劳力性胸闷、气促伴晕厥2年 患者主诉近两年来在重体力劳动时反复出现胸闷、气促，并伴发晕厥两次#####血压120/70mmHg，心率70次/分，心律基本整齐。心界不大，心尖区可闻Ⅱ/6级吹风样杂音，胸骨右缘第二肋间可闻及Ⅱ/6级收缩期杂音，呈喷射性，较粗糙，余瓣膜区杂音不显著。" 现病史:患者两年前出现劳力性胸闷气促，多在重体力劳动时产生，休息后多迅速减轻，无持续性胸闷胸痛，无明显下肢水肿，饮食及睡眠正常。患者最近两月内先后两次出现劳力后气促出汗，随即发生意识丧失，持续两分钟后意识恢复，有轻微面部碰伤。恢复后仍感胸闷、疲劳，休息数十分钟后逐渐缓解。    weight=    assistCheck=心电图：窦性心律，心电轴左偏，I导联及aVL等导联R波显著升高；前侧壁导联ST段下移，T波倒置。心脏超声：左房稍大，左室非对称性肥厚，室间隔与左室后壁呈逆向运动。超声心动图：显示心肌肥厚及左室流出道及二尖瓣血流信号    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肥厚型心肌病

心脏科经典病历30行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=月    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=260    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽3天，烦躁不安，面色苍白2天#####精神不振，面色苍白，咽充血，心率260次/分，心音尚有力。腹软，肝肋下3.5cm，质偏中，缘稍钝。 现病史:3天前，患儿受凉后出现咳嗽，呈阵发性串咳，不伴发热及吼喘，2天前，出现烦躁不安，面色青灰，皮肤湿冷，呼吸增快，呕吐2次，心率增快。    weight=    assistCheck=心电图：阵发性室上性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    阵发性室上性心动过速

心脏科经典病历30行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=月    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=260    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽3天，烦躁不安，面色苍白2天#####精神不振，面色苍白，咽充血，心率260次/分，心音尚有力。腹软，肝肋下3.5cm，质偏中，缘稍钝。 现病史:3天前，患儿受凉后出现咳嗽，呈阵发性串咳，不伴发热及吼喘，2天前，出现烦躁不安，面色青灰，皮肤湿冷，呼吸增快，呕吐2次，心率增快。    weight=    assistCheck=心电图：阵发性室上性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历30行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=月    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=260    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽3天，烦躁不安，面色苍白2天#####精神不振，面色苍白，咽充血，心率260次/分，心音尚有力。腹软，肝肋下3.5cm，质偏中，缘稍钝。 现病史:3天前，患儿受凉后出现咳嗽，呈阵发性串咳，不伴发热及吼喘，2天前，出现烦躁不安，面色青灰，皮肤湿冷，呼吸增快，呕吐2次，心率增快。    weight=    assistCheck=心电图：阵发性室上性心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性上呼吸道感染

心脏科经典病历31行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=103    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发热4天，乏力、心悸2天#####神清、神委，面色稍苍白，咽充血，扁桃体Ⅱ°肿大，未见分泌物，双肺呼吸音清，心率103次／分，心音低钝，律不齐，一分钟可闻及早搏5次，未闻及杂音， 现病史:4天前患儿受凉后出现发热，呈中度发热，不伴畏寒寒战，2天前出现乏力，面色苍白，心悸表现，不伴胸痛、头晕及昏厥，无肢端发凉及大汗淋漓表现，无夜间阵发性呼吸困难。不伴游走性关节疼痛。    weight=    assistCheck=心电图示频发室性期前收缩，低电压。心肌肌钙蛋白（cTnI）阳性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性上呼吸道感染

心脏科经典病历31行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=103    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发热4天，乏力、心悸2天#####神清、神委，面色稍苍白，咽充血，扁桃体Ⅱ°肿大，未见分泌物，双肺呼吸音清，心率103次／分，心音低钝，律不齐，一分钟可闻及早搏5次，未闻及杂音， 现病史:4天前患儿受凉后出现发热，呈中度发热，不伴畏寒寒战，2天前出现乏力，面色苍白，心悸表现，不伴胸痛、头晕及昏厥，无肢端发凉及大汗淋漓表现，无夜间阵发性呼吸困难。不伴游走性关节疼痛。    weight=    assistCheck=心电图示频发室性期前收缩，低电压。心肌肌钙蛋白（cTnI）阳性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病毒性心肌炎

心脏科经典病历32行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=15    ageType=月    allergyHistory=    bodyTempr=38    familyHistory=支气管肺炎；动脉导管未闭
    ...    gender=1    heartRate=125    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽、气促8天，发热2天#####稍烦躁，面色稍苍白，唇周发绀；双肺呼吸音粗，肺底部可闻及中细湿啰音；心前区稍隆起，心率125次／分，心音有力、律齐，胸骨左缘2 肋间可闻及Ⅳ／Ⅵ级连续性机器样杂音，向左上颈背部传导，伴震颤，肺动脉第二音稍增强；腹软，肝肋下2.0cm，质软缘锐；；股动脉枪击音，毛细血管搏动征阳性。 现病史:母孕早期有感冒病史，否认放射线接触及有害药物应用史。生后患儿有吃奶中断、吐奶、多汗等表现，剧烈哭吵后口唇、面色稍发绀。    weight=9    assistCheck=胸片：双肺内中带斑片影，肺多血表现，心影增大。超声心动图示先天性心脏病：①动脉导管未闭（漏斗型），肺动脉端4.2mm；②肺动脉高压（轻度）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    支气管肺炎

心脏科经典病历32行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=15    ageType=月    allergyHistory=    bodyTempr=38    familyHistory=支气管肺炎；动脉导管未闭
    ...    gender=1    heartRate=125    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽、气促8天，发热2天#####稍烦躁，面色稍苍白，唇周发绀；双肺呼吸音粗，肺底部可闻及中细湿啰音；心前区稍隆起，心率125次／分，心音有力、律齐，胸骨左缘2 肋间可闻及Ⅳ／Ⅵ级连续性机器样杂音，向左上颈背部传导，伴震颤，肺动脉第二音稍增强；腹软，肝肋下2.0cm，质软缘锐；；股动脉枪击音，毛细血管搏动征阳性。 现病史:母孕早期有感冒病史，否认放射线接触及有害药物应用史。生后患儿有吃奶中断、吐奶、多汗等表现，剧烈哭吵后口唇、面色稍发绀。    weight=9    assistCheck=胸片：双肺内中带斑片影，肺多血表现，心影增大。超声心动图示先天性心脏病：①动脉导管未闭（漏斗型），肺动脉端4.2mm；②肺动脉高压（轻度）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    动脉导管未闭

心脏科经典病历33行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=170    highBldPress=120    lowBldPress=65    personalHistory=有吸烟史25年，每日约10~20支。    previousHistory=既往有高血压病史，最高血压达190/103mmHg，未正规治疗。否认有冠心病、糖尿病史。
    ...    symptom=突发胸痛、心悸2小时#####心电监护下SpO2 95%~98%；急性痛苦面容，HR 170次/分，律齐，各心脏瓣膜区未闻及明显病理性杂音； 现病史:入院前2小时，在搬重物时突然出现胸痛、心悸不适。胸痛呈胸骨后持续性闷痛，无放射到其他部位，无伴大汗，无晕厥、呼吸困难等。    weight=    assistCheck=血常规：WBC 12.1×109/L，N 0.824，RBC 4.46×1012/L，Hb 142g/L，PLT 209×109/L。动脉血气分析：pH 7.436，PaCO2 33.4mmHg，PaO2 92.8mmHg。心肌损伤指标：CK-MB 2.0U/L，cTnI<0.05ng/ml，MB 155ng/ml，BNP 47.4pg/ml，D-二聚体125ng/ml。心电图：宽QRS波心动过速    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    阵发性室上性心动过速

心脏科经典病历34行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=24    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=无家族性遗传病史及传染病人密切接触史，父母体健
    ...    gender=1    heartRate=82    highBldPress=118    lowBldPress=80    personalHistory=常居留地：黄陂区；无吸烟、饮酒及毒品接触史    previousHistory=平素健康状况良好，无疾病史，无传染病史，预防接种史不详，无外伤及手术史，无输血史，无药物过敏史
    ...    symptom=胸闷、心慌1周。#####心相对浊音界正常，心率82次／分，心律不齐，心脏闻及明显第三心音。 现病史:病人1周前因感冒后出现胸闷、心慌不适，活动后加重，伴恶心、呕吐、头昏，不伴胸痛、晕厥，曾于当地医院治疗，药物不详，症状未明显好转，遂来我院就诊，    weight=    assistCheck=胸片示：肺部感染，主动脉型心影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

心脏科经典病历34行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=24    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=无家族性遗传病史及传染病人密切接触史，父母体健
    ...    gender=1    heartRate=82    highBldPress=118    lowBldPress=80    personalHistory=常居留地：黄陂区；无吸烟、饮酒及毒品接触史    previousHistory=平素健康状况良好，无疾病史，无传染病史，预防接种史不详，无外伤及手术史，无输血史，无药物过敏史
    ...    symptom=胸闷、心慌1周。#####心相对浊音界正常，心率82次／分，心律不齐，心脏闻及明显第三心音。 现病史:病人1周前因感冒后出现胸闷、心慌不适，活动后加重，伴恶心、呕吐、头昏，不伴胸痛、晕厥，曾于当地医院治疗，药物不详，症状未明显好转，遂来我院就诊，    weight=    assistCheck=胸片示：肺部感染，主动脉型心影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺部感染

心脏科经典病历35行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=无家族性遗传病及传染病人密切接触史；父、母亲体健
    ...    gender=1    heartRate=70    highBldPress=120    lowBldPress=80    personalHistory=无吸烟饮酒史；无毒品接触史    previousHistory=无特殊病史，否认高血压、糖尿病及药物过敏史
    ...    symptom=体检发现心律失常半月余#####心界正常，心率70次／分，期前收缩，9～10次／分，未闻及明显病理性杂音 现病史:病人近半月前因入伍体检发现心律失常，以室早为主，病人诉无明显黑、晕厥、呕吐、大汗等。追问病史，病人诉近一年来活动剧烈后有心慌、头痛、头晕症状，无胸痛、晕厥。在家未作特殊处理，今为求进一步诊治来我院，    weight=    assistCheck=心电图示：频发室性期前收缩    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心律失常

心脏科经典病历35行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=无家族性遗传病及传染病人密切接触史；父、母亲体健
    ...    gender=1    heartRate=70    highBldPress=120    lowBldPress=80    personalHistory=无吸烟饮酒史；无毒品接触史    previousHistory=无特殊病史，否认高血压、糖尿病及药物过敏史
    ...    symptom=体检发现心律失常半月余#####心界正常，心率70次／分，期前收缩，9～10次／分，未闻及明显病理性杂音 现病史:病人近半月前因入伍体检发现心律失常，以室早为主，病人诉无明显黑、晕厥、呕吐、大汗等。追问病史，病人诉近一年来活动剧烈后有心慌、头痛、头晕症状，无胸痛、晕厥。在家未作特殊处理，今为求进一步诊治来我院，    weight=    assistCheck=心电图示：频发室性期前收缩    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室性早搏

心脏科经典病历36行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=无家族性遗传病史及传染病人密切接触史，父母亲体健
    ...    gender=1    heartRate=140    highBldPress=115    lowBldPress=90    personalHistory=无吸烟饮酒史，无毒品接触史。    previousHistory=否认高血压、冠心病及糖尿病，阵发性心慌发作史2年，未予以重视；无传染病史；无手术外伤史；无过敏史；疫苗接种史不详
    ...    symptom=心慌、乏力伴呕吐半日##### 现病史:病人今早无明显诱因感心慌、胸闷、气短、乏力、食欲减退伴呕吐一次，呕吐物为水样胃内容物，曾到当地中医院就诊，效果不佳，随来我院就诊，起病以来，精神一般，睡眠可，食欲差，大小便正常，体力下降，体重无明显增减。    weight=    assistCheck=心电图示室上性心动过速，心电轴正常.血清生化检查：总胆红素TBIL 27﹒2μmol／L，直接胆红素DBIL 9﹒1μmol／L，尿酸UA 552μmol／L，二氧化碳总量TCO2 20﹒6mmol／L，高密度脂蛋白胆固醇HDL‐C 0﹒77mmol／L，阴离子间隙AGPK 20﹒9mmol／L；血清免疫检查：HBeAb阳性（＋），HBcAb阳性（＋）。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    阵发性室上性心动过速

心脏科经典病历37行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=15    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=因查体发现心脏杂音12年，房间隔缺损修补术后9年，剧烈活动后心悸、气短3年入院#####两次胸廓不对称，左侧胸廓相对容积偏小；双肺呼吸音清晰，未闻及干湿性啰音。HR 84次/分，心律齐，P2>A2，胸骨左缘第2～3肋间可闻及3/6级收缩期杂音。 现病史:患者3年前出现剧烈活动后心悸、气短，未予重视。近期因家长发现其较同龄人发育较瘦小而要求进一步检查    weight=    assistCheck=C反应蛋白（CRP）1.15mg/L；血沉3mm/h。心电图：窦性心律，电轴右偏。X线胸片（图8-1）：两肺血不对称，左肺血减少，主动脉结不宽，肺动脉段平直，各房、室未见明显增大，心胸比0.48。超声心动图：右心房、室增大，左心大小大致正常，运动幅度良好，左心室射血分数62%。房、室间隔完整，各瓣膜结构、形态和启闭未见异常。主肺动脉及右肺动脉发育良好，左肺动脉狭窄，前向血流速度增快，收缩期峰值压差约50mmHg。心脏增强CT（图8-2）：心脏正位，房、室间隔连续完整，右心房、室轻度增大。左肺动脉起始部重度局限性狭窄，右肺动脉起始部轻度局限性狭窄，狭窄以远肺动脉及其分支发育良好，管腔内未见充盈缺损    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉狭窄

心脏科经典病历38行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=15    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=因查体发现心脏杂音12年，房间隔缺损修补术后9年，剧烈活动后心悸、气短3年入院#####两次胸廓不对称，左侧胸廓相对容积偏小；双肺呼吸音清晰，未闻及干湿性啰音。HR 84次/分，心律齐，P2>A2，胸骨左缘第2～3肋间可闻及3/6级收缩期杂音。 现病史:患者3年前出现剧烈活动后心悸、气短，未予重视。近期因家长发现其较同龄人发育较瘦小而要求进一步检查    weight=    assistCheck=C反应蛋白（CRP）1.15mg/L；血沉3mm/h。心电图：窦性心律，电轴右偏。X线胸片（图8-1）：两肺血不对称，左肺血减少，主动脉结不宽，肺动脉段平直，各房、室未见明显增大，心胸比0.48。超声心动图：右心房、室增大，左心大小大致正常，运动幅度良好，左心室射血分数62%。房、室间隔完整，各瓣膜结构、形态和启闭未见异常。主肺动脉及右肺动脉发育良好，左肺动脉狭窄，前向血流速度增快，收缩期峰值压差约50mmHg。心脏增强CT（图8-2）：心脏正位，房、室间隔连续完整，右心房、室轻度增大。左肺动脉起始部重度局限性狭窄，右肺动脉起始部轻度局限性狭窄，狭窄以远肺动脉及其分支发育良好，管腔内未见充盈缺损    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉狭窄

心脏科经典病历39行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=148    lowBldPress=70    personalHistory=有糖尿病20年（长期胰岛素治疗），高血压3年，冠心病3年    previousHistory=
    ...    symptom=6个月来发作性意识丧失3次#####神志清，表情淡漠，自主体位，神经系统检查无异常，口唇无发绀，心率40次／分，律不齐 现病史:6个月前患者于散步时突然晕倒，伴意识丧失，持续约1～2分钟后清醒，发病前无明显诱因，亦无心悸、胸痛和胸闷，发病时无肢体抽搐、牙关紧闭、舌咬伤及大小便失禁。清醒后继续行走，但约1小时后再次发生上述症状，表现和持续时间与前相同，醒后感全身乏力。本次入院前1小时，于进食后又突然晕倒在地，当时意识丧失、呼吸急促、大汗，伴恶心，呕吐一次，呕吐物为胃内容物，无大小便失禁，持续时间约3～5分钟后清醒，来医院急诊。    weight=    assistCheck="心电图：三度房室传导阻滞，室性节律，其中心房率86次／分、心室率40次／分。实验室检查：CK‐MB3.0ng／mL，MYO63ng／mL，TNI＜0.05ng／mL；血糖14.79mmol／L"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    阿-斯综合征

心脏科经典病历39行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=148    lowBldPress=70    personalHistory=有糖尿病20年（长期胰岛素治疗），高血压3年，冠心病3年    previousHistory=
    ...    symptom=6个月来发作性意识丧失3次#####神志清，表情淡漠，自主体位，神经系统检查无异常，口唇无发绀，心率40次／分，律不齐 现病史:6个月前患者于散步时突然晕倒，伴意识丧失，持续约1～2分钟后清醒，发病前无明显诱因，亦无心悸、胸痛和胸闷，发病时无肢体抽搐、牙关紧闭、舌咬伤及大小便失禁。清醒后继续行走，但约1小时后再次发生上述症状，表现和持续时间与前相同，醒后感全身乏力。本次入院前1小时，于进食后又突然晕倒在地，当时意识丧失、呼吸急促、大汗，伴恶心，呕吐一次，呕吐物为胃内容物，无大小便失禁，持续时间约3～5分钟后清醒，来医院急诊。    weight=    assistCheck="心电图：三度房室传导阻滞，室性节律，其中心房率86次／分、心室率40次／分。实验室检查：CK‐MB3.0ng／mL，MYO63ng／mL，TNI＜0.05ng／mL；血糖14.79mmol／L"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心律失常

心脏科经典病历39行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=148    lowBldPress=70    personalHistory=有糖尿病20年（长期胰岛素治疗），高血压3年，冠心病3年    previousHistory=
    ...    symptom=6个月来发作性意识丧失3次#####神志清，表情淡漠，自主体位，神经系统检查无异常，口唇无发绀，心率40次／分，律不齐 现病史:6个月前患者于散步时突然晕倒，伴意识丧失，持续约1～2分钟后清醒，发病前无明显诱因，亦无心悸、胸痛和胸闷，发病时无肢体抽搐、牙关紧闭、舌咬伤及大小便失禁。清醒后继续行走，但约1小时后再次发生上述症状，表现和持续时间与前相同，醒后感全身乏力。本次入院前1小时，于进食后又突然晕倒在地，当时意识丧失、呼吸急促、大汗，伴恶心，呕吐一次，呕吐物为胃内容物，无大小便失禁，持续时间约3～5分钟后清醒，来医院急诊。    weight=    assistCheck="心电图：三度房室传导阻滞，室性节律，其中心房率86次／分、心室率40次／分。实验室检查：CK‐MB3.0ng／mL，MYO63ng／mL，TNI＜0.05ng／mL；血糖14.79mmol／L"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    Ⅲ度房室传导阻滞

心脏科经典病历39行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=148    lowBldPress=70    personalHistory=有糖尿病20年（长期胰岛素治疗），高血压3年，冠心病3年    previousHistory=
    ...    symptom=6个月来发作性意识丧失3次#####神志清，表情淡漠，自主体位，神经系统检查无异常，口唇无发绀，心率40次／分，律不齐 现病史:6个月前患者于散步时突然晕倒，伴意识丧失，持续约1～2分钟后清醒，发病前无明显诱因，亦无心悸、胸痛和胸闷，发病时无肢体抽搐、牙关紧闭、舌咬伤及大小便失禁。清醒后继续行走，但约1小时后再次发生上述症状，表现和持续时间与前相同，醒后感全身乏力。本次入院前1小时，于进食后又突然晕倒在地，当时意识丧失、呼吸急促、大汗，伴恶心，呕吐一次，呕吐物为胃内容物，无大小便失禁，持续时间约3～5分钟后清醒，来医院急诊。    weight=    assistCheck="心电图：三度房室传导阻滞，室性节律，其中心房率86次／分、心室率40次／分。实验室检查：CK‐MB3.0ng／mL，MYO63ng／mL，TNI＜0.05ng／mL；血糖14.79mmol／L"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    2型糖尿病

心脏科经典病历39行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=148    lowBldPress=70    personalHistory=有糖尿病20年（长期胰岛素治疗），高血压3年，冠心病3年    previousHistory=
    ...    symptom=6个月来发作性意识丧失3次#####神志清，表情淡漠，自主体位，神经系统检查无异常，口唇无发绀，心率40次／分，律不齐 现病史:6个月前患者于散步时突然晕倒，伴意识丧失，持续约1～2分钟后清醒，发病前无明显诱因，亦无心悸、胸痛和胸闷，发病时无肢体抽搐、牙关紧闭、舌咬伤及大小便失禁。清醒后继续行走，但约1小时后再次发生上述症状，表现和持续时间与前相同，醒后感全身乏力。本次入院前1小时，于进食后又突然晕倒在地，当时意识丧失、呼吸急促、大汗，伴恶心，呕吐一次，呕吐物为胃内容物，无大小便失禁，持续时间约3～5分钟后清醒，来医院急诊。    weight=    assistCheck="心电图：三度房室传导阻滞，室性节律，其中心房率86次／分、心室率40次／分。实验室检查：CK‐MB3.0ng／mL，MYO63ng／mL，TNI＜0.05ng／mL；血糖14.79mmol／L"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历39行-6
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=148    lowBldPress=70    personalHistory=有糖尿病20年（长期胰岛素治疗），高血压3年，冠心病3年    previousHistory=
    ...    symptom=6个月来发作性意识丧失3次#####神志清，表情淡漠，自主体位，神经系统检查无异常，口唇无发绀，心率40次／分，律不齐 现病史:6个月前患者于散步时突然晕倒，伴意识丧失，持续约1～2分钟后清醒，发病前无明显诱因，亦无心悸、胸痛和胸闷，发病时无肢体抽搐、牙关紧闭、舌咬伤及大小便失禁。清醒后继续行走，但约1小时后再次发生上述症状，表现和持续时间与前相同，醒后感全身乏力。本次入院前1小时，于进食后又突然晕倒在地，当时意识丧失、呼吸急促、大汗，伴恶心，呕吐一次，呕吐物为胃内容物，无大小便失禁，持续时间约3～5分钟后清醒，来医院急诊。    weight=    assistCheck="心电图：三度房室传导阻滞，室性节律，其中心房率86次／分、心室率40次／分。实验室检查：CK‐MB3.0ng／mL，MYO63ng／mL，TNI＜0.05ng／mL；血糖14.79mmol／L"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历40行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=165    highBldPress=90    lowBldPress=65    personalHistory=    previousHistory=既往无高血压病史，无糖尿病史
    ...    symptom=无明显诱因以突然发作心悸、胸闷、气短1小时急诊就医#####半坐位，心尖搏动不清，心律整齐，心率165次／分，双肺底可闻及少许湿性啰音。 现病史:    weight=    assistCheck=心电图：室性心动过速，QRS波群呈左束支阻滞样图形    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室性心动过速

心脏科经典病历41行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=既往高血压病史15年，脑梗死病史10年，阵发性房颤病史3年
    ...    symptom=主因“阵发性心悸3年，伴活动时心前区不适4个月”入院##### 现病史:本次住院前4个月活动后心前区不适，并伴明显胸闷症状。    weight=    assistCheck=入院查心脏超声示左房35mm，左室舒末径43mm，收末径24mm，左室后壁厚9.5mm，左室射血分数76%。心前区不适发作时可见V2～V4有缺血性ST段压低。SPECT结果：左室前壁及心尖部呈缺血性改变。冠脉造影示前降支弥漫狭窄，最重达80%，右冠管壁不规则。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    冠状动脉粥样硬化性心脏病

心脏科经典病历41行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=既往高血压病史15年，脑梗死病史10年，阵发性房颤病史3年
    ...    symptom=主因“阵发性心悸3年，伴活动时心前区不适4个月”入院##### 现病史:本次住院前4个月活动后心前区不适，并伴明显胸闷症状。    weight=    assistCheck=入院查心脏超声示左房35mm，左室舒末径43mm，收末径24mm，左室后壁厚9.5mm，左室射血分数76%。心前区不适发作时可见V2～V4有缺血性ST段压低。SPECT结果：左室前壁及心尖部呈缺血性改变。冠脉造影示前降支弥漫狭窄，最重达80%，右冠管壁不规则。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    不稳定性心绞痛

心脏科经典病历41行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=既往高血压病史15年，脑梗死病史10年，阵发性房颤病史3年
    ...    symptom=主因“阵发性心悸3年，伴活动时心前区不适4个月”入院##### 现病史:本次住院前4个月活动后心前区不适，并伴明显胸闷症状。    weight=    assistCheck=入院查心脏超声示左房35mm，左室舒末径43mm，收末径24mm，左室后壁厚9.5mm，左室射血分数76%。心前区不适发作时可见V2～V4有缺血性ST段压低。SPECT结果：左室前壁及心尖部呈缺血性改变。冠脉造影示前降支弥漫狭窄，最重达80%，右冠管壁不规则。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心律失常

心脏科经典病历41行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=72    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=既往高血压病史15年，脑梗死病史10年，阵发性房颤病史3年
    ...    symptom=主因“阵发性心悸3年，伴活动时心前区不适4个月”入院##### 现病史:本次住院前4个月活动后心前区不适，并伴明显胸闷症状。    weight=    assistCheck=入院查心脏超声示左房35mm，左室舒末径43mm，收末径24mm，左室后壁厚9.5mm，左室射血分数76%。心前区不适发作时可见V2～V4有缺血性ST段压低。SPECT结果：左室前壁及心尖部呈缺血性改变。冠脉造影示前降支弥漫狭窄，最重达80%，右冠管壁不规则。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心房颤动

心脏科经典病历42行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=否认糖尿病以及慢性支气管炎史，否认肝炎、结核等病史。20年前育1子，家族史无特殊。
    ...    symptom=主因“心悸伴胸闷气短3个月，加重2天”入院#####双肺呼吸音粗，双肺底可闻及少许湿啰音；心界向左下扩大，心尖位于左锁骨中线第Ⅴ肋间外1c m，心率150次／分，律齐，未闻及杂音；腹平软，肝肋下2c m，质韧，无压痛和反跳痛；双下肢无明显水肿。 现病史:14年前体检发现高血压病，最高血压可达到200／130mmHg，未正规监测血压情况。近3个月无明显诱因出现心悸、胸闷，无胸痛，以活动后为重，未予进一步诊治。近2天患者胸闷症状有所加重，并出现夜间睡眠憋醒，坐起后缓解。无明显双下肢水肿。    weight=    assistCheck=胸部正位片：双肺纹理增强、瘀血征，心影增大。心电图：P波消失，代之以锯齿状F波，Ⅱ、Ⅲ、aVF导联正向，V1导联负向，房室呈2：1传导，心室率150次／分。QRS波形态正常。心脏超声：左心系统增大，左室间隔厚度11mm，左室内径58mm，左室射血分数40%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    左心衰竭

心脏科经典病历42行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=否认糖尿病以及慢性支气管炎史，否认肝炎、结核等病史。20年前育1子，家族史无特殊。
    ...    symptom=主因“心悸伴胸闷气短3个月，加重2天”入院#####双肺呼吸音粗，双肺底可闻及少许湿啰音；心界向左下扩大，心尖位于左锁骨中线第Ⅴ肋间外1c m，心率150次／分，律齐，未闻及杂音；腹平软，肝肋下2c m，质韧，无压痛和反跳痛；双下肢无明显水肿。 现病史:14年前体检发现高血压病，最高血压可达到200／130mmHg，未正规监测血压情况。近3个月无明显诱因出现心悸、胸闷，无胸痛，以活动后为重，未予进一步诊治。近2天患者胸闷症状有所加重，并出现夜间睡眠憋醒，坐起后缓解。无明显双下肢水肿。    weight=    assistCheck=胸部正位片：双肺纹理增强、瘀血征，心影增大。心电图：P波消失，代之以锯齿状F波，Ⅱ、Ⅲ、aVF导联正向，V1导联负向，房室呈2：1传导，心室率150次／分。QRS波形态正常。心脏超声：左心系统增大，左室间隔厚度11mm，左室内径58mm，左室射血分数40%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历42行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=否认糖尿病以及慢性支气管炎史，否认肝炎、结核等病史。20年前育1子，家族史无特殊。
    ...    symptom=主因“心悸伴胸闷气短3个月，加重2天”入院#####双肺呼吸音粗，双肺底可闻及少许湿啰音；心界向左下扩大，心尖位于左锁骨中线第Ⅴ肋间外1c m，心率150次／分，律齐，未闻及杂音；腹平软，肝肋下2c m，质韧，无压痛和反跳痛；双下肢无明显水肿。 现病史:14年前体检发现高血压病，最高血压可达到200／130mmHg，未正规监测血压情况。近3个月无明显诱因出现心悸、胸闷，无胸痛，以活动后为重，未予进一步诊治。近2天患者胸闷症状有所加重，并出现夜间睡眠憋醒，坐起后缓解。无明显双下肢水肿。    weight=    assistCheck=胸部正位片：双肺纹理增强、瘀血征，心影增大。心电图：P波消失，代之以锯齿状F波，Ⅱ、Ⅲ、aVF导联正向，V1导联负向，房室呈2：1传导，心室率150次／分。QRS波形态正常。心脏超声：左心系统增大，左室间隔厚度11mm，左室内径58mm，左室射血分数40%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历42行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=48    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=否认糖尿病以及慢性支气管炎史，否认肝炎、结核等病史。20年前育1子，家族史无特殊。
    ...    symptom=主因“心悸伴胸闷气短3个月，加重2天”入院#####双肺呼吸音粗，双肺底可闻及少许湿啰音；心界向左下扩大，心尖位于左锁骨中线第Ⅴ肋间外1c m，心率150次／分，律齐，未闻及杂音；腹平软，肝肋下2c m，质韧，无压痛和反跳痛；双下肢无明显水肿。 现病史:14年前体检发现高血压病，最高血压可达到200／130mmHg，未正规监测血压情况。近3个月无明显诱因出现心悸、胸闷，无胸痛，以活动后为重，未予进一步诊治。近2天患者胸闷症状有所加重，并出现夜间睡眠憋醒，坐起后缓解。无明显双下肢水肿。    weight=    assistCheck=胸部正位片：双肺纹理增强、瘀血征，心影增大。心电图：P波消失，代之以锯齿状F波，Ⅱ、Ⅲ、aVF导联正向，V1导联负向，房室呈2：1传导，心室率150次／分。QRS波形态正常。心脏超声：左心系统增大，左室间隔厚度11mm，左室内径58mm，左室射血分数40%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心房扑动

心脏科经典病历43行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=对“青霉素，头孢氨苄，参麦，海鲜”过敏，表现为“胸闷”。    bodyTempr=36.8    familyHistory=家族中无类似疾病史。
    ...    gender=1    heartRate=82    highBldPress=142    lowBldPress=86    personalHistory=患者个性外向，急躁，有吸烟史：20支／天×30年，已戒烟1年；饮酒史：3两白酒／天×10年，已戒1年。适龄结婚，育有1子，体健，    previousHistory=1年前发现血压升高，最高150／90mmHg，未正规药物治疗，血压控制水平不详。否认糖尿病，肝炎，结核病史。
    ...    symptom=因“反复胸闷、心悸1年，加重1个月”入院#####慢性病容，口唇无发绀，颈静脉无怒张 现病史:患者1年前无明显诱因下突发胸闷，位于剑突下，时伴心悸，明显濒死感，无心前区疼痛，无呼吸困难，无大汗淋漓，无头晕头痛，无恶心呕吐，无意识不清，无四肢抽搐，无口舌咬伤，持续数秒至数分钟不等，可自行缓解。后胸闷心悸反复发作，有时每天发作3～4次，有时长达2个月不发作，于当地各级医院反复就诊，无明确诊断。1年来症状进行性加重，1个月前患者从事重体力劳动后胸闷、心悸再发，伴呼吸困难，持续10余分钟后自行缓解。后胸闷心悸发作更为频繁，程度加重，无胸痛，无晕厥，持续数分钟后均能自行缓解，未服药物。发作间期有担心，紧张情绪，但仍可坚持日常工作。    weight=    assistCheck=腹部B超：胆囊内多发性息肉样病变，余肝、胰、脾未见明显异常。胃镜：慢性浅表性胃炎。心电监护示：心电图示：心房颤动，心率150次／分以上。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历43行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=对“青霉素，头孢氨苄，参麦，海鲜”过敏，表现为“胸闷”。    bodyTempr=36.8    familyHistory=家族中无类似疾病史。
    ...    gender=1    heartRate=82    highBldPress=142    lowBldPress=86    personalHistory=患者个性外向，急躁，有吸烟史：20支／天×30年，已戒烟1年；饮酒史：3两白酒／天×10年，已戒1年。适龄结婚，育有1子，体健，    previousHistory=1年前发现血压升高，最高150／90mmHg，未正规药物治疗，血压控制水平不详。否认糖尿病，肝炎，结核病史。
    ...    symptom=因“反复胸闷、心悸1年，加重1个月”入院#####慢性病容，口唇无发绀，颈静脉无怒张 现病史:患者1年前无明显诱因下突发胸闷，位于剑突下，时伴心悸，明显濒死感，无心前区疼痛，无呼吸困难，无大汗淋漓，无头晕头痛，无恶心呕吐，无意识不清，无四肢抽搐，无口舌咬伤，持续数秒至数分钟不等，可自行缓解。后胸闷心悸反复发作，有时每天发作3～4次，有时长达2个月不发作，于当地各级医院反复就诊，无明确诊断。1年来症状进行性加重，1个月前患者从事重体力劳动后胸闷、心悸再发，伴呼吸困难，持续10余分钟后自行缓解。后胸闷心悸发作更为频繁，程度加重，无胸痛，无晕厥，持续数分钟后均能自行缓解，未服药物。发作间期有担心，紧张情绪，但仍可坚持日常工作。    weight=    assistCheck=腹部B超：胆囊内多发性息肉样病变，余肝、胰、脾未见明显异常。胃镜：慢性浅表性胃炎。心电监护示：心电图示：心房颤动，心率150次／分以上。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心房颤动

心脏科经典病历43行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=对“青霉素，头孢氨苄，参麦，海鲜”过敏，表现为“胸闷”。    bodyTempr=36.8    familyHistory=家族中无类似疾病史。
    ...    gender=1    heartRate=82    highBldPress=142    lowBldPress=86    personalHistory=患者个性外向，急躁，有吸烟史：20支／天×30年，已戒烟1年；饮酒史：3两白酒／天×10年，已戒1年。适龄结婚，育有1子，体健，    previousHistory=1年前发现血压升高，最高150／90mmHg，未正规药物治疗，血压控制水平不详。否认糖尿病，肝炎，结核病史。
    ...    symptom=因“反复胸闷、心悸1年，加重1个月”入院#####慢性病容，口唇无发绀，颈静脉无怒张 现病史:患者1年前无明显诱因下突发胸闷，位于剑突下，时伴心悸，明显濒死感，无心前区疼痛，无呼吸困难，无大汗淋漓，无头晕头痛，无恶心呕吐，无意识不清，无四肢抽搐，无口舌咬伤，持续数秒至数分钟不等，可自行缓解。后胸闷心悸反复发作，有时每天发作3～4次，有时长达2个月不发作，于当地各级医院反复就诊，无明确诊断。1年来症状进行性加重，1个月前患者从事重体力劳动后胸闷、心悸再发，伴呼吸困难，持续10余分钟后自行缓解。后胸闷心悸发作更为频繁，程度加重，无胸痛，无晕厥，持续数分钟后均能自行缓解，未服药物。发作间期有担心，紧张情绪，但仍可坚持日常工作。    weight=    assistCheck=腹部B超：胆囊内多发性息肉样病变，余肝、胰、脾未见明显异常。胃镜：慢性浅表性胃炎。心电监护示：心电图示：心房颤动，心率150次／分以上。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    焦虑症

心脏科经典病历43行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=对“青霉素，头孢氨苄，参麦，海鲜”过敏，表现为“胸闷”。    bodyTempr=36.8    familyHistory=家族中无类似疾病史。
    ...    gender=1    heartRate=82    highBldPress=142    lowBldPress=86    personalHistory=患者个性外向，急躁，有吸烟史：20支／天×30年，已戒烟1年；饮酒史：3两白酒／天×10年，已戒1年。适龄结婚，育有1子，体健，    previousHistory=1年前发现血压升高，最高150／90mmHg，未正规药物治疗，血压控制水平不详。否认糖尿病，肝炎，结核病史。
    ...    symptom=因“反复胸闷、心悸1年，加重1个月”入院#####慢性病容，口唇无发绀，颈静脉无怒张 现病史:患者1年前无明显诱因下突发胸闷，位于剑突下，时伴心悸，明显濒死感，无心前区疼痛，无呼吸困难，无大汗淋漓，无头晕头痛，无恶心呕吐，无意识不清，无四肢抽搐，无口舌咬伤，持续数秒至数分钟不等，可自行缓解。后胸闷心悸反复发作，有时每天发作3～4次，有时长达2个月不发作，于当地各级医院反复就诊，无明确诊断。1年来症状进行性加重，1个月前患者从事重体力劳动后胸闷、心悸再发，伴呼吸困难，持续10余分钟后自行缓解。后胸闷心悸发作更为频繁，程度加重，无胸痛，无晕厥，持续数分钟后均能自行缓解，未服药物。发作间期有担心，紧张情绪，但仍可坚持日常工作。    weight=    assistCheck=腹部B超：胆囊内多发性息肉样病变，余肝、胰、脾未见明显异常。胃镜：慢性浅表性胃炎。心电监护示：心电图示：心房颤动，心率150次／分以上。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    惊恐障碍

心脏科经典病历44行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=53    highBldPress=130    lowBldPress=65    personalHistory=    previousHistory=既往体健，为专业游泳教练，平时心率偏慢，具体不详。无肝炎、结核史，无高血压、糖尿病、高脂血症等病史。无手术及外伤史。不吸烟，无家族性遗传性疾病史。
    ...    symptom=活动后气短、乏力6个月伴进行性加重#####入院查体 P53次／分，双肺清，心界不大，心律齐，未及心脏杂音，双下肢不肿。 现病史:患者近6个月先后两次出现活动后气短、乏力，症状逐渐加重，伴头晕、呼吸困难及冷汗，休息后约20分钟缓解；2周前登一层楼即觉气短、胸闷，一直无明确胸痛症状，至当地某三甲医院就诊，行平板运动心电图检查，检查过程中，心率一直在50次／分水平；运动7分钟时，患者觉明显胸闷、呼吸困难、大汗，无胸痛，主动要求终止运动，期间心电图ST‐T未见明显变化；。病程中患者无阵发性夜间呼吸困难，无一过性意识丧失、黑蒙等，无发绀及双下肢水肿，食欲尚可，大小便正常。    weight=    assistCheck=心脏超声检查“左房大，余未见异常”。动态心电图监测：窦性心律，总心率65421次，最快62次／分，最慢35次／分，平均45次／分；心脏超声检查：左房大，余未见异常；外院平板运动心电图：心率一直在50次／分水平；运动7分钟时，患者明显胸闷、呼吸困难要求终止运动，期间心电图ST‐T未见明显变化    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心律失常

心脏科经典病历44行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=53    highBldPress=130    lowBldPress=65    personalHistory=    previousHistory=既往体健，为专业游泳教练，平时心率偏慢，具体不详。无肝炎、结核史，无高血压、糖尿病、高脂血症等病史。无手术及外伤史。不吸烟，无家族性遗传性疾病史。
    ...    symptom=活动后气短、乏力6个月伴进行性加重#####入院查体 P53次／分，双肺清，心界不大，心律齐，未及心脏杂音，双下肢不肿。 现病史:患者近6个月先后两次出现活动后气短、乏力，症状逐渐加重，伴头晕、呼吸困难及冷汗，休息后约20分钟缓解；2周前登一层楼即觉气短、胸闷，一直无明确胸痛症状，至当地某三甲医院就诊，行平板运动心电图检查，检查过程中，心率一直在50次／分水平；运动7分钟时，患者觉明显胸闷、呼吸困难、大汗，无胸痛，主动要求终止运动，期间心电图ST‐T未见明显变化；。病程中患者无阵发性夜间呼吸困难，无一过性意识丧失、黑蒙等，无发绀及双下肢水肿，食欲尚可，大小便正常。    weight=    assistCheck=心脏超声检查“左房大，余未见异常”。动态心电图监测：窦性心律，总心率65421次，最快62次／分，最慢35次／分，平均45次／分；心脏超声检查：左房大，余未见异常；外院平板运动心电图：心率一直在50次／分水平；运动7分钟时，患者明显胸闷、呼吸困难要求终止运动，期间心电图ST‐T未见明显变化    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病窦综合征

心脏科经典病历45行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=74    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=160    lowBldPress=80    personalHistory=    previousHistory=高血压病史十余年，最高血压达180／100mmHg，长期不规则服用降压药治疗，血压控制欠佳。“持续性房颤”病史5年，未规律用药。否认糖尿病、高脂血症史。吸烟30年，每天20～40支。
    ...    symptom=反复胸闷气促5年，加重伴双下肢水肿1个月#####颈静脉充盈，未见异常搏动。轻度桶状胸，呼吸稍促，触觉语颤正常，肺部叩诊清音，双肺呼吸音稍低，双下肺可及捻发音。心尖搏动较弱，心尖搏动点位于左第5肋间锁骨中线，心界临界大小，HR90次／分，心音低钝，心律绝对不齐，强度绝对不等，心前区可闻及Ⅱ／6级收缩期吹风样杂音，传导局限。双下肢可及压陷性水肿。 现病史:患者5年前出现反复胸闷气促，多于快速行走或劳累时出现，持续半小时后可自行缓解，自含服保心丸后可缓解，无胸痛，偶伴夜间阵发性呼吸困难发作，无明显尿少。近一月来，稍事活动即有明显气急气促，步行50米即需停下休息，经常夜间睡眠不能平卧，伴夜间阵发性呼吸困难，坐起后可缓解，尿量少，出现双下肢水肿。无晕厥、黑曚等症状。    weight=    assistCheck=BNP106pg／mL。X线：心脏向左下扩大，CTR60%，双肺瘀血。心电图：房颤心律，室性期前收缩，Ⅰ、Ⅱ、Ⅲ、aVL、aVF T波低平。超声心电图（UCG）：左房室内径增大（L A53mm，L VESD37mm，L VEDD57mm），左室壁收缩活动减弱，EF＝0.47；中度二尖瓣反流。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

心脏科经典病历45行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=74    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=160    lowBldPress=80    personalHistory=    previousHistory=高血压病史十余年，最高血压达180／100mmHg，长期不规则服用降压药治疗，血压控制欠佳。“持续性房颤”病史5年，未规律用药。否认糖尿病、高脂血症史。吸烟30年，每天20～40支。
    ...    symptom=反复胸闷气促5年，加重伴双下肢水肿1个月#####颈静脉充盈，未见异常搏动。轻度桶状胸，呼吸稍促，触觉语颤正常，肺部叩诊清音，双肺呼吸音稍低，双下肺可及捻发音。心尖搏动较弱，心尖搏动点位于左第5肋间锁骨中线，心界临界大小，HR90次／分，心音低钝，心律绝对不齐，强度绝对不等，心前区可闻及Ⅱ／6级收缩期吹风样杂音，传导局限。双下肢可及压陷性水肿。 现病史:患者5年前出现反复胸闷气促，多于快速行走或劳累时出现，持续半小时后可自行缓解，自含服保心丸后可缓解，无胸痛，偶伴夜间阵发性呼吸困难发作，无明显尿少。近一月来，稍事活动即有明显气急气促，步行50米即需停下休息，经常夜间睡眠不能平卧，伴夜间阵发性呼吸困难，坐起后可缓解，尿量少，出现双下肢水肿。无晕厥、黑曚等症状。    weight=    assistCheck=BNP106pg／mL。X线：心脏向左下扩大，CTR60%，双肺瘀血。心电图：房颤心律，室性期前收缩，Ⅰ、Ⅱ、Ⅲ、aVL、aVF T波低平。超声心电图（UCG）：左房室内径增大（L A53mm，L VESD37mm，L VEDD57mm），左室壁收缩活动减弱，EF＝0.47；中度二尖瓣反流。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心律失常

心脏科经典病历45行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=74    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=160    lowBldPress=80    personalHistory=    previousHistory=高血压病史十余年，最高血压达180／100mmHg，长期不规则服用降压药治疗，血压控制欠佳。“持续性房颤”病史5年，未规律用药。否认糖尿病、高脂血症史。吸烟30年，每天20～40支。
    ...    symptom=反复胸闷气促5年，加重伴双下肢水肿1个月#####颈静脉充盈，未见异常搏动。轻度桶状胸，呼吸稍促，触觉语颤正常，肺部叩诊清音，双肺呼吸音稍低，双下肺可及捻发音。心尖搏动较弱，心尖搏动点位于左第5肋间锁骨中线，心界临界大小，HR90次／分，心音低钝，心律绝对不齐，强度绝对不等，心前区可闻及Ⅱ／6级收缩期吹风样杂音，传导局限。双下肢可及压陷性水肿。 现病史:患者5年前出现反复胸闷气促，多于快速行走或劳累时出现，持续半小时后可自行缓解，自含服保心丸后可缓解，无胸痛，偶伴夜间阵发性呼吸困难发作，无明显尿少。近一月来，稍事活动即有明显气急气促，步行50米即需停下休息，经常夜间睡眠不能平卧，伴夜间阵发性呼吸困难，坐起后可缓解，尿量少，出现双下肢水肿。无晕厥、黑曚等症状。    weight=    assistCheck=BNP106pg／mL。X线：心脏向左下扩大，CTR60%，双肺瘀血。心电图：房颤心律，室性期前收缩，Ⅰ、Ⅱ、Ⅲ、aVL、aVF T波低平。超声心电图（UCG）：左房室内径增大（L A53mm，L VESD37mm，L VEDD57mm），左室壁收缩活动减弱，EF＝0.47；中度二尖瓣反流。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心房颤动

心脏科经典病历45行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=74    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=160    lowBldPress=80    personalHistory=    previousHistory=高血压病史十余年，最高血压达180／100mmHg，长期不规则服用降压药治疗，血压控制欠佳。“持续性房颤”病史5年，未规律用药。否认糖尿病、高脂血症史。吸烟30年，每天20～40支。
    ...    symptom=反复胸闷气促5年，加重伴双下肢水肿1个月#####颈静脉充盈，未见异常搏动。轻度桶状胸，呼吸稍促，触觉语颤正常，肺部叩诊清音，双肺呼吸音稍低，双下肺可及捻发音。心尖搏动较弱，心尖搏动点位于左第5肋间锁骨中线，心界临界大小，HR90次／分，心音低钝，心律绝对不齐，强度绝对不等，心前区可闻及Ⅱ／6级收缩期吹风样杂音，传导局限。双下肢可及压陷性水肿。 现病史:患者5年前出现反复胸闷气促，多于快速行走或劳累时出现，持续半小时后可自行缓解，自含服保心丸后可缓解，无胸痛，偶伴夜间阵发性呼吸困难发作，无明显尿少。近一月来，稍事活动即有明显气急气促，步行50米即需停下休息，经常夜间睡眠不能平卧，伴夜间阵发性呼吸困难，坐起后可缓解，尿量少，出现双下肢水肿。无晕厥、黑曚等症状。    weight=    assistCheck=BNP106pg／mL。X线：心脏向左下扩大，CTR60%，双肺瘀血。心电图：房颤心律，室性期前收缩，Ⅰ、Ⅱ、Ⅲ、aVL、aVF T波低平。超声心电图（UCG）：左房室内径增大（L A53mm，L VESD37mm，L VEDD57mm），左室壁收缩活动减弱，EF＝0.47；中度二尖瓣反流。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

心脏科经典病历46行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=75    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=发现高血压5年，血压最高为160／110mmHg，间断服复方降压片1片，每日2次，血压145／100mmHg
    ...    symptom=心悸、乏力10年，行路久后气喘2年，加重伴频繁心前区痛1月#####叩诊心界向左下扩大约1c m，心尖搏动欠有力。听诊于右第2肋间可闻及粗糙的收缩期杂音Ⅳ／6级，伴震颤和向颈部传导，A2减弱，P2不亢进。于左第3～4肋间也可闻及Ⅲ／6级收缩期杂音，但响度小于前者，不伴震颤。双踝部水肿。 现病史:10年前偶感心悸，长途步行感乏力，2年前在走坡路时气喘，休息片刻后能完全缓解，去医院检查发现主动脉第一听诊区有粗糙的收缩期3／6级杂音，向颈部传导，主动脉第二音（A2）减弱。心电图：左心室肥大伴ST段下降0.1mV，T波倒置。超声心动图：主动脉瓣收缩期开放受限，活动幅度减小，瓣叶回声异常增强、增厚。彩色多普勒血流显像：主动脉瓣口收缩期血流呈五彩镶嵌状，连续多普勒获取血流频谱，计算平均跨瓣压差39mmHg，收缩期峰值血流速度3.2m／s。近一月来散步和上二楼时均感气喘和心前区紧缩样疼痛，休息约10分钟缓解，并有夜间因气喘不能平卧。近一周来休息时心绞痛发作两次，持续约10分钟，自行缓解。    weight=    assistCheck=心电图：RV5＋SV1＝5.0mV，Ⅱ、Ⅲ、aVF和V4～6ST段下降0.2mV，R波为主的导联T波均倒置呈冠状T波。无Q波。超声心动图：左室舒张末径60mm，室壁对称性增厚13mm，主动脉瓣增厚、僵硬、回声异常增强和运动幅度减小，连续多普勒获取血流频谱，计算平均跨瓣压差70mmHg，收缩期峰值血流速度5.2m／s。X线胸片：后前位示左室向左下扩大，心胸比值58%；左侧位示心后间隙几近消失，主动脉根部有多处月牙形和小片状的钙化影。冠状动脉造影示：左冠状动脉前降支近中段和对角支开口均有约90%狭窄，右冠状动脉第1～2屈膝部之间狭窄约为85%，病变长度分别为12mm、14mm和13mm（参考段血管直径为3mm）。左、右冠状动脉均呈迂曲走形，且僵硬。左室造影示左心扩大，射血分数为45%，左室压186／22mmHg，主动脉压116／80mmHg，平均跨瓣压差70mmHg，室壁厚13mm。主动脉根部及主动脉瓣部位均可见钙化影，随心搏运动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉瓣狭窄

心脏科经典病历46行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=75    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=发现高血压5年，血压最高为160／110mmHg，间断服复方降压片1片，每日2次，血压145／100mmHg
    ...    symptom=心悸、乏力10年，行路久后气喘2年，加重伴频繁心前区痛1月#####叩诊心界向左下扩大约1c m，心尖搏动欠有力。听诊于右第2肋间可闻及粗糙的收缩期杂音Ⅳ／6级，伴震颤和向颈部传导，A2减弱，P2不亢进。于左第3～4肋间也可闻及Ⅲ／6级收缩期杂音，但响度小于前者，不伴震颤。双踝部水肿。 现病史:10年前偶感心悸，长途步行感乏力，2年前在走坡路时气喘，休息片刻后能完全缓解，去医院检查发现主动脉第一听诊区有粗糙的收缩期3／6级杂音，向颈部传导，主动脉第二音（A2）减弱。心电图：左心室肥大伴ST段下降0.1mV，T波倒置。超声心动图：主动脉瓣收缩期开放受限，活动幅度减小，瓣叶回声异常增强、增厚。彩色多普勒血流显像：主动脉瓣口收缩期血流呈五彩镶嵌状，连续多普勒获取血流频谱，计算平均跨瓣压差39mmHg，收缩期峰值血流速度3.2m／s。近一月来散步和上二楼时均感气喘和心前区紧缩样疼痛，休息约10分钟缓解，并有夜间因气喘不能平卧。近一周来休息时心绞痛发作两次，持续约10分钟，自行缓解。    weight=    assistCheck=心电图：RV5＋SV1＝5.0mV，Ⅱ、Ⅲ、aVF和V4～6ST段下降0.2mV，R波为主的导联T波均倒置呈冠状T波。无Q波。超声心动图：左室舒张末径60mm，室壁对称性增厚13mm，主动脉瓣增厚、僵硬、回声异常增强和运动幅度减小，连续多普勒获取血流频谱，计算平均跨瓣压差70mmHg，收缩期峰值血流速度5.2m／s。X线胸片：后前位示左室向左下扩大，心胸比值58%；左侧位示心后间隙几近消失，主动脉根部有多处月牙形和小片状的钙化影。冠状动脉造影示：左冠状动脉前降支近中段和对角支开口均有约90%狭窄，右冠状动脉第1～2屈膝部之间狭窄约为85%，病变长度分别为12mm、14mm和13mm（参考段血管直径为3mm）。左、右冠状动脉均呈迂曲走形，且僵硬。左室造影示左心扩大，射血分数为45%，左室压186／22mmHg，主动脉压116／80mmHg，平均跨瓣压差70mmHg，室壁厚13mm。主动脉根部及主动脉瓣部位均可见钙化影，随心搏运动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历46行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=75    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=发现高血压5年，血压最高为160／110mmHg，间断服复方降压片1片，每日2次，血压145／100mmHg
    ...    symptom=心悸、乏力10年，行路久后气喘2年，加重伴频繁心前区痛1月#####叩诊心界向左下扩大约1c m，心尖搏动欠有力。听诊于右第2肋间可闻及粗糙的收缩期杂音Ⅳ／6级，伴震颤和向颈部传导，A2减弱，P2不亢进。于左第3～4肋间也可闻及Ⅲ／6级收缩期杂音，但响度小于前者，不伴震颤。双踝部水肿。 现病史:10年前偶感心悸，长途步行感乏力，2年前在走坡路时气喘，休息片刻后能完全缓解，去医院检查发现主动脉第一听诊区有粗糙的收缩期3／6级杂音，向颈部传导，主动脉第二音（A2）减弱。心电图：左心室肥大伴ST段下降0.1mV，T波倒置。超声心动图：主动脉瓣收缩期开放受限，活动幅度减小，瓣叶回声异常增强、增厚。彩色多普勒血流显像：主动脉瓣口收缩期血流呈五彩镶嵌状，连续多普勒获取血流频谱，计算平均跨瓣压差39mmHg，收缩期峰值血流速度3.2m／s。近一月来散步和上二楼时均感气喘和心前区紧缩样疼痛，休息约10分钟缓解，并有夜间因气喘不能平卧。近一周来休息时心绞痛发作两次，持续约10分钟，自行缓解。    weight=    assistCheck=心电图：RV5＋SV1＝5.0mV，Ⅱ、Ⅲ、aVF和V4～6ST段下降0.2mV，R波为主的导联T波均倒置呈冠状T波。无Q波。超声心动图：左室舒张末径60mm，室壁对称性增厚13mm，主动脉瓣增厚、僵硬、回声异常增强和运动幅度减小，连续多普勒获取血流频谱，计算平均跨瓣压差70mmHg，收缩期峰值血流速度5.2m／s。X线胸片：后前位示左室向左下扩大，心胸比值58%；左侧位示心后间隙几近消失，主动脉根部有多处月牙形和小片状的钙化影。冠状动脉造影示：左冠状动脉前降支近中段和对角支开口均有约90%狭窄，右冠状动脉第1～2屈膝部之间狭窄约为85%，病变长度分别为12mm、14mm和13mm（参考段血管直径为3mm）。左、右冠状动脉均呈迂曲走形，且僵硬。左室造影示左心扩大，射血分数为45%，左室压186／22mmHg，主动脉压116／80mmHg，平均跨瓣压差70mmHg，室壁厚13mm。主动脉根部及主动脉瓣部位均可见钙化影，随心搏运动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历46行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=75    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=发现高血压5年，血压最高为160／110mmHg，间断服复方降压片1片，每日2次，血压145／100mmHg
    ...    symptom=心悸、乏力10年，行路久后气喘2年，加重伴频繁心前区痛1月#####叩诊心界向左下扩大约1c m，心尖搏动欠有力。听诊于右第2肋间可闻及粗糙的收缩期杂音Ⅳ／6级，伴震颤和向颈部传导，A2减弱，P2不亢进。于左第3～4肋间也可闻及Ⅲ／6级收缩期杂音，但响度小于前者，不伴震颤。双踝部水肿。 现病史:10年前偶感心悸，长途步行感乏力，2年前在走坡路时气喘，休息片刻后能完全缓解，去医院检查发现主动脉第一听诊区有粗糙的收缩期3／6级杂音，向颈部传导，主动脉第二音（A2）减弱。心电图：左心室肥大伴ST段下降0.1mV，T波倒置。超声心动图：主动脉瓣收缩期开放受限，活动幅度减小，瓣叶回声异常增强、增厚。彩色多普勒血流显像：主动脉瓣口收缩期血流呈五彩镶嵌状，连续多普勒获取血流频谱，计算平均跨瓣压差39mmHg，收缩期峰值血流速度3.2m／s。近一月来散步和上二楼时均感气喘和心前区紧缩样疼痛，休息约10分钟缓解，并有夜间因气喘不能平卧。近一周来休息时心绞痛发作两次，持续约10分钟，自行缓解。    weight=    assistCheck=心电图：RV5＋SV1＝5.0mV，Ⅱ、Ⅲ、aVF和V4～6ST段下降0.2mV，R波为主的导联T波均倒置呈冠状T波。无Q波。超声心动图：左室舒张末径60mm，室壁对称性增厚13mm，主动脉瓣增厚、僵硬、回声异常增强和运动幅度减小，连续多普勒获取血流频谱，计算平均跨瓣压差70mmHg，收缩期峰值血流速度5.2m／s。X线胸片：后前位示左室向左下扩大，心胸比值58%；左侧位示心后间隙几近消失，主动脉根部有多处月牙形和小片状的钙化影。冠状动脉造影示：左冠状动脉前降支近中段和对角支开口均有约90%狭窄，右冠状动脉第1～2屈膝部之间狭窄约为85%，病变长度分别为12mm、14mm和13mm（参考段血管直径为3mm）。左、右冠状动脉均呈迂曲走形，且僵硬。左室造影示左心扩大，射血分数为45%，左室压186／22mmHg，主动脉压116／80mmHg，平均跨瓣压差70mmHg，室壁厚13mm。主动脉根部及主动脉瓣部位均可见钙化影，随心搏运动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    不稳定性心绞痛

心脏科经典病历46行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=75    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=发现高血压5年，血压最高为160／110mmHg，间断服复方降压片1片，每日2次，血压145／100mmHg
    ...    symptom=心悸、乏力10年，行路久后气喘2年，加重伴频繁心前区痛1月#####叩诊心界向左下扩大约1c m，心尖搏动欠有力。听诊于右第2肋间可闻及粗糙的收缩期杂音Ⅳ／6级，伴震颤和向颈部传导，A2减弱，P2不亢进。于左第3～4肋间也可闻及Ⅲ／6级收缩期杂音，但响度小于前者，不伴震颤。双踝部水肿。 现病史:10年前偶感心悸，长途步行感乏力，2年前在走坡路时气喘，休息片刻后能完全缓解，去医院检查发现主动脉第一听诊区有粗糙的收缩期3／6级杂音，向颈部传导，主动脉第二音（A2）减弱。心电图：左心室肥大伴ST段下降0.1mV，T波倒置。超声心动图：主动脉瓣收缩期开放受限，活动幅度减小，瓣叶回声异常增强、增厚。彩色多普勒血流显像：主动脉瓣口收缩期血流呈五彩镶嵌状，连续多普勒获取血流频谱，计算平均跨瓣压差39mmHg，收缩期峰值血流速度3.2m／s。近一月来散步和上二楼时均感气喘和心前区紧缩样疼痛，休息约10分钟缓解，并有夜间因气喘不能平卧。近一周来休息时心绞痛发作两次，持续约10分钟，自行缓解。    weight=    assistCheck=心电图：RV5＋SV1＝5.0mV，Ⅱ、Ⅲ、aVF和V4～6ST段下降0.2mV，R波为主的导联T波均倒置呈冠状T波。无Q波。超声心动图：左室舒张末径60mm，室壁对称性增厚13mm，主动脉瓣增厚、僵硬、回声异常增强和运动幅度减小，连续多普勒获取血流频谱，计算平均跨瓣压差70mmHg，收缩期峰值血流速度5.2m／s。X线胸片：后前位示左室向左下扩大，心胸比值58%；左侧位示心后间隙几近消失，主动脉根部有多处月牙形和小片状的钙化影。冠状动脉造影示：左冠状动脉前降支近中段和对角支开口均有约90%狭窄，右冠状动脉第1～2屈膝部之间狭窄约为85%，病变长度分别为12mm、14mm和13mm（参考段血管直径为3mm）。左、右冠状动脉均呈迂曲走形，且僵硬。左室造影示左心扩大，射血分数为45%，左室压186／22mmHg，主动脉压116／80mmHg，平均跨瓣压差70mmHg，室壁厚13mm。主动脉根部及主动脉瓣部位均可见钙化影，随心搏运动。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    原发性高血压

心脏科经典病历47行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.2    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=120    lowBldPress=65    personalHistory=    previousHistory=既往体质较差，不能耐受长时间体力劳动。否认高血压、糖尿病、冠心病、肝炎、结核等病史。否认重大外伤及手术史。否认家族性遗传性疾病史。
    ...    symptom=因“拔牙后持续中等程度发热7天”而入院#####慢性病容，高枕卧位，全身皮肤黏膜未见明显出血点。主动脉瓣听诊区可闻及粗糙的收缩期递增递减型杂音，双肺呼吸音粗。腹平软，肝脾未触及肿大，移动性浊音阴性。 现病史:患者出生后体检时就发现心脏杂音。未有不适，因此未予治疗。一周前因拔牙手术后出现发热，在社区门诊给予甲硝唑、先锋霉素等静脉滴注，效果差。体温持续在37.5℃～38.8℃，伴有头痛、肌肉关节痛、胸闷、气短不能平卧。遂到医院就诊，病程中无游走性关节疼痛，无发绀及双下肢水肿等病史。    weight=    assistCheck="血常规示：WBC12×109／L，，中性粒细胞占75%，血红蛋白115g／L。生化检查示血钾3.0mmol／L。 心电图示：窦性心律，左室高电压。经胸心脏超声TTE检查示二叶主动脉瓣，主动脉瓣狭窄（中度），瓣口面积约0.9c m2／m2体表面积。主动脉瓣周可见赘生物。经食管超声（TEE）证实主动脉瓣周赘生物约3mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历47行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.2    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=120    lowBldPress=65    personalHistory=    previousHistory=既往体质较差，不能耐受长时间体力劳动。否认高血压、糖尿病、冠心病、肝炎、结核等病史。否认重大外伤及手术史。否认家族性遗传性疾病史。
    ...    symptom=因“拔牙后持续中等程度发热7天”而入院#####慢性病容，高枕卧位，全身皮肤黏膜未见明显出血点。主动脉瓣听诊区可闻及粗糙的收缩期递增递减型杂音，双肺呼吸音粗。腹平软，肝脾未触及肿大，移动性浊音阴性。 现病史:患者出生后体检时就发现心脏杂音。未有不适，因此未予治疗。一周前因拔牙手术后出现发热，在社区门诊给予甲硝唑、先锋霉素等静脉滴注，效果差。体温持续在37.5℃～38.8℃，伴有头痛、肌肉关节痛、胸闷、气短不能平卧。遂到医院就诊，病程中无游走性关节疼痛，无发绀及双下肢水肿等病史。    weight=    assistCheck="血常规示：WBC12×109／L，，中性粒细胞占75%，血红蛋白115g／L。生化检查示血钾3.0mmol／L。 心电图示：窦性心律，左室高电压。经胸心脏超声TTE检查示二叶主动脉瓣，主动脉瓣狭窄（中度），瓣口面积约0.9c m2／m2体表面积。主动脉瓣周可见赘生物。经食管超声（TEE）证实主动脉瓣周赘生物约3mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉瓣狭窄

心脏科经典病历47行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.2    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=120    lowBldPress=65    personalHistory=    previousHistory=既往体质较差，不能耐受长时间体力劳动。否认高血压、糖尿病、冠心病、肝炎、结核等病史。否认重大外伤及手术史。否认家族性遗传性疾病史。
    ...    symptom=因“拔牙后持续中等程度发热7天”而入院#####慢性病容，高枕卧位，全身皮肤黏膜未见明显出血点。主动脉瓣听诊区可闻及粗糙的收缩期递增递减型杂音，双肺呼吸音粗。腹平软，肝脾未触及肿大，移动性浊音阴性。 现病史:患者出生后体检时就发现心脏杂音。未有不适，因此未予治疗。一周前因拔牙手术后出现发热，在社区门诊给予甲硝唑、先锋霉素等静脉滴注，效果差。体温持续在37.5℃～38.8℃，伴有头痛、肌肉关节痛、胸闷、气短不能平卧。遂到医院就诊，病程中无游走性关节疼痛，无发绀及双下肢水肿等病史。    weight=    assistCheck="血常规示：WBC12×109／L，，中性粒细胞占75%，血红蛋白115g／L。生化检查示血钾3.0mmol／L。 心电图示：窦性心律，左室高电压。经胸心脏超声TTE检查示二叶主动脉瓣，主动脉瓣狭窄（中度），瓣口面积约0.9c m2／m2体表面积。主动脉瓣周可见赘生物。经食管超声（TEE）证实主动脉瓣周赘生物约3mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    感染性心内膜炎

心脏科经典病历47行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.2    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=120    lowBldPress=65    personalHistory=    previousHistory=既往体质较差，不能耐受长时间体力劳动。否认高血压、糖尿病、冠心病、肝炎、结核等病史。否认重大外伤及手术史。否认家族性遗传性疾病史。
    ...    symptom=因“拔牙后持续中等程度发热7天”而入院#####慢性病容，高枕卧位，全身皮肤黏膜未见明显出血点。主动脉瓣听诊区可闻及粗糙的收缩期递增递减型杂音，双肺呼吸音粗。腹平软，肝脾未触及肿大，移动性浊音阴性。 现病史:患者出生后体检时就发现心脏杂音。未有不适，因此未予治疗。一周前因拔牙手术后出现发热，在社区门诊给予甲硝唑、先锋霉素等静脉滴注，效果差。体温持续在37.5℃～38.8℃，伴有头痛、肌肉关节痛、胸闷、气短不能平卧。遂到医院就诊，病程中无游走性关节疼痛，无发绀及双下肢水肿等病史。    weight=    assistCheck="血常规示：WBC12×109／L，，中性粒细胞占75%，血红蛋白115g／L。生化检查示血钾3.0mmol／L。 心电图示：窦性心律，左室高电压。经胸心脏超声TTE检查示二叶主动脉瓣，主动脉瓣狭窄（中度），瓣口面积约0.9c m2／m2体表面积。主动脉瓣周可见赘生物。经食管超声（TEE）证实主动脉瓣周赘生物约3mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历47行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.2    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=120    lowBldPress=65    personalHistory=    previousHistory=既往体质较差，不能耐受长时间体力劳动。否认高血压、糖尿病、冠心病、肝炎、结核等病史。否认重大外伤及手术史。否认家族性遗传性疾病史。
    ...    symptom=因“拔牙后持续中等程度发热7天”而入院#####慢性病容，高枕卧位，全身皮肤黏膜未见明显出血点。主动脉瓣听诊区可闻及粗糙的收缩期递增递减型杂音，双肺呼吸音粗。腹平软，肝脾未触及肿大，移动性浊音阴性。 现病史:患者出生后体检时就发现心脏杂音。未有不适，因此未予治疗。一周前因拔牙手术后出现发热，在社区门诊给予甲硝唑、先锋霉素等静脉滴注，效果差。体温持续在37.5℃～38.8℃，伴有头痛、肌肉关节痛、胸闷、气短不能平卧。遂到医院就诊，病程中无游走性关节疼痛，无发绀及双下肢水肿等病史。    weight=    assistCheck="血常规示：WBC12×109／L，，中性粒细胞占75%，血红蛋白115g／L。生化检查示血钾3.0mmol／L。 心电图示：窦性心律，左室高电压。经胸心脏超声TTE检查示二叶主动脉瓣，主动脉瓣狭窄（中度），瓣口面积约0.9c m2／m2体表面积。主动脉瓣周可见赘生物。经食管超声（TEE）证实主动脉瓣周赘生物约3mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    低钾血症

心脏科经典病历48行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=家人否认有家族遗传病史及其他特殊病史
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=活动后心慌，气短10余年#####心界向左侧扩大，心率90次／分，律齐，胸骨左缘2～3肋间可闻及3／6级收缩期吹风样杂音，向左颈部传导，震颤（－）、P2延长减弱，P2＜A2。腹胀，肝、脾肋下未触及，肝颈静脉回流征（－），双下肢无水肿，杵状指阴性。生理反射存在，病理反射未引出。 现病史:患者家人诉患儿出生后易哭闹，查体时发现心脏杂音（具体不详），未进一步诊治。患者年幼时常在哭闹及活动后伴心慌气短，5岁后活动量较同龄健康儿童明显减少，无口唇发绀、晕厥、咯血及蹲踞史。平素无双下肢水肿，自觉饮食，精神可，大小便正常。    weight=41    assistCheck=血常规：WBC6.0×109／L，L39.5%，M8.7%，N51.8%，RBC4.36×1012／L，Hb136g／L，PLT248×109／L。胸部正位片：肺充血、右心室大。心电图：右室肥厚，电轴右偏，右胸导联R波增高，左胸导联S波加深。超声心动图：右室肥厚、收缩期肺动脉瓣圆顶征，肺动脉与右室存在压力阶差。连续多普勒显示一个高速血流通过右室流出道    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历48行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=家人否认有家族遗传病史及其他特殊病史
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=活动后心慌，气短10余年#####心界向左侧扩大，心率90次／分，律齐，胸骨左缘2～3肋间可闻及3／6级收缩期吹风样杂音，向左颈部传导，震颤（－）、P2延长减弱，P2＜A2。腹胀，肝、脾肋下未触及，肝颈静脉回流征（－），双下肢无水肿，杵状指阴性。生理反射存在，病理反射未引出。 现病史:患者家人诉患儿出生后易哭闹，查体时发现心脏杂音（具体不详），未进一步诊治。患者年幼时常在哭闹及活动后伴心慌气短，5岁后活动量较同龄健康儿童明显减少，无口唇发绀、晕厥、咯血及蹲踞史。平素无双下肢水肿，自觉饮食，精神可，大小便正常。    weight=41    assistCheck=血常规：WBC6.0×109／L，L39.5%，M8.7%，N51.8%，RBC4.36×1012／L，Hb136g／L，PLT248×109／L。胸部正位片：肺充血、右心室大。心电图：右室肥厚，电轴右偏，右胸导联R波增高，左胸导联S波加深。超声心动图：右室肥厚、收缩期肺动脉瓣圆顶征，肺动脉与右室存在压力阶差。连续多普勒显示一个高速血流通过右室流出道    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉瓣狭窄

心脏科经典病历49行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=以“左侧肢体无力2周”为主诉就诊#####心界不大，心率90次／分，律齐，肺动脉瓣区第二心音亢进呈固定性分裂，并可闻及2／6～3／6级收缩期喷射性杂音。腹部查体未见明显阳性体征。 现病史:患者在儿时常因感冒在当地医院就诊，2周前因左侧肢体无力到神经内科治疗，诊断为“右侧基底节区脑梗死”，查体时发现“心脏杂音”，病程中无发绀、无咯血、无食欲减退及水肿。    weight=    assistCheck=心电图：窦性心律，不完全性右束支传导阻滞，电轴右偏。胸部X线：肺动脉突出及肺血管影增加。多普勒超声心动图：右室扩大，房间隔中部回声中断约23mm，可见左房向右房分流，房顶部残端约10mm，大动脉侧残端约9mm，上下腔静脉侧残端约12mm；肺动脉血流增加，测定肺动脉压40mmHg。经食道超声可见房间隔缺损的部位    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    房间隔缺损

心脏科经典病历50行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音20余年，活动后胸闷、气短2个月#####左室心尖搏动向左侧移位，搏动增强。在胸骨左缘第4、5肋间隙可闻及粗糙全收缩期喷射性杂音，伴收缩期震颤，并向胸骨右缘传导；肺动脉瓣区P2亢进。 现病史:患者在20余年前体检时发现心脏有杂音。因经济原因未接受进一步治疗。20年来无明显的不适症状。近2个月，患者活动后出现胸闷、气短，无明显胸痛、无发绀、无咯血、无食欲减退、晕厥及水肿。运动耐力减低。    weight=    assistCheck="心电图：窦性心律，左心室肥厚。 胸部X线：左、右心室扩大，肺动脉段突出，肺血管充血，外周血管血量过多以及近端血管扩张。侧位片可见左房扩大。多普勒超声心动图：左心室、左心房及右心室内径增大；室间隔连续性中断，多普勒超声可测得高速湍流及左向右分流，测量室间隔膜部缺损约8mm，缺损上缘距主动脉瓣约4mm，无主动脉瓣反流，肺动脉压约40mmHg。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历50行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音20余年，活动后胸闷、气短2个月#####左室心尖搏动向左侧移位，搏动增强。在胸骨左缘第4、5肋间隙可闻及粗糙全收缩期喷射性杂音，伴收缩期震颤，并向胸骨右缘传导；肺动脉瓣区P2亢进。 现病史:患者在20余年前体检时发现心脏有杂音。因经济原因未接受进一步治疗。20年来无明显的不适症状。近2个月，患者活动后出现胸闷、气短，无明显胸痛、无发绀、无咯血、无食欲减退、晕厥及水肿。运动耐力减低。    weight=    assistCheck="心电图：窦性心律，左心室肥厚。 胸部X线：左、右心室扩大，肺动脉段突出，肺血管充血，外周血管血量过多以及近端血管扩张。侧位片可见左房扩大。多普勒超声心动图：左心室、左心房及右心室内径增大；室间隔连续性中断，多普勒超声可测得高速湍流及左向右分流，测量室间隔膜部缺损约8mm，缺损上缘距主动脉瓣约4mm，无主动脉瓣反流，肺动脉压约40mmHg。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    室间隔缺损

心脏科经典病历50行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音20余年，活动后胸闷、气短2个月#####左室心尖搏动向左侧移位，搏动增强。在胸骨左缘第4、5肋间隙可闻及粗糙全收缩期喷射性杂音，伴收缩期震颤，并向胸骨右缘传导；肺动脉瓣区P2亢进。 现病史:患者在20余年前体检时发现心脏有杂音。因经济原因未接受进一步治疗。20年来无明显的不适症状。近2个月，患者活动后出现胸闷、气短，无明显胸痛、无发绀、无咯血、无食欲减退、晕厥及水肿。运动耐力减低。    weight=    assistCheck="心电图：窦性心律，左心室肥厚。 胸部X线：左、右心室扩大，肺动脉段突出，肺血管充血，外周血管血量过多以及近端血管扩张。侧位片可见左房扩大。多普勒超声心动图：左心室、左心房及右心室内径增大；室间隔连续性中断，多普勒超声可测得高速湍流及左向右分流，测量室间隔膜部缺损约8mm，缺损上缘距主动脉瓣约4mm，无主动脉瓣反流，肺动脉压约40mmHg。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉高压

心脏科经典病历51行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=120    lowBldPress=50    personalHistory=    previousHistory=患者家人否认患者既往有其他特殊病史及家族遗传病史
    ...    symptom=以“发现心脏杂音20年，活动后胸闷、气短半年余”为主诉就诊#####心界不大，心率90次／分，律齐，胸骨左缘2、3肋间可闻及机器样连续性杂音。腹部查体未见明显阳性体征。可触及水冲脉。 现病史:患者家属诉20年前患者出生后，因上呼吸道感染于外院治疗，体格检查时发现“心脏杂音”，由于一般情况良好，未行进一步诊治，病程中无发绀，无呼吸困难、无晕厥。半年前活动后感胸闷、气短，休息后症状可以缓解，患者自诉活动耐量较前有所下降    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历51行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=120    lowBldPress=50    personalHistory=    previousHistory=患者家人否认患者既往有其他特殊病史及家族遗传病史
    ...    symptom=以“发现心脏杂音20年，活动后胸闷、气短半年余”为主诉就诊#####心界不大，心率90次／分，律齐，胸骨左缘2、3肋间可闻及机器样连续性杂音。腹部查体未见明显阳性体征。可触及水冲脉。 现病史:患者家属诉20年前患者出生后，因上呼吸道感染于外院治疗，体格检查时发现“心脏杂音”，由于一般情况良好，未行进一步诊治，病程中无发绀，无呼吸困难、无晕厥。半年前活动后感胸闷、气短，休息后症状可以缓解，患者自诉活动耐量较前有所下降    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    动脉导管未闭

心脏科经典病历51行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=80    highBldPress=120    lowBldPress=50    personalHistory=    previousHistory=患者家人否认患者既往有其他特殊病史及家族遗传病史
    ...    symptom=以“发现心脏杂音20年，活动后胸闷、气短半年余”为主诉就诊#####心界不大，心率90次／分，律齐，胸骨左缘2、3肋间可闻及机器样连续性杂音。腹部查体未见明显阳性体征。可触及水冲脉。 现病史:患者家属诉20年前患者出生后，因上呼吸道感染于外院治疗，体格检查时发现“心脏杂音”，由于一般情况良好，未行进一步诊治，病程中无发绀，无呼吸困难、无晕厥。半年前活动后感胸闷、气短，休息后症状可以缓解，患者自诉活动耐量较前有所下降    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉高压

心脏科经典病历52行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=65    highBldPress=160    lowBldPress=80    personalHistory=20年前生育一子    previousHistory=高血压病史3年，否认糖尿病、冠心病、肝炎、结核病史
    ...    symptom=胸背、剑突下持续性剧痛11小时#####急性痛苦病容，自动体位，平车入室，心率65次／分，律齐，心音正常，A2＞P2，各瓣膜听诊区未及杂音及病理性第三心音，右侧肱动脉处可闻及杂音； 现病史:11小时前，患者夜间睡眠中突感胸闷、双侧肩背部剧痛，难以耐受，当地社区医院就诊，予“消心痛”等治疗无效，疼痛逐渐扩展至胸部及剑突，脐周。    weight=    assistCheck=肌钙蛋白弱阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    主动脉夹层

心脏科经典病历53行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=61    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=105    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=劳力后出现胸闷气短、心悸，夜间不能平卧7天，伴有干咳#####颈静脉充盈明显，心率90次／分，节律齐，心尖部S1有力，呼吸24次／分，两肺底可闻及湿啰音 现病史:近日劳力后出现胸闷气短、心悸，夜间不能平卧，伴有干咳，曾多次去医院治疗，诊断为冠心病，左心功能不全。临床给予强心利尿扩冠等治疗后效果不佳，行冠状动脉造影检查未见异常病变。    weight=    assistCheck=D‐二聚体：1.2mg／L；动脉血气分析：pH7.44，PCO237﹒1mmHg，PO267﹒7mmHg，SaO294﹒3%；超声心动：右室收缩幅度较左室增强，右室略扩大，伴有轻中度三尖瓣反流，EF0.67。肺动脉造影术，右中下肺动脉血流缺损，左下肺动脉部分血流缺损，肺动脉收缩压为74mmHg    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺栓塞

心脏科经典病历54行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=1    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音1年#####营养稍差，口唇无明显发绀。胸骨左缘3～4肋间闻及Ⅲ～Ⅳ/6吹风样收缩期杂音，P2不亢，可触及震颤。 现病史:    weight=    assistCheck=辅助检查:心脏彩超示法洛四联症。CT血管造影术（心脏CTA）：四腔位、斜冠位、斜矢状位重建。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    法洛四联症

心脏科经典病历55行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=家人否认有家族遗传病史及其他特殊病史
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=活动后心慌，气短10余年#####心界向左侧扩大，心率90次／分，律齐，胸骨左缘2～3肋间可闻及3／6级收缩期吹风样杂音，向左颈部传导，震颤（－）、P2延长减弱，P2＜A2。 现病史:患者家人诉患儿出生后易哭闹，查体时发现心脏杂音（具体不详），未进一步诊治。患者年幼时常在哭闹及活动后伴心慌气短，5岁后活动量较同龄健康儿童明显减少，无口唇发绀、晕厥、咯血及蹲踞史。平素无双下肢水肿，自觉饮食，精神可，大小便正常    weight=    assistCheck=血常规：WBC6.0×109／L，L39.5%，M8.7%，N51.8%，RBC4.36×1012／L，Hb136g／L，PLT248×109／L。胸部正位片：肺充血、右心室大。心电图：右室肥厚，电轴右偏，右胸导联R波增高，左胸导联S波加深。胸部X线提示充血、右心室大。超声心动图：右室肥厚、收缩期肺动脉瓣圆顶征，肺动脉与右室存在压力阶差。连续多普勒显示一个高速血流通过右室流出道    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历55行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=11    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=家人否认有家族遗传病史及其他特殊病史
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=活动后心慌，气短10余年#####心界向左侧扩大，心率90次／分，律齐，胸骨左缘2～3肋间可闻及3／6级收缩期吹风样杂音，向左颈部传导，震颤（－）、P2延长减弱，P2＜A2。 现病史:患者家人诉患儿出生后易哭闹，查体时发现心脏杂音（具体不详），未进一步诊治。患者年幼时常在哭闹及活动后伴心慌气短，5岁后活动量较同龄健康儿童明显减少，无口唇发绀、晕厥、咯血及蹲踞史。平素无双下肢水肿，自觉饮食，精神可，大小便正常    weight=    assistCheck=血常规：WBC6.0×109／L，L39.5%，M8.7%，N51.8%，RBC4.36×1012／L，Hb136g／L，PLT248×109／L。胸部正位片：肺充血、右心室大。心电图：右室肥厚，电轴右偏，右胸导联R波增高，左胸导联S波加深。胸部X线提示充血、右心室大。超声心动图：右室肥厚、收缩期肺动脉瓣圆顶征，肺动脉与右室存在压力阶差。连续多普勒显示一个高速血流通过右室流出道    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉瓣狭窄

心脏科经典病历56行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=月    allergyHistory=    bodyTempr=37.7    familyHistory=
    ...    gender=1    heartRate=180    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发烧、咳嗽2天，伴哭闹不安1天来诊#####哭闹不安，哭声无力，面色发绀，多汗，鼻翼扇动，咽部充血。心前区稍隆起，心尖搏动弥散，心前区未触及细震颤，心界向左扩大，心率180次／分，节律规整，心音稍钝。左肩胛下区可闻及稀疏的中小水泡音。腹稍膨隆，叩之鼓音，无移动浊音。肝脏下缘在右锁中线肋缘下4cm，剑下7cm，质软，边缘稍钝。肢端稍凉。指趾端轻度发绀。 现病史:2天前患儿发烧，体温37～38℃，轻咳，按“上感” 治疗。次日出现哭闹不安，大汗淋漓、面色苍白、拒乳，尿少，来院。    weight=    assistCheck=心电图示窦性心动过速，心率160次／分，左室肥厚，V 5和V 6 ST 段下移，T 波倒置。胸部X 光检查可见心影增大，左室增大明显，肺纹理增多。超声心动图显示：左室内径增大，心内膜增厚，回声增强。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心内膜弹力纤维增生症

心脏科经典病历57行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=125    lowBldPress=85    personalHistory=    previousHistory=
    ...    symptom=活动后气短伴青紫6年#####口唇及指甲发绀，球结膜轻度充血，背部闻及血管杂音，心前区隆起，心尖搏动不清，心窝部无抬举感，未触及细震颤，听诊胸骨左缘2～3肋间闻及Ⅲ级喷射性全收缩期杂音，肺动脉第二音为单一增强 现病史:生后1个月因上呼吸道感染就诊时发现心脏杂音，近1岁时发现活动后气短，伴口唇青紫，喜蹲踞，无咯血。曾发生过3次缺氧发作但无晕厥史，1岁半以后自然缓解，无抽搐及长期发热史，无肢体运动障碍史，未患过肺炎    weight=    assistCheck=辅助检查：血常规WBC 118 ×10 9／L，Hb 165g／L，PLT 169 ×10 9／L；心电图：电轴‐115 度，V 1导联呈Rs 型，R V1＝3.0mV，V 5呈rS 型，S V5＝0.5mV，右室大；心脏三位像：双肺见网络状纹理改变，心脏呈靴形改变，轻度增大。心脏外形呈靴形心，右前斜位见心前间隙狭窄，左前斜位见心脏后缘向后移位与脊柱前缘相重叠；超声心动图：主动脉增宽（11mm），骑跨于室间隔上，右室流出道狭窄，瓣下宽约8.6mm，肺动脉瓣环部9.6mm，主肺动脉内径11mm。右心室肥厚；选择性右心室造影：见右心室显影后，肺动脉同时显影，肺动脉瓣环狭窄，约有11mm，主肺动脉宽约12mm，右室流出道无狭窄，同时心室水平右向左分流，主动脉提前显影，主动脉较肺动脉明显增粗，主动脉骑跨约50%，右心室肌小梁增厚，    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历57行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=125    lowBldPress=85    personalHistory=    previousHistory=
    ...    symptom=活动后气短伴青紫6年#####口唇及指甲发绀，球结膜轻度充血，背部闻及血管杂音，心前区隆起，心尖搏动不清，心窝部无抬举感，未触及细震颤，听诊胸骨左缘2～3肋间闻及Ⅲ级喷射性全收缩期杂音，肺动脉第二音为单一增强 现病史:生后1个月因上呼吸道感染就诊时发现心脏杂音，近1岁时发现活动后气短，伴口唇青紫，喜蹲踞，无咯血。曾发生过3次缺氧发作但无晕厥史，1岁半以后自然缓解，无抽搐及长期发热史，无肢体运动障碍史，未患过肺炎    weight=    assistCheck=辅助检查：血常规WBC 118 ×10 9／L，Hb 165g／L，PLT 169 ×10 9／L；心电图：电轴‐115 度，V 1导联呈Rs 型，R V1＝3.0mV，V 5呈rS 型，S V5＝0.5mV，右室大；心脏三位像：双肺见网络状纹理改变，心脏呈靴形改变，轻度增大。心脏外形呈靴形心，右前斜位见心前间隙狭窄，左前斜位见心脏后缘向后移位与脊柱前缘相重叠；超声心动图：主动脉增宽（11mm），骑跨于室间隔上，右室流出道狭窄，瓣下宽约8.6mm，肺动脉瓣环部9.6mm，主肺动脉内径11mm。右心室肥厚；选择性右心室造影：见右心室显影后，肺动脉同时显影，肺动脉瓣环狭窄，约有11mm，主肺动脉宽约12mm，右室流出道无狭窄，同时心室水平右向左分流，主动脉提前显影，主动脉较肺动脉明显增粗，主动脉骑跨约50%，右心室肌小梁增厚，    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    法洛四联症

心脏科经典病历58行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=12    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=88    highBldPress=130    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音12年为主诉收入院#####心尖搏动局限，胸骨左缘2 肋间触及细震颤，胸骨左缘第2肋间闻及I V／VI 级收缩期喷射性杂音，可听到收缩早期喀啦音，肺动脉瓣区第二音减弱伴有分裂，主动脉瓣区第二音正常 现病史:生后母亲为其哺乳时发现患儿心脏有杂音，未进一步检查，患儿平时无自觉不适，活动不受限制，无咯血、晕厥、抽搐及缺氧发作。    weight=    assistCheck=心电图：提示窦性心律，心率83次／分，右心室肥厚。心脏正侧位片：双肺纹理清晰，两肺门影不大，左心缘肺动脉段凸出，心胸比值0.44。超声心动图：右室壁及室间隔（9mm）增厚，房间隔及室间隔回声完整，二三尖瓣运动正常。肺动脉瓣开放受限，主肺动脉瓣狭窄后扩张，连续多普勒估测右室压144mmHg，两条大动脉位置关系正常。彩色多普勒：过肺动脉瓣五彩镶嵌射流束。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历58行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=12    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=88    highBldPress=130    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音12年为主诉收入院#####心尖搏动局限，胸骨左缘2 肋间触及细震颤，胸骨左缘第2肋间闻及I V／VI 级收缩期喷射性杂音，可听到收缩早期喀啦音，肺动脉瓣区第二音减弱伴有分裂，主动脉瓣区第二音正常 现病史:生后母亲为其哺乳时发现患儿心脏有杂音，未进一步检查，患儿平时无自觉不适，活动不受限制，无咯血、晕厥、抽搐及缺氧发作。    weight=    assistCheck=心电图：提示窦性心律，心率83次／分，右心室肥厚。心脏正侧位片：双肺纹理清晰，两肺门影不大，左心缘肺动脉段凸出，心胸比值0.44。超声心动图：右室壁及室间隔（9mm）增厚，房间隔及室间隔回声完整，二三尖瓣运动正常。肺动脉瓣开放受限，主肺动脉瓣狭窄后扩张，连续多普勒估测右室压144mmHg，两条大动脉位置关系正常。彩色多普勒：过肺动脉瓣五彩镶嵌射流束。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉瓣狭窄

心脏科经典病历59行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=7    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=105    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=以“咳嗽1周” 来诊#####咽部轻度充血，双扁桃体无肿大，心率100次／分，节律不齐，早搏每分钟30次左右，呈三联律、四联律，心音有力 现病史:患儿1周前始咳嗽，晚间重，无痰，体温37.5℃左右，在当地医院诊为“上呼吸道感染”，经治疗体温正常，仍有轻咳。门诊查体发现患儿心律不齐    weight=    assistCheck=心肌酶LDH 448U／L（正常值109～245U／L），AST 41U／L（正常值8～40U／L），CPK 232U／L（正常值25～200U／L）。α～HBDH 513U／L（正常值80～220U／L），CK‐MB 31U／L（正常值为（CK 总活力0～6%），ESR 6mm H 2 O／第一小时，15mm H 2 0／第二小时，ASO＜251U／ml，CRP＜1.0mg／L，RHF ＜20.01U／ml，心电图窦性心律，心率80次／分，单源频发室早，呈三联律、四联律。Holter 汇报窦性心律，单源频发室早，全部心搏数142437次，室性期前收缩42180次，平均29次／100次，单发42180次，二联律27112次。胸部X 线双肺纹理增粗，心影大小正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病毒性心肌炎

心脏科经典病历60行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=14    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=105    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音1个月为主诉入院#####胸骨左缘2 肋间闻及Ⅱ～Ⅲ级喷射性收缩期杂音，肺动脉瓣区第二心音固定分裂，心尖部未闻及舒张期杂音。 现病史:1个月前在学校体检时发现心脏杂音。此后自觉剧烈活动时偶有心慌气短，但无青紫，没有咯血，无晕厥及抽搐。不喜蹲踞。幼时有喂养困难，经常患上呼吸道感染，但未患过肺炎。    weight=    assistCheck=心电图提示：①窦性心律；②不完全右束支阻滞；胸部正侧位片：肺血增多，肺门影不大，心脏外形呈梨形，主动脉结偏小，肺动脉段突，心间圆隆上翘，侧位见心前间隙缩小，两侧肋膈角清晰，心胸比值0.56；心脏超声：提示右房、右室内径增大，室间隔与左室后壁呈同向运动，房间隔回声中断3.0cm，室间隔回声完整，各瓣膜开放和关闭运动正常；彩色多普勒：过房间隔见左向右五彩镶嵌分流束。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历60行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=14    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=105    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音1个月为主诉入院#####胸骨左缘2 肋间闻及Ⅱ～Ⅲ级喷射性收缩期杂音，肺动脉瓣区第二心音固定分裂，心尖部未闻及舒张期杂音。 现病史:1个月前在学校体检时发现心脏杂音。此后自觉剧烈活动时偶有心慌气短，但无青紫，没有咯血，无晕厥及抽搐。不喜蹲踞。幼时有喂养困难，经常患上呼吸道感染，但未患过肺炎。    weight=    assistCheck=心电图提示：①窦性心律；②不完全右束支阻滞；胸部正侧位片：肺血增多，肺门影不大，心脏外形呈梨形，主动脉结偏小，肺动脉段突，心间圆隆上翘，侧位见心前间隙缩小，两侧肋膈角清晰，心胸比值0.56；心脏超声：提示右房、右室内径增大，室间隔与左室后壁呈同向运动，房间隔回声中断3.0cm，室间隔回声完整，各瓣膜开放和关闭运动正常；彩色多普勒：过房间隔见左向右五彩镶嵌分流束。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    房间隔缺损

心脏科经典病历61行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=其同父异母的姐姐因患有矫正性大血管错位伴室间隔缺损而于三个月前行室间隔修补术
    ...    gender=1    heartRate=90    highBldPress=90    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=以活动后心跳气短2年收入院#####心前区隆起，心尖搏动弥散，心前区未触及细震颤，左心界第5 肋间平左乳头线，右界平胸骨右缘，心音有力心律齐，心率90次／分，胸骨左缘4 肋间闻及Ⅲ／Ⅵ级收缩期分流性杂音，肺动脉瓣区第二心音亢进，心尖部可闻及舒张期流量性杂音。肝脏右肋下1cm，Ⅰ度硬 现病史:2年前因声音嘶哑到当地就诊发现心脏杂音，此后有活动后心悸气短，无紫绀不喜蹲踞，不咯血无晕厥，平时易患上呼吸道感染。既往患过两次肺炎，幼时有喂养困难，生长发育无明显落后，母孕期无受X 线及患上呼吸道感染史。    weight=    assistCheck=血常规WBC 6﹒9 ×10 9／L，N 0﹒353，L 0﹒574，RBC3.94 ×10 12／L，Hb 112g／L，PLT 197 ×10 9／L；血气：PO 2 72﹒1mmHg（5.31kPa），钾4.0mmol／L，钠119mmol／L，氯87mmol／L，SaO 2 95%；心电图：QRS 波V 1呈Rs 型，Rv 1＝1.8mV，V 1导联R／S＞1，V 5呈Rs 型，Rv 5＝2.8mv，Rv 4＋Sv 4＝5.2mV，QRS 时限正常，ST‐T I及Tv 5直立，提示窦性心律，左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小，心影扩大，心胸比值0.61；心脏扇形扫描：主动脉根部16mm，左房24mm，左室34mm，右室15mm，提示左房，右房，右室大，肺动脉瓣曲线见α波消失，室间隔膜部见回声连续中断；彩色多普勒收缩期见上述中断处显示左向右为主的红白黄血流束（过隔时宽约7mm）。提示先天性心脏病，非紫绀型，室间隔缺损，肺动脉高压；心导管资料：①患儿平静时无紫绀，动脉血氧饱和度95%，均提示平静时没有右向左分流。②右室血氧比左室血氧高2.24Vol／L，提示在心室水平有左向右分流，经计算分流量为68%。③右室压力升高为70／27mmHg，肺总阻力升高达902dyn﹒s﹒cm－5。肺、主动脉流量比为3.5∶1。④导管未能通过异常通道。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历61行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=其同父异母的姐姐因患有矫正性大血管错位伴室间隔缺损而于三个月前行室间隔修补术
    ...    gender=1    heartRate=90    highBldPress=90    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=以活动后心跳气短2年收入院#####心前区隆起，心尖搏动弥散，心前区未触及细震颤，左心界第5 肋间平左乳头线，右界平胸骨右缘，心音有力心律齐，心率90次／分，胸骨左缘4 肋间闻及Ⅲ／Ⅵ级收缩期分流性杂音，肺动脉瓣区第二心音亢进，心尖部可闻及舒张期流量性杂音。肝脏右肋下1cm，Ⅰ度硬 现病史:2年前因声音嘶哑到当地就诊发现心脏杂音，此后有活动后心悸气短，无紫绀不喜蹲踞，不咯血无晕厥，平时易患上呼吸道感染。既往患过两次肺炎，幼时有喂养困难，生长发育无明显落后，母孕期无受X 线及患上呼吸道感染史。    weight=    assistCheck=血常规WBC 6﹒9 ×10 9／L，N 0﹒353，L 0﹒574，RBC3.94 ×10 12／L，Hb 112g／L，PLT 197 ×10 9／L；血气：PO 2 72﹒1mmHg（5.31kPa），钾4.0mmol／L，钠119mmol／L，氯87mmol／L，SaO 2 95%；心电图：QRS 波V 1呈Rs 型，Rv 1＝1.8mV，V 1导联R／S＞1，V 5呈Rs 型，Rv 5＝2.8mv，Rv 4＋Sv 4＝5.2mV，QRS 时限正常，ST‐T I及Tv 5直立，提示窦性心律，左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小，心影扩大，心胸比值0.61；心脏扇形扫描：主动脉根部16mm，左房24mm，左室34mm，右室15mm，提示左房，右房，右室大，肺动脉瓣曲线见α波消失，室间隔膜部见回声连续中断；彩色多普勒收缩期见上述中断处显示左向右为主的红白黄血流束（过隔时宽约7mm）。提示先天性心脏病，非紫绀型，室间隔缺损，肺动脉高压；心导管资料：①患儿平静时无紫绀，动脉血氧饱和度95%，均提示平静时没有右向左分流。②右室血氧比左室血氧高2.24Vol／L，提示在心室水平有左向右分流，经计算分流量为68%。③右室压力升高为70／27mmHg，肺总阻力升高达902dyn﹒s﹒cm－5。肺、主动脉流量比为3.5∶1。④导管未能通过异常通道。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室间隔缺损

心脏科经典病历61行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=其同父异母的姐姐因患有矫正性大血管错位伴室间隔缺损而于三个月前行室间隔修补术
    ...    gender=1    heartRate=90    highBldPress=90    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=以活动后心跳气短2年收入院#####心前区隆起，心尖搏动弥散，心前区未触及细震颤，左心界第5 肋间平左乳头线，右界平胸骨右缘，心音有力心律齐，心率90次／分，胸骨左缘4 肋间闻及Ⅲ／Ⅵ级收缩期分流性杂音，肺动脉瓣区第二心音亢进，心尖部可闻及舒张期流量性杂音。肝脏右肋下1cm，Ⅰ度硬 现病史:2年前因声音嘶哑到当地就诊发现心脏杂音，此后有活动后心悸气短，无紫绀不喜蹲踞，不咯血无晕厥，平时易患上呼吸道感染。既往患过两次肺炎，幼时有喂养困难，生长发育无明显落后，母孕期无受X 线及患上呼吸道感染史。    weight=    assistCheck=血常规WBC 6﹒9 ×10 9／L，N 0﹒353，L 0﹒574，RBC3.94 ×10 12／L，Hb 112g／L，PLT 197 ×10 9／L；血气：PO 2 72﹒1mmHg（5.31kPa），钾4.0mmol／L，钠119mmol／L，氯87mmol／L，SaO 2 95%；心电图：QRS 波V 1呈Rs 型，Rv 1＝1.8mV，V 1导联R／S＞1，V 5呈Rs 型，Rv 5＝2.8mv，Rv 4＋Sv 4＝5.2mV，QRS 时限正常，ST‐T I及Tv 5直立，提示窦性心律，左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小，心影扩大，心胸比值0.61；心脏扇形扫描：主动脉根部16mm，左房24mm，左室34mm，右室15mm，提示左房，右房，右室大，肺动脉瓣曲线见α波消失，室间隔膜部见回声连续中断；彩色多普勒收缩期见上述中断处显示左向右为主的红白黄血流束（过隔时宽约7mm）。提示先天性心脏病，非紫绀型，室间隔缺损，肺动脉高压；心导管资料：①患儿平静时无紫绀，动脉血氧饱和度95%，均提示平静时没有右向左分流。②右室血氧比左室血氧高2.24Vol／L，提示在心室水平有左向右分流，经计算分流量为68%。③右室压力升高为70／27mmHg，肺总阻力升高达902dyn﹒s﹒cm－5。肺、主动脉流量比为3.5∶1。④导管未能通过异常通道。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉高压

心脏科经典病历62行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音2年收入院#####心前区隆起，呈鸡胸状，胸骨左缘3～4肋间隙触及收缩期细震颤，心界向两侧扩大，右界第4肋间距中线3c m，左界第5肋间距中线6c m，两乳头间距离10c m，心间搏动弥散，心律齐，心率120次／分，胸骨左缘3～4肋间闻及Ⅳ／Ⅵ级全收缩期粗糙分流性杂音，肺动脉瓣区第二音亢进，腹部平坦，肝脏肋下2c m，质Ⅰ度硬，脾未触及。下肢不肿。股动脉搏动减弱，足背动脉搏动触不清楚，无杵状指。 现病史:母孕期有明显的上呼吸道感染史，有发热，但未服药，出生史正常，生后有喂养困难，经常患上呼吸道感染，未患过肺炎。约1.5岁开始活动后自觉乏力，但无发绀且不喜蹲踞，无晕厥及抽搐。周围动脉血氧饱和度＞95%    weight=    assistCheck=辅助检查：周围动脉血氧饱和度98%；血常规：WBC 10﹒1 ×109／L，N 0﹒227，L 0﹒723，RBC 4﹒0 ×1012／L，Hb 130g／L，HCT 35，PLT 345 ×109／L；钾4.2mmol／L，钠140mmol／L，氯112mmol／L，CO2CP 33；心电图：提示窦性心律、左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小、心影扩大，心胸比值0.63；心脏扇扫：左房大，肺动脉增宽，肺动脉瓣曲线见收缩期提前关闭，室间隔连续中断约10mm；彩色多普勒：室间隔回声中断处可见以左向右为主分流束，舒张期右室流出道见彩色血流束，舒张期于肺动脉内可见红色血流束。提示室间隔缺损、肺动脉高压（双向分流）；常规肺动脉造影：于肺动脉注入造影剂，部分反流入右心室，肺动脉显著扩张，肺循环以后，左心系统充盈，肺动脉再次充盈，主动脉弓降部造影浓度减淡，显示不清晰。提示先天性心脏病、室间隔缺损、动脉导管未闭、肺动脉高压。心脏MRI：双侧心室腔扩大，左心房增大，双侧心室间隔膜部见缺损，双侧肺动脉呈“瘤样”扩张    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历62行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音2年收入院#####心前区隆起，呈鸡胸状，胸骨左缘3～4肋间隙触及收缩期细震颤，心界向两侧扩大，右界第4肋间距中线3c m，左界第5肋间距中线6c m，两乳头间距离10c m，心间搏动弥散，心律齐，心率120次／分，胸骨左缘3～4肋间闻及Ⅳ／Ⅵ级全收缩期粗糙分流性杂音，肺动脉瓣区第二音亢进，腹部平坦，肝脏肋下2c m，质Ⅰ度硬，脾未触及。下肢不肿。股动脉搏动减弱，足背动脉搏动触不清楚，无杵状指。 现病史:母孕期有明显的上呼吸道感染史，有发热，但未服药，出生史正常，生后有喂养困难，经常患上呼吸道感染，未患过肺炎。约1.5岁开始活动后自觉乏力，但无发绀且不喜蹲踞，无晕厥及抽搐。周围动脉血氧饱和度＞95%    weight=    assistCheck=辅助检查：周围动脉血氧饱和度98%；血常规：WBC 10﹒1 ×109／L，N 0﹒227，L 0﹒723，RBC 4﹒0 ×1012／L，Hb 130g／L，HCT 35，PLT 345 ×109／L；钾4.2mmol／L，钠140mmol／L，氯112mmol／L，CO2CP 33；心电图：提示窦性心律、左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小、心影扩大，心胸比值0.63；心脏扇扫：左房大，肺动脉增宽，肺动脉瓣曲线见收缩期提前关闭，室间隔连续中断约10mm；彩色多普勒：室间隔回声中断处可见以左向右为主分流束，舒张期右室流出道见彩色血流束，舒张期于肺动脉内可见红色血流束。提示室间隔缺损、肺动脉高压（双向分流）；常规肺动脉造影：于肺动脉注入造影剂，部分反流入右心室，肺动脉显著扩张，肺循环以后，左心系统充盈，肺动脉再次充盈，主动脉弓降部造影浓度减淡，显示不清晰。提示先天性心脏病、室间隔缺损、动脉导管未闭、肺动脉高压。心脏MRI：双侧心室腔扩大，左心房增大，双侧心室间隔膜部见缺损，双侧肺动脉呈“瘤样”扩张    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    室间隔缺损

心脏科经典病历62行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音2年收入院#####心前区隆起，呈鸡胸状，胸骨左缘3～4肋间隙触及收缩期细震颤，心界向两侧扩大，右界第4肋间距中线3c m，左界第5肋间距中线6c m，两乳头间距离10c m，心间搏动弥散，心律齐，心率120次／分，胸骨左缘3～4肋间闻及Ⅳ／Ⅵ级全收缩期粗糙分流性杂音，肺动脉瓣区第二音亢进，腹部平坦，肝脏肋下2c m，质Ⅰ度硬，脾未触及。下肢不肿。股动脉搏动减弱，足背动脉搏动触不清楚，无杵状指。 现病史:母孕期有明显的上呼吸道感染史，有发热，但未服药，出生史正常，生后有喂养困难，经常患上呼吸道感染，未患过肺炎。约1.5岁开始活动后自觉乏力，但无发绀且不喜蹲踞，无晕厥及抽搐。周围动脉血氧饱和度＞95%    weight=    assistCheck=辅助检查：周围动脉血氧饱和度98%；血常规：WBC 10﹒1 ×109／L，N 0﹒227，L 0﹒723，RBC 4﹒0 ×1012／L，Hb 130g／L，HCT 35，PLT 345 ×109／L；钾4.2mmol／L，钠140mmol／L，氯112mmol／L，CO2CP 33；心电图：提示窦性心律、左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小、心影扩大，心胸比值0.63；心脏扇扫：左房大，肺动脉增宽，肺动脉瓣曲线见收缩期提前关闭，室间隔连续中断约10mm；彩色多普勒：室间隔回声中断处可见以左向右为主分流束，舒张期右室流出道见彩色血流束，舒张期于肺动脉内可见红色血流束。提示室间隔缺损、肺动脉高压（双向分流）；常规肺动脉造影：于肺动脉注入造影剂，部分反流入右心室，肺动脉显著扩张，肺循环以后，左心系统充盈，肺动脉再次充盈，主动脉弓降部造影浓度减淡，显示不清晰。提示先天性心脏病、室间隔缺损、动脉导管未闭、肺动脉高压。心脏MRI：双侧心室腔扩大，左心房增大，双侧心室间隔膜部见缺损，双侧肺动脉呈“瘤样”扩张    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    动脉导管未闭

心脏科经典病历62行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音2年收入院#####心前区隆起，呈鸡胸状，胸骨左缘3～4肋间隙触及收缩期细震颤，心界向两侧扩大，右界第4肋间距中线3c m，左界第5肋间距中线6c m，两乳头间距离10c m，心间搏动弥散，心律齐，心率120次／分，胸骨左缘3～4肋间闻及Ⅳ／Ⅵ级全收缩期粗糙分流性杂音，肺动脉瓣区第二音亢进，腹部平坦，肝脏肋下2c m，质Ⅰ度硬，脾未触及。下肢不肿。股动脉搏动减弱，足背动脉搏动触不清楚，无杵状指。 现病史:母孕期有明显的上呼吸道感染史，有发热，但未服药，出生史正常，生后有喂养困难，经常患上呼吸道感染，未患过肺炎。约1.5岁开始活动后自觉乏力，但无发绀且不喜蹲踞，无晕厥及抽搐。周围动脉血氧饱和度＞95%    weight=    assistCheck=辅助检查：周围动脉血氧饱和度98%；血常规：WBC 10﹒1 ×109／L，N 0﹒227，L 0﹒723，RBC 4﹒0 ×1012／L，Hb 130g／L，HCT 35，PLT 345 ×109／L；钾4.2mmol／L，钠140mmol／L，氯112mmol／L，CO2CP 33；心电图：提示窦性心律、左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小、心影扩大，心胸比值0.63；心脏扇扫：左房大，肺动脉增宽，肺动脉瓣曲线见收缩期提前关闭，室间隔连续中断约10mm；彩色多普勒：室间隔回声中断处可见以左向右为主分流束，舒张期右室流出道见彩色血流束，舒张期于肺动脉内可见红色血流束。提示室间隔缺损、肺动脉高压（双向分流）；常规肺动脉造影：于肺动脉注入造影剂，部分反流入右心室，肺动脉显著扩张，肺循环以后，左心系统充盈，肺动脉再次充盈，主动脉弓降部造影浓度减淡，显示不清晰。提示先天性心脏病、室间隔缺损、动脉导管未闭、肺动脉高压。心脏MRI：双侧心室腔扩大，左心房增大，双侧心室间隔膜部见缺损，双侧肺动脉呈“瘤样”扩张    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉高压

心脏科经典病历62行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=以发现心脏杂音2年收入院#####心前区隆起，呈鸡胸状，胸骨左缘3～4肋间隙触及收缩期细震颤，心界向两侧扩大，右界第4肋间距中线3c m，左界第5肋间距中线6c m，两乳头间距离10c m，心间搏动弥散，心律齐，心率120次／分，胸骨左缘3～4肋间闻及Ⅳ／Ⅵ级全收缩期粗糙分流性杂音，肺动脉瓣区第二音亢进，腹部平坦，肝脏肋下2c m，质Ⅰ度硬，脾未触及。下肢不肿。股动脉搏动减弱，足背动脉搏动触不清楚，无杵状指。 现病史:母孕期有明显的上呼吸道感染史，有发热，但未服药，出生史正常，生后有喂养困难，经常患上呼吸道感染，未患过肺炎。约1.5岁开始活动后自觉乏力，但无发绀且不喜蹲踞，无晕厥及抽搐。周围动脉血氧饱和度＞95%    weight=    assistCheck=辅助检查：周围动脉血氧饱和度98%；血常规：WBC 10﹒1 ×109／L，N 0﹒227，L 0﹒723，RBC 4﹒0 ×1012／L，Hb 130g／L，HCT 35，PLT 345 ×109／L；钾4.2mmol／L，钠140mmol／L，氯112mmol／L，CO2CP 33；心电图：提示窦性心律、左右心室肥厚；心脏正侧位片：双肺充血，主动脉弓略小，肺动脉段凸，右二弓增大，膈顶光滑，侧位片提示心前间隙变小、心影扩大，心胸比值0.63；心脏扇扫：左房大，肺动脉增宽，肺动脉瓣曲线见收缩期提前关闭，室间隔连续中断约10mm；彩色多普勒：室间隔回声中断处可见以左向右为主分流束，舒张期右室流出道见彩色血流束，舒张期于肺动脉内可见红色血流束。提示室间隔缺损、肺动脉高压（双向分流）；常规肺动脉造影：于肺动脉注入造影剂，部分反流入右心室，肺动脉显著扩张，肺循环以后，左心系统充盈，肺动脉再次充盈，主动脉弓降部造影浓度减淡，显示不清晰。提示先天性心脏病、室间隔缺损、动脉导管未闭、肺动脉高压。心脏MRI：双侧心室腔扩大，左心房增大，双侧心室间隔膜部见缺损，双侧肺动脉呈“瘤样”扩张    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    主动脉缩窄

心脏科经典病历63行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=24    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=间断心悸1年##### 现病史:患者入院前1年起间断发作心悸，伴轻微头晕。多于劳累时发生，每次持续10～20分钟不等。    weight=    assistCheck=心电图特征：窦性心律，胸前导联V1～V5导联T波倒置，V1～V3导联QTS波群＞0.12s；可见明显的epsilon波。超声心动图提示：右心增大，右心功能偏低。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    右室心肌病

心脏科经典病历64行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=1    heartRate=56    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=胆石症、胆囊炎2年，因右腹上区痛伴晕厥入院#####痛苦面容，巩膜黄染。心律齐、心界不大、无杂音，右腹上区压痛明显。 现病史:胆石症、胆囊炎2年，因右腹上区痛伴晕厥入院。治疗中突发意识丧失，予心脏按摩及对症治疗后神志恢复    weight=    assistCheck=B 超示胆囊炎、胆石症、胆总管扩张。心电图示Ⅱ度窦房阻滞、窦性停搏、心率18次／分、TV 1～V 5倒置    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    阿-斯综合征

心脏科经典病历65行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=86    lowBldPress=48    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音半年，哭吵后口唇青紫#####口唇发绀，胸部无畸形，心尖搏动增强。胸骨左缘第2～3肋间触及收缩期震颤，心音有力，心律齐，胸骨左缘第2～3肋间闻及3级收缩期杂音 现病史:近来发现患儿在哭吵后出现口唇青紫，为进一步诊治就诊于我院。患儿自出生以来，无屡患上呼吸道感染史，活动量与同龄儿童基本相同，饮食及大小便正常。    weight=    assistCheck=心电图：窦性心律，心率134次／分，双室大，ST段下移0.5mV。胸部X线：心影呈靴型，双肺血管阴影减少。超声心动图：右房、右室增大，右心室肥厚，圆锥隔前移，肺动脉瓣及瓣下狭窄，肺动脉瓣环0.7c m，VSD对位不良，双向分流，1.5c m，主肺动脉0.64c m，流速4.26m／s，压差73mmHg，左肺动脉开口0.4c m，内径0.52c m，右肺动脉开口0.41c m，内径0.7c m。继发孔型房缺0.5c m。心血管造影：主动脉骑跨，左心室发育良好。左肺动脉起始0.4c m，远端分叉处0.9c m，右肺动脉起始0.38c m，远端分叉处0.83c m，降主动脉横膈水平0.7c m。McGoon指数为2.47    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历65行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=86    lowBldPress=48    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音半年，哭吵后口唇青紫#####口唇发绀，胸部无畸形，心尖搏动增强。胸骨左缘第2～3肋间触及收缩期震颤，心音有力，心律齐，胸骨左缘第2～3肋间闻及3级收缩期杂音 现病史:近来发现患儿在哭吵后出现口唇青紫，为进一步诊治就诊于我院。患儿自出生以来，无屡患上呼吸道感染史，活动量与同龄儿童基本相同，饮食及大小便正常。    weight=    assistCheck=心电图：窦性心律，心率134次／分，双室大，ST段下移0.5mV。胸部X线：心影呈靴型，双肺血管阴影减少。超声心动图：右房、右室增大，右心室肥厚，圆锥隔前移，肺动脉瓣及瓣下狭窄，肺动脉瓣环0.7c m，VSD对位不良，双向分流，1.5c m，主肺动脉0.64c m，流速4.26m／s，压差73mmHg，左肺动脉开口0.4c m，内径0.52c m，右肺动脉开口0.41c m，内径0.7c m。继发孔型房缺0.5c m。心血管造影：主动脉骑跨，左心室发育良好。左肺动脉起始0.4c m，远端分叉处0.9c m，右肺动脉起始0.38c m，远端分叉处0.83c m，降主动脉横膈水平0.7c m。McGoon指数为2.47    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    法洛四联症

心脏科经典病历65行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=86    lowBldPress=48    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音半年，哭吵后口唇青紫#####口唇发绀，胸部无畸形，心尖搏动增强。胸骨左缘第2～3肋间触及收缩期震颤，心音有力，心律齐，胸骨左缘第2～3肋间闻及3级收缩期杂音 现病史:近来发现患儿在哭吵后出现口唇青紫，为进一步诊治就诊于我院。患儿自出生以来，无屡患上呼吸道感染史，活动量与同龄儿童基本相同，饮食及大小便正常。    weight=    assistCheck=心电图：窦性心律，心率134次／分，双室大，ST段下移0.5mV。胸部X线：心影呈靴型，双肺血管阴影减少。超声心动图：右房、右室增大，右心室肥厚，圆锥隔前移，肺动脉瓣及瓣下狭窄，肺动脉瓣环0.7c m，VSD对位不良，双向分流，1.5c m，主肺动脉0.64c m，流速4.26m／s，压差73mmHg，左肺动脉开口0.4c m，内径0.52c m，右肺动脉开口0.41c m，内径0.7c m。继发孔型房缺0.5c m。心血管造影：主动脉骑跨，左心室发育良好。左肺动脉起始0.4c m，远端分叉处0.9c m，右肺动脉起始0.38c m，远端分叉处0.83c m，降主动脉横膈水平0.7c m。McGoon指数为2.47    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    房间隔缺损

心脏科经典病历66行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=天    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=0    heartRate=160    highBldPress=60    lowBldPress=35    personalHistory=    previousHistory=
    ...    symptom=生后青紫气促，加重1天#####听诊第2肋间可闻及4级收缩期喷射样杂音，P2减弱，固定分裂， 现病史:患儿生后至今一直有青紫，气促，哭吵时青紫、气促加剧。到当地医院就诊发现心脏杂音，1天前患儿吃奶后出现青紫加剧，憋气，意识丧失。予吸氧后病情缓解。患儿出生时即有窒息，经吸氧抢救后才有哭声。Apgar评分为3分‐7分‐9分。平素患儿吃奶少，时有停顿，夜眠差，两便尚可    weight=    assistCheck=脏超声 肺动脉瓣狭窄（重度，压差90mmHg），卵圆孔无（右向左分流），动脉导管未闭（肺动脉端0.2c m，左向右分流）心电图 电轴右偏，右心室肥厚伴不完全性右束支传导阻滞。胸部X线检查 心影不大，肺动脉段凹陷，肺野血少。心脏CT及气道重建 肺动脉瓣狭窄，左、右肺动脉发育可，所见气道未闭明显狭窄。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历66行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=天    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=0    heartRate=160    highBldPress=60    lowBldPress=35    personalHistory=    previousHistory=
    ...    symptom=生后青紫气促，加重1天#####听诊第2肋间可闻及4级收缩期喷射样杂音，P2减弱，固定分裂， 现病史:患儿生后至今一直有青紫，气促，哭吵时青紫、气促加剧。到当地医院就诊发现心脏杂音，1天前患儿吃奶后出现青紫加剧，憋气，意识丧失。予吸氧后病情缓解。患儿出生时即有窒息，经吸氧抢救后才有哭声。Apgar评分为3分‐7分‐9分。平素患儿吃奶少，时有停顿，夜眠差，两便尚可    weight=    assistCheck=脏超声 肺动脉瓣狭窄（重度，压差90mmHg），卵圆孔无（右向左分流），动脉导管未闭（肺动脉端0.2c m，左向右分流）心电图 电轴右偏，右心室肥厚伴不完全性右束支传导阻滞。胸部X线检查 心影不大，肺动脉段凹陷，肺野血少。心脏CT及气道重建 肺动脉瓣狭窄，左、右肺动脉发育可，所见气道未闭明显狭窄。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉瓣狭窄

心脏科经典病历66行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=天    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=0    heartRate=160    highBldPress=60    lowBldPress=35    personalHistory=    previousHistory=
    ...    symptom=生后青紫气促，加重1天#####听诊第2肋间可闻及4级收缩期喷射样杂音，P2减弱，固定分裂， 现病史:患儿生后至今一直有青紫，气促，哭吵时青紫、气促加剧。到当地医院就诊发现心脏杂音，1天前患儿吃奶后出现青紫加剧，憋气，意识丧失。予吸氧后病情缓解。患儿出生时即有窒息，经吸氧抢救后才有哭声。Apgar评分为3分‐7分‐9分。平素患儿吃奶少，时有停顿，夜眠差，两便尚可    weight=    assistCheck=脏超声 肺动脉瓣狭窄（重度，压差90mmHg），卵圆孔无（右向左分流），动脉导管未闭（肺动脉端0.2c m，左向右分流）心电图 电轴右偏，右心室肥厚伴不完全性右束支传导阻滞。胸部X线检查 心影不大，肺动脉段凹陷，肺野血少。心脏CT及气道重建 肺动脉瓣狭窄，左、右肺动脉发育可，所见气道未闭明显狭窄。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    动脉导管未闭

心脏科经典病历67行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=135    highBldPress=80    lowBldPress=50    personalHistory=    previousHistory=
    ...    symptom=青紫，体检发现心脏杂音16个月#####SPO275%，营养稍差。心律齐，L2～4 3／4级SM，第二心音单一，不亢进。腹软，肝肋下1.5cm，脾肋下未触及。四肢暖，杵状指（趾）。 现病史:患儿生后即出现青紫。当地医院体检时发现心脏有杂音，诊断为先天性心脏病。患儿生长发育稍受限。平素患儿口唇青紫，活动后青紫变化不明显。目前能说话，走路尚需人搀扶。入院以来，患儿神志清，精神一般，食欲可，两便可。无蹲踞，无缺氧发作史，无肺炎心衰史。    weight=9    assistCheck=心脏彩超：完全性大动脉错位，室间隔缺损，动脉导管未闭，肺动脉瓣与瓣下狭窄。三尖瓣轻度反流，二尖瓣和主动脉瓣反流均为阴性。左室射血分数73%，缩短分数42%。心血管造影：各主要血管直径：肺总动脉7.5mm，右肺动脉起始部15.4mm，远端12.7mm，左肺动脉起始部7.9mm，远端9.9mm，降主动脉横膈处9.4mm。McGoon指数＝2.48，Nakata指数＝399。导管术中吸氧状态下降主动脉氧饱和度为81。冠状动脉为A型。未见明显侧支血管形成。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

心脏科经典病历67行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=135    highBldPress=80    lowBldPress=50    personalHistory=    previousHistory=
    ...    symptom=青紫，体检发现心脏杂音16个月#####SPO275%，营养稍差。心律齐，L2～4 3／4级SM，第二心音单一，不亢进。腹软，肝肋下1.5cm，脾肋下未触及。四肢暖，杵状指（趾）。 现病史:患儿生后即出现青紫。当地医院体检时发现心脏有杂音，诊断为先天性心脏病。患儿生长发育稍受限。平素患儿口唇青紫，活动后青紫变化不明显。目前能说话，走路尚需人搀扶。入院以来，患儿神志清，精神一般，食欲可，两便可。无蹲踞，无缺氧发作史，无肺炎心衰史。    weight=9    assistCheck=心脏彩超：完全性大动脉错位，室间隔缺损，动脉导管未闭，肺动脉瓣与瓣下狭窄。三尖瓣轻度反流，二尖瓣和主动脉瓣反流均为阴性。左室射血分数73%，缩短分数42%。心血管造影：各主要血管直径：肺总动脉7.5mm，右肺动脉起始部15.4mm，远端12.7mm，左肺动脉起始部7.9mm，远端9.9mm，降主动脉横膈处9.4mm。McGoon指数＝2.48，Nakata指数＝399。导管术中吸氧状态下降主动脉氧饱和度为81。冠状动脉为A型。未见明显侧支血管形成。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    完全性大动脉转位

心脏科经典病历67行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=135    highBldPress=80    lowBldPress=50    personalHistory=    previousHistory=
    ...    symptom=青紫，体检发现心脏杂音16个月#####SPO275%，营养稍差。心律齐，L2～4 3／4级SM，第二心音单一，不亢进。腹软，肝肋下1.5cm，脾肋下未触及。四肢暖，杵状指（趾）。 现病史:患儿生后即出现青紫。当地医院体检时发现心脏有杂音，诊断为先天性心脏病。患儿生长发育稍受限。平素患儿口唇青紫，活动后青紫变化不明显。目前能说话，走路尚需人搀扶。入院以来，患儿神志清，精神一般，食欲可，两便可。无蹲踞，无缺氧发作史，无肺炎心衰史。    weight=9    assistCheck=心脏彩超：完全性大动脉错位，室间隔缺损，动脉导管未闭，肺动脉瓣与瓣下狭窄。三尖瓣轻度反流，二尖瓣和主动脉瓣反流均为阴性。左室射血分数73%，缩短分数42%。心血管造影：各主要血管直径：肺总动脉7.5mm，右肺动脉起始部15.4mm，远端12.7mm，左肺动脉起始部7.9mm，远端9.9mm，降主动脉横膈处9.4mm。McGoon指数＝2.48，Nakata指数＝399。导管术中吸氧状态下降主动脉氧饱和度为81。冠状动脉为A型。未见明显侧支血管形成。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    室间隔缺损

心脏科经典病历67行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=135    highBldPress=80    lowBldPress=50    personalHistory=    previousHistory=
    ...    symptom=青紫，体检发现心脏杂音16个月#####SPO275%，营养稍差。心律齐，L2～4 3／4级SM，第二心音单一，不亢进。腹软，肝肋下1.5cm，脾肋下未触及。四肢暖，杵状指（趾）。 现病史:患儿生后即出现青紫。当地医院体检时发现心脏有杂音，诊断为先天性心脏病。患儿生长发育稍受限。平素患儿口唇青紫，活动后青紫变化不明显。目前能说话，走路尚需人搀扶。入院以来，患儿神志清，精神一般，食欲可，两便可。无蹲踞，无缺氧发作史，无肺炎心衰史。    weight=9    assistCheck=心脏彩超：完全性大动脉错位，室间隔缺损，动脉导管未闭，肺动脉瓣与瓣下狭窄。三尖瓣轻度反流，二尖瓣和主动脉瓣反流均为阴性。左室射血分数73%，缩短分数42%。心血管造影：各主要血管直径：肺总动脉7.5mm，右肺动脉起始部15.4mm，远端12.7mm，左肺动脉起始部7.9mm，远端9.9mm，降主动脉横膈处9.4mm。McGoon指数＝2.48，Nakata指数＝399。导管术中吸氧状态下降主动脉氧饱和度为81。冠状动脉为A型。未见明显侧支血管形成。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    动脉导管未闭

心脏科经典病历67行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=16    ageType=月    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=135    highBldPress=80    lowBldPress=50    personalHistory=    previousHistory=
    ...    symptom=青紫，体检发现心脏杂音16个月#####SPO275%，营养稍差。心律齐，L2～4 3／4级SM，第二心音单一，不亢进。腹软，肝肋下1.5cm，脾肋下未触及。四肢暖，杵状指（趾）。 现病史:患儿生后即出现青紫。当地医院体检时发现心脏有杂音，诊断为先天性心脏病。患儿生长发育稍受限。平素患儿口唇青紫，活动后青紫变化不明显。目前能说话，走路尚需人搀扶。入院以来，患儿神志清，精神一般，食欲可，两便可。无蹲踞，无缺氧发作史，无肺炎心衰史。    weight=9    assistCheck=心脏彩超：完全性大动脉错位，室间隔缺损，动脉导管未闭，肺动脉瓣与瓣下狭窄。三尖瓣轻度反流，二尖瓣和主动脉瓣反流均为阴性。左室射血分数73%，缩短分数42%。心血管造影：各主要血管直径：肺总动脉7.5mm，右肺动脉起始部15.4mm，远端12.7mm，左肺动脉起始部7.9mm，远端9.9mm，降主动脉横膈处9.4mm。McGoon指数＝2.48，Nakata指数＝399。导管术中吸氧状态下降主动脉氧饱和度为81。冠状动脉为A型。未见明显侧支血管形成。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉狭窄

心脏科经典病历68行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=天    allergyHistory=    bodyTempr=37.9    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=70    lowBldPress=45    personalHistory=    previousHistory=
    ...    symptom=出生后发现心脏杂音伴青紫#####中央型青紫（＋），胸部无畸形，心尖搏动增强，心律齐，132次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进，主动脉瓣区第2音稍减弱。腹平软，肝肋下2c m。 现病史:患儿出生后体检听诊时发现心脏杂音，伴有口唇青紫，当地医院诊断为“先天性心脏病，发绀型”。一个月大时就诊于我院门诊    weight=    assistCheck="心电图：窦性心动过速，心率153次／分，双房大，右室大，左胸导联深Q波。胸部X线检查：心影大，肺血多。超声心动图检查：心房正位，房室连接一致，主动脉及肺动脉均发自形态学右心室；大血管关系侧侧位，主动脉位于右侧，肺动脉位于左侧略前。室间隔缺损1.0c m，位于肺动脉下。动脉导管未闭，肺动脉端0.15c m。卵圆孔未闭。诊断：右室双出口（Taussig‐Bing），动脉导管未闭，卵圆孔未闭。心血管造影 内脏心房正位，左心室造影见一大室间隔缺损8.7mm，位于肺动脉下，肺动脉骑跨明显；主动脉及肺动脉均发自右心室，双动脉下见圆锥。右心室造影见右心室发育可，大血管侧侧排列，主动脉位于右侧略后，肺动脉位于左侧略前；左、右肺动脉形态可，左肺动脉起始5.4mm，远端6.1mm，右肺动脉起始6.9mm，远端分叉处7.4mm，经肺循环，肺静脉回流正常。主动脉造影见左弓，见动脉导管未闭，近肺动脉端1.8mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历68行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=天    allergyHistory=    bodyTempr=37.9    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=70    lowBldPress=45    personalHistory=    previousHistory=
    ...    symptom=出生后发现心脏杂音伴青紫#####中央型青紫（＋），胸部无畸形，心尖搏动增强，心律齐，132次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进，主动脉瓣区第2音稍减弱。腹平软，肝肋下2c m。 现病史:患儿出生后体检听诊时发现心脏杂音，伴有口唇青紫，当地医院诊断为“先天性心脏病，发绀型”。一个月大时就诊于我院门诊    weight=    assistCheck="心电图：窦性心动过速，心率153次／分，双房大，右室大，左胸导联深Q波。胸部X线检查：心影大，肺血多。超声心动图检查：心房正位，房室连接一致，主动脉及肺动脉均发自形态学右心室；大血管关系侧侧位，主动脉位于右侧，肺动脉位于左侧略前。室间隔缺损1.0c m，位于肺动脉下。动脉导管未闭，肺动脉端0.15c m。卵圆孔未闭。诊断：右室双出口（Taussig‐Bing），动脉导管未闭，卵圆孔未闭。心血管造影 内脏心房正位，左心室造影见一大室间隔缺损8.7mm，位于肺动脉下，肺动脉骑跨明显；主动脉及肺动脉均发自右心室，双动脉下见圆锥。右心室造影见右心室发育可，大血管侧侧排列，主动脉位于右侧略后，肺动脉位于左侧略前；左、右肺动脉形态可，左肺动脉起始5.4mm，远端6.1mm，右肺动脉起始6.9mm，远端分叉处7.4mm，经肺循环，肺静脉回流正常。主动脉造影见左弓，见动脉导管未闭，近肺动脉端1.8mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    右心室双出口

心脏科经典病历68行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=天    allergyHistory=    bodyTempr=37.9    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=70    lowBldPress=45    personalHistory=    previousHistory=
    ...    symptom=出生后发现心脏杂音伴青紫#####中央型青紫（＋），胸部无畸形，心尖搏动增强，心律齐，132次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进，主动脉瓣区第2音稍减弱。腹平软，肝肋下2c m。 现病史:患儿出生后体检听诊时发现心脏杂音，伴有口唇青紫，当地医院诊断为“先天性心脏病，发绀型”。一个月大时就诊于我院门诊    weight=    assistCheck="心电图：窦性心动过速，心率153次／分，双房大，右室大，左胸导联深Q波。胸部X线检查：心影大，肺血多。超声心动图检查：心房正位，房室连接一致，主动脉及肺动脉均发自形态学右心室；大血管关系侧侧位，主动脉位于右侧，肺动脉位于左侧略前。室间隔缺损1.0c m，位于肺动脉下。动脉导管未闭，肺动脉端0.15c m。卵圆孔未闭。诊断：右室双出口（Taussig‐Bing），动脉导管未闭，卵圆孔未闭。心血管造影 内脏心房正位，左心室造影见一大室间隔缺损8.7mm，位于肺动脉下，肺动脉骑跨明显；主动脉及肺动脉均发自右心室，双动脉下见圆锥。右心室造影见右心室发育可，大血管侧侧排列，主动脉位于右侧略后，肺动脉位于左侧略前；左、右肺动脉形态可，左肺动脉起始5.4mm，远端6.1mm，右肺动脉起始6.9mm，远端分叉处7.4mm，经肺循环，肺静脉回流正常。主动脉造影见左弓，见动脉导管未闭，近肺动脉端1.8mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室间隔缺损

心脏科经典病历68行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=天    allergyHistory=    bodyTempr=37.9    familyHistory=
    ...    gender=1    heartRate=150    highBldPress=70    lowBldPress=45    personalHistory=    previousHistory=
    ...    symptom=出生后发现心脏杂音伴青紫#####中央型青紫（＋），胸部无畸形，心尖搏动增强，心律齐，132次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进，主动脉瓣区第2音稍减弱。腹平软，肝肋下2c m。 现病史:患儿出生后体检听诊时发现心脏杂音，伴有口唇青紫，当地医院诊断为“先天性心脏病，发绀型”。一个月大时就诊于我院门诊    weight=    assistCheck="心电图：窦性心动过速，心率153次／分，双房大，右室大，左胸导联深Q波。胸部X线检查：心影大，肺血多。超声心动图检查：心房正位，房室连接一致，主动脉及肺动脉均发自形态学右心室；大血管关系侧侧位，主动脉位于右侧，肺动脉位于左侧略前。室间隔缺损1.0c m，位于肺动脉下。动脉导管未闭，肺动脉端0.15c m。卵圆孔未闭。诊断：右室双出口（Taussig‐Bing），动脉导管未闭，卵圆孔未闭。心血管造影 内脏心房正位，左心室造影见一大室间隔缺损8.7mm，位于肺动脉下，肺动脉骑跨明显；主动脉及肺动脉均发自右心室，双动脉下见圆锥。右心室造影见右心室发育可，大血管侧侧排列，主动脉位于右侧略后，肺动脉位于左侧略前；左、右肺动脉形态可，左肺动脉起始5.4mm，远端6.1mm，右肺动脉起始6.9mm，远端分叉处7.4mm，经肺循环，肺静脉回流正常。主动脉造影见左弓，见动脉导管未闭，近肺动脉端1.8mm"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    动脉导管未闭

心脏科经典病历69行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=月    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=84    lowBldPress=46    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音8个月#####SPO298%。中央型青紫（─），心律齐，心率130次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进。腹平软，肝肋下1.0c m。 现病史:患儿出生后即发现心脏杂音、无青紫，当地医院诊断为“先天性心脏病”，未进一步诊治。1月前出现发热，诊断为肺炎，经对症治疗后好转。患儿自出生以来，易患上呼吸道感染。生长发育正常，无发绀史，活动量与同龄儿童基本相同，饮食及大小便正常。    weight=8    assistCheck=心电图：窦性心律，心率143次／分，双室大。胸部X线检查：心影大，肺血多，两肺纹理增多模糊。超声心动图检查：心房正位，房室连接一致，左房、左室大，右室肥厚，房间隔卵圆孔未闭，主动脉位于右稍偏后，由右室发出，瓣膜开放可。肺动脉位于左稍偏前，发自右心室，增宽明显，内径1.77c m。主动脉瓣与二尖瓣呈肌性连接，室间隔缺损于双动脉下，动脉导管未闭0.3c m（肺动脉端）。诊断：右室双出口（S﹒D﹒D），动脉导管未闭，卵圆孔未闭。心血管造影：内脏心房正位，右心室造影见右心室扩大，主动脉位于右侧，肺动脉位于左侧，肺动脉总干扩张，左、右肺动脉发育可，见肺循环，肺静脉回流正常。左室及主动脉造影，双动脉下偏主动脉下VSD，直径10.1mm，主动脉及肺动脉均发自右心室，见动脉导管未闭    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    右心室双出口

心脏科经典病历69行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=月    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=84    lowBldPress=46    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音8个月#####SPO298%。中央型青紫（─），心律齐，心率130次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进。腹平软，肝肋下1.0c m。 现病史:患儿出生后即发现心脏杂音、无青紫，当地医院诊断为“先天性心脏病”，未进一步诊治。1月前出现发热，诊断为肺炎，经对症治疗后好转。患儿自出生以来，易患上呼吸道感染。生长发育正常，无发绀史，活动量与同龄儿童基本相同，饮食及大小便正常。    weight=8    assistCheck=心电图：窦性心律，心率143次／分，双室大。胸部X线检查：心影大，肺血多，两肺纹理增多模糊。超声心动图检查：心房正位，房室连接一致，左房、左室大，右室肥厚，房间隔卵圆孔未闭，主动脉位于右稍偏后，由右室发出，瓣膜开放可。肺动脉位于左稍偏前，发自右心室，增宽明显，内径1.77c m。主动脉瓣与二尖瓣呈肌性连接，室间隔缺损于双动脉下，动脉导管未闭0.3c m（肺动脉端）。诊断：右室双出口（S﹒D﹒D），动脉导管未闭，卵圆孔未闭。心血管造影：内脏心房正位，右心室造影见右心室扩大，主动脉位于右侧，肺动脉位于左侧，肺动脉总干扩张，左、右肺动脉发育可，见肺循环，肺静脉回流正常。左室及主动脉造影，双动脉下偏主动脉下VSD，直径10.1mm，主动脉及肺动脉均发自右心室，见动脉导管未闭    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    室间隔缺损

心脏科经典病历69行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=8    ageType=月    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=84    lowBldPress=46    personalHistory=    previousHistory=
    ...    symptom=发现心脏杂音8个月#####SPO298%。中央型青紫（─），心律齐，心率130次／分，胸骨左缘第3～4肋间听及3／6级收缩期杂音，P2亢进。腹平软，肝肋下1.0c m。 现病史:患儿出生后即发现心脏杂音、无青紫，当地医院诊断为“先天性心脏病”，未进一步诊治。1月前出现发热，诊断为肺炎，经对症治疗后好转。患儿自出生以来，易患上呼吸道感染。生长发育正常，无发绀史，活动量与同龄儿童基本相同，饮食及大小便正常。    weight=8    assistCheck=心电图：窦性心律，心率143次／分，双室大。胸部X线检查：心影大，肺血多，两肺纹理增多模糊。超声心动图检查：心房正位，房室连接一致，左房、左室大，右室肥厚，房间隔卵圆孔未闭，主动脉位于右稍偏后，由右室发出，瓣膜开放可。肺动脉位于左稍偏前，发自右心室，增宽明显，内径1.77c m。主动脉瓣与二尖瓣呈肌性连接，室间隔缺损于双动脉下，动脉导管未闭0.3c m（肺动脉端）。诊断：右室双出口（S﹒D﹒D），动脉导管未闭，卵圆孔未闭。心血管造影：内脏心房正位，右心室造影见右心室扩大，主动脉位于右侧，肺动脉位于左侧，肺动脉总干扩张，左、右肺动脉发育可，见肺循环，肺静脉回流正常。左室及主动脉造影，双动脉下偏主动脉下VSD，直径10.1mm，主动脉及肺动脉均发自右心室，见动脉导管未闭    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    动脉导管未闭

心脏科经典病历70行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=5    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=100    highBldPress=125    lowBldPress=78    personalHistory=无药物、食物过敏史，无外伤史。    previousHistory=
    ...    symptom=发现心脏杂音1个月。#####心前区饱满，心尖搏动局限。胸骨左缘第2肋间可触及震颤，无心包摩擦感，心脏浊音界向左扩大。心率100次／分，律齐，胸骨右缘第2肋间可闻及3／6级收缩期杂音。 现病史:1月前，患儿在当地医院体检时发现有心脏杂音，遂来我院。患儿平素易患“感冒”，反复发热，但无咳嗽、咳痰、劳力性呼吸困难，无头晕、头痛、晕厥，无发绀或蹲踞现象。今为进一步诊治收住入院。患儿自入院以来，饮食、睡眠可，大、小便正常。    weight=    assistCheck=心电图：ST‐T改变，左心室肥厚。X线胸片：肺野清晰，中上肺野肺血增多。肺门结构清晰，心影增大，心胸比例0.53。主动脉结增宽。两膈光滑，肋膈角锐利。胸廓骨骼未见异常。超声心动图：心脏左位，心房正位，心室右袢，主动脉正位。上、下腔静脉回流入右心房，左、右肺静脉回流入左心房。左室壁增厚，室间隔完整。升主动脉稍增宽。主动脉缩窄，于左锁骨下动脉12.4mm处可见缩窄环，内径4.5mm，压差50mmHg。心脏螺旋CT：心脏增大，左心房及左心室增大。降主动脉起始段局限性狭窄    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    先天性心脏病

心脏科经典病历70行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=5    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=100    highBldPress=125    lowBldPress=78    personalHistory=无药物、食物过敏史，无外伤史。    previousHistory=
    ...    symptom=发现心脏杂音1个月。#####心前区饱满，心尖搏动局限。胸骨左缘第2肋间可触及震颤，无心包摩擦感，心脏浊音界向左扩大。心率100次／分，律齐，胸骨右缘第2肋间可闻及3／6级收缩期杂音。 现病史:1月前，患儿在当地医院体检时发现有心脏杂音，遂来我院。患儿平素易患“感冒”，反复发热，但无咳嗽、咳痰、劳力性呼吸困难，无头晕、头痛、晕厥，无发绀或蹲踞现象。今为进一步诊治收住入院。患儿自入院以来，饮食、睡眠可，大、小便正常。    weight=    assistCheck=心电图：ST‐T改变，左心室肥厚。X线胸片：肺野清晰，中上肺野肺血增多。肺门结构清晰，心影增大，心胸比例0.53。主动脉结增宽。两膈光滑，肋膈角锐利。胸廓骨骼未见异常。超声心动图：心脏左位，心房正位，心室右袢，主动脉正位。上、下腔静脉回流入右心房，左、右肺静脉回流入左心房。左室壁增厚，室间隔完整。升主动脉稍增宽。主动脉缩窄，于左锁骨下动脉12.4mm处可见缩窄环，内径4.5mm，压差50mmHg。心脏螺旋CT：心脏增大，左心房及左心室增大。降主动脉起始段局限性狭窄    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    主动脉缩窄

心脏科经典病历71行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=108    highBldPress=92    lowBldPress=66    personalHistory=    previousHistory=
    ...    symptom=气促、乏力伴腹胀、下肢肿7月#####巩膜轻度黄染，睑结膜色泽淡。口唇略发绀；颈静脉怒张；双肺未闻及啰音，双下肺呼吸音减弱；心尖搏动减弱，范围缩小，无震颤触及；心率快（108次／分），腹部膨隆，移动性浊音（＋）；肝脏肋下4c m，剑突下7c m，质地硬，轻压痛。双下肢胫前及足背凹陷性水肿；双肾区无叩痛。 现病史:7个月前，患者逐渐感到体力下降，活动时感到气促乏力，以后逐渐出现腹胀、食欲下降，下午、夜间发现双下肢肿。6个月前，当地医院诊断为“肝硬化、腹水”，给予保肝、利尿药物（具体药名不详），治疗后症状缓解。近2个多月，患者气促、乏力、腹胀和下肢肿逐渐加重，伴胸闷、尿少，活动明显受限，且服用药物后效果不明显，患者发病以来，无发热、咳嗽史，夜间有时不能平卧。食欲明显下降。    weight=    assistCheck="血常规：血红蛋白98g／L，血沉 12mm／h。肝功、肾功：丙氨酸氨基转移酶（ALT）：68I U／L，总蛋白（TP）：55g／L，清蛋白（ALB）：32g／L，球蛋白（GLB）：23g／L，尿素（BUV）：6.9mmol／L，肌酐：110.6μmol／L。心电图：窦性心律，心率108次／分，电轴不偏，全导联QRS波低电压（均＜0.5mV），T波低平。胸部X线检查 双肺纹理增多，双侧肋膈角变钝；心影不大，左心缘平直，侧位可见心脏前缘和下缘钙化影。心脏超声心动图：心包增厚伴钙化，心内结构无异常，心脏各房、室大小基本正常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    缩窄性心包炎

心脏科经典病历72行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=102    highBldPress=100    lowBldPress=52    personalHistory=    previousHistory=
    ...    symptom=胸闷，气短18年，加重2年#####房颤心律。营养发育正常，神态清。胸骨左缘心前区处可有收缩期抬举性搏动。心尖区可闻及隆隆样舒张期杂音，第一心音亢进和肺动脉区的第二心音亢进。 现病史:患者反复胸闷、气促约18年。曾在当地医院检查，听诊时发现心脏杂音。近两年来症状加重，心慌气短，活动受限，有时痰中带血。今来我院做进一步诊治。发病以来长期服用地高辛和利尿剂，饮食及大、小便基本正常。无外周血管栓塞史    weight=    assistCheck="心电图：心房颤动，左房扩大，右心室肥厚或右束支传导阻滞。X线检查：提示左心房和右心室增大，慢性肺瘀血和间质性肺水肿。超声心动图检查 右心房25mm，右心室28mm，左心室35mm，左心房60mm。二尖瓣前、后叶均增厚、钙化。前、后交界融合，瓣下腱索增粗伴融合。多普勒检查提示：二尖瓣开口面积1.0c m2，估侧肺动脉压为80mmHg。三尖瓣探及中量以下反流。左室L VEF 50%。左房未探及血栓。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    风湿性心脏病

心脏科经典病历72行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=102    highBldPress=100    lowBldPress=52    personalHistory=    previousHistory=
    ...    symptom=胸闷，气短18年，加重2年#####房颤心律。营养发育正常，神态清。胸骨左缘心前区处可有收缩期抬举性搏动。心尖区可闻及隆隆样舒张期杂音，第一心音亢进和肺动脉区的第二心音亢进。 现病史:患者反复胸闷、气促约18年。曾在当地医院检查，听诊时发现心脏杂音。近两年来症状加重，心慌气短，活动受限，有时痰中带血。今来我院做进一步诊治。发病以来长期服用地高辛和利尿剂，饮食及大、小便基本正常。无外周血管栓塞史    weight=    assistCheck="心电图：心房颤动，左房扩大，右心室肥厚或右束支传导阻滞。X线检查：提示左心房和右心室增大，慢性肺瘀血和间质性肺水肿。超声心动图检查 右心房25mm，右心室28mm，左心室35mm，左心房60mm。二尖瓣前、后叶均增厚、钙化。前、后交界融合，瓣下腱索增粗伴融合。多普勒检查提示：二尖瓣开口面积1.0c m2，估侧肺动脉压为80mmHg。三尖瓣探及中量以下反流。左室L VEF 50%。左房未探及血栓。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    二尖瓣狭窄

心脏科经典病历72行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=102    highBldPress=100    lowBldPress=52    personalHistory=    previousHistory=
    ...    symptom=胸闷，气短18年，加重2年#####房颤心律。营养发育正常，神态清。胸骨左缘心前区处可有收缩期抬举性搏动。心尖区可闻及隆隆样舒张期杂音，第一心音亢进和肺动脉区的第二心音亢进。 现病史:患者反复胸闷、气促约18年。曾在当地医院检查，听诊时发现心脏杂音。近两年来症状加重，心慌气短，活动受限，有时痰中带血。今来我院做进一步诊治。发病以来长期服用地高辛和利尿剂，饮食及大、小便基本正常。无外周血管栓塞史    weight=    assistCheck="心电图：心房颤动，左房扩大，右心室肥厚或右束支传导阻滞。X线检查：提示左心房和右心室增大，慢性肺瘀血和间质性肺水肿。超声心动图检查 右心房25mm，右心室28mm，左心室35mm，左心房60mm。二尖瓣前、后叶均增厚、钙化。前、后交界融合，瓣下腱索增粗伴融合。多普勒检查提示：二尖瓣开口面积1.0c m2，估侧肺动脉压为80mmHg。三尖瓣探及中量以下反流。左室L VEF 50%。左房未探及血栓。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

心脏科经典病历73行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom= 现病史:    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原发性高血压

心脏科经典病历74行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=78    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=喘息发作时经常喷服沙丁胺醇，不规律应用沙美特罗替卡松粉吸入剂（舒利迭），口服茶碱类药物。
    ...    symptom=反复咳嗽、咳痰伴喘息50年，活动后气短5年，间断双下肢水肿2年，加重1周。#####神志清楚，呼吸急促，口唇及四肢末梢发绀，颈静脉怒张，肝-颈静脉回流征阳性。桶状胸，双侧胸部第9肋以下叩诊为浊音，余肺叩诊过清音，双肺可闻及广泛哮鸣音，双肺底较多小水泡音。心率135次/分，律不齐，SⅠ强弱不等，腹膨隆，无压痛，肝肋下约3cm，质韧，移动性浊音阳性。周身水肿，以双下肢为重。 现病史:患者自50年前反复咳嗽、咳白痰，伴喘息，多于春秋季节出现，接触刺激性气味或上呼吸道感染时可发作，应用支气管舒张药物和抗感染治疗可缓解。近5年来出现活动后气短、乏力，近2年间断出现双下肢水肿，1年前曾住院治疗，诊断为“COPD、肺源性心脏病”。1周前因观看烟花接触火药味，导致咳嗽、喘息突然加重，无痰，解痉平喘及对症治疗后，但病情无明显缓解，夜间咳嗽加重，咳稀薄泡沫样痰，且出现腹胀、双下肢水肿、少尿，近3天来夜间不能平卧，为求进一步诊治转入院。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.32，动脉血氧饱和度74%。 血常规：WBC 8.5×109/L；N 70%； 血浆纤维蛋白原4.12g/L，凝血酶原时间14秒（正常人16秒）。血尿素氮24mmol/L，血肌酐90μmol/L，血浆白蛋白35g/L，球蛋白22g/L，血 K+ 3.6mmol/L，Na+ 138mmol/L，Cl- 95mmol/L。肺CT示双肺纹理增强紊乱，以肺门为中心对称分布磨玻璃密度渗出影，肺动脉干增宽，双侧胸腔少量积液。超声心动图示右心房、右心室扩大，三尖瓣反流重度，肺动脉压力为75mmHg。心电图示电轴右偏，房颤律。 病情缓解期的肺功能：FEV1/FVC为60%，FEV1占预计值百分比为55%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性阻塞性肺疾病

心脏科经典病历74行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=78    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=喘息发作时经常喷服沙丁胺醇，不规律应用沙美特罗替卡松粉吸入剂（舒利迭），口服茶碱类药物。
    ...    symptom=反复咳嗽、咳痰伴喘息50年，活动后气短5年，间断双下肢水肿2年，加重1周。#####神志清楚，呼吸急促，口唇及四肢末梢发绀，颈静脉怒张，肝-颈静脉回流征阳性。桶状胸，双侧胸部第9肋以下叩诊为浊音，余肺叩诊过清音，双肺可闻及广泛哮鸣音，双肺底较多小水泡音。心率135次/分，律不齐，SⅠ强弱不等，腹膨隆，无压痛，肝肋下约3cm，质韧，移动性浊音阳性。周身水肿，以双下肢为重。 现病史:患者自50年前反复咳嗽、咳白痰，伴喘息，多于春秋季节出现，接触刺激性气味或上呼吸道感染时可发作，应用支气管舒张药物和抗感染治疗可缓解。近5年来出现活动后气短、乏力，近2年间断出现双下肢水肿，1年前曾住院治疗，诊断为“COPD、肺源性心脏病”。1周前因观看烟花接触火药味，导致咳嗽、喘息突然加重，无痰，解痉平喘及对症治疗后，但病情无明显缓解，夜间咳嗽加重，咳稀薄泡沫样痰，且出现腹胀、双下肢水肿、少尿，近3天来夜间不能平卧，为求进一步诊治转入院。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.32，动脉血氧饱和度74%。 血常规：WBC 8.5×109/L；N 70%； 血浆纤维蛋白原4.12g/L，凝血酶原时间14秒（正常人16秒）。血尿素氮24mmol/L，血肌酐90μmol/L，血浆白蛋白35g/L，球蛋白22g/L，血 K+ 3.6mmol/L，Na+ 138mmol/L，Cl- 95mmol/L。肺CT示双肺纹理增强紊乱，以肺门为中心对称分布磨玻璃密度渗出影，肺动脉干增宽，双侧胸腔少量积液。超声心动图示右心房、右心室扩大，三尖瓣反流重度，肺动脉压力为75mmHg。心电图示电轴右偏，房颤律。 病情缓解期的肺功能：FEV1/FVC为60%，FEV1占预计值百分比为55%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

心脏科经典病历74行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=78    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=喘息发作时经常喷服沙丁胺醇，不规律应用沙美特罗替卡松粉吸入剂（舒利迭），口服茶碱类药物。
    ...    symptom=反复咳嗽、咳痰伴喘息50年，活动后气短5年，间断双下肢水肿2年，加重1周。#####神志清楚，呼吸急促，口唇及四肢末梢发绀，颈静脉怒张，肝-颈静脉回流征阳性。桶状胸，双侧胸部第9肋以下叩诊为浊音，余肺叩诊过清音，双肺可闻及广泛哮鸣音，双肺底较多小水泡音。心率135次/分，律不齐，SⅠ强弱不等，腹膨隆，无压痛，肝肋下约3cm，质韧，移动性浊音阳性。周身水肿，以双下肢为重。 现病史:患者自50年前反复咳嗽、咳白痰，伴喘息，多于春秋季节出现，接触刺激性气味或上呼吸道感染时可发作，应用支气管舒张药物和抗感染治疗可缓解。近5年来出现活动后气短、乏力，近2年间断出现双下肢水肿，1年前曾住院治疗，诊断为“COPD、肺源性心脏病”。1周前因观看烟花接触火药味，导致咳嗽、喘息突然加重，无痰，解痉平喘及对症治疗后，但病情无明显缓解，夜间咳嗽加重，咳稀薄泡沫样痰，且出现腹胀、双下肢水肿、少尿，近3天来夜间不能平卧，为求进一步诊治转入院。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.32，动脉血氧饱和度74%。 血常规：WBC 8.5×109/L；N 70%； 血浆纤维蛋白原4.12g/L，凝血酶原时间14秒（正常人16秒）。血尿素氮24mmol/L，血肌酐90μmol/L，血浆白蛋白35g/L，球蛋白22g/L，血 K+ 3.6mmol/L，Na+ 138mmol/L，Cl- 95mmol/L。肺CT示双肺纹理增强紊乱，以肺门为中心对称分布磨玻璃密度渗出影，肺动脉干增宽，双侧胸腔少量积液。超声心动图示右心房、右心室扩大，三尖瓣反流重度，肺动脉压力为75mmHg。心电图示电轴右偏，房颤律。 病情缓解期的肺功能：FEV1/FVC为60%，FEV1占预计值百分比为55%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

心脏科经典病历74行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=78    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=喘息发作时经常喷服沙丁胺醇，不规律应用沙美特罗替卡松粉吸入剂（舒利迭），口服茶碱类药物。
    ...    symptom=反复咳嗽、咳痰伴喘息50年，活动后气短5年，间断双下肢水肿2年，加重1周。#####神志清楚，呼吸急促，口唇及四肢末梢发绀，颈静脉怒张，肝-颈静脉回流征阳性。桶状胸，双侧胸部第9肋以下叩诊为浊音，余肺叩诊过清音，双肺可闻及广泛哮鸣音，双肺底较多小水泡音。心率135次/分，律不齐，SⅠ强弱不等，腹膨隆，无压痛，肝肋下约3cm，质韧，移动性浊音阳性。周身水肿，以双下肢为重。 现病史:患者自50年前反复咳嗽、咳白痰，伴喘息，多于春秋季节出现，接触刺激性气味或上呼吸道感染时可发作，应用支气管舒张药物和抗感染治疗可缓解。近5年来出现活动后气短、乏力，近2年间断出现双下肢水肿，1年前曾住院治疗，诊断为“COPD、肺源性心脏病”。1周前因观看烟花接触火药味，导致咳嗽、喘息突然加重，无痰，解痉平喘及对症治疗后，但病情无明显缓解，夜间咳嗽加重，咳稀薄泡沫样痰，且出现腹胀、双下肢水肿、少尿，近3天来夜间不能平卧，为求进一步诊治转入院。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.32，动脉血氧饱和度74%。 血常规：WBC 8.5×109/L；N 70%； 血浆纤维蛋白原4.12g/L，凝血酶原时间14秒（正常人16秒）。血尿素氮24mmol/L，血肌酐90μmol/L，血浆白蛋白35g/L，球蛋白22g/L，血 K+ 3.6mmol/L，Na+ 138mmol/L，Cl- 95mmol/L。肺CT示双肺纹理增强紊乱，以肺门为中心对称分布磨玻璃密度渗出影，肺动脉干增宽，双侧胸腔少量积液。超声心动图示右心房、右心室扩大，三尖瓣反流重度，肺动脉压力为75mmHg。心电图示电轴右偏，房颤律。 病情缓解期的肺功能：FEV1/FVC为60%，FEV1占预计值百分比为55%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历74行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=78    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=喘息发作时经常喷服沙丁胺醇，不规律应用沙美特罗替卡松粉吸入剂（舒利迭），口服茶碱类药物。
    ...    symptom=反复咳嗽、咳痰伴喘息50年，活动后气短5年，间断双下肢水肿2年，加重1周。#####神志清楚，呼吸急促，口唇及四肢末梢发绀，颈静脉怒张，肝-颈静脉回流征阳性。桶状胸，双侧胸部第9肋以下叩诊为浊音，余肺叩诊过清音，双肺可闻及广泛哮鸣音，双肺底较多小水泡音。心率135次/分，律不齐，SⅠ强弱不等，腹膨隆，无压痛，肝肋下约3cm，质韧，移动性浊音阳性。周身水肿，以双下肢为重。 现病史:患者自50年前反复咳嗽、咳白痰，伴喘息，多于春秋季节出现，接触刺激性气味或上呼吸道感染时可发作，应用支气管舒张药物和抗感染治疗可缓解。近5年来出现活动后气短、乏力，近2年间断出现双下肢水肿，1年前曾住院治疗，诊断为“COPD、肺源性心脏病”。1周前因观看烟花接触火药味，导致咳嗽、喘息突然加重，无痰，解痉平喘及对症治疗后，但病情无明显缓解，夜间咳嗽加重，咳稀薄泡沫样痰，且出现腹胀、双下肢水肿、少尿，近3天来夜间不能平卧，为求进一步诊治转入院。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.32，动脉血氧饱和度74%。 血常规：WBC 8.5×109/L；N 70%； 血浆纤维蛋白原4.12g/L，凝血酶原时间14秒（正常人16秒）。血尿素氮24mmol/L，血肌酐90μmol/L，血浆白蛋白35g/L，球蛋白22g/L，血 K+ 3.6mmol/L，Na+ 138mmol/L，Cl- 95mmol/L。肺CT示双肺纹理增强紊乱，以肺门为中心对称分布磨玻璃密度渗出影，肺动脉干增宽，双侧胸腔少量积液。超声心动图示右心房、右心室扩大，三尖瓣反流重度，肺动脉压力为75mmHg。心电图示电轴右偏，房颤律。 病情缓解期的肺功能：FEV1/FVC为60%，FEV1占预计值百分比为55%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心律失常

心脏科经典病历74行-6
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=78    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=喘息发作时经常喷服沙丁胺醇，不规律应用沙美特罗替卡松粉吸入剂（舒利迭），口服茶碱类药物。
    ...    symptom=反复咳嗽、咳痰伴喘息50年，活动后气短5年，间断双下肢水肿2年，加重1周。#####神志清楚，呼吸急促，口唇及四肢末梢发绀，颈静脉怒张，肝-颈静脉回流征阳性。桶状胸，双侧胸部第9肋以下叩诊为浊音，余肺叩诊过清音，双肺可闻及广泛哮鸣音，双肺底较多小水泡音。心率135次/分，律不齐，SⅠ强弱不等，腹膨隆，无压痛，肝肋下约3cm，质韧，移动性浊音阳性。周身水肿，以双下肢为重。 现病史:患者自50年前反复咳嗽、咳白痰，伴喘息，多于春秋季节出现，接触刺激性气味或上呼吸道感染时可发作，应用支气管舒张药物和抗感染治疗可缓解。近5年来出现活动后气短、乏力，近2年间断出现双下肢水肿，1年前曾住院治疗，诊断为“COPD、肺源性心脏病”。1周前因观看烟花接触火药味，导致咳嗽、喘息突然加重，无痰，解痉平喘及对症治疗后，但病情无明显缓解，夜间咳嗽加重，咳稀薄泡沫样痰，且出现腹胀、双下肢水肿、少尿，近3天来夜间不能平卧，为求进一步诊治转入院。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.32，动脉血氧饱和度74%。 血常规：WBC 8.5×109/L；N 70%； 血浆纤维蛋白原4.12g/L，凝血酶原时间14秒（正常人16秒）。血尿素氮24mmol/L，血肌酐90μmol/L，血浆白蛋白35g/L，球蛋白22g/L，血 K+ 3.6mmol/L，Na+ 138mmol/L，Cl- 95mmol/L。肺CT示双肺纹理增强紊乱，以肺门为中心对称分布磨玻璃密度渗出影，肺动脉干增宽，双侧胸腔少量积液。超声心动图示右心房、右心室扩大，三尖瓣反流重度，肺动脉压力为75mmHg。心电图示电轴右偏，房颤律。 病情缓解期的肺功能：FEV1/FVC为60%，FEV1占预计值百分比为55%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心房颤动

心脏科经典病历75行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复胸痛3年，活动后气短1年，加重伴双下肢水肿2周。#####神志清楚，查体合作。颜面及眼睑水肿，口唇及四肢末梢明显发绀。颈静脉怒张，双肺未闻及干、湿 音。心界轻度向右扩大，心率110次/分，律齐，P2＞A2，剑下心音增强，三尖瓣区可闻及Ⅲ级收缩期杂音。肝肋下2cm，剑突下1cm，质韧，移动性浊音阴性，肠鸣音4～5次/分。双下肢可凹陷性水肿，无杵状指（趾）。 现病史:"患者自3年前开始，反复于活动中出现胸痛，每次胸痛部位不固定，与呼吸无关，多于蹲起或坐起时出现，有时略感胸闷，但很快缓解，无咯血及晕厥，无咳嗽、咳痰，自述曾多次在当地医院就诊，行24小时动态心电图及心肌标志物等检查，排除了冠心病，行CTPA及双下肢CTV检查排除了肺栓塞（具体不详），但未能明确胸痛原因。1年前开始出现活动后气短，劳动耐量逐渐下降。2周前于活动时再次突发胸痛，气短症状加重，伴双下肢水肿，偶有干咳，无发热、咳痰及咯血，为明确诊治来院就诊。病来近10天腹胀、食欲缺乏，睡眠欠佳，少尿。"    weight=    assistCheck="血气分析：pH 7.49，PO2 46mmHg，PCO2 28mmHg，实际碳酸氢盐18mmol/L，标准碳酸氢盐20mmol/L，动脉血氧饱和度74%。血常规：WBC 8.1×109/L；N 60%；血浆D-二聚体0.45mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原3.82g/L，凝血酶原时间13秒（正常人16秒）。血尿素氮12mmol/L，血肌酐82μmol/L。血K+ 3.8mmol/L，Na+ 136mmol/L，Cl- 97mmol/L。 CTPA：近端肺动脉增粗，远端肺纹理稀疏，未见栓子。双下肢CTV未见血栓形成。肺通气灌注扫描：双肺多发按肺段分布的充盈缺损，与通气扫描不匹配。超声心动图示右心系统增大，三尖瓣中度反流，肺动脉压力86mmHg。心电图示Ⅱ、Ⅲ、aVF肺性P波，有SⅠQⅢTⅢ征，电轴右偏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉高压

心脏科经典病历75行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复胸痛3年，活动后气短1年，加重伴双下肢水肿2周。#####神志清楚，查体合作。颜面及眼睑水肿，口唇及四肢末梢明显发绀。颈静脉怒张，双肺未闻及干、湿 音。心界轻度向右扩大，心率110次/分，律齐，P2＞A2，剑下心音增强，三尖瓣区可闻及Ⅲ级收缩期杂音。肝肋下2cm，剑突下1cm，质韧，移动性浊音阴性，肠鸣音4～5次/分。双下肢可凹陷性水肿，无杵状指（趾）。 现病史:"患者自3年前开始，反复于活动中出现胸痛，每次胸痛部位不固定，与呼吸无关，多于蹲起或坐起时出现，有时略感胸闷，但很快缓解，无咯血及晕厥，无咳嗽、咳痰，自述曾多次在当地医院就诊，行24小时动态心电图及心肌标志物等检查，排除了冠心病，行CTPA及双下肢CTV检查排除了肺栓塞（具体不详），但未能明确胸痛原因。1年前开始出现活动后气短，劳动耐量逐渐下降。2周前于活动时再次突发胸痛，气短症状加重，伴双下肢水肿，偶有干咳，无发热、咳痰及咯血，为明确诊治来院就诊。病来近10天腹胀、食欲缺乏，睡眠欠佳，少尿。"    weight=    assistCheck="血气分析：pH 7.49，PO2 46mmHg，PCO2 28mmHg，实际碳酸氢盐18mmol/L，标准碳酸氢盐20mmol/L，动脉血氧饱和度74%。血常规：WBC 8.1×109/L；N 60%；血浆D-二聚体0.45mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原3.82g/L，凝血酶原时间13秒（正常人16秒）。血尿素氮12mmol/L，血肌酐82μmol/L。血K+ 3.8mmol/L，Na+ 136mmol/L，Cl- 97mmol/L。 CTPA：近端肺动脉增粗，远端肺纹理稀疏，未见栓子。双下肢CTV未见血栓形成。肺通气灌注扫描：双肺多发按肺段分布的充盈缺损，与通气扫描不匹配。超声心动图示右心系统增大，三尖瓣中度反流，肺动脉压力86mmHg。心电图示Ⅱ、Ⅲ、aVF肺性P波，有SⅠQⅢTⅢ征，电轴右偏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

心脏科经典病历75行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复胸痛3年，活动后气短1年，加重伴双下肢水肿2周。#####神志清楚，查体合作。颜面及眼睑水肿，口唇及四肢末梢明显发绀。颈静脉怒张，双肺未闻及干、湿 音。心界轻度向右扩大，心率110次/分，律齐，P2＞A2，剑下心音增强，三尖瓣区可闻及Ⅲ级收缩期杂音。肝肋下2cm，剑突下1cm，质韧，移动性浊音阴性，肠鸣音4～5次/分。双下肢可凹陷性水肿，无杵状指（趾）。 现病史:"患者自3年前开始，反复于活动中出现胸痛，每次胸痛部位不固定，与呼吸无关，多于蹲起或坐起时出现，有时略感胸闷，但很快缓解，无咯血及晕厥，无咳嗽、咳痰，自述曾多次在当地医院就诊，行24小时动态心电图及心肌标志物等检查，排除了冠心病，行CTPA及双下肢CTV检查排除了肺栓塞（具体不详），但未能明确胸痛原因。1年前开始出现活动后气短，劳动耐量逐渐下降。2周前于活动时再次突发胸痛，气短症状加重，伴双下肢水肿，偶有干咳，无发热、咳痰及咯血，为明确诊治来院就诊。病来近10天腹胀、食欲缺乏，睡眠欠佳，少尿。"    weight=    assistCheck="血气分析：pH 7.49，PO2 46mmHg，PCO2 28mmHg，实际碳酸氢盐18mmol/L，标准碳酸氢盐20mmol/L，动脉血氧饱和度74%。血常规：WBC 8.1×109/L；N 60%；血浆D-二聚体0.45mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原3.82g/L，凝血酶原时间13秒（正常人16秒）。血尿素氮12mmol/L，血肌酐82μmol/L。血K+ 3.8mmol/L，Na+ 136mmol/L，Cl- 97mmol/L。 CTPA：近端肺动脉增粗，远端肺纹理稀疏，未见栓子。双下肢CTV未见血栓形成。肺通气灌注扫描：双肺多发按肺段分布的充盈缺损，与通气扫描不匹配。超声心动图示右心系统增大，三尖瓣中度反流，肺动脉压力86mmHg。心电图示Ⅱ、Ⅲ、aVF肺性P波，有SⅠQⅢTⅢ征，电轴右偏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    右心衰竭

心脏科经典病历75行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复胸痛3年，活动后气短1年，加重伴双下肢水肿2周。#####神志清楚，查体合作。颜面及眼睑水肿，口唇及四肢末梢明显发绀。颈静脉怒张，双肺未闻及干、湿 音。心界轻度向右扩大，心率110次/分，律齐，P2＞A2，剑下心音增强，三尖瓣区可闻及Ⅲ级收缩期杂音。肝肋下2cm，剑突下1cm，质韧，移动性浊音阴性，肠鸣音4～5次/分。双下肢可凹陷性水肿，无杵状指（趾）。 现病史:"患者自3年前开始，反复于活动中出现胸痛，每次胸痛部位不固定，与呼吸无关，多于蹲起或坐起时出现，有时略感胸闷，但很快缓解，无咯血及晕厥，无咳嗽、咳痰，自述曾多次在当地医院就诊，行24小时动态心电图及心肌标志物等检查，排除了冠心病，行CTPA及双下肢CTV检查排除了肺栓塞（具体不详），但未能明确胸痛原因。1年前开始出现活动后气短，劳动耐量逐渐下降。2周前于活动时再次突发胸痛，气短症状加重，伴双下肢水肿，偶有干咳，无发热、咳痰及咯血，为明确诊治来院就诊。病来近10天腹胀、食欲缺乏，睡眠欠佳，少尿。"    weight=    assistCheck="血气分析：pH 7.49，PO2 46mmHg，PCO2 28mmHg，实际碳酸氢盐18mmol/L，标准碳酸氢盐20mmol/L，动脉血氧饱和度74%。血常规：WBC 8.1×109/L；N 60%；血浆D-二聚体0.45mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原3.82g/L，凝血酶原时间13秒（正常人16秒）。血尿素氮12mmol/L，血肌酐82μmol/L。血K+ 3.8mmol/L，Na+ 136mmol/L，Cl- 97mmol/L。 CTPA：近端肺动脉增粗，远端肺纹理稀疏，未见栓子。双下肢CTV未见血栓形成。肺通气灌注扫描：双肺多发按肺段分布的充盈缺损，与通气扫描不匹配。超声心动图示右心系统增大，三尖瓣中度反流，肺动脉压力86mmHg。心电图示Ⅱ、Ⅲ、aVF肺性P波，有SⅠQⅢTⅢ征，电轴右偏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

心脏科经典病历75行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=反复胸痛3年，活动后气短1年，加重伴双下肢水肿2周。#####神志清楚，查体合作。颜面及眼睑水肿，口唇及四肢末梢明显发绀。颈静脉怒张，双肺未闻及干、湿 音。心界轻度向右扩大，心率110次/分，律齐，P2＞A2，剑下心音增强，三尖瓣区可闻及Ⅲ级收缩期杂音。肝肋下2cm，剑突下1cm，质韧，移动性浊音阴性，肠鸣音4～5次/分。双下肢可凹陷性水肿，无杵状指（趾）。 现病史:"患者自3年前开始，反复于活动中出现胸痛，每次胸痛部位不固定，与呼吸无关，多于蹲起或坐起时出现，有时略感胸闷，但很快缓解，无咯血及晕厥，无咳嗽、咳痰，自述曾多次在当地医院就诊，行24小时动态心电图及心肌标志物等检查，排除了冠心病，行CTPA及双下肢CTV检查排除了肺栓塞（具体不详），但未能明确胸痛原因。1年前开始出现活动后气短，劳动耐量逐渐下降。2周前于活动时再次突发胸痛，气短症状加重，伴双下肢水肿，偶有干咳，无发热、咳痰及咯血，为明确诊治来院就诊。病来近10天腹胀、食欲缺乏，睡眠欠佳，少尿。"    weight=    assistCheck="血气分析：pH 7.49，PO2 46mmHg，PCO2 28mmHg，实际碳酸氢盐18mmol/L，标准碳酸氢盐20mmol/L，动脉血氧饱和度74%。血常规：WBC 8.1×109/L；N 60%；血浆D-二聚体0.45mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原3.82g/L，凝血酶原时间13秒（正常人16秒）。血尿素氮12mmol/L，血肌酐82μmol/L。血K+ 3.8mmol/L，Na+ 136mmol/L，Cl- 97mmol/L。 CTPA：近端肺动脉增粗，远端肺纹理稀疏，未见栓子。双下肢CTV未见血栓形成。肺通气灌注扫描：双肺多发按肺段分布的充盈缺损，与通气扫描不匹配。超声心动图示右心系统增大，三尖瓣中度反流，肺动脉压力86mmHg。心电图示Ⅱ、Ⅲ、aVF肺性P波，有SⅠQⅢTⅢ征，电轴右偏。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸性碱中毒

心脏科经典病历76行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=76    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=190    lowBldPress=110    personalHistory=    previousHistory=高血压病史40余年，最高血压200/140mmHg，服用利尿药、钙拮抗剂、α受体阻断药、ACEI类等多种降压药物，但血压控制不理想。否认冠心病及糖尿病病史。
    ...    symptom=反复睡眠时打鼾伴呼吸暂停50年，活动后气短3年，间断双下肢水肿1年，加重1周。#####体重超重，神志清楚，呼吸急促，口唇及四肢末梢发绀，颈粗短，颈静脉怒张；胸廓正常，双肺呼吸音粗糙，未闻及明显干、湿啰 音；心率104次/分，律齐，未闻及病理性杂音；腹膨隆，无压痛，肝肋下约2cm，质韧，移动性浊音阴性；周身水肿，以双下肢为重。 现病史:患者自50年前开始于睡眠时打鼾，严重时伴呼吸暂停，每次可持续20秒～2分钟，睡眠质量差，白天常嗜睡，无咳嗽、咳痰，未予诊治。随着体重的增加，上述症状越来越严重。自3年前开始出现活动后气短，近1年间断双下肢水肿，自服利尿药可缓解。1周前因劳累导致气短、水肿症状加重，无发热、咳嗽、咳痰，无胸痛、咯血，再次服用利尿药无缓解，为明确诊治来院住院治疗。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.36，PO2 47mmHg，PCO2 67mmHg，动脉血氧饱和度78%。血常规：RBC 8.6×109/L；N 67%；血浆D-二聚体0.24mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原4.52g/L，凝血酶原时间11秒（正常人16秒）。血尿素氮20mmol/L，血肌酐80μmol/L，血浆白蛋白38g/L，球蛋白26g/L。血K+ 3.8mmol/L，Na+ 140mmol/L，Cl- 99mmol/L。 肺CT：肺窗未见明显异常，纵隔窗示肺动脉干增宽，未见肿大淋巴结。 超声心动图示右心房、右心室略扩大，左心室肥厚，EF为60%，三尖瓣反流（中度），肺动脉压力为56mmHg。 心电图示电轴右偏，肺型P波。 病情缓解期的肺功能：FEV1/FVC为80%，FEV1占预计值百分比为86%。 多导睡眠监测结果：睡眠呼吸暂停低通气指数35，以阻塞性为主，夜间最低血氧饱和度为75%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    阻塞性睡眠呼吸暂停综合征

心脏科经典病历76行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=76    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=190    lowBldPress=110    personalHistory=    previousHistory=高血压病史40余年，最高血压200/140mmHg，服用利尿药、钙拮抗剂、α受体阻断药、ACEI类等多种降压药物，但血压控制不理想。否认冠心病及糖尿病病史。
    ...    symptom=反复睡眠时打鼾伴呼吸暂停50年，活动后气短3年，间断双下肢水肿1年，加重1周。#####体重超重，神志清楚，呼吸急促，口唇及四肢末梢发绀，颈粗短，颈静脉怒张；胸廓正常，双肺呼吸音粗糙，未闻及明显干、湿啰 音；心率104次/分，律齐，未闻及病理性杂音；腹膨隆，无压痛，肝肋下约2cm，质韧，移动性浊音阴性；周身水肿，以双下肢为重。 现病史:患者自50年前开始于睡眠时打鼾，严重时伴呼吸暂停，每次可持续20秒～2分钟，睡眠质量差，白天常嗜睡，无咳嗽、咳痰，未予诊治。随着体重的增加，上述症状越来越严重。自3年前开始出现活动后气短，近1年间断双下肢水肿，自服利尿药可缓解。1周前因劳累导致气短、水肿症状加重，无发热、咳嗽、咳痰，无胸痛、咯血，再次服用利尿药无缓解，为明确诊治来院住院治疗。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.36，PO2 47mmHg，PCO2 67mmHg，动脉血氧饱和度78%。血常规：RBC 8.6×109/L；N 67%；血浆D-二聚体0.24mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原4.52g/L，凝血酶原时间11秒（正常人16秒）。血尿素氮20mmol/L，血肌酐80μmol/L，血浆白蛋白38g/L，球蛋白26g/L。血K+ 3.8mmol/L，Na+ 140mmol/L，Cl- 99mmol/L。 肺CT：肺窗未见明显异常，纵隔窗示肺动脉干增宽，未见肿大淋巴结。 超声心动图示右心房、右心室略扩大，左心室肥厚，EF为60%，三尖瓣反流（中度），肺动脉压力为56mmHg。 心电图示电轴右偏，肺型P波。 病情缓解期的肺功能：FEV1/FVC为80%，FEV1占预计值百分比为86%。 多导睡眠监测结果：睡眠呼吸暂停低通气指数35，以阻塞性为主，夜间最低血氧饱和度为75%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

心脏科经典病历76行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=76    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=190    lowBldPress=110    personalHistory=    previousHistory=高血压病史40余年，最高血压200/140mmHg，服用利尿药、钙拮抗剂、α受体阻断药、ACEI类等多种降压药物，但血压控制不理想。否认冠心病及糖尿病病史。
    ...    symptom=反复睡眠时打鼾伴呼吸暂停50年，活动后气短3年，间断双下肢水肿1年，加重1周。#####体重超重，神志清楚，呼吸急促，口唇及四肢末梢发绀，颈粗短，颈静脉怒张；胸廓正常，双肺呼吸音粗糙，未闻及明显干、湿啰 音；心率104次/分，律齐，未闻及病理性杂音；腹膨隆，无压痛，肝肋下约2cm，质韧，移动性浊音阴性；周身水肿，以双下肢为重。 现病史:患者自50年前开始于睡眠时打鼾，严重时伴呼吸暂停，每次可持续20秒～2分钟，睡眠质量差，白天常嗜睡，无咳嗽、咳痰，未予诊治。随着体重的增加，上述症状越来越严重。自3年前开始出现活动后气短，近1年间断双下肢水肿，自服利尿药可缓解。1周前因劳累导致气短、水肿症状加重，无发热、咳嗽、咳痰，无胸痛、咯血，再次服用利尿药无缓解，为明确诊治来院住院治疗。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.36，PO2 47mmHg，PCO2 67mmHg，动脉血氧饱和度78%。血常规：RBC 8.6×109/L；N 67%；血浆D-二聚体0.24mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原4.52g/L，凝血酶原时间11秒（正常人16秒）。血尿素氮20mmol/L，血肌酐80μmol/L，血浆白蛋白38g/L，球蛋白26g/L。血K+ 3.8mmol/L，Na+ 140mmol/L，Cl- 99mmol/L。 肺CT：肺窗未见明显异常，纵隔窗示肺动脉干增宽，未见肿大淋巴结。 超声心动图示右心房、右心室略扩大，左心室肥厚，EF为60%，三尖瓣反流（中度），肺动脉压力为56mmHg。 心电图示电轴右偏，肺型P波。 病情缓解期的肺功能：FEV1/FVC为80%，FEV1占预计值百分比为86%。 多导睡眠监测结果：睡眠呼吸暂停低通气指数35，以阻塞性为主，夜间最低血氧饱和度为75%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    右心衰竭

心脏科经典病历76行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=76    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=190    lowBldPress=110    personalHistory=    previousHistory=高血压病史40余年，最高血压200/140mmHg，服用利尿药、钙拮抗剂、α受体阻断药、ACEI类等多种降压药物，但血压控制不理想。否认冠心病及糖尿病病史。
    ...    symptom=反复睡眠时打鼾伴呼吸暂停50年，活动后气短3年，间断双下肢水肿1年，加重1周。#####体重超重，神志清楚，呼吸急促，口唇及四肢末梢发绀，颈粗短，颈静脉怒张；胸廓正常，双肺呼吸音粗糙，未闻及明显干、湿啰 音；心率104次/分，律齐，未闻及病理性杂音；腹膨隆，无压痛，肝肋下约2cm，质韧，移动性浊音阴性；周身水肿，以双下肢为重。 现病史:患者自50年前开始于睡眠时打鼾，严重时伴呼吸暂停，每次可持续20秒～2分钟，睡眠质量差，白天常嗜睡，无咳嗽、咳痰，未予诊治。随着体重的增加，上述症状越来越严重。自3年前开始出现活动后气短，近1年间断双下肢水肿，自服利尿药可缓解。1周前因劳累导致气短、水肿症状加重，无发热、咳嗽、咳痰，无胸痛、咯血，再次服用利尿药无缓解，为明确诊治来院住院治疗。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.36，PO2 47mmHg，PCO2 67mmHg，动脉血氧饱和度78%。血常规：RBC 8.6×109/L；N 67%；血浆D-二聚体0.24mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原4.52g/L，凝血酶原时间11秒（正常人16秒）。血尿素氮20mmol/L，血肌酐80μmol/L，血浆白蛋白38g/L，球蛋白26g/L。血K+ 3.8mmol/L，Na+ 140mmol/L，Cl- 99mmol/L。 肺CT：肺窗未见明显异常，纵隔窗示肺动脉干增宽，未见肿大淋巴结。 超声心动图示右心房、右心室略扩大，左心室肥厚，EF为60%，三尖瓣反流（中度），肺动脉压力为56mmHg。 心电图示电轴右偏，肺型P波。 病情缓解期的肺功能：FEV1/FVC为80%，FEV1占预计值百分比为86%。 多导睡眠监测结果：睡眠呼吸暂停低通气指数35，以阻塞性为主，夜间最低血氧饱和度为75%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

心脏科经典病历76行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=76    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=104    highBldPress=190    lowBldPress=110    personalHistory=    previousHistory=高血压病史40余年，最高血压200/140mmHg，服用利尿药、钙拮抗剂、α受体阻断药、ACEI类等多种降压药物，但血压控制不理想。否认冠心病及糖尿病病史。
    ...    symptom=反复睡眠时打鼾伴呼吸暂停50年，活动后气短3年，间断双下肢水肿1年，加重1周。#####体重超重，神志清楚，呼吸急促，口唇及四肢末梢发绀，颈粗短，颈静脉怒张；胸廓正常，双肺呼吸音粗糙，未闻及明显干、湿啰 音；心率104次/分，律齐，未闻及病理性杂音；腹膨隆，无压痛，肝肋下约2cm，质韧，移动性浊音阴性；周身水肿，以双下肢为重。 现病史:患者自50年前开始于睡眠时打鼾，严重时伴呼吸暂停，每次可持续20秒～2分钟，睡眠质量差，白天常嗜睡，无咳嗽、咳痰，未予诊治。随着体重的增加，上述症状越来越严重。自3年前开始出现活动后气短，近1年间断双下肢水肿，自服利尿药可缓解。1周前因劳累导致气短、水肿症状加重，无发热、咳嗽、咳痰，无胸痛、咯血，再次服用利尿药无缓解，为明确诊治来院住院治疗。患者自发病以来，神志清，饮食睡眠差，少尿，大便未见异常。    weight=    assistCheck="血气分析：鼻导管吸氧（2L/min）时pH 7.36，PO2 47mmHg，PCO2 67mmHg，动脉血氧饱和度78%。血常规：RBC 8.6×109/L；N 67%；血浆D-二聚体0.24mg/L（正常值＜0.3mg/L）。血浆纤维蛋白原4.52g/L，凝血酶原时间11秒（正常人16秒）。血尿素氮20mmol/L，血肌酐80μmol/L，血浆白蛋白38g/L，球蛋白26g/L。血K+ 3.8mmol/L，Na+ 140mmol/L，Cl- 99mmol/L。 肺CT：肺窗未见明显异常，纵隔窗示肺动脉干增宽，未见肿大淋巴结。 超声心动图示右心房、右心室略扩大，左心室肥厚，EF为60%，三尖瓣反流（中度），肺动脉压力为56mmHg。 心电图示电轴右偏，肺型P波。 病情缓解期的肺功能：FEV1/FVC为80%，FEV1占预计值百分比为86%。 多导睡眠监测结果：睡眠呼吸暂停低通气指数35，以阻塞性为主，夜间最低血氧饱和度为75%。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历77行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=22    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=0    heartRate=84    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=既往身体健康
    ...    symptom=心悸感1天##### 现病史:心悸感1天，1天前因饮酒后而失眠。    weight=    assistCheck=心电图示窦性心律，频发房性期前收缩（16～24次／分），    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    房性早搏

心脏科经典病历78行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=154    highBldPress=160    lowBldPress=100    personalHistory=    previousHistory=高血压病史15年，高血压性心脏病史5年，最高血压达210／140mmHg，长期服用降压药物。有房性期前收缩史3个月。
    ...    symptom=突感心悸、胸闷2小时#####心界稍大，心率154次／分，未闻及心脏杂音 现病史:    weight=    assistCheck=心电图示心房扑动，呈2∶1房室传导。经食道心脏超声检查，若未发现心房内血栓；超声心动图和彩色多普勒超声见室间隔和左室侧壁均为14mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

心脏科经典病历78行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=154    highBldPress=160    lowBldPress=100    personalHistory=    previousHistory=高血压病史15年，高血压性心脏病史5年，最高血压达210／140mmHg，长期服用降压药物。有房性期前收缩史3个月。
    ...    symptom=突感心悸、胸闷2小时#####心界稍大，心率154次／分，未闻及心脏杂音 现病史:    weight=    assistCheck=心电图示心房扑动，呈2∶1房室传导。经食道心脏超声检查，若未发现心房内血栓；超声心动图和彩色多普勒超声见室间隔和左室侧壁均为14mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压性心脏病

心脏科经典病历78行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=68    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=1    heartRate=154    highBldPress=160    lowBldPress=100    personalHistory=    previousHistory=高血压病史15年，高血压性心脏病史5年，最高血压达210／140mmHg，长期服用降压药物。有房性期前收缩史3个月。
    ...    symptom=突感心悸、胸闷2小时#####心界稍大，心率154次／分，未闻及心脏杂音 现病史:    weight=    assistCheck=心电图示心房扑动，呈2∶1房室传导。经食道心脏超声检查，若未发现心房内血栓；超声心动图和彩色多普勒超声见室间隔和左室侧壁均为14mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心房扑动

心脏科经典病历79行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=风湿性心脏病史30余年，近2个月来感到心悸、胸闷、乏力#####，双肺闻及小水泡音。呼吸14次／分。心界不大，心率110次／分，律规整，心尖区闻及3／6级收缩期杂音及舒张期隆隆样杂音。 现病史:    weight=    assistCheck=心电图示窦性心动过速，X线示双肺轻度淤血、超声心动图和彩色多普勒超声显二尖瓣狭窄瓣口1.0cm2，二尖瓣关闭不全，中度反流，左房内径45mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    风湿性心脏病

心脏科经典病历79行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=风湿性心脏病史30余年，近2个月来感到心悸、胸闷、乏力#####，双肺闻及小水泡音。呼吸14次／分。心界不大，心率110次／分，律规整，心尖区闻及3／6级收缩期杂音及舒张期隆隆样杂音。 现病史:    weight=    assistCheck=心电图示窦性心动过速，X线示双肺轻度淤血、超声心动图和彩色多普勒超声显二尖瓣狭窄瓣口1.0cm2，二尖瓣关闭不全，中度反流，左房内径45mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    二尖瓣狭窄

心脏科经典病历79行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=风湿性心脏病史30余年，近2个月来感到心悸、胸闷、乏力#####，双肺闻及小水泡音。呼吸14次／分。心界不大，心率110次／分，律规整，心尖区闻及3／6级收缩期杂音及舒张期隆隆样杂音。 现病史:    weight=    assistCheck=心电图示窦性心动过速，X线示双肺轻度淤血、超声心动图和彩色多普勒超声显二尖瓣狭窄瓣口1.0cm2，二尖瓣关闭不全，中度反流，左房内径45mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能Ⅱ级

心脏科经典病历79行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=风湿性心脏病史30余年，近2个月来感到心悸、胸闷、乏力#####，双肺闻及小水泡音。呼吸14次／分。心界不大，心率110次／分，律规整，心尖区闻及3／6级收缩期杂音及舒张期隆隆样杂音。 现病史:    weight=    assistCheck=心电图示窦性心动过速，X线示双肺轻度淤血、超声心动图和彩色多普勒超声显二尖瓣狭窄瓣口1.0cm2，二尖瓣关闭不全，中度反流，左房内径45mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    二尖瓣关闭不全

心脏科经典病历79行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=
    ...    symptom=风湿性心脏病史30余年，近2个月来感到心悸、胸闷、乏力#####，双肺闻及小水泡音。呼吸14次／分。心界不大，心率110次／分，律规整，心尖区闻及3／6级收缩期杂音及舒张期隆隆样杂音。 现病史:    weight=    assistCheck=心电图示窦性心动过速，X线示双肺轻度淤血、超声心动图和彩色多普勒超声显二尖瓣狭窄瓣口1.0cm2，二尖瓣关闭不全，中度反流，左房内径45mm。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心动过速

心脏科经典病历80行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无高血压病史
    ...    gender=1    heartRate=70    highBldPress=160    lowBldPress=110    personalHistory=    previousHistory=病史中无明显多尿及外周麻痹病史
    ...    symptom=因血压升高1年半，经多次治疗效果较差入院，无浮肿、血尿、泡沫尿，无阵发性心悸，无体重减轻。#####BP160／110mmHg，血压对称，无水牛背、满月脸表现。 现病史:入院后行盐水负荷试验，醛固酮水平仍为16ng／dl。采用皮质醇浓度进行校正后，右肾上腺静脉与外周静脉醛固酮比值为0.8，而左肾上腺静脉与外周血醛固酮比为3.0，呈高分泌状态，提示左肾上腺腺瘤。    weight=    assistCheck=心电图及心脏超声提示轻度心脏肥厚。动态血压监测：平均血压145／104mmHg，夜间血压下降8%。肾上腺CT示左肾上腺增粗。血肌酐90mmol／L，UA（尿素氮）：340mmol／L，血钾3.1～4.0mmol／L，血钠137～141mmol／L，CO2结合力25mmol／L。24小时尿钾40mmol／L（尿量2400ml）。血浆醛固酮（ALD）21ng／dl，血浆肾素活性（PRA）0.22ng／（ml·h）（直立位），血浆醛固酮／血浆肾素活性比值ARR接近100。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    继发性高血压

心脏科经典病历80行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无高血压病史
    ...    gender=1    heartRate=70    highBldPress=160    lowBldPress=110    personalHistory=    previousHistory=病史中无明显多尿及外周麻痹病史
    ...    symptom=因血压升高1年半，经多次治疗效果较差入院，无浮肿、血尿、泡沫尿，无阵发性心悸，无体重减轻。#####BP160／110mmHg，血压对称，无水牛背、满月脸表现。 现病史:入院后行盐水负荷试验，醛固酮水平仍为16ng／dl。采用皮质醇浓度进行校正后，右肾上腺静脉与外周静脉醛固酮比值为0.8，而左肾上腺静脉与外周血醛固酮比为3.0，呈高分泌状态，提示左肾上腺腺瘤。    weight=    assistCheck=心电图及心脏超声提示轻度心脏肥厚。动态血压监测：平均血压145／104mmHg，夜间血压下降8%。肾上腺CT示左肾上腺增粗。血肌酐90mmol／L，UA（尿素氮）：340mmol／L，血钾3.1～4.0mmol／L，血钠137～141mmol／L，CO2结合力25mmol／L。24小时尿钾40mmol／L（尿量2400ml）。血浆醛固酮（ALD）21ng／dl，血浆肾素活性（PRA）0.22ng／（ml·h）（直立位），血浆醛固酮／血浆肾素活性比值ARR接近100。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    原发性醛固酮过多症

心脏科经典病历81行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=240    lowBldPress=120    personalHistory=    previousHistory=
    ...    symptom=因剧烈腹痛、头痛、大汗、呕吐1天入院#####心尖区可及3／6级收缩期杂音，呼吸急促，无明显啰音。腹肌略紧张，有压痛，肝脾未及 现病史:    weight=    assistCheck=WBC15.2G／L，心电图窦性心动过速，左室左房扩大。血浆儿茶酚胺CA18nmol／l、肾上腺素E5.4nmol／l、去甲肾上腺素NE12.6nmol／l。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    嗜铬细胞瘤

心脏科经典病历82行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=180    lowBldPress=110    personalHistory=    previousHistory=前侧壁心肌梗死病史2年、糖尿病病史10年、高血压病史8年
    ...    symptom=因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院#####律齐，心尖区可及Ⅱ／6收缩期杂音，呼吸急促，双肺底可及细湿啰音，肝脏无明显肿大，下肢不肿。 现病史:因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院，患者2年前发生前侧壁心肌梗死，保守治疗后好转，梗死后无明显胸闷胸痛症状，近1周来，因发生劳力性呼吸困难伴夜间不能平卧入院。，现糖尿病病史，血糖控制满意；有高血压病史8年，平时服用络活喜5mg／d、科素亚50mg／d治疗，血压可控制在130／85mmHg左右。    weight=    assistCheck=心电图提示陈旧性前侧壁心肌梗死。心脏超声LV5.7cm，LA4.0cm，室间隔1.0cm，室壁运动无明显异常，二尖瓣中度反流，EF50%。生化检查血肌酐260umol／L，尿蛋白（＋），血钾5.5mmol／L，空腹血糖6.0mmol／L，餐后2h血糖8.2mmol／L，HbA1c6.4    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    冠状动脉粥样硬化性心脏病

心脏科经典病历82行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=180    lowBldPress=110    personalHistory=    previousHistory=前侧壁心肌梗死病史2年、糖尿病病史10年、高血压病史8年
    ...    symptom=因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院#####律齐，心尖区可及Ⅱ／6收缩期杂音，呼吸急促，双肺底可及细湿啰音，肝脏无明显肿大，下肢不肿。 现病史:因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院，患者2年前发生前侧壁心肌梗死，保守治疗后好转，梗死后无明显胸闷胸痛症状，近1周来，因发生劳力性呼吸困难伴夜间不能平卧入院。，现糖尿病病史，血糖控制满意；有高血压病史8年，平时服用络活喜5mg／d、科素亚50mg／d治疗，血压可控制在130／85mmHg左右。    weight=    assistCheck=心电图提示陈旧性前侧壁心肌梗死。心脏超声LV5.7cm，LA4.0cm，室间隔1.0cm，室壁运动无明显异常，二尖瓣中度反流，EF50%。生化检查血肌酐260umol／L，尿蛋白（＋），血钾5.5mmol／L，空腹血糖6.0mmol／L，餐后2h血糖8.2mmol／L，HbA1c6.4    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    陈旧性心肌梗死

心脏科经典病历82行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=180    lowBldPress=110    personalHistory=    previousHistory=前侧壁心肌梗死病史2年、糖尿病病史10年、高血压病史8年
    ...    symptom=因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院#####律齐，心尖区可及Ⅱ／6收缩期杂音，呼吸急促，双肺底可及细湿啰音，肝脏无明显肿大，下肢不肿。 现病史:因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院，患者2年前发生前侧壁心肌梗死，保守治疗后好转，梗死后无明显胸闷胸痛症状，近1周来，因发生劳力性呼吸困难伴夜间不能平卧入院。，现糖尿病病史，血糖控制满意；有高血压病史8年，平时服用络活喜5mg／d、科素亚50mg／d治疗，血压可控制在130／85mmHg左右。    weight=    assistCheck=心电图提示陈旧性前侧壁心肌梗死。心脏超声LV5.7cm，LA4.0cm，室间隔1.0cm，室壁运动无明显异常，二尖瓣中度反流，EF50%。生化检查血肌酐260umol／L，尿蛋白（＋），血钾5.5mmol／L，空腹血糖6.0mmol／L，餐后2h血糖8.2mmol／L，HbA1c6.4    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

心脏科经典病历82行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=180    lowBldPress=110    personalHistory=    previousHistory=前侧壁心肌梗死病史2年、糖尿病病史10年、高血压病史8年
    ...    symptom=因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院#####律齐，心尖区可及Ⅱ／6收缩期杂音，呼吸急促，双肺底可及细湿啰音，肝脏无明显肿大，下肢不肿。 现病史:因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院，患者2年前发生前侧壁心肌梗死，保守治疗后好转，梗死后无明显胸闷胸痛症状，近1周来，因发生劳力性呼吸困难伴夜间不能平卧入院。，现糖尿病病史，血糖控制满意；有高血压病史8年，平时服用络活喜5mg／d、科素亚50mg／d治疗，血压可控制在130／85mmHg左右。    weight=    assistCheck=心电图提示陈旧性前侧壁心肌梗死。心脏超声LV5.7cm，LA4.0cm，室间隔1.0cm，室壁运动无明显异常，二尖瓣中度反流，EF50%。生化检查血肌酐260umol／L，尿蛋白（＋），血钾5.5mmol／L，空腹血糖6.0mmol／L，餐后2h血糖8.2mmol／L，HbA1c6.4    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    二尖瓣关闭不全

心脏科经典病历82行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=180    lowBldPress=110    personalHistory=    previousHistory=前侧壁心肌梗死病史2年、糖尿病病史10年、高血压病史8年
    ...    symptom=因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院#####律齐，心尖区可及Ⅱ／6收缩期杂音，呼吸急促，双肺底可及细湿啰音，肝脏无明显肿大，下肢不肿。 现病史:因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院，患者2年前发生前侧壁心肌梗死，保守治疗后好转，梗死后无明显胸闷胸痛症状，近1周来，因发生劳力性呼吸困难伴夜间不能平卧入院。，现糖尿病病史，血糖控制满意；有高血压病史8年，平时服用络活喜5mg／d、科素亚50mg／d治疗，血压可控制在130／85mmHg左右。    weight=    assistCheck=心电图提示陈旧性前侧壁心肌梗死。心脏超声LV5.7cm，LA4.0cm，室间隔1.0cm，室壁运动无明显异常，二尖瓣中度反流，EF50%。生化检查血肌酐260umol／L，尿蛋白（＋），血钾5.5mmol／L，空腹血糖6.0mmol／L，餐后2h血糖8.2mmol／L，HbA1c6.4    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    高血压

心脏科经典病历82行-6
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=85    highBldPress=180    lowBldPress=110    personalHistory=    previousHistory=前侧壁心肌梗死病史2年、糖尿病病史10年、高血压病史8年
    ...    symptom=因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院#####律齐，心尖区可及Ⅱ／6收缩期杂音，呼吸急促，双肺底可及细湿啰音，肝脏无明显肿大，下肢不肿。 现病史:因冠心病、陈旧性前侧壁心肌梗死、心力衰竭入院，患者2年前发生前侧壁心肌梗死，保守治疗后好转，梗死后无明显胸闷胸痛症状，近1周来，因发生劳力性呼吸困难伴夜间不能平卧入院。，现糖尿病病史，血糖控制满意；有高血压病史8年，平时服用络活喜5mg／d、科素亚50mg／d治疗，血压可控制在130／85mmHg左右。    weight=    assistCheck=心电图提示陈旧性前侧壁心肌梗死。心脏超声LV5.7cm，LA4.0cm，室间隔1.0cm，室壁运动无明显异常，二尖瓣中度反流，EF50%。生化检查血肌酐260umol／L，尿蛋白（＋），血钾5.5mmol／L，空腹血糖6.0mmol／L，餐后2h血糖8.2mmol／L，HbA1c6.4    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    糖尿病

心脏科经典病历83行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=54    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往6年高血压病史，否认糖尿病史，5年前因“急性心肌梗死”于前降支置入BMS1个。2年前因再次心肌梗死于右冠脉置入2个DES，回旋支置入1个DES
    ...    symptom=因持续胸痛12小时来诊##### 现病史:    weight=    assistCheck=，心电图示Ⅱ、Ⅲ、avF导联ST段轻微向上抬高（图78‐3），血cTnI18.19ng／ml，远高于正常高值0.05ng／ml。冠脉造影示：左前降支近段原支架可见内膜增生，未见严重狭窄（图78‐4），回旋支原支架内膜增生（图78‐5），右冠脉原支架近段急性闭塞（图78‐6），应用抽吸导管抽吸血栓，并于右冠脉近段原支架内和右冠脉远段再次置入DES Partner3.0x36mm共2个，结果满意    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性心肌梗死

心脏科经典病历84行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=61    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往高血压病2年，否认糖尿病史。2年前因“急性前壁心肌梗死”在前降支串联置入2个Cypher支架，坚持服用“双联”抗血小板治疗1年，但1年后仅服阿司匹林50mg。
    ...    symptom=胸痛8小时##### 现病史:    weight=    assistCheck=，心电图示V1‐6导联ST段弓背向上抬高（图78‐14），诊断“急性前壁再次梗死”。行急诊冠脉造影示：右冠脉大致正常，回旋支远段75%狭窄，前降支原两支架间急性血栓性闭塞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性心肌梗死

心脏科经典病历85行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=1    heartRate=160    highBldPress=110    lowBldPress=90    personalHistory=    previousHistory=3年前外伤致“锁骨骨折”行“内固定术”。
    ...    symptom=因“反复恶心、呕吐伴喘憋3小时”急诊入院。#####呼吸困难，不能平卧，烦躁，血压110/ 90mmHg。双肺满布湿啰音。给予急诊胸部CT检查示:锁骨内固定钢钉远端游离、大量心包积液(图1-2)。急诊心包穿刺放出血性液。心外科急诊开胸探查:升主动脉外侧近弓部范围20mm×20mm外膜溃疡，累及中层及内膜，周围组织水肿，局部无脓性分泌物。右锁骨固定针向下探伸，尖端触及升主动脉溃疡处。 现病史:患者于3小时前在家中睡眠时突感憋气后醒转，感胸闷，伴恶心、呕吐多次，每次均为少量胃内容物及少量咖啡色物，无腹痛，与进食、体位无关。伴大便失禁，为黄色稀便，无腹胀、便秘，无吞咽困难、吞咽疼痛。无黑便，无食欲减退、厌油腻，无皮肤色黄。急至当地医院就诊，测血压测不到，予以静滴“生理盐水250ml+多巴胺200mg”后送来医院，来院途中呕吐少量咖啡色液。来院急诊科时测血压70/55mmHg。患者自发病以来精神状态较差，未进饮食，大便失禁，为黄色稀便，体力情况差。入院2小时后患者病情加重，患者心率160次/分，呼吸困难，不能平卧，烦躁，血压110/ 90mmHg。双肺满布湿啰音。    weight=    assistCheck=心电图：窦性心动过速、ST段改变。动脉血气分析：pH 7. 296，PCO236. 7mmHg，PO253. 7mmHg，SO283. 9%。心肌梗死三项:肌酸激酶同工酶6. 98ng/ml，肌红蛋白173. 1μg/L。血常规：白细胞16. 15×109/L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性心脏压塞

心脏科经典病历86行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=#####发绀，大汗，端坐呼吸。颈静脉怒张，心界扩大，第一心音减低和心动过速，心尖区可闻及Ⅲ～Ⅳ级收缩期杂音及舒张期奔马律，双肺布满中小水泡音及哮鸣音，肝肿大，肝颈静脉返流征阳性，双下肢轻度水肿 现病史:半年前于“感冒”后出现逐渐加重的胸闷、心悸、气急‘近一个月经常出现夜间阵发性呼吸困难，昨晚大便后又出现呼吸困难并加重，不能平卧，咳嗽，咳泡沫样痰及粉红色血色痰而就诊入院    weight=    assistCheck=心电图：窦性心动过速伴不同程度的ST-T缺血性改变，同时伴有频发室性早搏。X线：普大型新脏，心胸比率0.66。心脏多普勒检查示：心腔扩大，左室扩大明显，心脏搏动明显减弱。心脏输出量：29%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    扩张型心肌病

心脏科经典病历86行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=130    highBldPress=120    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=#####发绀，大汗，端坐呼吸。颈静脉怒张，心界扩大，第一心音减低和心动过速，心尖区可闻及Ⅲ～Ⅳ级收缩期杂音及舒张期奔马律，双肺布满中小水泡音及哮鸣音，肝肿大，肝颈静脉返流征阳性，双下肢轻度水肿 现病史:半年前于“感冒”后出现逐渐加重的胸闷、心悸、气急‘近一个月经常出现夜间阵发性呼吸困难，昨晚大便后又出现呼吸困难并加重，不能平卧，咳嗽，咳泡沫样痰及粉红色血色痰而就诊入院    weight=    assistCheck=心电图：窦性心动过速伴不同程度的ST-T缺血性改变，同时伴有频发室性早搏。X线：普大型新脏，心胸比率0.66。心脏多普勒检查示：心腔扩大，左室扩大明显，心脏搏动明显减弱。心脏输出量：29%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    左心衰竭

心脏科经典病历87行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=88    highBldPress=95    lowBldPress=65    personalHistory=    previousHistory=高血压3级10年，近1年血压正常。陈旧性脑出血病史10年。高脂血症2年。2型糖尿病2年。
    ...    symptom=间断喘憋1月余#####半卧位，颈静脉充盈。双下肺可闻及少许湿性啰音。心界左下扩大，心律不齐，可闻及早搏，心音低钝，二尖瓣听诊区可闻及3/6级收缩期吹风样杂音，主动脉听诊区可闻及3/6级收缩期粗糙喷射样杂音，向右侧锁骨下传导。 现病史:患者1月前因情绪波动后开始出现慢走100米或上二楼后出现喘憋、胸闷、气急，呼吸困难，每天出现1-2次，每次经休息10分钟逐渐缓解，夜间不能平卧；伴夜间阵发性呼吸困难；伴咳嗽、咳白色粘痰；伴尿少、浮肿、纳差。1周前就诊于急诊，化验提示BNP：4151ug/ml，血钾：4.41mmol/l，肌酐：139.22umol/l。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

心脏科经典病历87行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=88    highBldPress=95    lowBldPress=65    personalHistory=    previousHistory=高血压3级10年，近1年血压正常。陈旧性脑出血病史10年。高脂血症2年。2型糖尿病2年。
    ...    symptom=间断喘憋1月余#####半卧位，颈静脉充盈。双下肺可闻及少许湿性啰音。心界左下扩大，心律不齐，可闻及早搏，心音低钝，二尖瓣听诊区可闻及3/6级收缩期吹风样杂音，主动脉听诊区可闻及3/6级收缩期粗糙喷射样杂音，向右侧锁骨下传导。 现病史:患者1月前因情绪波动后开始出现慢走100米或上二楼后出现喘憋、胸闷、气急，呼吸困难，每天出现1-2次，每次经休息10分钟逐渐缓解，夜间不能平卧；伴夜间阵发性呼吸困难；伴咳嗽、咳白色粘痰；伴尿少、浮肿、纳差。1周前就诊于急诊，化验提示BNP：4151ug/ml，血钾：4.41mmol/l，肌酐：139.22umol/l。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

心脏科经典病历88行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=66    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=155    highBldPress=195    lowBldPress=135    personalHistory=    previousHistory=高血压3级10年，近1年血压正常。陈旧性脑出血病史10年。高脂血症2年。2型糖尿病2年。
    ...    symptom=患者“冠心病，不稳定型心绞痛”入院治疗过程中，突然出现喘憋、呼吸困难，不能平卧、大汗、咳嗽、咳粉红色泡沫痰。#####颈静脉怒张、满肺干湿性啰音 现病史:    weight=    assistCheck=指端血氧83%。双肺纹理增重，模糊。右下肺野斑片状淡薄阴影，炎症可能，心影增大    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    左心衰竭

心脏科经典病历89行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=81    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=85    highBldPress=154    lowBldPress=93    personalHistory=    previousHistory=冠心病、高血压、糖尿病、脑梗死、肺栓塞、下肢深静脉血栓形成
    ...    symptom=胸闷憋气5天#####双肺呼吸音粗，可闻及干湿性啰音，双下肢水肿。 现病史:于5天前无明显诱因出现胸闷、憋气、伴乏力，咳嗽，咳痰困难，伴双手、双下肢水肿，自行吸氧未好转，2天前憋气加重，不能平卧，收入院。    weight=    assistCheck=D-二聚体：2600ng/ml，肌红蛋白：347ng/ml，B型脑利尿钠肽3030pg/ml，尿素氮12.10mmol/l，肌酐：144.96umol/l。胸部CT:右肺多条片影，双侧少量胸腔积液可能性大，心影增大。超声心动图：心梗后改变，左室舒张与收缩功能减低，肺动脉高压。下肢B超：右侧股浅动脉闭塞，左下肢皮下水肿。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

心脏科经典病历90行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=1    ageType=天    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=患儿出生后，出现面色苍白，呼吸急促，全身皮肤发灰，泵入前列地尔半小时，患儿呼吸困难缓解。#####血压正常，上下肢血压基本一致。肝肋下2cm，足跟毛细血管再充盈7s，四肢血压正常。 现病史:患儿出生后，反复多次出现面色苍白，呼吸急促，全身皮肤发灰，一过性口周及四肢末梢青紫，经泵入前列地尔半小时，呼吸困难可缓解。家长放弃治疗出院，患儿于出院11h后死亡。    weight=    assistCheck=出生后第一天心脏超声：血管环；轻度主动脉缩窄；动脉导管未闭；房间隔缺损。胸部X片：两肺血稍多，心胸比0.7,；血气分析：PH：7.20；PO2：55.5mmHg,SaO2：88%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    主动脉缩窄

心脏科经典病历90行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=1    ageType=天    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=患儿出生后，出现面色苍白，呼吸急促，全身皮肤发灰，泵入前列地尔半小时，患儿呼吸困难缓解。#####血压正常，上下肢血压基本一致。肝肋下2cm，足跟毛细血管再充盈7s，四肢血压正常。 现病史:患儿出生后，反复多次出现面色苍白，呼吸急促，全身皮肤发灰，一过性口周及四肢末梢青紫，经泵入前列地尔半小时，呼吸困难可缓解。家长放弃治疗出院，患儿于出院11h后死亡。    weight=    assistCheck=出生后第一天心脏超声：血管环；轻度主动脉缩窄；动脉导管未闭；房间隔缺损。胸部X片：两肺血稍多，心胸比0.7,；血气分析：PH：7.20；PO2：55.5mmHg,SaO2：88%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    房间隔缺损

心脏科经典病历90行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=1    ageType=天    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=患儿出生后，出现面色苍白，呼吸急促，全身皮肤发灰，泵入前列地尔半小时，患儿呼吸困难缓解。#####血压正常，上下肢血压基本一致。肝肋下2cm，足跟毛细血管再充盈7s，四肢血压正常。 现病史:患儿出生后，反复多次出现面色苍白，呼吸急促，全身皮肤发灰，一过性口周及四肢末梢青紫，经泵入前列地尔半小时，呼吸困难可缓解。家长放弃治疗出院，患儿于出院11h后死亡。    weight=    assistCheck=出生后第一天心脏超声：血管环；轻度主动脉缩窄；动脉导管未闭；房间隔缺损。胸部X片：两肺血稍多，心胸比0.7,；血气分析：PH：7.20；PO2：55.5mmHg,SaO2：88%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    动脉导管未闭
    ################呼吸科经典病历################

呼吸科经典病历2行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=26    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=70    highBldPress=110    lowBldPress=60    personalHistory=    previousHistory=既往体健，否认慢性疾病史。否认遗传疾病史。
    ...    symptom=咽干、流涕、打喷嚏3天#####神志清楚，咽喉充血，双侧扁桃体未见肿大，浅表淋巴结未及肿大。HR70次/分，律齐 ，未闻及病理性杂音。两肺呼吸音清，未闻及干湿性啰音。腹部和脊柱、四肢检查无异常体征。 现病史:患者3天前外出淋雨后出现咽喉干痒、流清涕、打喷嚏及鼻塞，口服“新康泰克”1次后，症状稍好转，但出现轻度咳嗽、咳少许白色黏液痰，痰不易咳出，伴双耳闷胀感，遂到社区卫生服务中心就诊。患者无发热、胸痛、胸闷、呼吸困难等。发病以来，精神疲软，大小便正常，睡眠欠佳。    weight=    assistCheck=血常规：WBC 5.6×109/L，N 58.2%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性上呼吸道感染

呼吸科经典病历3行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=对青霉素过敏    bodyTempr=36.5    familyHistory=丈夫和一子健康，父母体健，外婆有“哮喘”病史
    ...    gender=0    heartRate=74    highBldPress=120    lowBldPress=80    personalHistory=无烟酒嗜好，未饲养宠物。    previousHistory=无肝炎、结核病病史，无糖尿病、高血压病史，有过敏性鼻炎病史。
    ...    symptom=间断性咳嗽3年余，加重1周#####神志清楚，一般状况可，双肺呼吸音清，未闻及干湿性啰音，HR74次/分，律齐，未闻及杂音，腹软，肝脾未及，生理发射存在，病理反射未引出。 现病史:患者3年前感冒后出现咳嗽，干咳为主，呈阵发性，无痰，稍感胸闷，此后一直间断咳嗽，季节交替时容易出现，闻到油烟味或冷空气刺激后加重，常于夜间发作，近一周无明显诱因咳嗽加重，无发热，饮食及二便正常    weight=    assistCheck=血常规：WBC 8.03×109/L，N 55.1%，E7%。T-IgE 520IU/ml。胸片：双肺纹理增多。心电图：窦性心律。FeNO（一氧化氮检测）：126 bbp，明显增高；肺功能检查提示肺通气及弥散功能正常，乙酰甲胆碱气道激发试验阳性；过敏原检测：粉尘螨（++++）、户尘螨（++++）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    哮喘

呼吸科经典病历4行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=79    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=妻及2子女健康，父母已故，兄弟姐妹健在
    ...    gender=1    heartRate=80    highBldPress=130    lowBldPress=82    personalHistory=吸烟1200年支，饮白酒40年，每天约500ml，已戒烟4年，戒酒5年    previousHistory=曾患左侧结核性胸膜炎，正规服用抗结核治疗1年，复查胸片已治愈。有左侧股骨头坏死病史，4年前出现胃溃疡出血，已治愈。无高血压、糖尿病病史。
    ...    symptom=咳嗽、咳痰20年，加重伴气促10天#####球结膜无水肿，口唇无发绀，颈静脉无怒张；两侧胸廓对称呈桶状，肋间隙增宽，两肺叩诊呈过清音，两肺呼吸音低，未闻及干湿性啰音；HR 80次/分，律齐，无杂音，腹软，无压痛、反跳痛。双下肢无水肿。 现病史:患者咳嗽、咳痰20年。10天前因受凉后出现咽痛、咳嗽、咳白色黏痰、气喘，活动后明显。3天前出现畏寒、发热，伴纳差、乏力。无双下肢水肿、夜间阵发性呼吸困难，能平卧。无意识障碍、大小便失禁等症状。自行服用头孢拉定、沐舒坦片等药物治疗未见明显好转。    weight=    assistCheck=血常规：WBC 18.72×109/L，N 89.6%，ESR 51mm/h，CRP205 mg/L。肝功能：ALB 33g/L，ALT 28IU/L。腹部B超：肝、胆、胰腺、脾脏、肾脏未见异常。心脏彩超示：心脏各房室大小正常；三尖瓣少量反流。肺功能：FEV1/FVC 55%，支气管舒张试验阴性。心电图：窦性心律，交界性早搏。胸部CT：慢性支气管炎、肺气肿伴肺大泡形成；两肺多发陈旧性灶伴左侧胸膜增厚、钙化。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性阻塞性肺疾病

呼吸科经典病历5行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=既往体健，否认高血压、糖尿病、肝炎等慢性病，否认药物及食物过敏史，否认疫区及禽类接触史，否认冶游史。
    ...    symptom=咳嗽、咳痰伴发热10天#####Ht173cm。气管居中，浅表淋巴结未及肿大，左下肺呼吸音减弱，可闻及湿啰音，语音震颤较右侧增强。 现病史:    weight=80    assistCheck=血常规：RBC 4.33×1012/L，Hb 140g/L，WBC 15.2×109/L，N 86%，PLT 277×109/L。胸片：左下肺炎症。3天后血常规：WBC 17.5×109/L，N 88%。肝肾功能及电解质均正常。ESR：70mm/h。CRP：65mg/L。D-二聚体：8.4μg/ml。血气分析：pH值7.40，PaCO280mmHg。肿瘤指标均正常。胸部CT示左下肺大片实变影。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺炎

呼吸科经典病历6行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=家族中其妹妹有类似疾病
    ...    gender=0    heartRate=120    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=既往有过敏性鼻炎病史，否认有心脏病史。
    ...    symptom=反复发作性喘息20年，加重5年，再发3天#####发育正常，喘息状，端坐位，神志清晰。口唇发绀，咽充血，颈静脉充盈。吸气时可见三凹征，气管居中，胸廓饱满，双肺叩诊呈过清音，听诊呼气时间延长，双肺满布哮鸣音，未闻及湿啰音。心率120次／分，律齐，心脏各瓣膜听诊区未闻及病理性杂音。腹软，肝脾未触及，双下肢无水肿 现病史:患者20年前无明显原因出现气喘，伴咳嗽，无咳痰，无心慌及心前区不适，经氨茶碱等平喘治疗后症状可完全缓解。此后每年发作1～3次，以春秋季节为主，发作间歇期一如常人。近5年来发作较前频繁，冬季亦有发作，多次因急性发作到医院就诊。3天前受凉后上述症状再次复发，自服氨茶碱、头孢氨苄等药物效果不佳。喘息加重，痰不易咳出，伴大汗淋漓。    weight=    assistCheck=血白细胞1.2×109／L。中性粒细胞80.2%，淋巴细胞16.6%，嗜酸粒细胞0.7%，单核细胞2.5%。肺功能检查示FEV 1为预计值的55%。血气分析示pH 7﹒34，PaO 2 8kPa，PaCO 2 6﹒7kPa。胸部X 线：双肺透亮度增加，膈肌低平，未见炎性浸润阴影。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    哮喘

呼吸科经典病历7行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=116    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=既往有吸烟史20 余年，已戒烟3年。无高血压、冠心病及结核病史。
    ...    symptom=反复咳嗽，咯痰30 余年，劳累性呼吸困难10年，反复双下肢水肿3年，近1周咳嗽加重，伴神志恍惚1天#####神志恍惚，烦躁不安，定向障碍，球结膜水肿，瞳孔等大，对光反射存在，口唇发绀，颈静脉充盈，气管居中，锁骨上淋巴结未扪及，桶状胸，心尖搏动在剑突下，扪诊双侧语颤减弱，叩诊为过清音，肝浊音界在锁中线7肋间，心率116次／分，律不齐，偶有早搏，肺动脉瓣区第二音亢进，三尖瓣区Ⅱ级收缩期杂音。双肺呼吸音减弱，可闻及散在干鸣音和中、细湿啰音。腹部稍膨隆，肝脏肋下2cm，质中，脾未扪及，腹软，无压痛，无移动性浊音，肠鸣音减弱。双下肢水肿（＋＋），腱反射减弱，锥体束征阳性，双手有扑翼样震颤。 现病史:30余年前患者开始出现受凉后咳嗽，咯白色粘液泡沫痰，每年冬季加重，严重时可持续数月，服用抗生素、止咳化痰药等症状可得到控制。10年前在发作间期患者在上楼或爬坡时也感到呼吸困难。3年前在咳嗽发作时出现双下肢浮肿，多次以慢性支气管炎、肺气肿和肺心病、心衰收住院治疗。入院前1周患者因受凉咳嗽加重，咳黄色粘液脓痰，心累，气促，双下肢浮肿，在当地医院静脉注射头孢类抗生素、氨茶碱，口服利尿药等药物疗效不佳。昨日病情再度加重，并出现神志恍惚，胡言乱语，由救护车送到我院急诊收入。起病以来纳差，近3天几乎未进食，服用利尿药后尿量增多，但未计量。    weight=    assistCheck=大、小便常规正常。血常规Hb160g／L，WBC 11﹒0 ×109／L，N 0﹒82，L 0.18。肝功能ALT50U／L，AST35U／L。肾功能正常。动脉血气分析pH 7﹒42，PaO 2 6﹒8kPa（51mmHg），PaCO 2 11﹒6kPa（87mmHg），HCO3－ 48mmol／L，BE ＋16mmol／L，SaO 2 85%。血清电解质K＋3﹒2mmol／L，Na＋126mmol／L，Cl－80mmol／L。心电图示电轴右偏，肺性P波，右束枝传导阻滞，偶发性房性早搏。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性支气管炎

呼吸科经典病历7行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=116    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=既往有吸烟史20 余年，已戒烟3年。无高血压、冠心病及结核病史。
    ...    symptom=反复咳嗽，咯痰30 余年，劳累性呼吸困难10年，反复双下肢水肿3年，近1周咳嗽加重，伴神志恍惚1天#####神志恍惚，烦躁不安，定向障碍，球结膜水肿，瞳孔等大，对光反射存在，口唇发绀，颈静脉充盈，气管居中，锁骨上淋巴结未扪及，桶状胸，心尖搏动在剑突下，扪诊双侧语颤减弱，叩诊为过清音，肝浊音界在锁中线7肋间，心率116次／分，律不齐，偶有早搏，肺动脉瓣区第二音亢进，三尖瓣区Ⅱ级收缩期杂音。双肺呼吸音减弱，可闻及散在干鸣音和中、细湿啰音。腹部稍膨隆，肝脏肋下2cm，质中，脾未扪及，腹软，无压痛，无移动性浊音，肠鸣音减弱。双下肢水肿（＋＋），腱反射减弱，锥体束征阳性，双手有扑翼样震颤。 现病史:30余年前患者开始出现受凉后咳嗽，咯白色粘液泡沫痰，每年冬季加重，严重时可持续数月，服用抗生素、止咳化痰药等症状可得到控制。10年前在发作间期患者在上楼或爬坡时也感到呼吸困难。3年前在咳嗽发作时出现双下肢浮肿，多次以慢性支气管炎、肺气肿和肺心病、心衰收住院治疗。入院前1周患者因受凉咳嗽加重，咳黄色粘液脓痰，心累，气促，双下肢浮肿，在当地医院静脉注射头孢类抗生素、氨茶碱，口服利尿药等药物疗效不佳。昨日病情再度加重，并出现神志恍惚，胡言乱语，由救护车送到我院急诊收入。起病以来纳差，近3天几乎未进食，服用利尿药后尿量增多，但未计量。    weight=    assistCheck=大、小便常规正常。血常规Hb160g／L，WBC 11﹒0 ×109／L，N 0﹒82，L 0.18。肝功能ALT50U／L，AST35U／L。肾功能正常。动脉血气分析pH 7﹒42，PaO 2 6﹒8kPa（51mmHg），PaCO 2 11﹒6kPa（87mmHg），HCO3－ 48mmol／L，BE ＋16mmol／L，SaO 2 85%。血清电解质K＋3﹒2mmol／L，Na＋126mmol／L，Cl－80mmol／L。心电图示电轴右偏，肺性P波，右束枝传导阻滞，偶发性房性早搏。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性阻塞性肺疾病

呼吸科经典病历7行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=116    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=既往有吸烟史20 余年，已戒烟3年。无高血压、冠心病及结核病史。
    ...    symptom=反复咳嗽，咯痰30 余年，劳累性呼吸困难10年，反复双下肢水肿3年，近1周咳嗽加重，伴神志恍惚1天#####神志恍惚，烦躁不安，定向障碍，球结膜水肿，瞳孔等大，对光反射存在，口唇发绀，颈静脉充盈，气管居中，锁骨上淋巴结未扪及，桶状胸，心尖搏动在剑突下，扪诊双侧语颤减弱，叩诊为过清音，肝浊音界在锁中线7肋间，心率116次／分，律不齐，偶有早搏，肺动脉瓣区第二音亢进，三尖瓣区Ⅱ级收缩期杂音。双肺呼吸音减弱，可闻及散在干鸣音和中、细湿啰音。腹部稍膨隆，肝脏肋下2cm，质中，脾未扪及，腹软，无压痛，无移动性浊音，肠鸣音减弱。双下肢水肿（＋＋），腱反射减弱，锥体束征阳性，双手有扑翼样震颤。 现病史:30余年前患者开始出现受凉后咳嗽，咯白色粘液泡沫痰，每年冬季加重，严重时可持续数月，服用抗生素、止咳化痰药等症状可得到控制。10年前在发作间期患者在上楼或爬坡时也感到呼吸困难。3年前在咳嗽发作时出现双下肢浮肿，多次以慢性支气管炎、肺气肿和肺心病、心衰收住院治疗。入院前1周患者因受凉咳嗽加重，咳黄色粘液脓痰，心累，气促，双下肢浮肿，在当地医院静脉注射头孢类抗生素、氨茶碱，口服利尿药等药物疗效不佳。昨日病情再度加重，并出现神志恍惚，胡言乱语，由救护车送到我院急诊收入。起病以来纳差，近3天几乎未进食，服用利尿药后尿量增多，但未计量。    weight=    assistCheck=大、小便常规正常。血常规Hb160g／L，WBC 11﹒0 ×109／L，N 0﹒82，L 0.18。肝功能ALT50U／L，AST35U／L。肾功能正常。动脉血气分析pH 7﹒42，PaO 2 6﹒8kPa（51mmHg），PaCO 2 11﹒6kPa（87mmHg），HCO3－ 48mmol／L，BE ＋16mmol／L，SaO 2 85%。血清电解质K＋3﹒2mmol／L，Na＋126mmol／L，Cl－80mmol／L。心电图示电轴右偏，肺性P波，右束枝传导阻滞，偶发性房性早搏。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

呼吸科经典病历7行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=116    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=既往有吸烟史20 余年，已戒烟3年。无高血压、冠心病及结核病史。
    ...    symptom=反复咳嗽，咯痰30 余年，劳累性呼吸困难10年，反复双下肢水肿3年，近1周咳嗽加重，伴神志恍惚1天#####神志恍惚，烦躁不安，定向障碍，球结膜水肿，瞳孔等大，对光反射存在，口唇发绀，颈静脉充盈，气管居中，锁骨上淋巴结未扪及，桶状胸，心尖搏动在剑突下，扪诊双侧语颤减弱，叩诊为过清音，肝浊音界在锁中线7肋间，心率116次／分，律不齐，偶有早搏，肺动脉瓣区第二音亢进，三尖瓣区Ⅱ级收缩期杂音。双肺呼吸音减弱，可闻及散在干鸣音和中、细湿啰音。腹部稍膨隆，肝脏肋下2cm，质中，脾未扪及，腹软，无压痛，无移动性浊音，肠鸣音减弱。双下肢水肿（＋＋），腱反射减弱，锥体束征阳性，双手有扑翼样震颤。 现病史:30余年前患者开始出现受凉后咳嗽，咯白色粘液泡沫痰，每年冬季加重，严重时可持续数月，服用抗生素、止咳化痰药等症状可得到控制。10年前在发作间期患者在上楼或爬坡时也感到呼吸困难。3年前在咳嗽发作时出现双下肢浮肿，多次以慢性支气管炎、肺气肿和肺心病、心衰收住院治疗。入院前1周患者因受凉咳嗽加重，咳黄色粘液脓痰，心累，气促，双下肢浮肿，在当地医院静脉注射头孢类抗生素、氨茶碱，口服利尿药等药物疗效不佳。昨日病情再度加重，并出现神志恍惚，胡言乱语，由救护车送到我院急诊收入。起病以来纳差，近3天几乎未进食，服用利尿药后尿量增多，但未计量。    weight=    assistCheck=大、小便常规正常。血常规Hb160g／L，WBC 11﹒0 ×109／L，N 0﹒82，L 0.18。肝功能ALT50U／L，AST35U／L。肾功能正常。动脉血气分析pH 7﹒42，PaO 2 6﹒8kPa（51mmHg），PaCO 2 11﹒6kPa（87mmHg），HCO3－ 48mmol／L，BE ＋16mmol／L，SaO 2 85%。血清电解质K＋3﹒2mmol／L，Na＋126mmol／L，Cl－80mmol／L。心电图示电轴右偏，肺性P波，右束枝传导阻滞，偶发性房性早搏。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历7行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=1    heartRate=116    highBldPress=140    lowBldPress=80    personalHistory=    previousHistory=既往有吸烟史20 余年，已戒烟3年。无高血压、冠心病及结核病史。
    ...    symptom=反复咳嗽，咯痰30 余年，劳累性呼吸困难10年，反复双下肢水肿3年，近1周咳嗽加重，伴神志恍惚1天#####神志恍惚，烦躁不安，定向障碍，球结膜水肿，瞳孔等大，对光反射存在，口唇发绀，颈静脉充盈，气管居中，锁骨上淋巴结未扪及，桶状胸，心尖搏动在剑突下，扪诊双侧语颤减弱，叩诊为过清音，肝浊音界在锁中线7肋间，心率116次／分，律不齐，偶有早搏，肺动脉瓣区第二音亢进，三尖瓣区Ⅱ级收缩期杂音。双肺呼吸音减弱，可闻及散在干鸣音和中、细湿啰音。腹部稍膨隆，肝脏肋下2cm，质中，脾未扪及，腹软，无压痛，无移动性浊音，肠鸣音减弱。双下肢水肿（＋＋），腱反射减弱，锥体束征阳性，双手有扑翼样震颤。 现病史:30余年前患者开始出现受凉后咳嗽，咯白色粘液泡沫痰，每年冬季加重，严重时可持续数月，服用抗生素、止咳化痰药等症状可得到控制。10年前在发作间期患者在上楼或爬坡时也感到呼吸困难。3年前在咳嗽发作时出现双下肢浮肿，多次以慢性支气管炎、肺气肿和肺心病、心衰收住院治疗。入院前1周患者因受凉咳嗽加重，咳黄色粘液脓痰，心累，气促，双下肢浮肿，在当地医院静脉注射头孢类抗生素、氨茶碱，口服利尿药等药物疗效不佳。昨日病情再度加重，并出现神志恍惚，胡言乱语，由救护车送到我院急诊收入。起病以来纳差，近3天几乎未进食，服用利尿药后尿量增多，但未计量。    weight=    assistCheck=大、小便常规正常。血常规Hb160g／L，WBC 11﹒0 ×109／L，N 0﹒82，L 0.18。肝功能ALT50U／L，AST35U／L。肾功能正常。动脉血气分析pH 7﹒42，PaO 2 6﹒8kPa（51mmHg），PaCO 2 11﹒6kPa（87mmHg），HCO3－ 48mmol／L，BE ＋16mmol／L，SaO 2 85%。血清电解质K＋3﹒2mmol／L，Na＋126mmol／L，Cl－80mmol／L。心电图示电轴右偏，肺性P波，右束枝传导阻滞，偶发性房性早搏。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺性脑病

呼吸科经典病历8行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=40    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=既往身体健康，有吸烟史10 余年，每日1 包。否认有咳嗽、低热和盗汗史。
    ...    symptom=突发寒战、高热、胸痛、咳嗽5天#####急性病容，发育正常，营养良好，神志清晰，鼻翼扇动，口唇周围可见疱疹，口唇微发绀，眼底无异常，气管居中，无颈静脉怒张，胸廓对称，呼吸运动两侧均等，右肺语颤增强，右肺上部叩浊。可闻及支气管呼吸音和少许湿啰音，左肺呼吸音正常，无胸膜摩擦音，心率110次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未及，双下肢无水肿，生理反射正常，病理反射未引出。 现病史:    weight=    assistCheck=血白细胞18.0×109／L，N 90%，可见核左移，胞质内有毒性颗粒及空泡，血沉15mm／h，军团菌血清抗体测定正常，痰涂片革兰氏染色可见成对阳性球菌，未找到抗酸杆菌，痰普通培养两次均见肺炎球菌生长，血气分析pH7.37，PaO 2 55mmHg，PaCO 2 38mmHg，SaO 2 85%，心电图呈窦性心动过速，胸部X 线示右肺上野大片均匀致密阴影，边缘模糊，肺门淋巴结不大，肋膈角清晰，侧位片病变位于右肺上叶，左肺未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    大叶性肺炎

呼吸科经典病历8行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=40    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=120    lowBldPress=75    personalHistory=    previousHistory=既往身体健康，有吸烟史10 余年，每日1 包。否认有咳嗽、低热和盗汗史。
    ...    symptom=突发寒战、高热、胸痛、咳嗽5天#####急性病容，发育正常，营养良好，神志清晰，鼻翼扇动，口唇周围可见疱疹，口唇微发绀，眼底无异常，气管居中，无颈静脉怒张，胸廓对称，呼吸运动两侧均等，右肺语颤增强，右肺上部叩浊。可闻及支气管呼吸音和少许湿啰音，左肺呼吸音正常，无胸膜摩擦音，心率110次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未及，双下肢无水肿，生理反射正常，病理反射未引出。 现病史:    weight=    assistCheck=血白细胞18.0×109／L，N 90%，可见核左移，胞质内有毒性颗粒及空泡，血沉15mm／h，军团菌血清抗体测定正常，痰涂片革兰氏染色可见成对阳性球菌，未找到抗酸杆菌，痰普通培养两次均见肺炎球菌生长，血气分析pH7.37，PaO 2 55mmHg，PaCO 2 38mmHg，SaO 2 85%，心电图呈窦性心动过速，胸部X 线示右肺上野大片均匀致密阴影，边缘模糊，肺门淋巴结不大，肋膈角清晰，侧位片病变位于右肺上叶，左肺未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺炎球菌性肺炎

呼吸科经典病历9行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=24    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=102    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=患者幼年时曾患百日咳，后继发支气管肺炎，住院治疗一个月后痊愈。
    ...    symptom=慢性咳嗽、咳脓痰和反复咯血8年，再次发作并发热7天#####发育正常，营养欠佳，消瘦，神志清晰。眼结膜苍白，口唇无发绀，无颈静脉怒张，气管居中，胸廓对称，肋间隙无增宽，呼吸运动两侧均等，语颤正常，两肺叩清音，左下胸背部可闻及中、细湿啰音，咳嗽后不消失。心率102次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未触及，杵状指。 现病史:患者于8年前开始出现受凉后咳嗽、咳脓痰，以晨起为重，并有少量咯血。曾多次到医院诊治，应用多种抗生素，病情时好时坏。近几年发作频繁且痰量增多，多时可达100ml／d。7天前因受凉后上述症状再次发作，咳大量黄脓痰，无臭味，少量痰中带血，并有发热，体温38℃。    weight=    assistCheck=血红蛋白90g／L，白细胞11.2×109／L，血沉14mm／h，血气分析为pH7.38，PaO2 90mmHg，PaCO2 40mmHg，痰找结核菌3次阴性，痰培养为草绿色链球菌和奈瑟氏菌，ECG 正常，胸部X 线示双下肺纹理粗乱，以左侧为甚，内有不规则卷发样阴影及片状渗出阴影，肺功能检查时间肺活量和最大通气量轻度降低，残气占肺总量百分比正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    支气管扩张

呼吸科经典病历10行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=108    highBldPress=130    lowBldPress=80    personalHistory=有吸烟史10年，10支／天    previousHistory=身体健康，1年前查体胸片未见异常
    ...    symptom=突发畏寒、高热、咳嗽、咳痰8天，咳大量脓臭痰2天#####急性病容，发育正常，营养良好，神志清晰，口唇无发绀，无颈静脉怒张，气管居中，胸廓对称，呼吸运动两侧均等，语颤右侧增强，右下胸部叩浊，听诊呼吸音低，右胸背部可闻及少许湿啰音。左肺正常。心率108次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未触及，无杵状指趾。 现病史:患者于8天前受凉后突然感畏寒、高热，体温达40℃，伴咳嗽、咳少量粘痰，同时有右侧胸痛、气急，即到当地医院就诊，胸透示“右肺中部大片模糊炎性浸润阴影”，给予青霉素640万单位静脉滴注治疗，体温不降，2天前患者开始咳大量脓臭痰，达300ml／日，伴少量咯血，体温下降至38℃。自发病以来，患者乏力，食欲不振，无体重减轻。    weight=    assistCheck=血白细胞20 ×10 9／L，N 90%，血沉15mm／h，痰查结核菌两次阴性，痰查癌细胞两次阴性，痰涂片革兰氏染色可见大量革兰氏阴性细菌，需氧培养未见细菌生长，厌氧培养见细菌生长，按标准方法鉴定为类杆菌，血培养阴性。ECG 示窦性心动过速，胸部X 线示右下肺大片浓密阴影，边缘不清，内有一约2 ×3cm 大小的空洞，内壁光滑，可见含气液平段，侧位片位于下叶背段，肺门淋巴结不大，左肺正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺脓肿

呼吸科经典病历11行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=20    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=130    lowBldPress=80    personalHistory=    previousHistory=既往史：自幼体弱，但无慢性疾病史。
    ...    symptom=低热、咳嗽1月余#####发育正常，营养一般，神志清晰。面颊潮红，口唇略苍白，眼底无异常，无颈静脉怒张，气管居中，甲状腺不大，胸廓无畸形，呼吸动度两侧均等，右肺上部叩浊，右上呼吸音稍低，轻咳时可于右侧肩胛间区闻及细湿啰音。心率92次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音。腹软，全腹无压痛及反跳痛，肝脾未及，双下肢无水肿，生理反射正常，病理反射未引出。 现病史:患者于1个月前始出现低热，体温波动在37.5℃左右，无畏寒。发热多出现在午后和傍晚，热退时出汗不显著，同时伴轻微咳嗽、咳少量粘痰，偶有痰中带血，无胸痛及气急。去当地医院就诊，透视发现肺部病灶，予以抗感染治疗，症状不见好转。自发病以来，患者感乏力，食欲减退，体重减轻约3公斤。    weight=    assistCheck=血红蛋白100g／L，白细胞8.0×10 9／L，血沉45mm／h，冷凝集试验（－），痰找癌细胞细胞3次（－），痰涂片抗酸染色2次（－），24小时浓缩集菌抗酸染色3次（＋）。PPD试验阳性。胸片示右肺上叶斑片状淡薄阴影，边缘模糊，在模糊阴影中可见一1cm×1cm密度减低的透亮区，侧位片示病变位于右肺上叶尖段，无肺门淋巴结肿大，左肺阴性。纤维支气管镜检查示右肺上叶管口充血，刷检涂片找到抗酸杆菌。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺结核

呼吸科经典病历12行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=140    lowBldPress=80    personalHistory=吸烟每日一包三十余年。不嗜酒。    previousHistory=40年前患者在大学读书时因咳嗽，低热，盗汗，在医院诊断为右肺上叶肺结核，经抗痨治疗一年，具体用药不详，复查谓之已愈。此后曾多次体检，右肺结核未再复发。最后一次体检是在两年前，当时未发现任何活动性结核病变和其他异常。2型糖尿病史3年，口服降糖灵及饮食控制，血糖基本控制在正常范围。
    ...    symptom=发热、咳嗽，咯脓痰2月#####发育正常，营养良好。神志清晰，精神好。口唇无发绀。颈部及锁骨上淋巴结无肿大。无颈静脉怒张，气管略向右侧移位。胸廓对称，呼吸运动两侧均等，语颤正常，右上肺叩浊，左肺叩诊清音，右上胸可闻及少许湿啰音及局限性哮鸣音，左肺呼吸音正常，无胸膜摩擦音。心率88次／分，律齐，心音有力，各瓣膜区未闻及杂音，腹软，肝脾未触及，无杵状指趾。 现病史:两月前因受凉出现发热、咳嗽，咯脓痰，在当地医院胸片诊断为右肺上叶大叶性肺炎，给予头孢类抗生素治疗一周后，复查胸片病灶大部吸收，仅见肺门影较浓密。症状亦明显好转，但仍有阵发性干咳。一周前再次出现上诉类似症状，体温38.5℃，无畏寒，咳黄色粘液脓性痰，有少量痰中带血和夜间盗汗。自服抗生素效果不佳前来我院就诊。起病以来食欲正常，无胸痛及全身其他部位疼痛。    weight=    assistCheck=血红蛋白130g／L，白细胞12.3×10 9／L，N 0﹒85 血沉25mm／小时。空腹血糖6.2mmol／L。痰查结核菌2次阴性，痰找癌细胞一次阴性。胸部平片示右肺上叶大片密度不均增高影，下界不清，水平裂轻度上移，纵隔轻度右移，右横膈抬高。右侧位片见右肺上叶尖、后段密度增高。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺癌

呼吸科经典病历13行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=112    highBldPress=110    lowBldPress=75    personalHistory=    previousHistory=既往身体健康，无类似病史
    ...    symptom=突发性左侧胸痛伴胸闷、气急6小时#####发育正常，营养中等，神志清，烦躁，呼吸困难。口唇无发绀，气管向右侧移位，左侧胸廓饱满，肋间隙增宽，呼吸运动减弱，语音减弱，叩诊呈鼓音，呼吸音消失，右肺无异常，心率112次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音，腹软，肝上界位于右锁骨中线第5 肋间，全腹无压痛和反跳痛，生理反射正常，病理反射未引出。 现病史:患者于6小时前打篮球时突感左侧胸痛，为锐痛，疼痛向左肩、臂放射，继有胸闷、气急，伴刺激性咳嗽，无痰、亦无咯血。立即静坐休息，病情未能缓解。患者无恶心、呕吐和昏倒。    weight=    assistCheck=血白细胞6.0×10 9／L，血气分析示pH7.44，PaO 2 70mmHg，PaCO 2 36mmHg，AB30mmol／L，SaO 2 90%，ECG 示窦性心动过速，胸部X 线示左肺向肺门萎陷呈圆球形阴影，有清楚的压缩带，左肺中外带透亮度增加，肺纹理消失，两侧肋膈角锐利。在左胸锁骨中线二肋间诊断性穿刺抽出气体。用气胸箱测初压为＋8～＋12cmH 2 O，抽气800ml 后呼吸困难好转，测压为＋1～＋4cmH 2 O，观察5分钟呼吸困难再次加重，测压为＋10～＋14cmH 2 O。立即在同一部位行闭式引流术，有大量气体引出，患者呼吸困难完全缓解。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    气胸

呼吸科经典病历13行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=112    highBldPress=110    lowBldPress=75    personalHistory=    previousHistory=既往身体健康，无类似病史
    ...    symptom=突发性左侧胸痛伴胸闷、气急6小时#####发育正常，营养中等，神志清，烦躁，呼吸困难。口唇无发绀，气管向右侧移位，左侧胸廓饱满，肋间隙增宽，呼吸运动减弱，语音减弱，叩诊呈鼓音，呼吸音消失，右肺无异常，心率112次／分，律齐，心音有力，各瓣膜区未闻及器质性杂音，腹软，肝上界位于右锁骨中线第5 肋间，全腹无压痛和反跳痛，生理反射正常，病理反射未引出。 现病史:患者于6小时前打篮球时突感左侧胸痛，为锐痛，疼痛向左肩、臂放射，继有胸闷、气急，伴刺激性咳嗽，无痰、亦无咯血。立即静坐休息，病情未能缓解。患者无恶心、呕吐和昏倒。    weight=    assistCheck=血白细胞6.0×10 9／L，血气分析示pH7.44，PaO 2 70mmHg，PaCO 2 36mmHg，AB30mmol／L，SaO 2 90%，ECG 示窦性心动过速，胸部X 线示左肺向肺门萎陷呈圆球形阴影，有清楚的压缩带，左肺中外带透亮度增加，肺纹理消失，两侧肋膈角锐利。在左胸锁骨中线二肋间诊断性穿刺抽出气体。用气胸箱测初压为＋8～＋12cmH 2 O，抽气800ml 后呼吸困难好转，测压为＋1～＋4cmH 2 O，观察5分钟呼吸困难再次加重，测压为＋10～＋14cmH 2 O。立即在同一部位行闭式引流术，有大量气体引出，患者呼吸困难完全缓解。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    闭合性气胸

呼吸科经典病历14行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=37    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均健在
    ...    gender=0    heartRate=98    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=否认结核病及肝肾病史，否认有类似病史
    ...    symptom=发热、胸痛、气促伴干咳2周#####发育正常，营养中等，神志清晰，呼吸稍显急促，无发绀。全身浅表淋巴结无肿大，无皮下结节。气管轻度左偏。右下胸饱满，呼吸动度减弱，语颤减低，叩呈实音，呼吸音消失，未闻及啰音及胸膜摩擦音。心率98次／分，节律齐，各瓣膜区无病理性杂音，腹平软，肝脾未触及，四肢无异常发现。 现病史:患者于2周前开始发热，体温38.5℃左右，右下胸痛，随呼吸或咳嗽加重。同时感胸闷气短，干咳、乏力，四肢关节疼痛，但无明显盗汗。曾就诊于当地医院，胸透发现右下胸大片密度增高影，上界呈外高内低，位于第4 前肋。胸腔穿刺抽出血性渗出液800ml，给予异烟肼、利福平、链霉素和强的松等治疗，后又曾胸穿抽过两次胸水，分别为500ml 和300ml，均为草黄色，其后症状有好转，复查胸透胸水基本吸收。1周后停用强的松。近3天来复又感胸闷气促而来我院诊治。    weight=    assistCheck=白细胞9.6×10 9／L，N 0﹒76，L 0﹒24，血沉36mm／h；胸水常规：外观草黄色微混，比重1.020，粘蛋白试验阳性，白细胞580 ×10 6，L 0﹒70；LDH200U／dl，CEA 4μg／L，染色体无异常。PPD 试验阳性，胸水结核抗体阳性，胸水找癌细胞1次（－）；X 线检查：右中下肺呈一片外高内低致密阴影，纵隔轻度左移；胸部B 超在右胸下背部探测到中等量积液。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性胸膜炎

呼吸科经典病历14行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=37    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母均健在
    ...    gender=0    heartRate=98    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=否认结核病及肝肾病史，否认有类似病史
    ...    symptom=发热、胸痛、气促伴干咳2周#####发育正常，营养中等，神志清晰，呼吸稍显急促，无发绀。全身浅表淋巴结无肿大，无皮下结节。气管轻度左偏。右下胸饱满，呼吸动度减弱，语颤减低，叩呈实音，呼吸音消失，未闻及啰音及胸膜摩擦音。心率98次／分，节律齐，各瓣膜区无病理性杂音，腹平软，肝脾未触及，四肢无异常发现。 现病史:患者于2周前开始发热，体温38.5℃左右，右下胸痛，随呼吸或咳嗽加重。同时感胸闷气短，干咳、乏力，四肢关节疼痛，但无明显盗汗。曾就诊于当地医院，胸透发现右下胸大片密度增高影，上界呈外高内低，位于第4 前肋。胸腔穿刺抽出血性渗出液800ml，给予异烟肼、利福平、链霉素和强的松等治疗，后又曾胸穿抽过两次胸水，分别为500ml 和300ml，均为草黄色，其后症状有好转，复查胸透胸水基本吸收。1周后停用强的松。近3天来复又感胸闷气促而来我院诊治。    weight=    assistCheck=白细胞9.6×10 9／L，N 0﹒76，L 0﹒24，血沉36mm／h；胸水常规：外观草黄色微混，比重1.020，粘蛋白试验阳性，白细胞580 ×10 6，L 0﹒70；LDH200U／dl，CEA 4μg／L，染色体无异常。PPD 试验阳性，胸水结核抗体阳性，胸水找癌细胞1次（－）；X 线检查：右中下肺呈一片外高内低致密阴影，纵隔轻度左移；胸部B 超在右胸下背部探测到中等量积液。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胸膜炎

呼吸科经典病历15行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=其父3年前因冠心病病故，母健在，家族中无类似病史。
    ...    gender=1    heartRate=112    highBldPress=105    lowBldPress=70    personalHistory=    previousHistory=既往有双下肢静脉曲张病史8年，上述症状出现前1天患者曾外出旅行，乘坐飞机两小时后感右下肢肿胀、疼痛，未予重视。否认活动后气急、心前区疼痛病史。
    ...    symptom=突发胸痛、气急、咯血6小时#####发育正常，营养良好，神志清晰，口唇无发绀，眼底无异常，无颈静脉怒张，气管居中，胸廓对称，呼吸运动两侧均等，双肺叩清音，右肺可闻及胸膜摩擦音，以腋中线处明显，右肺底可闻及湿啰音，左肺呼吸音正常。心率112次／分，律不齐，可闻及早搏，4次／分，肺动脉瓣区第二心音亢进，各瓣膜区未闻及器质性杂音。腹软，肝脾未触及，全腹无压痛及反跳痛，双下肢可见静脉曲张，右下肢轻度肿胀。 现病史:患者于6小时前起床后突感右侧胸痛，为钝痛，深呼吸或咳嗽后加重，伴出冷汗，随之出现发热，体温达38℃，胸闷、气急，不能平卧，舌下含化“硝酸甘油”，胸痛不缓解，并出现阵发性咳嗽，咯血少量，无晕厥和抽搐，无恶心及呕吐。    weight=    assistCheck=血白细胞8.0×10 9／L，N 0﹒75，血小板100 ×10 9／L，血沉25mm／h，血清谷草转氨酶、肌酸磷酸激酶和乳酸脱氢酶正常，血浆D‐二聚体阳性，血气分析示pH7.44，PaO 2 65mmHg，PaCO 2 30mmHg，AB 29mmol／L，ECG 呈窦性心律，偶发房性早搏，电轴右偏，完全性右束支传导阻滞，V 1～V 4导联T 波低平。胸部X 线，肺动脉段膨出，肺血减少，心影无增大，右下肺野可见大片密度均匀一致阴影，呈楔形，尖端指向肺门，基底靠近膈胸膜，右侧横膈抬高，肋膈角变钝，侧位阴影位于后基底段。肺通气灌注扫描示右肺下叶后基底段楔形缺损，通气正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺栓塞

呼吸科经典病历16行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=无烟酒嗜好；3年前饲养一宠物狗；无职业性粉尘接触史    previousHistory=既往健康，无高血压、消化系统疾病史；18岁时曾患肺结核，已治愈
    ...    symptom=反复咳嗽2年#####患者一般状况好，鼻黏膜苍白，咽部充血，扁桃体不大。肺部听诊呼吸音清，无干湿啰音，心脏查体无异常，腹部、四肢未见异常。 现病史:患者2年来反复咳嗽，多在冬春和秋冬季节交替时发生。以干咳为主，偶有少许白痰，咽部痒感。有夜间咳嗽，多在凌晨咳嗽，重时可因咳嗽致醒，伴气短，坐起后咳嗽症状逐渐缓解。晨起经常打喷嚏，流清水样鼻涕，在空调的房间里也出现上述症状。有时有鼻后滴流感，鼻部分泌物从后鼻道滴入咽部。香烟、油烟气味刺激咳嗽加重，呼吸道感染后，咳嗽持续时间长，不易缓解。有胸部不适感。曾就诊于多家医院，做血常规、支原体抗体化验、心电图及胸部X线等各项检查均未见异常。应用抗生素、止咳药等治疗无明显效果，间断口服抗过敏药稍有效果。发病时无发热、盗汗、乏力、心悸等症状。    weight=    assistCheck=肺CT检查结果：右肺上叶后段见斑块样钙化灶，无浸润病变。肺功能检查提示小气道功能轻度降低，支气管激发试验阳性。诱导痰细胞学检查：嗜酸细胞占18%。血清过敏原检测结果：猫狗皮毛（+），总IgE升高，外周血嗜酸细胞增高（9.8%）。PPD试验： 局部硬结直径5mm（+）。痰涂片查结核阴性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    哮喘

呼吸科经典病历16行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=无烟酒嗜好；3年前饲养一宠物狗；无职业性粉尘接触史    previousHistory=既往健康，无高血压、消化系统疾病史；18岁时曾患肺结核，已治愈
    ...    symptom=反复咳嗽2年#####患者一般状况好，鼻黏膜苍白，咽部充血，扁桃体不大。肺部听诊呼吸音清，无干湿啰音，心脏查体无异常，腹部、四肢未见异常。 现病史:患者2年来反复咳嗽，多在冬春和秋冬季节交替时发生。以干咳为主，偶有少许白痰，咽部痒感。有夜间咳嗽，多在凌晨咳嗽，重时可因咳嗽致醒，伴气短，坐起后咳嗽症状逐渐缓解。晨起经常打喷嚏，流清水样鼻涕，在空调的房间里也出现上述症状。有时有鼻后滴流感，鼻部分泌物从后鼻道滴入咽部。香烟、油烟气味刺激咳嗽加重，呼吸道感染后，咳嗽持续时间长，不易缓解。有胸部不适感。曾就诊于多家医院，做血常规、支原体抗体化验、心电图及胸部X线等各项检查均未见异常。应用抗生素、止咳药等治疗无明显效果，间断口服抗过敏药稍有效果。发病时无发热、盗汗、乏力、心悸等症状。    weight=    assistCheck=肺CT检查结果：右肺上叶后段见斑块样钙化灶，无浸润病变。肺功能检查提示小气道功能轻度降低，支气管激发试验阳性。诱导痰细胞学检查：嗜酸细胞占18%。血清过敏原检测结果：猫狗皮毛（+），总IgE升高，外周血嗜酸细胞增高（9.8%）。PPD试验： 局部硬结直径5mm（+）。痰涂片查结核阴性。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    过敏性鼻炎

呼吸科经典病历17行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=102    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=既往体健，无循环系统疾病，无血液病、无肾脏疾病、肝脏疾病、结缔组织病
    ...    symptom=呼吸困难2周#####神志清楚，呼吸略促，半卧位，无三凹征，结膜无苍白，口唇无发绀，颈静脉无怒张，气管右移，浅表淋巴结未触及，左胸廓膨隆，呼吸运动减弱，触觉语颤减弱，左肺叩诊浊音，听诊呼吸音减弱，未闻及啰音，无胸膜摩擦音，心界不大，律齐，音纯，未闻及奔马律，腹软，无压痛，肝脾肋下未触及，双下肢无水肿，余查体正常。 现病史:患者2周前无明显诱因出现左胸痛，针刺样疼痛，无放射痛，未在意，自行缓解，之后逐渐出现呼吸困难，活动及平卧时加重，干咳，发热，体温37.8℃，无咯血，口服对乙酰氨基酚后热见退，经4小时左右再发热，体重下降约2.5kg，二便正常    weight=    assistCheck=血常规：WBC 11.4×109/L，S 75%L 20%，M 3%，RBC 5.67×1012/L，Hb 150g/L，PLT 402×109/L。CRP：80mg/L。ESR：90mm/h。动脉血气分析（未吸氧）：pH 7.38，PaCO2 40mmHg，PaO2 86mmHg。D-二聚体：0.3mg/L。肺部X线：左肺外高内低致密影，初步诊断左侧胸腔积液。心电图：窦性心律。心肌酶谱：正常。胸腔积液常规：李凡他试验阳性，草黄色液体，细胞计数 800×106/L，淋巴细胞为主。胸腔积液生化：LDH 360U/L，蛋白 46g/L，葡萄糖3.2mmol/L。胸腔积液查CEA＜20mg/L。胸腔积液腺苷酸脱氧酶（ADA）120U/L。胸腔积液查结核菌阴性。胸腔积液细菌培养阴性。PPD：强阳性（硬结直径：25mm×22mm）。血LDH：204U/L。血CEA 1.6mg/L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性胸膜炎

呼吸科经典病历17行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=32    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=102    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=既往体健，无循环系统疾病，无血液病、无肾脏疾病、肝脏疾病、结缔组织病
    ...    symptom=呼吸困难2周#####神志清楚，呼吸略促，半卧位，无三凹征，结膜无苍白，口唇无发绀，颈静脉无怒张，气管右移，浅表淋巴结未触及，左胸廓膨隆，呼吸运动减弱，触觉语颤减弱，左肺叩诊浊音，听诊呼吸音减弱，未闻及啰音，无胸膜摩擦音，心界不大，律齐，音纯，未闻及奔马律，腹软，无压痛，肝脾肋下未触及，双下肢无水肿，余查体正常。 现病史:患者2周前无明显诱因出现左胸痛，针刺样疼痛，无放射痛，未在意，自行缓解，之后逐渐出现呼吸困难，活动及平卧时加重，干咳，发热，体温37.8℃，无咯血，口服对乙酰氨基酚后热见退，经4小时左右再发热，体重下降约2.5kg，二便正常    weight=    assistCheck=血常规：WBC 11.4×109/L，S 75%L 20%，M 3%，RBC 5.67×1012/L，Hb 150g/L，PLT 402×109/L。CRP：80mg/L。ESR：90mm/h。动脉血气分析（未吸氧）：pH 7.38，PaCO2 40mmHg，PaO2 86mmHg。D-二聚体：0.3mg/L。肺部X线：左肺外高内低致密影，初步诊断左侧胸腔积液。心电图：窦性心律。心肌酶谱：正常。胸腔积液常规：李凡他试验阳性，草黄色液体，细胞计数 800×106/L，淋巴细胞为主。胸腔积液生化：LDH 360U/L，蛋白 46g/L，葡萄糖3.2mmol/L。胸腔积液查CEA＜20mg/L。胸腔积液腺苷酸脱氧酶（ADA）120U/L。胸腔积液查结核菌阴性。胸腔积液细菌培养阴性。PPD：强阳性（硬结直径：25mm×22mm）。血LDH：204U/L。血CEA 1.6mg/L。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胸膜炎

呼吸科经典病历18行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=不吸烟    previousHistory=既往健康，无COPD、支气管哮喘及肺结核等呼吸系统疾病史，否认双下肢静脉血栓及长期用药史
    ...    symptom=突发呼吸困难伴胸痛3天#####神志清楚，呼吸略促，口唇无发绀，气管居中，无三凹征。右胸部略饱满，触诊呼吸运动减弱，听诊右上肺呼吸音消失，双肺未闻及干湿啰音。心界不大，心率90次/分，律齐，未闻及奔马律，各瓣膜听诊区未闻及病理性杂音。腹部、四肢、神经系统检查未见异常。 现病史:3天前打篮球后突然自觉右胸痛，伴胸闷、呼吸困难，无发热、咳嗽、咳痰及咯血，未介意，今日因气短加重来诊。无烦躁不安、冷汗、虚脱，可平卧。    weight=    assistCheck=①血常规：白细胞总数、分类及血清IgE均正常；②痰及诱导痰无嗜酸细胞升高；③特异性变应原检测未找到变应原；④血D-二聚体定量正常；⑤未吸氧时PaO2、PaCO2、SaO2正常；⑥X线右肺中野可见外凸弧形细线条形阴影，线外透亮度增高，无肺纹理，线内可见压缩的肺组织，肺被压缩30%左右，提示右侧气胸；⑦心电图正常；⑧心脏超声、心功能正常；⑨双下肢静脉超声正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    气胸

呼吸科经典病历18行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=不吸烟    previousHistory=既往健康，无COPD、支气管哮喘及肺结核等呼吸系统疾病史，否认双下肢静脉血栓及长期用药史
    ...    symptom=突发呼吸困难伴胸痛3天#####神志清楚，呼吸略促，口唇无发绀，气管居中，无三凹征。右胸部略饱满，触诊呼吸运动减弱，听诊右上肺呼吸音消失，双肺未闻及干湿啰音。心界不大，心率90次/分，律齐，未闻及奔马律，各瓣膜听诊区未闻及病理性杂音。腹部、四肢、神经系统检查未见异常。 现病史:3天前打篮球后突然自觉右胸痛，伴胸闷、呼吸困难，无发热、咳嗽、咳痰及咯血，未介意，今日因气短加重来诊。无烦躁不安、冷汗、虚脱，可平卧。    weight=    assistCheck=①血常规：白细胞总数、分类及血清IgE均正常；②痰及诱导痰无嗜酸细胞升高；③特异性变应原检测未找到变应原；④血D-二聚体定量正常；⑤未吸氧时PaO2、PaCO2、SaO2正常；⑥X线右肺中野可见外凸弧形细线条形阴影，线外透亮度增高，无肺纹理，线内可见压缩的肺组织，肺被压缩30%左右，提示右侧气胸；⑦心电图正常；⑧心脏超声、心功能正常；⑨双下肢静脉超声正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    闭合性气胸

呼吸科经典病历19行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=37.4    familyHistory=父母已故，同胞兄弟4人均健在，否认家族成员肿瘤患病史及遗传性疾病，家族成员无类似疾病
    ...    gender=1    heartRate=88    highBldPress=150    lowBldPress=90    personalHistory=吸烟30年×20支/日，少量饮白酒20年，2两/日，搬运工人，无有害粉尘接触史。否认疫区旅游史，无生食螃蟹史，无结核病患者密切接触史    previousHistory=年轻时患过肺结核已愈。左下肢静脉曲张10年。糖尿病病史7年，间断自服“二甲双胍”等降糖药，很少检测血糖。高血压病5年，平素血压140～160/90～100mmHg，间断口服复方降压片。否认胃病、肝病和血液病，无外伤和手术史
    ...    symptom=间断咯血5个月，加重1周#####发育正常，呈慢性病容，神志清楚，自主体位，轻度贫血貌。皮肤黏膜无出血点和皮疹，浅表淋巴结未触及。眼睑黏膜苍白，巩膜无黄染，鼻腔无分泌物及出血，各鼻窦区无压痛，口唇无发绀，口腔黏膜和牙龈无出血，咽黏膜轻度充血，扁桃体无肿大，声音无嘶哑。颈静脉无怒张，肝颈静脉回流征阴性，气管居中，胸廓无畸形，右下肺触觉语颤增强，叩诊呈浊音，右下肺可闻及湿啰音、左肺听诊正常。心浊音界正常，心率88次/分，心律规整，各瓣膜区未闻及病理性杂音。腹平软，肝脾肋下未触及。无杵状指（趾）。脊柱四肢检查可见右下肢静脉曲张，无肿胀，皮色正常，余未见异常。神经系统查体正常。 现病史:患者于5个月前因劳累后出现小量咯血，每日4～5口，为鲜红色、无血块，无胸痛及气短，无发热及咳黄痰，无恶心及腹痛，无血尿及便血，无牙龈出血，自行口服“云南白药”和“阿莫西林”。1个月后仍有血痰或痰中带血，并伴有乏力，午后发热，T 37.3～37.6℃，应用“第二代头孢菌素”和“左氧氟沙星”治疗2周，因体温下降恢复正常，血痰减少，停药观察。3个月前，劳累后偶有咳痰带血，活动后气短伴胸痛，休息后可缓解，无阵发性夜间呼吸困难，未就诊。1个半月前因着凉后，出现咳嗽、咳黄痰、咳痰带血，伴有发热、乏力，就诊于当地医院拍胸片见“肺内阴影”，给予抗感染治疗，2周后复查胸片肺部阴影未见吸收，放弃治疗。1周前无明显诱因突然整口咯血，每次咯血量为10～50ml，为整口鲜血，在当地医院予止血、抗感染治疗，病情未见好转，为进一步诊治转入我院。发病以来消瘦，体重下降4kg左右，近2个月有活动后气短，无夜间阵发性呼吸困难，无胸痛和心悸，睡眠尚可，二便正常。    weight=    assistCheck=血常规：WBC 9.8×109/L，S 63%，L 15%，M 2%，RBC 3.01×1012/L，Hb 80g/L，PLT 234×109/L，B型血。ESR：50mm/h，结核抗体阴性，PPD实验（+），军团菌抗体阴性。血CEA、NSE、D-二聚体、凝血三项均在正常范围。空腹血糖10.1mmol/L，餐后2小时血糖14.7mmol/L，糖化血红蛋白7.7%。尿常规和肾功能均正常。3次痰涂片革兰染色均为阴性，3次痰涂片荧光染色未查到抗酸杆菌，3次痰细菌培养阴性，3次痰涂片和培养未查到真菌菌丝孢子和真菌生长，3次痰未查到瘤细胞。动脉血气分析（未吸氧）PaO2 87mmHg，PaCO2 40mmHg，pH 7.39。心电图和心脏扇扫未见异常。双下肢深静脉彩超未见血栓形成。肺CT：右肺空洞性病灶，病变位于右肺下叶背段。肺活检病理结果：查到腺癌细胞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺癌

呼吸科经典病历19行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=37.4    familyHistory=父母已故，同胞兄弟4人均健在，否认家族成员肿瘤患病史及遗传性疾病，家族成员无类似疾病
    ...    gender=1    heartRate=88    highBldPress=150    lowBldPress=90    personalHistory=吸烟30年×20支/日，少量饮白酒20年，2两/日，搬运工人，无有害粉尘接触史。否认疫区旅游史，无生食螃蟹史，无结核病患者密切接触史    previousHistory=年轻时患过肺结核已愈。左下肢静脉曲张10年。糖尿病病史7年，间断自服“二甲双胍”等降糖药，很少检测血糖。高血压病5年，平素血压140～160/90～100mmHg，间断口服复方降压片。否认胃病、肝病和血液病，无外伤和手术史
    ...    symptom=间断咯血5个月，加重1周#####发育正常，呈慢性病容，神志清楚，自主体位，轻度贫血貌。皮肤黏膜无出血点和皮疹，浅表淋巴结未触及。眼睑黏膜苍白，巩膜无黄染，鼻腔无分泌物及出血，各鼻窦区无压痛，口唇无发绀，口腔黏膜和牙龈无出血，咽黏膜轻度充血，扁桃体无肿大，声音无嘶哑。颈静脉无怒张，肝颈静脉回流征阴性，气管居中，胸廓无畸形，右下肺触觉语颤增强，叩诊呈浊音，右下肺可闻及湿啰音、左肺听诊正常。心浊音界正常，心率88次/分，心律规整，各瓣膜区未闻及病理性杂音。腹平软，肝脾肋下未触及。无杵状指（趾）。脊柱四肢检查可见右下肢静脉曲张，无肿胀，皮色正常，余未见异常。神经系统查体正常。 现病史:患者于5个月前因劳累后出现小量咯血，每日4～5口，为鲜红色、无血块，无胸痛及气短，无发热及咳黄痰，无恶心及腹痛，无血尿及便血，无牙龈出血，自行口服“云南白药”和“阿莫西林”。1个月后仍有血痰或痰中带血，并伴有乏力，午后发热，T 37.3～37.6℃，应用“第二代头孢菌素”和“左氧氟沙星”治疗2周，因体温下降恢复正常，血痰减少，停药观察。3个月前，劳累后偶有咳痰带血，活动后气短伴胸痛，休息后可缓解，无阵发性夜间呼吸困难，未就诊。1个半月前因着凉后，出现咳嗽、咳黄痰、咳痰带血，伴有发热、乏力，就诊于当地医院拍胸片见“肺内阴影”，给予抗感染治疗，2周后复查胸片肺部阴影未见吸收，放弃治疗。1周前无明显诱因突然整口咯血，每次咯血量为10～50ml，为整口鲜血，在当地医院予止血、抗感染治疗，病情未见好转，为进一步诊治转入我院。发病以来消瘦，体重下降4kg左右，近2个月有活动后气短，无夜间阵发性呼吸困难，无胸痛和心悸，睡眠尚可，二便正常。    weight=    assistCheck=血常规：WBC 9.8×109/L，S 63%，L 15%，M 2%，RBC 3.01×1012/L，Hb 80g/L，PLT 234×109/L，B型血。ESR：50mm/h，结核抗体阴性，PPD实验（+），军团菌抗体阴性。血CEA、NSE、D-二聚体、凝血三项均在正常范围。空腹血糖10.1mmol/L，餐后2小时血糖14.7mmol/L，糖化血红蛋白7.7%。尿常规和肾功能均正常。3次痰涂片革兰染色均为阴性，3次痰涂片荧光染色未查到抗酸杆菌，3次痰细菌培养阴性，3次痰涂片和培养未查到真菌菌丝孢子和真菌生长，3次痰未查到瘤细胞。动脉血气分析（未吸氧）PaO2 87mmHg，PaCO2 40mmHg，pH 7.39。心电图和心脏扇扫未见异常。双下肢深静脉彩超未见血栓形成。肺CT：右肺空洞性病灶，病变位于右肺下叶背段。肺活检病理结果：查到腺癌细胞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    高血压

呼吸科经典病历20行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=62    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=0    heartRate=94    highBldPress=130    lowBldPress=75    personalHistory=    previousHistory=平素健康，无呼吸系统及心血管系统病史。否认下肢水肿病史。发病前1个月因“胆囊结石”行胆囊切除术，术后卧床8天
    ...    symptom=左侧胸痛，呼吸困难5天#####神志清楚，呼吸略促，自主体位。口唇轻度发绀，无三凹征。颈静脉无怒张，气管居中，颈部及锁骨上淋巴结未触及。胸廓对称，双侧呼吸运动一致，双肺叩诊清音，双肺听诊呼吸音清，未闻及干湿啰音及胸膜摩擦音。心界不大，心音纯，律整，肺动脉瓣第二心音亢进，未闻及奔马律。腹软，无压痛，肝脾肋下未触及。双下肢对称无水肿。余正常。 现病史:5天前突发左侧胸下外侧针刺样疼痛，无放射，伴呼吸困难及咳嗽，咳嗽或深呼吸时胸痛加重，2天后咳痰带少许新鲜血丝，病程中无发热。胸片提示左肺淡片影，静脉滴注抗生素未见好转。    weight=    assistCheck=①血常规：WBC 6.7×109/L，S 69%，L 30%，M 1%，RBC 4.02×1012/L，Hb 134g/L，PLT 273×109/L。②凝血三项，肿瘤标志物均在正常范围内。③D-二聚体明显升高，18.5mg/ml（正常值：0～0.5mg/L）。④血气分析（未吸氧）：pH 7.43，PaO2 64mmHg，PaCO2 32.7 mmHg。心脏扇扫间接估测到肺动脉收缩压：56mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性肺栓塞

呼吸科经典病历21行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=61    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=既往身体健康，无慢性呼吸系统疾病史及心脏疾病史
    ...    symptom=发现杵状指3个月#####神志清楚，查体合作。右锁骨上可触及一无痛肿大淋巴结，质硬，移动性差，口唇无发绀，颈软。双肺呼吸音清，左下肺呼吸音稍弱，心界不大，心律齐。腹软，无压痛、反跳痛，肝脾未触及，四肢活动自如，可见杵状指（趾） 现病史:3个月前发现四肢指端变形，持续不缓解。近2个月出现咳嗽，有少量白痰，无咯血，无呼吸困难，无发热，无心悸、胸闷，无恶心、呕吐，无腹痛、腹泻。    weight=    assistCheck="血常规：WBC 9.2×109/L，S 65%，L 20%，Hb 119g/ L。肝功能、肾功能、血糖正常，血肿瘤标志物正常。心脏扇扫正常。肝胆脾B超结果正常。肺CT：左肺下野降主动脉旁见一3.5cm×4.5cm大小块状影，有分叶，纵隔内见数个肿大淋巴结。纤维支气管镜结果：左肺下叶背段见菜花样肿物，余各级支气管黏膜光滑管腔通畅。病理结果：小细胞型肺癌"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺癌

呼吸科经典病历22行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=既往有青霉素过敏性休克史，对多种抗生素过敏，对花粉过敏    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=130    highBldPress=120    lowBldPress=70    personalHistory=无吸烟史    previousHistory=10年前有荨麻疹史
    ...    symptom=反复发作性喘息20年，加重1周#####一般状态差，神志清，端坐呼吸，满头大汗，话语不连贯，口唇颜面发绀。双肺满布哮鸣音，散在小水泡音。心界不大，心音纯，心率130次/分，节律规整。各瓣膜区未闻及心脏杂音和奔马律。腹部、四肢和神经系统检查未见异常。 现病史:患者20年前无明确诱因喘息发作，发作时端坐呼吸、喘息伴咳嗽，咳少许白色稀薄痰，用地塞米松静脉注射可缓解症状。以后10年中喘息症状发作频繁，经常在冬春和秋冬季节交替、气候变化的时候喘息发作，月经期无症状加重。1周前感冒后喘息发作，夜间不能平卧，采用肘膝位，呼吸困难，伴满头大汗，呼吸时可听到拉风箱样的喘鸣音。喘息逐渐加重，持续48小时不缓解。发病以来无发热，二便正常。    weight=    assistCheck=①血常规：WBC 12.0×109/L；S 76%，E 6%，L 18%。②动脉血气分析（未吸氧）：pH 7.321，PaO2 65.5 mmHg，PaCO2 43.7 mmHg，HCO3－ 22.1 mmol/L。③胸部X线：双肺透过度增强，余未见异常。④心电图：心动过速，心率130次/分，节律规整。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    哮喘

呼吸科经典病历23行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=21    ageType=岁    allergyHistory=无花粉过敏史    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=既往健康。待业在家，无特殊粉尘接触史；家居楼房，不潮湿，最近未装修房屋；未饲养宠物
    ...    symptom=喘息、呼吸困难进行性加重20天#####一般状态尚可，神志清，半坐位，呼吸促，多汗，话语连贯，口唇轻度发绀。双肺满布哮鸣音，无水泡音，卧位时不用听诊器可听到大气道喘鸣音。心界不大，心音纯，心率130次/分，节律规整。各瓣膜区未闻及心脏杂音和奔马律。腹部、四肢和神经系统检查未见异常 现病史:患者1个月前无明显诱因发生喘息，卧位时喘息症状加重，有时能听到气道内拉风匣样的喘鸣音，伴有呼吸困难，被迫坐起后数分钟可轻度缓解喘息症状。轻咳，无痰，无咯血，无发热，无鼻塞、流涕症状。1个月来喘息症状逐渐加重，曾在外院用青霉素和氨茶碱静脉滴注，症状有时缓解。来诊前1周，症状加重，经常夜间憋醒，不能平卧，伴颜面潮红，满头大汗，经急诊收入院。    weight=    assistCheck=①血常规：WBC 8.0×109/L；S 70%，E 2%，L 28%。②动脉血气分析（未吸氧）：pH 7.50，PaO2 75.5 mmHg，PaCO2 28.7 mmHg，HCO3－ 23.5 mmol/L。③胸部X线：双肺未见明显异常。④心电图：窦性心动过速，心率120次/分，节律规整。⑤支原体抗体检测结果回报1∶160阳性。⑥肺CT三维重建提示肿物从气管左侧向管腔内生长，左侧根部有蒂，右侧位气管重建肿物将气管完全阻塞。⑦肺纤维支气管镜检查结果提示大气道占位病变    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    气管肿瘤

呼吸科经典病历24行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=130    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=反复发作性喘息20年，再次发作1周，嗜睡1天#####一般状态差，半卧位，满头大汗，神志模糊，时有躁动，问话有时能正确回答，但话语不连贯。口唇颜面发绀，球结膜轻度水肿，可见“三凹征”，胸廓饱满，双肺叩诊过清音。双肺呼吸音弱，未闻及干鸣音，右肺下散在少量小水泡音。心率130次/分，节律规整。各瓣膜听诊区未闻及病理性杂音。腹软，肝肋下可触及1～2cm，质软，脾未触及。双下肢无水肿。 现病史:20年前无明确诱因感到气短，喘息，呼气时可听到“咝咝”声，伴咳嗽，咳少许白色稀薄痰，持续数小时后自行缓解。1周前感冒后喘息发作，气短严重，夜间不能平卧，伴满头大汗。为缓解症状患者应用“异丙肾上腺素”青霉素、氨茶碱，喘息逐渐加重，1天前患者精神萎靡，嗜睡，偶有谵语来我院急诊。患者此次发病无发热，无黄痰，无咯血，无胸痛，进食量显著减少，排便成形，每日尿量500～700ml。    weight=    assistCheck=①血常规：白细胞总数11.1×109/L，中性粒细胞77%。②血气分析（吸氧2L/min）：pH 7.321，PaO2 65.5mmHg，PaCO2 53.7mmHg，HCO3－ 22.1mmol/L。③床头胸片：双肺透过度增高。④心电图：窦性心动过速。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    哮喘

呼吸科经典病历24行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=39    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=0    heartRate=130    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=反复发作性喘息20年，再次发作1周，嗜睡1天#####一般状态差，半卧位，满头大汗，神志模糊，时有躁动，问话有时能正确回答，但话语不连贯。口唇颜面发绀，球结膜轻度水肿，可见“三凹征”，胸廓饱满，双肺叩诊过清音。双肺呼吸音弱，未闻及干鸣音，右肺下散在少量小水泡音。心率130次/分，节律规整。各瓣膜听诊区未闻及病理性杂音。腹软，肝肋下可触及1～2cm，质软，脾未触及。双下肢无水肿。 现病史:20年前无明确诱因感到气短，喘息，呼气时可听到“咝咝”声，伴咳嗽，咳少许白色稀薄痰，持续数小时后自行缓解。1周前感冒后喘息发作，气短严重，夜间不能平卧，伴满头大汗。为缓解症状患者应用“异丙肾上腺素”青霉素、氨茶碱，喘息逐渐加重，1天前患者精神萎靡，嗜睡，偶有谵语来我院急诊。患者此次发病无发热，无黄痰，无咯血，无胸痛，进食量显著减少，排便成形，每日尿量500～700ml。    weight=    assistCheck=①血常规：白细胞总数11.1×109/L，中性粒细胞77%。②血气分析（吸氧2L/min）：pH 7.321，PaO2 65.5mmHg，PaCO2 53.7mmHg，HCO3－ 22.1mmol/L。③床头胸片：双肺透过度增高。④心电图：窦性心动过速。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历25行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=29    ageType=岁    allergyHistory=吃螃蟹皮肤过敏史    bodyTempr=36.4    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=125    lowBldPress=80    personalHistory=家中未养花，未养宠物和鸽子    previousHistory=从事文秘工作，既往健康。
    ...    symptom=反复发作性呼吸困难2年#####神志清楚，呼吸急促，坐位。口唇轻度发绀，气管居中，无三凹征，胸廓对称，双侧呼吸运度对称，双肺叩诊呈清音，听诊呼吸音粗，双肺满布哮鸣音，以呼气相明显，并伴呼气相延长，未闻及湿啰音。心界不大，心音纯，律整，未闻及奔马律和各瓣膜区杂音。腹部、四肢和神经系统检查未见异常。 现病史:患者2年前于5月份某一天无诱因出现打喷嚏、流眼泪，随之出现呼吸困难，端坐呼吸伴大汗，自觉有“呼气不尽”的感觉，自己能听到喉部“咝咝”声。急到当地医院就诊，经静脉注射氨茶碱和地塞米松后很快缓解。缓解后有轻咳，咳出少量白色稀薄痰液。以后的2年时间里经常出现上述类似发作。发作时间以5、6月份为主，未正规治疗。与服用药物、运动、精神因素及月经等无明确关系。为求进一步治疗，遂来我院。    weight=    assistCheck=①血常规：WBC 7.3×109/L；S 62%，L 35%，M 1%，E 2%，RBC 3.52×1012/L；Hb 129g/L；PLT 262×109/L。②血清IgE水平增高。③过敏原检测：尘螨水平明显增高。④动脉血气：pH 7.43，PaO2 78.2mmHg，PaCO2 31.6mmHg。⑤胸部影像学：双肺呈过度充气影像改变，余未见异常。⑥肺通气功能和支气管舒张试验：肺功能呈阻塞性通气功能障碍（FEV1占预计值63%，FEV1/FVC61%），小气道重度阻塞（FEF50%占预计值56%），支气管舒张试验阳性（FEV1改善率14%，绝对值增加240ml）。⑦心脏彩超及心功能：正常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    哮喘

呼吸科经典病历26行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=81    highBldPress=130    lowBldPress=75    personalHistory=有吸烟史30余年，每日20～30支。    previousHistory=既往无慢性呼吸系统疾病，无有害气体及粉尘接触史，无结核病患者接触史
    ...    symptom=咳嗽咳痰10余年，气短2年#####发育正常，营养中等，神志清晰，浅表淋巴结未触及，口唇无发绀，无颈静脉怒张，肝颈静脉回流征阴性。桶状胸，呼吸运动正常，肋间隙略增宽，触觉语颤减弱，叩诊双肺过清音，肺下界下移，听诊呼吸音普遍减弱，呼气相延长。心尖搏动正常，心浊音界缩小，心率81次/分，律齐，P2无明显增强，各瓣膜听诊区未闻及病理性杂音。腹平软，无压痛反跳痛，肝脾肋下未触及，肝浊音界下移。双下肢无水肿，无杵状指（趾）。 现病史:10余年前无明显诱因出现咳嗽、咳少许白痰，不伴喘息，上述症状多于秋冬季明显，每年持续3个月以上，未系统诊治。2年前开始出现气短，活动后加重，为系统诊治来诊。发病以来无胸痛、咯血，无低热、盗汗、乏力，无水肿、少尿，无夜间阵发性呼吸困难    weight=    assistCheck=①血常规：WBC 8.72×109/L，L 22.3%，S 63%，Hb 125g/L，PLT 332×109/L。②动脉血气分析（未吸氧）：pH 7.41，PaO2 72.5mmHg， PaCO2 43mmHg。③肺功能：FEV1占预计值47%；FEV1/FVC 63%。④心电图：正常。⑤胸片：肋间隙增宽，膈肌变平，心脏垂直位，双肺野透光度增加。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性支气管炎

呼吸科经典病历26行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=67    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=81    highBldPress=130    lowBldPress=75    personalHistory=有吸烟史30余年，每日20～30支。    previousHistory=既往无慢性呼吸系统疾病，无有害气体及粉尘接触史，无结核病患者接触史
    ...    symptom=咳嗽咳痰10余年，气短2年#####发育正常，营养中等，神志清晰，浅表淋巴结未触及，口唇无发绀，无颈静脉怒张，肝颈静脉回流征阴性。桶状胸，呼吸运动正常，肋间隙略增宽，触觉语颤减弱，叩诊双肺过清音，肺下界下移，听诊呼吸音普遍减弱，呼气相延长。心尖搏动正常，心浊音界缩小，心率81次/分，律齐，P2无明显增强，各瓣膜听诊区未闻及病理性杂音。腹平软，无压痛反跳痛，肝脾肋下未触及，肝浊音界下移。双下肢无水肿，无杵状指（趾）。 现病史:10余年前无明显诱因出现咳嗽、咳少许白痰，不伴喘息，上述症状多于秋冬季明显，每年持续3个月以上，未系统诊治。2年前开始出现气短，活动后加重，为系统诊治来诊。发病以来无胸痛、咯血，无低热、盗汗、乏力，无水肿、少尿，无夜间阵发性呼吸困难    weight=    assistCheck=①血常规：WBC 8.72×109/L，L 22.3%，S 63%，Hb 125g/L，PLT 332×109/L。②动脉血气分析（未吸氧）：pH 7.41，PaO2 72.5mmHg， PaCO2 43mmHg。③肺功能：FEV1占预计值47%；FEV1/FVC 63%。④心电图：正常。⑤胸片：肋间隙增宽，膈肌变平，心脏垂直位，双肺野透光度增加。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性阻塞性肺疾病

呼吸科经典病历27行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=70    personalHistory=退休前是钳工，吸烟40余年，每天20支，未戒烟，无嗜酒    previousHistory=无肝病、慢性肾脏疾病、高血压、冠心病等，无麻疹、百日咳、鼻窦炎病史
    ...    symptom=反复咳嗽、咳痰、喘息25年，活动后气促、心悸10年，加重伴下肢水肿10天#####神志尚清，多语，兴奋，呼吸促，端坐位，球结膜水肿，口唇发绀，颈静脉怒张，肝颈静脉回流征阳性，气管居中，浅表淋巴结不大，胸廓对称，桶状胸，肋间隙增宽，呼吸运动减弱，双肺上叶叩诊过清音，肺肝界位于右锁骨中线第七肋间，听诊双肺肺泡呼吸音减弱，闻及细小喘鸣音，右下肺闻及小水泡音，无胸膜摩擦音，剑突下见心脏搏动，心界不大，心率100次/分，律齐，心音遥远，剑突下心音强，P2＞A2，未闻及奔马律，腹软，无压痛，肝大肋下3cm，叩痛阳性，脾未及，移动性浊音阴性，双下肢水肿，指压痕阳性，无杵状指（趾），余查体正常。 现病史:患者于25年前每于冬春季反复咳嗽、咳痰，咳白色泡沫样痰，晨起重，白天轻，伴喘息，每年持续时间大于3个月。10年前出现活动后心悸气促，曾多次住院予抗炎解痉平喘等治疗好转出院，平素服用氨茶碱片等平喘药物，10天前劳累后发热，体温38.5℃，咳黄痰，每天50ml左右，无咯血，气喘不能平卧，下肢水肿，腹胀，尿少，400ml/d，嗜睡，应用青霉素、头孢菌素、利尿剂，未见好转来诊。    weight=    assistCheck="血常规 WBC 13.2×109/L，S 80%，L 18%，RBC 4.88×1012/L，Hb 150g/L，PLT 333×109/L。CRP 126mg/L。 ESR 110mm /h。心电图 窦性心动过速，肺性P波，右束支传导阻滞，RV1+SV5＞1.05mV电轴右偏，顺钟向转位。 动脉血气分析（未吸氧）pH 7.42，PaCO2 70mmHg，PaO2 42mmHg，HCO－ 40mmol/L。肺部X线：肺动脉段突出，双侧肺门影增大，右下肺动脉干增粗大于15mm，提示存在肺动脉高压。血清支原体抗体（1：320）（+）、军团菌抗体（－）、病毒抗体系列（－）。痰涂片革兰阳性球菌、革兰阴性杆菌生长，痰查结核菌阴性，痰培养待结果。肺功能（床旁）FEV1 占预计值30%，吸入支气管舒张药物（沙丁胺醇）后FEV1/FVC占预计值46%，改善率7%，RV升高，阻塞性通气功能障碍。心脏彩超：右心房内径48mm×35mm，右心室内径23mm，左心室内径45mm，三尖瓣轻度反流，间接测量肺动脉压力为56mmHg，EF56%。肝功能正常，K+ 3.3 mmol/L，Na+ 130mmol/L，Cl－80mmol/L，Cr 96mmol/L，BUN 6.5 mmol/L。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺炎

呼吸科经典病历27行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=70    personalHistory=退休前是钳工，吸烟40余年，每天20支，未戒烟，无嗜酒    previousHistory=无肝病、慢性肾脏疾病、高血压、冠心病等，无麻疹、百日咳、鼻窦炎病史
    ...    symptom=反复咳嗽、咳痰、喘息25年，活动后气促、心悸10年，加重伴下肢水肿10天#####神志尚清，多语，兴奋，呼吸促，端坐位，球结膜水肿，口唇发绀，颈静脉怒张，肝颈静脉回流征阳性，气管居中，浅表淋巴结不大，胸廓对称，桶状胸，肋间隙增宽，呼吸运动减弱，双肺上叶叩诊过清音，肺肝界位于右锁骨中线第七肋间，听诊双肺肺泡呼吸音减弱，闻及细小喘鸣音，右下肺闻及小水泡音，无胸膜摩擦音，剑突下见心脏搏动，心界不大，心率100次/分，律齐，心音遥远，剑突下心音强，P2＞A2，未闻及奔马律，腹软，无压痛，肝大肋下3cm，叩痛阳性，脾未及，移动性浊音阴性，双下肢水肿，指压痕阳性，无杵状指（趾），余查体正常。 现病史:患者于25年前每于冬春季反复咳嗽、咳痰，咳白色泡沫样痰，晨起重，白天轻，伴喘息，每年持续时间大于3个月。10年前出现活动后心悸气促，曾多次住院予抗炎解痉平喘等治疗好转出院，平素服用氨茶碱片等平喘药物，10天前劳累后发热，体温38.5℃，咳黄痰，每天50ml左右，无咯血，气喘不能平卧，下肢水肿，腹胀，尿少，400ml/d，嗜睡，应用青霉素、头孢菌素、利尿剂，未见好转来诊。    weight=    assistCheck="血常规 WBC 13.2×109/L，S 80%，L 18%，RBC 4.88×1012/L，Hb 150g/L，PLT 333×109/L。CRP 126mg/L。 ESR 110mm /h。心电图 窦性心动过速，肺性P波，右束支传导阻滞，RV1+SV5＞1.05mV电轴右偏，顺钟向转位。 动脉血气分析（未吸氧）pH 7.42，PaCO2 70mmHg，PaO2 42mmHg，HCO－ 40mmol/L。肺部X线：肺动脉段突出，双侧肺门影增大，右下肺动脉干增粗大于15mm，提示存在肺动脉高压。血清支原体抗体（1：320）（+）、军团菌抗体（－）、病毒抗体系列（－）。痰涂片革兰阳性球菌、革兰阴性杆菌生长，痰查结核菌阴性，痰培养待结果。肺功能（床旁）FEV1 占预计值30%，吸入支气管舒张药物（沙丁胺醇）后FEV1/FVC占预计值46%，改善率7%，RV升高，阻塞性通气功能障碍。心脏彩超：右心房内径48mm×35mm，右心室内径23mm，左心室内径45mm，三尖瓣轻度反流，间接测量肺动脉压力为56mmHg，EF56%。肝功能正常，K+ 3.3 mmol/L，Na+ 130mmol/L，Cl－80mmol/L，Cr 96mmol/L，BUN 6.5 mmol/L。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性阻塞性肺疾病

呼吸科经典病历27行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=70    personalHistory=退休前是钳工，吸烟40余年，每天20支，未戒烟，无嗜酒    previousHistory=无肝病、慢性肾脏疾病、高血压、冠心病等，无麻疹、百日咳、鼻窦炎病史
    ...    symptom=反复咳嗽、咳痰、喘息25年，活动后气促、心悸10年，加重伴下肢水肿10天#####神志尚清，多语，兴奋，呼吸促，端坐位，球结膜水肿，口唇发绀，颈静脉怒张，肝颈静脉回流征阳性，气管居中，浅表淋巴结不大，胸廓对称，桶状胸，肋间隙增宽，呼吸运动减弱，双肺上叶叩诊过清音，肺肝界位于右锁骨中线第七肋间，听诊双肺肺泡呼吸音减弱，闻及细小喘鸣音，右下肺闻及小水泡音，无胸膜摩擦音，剑突下见心脏搏动，心界不大，心率100次/分，律齐，心音遥远，剑突下心音强，P2＞A2，未闻及奔马律，腹软，无压痛，肝大肋下3cm，叩痛阳性，脾未及，移动性浊音阴性，双下肢水肿，指压痕阳性，无杵状指（趾），余查体正常。 现病史:患者于25年前每于冬春季反复咳嗽、咳痰，咳白色泡沫样痰，晨起重，白天轻，伴喘息，每年持续时间大于3个月。10年前出现活动后心悸气促，曾多次住院予抗炎解痉平喘等治疗好转出院，平素服用氨茶碱片等平喘药物，10天前劳累后发热，体温38.5℃，咳黄痰，每天50ml左右，无咯血，气喘不能平卧，下肢水肿，腹胀，尿少，400ml/d，嗜睡，应用青霉素、头孢菌素、利尿剂，未见好转来诊。    weight=    assistCheck="血常规 WBC 13.2×109/L，S 80%，L 18%，RBC 4.88×1012/L，Hb 150g/L，PLT 333×109/L。CRP 126mg/L。 ESR 110mm /h。心电图 窦性心动过速，肺性P波，右束支传导阻滞，RV1+SV5＞1.05mV电轴右偏，顺钟向转位。 动脉血气分析（未吸氧）pH 7.42，PaCO2 70mmHg，PaO2 42mmHg，HCO－ 40mmol/L。肺部X线：肺动脉段突出，双侧肺门影增大，右下肺动脉干增粗大于15mm，提示存在肺动脉高压。血清支原体抗体（1：320）（+）、军团菌抗体（－）、病毒抗体系列（－）。痰涂片革兰阳性球菌、革兰阴性杆菌生长，痰查结核菌阴性，痰培养待结果。肺功能（床旁）FEV1 占预计值30%，吸入支气管舒张药物（沙丁胺醇）后FEV1/FVC占预计值46%，改善率7%，RV升高，阻塞性通气功能障碍。心脏彩超：右心房内径48mm×35mm，右心室内径23mm，左心室内径45mm，三尖瓣轻度反流，间接测量肺动脉压力为56mmHg，EF56%。肝功能正常，K+ 3.3 mmol/L，Na+ 130mmol/L，Cl－80mmol/L，Cr 96mmol/L，BUN 6.5 mmol/L。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺性脑病

呼吸科经典病历27行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=70    personalHistory=退休前是钳工，吸烟40余年，每天20支，未戒烟，无嗜酒    previousHistory=无肝病、慢性肾脏疾病、高血压、冠心病等，无麻疹、百日咳、鼻窦炎病史
    ...    symptom=反复咳嗽、咳痰、喘息25年，活动后气促、心悸10年，加重伴下肢水肿10天#####神志尚清，多语，兴奋，呼吸促，端坐位，球结膜水肿，口唇发绀，颈静脉怒张，肝颈静脉回流征阳性，气管居中，浅表淋巴结不大，胸廓对称，桶状胸，肋间隙增宽，呼吸运动减弱，双肺上叶叩诊过清音，肺肝界位于右锁骨中线第七肋间，听诊双肺肺泡呼吸音减弱，闻及细小喘鸣音，右下肺闻及小水泡音，无胸膜摩擦音，剑突下见心脏搏动，心界不大，心率100次/分，律齐，心音遥远，剑突下心音强，P2＞A2，未闻及奔马律，腹软，无压痛，肝大肋下3cm，叩痛阳性，脾未及，移动性浊音阴性，双下肢水肿，指压痕阳性，无杵状指（趾），余查体正常。 现病史:患者于25年前每于冬春季反复咳嗽、咳痰，咳白色泡沫样痰，晨起重，白天轻，伴喘息，每年持续时间大于3个月。10年前出现活动后心悸气促，曾多次住院予抗炎解痉平喘等治疗好转出院，平素服用氨茶碱片等平喘药物，10天前劳累后发热，体温38.5℃，咳黄痰，每天50ml左右，无咯血，气喘不能平卧，下肢水肿，腹胀，尿少，400ml/d，嗜睡，应用青霉素、头孢菌素、利尿剂，未见好转来诊。    weight=    assistCheck="血常规 WBC 13.2×109/L，S 80%，L 18%，RBC 4.88×1012/L，Hb 150g/L，PLT 333×109/L。CRP 126mg/L。 ESR 110mm /h。心电图 窦性心动过速，肺性P波，右束支传导阻滞，RV1+SV5＞1.05mV电轴右偏，顺钟向转位。 动脉血气分析（未吸氧）pH 7.42，PaCO2 70mmHg，PaO2 42mmHg，HCO－ 40mmol/L。肺部X线：肺动脉段突出，双侧肺门影增大，右下肺动脉干增粗大于15mm，提示存在肺动脉高压。血清支原体抗体（1：320）（+）、军团菌抗体（－）、病毒抗体系列（－）。痰涂片革兰阳性球菌、革兰阴性杆菌生长，痰查结核菌阴性，痰培养待结果。肺功能（床旁）FEV1 占预计值30%，吸入支气管舒张药物（沙丁胺醇）后FEV1/FVC占预计值46%，改善率7%，RV升高，阻塞性通气功能障碍。心脏彩超：右心房内径48mm×35mm，右心室内径23mm，左心室内径45mm，三尖瓣轻度反流，间接测量肺动脉压力为56mmHg，EF56%。肝功能正常，K+ 3.3 mmol/L，Na+ 130mmol/L，Cl－80mmol/L，Cr 96mmol/L，BUN 6.5 mmol/L。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    呼吸衰竭

呼吸科经典病历27行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=70    personalHistory=退休前是钳工，吸烟40余年，每天20支，未戒烟，无嗜酒    previousHistory=无肝病、慢性肾脏疾病、高血压、冠心病等，无麻疹、百日咳、鼻窦炎病史
    ...    symptom=反复咳嗽、咳痰、喘息25年，活动后气促、心悸10年，加重伴下肢水肿10天#####神志尚清，多语，兴奋，呼吸促，端坐位，球结膜水肿，口唇发绀，颈静脉怒张，肝颈静脉回流征阳性，气管居中，浅表淋巴结不大，胸廓对称，桶状胸，肋间隙增宽，呼吸运动减弱，双肺上叶叩诊过清音，肺肝界位于右锁骨中线第七肋间，听诊双肺肺泡呼吸音减弱，闻及细小喘鸣音，右下肺闻及小水泡音，无胸膜摩擦音，剑突下见心脏搏动，心界不大，心率100次/分，律齐，心音遥远，剑突下心音强，P2＞A2，未闻及奔马律，腹软，无压痛，肝大肋下3cm，叩痛阳性，脾未及，移动性浊音阴性，双下肢水肿，指压痕阳性，无杵状指（趾），余查体正常。 现病史:患者于25年前每于冬春季反复咳嗽、咳痰，咳白色泡沫样痰，晨起重，白天轻，伴喘息，每年持续时间大于3个月。10年前出现活动后心悸气促，曾多次住院予抗炎解痉平喘等治疗好转出院，平素服用氨茶碱片等平喘药物，10天前劳累后发热，体温38.5℃，咳黄痰，每天50ml左右，无咯血，气喘不能平卧，下肢水肿，腹胀，尿少，400ml/d，嗜睡，应用青霉素、头孢菌素、利尿剂，未见好转来诊。    weight=    assistCheck="血常规 WBC 13.2×109/L，S 80%，L 18%，RBC 4.88×1012/L，Hb 150g/L，PLT 333×109/L。CRP 126mg/L。 ESR 110mm /h。心电图 窦性心动过速，肺性P波，右束支传导阻滞，RV1+SV5＞1.05mV电轴右偏，顺钟向转位。 动脉血气分析（未吸氧）pH 7.42，PaCO2 70mmHg，PaO2 42mmHg，HCO－ 40mmol/L。肺部X线：肺动脉段突出，双侧肺门影增大，右下肺动脉干增粗大于15mm，提示存在肺动脉高压。血清支原体抗体（1：320）（+）、军团菌抗体（－）、病毒抗体系列（－）。痰涂片革兰阳性球菌、革兰阴性杆菌生长，痰查结核菌阴性，痰培养待结果。肺功能（床旁）FEV1 占预计值30%，吸入支气管舒张药物（沙丁胺醇）后FEV1/FVC占预计值46%，改善率7%，RV升高，阻塞性通气功能障碍。心脏彩超：右心房内径48mm×35mm，右心室内径23mm，左心室内径45mm，三尖瓣轻度反流，间接测量肺动脉压力为56mmHg，EF56%。肝功能正常，K+ 3.3 mmol/L，Na+ 130mmol/L，Cl－80mmol/L，Cr 96mmol/L，BUN 6.5 mmol/L。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性肺源性心脏病

呼吸科经典病历27行-6
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=65    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=70    personalHistory=退休前是钳工，吸烟40余年，每天20支，未戒烟，无嗜酒    previousHistory=无肝病、慢性肾脏疾病、高血压、冠心病等，无麻疹、百日咳、鼻窦炎病史
    ...    symptom=反复咳嗽、咳痰、喘息25年，活动后气促、心悸10年，加重伴下肢水肿10天#####神志尚清，多语，兴奋，呼吸促，端坐位，球结膜水肿，口唇发绀，颈静脉怒张，肝颈静脉回流征阳性，气管居中，浅表淋巴结不大，胸廓对称，桶状胸，肋间隙增宽，呼吸运动减弱，双肺上叶叩诊过清音，肺肝界位于右锁骨中线第七肋间，听诊双肺肺泡呼吸音减弱，闻及细小喘鸣音，右下肺闻及小水泡音，无胸膜摩擦音，剑突下见心脏搏动，心界不大，心率100次/分，律齐，心音遥远，剑突下心音强，P2＞A2，未闻及奔马律，腹软，无压痛，肝大肋下3cm，叩痛阳性，脾未及，移动性浊音阴性，双下肢水肿，指压痕阳性，无杵状指（趾），余查体正常。 现病史:患者于25年前每于冬春季反复咳嗽、咳痰，咳白色泡沫样痰，晨起重，白天轻，伴喘息，每年持续时间大于3个月。10年前出现活动后心悸气促，曾多次住院予抗炎解痉平喘等治疗好转出院，平素服用氨茶碱片等平喘药物，10天前劳累后发热，体温38.5℃，咳黄痰，每天50ml左右，无咯血，气喘不能平卧，下肢水肿，腹胀，尿少，400ml/d，嗜睡，应用青霉素、头孢菌素、利尿剂，未见好转来诊。    weight=    assistCheck="血常规 WBC 13.2×109/L，S 80%，L 18%，RBC 4.88×1012/L，Hb 150g/L，PLT 333×109/L。CRP 126mg/L。 ESR 110mm /h。心电图 窦性心动过速，肺性P波，右束支传导阻滞，RV1+SV5＞1.05mV电轴右偏，顺钟向转位。 动脉血气分析（未吸氧）pH 7.42，PaCO2 70mmHg，PaO2 42mmHg，HCO－ 40mmol/L。肺部X线：肺动脉段突出，双侧肺门影增大，右下肺动脉干增粗大于15mm，提示存在肺动脉高压。血清支原体抗体（1：320）（+）、军团菌抗体（－）、病毒抗体系列（－）。痰涂片革兰阳性球菌、革兰阴性杆菌生长，痰查结核菌阴性，痰培养待结果。肺功能（床旁）FEV1 占预计值30%，吸入支气管舒张药物（沙丁胺醇）后FEV1/FVC占预计值46%，改善率7%，RV升高，阻塞性通气功能障碍。心脏彩超：右心房内径48mm×35mm，右心室内径23mm，左心室内径45mm，三尖瓣轻度反流，间接测量肺动脉压力为56mmHg，EF56%。肝功能正常，K+ 3.3 mmol/L，Na+ 130mmol/L，Cl－80mmol/L，Cr 96mmol/L，BUN 6.5 mmol/L。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    心功能不全

呼吸科经典病历28行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=出租车司机，吸烟20余年，每日20～30支；饮酒10余年，每日白酒约2两至半斤，啤酒1～2瓶。    previousHistory=既往无慢性心肺疾病。近10年因体型发胖、夜间睡眠打鼾，但无夜间憋醒史。双下肢静脉曲张6年。无肝炎结核病接触史。无疫区居住史。无有毒害气体和粉尘接触史。反复口腔溃疡8年，近3年曾出现3次外生殖器溃疡，因能自愈未就诊。曾在2年前患过眼病，被诊断为虹膜炎。
    ...    symptom=心悸、气短2年，加重2周#####发育正常，营养良好，体型肥胖，神志清楚，呼吸稍促，自主体位。浅表淋巴结无肿大。口唇轻度发绀，巩膜无黄染，颈部无增粗，颈静脉怒张，肝颈静脉回流征阳性。无奇脉。胸廓对称，无畸形，胸壁静脉无曲张，两肺呼吸音清，未闻及干、湿啰音。心前区无隆起，心界不大，肺动脉瓣区第二心音亢进，心率112次/分，心律齐，心音有力，三尖瓣区可闻及收缩期杂音，余瓣膜区未闻及病理性杂音。腹软，全腹无压痛、反跳痛，肝肋下2cm，有轻微触痛，脾未触及，无腹水征。双下肢静脉曲张，胫前凹陷性水肿，无杵状指（趾）。脊柱四肢无畸形，活动自如。神经系统查体未见异常 现病史:2年前上六楼后感觉心悸、气短，休息后可缓解，自认为与近年来体重增加、运动量减少有关，因不影响工作和生活，未介意。平素无咳嗽及咳痰，无胸痛及咯血，无晕厥。近2周轻微活动后即感心悸、气短，上二楼即出现症状加重，经休息可缓解，伴食欲减退、腹胀、乏力，发现双脚水肿。发病以来无夜间阵发性呼吸困难和发作性喘息，无胸痛和咯血、无发热和咳嗽。睡眠欠佳、二便正常。为明确诊断就诊。    weight=    assistCheck=①血尿常规、肝肾功能、血离子、凝血三项均正常。D-二聚体2.6mg/ml。②胸部X线：双肺野透光度正常，右肺下动脉横径17mm（≥15mm），肺动脉段横径膨隆（≥20mm）。③肺动脉增强加薄层CT：双肺动脉主干和分支腔内未见充盈缺损，双肺中下野轻度纤维条索状阴影，无蜂窝改变；纵隔及肺门淋巴结无肿大；胸膜未见异常。④肺功能提示肺通气功能和小气道功能正常，弥散DLCO占预计值65%。⑤血气分析：pH 7.35，PaO2 55mmHg（未吸氧），PaCO224mmHg。⑥心电图：肺型P波，电轴右偏，不完全性右束支传导阻滞。⑦超声心动图：右心室内径25mm（≥20mm），右心室流出道内径 36mm（≥30mm），右肺动脉内径增宽20mm（≥18mm）。⑧双下肢深静脉彩超未见血栓形成。肝胆脾彩超提示轻度脂肪肝，余正常。⑨血沉72mm/h、CRP 70.9mg/L、类风湿因子（+）、抗O抗体＜200IU/ ml。双链DNA（－）、抗核抗体（－）、ENA谱（－），抗中性粒细胞胞浆抗体（ANCA）（－）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺动脉高压

呼吸科经典病历28行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=出租车司机，吸烟20余年，每日20～30支；饮酒10余年，每日白酒约2两至半斤，啤酒1～2瓶。    previousHistory=既往无慢性心肺疾病。近10年因体型发胖、夜间睡眠打鼾，但无夜间憋醒史。双下肢静脉曲张6年。无肝炎结核病接触史。无疫区居住史。无有毒害气体和粉尘接触史。反复口腔溃疡8年，近3年曾出现3次外生殖器溃疡，因能自愈未就诊。曾在2年前患过眼病，被诊断为虹膜炎。
    ...    symptom=心悸、气短2年，加重2周#####发育正常，营养良好，体型肥胖，神志清楚，呼吸稍促，自主体位。浅表淋巴结无肿大。口唇轻度发绀，巩膜无黄染，颈部无增粗，颈静脉怒张，肝颈静脉回流征阳性。无奇脉。胸廓对称，无畸形，胸壁静脉无曲张，两肺呼吸音清，未闻及干、湿啰音。心前区无隆起，心界不大，肺动脉瓣区第二心音亢进，心率112次/分，心律齐，心音有力，三尖瓣区可闻及收缩期杂音，余瓣膜区未闻及病理性杂音。腹软，全腹无压痛、反跳痛，肝肋下2cm，有轻微触痛，脾未触及，无腹水征。双下肢静脉曲张，胫前凹陷性水肿，无杵状指（趾）。脊柱四肢无畸形，活动自如。神经系统查体未见异常 现病史:2年前上六楼后感觉心悸、气短，休息后可缓解，自认为与近年来体重增加、运动量减少有关，因不影响工作和生活，未介意。平素无咳嗽及咳痰，无胸痛及咯血，无晕厥。近2周轻微活动后即感心悸、气短，上二楼即出现症状加重，经休息可缓解，伴食欲减退、腹胀、乏力，发现双脚水肿。发病以来无夜间阵发性呼吸困难和发作性喘息，无胸痛和咯血、无发热和咳嗽。睡眠欠佳、二便正常。为明确诊断就诊。    weight=    assistCheck=①血尿常规、肝肾功能、血离子、凝血三项均正常。D-二聚体2.6mg/ml。②胸部X线：双肺野透光度正常，右肺下动脉横径17mm（≥15mm），肺动脉段横径膨隆（≥20mm）。③肺动脉增强加薄层CT：双肺动脉主干和分支腔内未见充盈缺损，双肺中下野轻度纤维条索状阴影，无蜂窝改变；纵隔及肺门淋巴结无肿大；胸膜未见异常。④肺功能提示肺通气功能和小气道功能正常，弥散DLCO占预计值65%。⑤血气分析：pH 7.35，PaO2 55mmHg（未吸氧），PaCO224mmHg。⑥心电图：肺型P波，电轴右偏，不完全性右束支传导阻滞。⑦超声心动图：右心室内径25mm（≥20mm），右心室流出道内径 36mm（≥30mm），右肺动脉内径增宽20mm（≥18mm）。⑧双下肢深静脉彩超未见血栓形成。肝胆脾彩超提示轻度脂肪肝，余正常。⑨血沉72mm/h、CRP 70.9mg/L、类风湿因子（+）、抗O抗体＜200IU/ ml。双链DNA（－）、抗核抗体（－）、ENA谱（－），抗中性粒细胞胞浆抗体（ANCA）（－）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    贝赫切特综合征

呼吸科经典病历28行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=出租车司机，吸烟20余年，每日20～30支；饮酒10余年，每日白酒约2两至半斤，啤酒1～2瓶。    previousHistory=既往无慢性心肺疾病。近10年因体型发胖、夜间睡眠打鼾，但无夜间憋醒史。双下肢静脉曲张6年。无肝炎结核病接触史。无疫区居住史。无有毒害气体和粉尘接触史。反复口腔溃疡8年，近3年曾出现3次外生殖器溃疡，因能自愈未就诊。曾在2年前患过眼病，被诊断为虹膜炎。
    ...    symptom=心悸、气短2年，加重2周#####发育正常，营养良好，体型肥胖，神志清楚，呼吸稍促，自主体位。浅表淋巴结无肿大。口唇轻度发绀，巩膜无黄染，颈部无增粗，颈静脉怒张，肝颈静脉回流征阳性。无奇脉。胸廓对称，无畸形，胸壁静脉无曲张，两肺呼吸音清，未闻及干、湿啰音。心前区无隆起，心界不大，肺动脉瓣区第二心音亢进，心率112次/分，心律齐，心音有力，三尖瓣区可闻及收缩期杂音，余瓣膜区未闻及病理性杂音。腹软，全腹无压痛、反跳痛，肝肋下2cm，有轻微触痛，脾未触及，无腹水征。双下肢静脉曲张，胫前凹陷性水肿，无杵状指（趾）。脊柱四肢无畸形，活动自如。神经系统查体未见异常 现病史:2年前上六楼后感觉心悸、气短，休息后可缓解，自认为与近年来体重增加、运动量减少有关，因不影响工作和生活，未介意。平素无咳嗽及咳痰，无胸痛及咯血，无晕厥。近2周轻微活动后即感心悸、气短，上二楼即出现症状加重，经休息可缓解，伴食欲减退、腹胀、乏力，发现双脚水肿。发病以来无夜间阵发性呼吸困难和发作性喘息，无胸痛和咯血、无发热和咳嗽。睡眠欠佳、二便正常。为明确诊断就诊。    weight=    assistCheck=①血尿常规、肝肾功能、血离子、凝血三项均正常。D-二聚体2.6mg/ml。②胸部X线：双肺野透光度正常，右肺下动脉横径17mm（≥15mm），肺动脉段横径膨隆（≥20mm）。③肺动脉增强加薄层CT：双肺动脉主干和分支腔内未见充盈缺损，双肺中下野轻度纤维条索状阴影，无蜂窝改变；纵隔及肺门淋巴结无肿大；胸膜未见异常。④肺功能提示肺通气功能和小气道功能正常，弥散DLCO占预计值65%。⑤血气分析：pH 7.35，PaO2 55mmHg（未吸氧），PaCO224mmHg。⑥心电图：肺型P波，电轴右偏，不完全性右束支传导阻滞。⑦超声心动图：右心室内径25mm（≥20mm），右心室流出道内径 36mm（≥30mm），右肺动脉内径增宽20mm（≥18mm）。⑧双下肢深静脉彩超未见血栓形成。肝胆脾彩超提示轻度脂肪肝，余正常。⑨血沉72mm/h、CRP 70.9mg/L、类风湿因子（+）、抗O抗体＜200IU/ ml。双链DNA（－）、抗核抗体（－）、ENA谱（－），抗中性粒细胞胞浆抗体（ANCA）（－）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

呼吸科经典病历28行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=36.2    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=出租车司机，吸烟20余年，每日20～30支；饮酒10余年，每日白酒约2两至半斤，啤酒1～2瓶。    previousHistory=既往无慢性心肺疾病。近10年因体型发胖、夜间睡眠打鼾，但无夜间憋醒史。双下肢静脉曲张6年。无肝炎结核病接触史。无疫区居住史。无有毒害气体和粉尘接触史。反复口腔溃疡8年，近3年曾出现3次外生殖器溃疡，因能自愈未就诊。曾在2年前患过眼病，被诊断为虹膜炎。
    ...    symptom=心悸、气短2年，加重2周#####发育正常，营养良好，体型肥胖，神志清楚，呼吸稍促，自主体位。浅表淋巴结无肿大。口唇轻度发绀，巩膜无黄染，颈部无增粗，颈静脉怒张，肝颈静脉回流征阳性。无奇脉。胸廓对称，无畸形，胸壁静脉无曲张，两肺呼吸音清，未闻及干、湿啰音。心前区无隆起，心界不大，肺动脉瓣区第二心音亢进，心率112次/分，心律齐，心音有力，三尖瓣区可闻及收缩期杂音，余瓣膜区未闻及病理性杂音。腹软，全腹无压痛、反跳痛，肝肋下2cm，有轻微触痛，脾未触及，无腹水征。双下肢静脉曲张，胫前凹陷性水肿，无杵状指（趾）。脊柱四肢无畸形，活动自如。神经系统查体未见异常 现病史:2年前上六楼后感觉心悸、气短，休息后可缓解，自认为与近年来体重增加、运动量减少有关，因不影响工作和生活，未介意。平素无咳嗽及咳痰，无胸痛及咯血，无晕厥。近2周轻微活动后即感心悸、气短，上二楼即出现症状加重，经休息可缓解，伴食欲减退、腹胀、乏力，发现双脚水肿。发病以来无夜间阵发性呼吸困难和发作性喘息，无胸痛和咯血、无发热和咳嗽。睡眠欠佳、二便正常。为明确诊断就诊。    weight=    assistCheck=①血尿常规、肝肾功能、血离子、凝血三项均正常。D-二聚体2.6mg/ml。②胸部X线：双肺野透光度正常，右肺下动脉横径17mm（≥15mm），肺动脉段横径膨隆（≥20mm）。③肺动脉增强加薄层CT：双肺动脉主干和分支腔内未见充盈缺损，双肺中下野轻度纤维条索状阴影，无蜂窝改变；纵隔及肺门淋巴结无肿大；胸膜未见异常。④肺功能提示肺通气功能和小气道功能正常，弥散DLCO占预计值65%。⑤血气分析：pH 7.35，PaO2 55mmHg（未吸氧），PaCO224mmHg。⑥心电图：肺型P波，电轴右偏，不完全性右束支传导阻滞。⑦超声心动图：右心室内径25mm（≥20mm），右心室流出道内径 36mm（≥30mm），右肺动脉内径增宽20mm（≥18mm）。⑧双下肢深静脉彩超未见血栓形成。肝胆脾彩超提示轻度脂肪肝，余正常。⑨血沉72mm/h、CRP 70.9mg/L、类风湿因子（+）、抗O抗体＜200IU/ ml。双链DNA（－）、抗核抗体（－）、ENA谱（－），抗中性粒细胞胞浆抗体（ANCA）（－）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    右心衰竭

呼吸科经典病历29行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=140    lowBldPress=80    personalHistory=患者现退休，曾是市机车厂职工。既往吸烟50年，每日30支。    previousHistory=
    ...    symptom=反复咳嗽、咳痰30余年，活动后气短10余年，双下肢水肿5年，加重8天#####神志清楚，呼吸略促，自主体位，球结膜轻度水肿，口唇发绀，气管居中，无三凹征。浅表淋巴结未触及，颈静脉充盈。胸廓对称，双侧呼吸运动减弱，双肺散在小水泡音，心率102次/分，律齐，剑突下心脏搏动明显增强，P2＞A2，肝界下移，肝大、肋下3cm，无触痛，双下肢指压痕（+），未见杵状指，四肢末梢发绀。 现病史:30多年来，患者反复于冬春季节出现咳嗽、咳痰，痰多呈白色泡沫状，易咳出。10余年来逐渐出现气短，活动后加重，近5年出现心悸、尿少，伴双下肢水肿。8天前感冒后上述症状加重，神志恍惚，咳黄痰，气短加重，伴心悸、尿少、双下肢水肿，无发热，为求进一步诊治来急诊。在急诊行呼吸机辅助通气及抗炎、解痉、利尿治疗4天，为进一步诊治转入病房。发病以来患者无发热及盗汗，无咯血及胸痛。    weight=    assistCheck=血WBC 14.1×109/L，S 90.11%，PLT 344×109/L；尿蛋白（+）；肝、肾功能正常，血K+ 3.0mmol/L，Na+正常，Cl－89mmol/L；血清支原体、衣原体、军团菌、病毒抗体、结核抗体检测及1,3-b-D葡聚糖均阴性；痰涂片找到革兰阳性球菌及革兰阴性杆菌；痰培养肺炎克雷伯杆菌生长；血气分析（呼吸机辅助呼吸，吸氧浓度35%）：pH 7.447、PaO257.1mmHg、PaCO273.8mmHg、HCO3－43 mmol/L；心电图示电轴右偏，肺型P波，右心室肥大；床头胸片示双肺透过度强，双肺下纹理模糊，心影增大，肋膈角尚锐利。因病情重未行肺功能及心脏彩超检查    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性阻塞性肺疾病

呼吸科经典病历29行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=140    lowBldPress=80    personalHistory=患者现退休，曾是市机车厂职工。既往吸烟50年，每日30支。    previousHistory=
    ...    symptom=反复咳嗽、咳痰30余年，活动后气短10余年，双下肢水肿5年，加重8天#####神志清楚，呼吸略促，自主体位，球结膜轻度水肿，口唇发绀，气管居中，无三凹征。浅表淋巴结未触及，颈静脉充盈。胸廓对称，双侧呼吸运动减弱，双肺散在小水泡音，心率102次/分，律齐，剑突下心脏搏动明显增强，P2＞A2，肝界下移，肝大、肋下3cm，无触痛，双下肢指压痕（+），未见杵状指，四肢末梢发绀。 现病史:30多年来，患者反复于冬春季节出现咳嗽、咳痰，痰多呈白色泡沫状，易咳出。10余年来逐渐出现气短，活动后加重，近5年出现心悸、尿少，伴双下肢水肿。8天前感冒后上述症状加重，神志恍惚，咳黄痰，气短加重，伴心悸、尿少、双下肢水肿，无发热，为求进一步诊治来急诊。在急诊行呼吸机辅助通气及抗炎、解痉、利尿治疗4天，为进一步诊治转入病房。发病以来患者无发热及盗汗，无咯血及胸痛。    weight=    assistCheck=血WBC 14.1×109/L，S 90.11%，PLT 344×109/L；尿蛋白（+）；肝、肾功能正常，血K+ 3.0mmol/L，Na+正常，Cl－89mmol/L；血清支原体、衣原体、军团菌、病毒抗体、结核抗体检测及1,3-b-D葡聚糖均阴性；痰涂片找到革兰阳性球菌及革兰阴性杆菌；痰培养肺炎克雷伯杆菌生长；血气分析（呼吸机辅助呼吸，吸氧浓度35%）：pH 7.447、PaO257.1mmHg、PaCO273.8mmHg、HCO3－43 mmol/L；心电图示电轴右偏，肺型P波，右心室肥大；床头胸片示双肺透过度强，双肺下纹理模糊，心影增大，肋膈角尚锐利。因病情重未行肺功能及心脏彩超检查    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺性脑病

呼吸科经典病历29行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=140    lowBldPress=80    personalHistory=患者现退休，曾是市机车厂职工。既往吸烟50年，每日30支。    previousHistory=
    ...    symptom=反复咳嗽、咳痰30余年，活动后气短10余年，双下肢水肿5年，加重8天#####神志清楚，呼吸略促，自主体位，球结膜轻度水肿，口唇发绀，气管居中，无三凹征。浅表淋巴结未触及，颈静脉充盈。胸廓对称，双侧呼吸运动减弱，双肺散在小水泡音，心率102次/分，律齐，剑突下心脏搏动明显增强，P2＞A2，肝界下移，肝大、肋下3cm，无触痛，双下肢指压痕（+），未见杵状指，四肢末梢发绀。 现病史:30多年来，患者反复于冬春季节出现咳嗽、咳痰，痰多呈白色泡沫状，易咳出。10余年来逐渐出现气短，活动后加重，近5年出现心悸、尿少，伴双下肢水肿。8天前感冒后上述症状加重，神志恍惚，咳黄痰，气短加重，伴心悸、尿少、双下肢水肿，无发热，为求进一步诊治来急诊。在急诊行呼吸机辅助通气及抗炎、解痉、利尿治疗4天，为进一步诊治转入病房。发病以来患者无发热及盗汗，无咯血及胸痛。    weight=    assistCheck=血WBC 14.1×109/L，S 90.11%，PLT 344×109/L；尿蛋白（+）；肝、肾功能正常，血K+ 3.0mmol/L，Na+正常，Cl－89mmol/L；血清支原体、衣原体、军团菌、病毒抗体、结核抗体检测及1,3-b-D葡聚糖均阴性；痰涂片找到革兰阳性球菌及革兰阴性杆菌；痰培养肺炎克雷伯杆菌生长；血气分析（呼吸机辅助呼吸，吸氧浓度35%）：pH 7.447、PaO257.1mmHg、PaCO273.8mmHg、HCO3－43 mmol/L；心电图示电轴右偏，肺型P波，右心室肥大；床头胸片示双肺透过度强，双肺下纹理模糊，心影增大，肋膈角尚锐利。因病情重未行肺功能及心脏彩超检查    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历29行-4
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=140    lowBldPress=80    personalHistory=患者现退休，曾是市机车厂职工。既往吸烟50年，每日30支。    previousHistory=
    ...    symptom=反复咳嗽、咳痰30余年，活动后气短10余年，双下肢水肿5年，加重8天#####神志清楚，呼吸略促，自主体位，球结膜轻度水肿，口唇发绀，气管居中，无三凹征。浅表淋巴结未触及，颈静脉充盈。胸廓对称，双侧呼吸运动减弱，双肺散在小水泡音，心率102次/分，律齐，剑突下心脏搏动明显增强，P2＞A2，肝界下移，肝大、肋下3cm，无触痛，双下肢指压痕（+），未见杵状指，四肢末梢发绀。 现病史:30多年来，患者反复于冬春季节出现咳嗽、咳痰，痰多呈白色泡沫状，易咳出。10余年来逐渐出现气短，活动后加重，近5年出现心悸、尿少，伴双下肢水肿。8天前感冒后上述症状加重，神志恍惚，咳黄痰，气短加重，伴心悸、尿少、双下肢水肿，无发热，为求进一步诊治来急诊。在急诊行呼吸机辅助通气及抗炎、解痉、利尿治疗4天，为进一步诊治转入病房。发病以来患者无发热及盗汗，无咯血及胸痛。    weight=    assistCheck=血WBC 14.1×109/L，S 90.11%，PLT 344×109/L；尿蛋白（+）；肝、肾功能正常，血K+ 3.0mmol/L，Na+正常，Cl－89mmol/L；血清支原体、衣原体、军团菌、病毒抗体、结核抗体检测及1,3-b-D葡聚糖均阴性；痰涂片找到革兰阳性球菌及革兰阴性杆菌；痰培养肺炎克雷伯杆菌生长；血气分析（呼吸机辅助呼吸，吸氧浓度35%）：pH 7.447、PaO257.1mmHg、PaCO273.8mmHg、HCO3－43 mmol/L；心电图示电轴右偏，肺型P波，右心室肥大；床头胸片示双肺透过度强，双肺下纹理模糊，心影增大，肋膈角尚锐利。因病情重未行肺功能及心脏彩超检查    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    慢性肺源性心脏病

呼吸科经典病历29行-5
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=71    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=120    highBldPress=140    lowBldPress=80    personalHistory=患者现退休，曾是市机车厂职工。既往吸烟50年，每日30支。    previousHistory=
    ...    symptom=反复咳嗽、咳痰30余年，活动后气短10余年，双下肢水肿5年，加重8天#####神志清楚，呼吸略促，自主体位，球结膜轻度水肿，口唇发绀，气管居中，无三凹征。浅表淋巴结未触及，颈静脉充盈。胸廓对称，双侧呼吸运动减弱，双肺散在小水泡音，心率102次/分，律齐，剑突下心脏搏动明显增强，P2＞A2，肝界下移，肝大、肋下3cm，无触痛，双下肢指压痕（+），未见杵状指，四肢末梢发绀。 现病史:30多年来，患者反复于冬春季节出现咳嗽、咳痰，痰多呈白色泡沫状，易咳出。10余年来逐渐出现气短，活动后加重，近5年出现心悸、尿少，伴双下肢水肿。8天前感冒后上述症状加重，神志恍惚，咳黄痰，气短加重，伴心悸、尿少、双下肢水肿，无发热，为求进一步诊治来急诊。在急诊行呼吸机辅助通气及抗炎、解痉、利尿治疗4天，为进一步诊治转入病房。发病以来患者无发热及盗汗，无咯血及胸痛。    weight=    assistCheck=血WBC 14.1×109/L，S 90.11%，PLT 344×109/L；尿蛋白（+）；肝、肾功能正常，血K+ 3.0mmol/L，Na+正常，Cl－89mmol/L；血清支原体、衣原体、军团菌、病毒抗体、结核抗体检测及1,3-b-D葡聚糖均阴性；痰涂片找到革兰阳性球菌及革兰阴性杆菌；痰培养肺炎克雷伯杆菌生长；血气分析（呼吸机辅助呼吸，吸氧浓度35%）：pH 7.447、PaO257.1mmHg、PaCO273.8mmHg、HCO3－43 mmol/L；心电图示电轴右偏，肺型P波，右心室肥大；床头胸片示双肺透过度强，双肺下纹理模糊，心影增大，肋膈角尚锐利。因病情重未行肺功能及心脏彩超检查    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心功能不全

呼吸科经典病历30行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=25    ageType=岁    allergyHistory=无    bodyTempr=38.3    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=110    lowBldPress=70    personalHistory=在读研究生    previousHistory=既往身体健康
    ...    symptom=发热、咳嗽10天#####神清，结膜无充血，口唇无发绀，咽赤，气管居中，锁骨上及腋窝淋巴结未触及。胸廓对称，双侧呼吸运动一致。双肺听诊呼吸音清，左下肺偶可闻及少量干啰音。心界不大，心率96次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软无压痛，肝大肋下1cm，无触痛，脾肋下未触及。未见皮疹。四肢神经系统检查未见异常。 现病史:患者10天前无明显诱因出现发热、体温37.5～38.5℃、无特殊规律，无寒战、无盗汗，咳嗽为干咳、呈阵发性，自服“阿莫西林”5天，症状无缓解，遂入我院进一步治疗。发病以来有咽痛，无胸痛气短，自觉乏力，食欲差，无腹痛腹泻，尿色及尿量正常，精神状态差，体重无明显下降。    weight=    assistCheck=1.血常规：WBC 10.9×109/L，S 75%，L 21%，E 1%，RBC 3.58×1012/L，Hb 127g/ L，PLT 145×109/L。CRP正常，ESR：43mm/h。2.血清军团菌、病毒、结核抗体检查阴性。3.肝功能：AST 87U/L，ALT 94U/L，余正常。4.肺CT示左下肺斑片影。5PPD试验：硬结直径6mm×8mm。6.肺炎支原体、军团菌抗体，支原体抗体IgM 1∶80阳性，IgG阴性.    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺炎支原体性肺炎

呼吸科经典病历31行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=85    ageType=岁    allergyHistory=    bodyTempr=38.9    familyHistory=
    ...    gender=0    heartRate=70    highBldPress=86    lowBldPress=130    personalHistory=退休工人    previousHistory=患者既往无慢性呼吸系统疾病，5个月前曾因患膀胱癌行电切术，未予放化疗
    ...    symptom=发热，咳嗽，咳痰带血1个月#####神志清晰，呼吸略促，自主体位，口唇无发绀，浅表淋巴结未触及，气管居中，无三凹征。胸廓对称，双侧呼吸运动一致，双肺触觉语颤对称，无增强或减弱，叩诊双肺呈清音，听诊双肺呼吸音粗，中下野闻及散在水泡音，无胸膜摩擦音。心界不大，心音纯，律齐，HR 86次/分，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查无异常。 现病史:1个月前无明确诱因出现发热，体温可达40℃，伴咳嗽，咳白色黏痰，偶有痰中带血，轻度气短，应用抗生素治疗，疗效不佳，仍高热不退，咳血性黏痰，遂来诊    weight=    assistCheck=①血常规：WBC 11.2×109/L，S 75%，L 15%，M 10%，RBC 5.9×1012/L，Hb 105g/L，PLT 250×109/L。②血清支原体抗体、军团菌抗体、结核抗体：阴性。③痰细菌涂片：查到革兰阳性球菌。④痰查菌丝孢子、痰查结核杆菌：阴性。⑤痰菌培养未生长细菌、真菌⑥动脉血气分析（未吸氧）：pH 7.486，PaO2 62.1mmHg，PaCO2 34.7mmHg。⑦胸部CT：双肺多发结节空洞影，主要分布在双肺周边部。⑧1,3-b-D葡聚糖80pg/ml（正常值＜10pg/ml）⑨血培养未生长细菌。⑩肺穿刺活检证实为烟曲霉菌感染    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    侵入性肺曲霉病

呼吸科经典病历31行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=85    ageType=岁    allergyHistory=    bodyTempr=38.9    familyHistory=
    ...    gender=0    heartRate=70    highBldPress=86    lowBldPress=130    personalHistory=退休工人    previousHistory=患者既往无慢性呼吸系统疾病，5个月前曾因患膀胱癌行电切术，未予放化疗
    ...    symptom=发热，咳嗽，咳痰带血1个月#####神志清晰，呼吸略促，自主体位，口唇无发绀，浅表淋巴结未触及，气管居中，无三凹征。胸廓对称，双侧呼吸运动一致，双肺触觉语颤对称，无增强或减弱，叩诊双肺呈清音，听诊双肺呼吸音粗，中下野闻及散在水泡音，无胸膜摩擦音。心界不大，心音纯，律齐，HR 86次/分，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查无异常。 现病史:1个月前无明确诱因出现发热，体温可达40℃，伴咳嗽，咳白色黏痰，偶有痰中带血，轻度气短，应用抗生素治疗，疗效不佳，仍高热不退，咳血性黏痰，遂来诊    weight=    assistCheck=①血常规：WBC 11.2×109/L，S 75%，L 15%，M 10%，RBC 5.9×1012/L，Hb 105g/L，PLT 250×109/L。②血清支原体抗体、军团菌抗体、结核抗体：阴性。③痰细菌涂片：查到革兰阳性球菌。④痰查菌丝孢子、痰查结核杆菌：阴性。⑤痰菌培养未生长细菌、真菌⑥动脉血气分析（未吸氧）：pH 7.486，PaO2 62.1mmHg，PaCO2 34.7mmHg。⑦胸部CT：双肺多发结节空洞影，主要分布在双肺周边部。⑧1,3-b-D葡聚糖80pg/ml（正常值＜10pg/ml）⑨血培养未生长细菌。⑩肺穿刺活检证实为烟曲霉菌感染    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺曲霉病

呼吸科经典病历32行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=无药物过敏史    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=80    personalHistory=患者是纺织工人，月经正常。    previousHistory=既往健康，无烟酒嗜好，无结核病患者密切接触史。无外地居住及旅游史。无有毒有害等气体接触，平素无特殊嗜好。丈夫健康，无不良嗜好及不洁生活史，无冶游史，患者孕2次，自然顺产1次，8年前因宫外孕大出血，失血性休克于当地输血800ml。患者既往输血史。
    ...    symptom=发热2个月，咳嗽20余天#####发育正常、营养良好、神志清楚、热病容，自主体位。皮肤黏膜无出血点和皮疹。浅表淋巴结无肿大，睑结膜充血，巩膜无黄染，口唇轻度发绀，咽黏膜充血，扁桃体Ⅱ°肿大，无脓点。颈软，气管居中，甲状腺不大。胸廓无畸形，双肺呼吸动度一致，触觉语颤正常，双肺叩诊清音。双肺呼吸音粗糙，未闻及干湿啰音。心界不大，心率90次/分，心律齐，各瓣膜听诊区未闻及杂音。腹平软，未触及包块，肝脾肋下未触及。脊柱四肢活动正常，无畸形。生理反射存在，病理反射未引出。 现病史:2个月前无明显诱因出现发热，体温在37.9～38.7℃，以午后和夜间为著，伴乏力，无发冷及盗汗，自以为“感冒”未介意。2周后病情未见好转，就诊于当地医院，化验血常规WBC 5.8×109/L、S 90%，尿常规正常，支原体抗体阴性，胸片示右下肺斑片影，给予抗生素治疗，仍发热，体温波动在38～39℃，伴周身关节肌肉酸痛。20天前自觉咽痛，咳嗽，有少量黄白黏痰，发热前有发冷，当地肺CT示双下肺斑片状阴影。给予抗生素治疗，病情无好转，出现气短，转我院进一步诊治。发病以来无咯血及胸痛，无皮疹及脱发，无头痛及呕吐，无腹痛及腹泻，睡眠尚可，食欲正常，二便正常。    weight=    assistCheck=①血常规WBC 4.1×109/L、S 82%、RBC 3.40×1012/L、Hb 110g/L、PLT 298×109/L。②尿蛋白（+）。③肝功能ALT 67U/L、LDH 356U/L、肾功能、心肌酶学、凝血三项均正常。④血沉40mm/h、结核抗体（－）、PPD（－）、肺炎支原体抗体（－）、军团菌抗体（－）、病菌抗体（－）。CRP 32mg/L、抗O正常、类风湿因子阴性、抗核抗体（－）、ENA谱（－）、ds-DNA（－）、ANCA（－）、免疫复合物（－）、IgE正常、血嗜酸细胞和痰嗜酸细胞计数无增高。腹部脏器彩超未见异常。⑤动脉血气分析（未吸氧）：pH7.39，PaO2 55mmHg，PaCO2 37.6mmHg。⑥肺功能提示轻度弥散功能障碍。⑦肺CT：双肺多发斑片状阴影（图33-1）。痰涂片可见革兰阳性球菌。2次痰培养白色念珠菌生长。HIV抗体阳性，CD4+细胞计数56（＜200）。口腔黏膜白斑涂片镜下见大量菌丝和孢子。2次不同时间血浆1,3-b-D葡聚糖均明显增高。纤维支气管镜防污染毛刷刷检培养查到白色念珠菌生长    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    呼吸衰竭

呼吸科经典病历32行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=无药物过敏史    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=80    personalHistory=患者是纺织工人，月经正常。    previousHistory=既往健康，无烟酒嗜好，无结核病患者密切接触史。无外地居住及旅游史。无有毒有害等气体接触，平素无特殊嗜好。丈夫健康，无不良嗜好及不洁生活史，无冶游史，患者孕2次，自然顺产1次，8年前因宫外孕大出血，失血性休克于当地输血800ml。患者既往输血史。
    ...    symptom=发热2个月，咳嗽20余天#####发育正常、营养良好、神志清楚、热病容，自主体位。皮肤黏膜无出血点和皮疹。浅表淋巴结无肿大，睑结膜充血，巩膜无黄染，口唇轻度发绀，咽黏膜充血，扁桃体Ⅱ°肿大，无脓点。颈软，气管居中，甲状腺不大。胸廓无畸形，双肺呼吸动度一致，触觉语颤正常，双肺叩诊清音。双肺呼吸音粗糙，未闻及干湿啰音。心界不大，心率90次/分，心律齐，各瓣膜听诊区未闻及杂音。腹平软，未触及包块，肝脾肋下未触及。脊柱四肢活动正常，无畸形。生理反射存在，病理反射未引出。 现病史:2个月前无明显诱因出现发热，体温在37.9～38.7℃，以午后和夜间为著，伴乏力，无发冷及盗汗，自以为“感冒”未介意。2周后病情未见好转，就诊于当地医院，化验血常规WBC 5.8×109/L、S 90%，尿常规正常，支原体抗体阴性，胸片示右下肺斑片影，给予抗生素治疗，仍发热，体温波动在38～39℃，伴周身关节肌肉酸痛。20天前自觉咽痛，咳嗽，有少量黄白黏痰，发热前有发冷，当地肺CT示双下肺斑片状阴影。给予抗生素治疗，病情无好转，出现气短，转我院进一步诊治。发病以来无咯血及胸痛，无皮疹及脱发，无头痛及呕吐，无腹痛及腹泻，睡眠尚可，食欲正常，二便正常。    weight=    assistCheck=①血常规WBC 4.1×109/L、S 82%、RBC 3.40×1012/L、Hb 110g/L、PLT 298×109/L。②尿蛋白（+）。③肝功能ALT 67U/L、LDH 356U/L、肾功能、心肌酶学、凝血三项均正常。④血沉40mm/h、结核抗体（－）、PPD（－）、肺炎支原体抗体（－）、军团菌抗体（－）、病菌抗体（－）。CRP 32mg/L、抗O正常、类风湿因子阴性、抗核抗体（－）、ENA谱（－）、ds-DNA（－）、ANCA（－）、免疫复合物（－）、IgE正常、血嗜酸细胞和痰嗜酸细胞计数无增高。腹部脏器彩超未见异常。⑤动脉血气分析（未吸氧）：pH7.39，PaO2 55mmHg，PaCO2 37.6mmHg。⑥肺功能提示轻度弥散功能障碍。⑦肺CT：双肺多发斑片状阴影（图33-1）。痰涂片可见革兰阳性球菌。2次痰培养白色念珠菌生长。HIV抗体阳性，CD4+细胞计数56（＜200）。口腔黏膜白斑涂片镜下见大量菌丝和孢子。2次不同时间血浆1,3-b-D葡聚糖均明显增高。纤维支气管镜防污染毛刷刷检培养查到白色念珠菌生长    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    念珠菌性肺炎

呼吸科经典病历32行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=42    ageType=岁    allergyHistory=无药物过敏史    bodyTempr=38.5    familyHistory=
    ...    gender=0    heartRate=90    highBldPress=120    lowBldPress=80    personalHistory=患者是纺织工人，月经正常。    previousHistory=既往健康，无烟酒嗜好，无结核病患者密切接触史。无外地居住及旅游史。无有毒有害等气体接触，平素无特殊嗜好。丈夫健康，无不良嗜好及不洁生活史，无冶游史，患者孕2次，自然顺产1次，8年前因宫外孕大出血，失血性休克于当地输血800ml。患者既往输血史。
    ...    symptom=发热2个月，咳嗽20余天#####发育正常、营养良好、神志清楚、热病容，自主体位。皮肤黏膜无出血点和皮疹。浅表淋巴结无肿大，睑结膜充血，巩膜无黄染，口唇轻度发绀，咽黏膜充血，扁桃体Ⅱ°肿大，无脓点。颈软，气管居中，甲状腺不大。胸廓无畸形，双肺呼吸动度一致，触觉语颤正常，双肺叩诊清音。双肺呼吸音粗糙，未闻及干湿啰音。心界不大，心率90次/分，心律齐，各瓣膜听诊区未闻及杂音。腹平软，未触及包块，肝脾肋下未触及。脊柱四肢活动正常，无畸形。生理反射存在，病理反射未引出。 现病史:2个月前无明显诱因出现发热，体温在37.9～38.7℃，以午后和夜间为著，伴乏力，无发冷及盗汗，自以为“感冒”未介意。2周后病情未见好转，就诊于当地医院，化验血常规WBC 5.8×109/L、S 90%，尿常规正常，支原体抗体阴性，胸片示右下肺斑片影，给予抗生素治疗，仍发热，体温波动在38～39℃，伴周身关节肌肉酸痛。20天前自觉咽痛，咳嗽，有少量黄白黏痰，发热前有发冷，当地肺CT示双下肺斑片状阴影。给予抗生素治疗，病情无好转，出现气短，转我院进一步诊治。发病以来无咯血及胸痛，无皮疹及脱发，无头痛及呕吐，无腹痛及腹泻，睡眠尚可，食欲正常，二便正常。    weight=    assistCheck=①血常规WBC 4.1×109/L、S 82%、RBC 3.40×1012/L、Hb 110g/L、PLT 298×109/L。②尿蛋白（+）。③肝功能ALT 67U/L、LDH 356U/L、肾功能、心肌酶学、凝血三项均正常。④血沉40mm/h、结核抗体（－）、PPD（－）、肺炎支原体抗体（－）、军团菌抗体（－）、病菌抗体（－）。CRP 32mg/L、抗O正常、类风湿因子阴性、抗核抗体（－）、ENA谱（－）、ds-DNA（－）、ANCA（－）、免疫复合物（－）、IgE正常、血嗜酸细胞和痰嗜酸细胞计数无增高。腹部脏器彩超未见异常。⑤动脉血气分析（未吸氧）：pH7.39，PaO2 55mmHg，PaCO2 37.6mmHg。⑥肺功能提示轻度弥散功能障碍。⑦肺CT：双肺多发斑片状阴影（图33-1）。痰涂片可见革兰阳性球菌。2次痰培养白色念珠菌生长。HIV抗体阳性，CD4+细胞计数56（＜200）。口腔黏膜白斑涂片镜下见大量菌丝和孢子。2次不同时间血浆1,3-b-D葡聚糖均明显增高。纤维支气管镜防污染毛刷刷检培养查到白色念珠菌生长    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    艾滋病

呼吸科经典病历33行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=100    lowBldPress=60    personalHistory=患者为乡村教师    previousHistory=儿童时期患过麻疹。患者经常“感冒”，每次都伴有咳嗽咳痰，抗感染治疗后症状好转。
    ...    symptom=反复咳嗽、咳痰6个月，加重伴发热1天#####神清语明，自主体位，口唇无发绀，咽不赤，双侧扁桃体无肿大，浅表淋巴结未触及肿大，呼吸略促，左侧胸廓略塌陷，左肺背部肩胛下角以下叩诊呈浊音，听诊呼吸音减弱，左肺下野可闻及中小水泡音，心前区无异常隆起，心界不大，心率为100次/分，心律齐，各瓣膜听诊区未闻及病理性杂音及额外心音，腹部、四肢、神经系统检查未见异常。 现病史:本次入院前6个月无明确诱因出现咳嗽、咳黄色黏痰，早晨起床时痰量较多，偶有痰中带血，无臭味，自觉发热，未测体温，给予头孢类抗生素后略好转，此后一直有咳嗽、咳黄痰，近日于受凉后出现发热，体温达39℃，伴有寒战，痰量较前明显增多，遂来就诊。    weight=    assistCheck="血常规 WBC 12.7×109/L，S 86.31%，L 9.02%，M 4.1%，RBC 4.37×1012/L，Hb 130g/L，PLT 310×109/L；CRP、ESR正常范围。2. 支原体抗体、衣原体抗体、军团菌抗体和病毒系列阴性。3. 痰查结核菌和涂片查细菌阴性；痰培养3天后出结果。4. 影像学 肺CT示左肺下叶多个大小不等囊样透光区，部分病灶内可见液平面，胸壁下胸膜增厚见水样密度影，纵隔左偏，其内未见肿大淋巴结，心影大小基本正常"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    支气管扩张

呼吸科经典病历34行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=38.9    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=100    lowBldPress=60    personalHistory= 患者为农民，主要在家务农。吸烟40年，10支/天。饮酒20余年，每日200g左右。    previousHistory=既往身体健康，无结核病及结核密切接触史，无哮喘及特应性体质家族史。
    ...    symptom=发热伴咳嗽、咳脓痰7天，加重2天#####营养不良，神清语明，步入病房，自主体位，口唇无发绀，未触及肿大的浅表淋巴结，气管居中，双肺叩诊清音，听诊呼吸音减弱，右肺可闻及少量湿啰音，未闻及干啰音，心音纯，心率88次/分，律齐，各瓣膜区未闻及病理性杂音，腹部，神经等系统未见异常。 现病史:"患者入院前1周饮酒后出现昏睡，醒来后呕吐较多胃内容物，自觉有发热，体温最高可达39.2℃，伴有寒战。病初咳嗽较轻，伴有胸痛，而后咳嗽加剧且持续存在，痰量剧增，约100ml/d，为黄棕色脓性痰，有腥臭味，夜间变动体位时加剧。3天前出现胸闷气短，平卧时为重，伴有咯血。曾于当地医院静脉滴注青霉素治疗5天，未见明显改善。近2天上述症状日趋加重，出现呼吸困难不能平卧。为求进一步诊治收入我院，发病以来精神状态可，二便正常，饮食睡眠可，体重无明显减轻。"    weight=    assistCheck="1.血常规 WBC 24×109/L，S 84.54%。2. 支原体，衣原体，军团菌，病毒抗体检查均阴性。3. 痰涂片 见革兰染色阳性球菌及阴性杆菌。4. 痰培养+药敏 未生长细菌。5. 动脉血气分析（未吸氧）PO2 70.7mmHg，PCO2 35mmHg，pH 7.43。 6. 痰脱落细胞未见肿瘤细胞，肿瘤标志物均正常。 7. 痰查结核菌阴性。 8. 肺CT 右肺下叶背段大片致密影，其内可见透光区"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性肺脓肿

呼吸科经典病历34行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=38.9    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=100    lowBldPress=60    personalHistory= 患者为农民，主要在家务农。吸烟40年，10支/天。饮酒20余年，每日200g左右。    previousHistory=既往身体健康，无结核病及结核密切接触史，无哮喘及特应性体质家族史。
    ...    symptom=发热伴咳嗽、咳脓痰7天，加重2天#####营养不良，神清语明，步入病房，自主体位，口唇无发绀，未触及肿大的浅表淋巴结，气管居中，双肺叩诊清音，听诊呼吸音减弱，右肺可闻及少量湿啰音，未闻及干啰音，心音纯，心率88次/分，律齐，各瓣膜区未闻及病理性杂音，腹部，神经等系统未见异常。 现病史:"患者入院前1周饮酒后出现昏睡，醒来后呕吐较多胃内容物，自觉有发热，体温最高可达39.2℃，伴有寒战。病初咳嗽较轻，伴有胸痛，而后咳嗽加剧且持续存在，痰量剧增，约100ml/d，为黄棕色脓性痰，有腥臭味，夜间变动体位时加剧。3天前出现胸闷气短，平卧时为重，伴有咯血。曾于当地医院静脉滴注青霉素治疗5天，未见明显改善。近2天上述症状日趋加重，出现呼吸困难不能平卧。为求进一步诊治收入我院，发病以来精神状态可，二便正常，饮食睡眠可，体重无明显减轻。"    weight=    assistCheck="1.血常规 WBC 24×109/L，S 84.54%。2. 支原体，衣原体，军团菌，病毒抗体检查均阴性。3. 痰涂片 见革兰染色阳性球菌及阴性杆菌。4. 痰培养+药敏 未生长细菌。5. 动脉血气分析（未吸氧）PO2 70.7mmHg，PCO2 35mmHg，pH 7.43。 6. 痰脱落细胞未见肿瘤细胞，肿瘤标志物均正常。 7. 痰查结核菌阴性。 8. 肺CT 右肺下叶背段大片致密影，其内可见透光区"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺脓肿

呼吸科经典病历35行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=120    lowBldPress=80    personalHistory=吸烟40年，约1包/天。    previousHistory=患者既往无慢性咳嗽咳痰病史，无脑血管疾病及糖尿病史。无使用糖皮质激素或免疫抑制剂的病史。
    ...    symptom=咳嗽、咳痰、发热10天#####一般状态可，平卧位，神志清楚。口唇颜面无发绀，球结膜无水肿，双锁骨上未触及肿大淋巴结。胸廓饱满，右下肺叩诊略浊，听诊呼吸音弱，可闻及少量细湿啰音。心率86次/分，节律规整。各瓣膜听诊区未闻及病理性杂音。腹软，肝肋下未触及。双下肢无水肿，无杵状指。 现病史:患者10天前醉酒后出现乏力、周身不适、咳嗽、咳脓痰，无臭味，量约50ml/d，发热，体温波动于38～39.5℃，无寒战。在当地诊所静脉滴注青霉素960万单位，每日1次，体温降至37～38℃。但7天后痰量明显增加，约150ml/d，有臭味，痰液分层，底层似有腐烂物质。发病以来体力差，无胸痛，无咯血，食欲轻度下降，二便正常，体重无明显变化    weight=    assistCheck="1. 血常规 白细胞总数11.9×109/L，中性粒细胞72%，淋巴细胞26%，嗜酸细胞2%，Hb 106g/L，PLT 223×109/L。提示白细胞总数及中性粒细胞分数均增高，表明有感染的存在。2. 痰查结核菌阴性，血结核抗体检测阴性，提示尚无结核感染的证据。3. 痰查瘤细胞阴性，血CEA 2mg/L，提示尚无恶性肿瘤的证据。4. 痰涂片查细菌 查到革兰阳性球菌。表明感染以革兰阳性球菌为主。5. 痰细菌培养加药敏 未见细菌生长。6. 胸片及肺CT（1）胸片：右肺下叶后基底段见大片致密影，内有薄壁空洞及液平；（2）肺CT：右肺下叶后基底段见大片致密影，内有薄壁空洞，洞壁光滑，并可见液平。无卫星灶，纵隔淋巴结无肿大"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性肺脓肿

呼吸科经典病历35行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=38.5    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=120    lowBldPress=80    personalHistory=吸烟40年，约1包/天。    previousHistory=患者既往无慢性咳嗽咳痰病史，无脑血管疾病及糖尿病史。无使用糖皮质激素或免疫抑制剂的病史。
    ...    symptom=咳嗽、咳痰、发热10天#####一般状态可，平卧位，神志清楚。口唇颜面无发绀，球结膜无水肿，双锁骨上未触及肿大淋巴结。胸廓饱满，右下肺叩诊略浊，听诊呼吸音弱，可闻及少量细湿啰音。心率86次/分，节律规整。各瓣膜听诊区未闻及病理性杂音。腹软，肝肋下未触及。双下肢无水肿，无杵状指。 现病史:患者10天前醉酒后出现乏力、周身不适、咳嗽、咳脓痰，无臭味，量约50ml/d，发热，体温波动于38～39.5℃，无寒战。在当地诊所静脉滴注青霉素960万单位，每日1次，体温降至37～38℃。但7天后痰量明显增加，约150ml/d，有臭味，痰液分层，底层似有腐烂物质。发病以来体力差，无胸痛，无咯血，食欲轻度下降，二便正常，体重无明显变化    weight=    assistCheck="1. 血常规 白细胞总数11.9×109/L，中性粒细胞72%，淋巴细胞26%，嗜酸细胞2%，Hb 106g/L，PLT 223×109/L。提示白细胞总数及中性粒细胞分数均增高，表明有感染的存在。2. 痰查结核菌阴性，血结核抗体检测阴性，提示尚无结核感染的证据。3. 痰查瘤细胞阴性，血CEA 2mg/L，提示尚无恶性肿瘤的证据。4. 痰涂片查细菌 查到革兰阳性球菌。表明感染以革兰阳性球菌为主。5. 痰细菌培养加药敏 未见细菌生长。6. 胸片及肺CT（1）胸片：右肺下叶后基底段见大片致密影，内有薄壁空洞及液平；（2）肺CT：右肺下叶后基底段见大片致密影，内有薄壁空洞，洞壁光滑，并可见液平。无卫星灶，纵隔淋巴结无肿大"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺脓肿

呼吸科经典病历36行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=65    highBldPress=135    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=发热，咳嗽，咳痰10余天#####神志清楚，查体合作呼吸平稳，自主体位，口唇无发绀，气管居中，无三凹征。胸廓对称，双侧呼吸动度一致，双肺叩诊呈清音，听诊左肺呼吸音清，右下肺可闻及水泡音，心界不大，心律整，各瓣膜听诊区未闻及病理性杂音，腹部查体无异常，双下肢无水肿，无杵状指。 现病史:10余天前受凉后出现发热，体温最高可达39.5℃，伴寒战、咳嗽，咳白痰，于外院静脉滴注头孢菌素及阿奇霉素抗感染1周，体温下降不明显，仍间断发热，体温波动于37.5～38.5℃，并出现右季肋部疼痛，疼痛与呼吸运动有关，无咯血，无呼吸困难，遂来门诊就诊    weight=    assistCheck=①血常规：WBC 8.3×109/L，S 83.34%，L 8.42%，M 6.6%，RBC 4.43×1012/L，Hb 123g/L，PLT 353×109/L。②血清支原体、衣原体、军团菌、病毒抗体检查：均阴性。③痰细菌涂片：查到革兰阳性球菌。痰菌培养未见细菌生长。④胸部X线检查：右下肺大片高密度影；肺部CT检查显示右肺下叶外基底段片状影，其内可见空洞及气液平面，边缘模糊    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性肺脓肿

呼吸科经典病历36行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=58    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=65    highBldPress=135    lowBldPress=90    personalHistory=    previousHistory=
    ...    symptom=发热，咳嗽，咳痰10余天#####神志清楚，查体合作呼吸平稳，自主体位，口唇无发绀，气管居中，无三凹征。胸廓对称，双侧呼吸动度一致，双肺叩诊呈清音，听诊左肺呼吸音清，右下肺可闻及水泡音，心界不大，心律整，各瓣膜听诊区未闻及病理性杂音，腹部查体无异常，双下肢无水肿，无杵状指。 现病史:10余天前受凉后出现发热，体温最高可达39.5℃，伴寒战、咳嗽，咳白痰，于外院静脉滴注头孢菌素及阿奇霉素抗感染1周，体温下降不明显，仍间断发热，体温波动于37.5～38.5℃，并出现右季肋部疼痛，疼痛与呼吸运动有关，无咯血，无呼吸困难，遂来门诊就诊    weight=    assistCheck=①血常规：WBC 8.3×109/L，S 83.34%，L 8.42%，M 6.6%，RBC 4.43×1012/L，Hb 123g/L，PLT 353×109/L。②血清支原体、衣原体、军团菌、病毒抗体检查：均阴性。③痰细菌涂片：查到革兰阳性球菌。痰菌培养未见细菌生长。④胸部X线检查：右下肺大片高密度影；肺部CT检查显示右肺下叶外基底段片状影，其内可见空洞及气液平面，边缘模糊    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺脓肿

呼吸科经典病历37行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=17    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=110    lowBldPress=60    personalHistory=患者为高中学生，无烟酒嗜好    previousHistory=既往身体健康。否认结核病患者密切接触史。
    ...    symptom=发热、咳嗽2周#####神志清楚，瘦高体型，营养欠佳，周身浅表淋巴结未触及，呼吸平稳，口唇无发绀，咽部无充血，双侧扁桃体不大，气管位置居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音，右肺上部可闻及少许小水泡音，余肺野呼吸音清。心界不大，心音纯，律整，各心脏瓣膜听诊区未闻及杂音。腹部平软，肝脾肋下未触及，四肢、神经系统检查未见异常。 现病史:2周无明确诱因出现发热，体温最高37.8℃，一般多在37.2～37.6℃之间，发热多于午后及夜间出现，同时咳嗽，偶有咳痰，为少量黄白痰，无特殊气味，曾在当地诊所静脉滴注青霉素、克林霉素，体温未下降。发病以来有明显乏力、盗汗，食欲差，无恶心及呕吐，无头痛。    weight=    assistCheck=①血常规：WBC 5.8×109/L，S 65%，L 35%，RBC 3.08×1012/L，Hb 95g/L，PLT 213×109/L。②ESR：32 mm/h。③CRP：正常范围内。④肺部CT：右肺上叶可见浓淡不均片影。⑤痰涂片查结核菌及痰结核菌培养结果均为阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺结核

呼吸科经典病历38行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=87    highBldPress=130    lowBldPress=65    personalHistory=患者为银行职员，无烟酒嗜好。    previousHistory=既往体健，否认结核接触史。
    ...    symptom=胸闷、乏力3个月，咳嗽半个月#####神志清楚，营养中等，周身浅表淋巴结未触及，呼吸平稳，口唇无发绀，气管位置居中，胸廓对称，双侧呼吸运动一致，右下肺叩诊略呈浊音，听诊右下肺呼吸音减弱，可闻及少许痰鸣音，余肺野呼吸音清，心界不大，心音纯，律整，各心脏瓣膜听诊区未闻及杂音。腹部、四肢、神经系统检查未见异常。 现病史:3个月无明显诱因渐出现胸闷，多呈持续性，伴乏力，偶有咳嗽，咳少量白色黏痰，无发热，无胸痛及气短，无心悸，未介意。近半个月来，受凉后出现轻咳，咳少量白痰，伴有右背部不适感，因入院当日咳3口血丝痰来诊。发病以来无盗汗，体重未下降。    weight=    assistCheck=①血常规：WBC12.0×109/L，S76%，L 24%，RBC 3.43×1012/L，Hb 105g/L，PLT 320×109/L。②ESR：36 mm/h；CRP正常。③肺部CT：右肺下叶后基底段见较致密片状阴影，其远端近胸膜侧伴有小片状渗出病灶，其余肺野未见异常（图43-1）。④心电图、心脏超声心动图及心功能检测结果均正常。⑤WBC 7.5×109/L，S 62%，L 38%；⑥血清肺炎支原体抗体、衣原体抗体、军团菌抗体、HIV抗体、1,3-b-D葡聚糖均阴性；⑦PPD试验阳性、结核抗体弱阳性；⑧肿瘤标志物：均在正常范围；⑨痰细菌培养：未生长细菌；痰结核菌涂片3次未找到结核杆菌。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺结核

呼吸科经典病历39行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=38.4    familyHistory=
    ...    gender=0    heartRate=102    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=既往体健，无呼吸系统疾病。患者近3个月略感乏力，月经周期异常
    ...    symptom=发热、咳嗽1个月#####神清，呼吸平稳，自主体位，热病容，口唇无发绀，咽部无充血，双侧扁桃体不大，胸廓对称，双肺叩诊清音，双肺呼吸音粗，左肺上部可闻及干鸣音，心率102次/分，律齐，未闻及奔马律及病理性杂音，腹平软，肝脾肋下未触及，皮肤、关节等处查体未见异常。 现病史:患者1个月前无明确诱因出现低热，体温37.8℃左右，伴干咳，无咯血及胸痛，无盗汗及体重减轻，无关节疼痛、肿胀等症状。应用抗生素未见好转，咳嗽症状有所加重，遂入我院治疗。    weight=    assistCheck=①血常规：WBC 7.4×109/L，S 67%，L 21%，M 2%，RBC 3.5×1012/L，Hb 110g/L，PLT 232×109/L。②血清支原体抗体、军团菌抗体检测未见异常。③风湿系列检查和传染病检查均未见异常。④血培养、痰菌培养未见细菌生长。⑤肺CT：左侧近肺门区可见团块状高密度影，左上肺可见点、片状浸润阴影，局部肺纹理增强。纤维支气管镜检查结果：左上叶尖后段支气管黏膜充血肥厚，表面粗糙不平，覆有黄白苔，可见管腔狭窄。纤维支气管镜病理提示结核。痰涂片抗酸杆菌阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺结核

呼吸科经典病历40行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=34    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=患者父亲为肺结核患者，正在抗结核治疗，患者曾照顾过父亲。
    ...    gender=1    heartRate=94    highBldPress=90    lowBldPress=60    personalHistory=患者为矿工    previousHistory=硅沉着病病史3年
    ...    symptom=咳嗽、发热、呼吸困难1个月#####消瘦貌，神志清楚，呼吸急促，半卧位，锁骨上未触及肿大淋巴结，口唇发绀，气管居中，胸廓对称，双下肺叩诊呈浊音，听诊呼吸音消失。心界向两侧扩大，心音遥远，心律整，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者1个月前受凉后出现干咳，伴轻度活动后气短，未予在意，之后咳嗽持续存在，咳黄痰，呼吸困难进行性加重，不能平卧，体温升高，多于午后出现，体温37.5～38.2℃，盗汗、乏力明显，先后应用阿奇霉素、头孢他啶，疗效不佳，上述症状日趋加重    weight=    assistCheck="①PPD：皮肤硬结直径20mm×20mm；②血肿瘤标志物：阴性；③痰查瘤细胞：阴性；④痰细菌培养：未见细菌生长；⑤血培养：未见细菌生长；⑥左侧胸腔穿刺抽出淡黄色液体800ml，为渗出液，LDH 230 IU/L，未见结核菌和瘤细胞，胸腔积液结核抗体检测阳性；⑦心包穿刺：抽出淡黄色液体140ml，为渗出液，LDH 212 IU/L，未见结核菌和瘤细胞，结核抗体检测阳性；⑧风湿三项、ANA/ENA谱均阴性。⑨血常规 WBC 10.3×109/L，S 73%，L 26%，M 1%，RBC 3.35×1012/L，Hb 92g/L，PLT 332×109/L。⑩CRP：轻度升高。11.ESR：40mm/h。12.血清支原体、衣原体、军团菌、病毒抗体：均阴性。13.血结核抗体检测阳性。14.痰液涂片检查：为革兰阴性杆菌，未见结核杆菌。15.动脉血气（未吸氧）pH 7.45，PaO2 69mmHg，PaCO2 32mmHg。16.肺CT：双肺多发小结节影，双侧心缘旁索条状致密影，纵隔淋巴结肿大，双侧胸腔积液，以左侧明显，心包积液。17心电图：肢导低电压。18、心脏彩超：心包积液。射血分数（EF）55%，左心室收缩功能正常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺结核

呼吸科经典病历40行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=34    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=患者父亲为肺结核患者，正在抗结核治疗，患者曾照顾过父亲。
    ...    gender=1    heartRate=94    highBldPress=90    lowBldPress=60    personalHistory=患者为矿工    previousHistory=硅沉着病病史3年
    ...    symptom=咳嗽、发热、呼吸困难1个月#####消瘦貌，神志清楚，呼吸急促，半卧位，锁骨上未触及肿大淋巴结，口唇发绀，气管居中，胸廓对称，双下肺叩诊呈浊音，听诊呼吸音消失。心界向两侧扩大，心音遥远，心律整，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者1个月前受凉后出现干咳，伴轻度活动后气短，未予在意，之后咳嗽持续存在，咳黄痰，呼吸困难进行性加重，不能平卧，体温升高，多于午后出现，体温37.5～38.2℃，盗汗、乏力明显，先后应用阿奇霉素、头孢他啶，疗效不佳，上述症状日趋加重    weight=    assistCheck="①PPD：皮肤硬结直径20mm×20mm；②血肿瘤标志物：阴性；③痰查瘤细胞：阴性；④痰细菌培养：未见细菌生长；⑤血培养：未见细菌生长；⑥左侧胸腔穿刺抽出淡黄色液体800ml，为渗出液，LDH 230 IU/L，未见结核菌和瘤细胞，胸腔积液结核抗体检测阳性；⑦心包穿刺：抽出淡黄色液体140ml，为渗出液，LDH 212 IU/L，未见结核菌和瘤细胞，结核抗体检测阳性；⑧风湿三项、ANA/ENA谱均阴性。⑨血常规 WBC 10.3×109/L，S 73%，L 26%，M 1%，RBC 3.35×1012/L，Hb 92g/L，PLT 332×109/L。⑩CRP：轻度升高。11.ESR：40mm/h。12.血清支原体、衣原体、军团菌、病毒抗体：均阴性。13.血结核抗体检测阳性。14.痰液涂片检查：为革兰阴性杆菌，未见结核杆菌。15.动脉血气（未吸氧）pH 7.45，PaO2 69mmHg，PaCO2 32mmHg。16.肺CT：双肺多发小结节影，双侧心缘旁索条状致密影，纵隔淋巴结肿大，双侧胸腔积液，以左侧明显，心包积液。17心电图：肢导低电压。18、心脏彩超：心包积液。射血分数（EF）55%，左心室收缩功能正常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    结核性胸膜炎

呼吸科经典病历40行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=34    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=患者父亲为肺结核患者，正在抗结核治疗，患者曾照顾过父亲。
    ...    gender=1    heartRate=94    highBldPress=90    lowBldPress=60    personalHistory=患者为矿工    previousHistory=硅沉着病病史3年
    ...    symptom=咳嗽、发热、呼吸困难1个月#####消瘦貌，神志清楚，呼吸急促，半卧位，锁骨上未触及肿大淋巴结，口唇发绀，气管居中，胸廓对称，双下肺叩诊呈浊音，听诊呼吸音消失。心界向两侧扩大，心音遥远，心律整，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者1个月前受凉后出现干咳，伴轻度活动后气短，未予在意，之后咳嗽持续存在，咳黄痰，呼吸困难进行性加重，不能平卧，体温升高，多于午后出现，体温37.5～38.2℃，盗汗、乏力明显，先后应用阿奇霉素、头孢他啶，疗效不佳，上述症状日趋加重    weight=    assistCheck="①PPD：皮肤硬结直径20mm×20mm；②血肿瘤标志物：阴性；③痰查瘤细胞：阴性；④痰细菌培养：未见细菌生长；⑤血培养：未见细菌生长；⑥左侧胸腔穿刺抽出淡黄色液体800ml，为渗出液，LDH 230 IU/L，未见结核菌和瘤细胞，胸腔积液结核抗体检测阳性；⑦心包穿刺：抽出淡黄色液体140ml，为渗出液，LDH 212 IU/L，未见结核菌和瘤细胞，结核抗体检测阳性；⑧风湿三项、ANA/ENA谱均阴性。⑨血常规 WBC 10.3×109/L，S 73%，L 26%，M 1%，RBC 3.35×1012/L，Hb 92g/L，PLT 332×109/L。⑩CRP：轻度升高。11.ESR：40mm/h。12.血清支原体、衣原体、军团菌、病毒抗体：均阴性。13.血结核抗体检测阳性。14.痰液涂片检查：为革兰阴性杆菌，未见结核杆菌。15.动脉血气（未吸氧）pH 7.45，PaO2 69mmHg，PaCO2 32mmHg。16.肺CT：双肺多发小结节影，双侧心缘旁索条状致密影，纵隔淋巴结肿大，双侧胸腔积液，以左侧明显，心包积液。17心电图：肢导低电压。18、心脏彩超：心包积液。射血分数（EF）55%，左心室收缩功能正常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胸膜炎

呼吸科经典病历41行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=39.2    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=120    lowBldPress=80    personalHistory=患者为学生    previousHistory=既往身体健康，否认结核接触史，未到过外地。
    ...    symptom=咳嗽、咳痰2周#####热病容，神志清楚，呼吸平稳，自主体位。口唇无发绀，咽略发红，扁桃体不大，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音。双肺听诊呼吸音清，未闻及干湿啰音。心界不大，心律齐，各瓣膜听诊区未闻及杂音。腹软，肝脾肋下未触及，四肢及神经系统检查未见异常。 现病史:患者2周前无明显诱因出现咳嗽、咳痰，为黏性白色痰，无痰中带血及特殊气味。体温最高40.1℃，伴有寒战。有昏睡、多汗、乏力，食欲不佳，静脉滴注青霉素1周病情未见好转    weight=    assistCheck=①血常规：WBC 9.1×109/L，S 70%，L 30%，M 2%，RBC 5×1012，Hb 120g/L，PLT 246×109/L。②ESR：32mm/h。③血清支原体、军团菌、病毒抗体、肥达反应、外斐反应、HIV抗体均为阴性。④痰培养：未培养出致病菌。⑤痰查结核菌：阴性。⑥血细菌培养：未长细菌。⑦动脉血气分析（未吸氧）：pH 7.4，PaO2 90mmHg，PaCO2 32mmHg。⑧肝胆脾胰彩超、心脏彩超、中段尿细菌培养、骨髓穿刺均正常。⑨肺HRCT示双肺可见弥漫均匀分布的小粟粒状阴影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺结核

呼吸科经典病历41行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=39.2    familyHistory=
    ...    gender=1    heartRate=96    highBldPress=120    lowBldPress=80    personalHistory=患者为学生    previousHistory=既往身体健康，否认结核接触史，未到过外地。
    ...    symptom=咳嗽、咳痰2周#####热病容，神志清楚，呼吸平稳，自主体位。口唇无发绀，咽略发红，扁桃体不大，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音。双肺听诊呼吸音清，未闻及干湿啰音。心界不大，心律齐，各瓣膜听诊区未闻及杂音。腹软，肝脾肋下未触及，四肢及神经系统检查未见异常。 现病史:患者2周前无明显诱因出现咳嗽、咳痰，为黏性白色痰，无痰中带血及特殊气味。体温最高40.1℃，伴有寒战。有昏睡、多汗、乏力，食欲不佳，静脉滴注青霉素1周病情未见好转    weight=    assistCheck=①血常规：WBC 9.1×109/L，S 70%，L 30%，M 2%，RBC 5×1012，Hb 120g/L，PLT 246×109/L。②ESR：32mm/h。③血清支原体、军团菌、病毒抗体、肥达反应、外斐反应、HIV抗体均为阴性。④痰培养：未培养出致病菌。⑤痰查结核菌：阴性。⑥血细菌培养：未长细菌。⑦动脉血气分析（未吸氧）：pH 7.4，PaO2 90mmHg，PaCO2 32mmHg。⑧肝胆脾胰彩超、心脏彩超、中段尿细菌培养、骨髓穿刺均正常。⑨肺HRCT示双肺可见弥漫均匀分布的小粟粒状阴影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性血行播散型肺结核

呼吸科经典病历42行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=62    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=92    highBldPress=130    lowBldPress=85    personalHistory=    previousHistory=既往无高血压病史，亦无明确的夜间阵发性呼吸困难和心悸。患者为离休干部，从未接触或暴露无机粉尘史，无特殊个人爱好，未养过鸟类和动物，也未接触过发霉物质，即无吸入有机粉尘的高危因素。
    ...    symptom=进行性气短伴咳嗽半年，加重1个月#####呼吸略促，口唇、颜面发绀，可见杵状指（趾），双侧呼吸运动对称，双肺叩诊呈清音。听诊：双肺底及腋下区可闻及吸气末爆裂性啰音（称Velcro音）。心脏检查：心界不大，节律规整，各瓣膜听诊区未闻及杂音。 现病史:进行性气短伴咳嗽半年，加重1个月。咳嗽多为干咳无痰，时间较长，无昼夜差异，不分季节，病程中无发热，无胸痛咯血。患者气短呈进行性、活动后加重。    weight=    assistCheck=1.血常规正常，CRP（+），ANA（+）和RF（+）。2.肺功能：FVC 1.07L，FEV1.0占预计值89%，FEV1.0/ FVC 83%，TLC占预计值52%和DLCO占预计值 31%。3.动脉血气分析：pH 7.34，PaO2 56mmHg，PaCO2 31mmHg。4.胸部X线和肺CT：双肺容积缩小，两肺弥漫分布条索、网格影，近胸膜多发囊样透光区，呈蜂窝样改变    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    特发性肺间质纤维化

呼吸科经典病历43行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=无    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=90    lowBldPress=65    personalHistory=退休前职业为干部，吸烟35年，15支/天。    previousHistory=既往否认肝炎、结核、高血压、糖尿病、冠心病以及脑血管疾病、结缔组织病等病史。否认“慢性支气管炎”病史，无进食及醉酒呛咳史，无明确吸入异常气体及粉尘史，无发霉物质接触史，无长期用药史。无职业性粉尘及有害物质接触史。未饲养宠物及特殊植物。患者既往1年前即有活动后气短症状，主要表现为运动耐力下降，行走300m左右即觉气短，伴有轻微干咳，不伴心慌、胸闷、胸痛及发热，未在意，未治疗。
    ...    symptom=活动后气短1月余，加重20余天#####T 37.2℃，R 32次/分，P 100次/分，BP 90/65mmHg。神志清楚，平卧位，呼吸急促。口唇发绀，气管居中。胸廓对称，双肺呼吸动度一致，叩诊双肺呈清音，听诊双肺中下可闻及广泛Velcro音，未闻及干湿啰音。心界不大，心音纯，律整，各瓣膜听诊区未闻及病理性杂音。腹软无压痛，肝脾肋下未触及。四肢活动自如，无水肿，杵状指阳性。神经系统查体未见异常。 现病史:1个多月前，患者无明显诱因出现轻微咽痛、咳嗽，未在意，自服牛黄上清片、阿莫西林2天后上述症状好转。此后略觉胸闷，逐渐出现活动后气短，气短症状与体位和吸入冷空气等无关，但日常生活不受影响，无咳嗽和胸痛，无发热，无夜间阵发性呼吸困难及憋醒。先后服用多种抗感染药物，症状未见改善。近20余天患者自觉气短症状逐渐加重，现静息时即有明显的呼吸困难，但仍可平卧，无夜间憋醒。气短加重同时伴有低热，体温波动在37～38℃，自觉乏力，无盗汗，先后给予抗生素、抗结核药物治疗近4周，症状无改善，且气短进行性加重，为系统诊治入院。    weight=    assistCheck=①血常规：WBC 8.3×109/L，S 69.78%，L 14.09%，M 3.31%，Hb 111g/L，PLT 294 ×109/L；②血 LDH 297U/L；CRP＜400mg/L；ESR 81.5mm/h；③血清支原体抗体、病毒抗体系列、肿瘤标志物、风湿免疫系列、痰细菌学、结核抗体检测、PPD试验等检查结果均为阴性；④心电图：大致正常，心率98次/分；⑤动脉血气分析（未吸氧）：pH 7.423，PaO2 57.2mmHg，PaCO2 41.9mmHg；⑥肺功能：VC占预计值32%，DLCO占预计值24%，提示为限制性通气功能障碍和弥散功能障碍；⑦肺HRCT：双肺中下野可见网格状、蜂窝状影，以中外带为主，双肺弥漫浸润影、磨玻璃影    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    特发性肺间质纤维化

呼吸科经典病历44行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=无吸烟史    previousHistory=否认结核病接触史。
    ...    symptom=胸痛、胸闷、咳嗽伴气短半年#####双下肢皮下多发大小不等0.5cm左右小结节，伴环形红斑。裂隙灯下检查：双眼虹膜、睫状体炎。 现病史:患者胸痛呈持续性闷痛，与活动和劳累无明显关系。咳嗽为干咳、不伴咯血，半年来体重无明显减轻。无发热和夜间出汗，食欲正常。曾就诊于当地医院，行肺CT检查示：双肺门及纵隔淋巴结肿大，双肺内散在小结节影，按肺癌给予化疗。经3个月抗癌治疗，患者除了乏力、食欲减退和脱发外，胸闷、咳嗽和气短等自觉症状无改善，复查胸片和肺CT：双肺门及纵隔肿大的淋巴结无缩小，双肺内小结节影无明显吸收。患者近半年来视力下降，视物模糊，双下肢间断出现皮下结节和红斑。为明确诊断转入上级医院。    weight=    assistCheck=1.血常规、CRP、ESR均正常。2.痰查结核菌、结核抗体、PPD试验均阴性。3.肿瘤抗原抗体：均正常。4.血清钙和尿钙均明显增高；血清血管紧张素转化酶（516U/ml）明显高于正常值2～3倍。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    结节病

呼吸科经典病历45行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=62    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=88    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=患者曾在金属矿（含矽、锰）工作15年，一直从事井下挖掘作业，接尘量大，现已脱离粉尘环境6年，患者出现咳嗽、气短已有3年，未在意，无明显消瘦，无咳痰带血，无腹泻、腹痛，极少使用药物。
    ...    symptom=咳嗽、进行性呼吸困难3个月#####消瘦貌，神志清楚，呼吸略促，自主体位，锁骨上未触及肿大淋巴结，口唇略发绀，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈浊音，双下肺听诊可闻及Velcro音。心界不大，心音纯，律整，未闻及奔马律和杂音。腹部、四肢、神经等系统检查未见异常。 现病史:此次发病无诱因，开始为干咳，偶有活动后呼吸困难，未予在意，之后上述症状进行性加重，静息时即有呼吸困难，自觉吸气受限，偶有少许白色泡沫样痰，全身乏力，无发热，无盗汗，无心悸，无水肿，先后应用阿奇霉素、头孢呋辛各2周，疗效不佳。    weight=    assistCheck=①血常规：WBC 6.8×109/L，S 67%，L 33%，RBC 4.2×1012/L，Hb 130g/ L，PLT 208×109/L；②ESR、D-二聚体：均正常；③PPD：阴性；④痰液相关检查：阴性；⑤血肿瘤标志物检查：阴性；⑥动脉血气（未吸氧）：pH 7.43，PaO2 72mmHg，PaCO2 33.6mmHg；⑦肺功能：FEV1占预计值69%，PEF占预计值67%，VC占预计值65%，RV/ TLC为42%，DLCO占预计值63%；⑧肺CT：双侧多发结节影，在肺尖可见部分结节融合，伴双肺下叶间质性改变。9.便常规+潜血：正常，未见潜血。10.纤维支气管镜：气管黏膜光滑，管腔通畅，未见阻塞与狭窄。11.肺泡灌洗结果：回收55ml，外观略混浊，细胞分数为：MΦ 85%，L 15%，其中CD3+ 43%，CD4+ 34%，CD8+ 23%，未见结核菌和瘤细胞。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    硅沉着病

呼吸科经典病历46行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=77    ageType=岁    allergyHistory=否认过敏史。    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=既往有慢性阻塞性肺疾病（COPD）病史7年。否认高血压、冠心病、糖尿病等病史。否认肝炎、结核等传染病史。否认手术外伤史。
    ...    symptom=突发性呼吸困难1天#####神清语明，口唇略发绀，锁骨上、下等浅表淋巴结未触及，左腋下握雪感，双肺叩诊过清音，左上肺叩诊呈鼓音，左下肺叩诊浊音，双肺可闻及散在湿啰音，心脏、腹部查体未见异常，双下肢无水肿。 现病史:1天前，患者于搬运东西时突然出现呼吸困难，呈进行性加重，静息及平卧均不缓解，胸痛不明显，无发热、咳嗽、咳痰，无咯血、心慌等症状。发病以来无盗汗。饮食、睡眠较差，二便正常，体重无明显变化    weight=    assistCheck=①血常规：WBC 8.3×109/L，S 75%，Hb154 g/L，PLT 159×109/L。②ESR、CRP：正常。③血支原体抗体、军团菌抗体、结核抗体检测：阴性。④血气分析（未吸氧）：pH 7.43，PaCO2 30.1mmHg，PaO2 64.5mmHg。⑤痰涂片查细菌、痰查结核菌、痰查瘤细胞均为阴性结果。⑥心肌酶谱、心电图：正常。⑦肺CT：双肺肺气肿，肺大疱，左侧液气胸，左侧皮下气肿（图69-1、图69-2）。⑧患者补充既往肺功能检查：FEV1占预计值52%；FEV1/FVC 60%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    慢性阻塞性肺疾病

呼吸科经典病历46行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=77    ageType=岁    allergyHistory=否认过敏史。    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=125    lowBldPress=80    personalHistory=    previousHistory=既往有慢性阻塞性肺疾病（COPD）病史7年。否认高血压、冠心病、糖尿病等病史。否认肝炎、结核等传染病史。否认手术外伤史。
    ...    symptom=突发性呼吸困难1天#####神清语明，口唇略发绀，锁骨上、下等浅表淋巴结未触及，左腋下握雪感，双肺叩诊过清音，左上肺叩诊呈鼓音，左下肺叩诊浊音，双肺可闻及散在湿啰音，心脏、腹部查体未见异常，双下肢无水肿。 现病史:1天前，患者于搬运东西时突然出现呼吸困难，呈进行性加重，静息及平卧均不缓解，胸痛不明显，无发热、咳嗽、咳痰，无咯血、心慌等症状。发病以来无盗汗。饮食、睡眠较差，二便正常，体重无明显变化    weight=    assistCheck=①血常规：WBC 8.3×109/L，S 75%，Hb154 g/L，PLT 159×109/L。②ESR、CRP：正常。③血支原体抗体、军团菌抗体、结核抗体检测：阴性。④血气分析（未吸氧）：pH 7.43，PaCO2 30.1mmHg，PaO2 64.5mmHg。⑤痰涂片查细菌、痰查结核菌、痰查瘤细胞均为阴性结果。⑥心肌酶谱、心电图：正常。⑦肺CT：双肺肺气肿，肺大疱，左侧液气胸，左侧皮下气肿（图69-1、图69-2）。⑧患者补充既往肺功能检查：FEV1占预计值52%；FEV1/FVC 60%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    气胸

呼吸科经典病历47行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=31    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=78    highBldPress=120    lowBldPress=70    personalHistory=患者为客户经理    previousHistory=既往身体健康
    ...    symptom=鼾声响亮、白日困倦3个月#####身高1.70m，BMI 33kg/m2，神志清楚，自主体位，咽腔略狭窄，口唇无发绀，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音，听诊呼吸音清。心界不大，心音纯，律整，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查未见异常。 现病史:鼾声响亮、白日困倦3个月，主要表现为夜间睡眠不实，入睡即打鼾，据同室者观察，鼾声停止时间最长可达20余秒，面色发青，有时需别人将其推醒，晨起口干，白日困倦，反应力下降，不敢自己开车，曾有一次在开车时打盹，车撞到了树上，但患者无心悸，无夜游，无双下肢水肿。由于工作需要应酬，近期体重增加明显，常于睡眠前饮酒，饮酒后上述症状加重。    weight=94    assistCheck=①血常规：WBC 6.2×109/L，S 64%，L 35%，M 1%，RBC 6.10×1012/ L，Hb 172g/L，PLT 128×109/L。②血脂：血胆固醇、甘油三酯升高。③血糖、甲状腺功能、血浆皮质醇水平：正常。④血气分析（未吸氧）：pH 7.36，PaO2 78.2mmHg，PaCO2 36.4mmHg。⑤心电图、上气道CT、肺部CT、脑电图、头部CT：未见异常。⑥多导睡眠监测结果：呼吸暂停及低通气指数（AHI）42.6/h，大部分为阻塞性呼吸暂停和低通气，最长呼吸暂停时间51秒，夜间平均血氧饱和度91%，最低血氧饱和度78%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    阻塞性睡眠呼吸暂停综合征

呼吸科经典病历47行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=31    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=78    highBldPress=120    lowBldPress=70    personalHistory=患者为客户经理    previousHistory=既往身体健康
    ...    symptom=鼾声响亮、白日困倦3个月#####身高1.70m，BMI 33kg/m2，神志清楚，自主体位，咽腔略狭窄，口唇无发绀，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音，听诊呼吸音清。心界不大，心音纯，律整，各瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查未见异常。 现病史:鼾声响亮、白日困倦3个月，主要表现为夜间睡眠不实，入睡即打鼾，据同室者观察，鼾声停止时间最长可达20余秒，面色发青，有时需别人将其推醒，晨起口干，白日困倦，反应力下降，不敢自己开车，曾有一次在开车时打盹，车撞到了树上，但患者无心悸，无夜游，无双下肢水肿。由于工作需要应酬，近期体重增加明显，常于睡眠前饮酒，饮酒后上述症状加重。    weight=94    assistCheck=①血常规：WBC 6.2×109/L，S 64%，L 35%，M 1%，RBC 6.10×1012/ L，Hb 172g/L，PLT 128×109/L。②血脂：血胆固醇、甘油三酯升高。③血糖、甲状腺功能、血浆皮质醇水平：正常。④血气分析（未吸氧）：pH 7.36，PaO2 78.2mmHg，PaCO2 36.4mmHg。⑤心电图、上气道CT、肺部CT、脑电图、头部CT：未见异常。⑥多导睡眠监测结果：呼吸暂停及低通气指数（AHI）42.6/h，大部分为阻塞性呼吸暂停和低通气，最长呼吸暂停时间51秒，夜间平均血氧饱和度91%，最低血氧饱和度78%    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    极度肥胖伴低通气综合征

呼吸科经典病历48行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=父母均健康，无家族遗传性疾病。
    ...    gender=1    heartRate=88    highBldPress=160    lowBldPress=100    personalHistory=患者为公司职员，主要从事电脑工作    previousHistory=既往身体健康。近3年来患者体重显著增加，从80kg增至92.3kg，夜间鼾声响亮，影响同室人的睡眠，而且鼾声时断时续，自感睡眠不实，夜间反复觉醒，晨起口干、头晕，白日嗜睡
    ...    symptom=白日嗜睡、头晕2个月#####身高172 cm，BMI 31.2kg/m2，神志清楚，自主体位，咽腔略狭窄，口唇无发绀，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音，听诊可闻及散在干啰音。心界不大，心律整，主动脉瓣听诊区第二心音（A2）亢进，其他瓣膜区未闻及病理性杂音。腹部、四肢、神经等系统检查未见异常。 现病史:患者2个月前无明确诱因出现晨起头晕，白日严重嗜睡，影响正常工作，经常感到口干、疲乏，活动后有些气短，静息时无气短发生，且充分休息后症状无好转，双下肢无水肿，无耳鸣和活动、感觉障碍等伴随症状。曾自服“脑清片”，无效。    weight=92.3    assistCheck=①血常规：WBC 6.6×109/L，S 66%，L 33%，E 1%，RBC 5.92×1012/L，Hb 162g/L，PLT 228×109/L。②尿常规、血糖、血钾和血浆肾素、皮质醇水平正常。③血脂：血总胆固醇、甘油三酯升高。④血气分析（未吸氧）：pH 7.36，PaO2 78.2mmHg，PaCO2 36.4mmHg。⑤心脏彩超、心电图、头部CT、肾上腺CT、肾脏超声：未见异常。⑥睡眠呼吸暂停低通气指数（AHI）为48/h，其中95%为阻塞性睡眠呼吸暂停（彩图75-1），夜间平均血氧饱和度为89%，夜间最低血氧饱和度达75%，最长呼吸暂停时间55秒    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    阻塞性睡眠呼吸暂停综合征

呼吸科经典病历49行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=46    ageType=岁    allergyHistory=    bodyTempr=37.8    familyHistory=
    ...    gender=1    heartRate=106    highBldPress=160    lowBldPress=86    personalHistory=患者为教师，无特殊物质接触史。吸烟：400支/年，否认过敏史。常年生活在北方。    previousHistory=无慢性咳嗽、咳痰、喘息病史。慢性中耳炎6年。否认冠心病、高血压、糖尿病、高血脂等其他疾病。
    ...    symptom=发热、咳嗽1月余，气短1周#####慢性病容，轻度贫血貌，口唇无发绀，鼻窦无压痛，左耳听力减低。皮肤无破溃，未见Janeway损害。浅表淋巴结无肿大，胸廓对称，双肺呼吸音粗，双下肺可闻及少量湿啰音，心界不大，心率106次/分，律齐，各瓣膜听诊区未闻及病理性杂音，腹平软，无压痛、反跳痛，肝脾不大，肝肾区无叩痛，脊柱四肢关节无畸形，无明显肿胀，骨骼肌无压痛及疼痛，肌力正常。 现病史:患者1个月前出现发热，体温最高达38.7℃，伴有咳嗽、咳黄色痰，偶伴有血丝，痰量不多，无静置分层现象，无特殊气味，应用多种抗生素治疗无效。1周前患者出现气短，活动后明显，进行性加重，活动耐力明显下降，上两层楼需停下来休息，但无盗汗，无夜间憋醒，无心悸或胸前区疼痛，无肢体水肿，睡眠无打鼾。患者起病以来无明确关节肿痛、无周身其他感染灶、二便正常。发病以来体重减轻约7kg。    weight=    assistCheck=①肺增强CT示（入院时）：双肺多发结节影，中下肺野为主，中心密度减低，增强后强化明显（图77-2）。②尿系列：红细胞10～15/HP，畸形率85%，白细胞0/HP。③痰涂片查细菌、查结核菌、查真菌菌丝孢子均为阴性。痰培养及血培养未见致病菌生长。血清支原体、衣原体、军团菌、病毒抗体阴性，PPD试验：5mm×5mm。④真菌内毒素及抗原正常范围。肿瘤标志物正常，痰查瘤细胞阴性。⑤免疫球蛋白IgG、IgA、IgM和补体C3、C4均正常范围。T细胞亚群正常范围。⑥c-ANCA阳性，p-ANCA阴性。风湿免疫系列抗体阴性。⑦血常规：白细胞10.2×109/L，中性粒细胞73.2%，淋巴细胞20.5%，红细胞3.2×1012/L，Hb 97g/L，PLT 333×109/L；ESR 120mm/h，CRP159mg/L。⑨尿常规：潜血（++），蛋白（+），镜检RBC（+）。⑨肾功能、肝功能、血糖、血离子、便常规均在正常范围；HIV初筛阴性。⑩心电图：窦性心动过速。心脏彩超未见异常。11.动脉血气分析（未吸氧）：pH 7.42，PO2 68mmHg，PCO2 38mmHg。12.肺功能：轻度限制性通气功能障碍，弥散功能中度障碍。3影像学：外院胸片示：双肺多发大小不等结节影，中下肺野为著    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    韦格纳肉芽肿病

呼吸科经典病历50行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=33    ageType=岁    allergyHistory=    bodyTempr=37.9    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=75    personalHistory=患者为年轻男性，从事财会工作，无特殊粉尘等物质接触史。    previousHistory=过敏性鼻炎5年
    ...    symptom=反复发作性呼吸困难3年，加重伴腹痛、腹泻4天#####呼吸促，坐位。口唇轻度发绀，气管居中，无三凹征，胸廓对称，双侧呼吸运度对称，双肺叩诊呈清音，双肺闻及散在干啰音，未闻及湿啰音。心界不大，心音纯，律整，未闻及奔马律和各瓣膜区杂音。全腹部压痛，左侧较重，无反跳痛及肌紧张。四肢和神经系统检查未见异常。 现病史:3年来反复发作呼吸困难，按“哮喘”治疗，给予吸入糖皮质激素治疗可缓解，1年前发作时曾经伴有腹痛，未给予特殊处置，呼吸困难缓解后腹痛亦缓解。1个月前因自觉哮喘已好转，自行停用激素，4天前着凉后自觉“感冒”，呼吸困难加重伴发热，体温未测，自服感冒药，不见好转，并出现腹痛、腹泻，于家中自服蒙脱石、地衣芽胞杆菌等药物不见好转，呼吸困难加重，来诊。    weight=    assistCheck=①血常规：WBC 11.6×109/L；S 68%，L 21%，M 1%，E 10%；RBC 3.98×1012/L；Hb 136g/L；PLT 213×109/L。②尿常规：未见异常。③便常规+潜血：WBC：3-5/HP，潜血（+）。④CRP、IgE、p-ANCA：CRP、IgE水平升高，p-ANCA阳性。⑤动脉血气分析（未吸氧）：pH 7.43，PaO2 76.5mmHg，PaCO2 32.1mmHg。⑥胸部影像学：胸部X线未见明显异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    变应性肉芽肿性血管炎

呼吸科经典病历51行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=51    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=125    lowBldPress=85    personalHistory=患者为公司经理    previousHistory=既往身体健康，无粉尘、宠物等特殊接触史。另外，患者既往经常眼睛发红、干燥。
    ...    symptom=咳嗽、进行性呼吸困难3个月#####神志清楚，呼吸平稳，自主体位，在背部发现多个直径0.3～0.5cm的皮下结节（彩图81-1），质硬，无压痛，活动度可，不伴瘙痒，有的已消退，但留有色素沉着，双侧颈部各可触及一个0.5cm×0.5cm的淋巴结，质软，有压痛，锁骨上未触及肿大淋巴结，口唇无发绀，气管居中，胸廓对称，双侧呼吸运动一致，双肺叩诊呈清音，听诊可闻及散在干啰音。心界不大，心音纯，律整，未闻及奔马律和杂音。腹部、四肢、神经等系统检查未见异常。 现病史:本次发病无明确诱因，主要症状是咳嗽，偶有少许白色泡沫样痰，无发热，自以为是“感冒”，未予在意，但逐渐出现活动后呼吸困难，上楼时尤其明显，且这一症状进行性加重，但夜间尚可平卧睡眠，无夜间憋醒，无胸痛、心悸，无咯血，无双下肢水肿，未应用任何药物。皮肤结节为近2周出现，无疼痛，无瘙痒，可自行消退，自以为是蚊子叮咬，故未予在意。    weight=    assistCheck="1.肺功能检查结果：FEV1占预计值63%，PEF占预计值70%，VC占预计值75%，小气道功能轻度降低。2.眼科检查：双侧结膜炎和虹膜睫状体炎。3.心电图：一度房室传导阻滞。4.骨髓穿刺：红细胞系统增生活跃，以中晚幼红细胞为主，占32%，成熟红细胞形态正常。5.颈部超声：双侧颈部多发淋巴结肿大。6.腹部CT：腹腔内、腹膜后多发淋巴结肿大。7.纤维支气管镜：气管黏膜光滑，隆突略增宽，双侧各级支气管呈外压性狭窄，右肺中叶管壁可见小结节样突起。8.支气管肺泡灌洗结果：回收50ml，外观澄清，细胞分数为：MΦ 85%，L 15%，其中CD3+细胞 73%，CD4+细胞 43%，CD8+细胞 26%，灌洗液中SACE也明显升高。9.经纤维支气管镜肺活检结果：非干酪性类上皮肉芽肿。10.皮肤结节的病理结果：非干酪性类上皮肉芽肿。11.血常规：WBC 6.2×109/L，S 64%，L 35%，M 1%，RBC 6.14×1012/L，Hb 180g/L，PLT 238×109/L；12.ESR：22mm/h；13.PPD：阴性；14.血SACE、血钙、尿钙：均升高；15.痰液检查：阴性；16.血肿瘤标志物检查：阴性；17.动脉血气（未吸氧）：pH 7.38，PaO2 78mmHg，PaCO2 35.6mmHg；18.胸片：双侧肺门增大，双下肺间质样改变（图81-2）；19.肺CT：双侧肺门、纵隔淋巴结肿大，双下肺多发网格影、索条影"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    结节病

呼吸科经典病历52行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=父母均有高血压病，因脑出血去世。
    ...    gender=0    heartRate=90    highBldPress=160    lowBldPress=100    personalHistory=    previousHistory=既往高血压病10年，间断应用降压药（具体不详），血压控制情况不详。糖尿病10年。否认结核及粉尘接触史。
    ...    symptom=呼吸困难伴胸痛2个月#####未触及浅表淋巴结，神清，自主体位，口唇无发绀。气管居中。右下肺叩诊浊音，听诊右下肺呼吸音减弱，未闻及干湿啰音，心率90次/分，律齐，各瓣膜听诊区未闻及病理性杂音，腹平软，肝脾肋下未及。双下肢略有水肿，未见杵状指（趾） 现病史:患者于2个月前无明显诱因逐渐出现气短，以活动后明显，伴胸痛，与呼吸动度无关，偶咳黄白色黏痰，无咯血及发热。可平卧，无夜间阵发性呼吸困难，给予抗肿瘤化疗一个半月，自诉症状曾一度好转，近1个月气短加重，出现胸闷、喘鸣，为求进一步诊治来诊。发病以来体重无明显减轻。    weight=    assistCheck="1. 24小时尿钙 3.45mmol/L。2.血钙正常。3. 血清血管紧张素转换酶（SACE）95U。4.肺部增强CT 右侧胸腔积液，双肺门及纵隔淋巴结肿大，双肺内可见结节影，斑片影及条索影，未见增强。5. 纤维支气管镜肺泡灌洗及经支气管肺活检（TBLB）右侧支气管黏膜不光滑，管腔通畅，未见阻塞与狭窄，BALF液中：淋巴细胞35%，巨噬细胞65%，CD4+：35%，CD8+：23%，CD4+＞CD8+。纤维支气管镜病理诊断（TBLB）：结节病。6. 皮肤病理活检 符合结节病 7. 血常规 白细胞10.1×109/L，中性粒细胞72%。8. 痰查结核菌及PPD试验均阴性。9.痰查瘤细胞，肿瘤标志物，肝胆脾胰双肾彩超均未见异常。10. 心彩超+心功能及心电图 正常。11. 肺功能 混合性通气功能障碍和轻度弥散功能障碍。12.肝肾功能无异常，血气分析正常。13.胸腔积液检查 为渗出液，未查到结核菌和瘤细胞。14. 肺CT 双肺门及纵隔淋巴结肿大，双肺内可见斑片影及条索影，双肺下野见弥漫小结节影，右肺膨胀不全，右胸腔积液"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结节病

呼吸科经典病历53行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=38.1    familyHistory=
    ...    gender=0    heartRate=105    highBldPress=120    lowBldPress=80    personalHistory=    previousHistory=支气管扩张
    ...    symptom=反复咳嗽、咳大量脓痰40年，加重伴呼吸困难1周#####神志淡漠，自主体位，口唇发绀。皮肤黏膜干燥、弹性降低，皮下脂肪菲薄，肋间隙、锁骨上窝明显凹陷。气管居中，颈静脉轻度怒张，喉部可闻及痰鸣音。呼吸表浅，急促，胸廓对称，双肺呼吸运动一致，双肺可闻及痰鸣音，散在干鸣音。心界不大，心音纯，律齐，各瓣膜听诊区未闻及杂音。腹部凹陷，腹软，肋下未触及肝脾。杵状指（+）。 现病史:患者40年前受凉感冒后出现咳嗽、咳较多的黄色脓痰，伴发热，在当地医院诊断为“肺内感染”，给予青霉素抗感染治疗后缓解。此后反复出现咳嗽、咳大量脓痰，有时伴发热，应用抗生素治疗后咳嗽咳痰可减轻。近5年来咳嗽呈持续性，晨起咳痰较多，伴有大量脓痰，有时发热，发热时咳嗽加重，痰量增多，间断咯血。1周前，受凉感冒后再次出现咳嗽、咳大量黄色脓痰，伴发热，体温最高38.5℃，抗生素治疗后症状无缓解，痰液无力咳出，开始出现进行性呼吸困难、夜间可平卧入睡，为进一步诊治入院。患者平素素食，睡眠较差，二便正常。    weight=    assistCheck=①血常规：WBC 15.6 ×109/L；S 92%，L 12%，M 3%，E%2%；RBC 3.2×1012/L；Hb 90g/L；PLT 132×109/L。②胸部X线：双肺纹理增强、紊乱，多个不规则的环形透光阴影，部分可见液平（图88-1）。③动脉血气分析（未吸氧）：pH 7.29，PaO2 48mmHg，PaCO78 mmHg，HCO－ 28.1mmol/L。④血生化：K+ 3.15mmol/L，Cl－ 87mmol/L，Na+ 130mmol/L，血清总蛋白：45g/L，血清白蛋白：23g/L，余大致正常。⑤血清支原体、衣原体、军团菌、病毒抗体阴性。⑥痰涂片：可见革兰阴性杆菌；痰培养：待3天后出结果。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    支气管扩张

呼吸科经典病历54行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=81    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无肿瘤家族史
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=吸烟史800年支。无饲养鸽子及家禽史    previousHistory=60年前有肺结核病史，未正规治疗。
    ...    symptom=咳嗽1个月##### 现病史:"患者1个月前无明显诱因出现咳嗽，咳少许白色泡沬痰，无发热，无咯血，无胸闷、气急，无声嘶，无阵发性呼吸困难。给予抗感染、化痰等治疗后，患者症状无明显改善。为进一步诊治入院"    weight=    assistCheck="1.血常规：RBC 4.l2x1012/L, WBC 9.46x109/L, N78%，PLT 247x109/L。2.生化：ALT 19 IU/L, AST 17 IU/L, ALP 123 IU/L, TB 9 μmoI/L, DB 3 μmoI/L, TP 73 g/L，Alb 39 g/L, UA 275 μmoI/L, Ur 9.7 mmol/L, Cr 78 μmoI/L, Glu 8.3 mmol/L,钾4.3 mmol/L, 钠 141 mmol/L,氯 102 mmol/L。3.动脉血 pH 7.46, PaCO2 32.6 mmHg, PaO2 84 mmHg, SaO2 97.6%。4.凝血功能：PT 11.5s,INR 1.03, FIB 5.43 g/L, APTT 26.9 s， TT 14.5 s, AT-Ⅲ 94.0%，D-二聚体 113 ng/ml, FDPs 1.9 μg/ml。5.血T-SPOT： A抗原4 个，B抗原20个。6.血肿瘤标志物：CEA 0.88μg/L,NSE 14.64 ng/ml，,CYFRA21-1 2.55 ng/ml。7.结核涂片：荧光染色抗酸杆菌阴性。8.骨ECT:未见明显异常。10.肺部FDG：双肺内散在多处异常放射性浓聚灶，以左肺为著，T/NT最大值为13.17，考虑肺癌伴双肺内转移可能。11.纵隔淋巴结显像：两侧肺门及纵隔淋巴结未见明显异常放射性浓聚。12.肿瘤断层显像：双肺内可见散在多处斑块状异常放射性浓聚灶，以左肺为著，考虑恶性病变伴转移可能。13.脑部MRI：老年脑，脑内多发缺血灶。14.左肺穿刺：见少量炎性细胞及组织细胞，未见恶性细胞；活检病理：特染结果PAS( + )、六胺银（+ )，支持隐球菌。15.胸部CT：两肺浸润影，感染可能性大"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺隐球菌病

呼吸科经典病历55行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=53    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无肿瘤家族史
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=有吸烟史600年支。曾为开山风钻工，干式作业兼挖煤，工作时间共30年    previousHistory=
    ...    symptom=咳嗽、咳痰伴胸闷、气促1周##### 现病史:患者1周前无明显诱因出现咳嗽、咳痰伴胸闷、气促，咳少量白色泡沫痰，无发热，无胸痛，未予重视，其后症状呈进行性加重，活动后气促明显。我院胸部CT示“两肺多发结节影，两肺上叶实变团块影，纵隔、肺门多组淋巴结肿大，左侧胸腔积液”，为进一步诊治收入我院。病程中患者睡眠可，无明显体重减轻，无盗汗。    weight=    assistCheck=1.支气管镜检查未见异常；2.胸腔积液未找到恶性细胞；3.右肺穿刺见少量坏死组织，未见细胞成分，活检病理见纤维胶原组织伴少量钙化；左肺穿刺未见恶性细胞，活检病理见坏死组织    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺尘埃沉着病

呼吸科经典病历56行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom= 现病史:    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胆石病

呼吸科经典病历56行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=57    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=无肿瘤家族史
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=吸烟史500年支。曾在煤矿掘并30余年    previousHistory=
    ...    symptom=咳嗽、咳痰1个月##### 现病史:患者1个月前无明显诱因出现咳嗽、咳痰，无发热，无胸闷、气急，自行止咳、化痰等对症处理，其后症状持续。外院胸部CT示“右肺上叶团块影，其内空洞，两肺多发小结节”，放射性核素骨ECT示“右前第一肋骨异常浓聚”，为进一步诊治收人我院。病程中患者睡眠可，胃纳可，体重无明显减轻。    weight=    assistCheck=1.胸部CT示右肺上叶软组织肿块伴空洞，两肺多发斑片、结节影。2.结核抗体阴性，血T-SPOT为弱阳性，痰结核杆菌涂片示抗酸杆菌阴性。3.血肿瘤标志物：CEA 3.11μg/L，NSE 13.49ng/ml，CYFRA21-1 3.89支气管ng/ml。4.肿瘤断层显像：双肺斑片状异常放射性浓聚，右上肺病灶T/NT最大值 3.08，考虑双肺感染等良性病变可能。5.纵隔淋巴结显像：双肺门及纵隔淋巴结明显异常放射性浓聚。6.肺部FDG：双肺斑片状异常放射性浓聚，考虑良性病变可能。7.右肺穿刺：见 少量组织细胞，未见恶性细胞；活检病理未见正常肺组织结构，纤维组织增生伴粉尘沉积    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺尘埃沉着病

呼吸科经典病历57行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=39    familyHistory=
    ...    gender=0    heartRate=120    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=
    ...    symptom=发热伴咳嗽、咳痰3天#####全身皮肤黏膜及巩膜无黄染，无皮肤溃烂及疖痈，全身浅表淋巴结未触及肿大咽部黏膜无充血，扁桃体无肿大。胸廓外形无异常，双肺可闻及散在湿啰音。心脏各瓣膜未闻及器质性杂音。腹软无压痛，双下肢无水肿。四肢活动良好，肌力正常，生理反射存在，病理征未引出 现病史:患者3天前受凉后出现咽部疼痛，全身不适，发热，自测体温为39℃，伴有气短、寒战、咳嗽、咳痰，痰为白色黏痰，量少不容易咳出，无咯血、盗汗，无腹泻、便血。下肢无水肿，四肢关节无疼痛。自行服用抗生素和退热药物治疗3天，但未见有任何好转，体温波动在38～39℃之间。病程中患者精神、饮食差。。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    葡萄球菌性肺炎

呼吸科经典病历58行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=0    heartRate=77    highBldPress=135    lowBldPress=94    personalHistory=既往有“胃病”病史10余年，未治疗，常感上腹不适，进食及饮水后易呕吐。    previousHistory=
    ...    symptom=咳嗽，喘息11天，进食后加重#####SpO296%，营养较差，端坐位，呼吸稍急促，浅表淋巴结不大，两肺呼吸音粗，可闻及散在分布较多呼气相哮鸣音及干啰音，心界不大，心率77次／分，舟状腹，剑突下轻压痛，无反跳痛，肝脾不大，双下肢不肿。 现病史:患者11天前反酸、呕吐后出现咳嗽、喘息、气促，不能平卧，伴全身大汗，持续约1小时后自行缓解。数日来喘息症状反复发作，多在活动或进食后诱发或加重。给予抗感染及化痰、解痉等对症治疗，症状无明显改善，轻微活动后及夜间仍有喘息发作，遂至我科就诊。起病以来，精神、睡眠欠佳，进食极少，进食进饮后呕吐，大便干结，小便正常。    weight=    assistCheck=血常规检查：白细胞计数、血色素及血小板正常，中性粒细胞79.6%，动脉血气（未吸氧）pH7.45，PCO239mmHg，PO282mmHg。肝功能、肾功能、心肌酶、电解质正常，血沉：26mm／h。结核纯蛋白衍生物（PPD）IgG、IgM，金标结核抗体（结明试验）均为阴性，G试验、人半乳甘露聚糖（GM试验）均（－）；2次痰培养（－）。肺部CT检查：双肺见斑片状模糊阴影，以左下肺明显；食管明显扩张，其内可见内容物影；气管、主支气管及双侧下叶支气管受压变窄。食管钡餐：食管下端典型鸟嘴状改变，近端扩张明显    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    吸入性肺炎

呼吸科经典病历59行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=54    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=父亲有高血压病
    ...    gender=0    heartRate=88    highBldPress=110    lowBldPress=70    personalHistory=无特殊    previousHistory=无特殊
    ...    symptom=反复咳嗽、咯血、咳脓痰28年，再发加重3天#####贫血貌，全身皮肤巩膜无黄染，浅表淋巴结未扪及，胸廓对称，双肺叩诊清音，呼吸音稍低，未闻及干湿啰音，心前区无隆起，心界不大，心率88次／分，律齐，各瓣膜区未闻及病理性杂音。腹平软，无压痛反跳痛，肝脾未触及，移动性浊音阴性，双肾区无叩痛，脊柱四肢、神经系统检查正常。 现病史:患者28年前开始反复出现咳痰，咳绿色脓痰伴咯血，自服“白芨粉、复方甘草片”，疗效不佳，症状反复发作，在当地诊所对症治疗。17年前咯血加重，查血红蛋白30g／L，在长沙市某医院诊断为“支气管扩张”，当时发现右下肺有肿块，未进一步检查，后仍反复发作，未诊治。1年前症状加重，在当地某市医院治疗，好转出院，出院后仍反复发作咯血。3天前咯血再发加重，咯血量200～300ml／d，间歇咳脓痰，在当地医院输液无好转，遂来我院。    weight=    assistCheck=血常规WBC5.6×109／L，N83.1%↑，Hb71g／L↓；大小便常规、肝肾功能、电解质、血气分析、凝血功能、结核全套、真菌全套均（－）；痰涂片找抗酸杆菌、痰培养均（－）。肺部CT示：①右下肺背段至后基底段见软组织团块影，其内密度不均匀，中心可见圆形稍低密度区，周围可见纤维化和片状影；②左侧多发囊性病变，肺大疱可能性大，不完全除外轻度囊性支扩张；③局部心包增厚。经皮肺穿刺活检，病理显示镜下为曲霉菌病    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    侵入性肺曲霉病

呼吸科经典病历59行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=54    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=父亲有高血压病
    ...    gender=0    heartRate=88    highBldPress=110    lowBldPress=70    personalHistory=无特殊    previousHistory=无特殊
    ...    symptom=反复咳嗽、咯血、咳脓痰28年，再发加重3天#####贫血貌，全身皮肤巩膜无黄染，浅表淋巴结未扪及，胸廓对称，双肺叩诊清音，呼吸音稍低，未闻及干湿啰音，心前区无隆起，心界不大，心率88次／分，律齐，各瓣膜区未闻及病理性杂音。腹平软，无压痛反跳痛，肝脾未触及，移动性浊音阴性，双肾区无叩痛，脊柱四肢、神经系统检查正常。 现病史:患者28年前开始反复出现咳痰，咳绿色脓痰伴咯血，自服“白芨粉、复方甘草片”，疗效不佳，症状反复发作，在当地诊所对症治疗。17年前咯血加重，查血红蛋白30g／L，在长沙市某医院诊断为“支气管扩张”，当时发现右下肺有肿块，未进一步检查，后仍反复发作，未诊治。1年前症状加重，在当地某市医院治疗，好转出院，出院后仍反复发作咯血。3天前咯血再发加重，咯血量200～300ml／d，间歇咳脓痰，在当地医院输液无好转，遂来我院。    weight=    assistCheck=血常规WBC5.6×109／L，N83.1%↑，Hb71g／L↓；大小便常规、肝肾功能、电解质、血气分析、凝血功能、结核全套、真菌全套均（－）；痰涂片找抗酸杆菌、痰培养均（－）。肺部CT示：①右下肺背段至后基底段见软组织团块影，其内密度不均匀，中心可见圆形稍低密度区，周围可见纤维化和片状影；②左侧多发囊性病变，肺大疱可能性大，不完全除外轻度囊性支扩张；③局部心包增厚。经皮肺穿刺活检，病理显示镜下为曲霉菌病    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺曲霉病

呼吸科经典病历60行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=138    lowBldPress=95    personalHistory=    previousHistory=既往有2型糖尿病、高血压病史，血压血糖控制良好。有夜间打鼾及夜间憋气的现象3年。
    ...    symptom=咳嗽、喘息5个月，加重40余天#####SpO294%。双肺呼吸音低，可闻及大量哮鸣音，未闻及湿啰音。 现病史:患者入院前5个月开始咳嗽、咳痰伴有喘息，入院前40天因受凉后出现咳嗽、喘息症状加重，于当地医院就诊，胸片检查发现双肺渗出病变，给予抗感染、解痉、平喘等治疗后症状无好转，遂转入我院。    weight=    assistCheck=三大常规、肝肾功能、血脂、电解质、血沉、C反应蛋白均（－）；血气分析pH7.437，PaO261﹒2mmHg↓，PaCO251﹒4mmHg↑；肺功能＋支气管扩张试验：轻度阻塞性肺通气功能障碍，扩张试验阴性；心脏彩超：主动脉硬化，心内结构无明显异常，左室顺应性下降；睡眠呼吸监测示：①符合睡眠呼吸暂停低通气综合征，阻塞型为主，轻度；②夜间睡眠低氧血症（中度）。胸部CT示双下肺斑片状模糊影，以下肺内基底段明显，余支气管血管束增粗，所示气管支气管通畅。多次痰培养示较多曲霉菌生长；GM试验18.3ng／ml，明显升高，免疫球蛋白IgE0.54mg／L↑    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    睡眠呼吸暂停低通气综合征

呼吸科经典病历60行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=138    lowBldPress=95    personalHistory=    previousHistory=既往有2型糖尿病、高血压病史，血压血糖控制良好。有夜间打鼾及夜间憋气的现象3年。
    ...    symptom=咳嗽、喘息5个月，加重40余天#####SpO294%。双肺呼吸音低，可闻及大量哮鸣音，未闻及湿啰音。 现病史:患者入院前5个月开始咳嗽、咳痰伴有喘息，入院前40天因受凉后出现咳嗽、喘息症状加重，于当地医院就诊，胸片检查发现双肺渗出病变，给予抗感染、解痉、平喘等治疗后症状无好转，遂转入我院。    weight=    assistCheck=三大常规、肝肾功能、血脂、电解质、血沉、C反应蛋白均（－）；血气分析pH7.437，PaO261﹒2mmHg↓，PaCO251﹒4mmHg↑；肺功能＋支气管扩张试验：轻度阻塞性肺通气功能障碍，扩张试验阴性；心脏彩超：主动脉硬化，心内结构无明显异常，左室顺应性下降；睡眠呼吸监测示：①符合睡眠呼吸暂停低通气综合征，阻塞型为主，轻度；②夜间睡眠低氧血症（中度）。胸部CT示双下肺斑片状模糊影，以下肺内基底段明显，余支气管血管束增粗，所示气管支气管通畅。多次痰培养示较多曲霉菌生长；GM试验18.3ng／ml，明显升高，免疫球蛋白IgE0.54mg／L↑    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺曲霉病

呼吸科经典病历60行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36    familyHistory=
    ...    gender=0    heartRate=106    highBldPress=138    lowBldPress=95    personalHistory=    previousHistory=既往有2型糖尿病、高血压病史，血压血糖控制良好。有夜间打鼾及夜间憋气的现象3年。
    ...    symptom=咳嗽、喘息5个月，加重40余天#####SpO294%。双肺呼吸音低，可闻及大量哮鸣音，未闻及湿啰音。 现病史:患者入院前5个月开始咳嗽、咳痰伴有喘息，入院前40天因受凉后出现咳嗽、喘息症状加重，于当地医院就诊，胸片检查发现双肺渗出病变，给予抗感染、解痉、平喘等治疗后症状无好转，遂转入我院。    weight=    assistCheck=三大常规、肝肾功能、血脂、电解质、血沉、C反应蛋白均（－）；血气分析pH7.437，PaO261﹒2mmHg↓，PaCO251﹒4mmHg↑；肺功能＋支气管扩张试验：轻度阻塞性肺通气功能障碍，扩张试验阴性；心脏彩超：主动脉硬化，心内结构无明显异常，左室顺应性下降；睡眠呼吸监测示：①符合睡眠呼吸暂停低通气综合征，阻塞型为主，轻度；②夜间睡眠低氧血症（中度）。胸部CT示双下肺斑片状模糊影，以下肺内基底段明显，余支气管血管束增粗，所示气管支气管通畅。多次痰培养示较多曲霉菌生长；GM试验18.3ng／ml，明显升高，免疫球蛋白IgE0.54mg／L↑    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    变态反应性支气管肺曲霉病

呼吸科经典病历61行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=61    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=100    lowBldPress=70    personalHistory=护士，起病前1年有短暂的饲鸽史    previousHistory=既往体健
    ...    symptom=体格检查发现双下肺多发性小结节状阴影9天#####全身皮肤黏膜无黄染、浅表淋巴结不大，气管居中，两肺呼吸音清晰，心界不大，心率96次／分，腹软，肝脾不大，双下肢不肿。 现病史:患者9天前体检时，胸片发现左下肺结节状致密影，并行肺CT扫描发现双下肺多发性小结节病灶而收住入院。起病后无发热、咳嗽、胸痛及咯血等症状。    weight=    assistCheck=血常规、血沉、腺苷脱氨酶（ADA）、血管紧张素转换酶（ACE）、ECG和腹部B超均正常；癌胚抗原（CEA），癌抗原125（CA125），甲胎蛋白（AFP），PPD‐IgG和IgM均为阴性。胸片：左下肺结节状致密影。肺CT：双下肺近胸膜下多个类圆形小结节状影，密度均匀，边界欠清晰，直径0.5～1.0cm不等，边缘未见明显分叶及毛刺，未见空泡征，气管、主支气管通畅，纵隔内未见肿大的淋巴结。左下肺结节病理组织切片诊断：肺隐球菌病，肺组织内有巨细胞性肉芽肿形成，肉芽肿的组织内有大量单核细胞、多核细胞及淋巴细胞，间质内有较多纤维组织增生，肺泡有萎缩。PAS染色检查发现有较多隐球菌，墨汁染色显示较多的隐球菌荚膜。免疫组化：CK（－），EMA（－），CD68（＋），Lys（＋），示多核巨细胞内有隐球菌    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺隐球菌病

呼吸科经典病历62行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=112    highBldPress=106    lowBldPress=79    personalHistory=    previousHistory=
    ...    symptom=咳嗽、咳痰、发热20天#####浅表淋巴结不大，左肺呼吸音减低，未闻及干、湿啰音，心界不大，心率112次／分，腹部（－），双下肢不肿。 现病史:患者20天前受凉后出现咳嗽、咳较多黄色脓痰，痰中带咖啡色硬块，有畏寒发热，体温最高达41℃，伴活动后气促，予抗感染治疗后体温逐渐下降，气促改善，但咳嗽、咳痰无明显好转。起病以来，患者精神、睡眠、食欲尚可，体重下降约10kg。    weight=    assistCheck=血常规：白细胞、中性粒细胞均正常，血红蛋白79g／L；肝功能：白蛋白27.6g／L，余正常；肾功能正常，G试验、GM试验均（－）；可提取性核抗原（ENA）14项：抗SSA抗体、抗SSB抗体、Ro‐52、抗M2抗体均为（＋＋＋），肺部CT：①左肺上叶多房空洞，左肺渗出及增殖灶；②纵隔淋巴结肿大。痰培养：发现毛霉菌2次，发现鲍曼不动杆菌1次。支气管镜检查，镜下提示为左上叶上分支化脓性炎症，于左上叶前支行肺组织活检，病理组织学检查提示符合毛霉菌性肺脓肿；组织培养：鲍曼不动杆菌生长    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性肺脓肿

呼吸科经典病历62行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=40    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=0    heartRate=112    highBldPress=106    lowBldPress=79    personalHistory=    previousHistory=
    ...    symptom=咳嗽、咳痰、发热20天#####浅表淋巴结不大，左肺呼吸音减低，未闻及干、湿啰音，心界不大，心率112次／分，腹部（－），双下肢不肿。 现病史:患者20天前受凉后出现咳嗽、咳较多黄色脓痰，痰中带咖啡色硬块，有畏寒发热，体温最高达41℃，伴活动后气促，予抗感染治疗后体温逐渐下降，气促改善，但咳嗽、咳痰无明显好转。起病以来，患者精神、睡眠、食欲尚可，体重下降约10kg。    weight=    assistCheck=血常规：白细胞、中性粒细胞均正常，血红蛋白79g／L；肝功能：白蛋白27.6g／L，余正常；肾功能正常，G试验、GM试验均（－）；可提取性核抗原（ENA）14项：抗SSA抗体、抗SSB抗体、Ro‐52、抗M2抗体均为（＋＋＋），肺部CT：①左肺上叶多房空洞，左肺渗出及增殖灶；②纵隔淋巴结肿大。痰培养：发现毛霉菌2次，发现鲍曼不动杆菌1次。支气管镜检查，镜下提示为左上叶上分支化脓性炎症，于左上叶前支行肺组织活检，病理组织学检查提示符合毛霉菌性肺脓肿；组织培养：鲍曼不动杆菌生长    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺脓肿

呼吸科经典病历63行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=52    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=110    lowBldPress=68    personalHistory=患者有生食螃蟹史    previousHistory=
    ...    symptom=反复咳嗽咳痰1个月余#####神清合作，全身浅表淋巴结未扪及肿大。双下肺呼吸音稍低，未闻及明显干、湿啰音。 现病史:患者1个多月前受凉后出现咳嗽、咳痰，伴发热，为午后低热，最高达38℃，先后给予抗感染、抗结核治疗，症状无缓解。为求进一步诊治，来我院就诊。外院肺部CT：双肺小结节灶，两侧胸腔少量积液。    weight=    assistCheck=血常规：WBC3.8×109／L↓，N48.9%↓，嗜酸性粒细胞635×106／L↑，嗜酸性粒细胞比值16.7%↑；补体C30﹒68g／L↓；免疫球蛋白IgM3.92g／L↑，IgE 0﹒64mg／L↑；结核抗体IgG（＋），IgM（－），结明试验（＋）；寄生虫抗体示肺吸虫抗体（＋）。大小便常规、血沉、肿瘤标志物、支原体抗体、衣原体抗体、军团菌抗体、甲状腺功能、HIV抗体均（－）；痰找抗酸杆菌（－）；SPECT示甲状腺右叶温结节。肺吸虫皮试及肺吸虫确诊实验（＋）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺吸虫病

呼吸科经典病历64行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=47    ageType=岁    allergyHistory=    bodyTempr=37.9    familyHistory=父亲53岁时因肺癌去世
    ...    gender=1    heartRate=113    highBldPress=111    lowBldPress=69    personalHistory=工人。吸烟，20～40支／天    previousHistory=
    ...    symptom=发热、咳嗽、右侧胸痛1个月余#####右侧锁骨上窝可扪及一约1.5cm×1.5cm大小淋巴结，活动度稍差，左侧腋窝可扪及一约黄豆大小淋巴结，质中等，活动度可，右侧头皮静脉稍曲张，颈静脉稍怒张，右侧上肺野及左侧饱满，右侧胸部静脉曲张，向下回流受阻，双侧呼吸动度对称，语颤无增强，右下肺叩诊浊音，左侧叩诊清音，右肺呼吸音低，左侧呼吸音清晰，未闻及干湿啰音。心率113次／分，律齐，各瓣膜区未闻及病理性杂音，腹部检查无异常。 现病史:患者1个月余前无明显诱因出现发热，多为晚上发生，体温波动在37.9～38℃，不伴畏寒、寒战，曾高热3次，达40℃，咳嗽，起初为阵发性干咳，近3天有少量白色黏液痰，无黄痰及咯血，伴右侧胸痛，呈持续性钝痛，无放射痛，咳嗽时明显，晨起感右上肢麻木，稍有盗汗、乏力，未引起重视及特殊处理。1个月前当地市医院住院，行胸部CT示右上肺尖占位病，2次经皮肺穿刺分别为黏膜慢性炎，肺泡上皮增生，炎性假瘤可能，未见癌细胞。腹部B超：脾大，双肾囊肿。血常规WBC56.7×109／L，PLT1071×109／L；骨髓涂片：骨髓增生极度活跃，粒系增生极度活跃，中晚幼粒比值增加，红系增生偏低，巨核细胞数量明显增多，血小板聚集成堆，成片。予头孢他啶抗感染，后予“头孢哌酮／舒巴坦、喹诺酮类”，仍发热，体温为38～38.6℃，为进一步治疗入住我院。    weight=    assistCheck=多次查血常规：WBC15×109～22.4×109／L↑，N77.1%以上↑，Hb98～108g／L↓，PLT867×109～1200×109／L↑；肝功能ALB29.9g／L↓；血沉119mm／h↑；凝血功能FDP11.4μg／ml↑，D‐二聚体5.35μg／ml↑；肿瘤标记物CA125138.17kU／ml↑；大小便常规、肾功能、结核全套均（－）。胸水常规：黄色浑浊，无凝固，李凡他试验阳性，细胞总数3350×106／L，WBC2000×106／L，单核10%，多核90%；胸水生化TP43.4g／L，ALB21.7g／L，LDH270.1U／L，GLU7.39mmol／L，CL 102mmol／L。胸水结核全套（－）；胸水ADA10.1U／L；胸水CEA0.3ng／ml。胸水超薄层细胞学：较多分叶核细胞，间皮细胞，未见恶性细胞。支气管镜检查，镜下为右上叶支气管黏膜肿胀，未见肿块，在右上叶尖支行肺活检，切片结果为炎性肉芽样组织，小灶似坏死，抗酸染色未找见结核杆菌；刷检涂片示：血性背景中灶性炎症细胞，一个多核巨细胞，可疑结核巨细胞，未见癌细胞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺结核

呼吸科经典病历64行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=47    ageType=岁    allergyHistory=    bodyTempr=37.9    familyHistory=父亲53岁时因肺癌去世
    ...    gender=1    heartRate=113    highBldPress=111    lowBldPress=69    personalHistory=工人。吸烟，20～40支／天    previousHistory=
    ...    symptom=发热、咳嗽、右侧胸痛1个月余#####右侧锁骨上窝可扪及一约1.5cm×1.5cm大小淋巴结，活动度稍差，左侧腋窝可扪及一约黄豆大小淋巴结，质中等，活动度可，右侧头皮静脉稍曲张，颈静脉稍怒张，右侧上肺野及左侧饱满，右侧胸部静脉曲张，向下回流受阻，双侧呼吸动度对称，语颤无增强，右下肺叩诊浊音，左侧叩诊清音，右肺呼吸音低，左侧呼吸音清晰，未闻及干湿啰音。心率113次／分，律齐，各瓣膜区未闻及病理性杂音，腹部检查无异常。 现病史:患者1个月余前无明显诱因出现发热，多为晚上发生，体温波动在37.9～38℃，不伴畏寒、寒战，曾高热3次，达40℃，咳嗽，起初为阵发性干咳，近3天有少量白色黏液痰，无黄痰及咯血，伴右侧胸痛，呈持续性钝痛，无放射痛，咳嗽时明显，晨起感右上肢麻木，稍有盗汗、乏力，未引起重视及特殊处理。1个月前当地市医院住院，行胸部CT示右上肺尖占位病，2次经皮肺穿刺分别为黏膜慢性炎，肺泡上皮增生，炎性假瘤可能，未见癌细胞。腹部B超：脾大，双肾囊肿。血常规WBC56.7×109／L，PLT1071×109／L；骨髓涂片：骨髓增生极度活跃，粒系增生极度活跃，中晚幼粒比值增加，红系增生偏低，巨核细胞数量明显增多，血小板聚集成堆，成片。予头孢他啶抗感染，后予“头孢哌酮／舒巴坦、喹诺酮类”，仍发热，体温为38～38.6℃，为进一步治疗入住我院。    weight=    assistCheck=多次查血常规：WBC15×109～22.4×109／L↑，N77.1%以上↑，Hb98～108g／L↓，PLT867×109～1200×109／L↑；肝功能ALB29.9g／L↓；血沉119mm／h↑；凝血功能FDP11.4μg／ml↑，D‐二聚体5.35μg／ml↑；肿瘤标记物CA125138.17kU／ml↑；大小便常规、肾功能、结核全套均（－）。胸水常规：黄色浑浊，无凝固，李凡他试验阳性，细胞总数3350×106／L，WBC2000×106／L，单核10%，多核90%；胸水生化TP43.4g／L，ALB21.7g／L，LDH270.1U／L，GLU7.39mmol／L，CL 102mmol／L。胸水结核全套（－）；胸水ADA10.1U／L；胸水CEA0.3ng／ml。胸水超薄层细胞学：较多分叶核细胞，间皮细胞，未见恶性细胞。支气管镜检查，镜下为右上叶支气管黏膜肿胀，未见肿块，在右上叶尖支行肺活检，切片结果为炎性肉芽样组织，小灶似坏死，抗酸染色未找见结核杆菌；刷检涂片示：血性背景中灶性炎症细胞，一个多核巨细胞，可疑结核巨细胞，未见癌细胞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    结核性胸膜炎

呼吸科经典病历64行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=47    ageType=岁    allergyHistory=    bodyTempr=37.9    familyHistory=父亲53岁时因肺癌去世
    ...    gender=1    heartRate=113    highBldPress=111    lowBldPress=69    personalHistory=工人。吸烟，20～40支／天    previousHistory=
    ...    symptom=发热、咳嗽、右侧胸痛1个月余#####右侧锁骨上窝可扪及一约1.5cm×1.5cm大小淋巴结，活动度稍差，左侧腋窝可扪及一约黄豆大小淋巴结，质中等，活动度可，右侧头皮静脉稍曲张，颈静脉稍怒张，右侧上肺野及左侧饱满，右侧胸部静脉曲张，向下回流受阻，双侧呼吸动度对称，语颤无增强，右下肺叩诊浊音，左侧叩诊清音，右肺呼吸音低，左侧呼吸音清晰，未闻及干湿啰音。心率113次／分，律齐，各瓣膜区未闻及病理性杂音，腹部检查无异常。 现病史:患者1个月余前无明显诱因出现发热，多为晚上发生，体温波动在37.9～38℃，不伴畏寒、寒战，曾高热3次，达40℃，咳嗽，起初为阵发性干咳，近3天有少量白色黏液痰，无黄痰及咯血，伴右侧胸痛，呈持续性钝痛，无放射痛，咳嗽时明显，晨起感右上肢麻木，稍有盗汗、乏力，未引起重视及特殊处理。1个月前当地市医院住院，行胸部CT示右上肺尖占位病，2次经皮肺穿刺分别为黏膜慢性炎，肺泡上皮增生，炎性假瘤可能，未见癌细胞。腹部B超：脾大，双肾囊肿。血常规WBC56.7×109／L，PLT1071×109／L；骨髓涂片：骨髓增生极度活跃，粒系增生极度活跃，中晚幼粒比值增加，红系增生偏低，巨核细胞数量明显增多，血小板聚集成堆，成片。予头孢他啶抗感染，后予“头孢哌酮／舒巴坦、喹诺酮类”，仍发热，体温为38～38.6℃，为进一步治疗入住我院。    weight=    assistCheck=多次查血常规：WBC15×109～22.4×109／L↑，N77.1%以上↑，Hb98～108g／L↓，PLT867×109～1200×109／L↑；肝功能ALB29.9g／L↓；血沉119mm／h↑；凝血功能FDP11.4μg／ml↑，D‐二聚体5.35μg／ml↑；肿瘤标记物CA125138.17kU／ml↑；大小便常规、肾功能、结核全套均（－）。胸水常规：黄色浑浊，无凝固，李凡他试验阳性，细胞总数3350×106／L，WBC2000×106／L，单核10%，多核90%；胸水生化TP43.4g／L，ALB21.7g／L，LDH270.1U／L，GLU7.39mmol／L，CL 102mmol／L。胸水结核全套（－）；胸水ADA10.1U／L；胸水CEA0.3ng／ml。胸水超薄层细胞学：较多分叶核细胞，间皮细胞，未见恶性细胞。支气管镜检查，镜下为右上叶支气管黏膜肿胀，未见肿块，在右上叶尖支行肺活检，切片结果为炎性肉芽样组织，小灶似坏死，抗酸染色未找见结核杆菌；刷检涂片示：血性背景中灶性炎症细胞，一个多核巨细胞，可疑结核巨细胞，未见癌细胞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胸膜炎

呼吸科经典病历65行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=36.1    familyHistory=
    ...    gender=1    heartRate=98    highBldPress=120    lowBldPress=82    personalHistory=农民，瑶族    previousHistory=
    ...    symptom=反复发作性晕厥1年半，加重伴活动后胸闷气促1个月余#####神志清楚，自动体位，全身皮肤黏膜无黄染，全身浅表淋巴结无肿大。口唇无发绀，气管居中。胸廓无畸形，双肺叩诊清音，呼吸音清晰，未闻及干湿啰音及胸膜摩擦音。心脏、腹部、脊柱四肢和神经系统查体未见明显异常。 现病史:患者自述1年半前晨起收衣服时突发胸闷、气促、头晕，跌倒在地，当时呼之不应，无抽搐及呕吐，无大小便失禁，约2分钟后自行苏醒，未予特殊处理。1个月后推人力车时上述症状再发，跌倒在地致头部摔伤，2分钟后自行苏醒，被护送至当地县医院治疗，查头部CT未见异常，予头部外伤处理出院。此后1年间上述症状偶有发作，均休息后缓解。1个多月前症状再发，并伴有活动后胸闷气促，夜间能平卧，双下肢无水肿，住院，查心脏彩超：①心脏各房室腔大小未见异常；②重度肺动脉高压；③左室舒张功能减退，治疗7天后无明显缓解。2011年11月2日，患者解大便后症状再发，晕厥伴大汗淋漓，2分钟后苏醒，为求进一步诊治遂入我院。起病以来，精神、食欲、二便均可，体重无明显变化。    weight=    assistCheck=肝功能ALT172.7U／L↑，AST70.2U／L↑；脑钠肽1658pg／ml↑；血气分析（未吸氧）pH7.44，PCO238﹒4mmHg，PO268﹒0mmHg↓，SaO294%。血常规、大小便常规、肾功能、血糖均（－）。胸部CT示：①双肺间质性病变，以渗出为主；②右房右室稍大，肺动脉主干稍增粗。心电图示：①窦性心动过速；②不完全性右束支传导阻滞；③电轴右偏。心脏彩超：肺心病声像，左室顺应性减退，心包少量积液。D‐二聚体无明显异常。下肢血管彩色B超仅发现双侧下肢动脉硬化并多发细小斑块形成，并无深静脉血栓形成。肺动脉CTA检查（图33‐2），发现双肺多支叶、段动脉多发栓塞；左下肺少许渗出病变。次日行心导管检查：①右心房平均压力14mmHg，右心室平均压力39mmHg，肺动脉平均压力51mmHg，提示右房、右室、肺动脉压力升高；②各腔室之间血氧无明显差异；③造影分析：肺动脉造影显示右下肺动脉主干中段充盈缺损，可见造影剂滞留；左右肺动脉远端均可见多发散在充盈缺损，考虑血栓。诊断意见：①肺动脉栓塞，②重度肺动脉高压。进一步查血沉、免疫球蛋白、真菌全套、肿瘤标记物、类风湿全套、血管炎三项、抗核抗体（ANA）组均（－），排除结缔组织疾病所致继发性血管损伤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉高压

呼吸科经典病历65行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=36.1    familyHistory=
    ...    gender=1    heartRate=98    highBldPress=120    lowBldPress=82    personalHistory=农民，瑶族    previousHistory=
    ...    symptom=反复发作性晕厥1年半，加重伴活动后胸闷气促1个月余#####神志清楚，自动体位，全身皮肤黏膜无黄染，全身浅表淋巴结无肿大。口唇无发绀，气管居中。胸廓无畸形，双肺叩诊清音，呼吸音清晰，未闻及干湿啰音及胸膜摩擦音。心脏、腹部、脊柱四肢和神经系统查体未见明显异常。 现病史:患者自述1年半前晨起收衣服时突发胸闷、气促、头晕，跌倒在地，当时呼之不应，无抽搐及呕吐，无大小便失禁，约2分钟后自行苏醒，未予特殊处理。1个月后推人力车时上述症状再发，跌倒在地致头部摔伤，2分钟后自行苏醒，被护送至当地县医院治疗，查头部CT未见异常，予头部外伤处理出院。此后1年间上述症状偶有发作，均休息后缓解。1个多月前症状再发，并伴有活动后胸闷气促，夜间能平卧，双下肢无水肿，住院，查心脏彩超：①心脏各房室腔大小未见异常；②重度肺动脉高压；③左室舒张功能减退，治疗7天后无明显缓解。2011年11月2日，患者解大便后症状再发，晕厥伴大汗淋漓，2分钟后苏醒，为求进一步诊治遂入我院。起病以来，精神、食欲、二便均可，体重无明显变化。    weight=    assistCheck=肝功能ALT172.7U／L↑，AST70.2U／L↑；脑钠肽1658pg／ml↑；血气分析（未吸氧）pH7.44，PCO238﹒4mmHg，PO268﹒0mmHg↓，SaO294%。血常规、大小便常规、肾功能、血糖均（－）。胸部CT示：①双肺间质性病变，以渗出为主；②右房右室稍大，肺动脉主干稍增粗。心电图示：①窦性心动过速；②不完全性右束支传导阻滞；③电轴右偏。心脏彩超：肺心病声像，左室顺应性减退，心包少量积液。D‐二聚体无明显异常。下肢血管彩色B超仅发现双侧下肢动脉硬化并多发细小斑块形成，并无深静脉血栓形成。肺动脉CTA检查（图33‐2），发现双肺多支叶、段动脉多发栓塞；左下肺少许渗出病变。次日行心导管检查：①右心房平均压力14mmHg，右心室平均压力39mmHg，肺动脉平均压力51mmHg，提示右房、右室、肺动脉压力升高；②各腔室之间血氧无明显差异；③造影分析：肺动脉造影显示右下肺动脉主干中段充盈缺损，可见造影剂滞留；左右肺动脉远端均可见多发散在充盈缺损，考虑血栓。诊断意见：①肺动脉栓塞，②重度肺动脉高压。进一步查血沉、免疫球蛋白、真菌全套、肿瘤标记物、类风湿全套、血管炎三项、抗核抗体（ANA）组均（－），排除结缔组织疾病所致继发性血管损伤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺栓塞

呼吸科经典病历66行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=26    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=65    highBldPress=105    lowBldPress=65    personalHistory=    previousHistory=
    ...    symptom=反复胸闷、呼吸困难半个月余，加重伴胸痛5天#####SpO298%。呼吸运动正常，双侧语颤正常，无胸膜摩擦感，双肺叩诊清音，双肺呼吸音弱，无明显干湿啰音，心前区无隆起，心界不大，心率65次／分，律齐，各瓣膜区未闻及病理性杂音，双下肢无水肿。 现病史:患者半个月前无明显诱因出现阵发性胸闷、呼吸困难、伴心悸，可自行缓解，反复发作数次后到当地医院查胸部X线未见异常，经治疗后症状改善。5天前无明显诱因患者自觉胸闷加重，遂到当地医院就诊，期间上厕所后突发剧烈左后背部持续性钝痛，吸气及深呼吸时胸痛明显加剧，当地查肺部CT示右中上肺、左下肺片状及结节状异常密度灶，予止痛治疗后胸痛改善，为进一步诊治入院。半个月前因外伤致左踝关节撕裂性骨折，一直石膏外固定并卧床休息。    weight=    assistCheck=血常规WBC10.4×109／L↑，N76.9%↑，Hb155g／L；大小便常规、肝肾功能、血浆凝血酶原时间、活化部分凝血酶原时间、结核全套、肿瘤标志物、HIV及梅毒抗体均无（－）；动脉血气分析pH7.40，PCO244mmHg，PO255mmHg↓，SaO2%88%↓；血沉45mm／h↑；心肌酶CK286.4U／L↑，CK‐MB25U／L↑；左踝关节正侧位片示左内踝陈旧性骨折。血浆D‐二聚体（＋），四肢血管彩超未见明显异常，肺部CTA示双侧肺动脉栓塞    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺栓塞

呼吸科经典病历67行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=120    lowBldPress=75    personalHistory=吸烟史20余年，约1包／天，已戒1年。    previousHistory=既往反复咳嗽咳痰10余年；反复夜间打鼾，憋醒10余年。
    ...    symptom=气促2周、咳嗽伴反复晕厥1周#####肥胖体形，双肺呼吸音减低，无明显干湿性啰音，心脏腹部检查无异常，双下肢对称，轻度水肿，左胫前可见静脉曲张。 现病史:患者2周前受凉后出现活动后气促，伴咳嗽、咳少量白色黏液痰，无发热、头晕及心慌等不适，在当地医院予抗感染治疗后咳嗽减轻，但仍感气促，1周前活动后晕厥，休息数秒后恢复，无冷汗、耳鸣，在当地医院查肺部CT示右肺上叶后段结节状影并周围渗出性病变，右侧胸膜局限性增厚，心脏B超发现右房内带状稍强阴影，考虑黏液瘤的可能，为求进一步诊治遂来我院就诊。    weight=    assistCheck=血常规：WBC11.9×109／L，中性粒细胞比值75.1%，淋巴细胞比值16.5%；二便常规正常；肝功能：ALT48.4U／L，AST36.6U／L，ALB31.3g／L；肾功能正常；D‐二聚体显著升高；动脉血气：pH7.45，PCO237mmHg，PO244mmHg，SpO283%；肿瘤标记物12项阴性。肺动脉CTA检查发现双侧肺动脉及其上下分支血栓形成，右肺内渗出性病变，右侧胸膜局限性增厚。睡眠呼吸监测提示患者有重度混合型睡眠呼吸暂停，重度睡眠低氧血症    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    睡眠呼吸暂停低通气综合征

呼吸科经典病历67行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=120    lowBldPress=75    personalHistory=吸烟史20余年，约1包／天，已戒1年。    previousHistory=既往反复咳嗽咳痰10余年；反复夜间打鼾，憋醒10余年。
    ...    symptom=气促2周、咳嗽伴反复晕厥1周#####肥胖体形，双肺呼吸音减低，无明显干湿性啰音，心脏腹部检查无异常，双下肢对称，轻度水肿，左胫前可见静脉曲张。 现病史:患者2周前受凉后出现活动后气促，伴咳嗽、咳少量白色黏液痰，无发热、头晕及心慌等不适，在当地医院予抗感染治疗后咳嗽减轻，但仍感气促，1周前活动后晕厥，休息数秒后恢复，无冷汗、耳鸣，在当地医院查肺部CT示右肺上叶后段结节状影并周围渗出性病变，右侧胸膜局限性增厚，心脏B超发现右房内带状稍强阴影，考虑黏液瘤的可能，为求进一步诊治遂来我院就诊。    weight=    assistCheck=血常规：WBC11.9×109／L，中性粒细胞比值75.1%，淋巴细胞比值16.5%；二便常规正常；肝功能：ALT48.4U／L，AST36.6U／L，ALB31.3g／L；肾功能正常；D‐二聚体显著升高；动脉血气：pH7.45，PCO237mmHg，PO244mmHg，SpO283%；肿瘤标记物12项阴性。肺动脉CTA检查发现双侧肺动脉及其上下分支血栓形成，右肺内渗出性病变，右侧胸膜局限性增厚。睡眠呼吸监测提示患者有重度混合型睡眠呼吸暂停，重度睡眠低氧血症    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺栓塞

呼吸科经典病历67行-3
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=36.3    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=120    lowBldPress=75    personalHistory=吸烟史20余年，约1包／天，已戒1年。    previousHistory=既往反复咳嗽咳痰10余年；反复夜间打鼾，憋醒10余年。
    ...    symptom=气促2周、咳嗽伴反复晕厥1周#####肥胖体形，双肺呼吸音减低，无明显干湿性啰音，心脏腹部检查无异常，双下肢对称，轻度水肿，左胫前可见静脉曲张。 现病史:患者2周前受凉后出现活动后气促，伴咳嗽、咳少量白色黏液痰，无发热、头晕及心慌等不适，在当地医院予抗感染治疗后咳嗽减轻，但仍感气促，1周前活动后晕厥，休息数秒后恢复，无冷汗、耳鸣，在当地医院查肺部CT示右肺上叶后段结节状影并周围渗出性病变，右侧胸膜局限性增厚，心脏B超发现右房内带状稍强阴影，考虑黏液瘤的可能，为求进一步诊治遂来我院就诊。    weight=    assistCheck=血常规：WBC11.9×109／L，中性粒细胞比值75.1%，淋巴细胞比值16.5%；二便常规正常；肝功能：ALT48.4U／L，AST36.6U／L，ALB31.3g／L；肾功能正常；D‐二聚体显著升高；动脉血气：pH7.45，PCO237mmHg，PO244mmHg，SpO283%；肿瘤标记物12项阴性。肺动脉CTA检查发现双侧肺动脉及其上下分支血栓形成，右肺内渗出性病变，右侧胸膜局限性增厚。睡眠呼吸监测提示患者有重度混合型睡眠呼吸暂停，重度睡眠低氧血症    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历68行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=37.4    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=60    personalHistory=    previousHistory=自述既往中学时代即有轻微贫血史，血色素稍低于正常，两年前外院体检发现蛋白尿（＋～＋＋），但肾功能正常，诊断为“慢性肾炎”，未予特殊治疗。
    ...    symptom=胸痛、发热10余天#####血氧饱和度98%；神清，双颌下淋巴结肿大，质软，活动度好，无明显压痛，余浅表淋巴结未触及明显肿大。左肺叩诊清音，右下肺叩诊浊音，双肺呼吸音粗，双肺中下叶可闻及少许哮鸣音和湿啰音。心律齐，心音无增强或减弱，无杂音。腹平软，无压痛及反跳痛。双下肢不肿。 现病史:患者半个月前受凉后出现左侧胸前区疼痛，为持续性胀痛，未予重视及处理。13天前疼痛范围扩大，累及右侧胸部及肩胛区，性质同前，疼痛程度较前明显增加，并伴有胸闷、气促、发热，体温最高38.5℃，发热无规律，物理降温或口服药物后可恢复正常，至当地医院就诊，查血常规：WBC10.35×109／L，N87.2%；HLA-B27阳性；连续3次痰检未见明显异常；予以抗感染等支持治疗等，症状有所好转。患者为进一步明确病因，遂来我院就诊。患者起病以来无咳嗽、咳痰、咯血、畏寒、寒战等症状。精神、食欲、睡眠正常，大小便正常，体重无明显改变。    weight=    assistCheck=入院后查血常规WBC11.2×109／L，N88.44%，RBC2.76×1012／L，Hb 82g／L，Plt397×109／L；二便常规正常；尿沉渣正常。电解质正常。血沉＞140mm／h；C反应蛋白：177mg／L；肝功能：ALT43.8U／L，AST35.3U／L，TP37.5g／L，ALB21.9g／L，GLO15.5g／L，肾功能BUN6.8mmol／L，Scr160.0μmol／L。免疫功能检查：IgG4.81g／L，IgA0.23g／L，IgM0.35g／L。人类免疫缺陷病毒抗体抗原（HIV）（－）；梅毒螺旋体抗体试验（－）；病毒全套（－）；结核抗体PPD‐IgG（＋），PPD‐IgM（－）。胸腔穿刺检查：胸水常规，黄色、微浑，有絮状小凝块；李凡他试验（＋）；细胞总数：265×106／L，WBC：39×106／L；胸水生化TP19.7g／L，腺苷脱氨酶6.2U／L，乳酸脱氢酶653.6U／L；胸水CEA（－）；胸水结核抗体PPD‐IgG（＋），PPD‐IgM（－）；胸水乳糜试验（－）；胸水涂片找病理细胞（－）；胸水培养（－）。血培养＋药敏（－）。。血清血管紧张素转化酶：18.9U／mLl；碱性磷酸酶：147.3U／L；降钙素原：0.33ng／ml；甲状旁腺激素：1.1pmol／L。ANA（－）；ENA（－）；血本‐周蛋白：免疫球蛋白κ链6.59g／L，免疫球蛋白λ链3.14g／L；尿本‐周蛋白：免疫球蛋白κ链2.17g／L，免疫球蛋白λ链＜0.05g／L；骨髓培养＋药敏（－）。腹部B超：脾脏形态饱满，脾厚46mm，肋下未及，实质回声均匀，脾门静脉内径9mm。胸腹部CT平扫：双侧中等量胸腔积液，并双下肺膨胀不全；脾大约8单位，边缘光滑，密度均匀，余腹部脏器未见异常。PET‐CT检查，结果：①多个胸、腰椎、多处肋骨及骨盆多处骨质稀疏，PET于相应部位见浓淡不一放射性浓聚影；②右胸大量胸水，左胸少量胸水，右中肺及两下肺局部外压性收缩；③心包少量积液；④腹水，全身多处皮下水肿；⑤全身其他部位未见明显异常。骨髓病理组织检查示：骨髓增生活跃，粒系增生尚活跃，以中晚及以下阶段为主，红系增生尚活跃，浆细胞增多，成簇巢分布，形态偏成熟浆，巨核细胞分布正常，诊断考虑骨髓瘤。血清钙增高，最高达3.56mmol／L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    胸腔积液

呼吸科经典病历68行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=36    ageType=岁    allergyHistory=    bodyTempr=37.4    familyHistory=
    ...    gender=1    heartRate=90    highBldPress=120    lowBldPress=60    personalHistory=    previousHistory=自述既往中学时代即有轻微贫血史，血色素稍低于正常，两年前外院体检发现蛋白尿（＋～＋＋），但肾功能正常，诊断为“慢性肾炎”，未予特殊治疗。
    ...    symptom=胸痛、发热10余天#####血氧饱和度98%；神清，双颌下淋巴结肿大，质软，活动度好，无明显压痛，余浅表淋巴结未触及明显肿大。左肺叩诊清音，右下肺叩诊浊音，双肺呼吸音粗，双肺中下叶可闻及少许哮鸣音和湿啰音。心律齐，心音无增强或减弱，无杂音。腹平软，无压痛及反跳痛。双下肢不肿。 现病史:患者半个月前受凉后出现左侧胸前区疼痛，为持续性胀痛，未予重视及处理。13天前疼痛范围扩大，累及右侧胸部及肩胛区，性质同前，疼痛程度较前明显增加，并伴有胸闷、气促、发热，体温最高38.5℃，发热无规律，物理降温或口服药物后可恢复正常，至当地医院就诊，查血常规：WBC10.35×109／L，N87.2%；HLA-B27阳性；连续3次痰检未见明显异常；予以抗感染等支持治疗等，症状有所好转。患者为进一步明确病因，遂来我院就诊。患者起病以来无咳嗽、咳痰、咯血、畏寒、寒战等症状。精神、食欲、睡眠正常，大小便正常，体重无明显改变。    weight=    assistCheck=入院后查血常规WBC11.2×109／L，N88.44%，RBC2.76×1012／L，Hb 82g／L，Plt397×109／L；二便常规正常；尿沉渣正常。电解质正常。血沉＞140mm／h；C反应蛋白：177mg／L；肝功能：ALT43.8U／L，AST35.3U／L，TP37.5g／L，ALB21.9g／L，GLO15.5g／L，肾功能BUN6.8mmol／L，Scr160.0μmol／L。免疫功能检查：IgG4.81g／L，IgA0.23g／L，IgM0.35g／L。人类免疫缺陷病毒抗体抗原（HIV）（－）；梅毒螺旋体抗体试验（－）；病毒全套（－）；结核抗体PPD‐IgG（＋），PPD‐IgM（－）。胸腔穿刺检查：胸水常规，黄色、微浑，有絮状小凝块；李凡他试验（＋）；细胞总数：265×106／L，WBC：39×106／L；胸水生化TP19.7g／L，腺苷脱氨酶6.2U／L，乳酸脱氢酶653.6U／L；胸水CEA（－）；胸水结核抗体PPD‐IgG（＋），PPD‐IgM（－）；胸水乳糜试验（－）；胸水涂片找病理细胞（－）；胸水培养（－）。血培养＋药敏（－）。。血清血管紧张素转化酶：18.9U／mLl；碱性磷酸酶：147.3U／L；降钙素原：0.33ng／ml；甲状旁腺激素：1.1pmol／L。ANA（－）；ENA（－）；血本‐周蛋白：免疫球蛋白κ链6.59g／L，免疫球蛋白λ链3.14g／L；尿本‐周蛋白：免疫球蛋白κ链2.17g／L，免疫球蛋白λ链＜0.05g／L；骨髓培养＋药敏（－）。腹部B超：脾脏形态饱满，脾厚46mm，肋下未及，实质回声均匀，脾门静脉内径9mm。胸腹部CT平扫：双侧中等量胸腔积液，并双下肺膨胀不全；脾大约8单位，边缘光滑，密度均匀，余腹部脏器未见异常。PET‐CT检查，结果：①多个胸、腰椎、多处肋骨及骨盆多处骨质稀疏，PET于相应部位见浓淡不一放射性浓聚影；②右胸大量胸水，左胸少量胸水，右中肺及两下肺局部外压性收缩；③心包少量积液；④腹水，全身多处皮下水肿；⑤全身其他部位未见明显异常。骨髓病理组织检查示：骨髓增生活跃，粒系增生尚活跃，以中晚及以下阶段为主，红系增生尚活跃，浆细胞增多，成簇巢分布，形态偏成熟浆，巨核细胞分布正常，诊断考虑骨髓瘤。血清钙增高，最高达3.56mmol／L    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    多发性骨髓瘤

呼吸科经典病历69行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=47    ageType=岁    allergyHistory=    bodyTempr=37.2    familyHistory=
    ...    gender=1    heartRate=86    highBldPress=100    lowBldPress=70    personalHistory=吸烟20年，每日1包    previousHistory=
    ...    symptom=气促4个月余，再发加重伴发热10余天#####SpO291%。全身浅表淋巴结不大，双肺呼吸音粗，双中下肺可闻及Velcro啰音。 现病史:患者于入院前4个月无明显诱因出现活动后气促，未予诊治，10余天前气促明显加重，伴发热，体温最高达38.9℃，伴咳嗽，咳少量黄脓痰，入我院就诊，收住我科。    weight=    assistCheck=血常规、大小便常规、结核全套、血管紧张素转换酶（ACE）、肿瘤标志物、HIV抗体、类风湿因子、可提取性核抗原（ENA）14项、抗核抗体（ANA）均（－）；肝功能ALT 99﹒3U／L↑，AST46.7U／L↑，ALB33.3g／L↓；血沉73mm／h↑；C反应蛋白23ng／L↑；补体C40.08g／L↓；LDH333.6U／L↑。血培养＋药敏、痰培养＋药敏、肺组织培养＋药敏均（－）。肺功能示中度限制性肺通气功能障碍，弥散功能重度损害，气道阻力正常，残／总比值增高。胸部X线片示双肺纹理增多、紊乱，双下肺见斑片状影，密度稍高，符合肺间质病变并感染。肺部高分辨CT（HRCT）示双肺可见弥漫分布的网格状密度增高影，部分呈磨玻璃状改变，边缘尚清晰，其内显示气管壁增厚，呈轨道样改变，纵隔内可见肿大软组织影，双侧胸膜增厚粘连。意见：①双侧弥漫性间质性病变；②纵隔淋巴结肿大；③双侧胸膜增厚粘连    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    特发性肺间质纤维化

呼吸科经典病历70行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=55    ageType=岁    allergyHistory=    bodyTempr=36.7    familyHistory=
    ...    gender=1    heartRate=98    highBldPress=128    lowBldPress=85    personalHistory=吸烟40年，平均1包／天，饮白酒40年，平均1～1.5kg／d。否认粉尘接触史及相关职业史。    previousHistory=既往有“胃溃疡、胃出血”病史。
    ...    symptom=气促伴咳嗽、咳痰40余天#####SpO2（未吸氧）97%，浅表淋巴结不大，两肺呼吸音清，可闻及少量湿啰音，心界不大，心率98次／分，腹软，肝脾不大，双下肢不肿。 现病史:患者于40余天前受凉后出现活动后气促，伴咳嗽，咳少量白痰，并自觉发热，至当地医院行胸片检查，提示为双肺间质性病变，予“头孢克洛”抗感染及对症治疗后症状无缓解，给予抗结核治疗半个月，气促症状仍无明显改善。半个月前于我院门诊行肺部CT、肺功能检查，以“双肺间质性病变”收入院。起病以来，一般情况尚可，大小便正常。    weight=    assistCheck="血常规检查：嗜酸性粒细胞比值8.5%，白细胞计数、中性粒细胞计数、血色素及血小板均正常。肝功能、血脂、肾功能、电解质正常，免疫球蛋白、补体均正常，ANA、ANCA、ds‐DNA、MPO、PR3阴性，抗SSA抗体弱阳性，结核纯蛋白衍生物（PPD）IgG、IgM，金标结核抗体（结明试验）均为阴性。抗SSA抗体弱阳性。肺部CT检查：双肺弥漫性间质病变，纵隔淋巴结稍增大。肺功能检查：轻度混合性肺通气功能障碍，弥散功能轻度损害，扩张试验阴性。支气管镜检查，镜下未见异常。右下肺背段肺活检病理组织学及免疫组化结果：镜下见大量单核‐肺泡巨噬细胞，肺泡结构不清，免疫组化：EMA（－），CK（－），CD68（＋＋）"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    间质性肺病

呼吸科经典病历71行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=150    lowBldPress=100    personalHistory=吸烟30余年，2包／天，无其他毒物或粉尘接触史    previousHistory=30年前曾患“淋巴结结核”
    ...    symptom=气促1个月，颜面部水肿半个月，双下肢水肿5天#####SpO287%，唇稍发绀，双下肺可闻及爆裂音，双下肢轻度凹陷性水肿。 现病史:患者1个月前感冒后出现活动后气促，咳嗽咳少量白色泡沫痰，无头晕、头痛、心悸不适，至当地医院，查肺部CT示双肺弥漫分布的斑片影，以两下肺及胸膜下为甚，予抗感染治疗无明显好转。15天前患者出现双眼睑及颜面水肿，晨起为重，无尿频、尿急、尿痛或尿量减少，予利尿后水肿消失。5天前患者出现双下肢中度凹陷性水肿，气促加重。至我院门诊，查血常规WBC13×109／L↑；ALB 31﹒3g／L↓；血气分析PCO221mmHg↓，PO257﹒4mmHg↓。    weight=    assistCheck=血常规PLT46×109／L↓；24小时尿量850ml↓，尿蛋白106.7mg／d↑；尿沉渣RBC总数105000个／ml↑，变异性RBC60%；肝肾功能ALB19.7g／L↓，TBIL 48﹒7μmol／L↑，DBIL22.4μmol／L↑；血气分析pH7.433，PO255﹒4mmHg↓，PCO2 29﹒7mmHg；C反应蛋白14.3mg／L↑；补体C30.53g／L↓；可提取性核抗原（ENA）14项示SS‐A（＋＋）；血沉、抗链“O”、类风湿因子、结核全套、肝炎病毒抗体、免疫球蛋白、抗核抗体（ANA）组均（－）；痰涂片找真菌、痰涂片抗酸染色均（－）；痰培养示大量真菌生长；胸腹部B超示胸腹腔少量积液；肺功能示中度限制性肺通气功能障碍。支气管镜检镜下未见明显异常。右下后肺行肺活检和刷片，病理提示：（右下后段）呈黏膜慢性炎，有少量淋巴细胞浸润，切片未见癌，未见典型结核病灶，抗酸染色（－）；刷片见较多红细胞及柱状上皮细胞，少量淋巴细胞及中性粒细胞，未见癌细胞。ANA（＋，1∶20，均质型）、自身免疫性肝炎抗体LC‐1（＋）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历71行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36.5    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=150    lowBldPress=100    personalHistory=吸烟30余年，2包／天，无其他毒物或粉尘接触史    previousHistory=30年前曾患“淋巴结结核”
    ...    symptom=气促1个月，颜面部水肿半个月，双下肢水肿5天#####SpO287%，唇稍发绀，双下肺可闻及爆裂音，双下肢轻度凹陷性水肿。 现病史:患者1个月前感冒后出现活动后气促，咳嗽咳少量白色泡沫痰，无头晕、头痛、心悸不适，至当地医院，查肺部CT示双肺弥漫分布的斑片影，以两下肺及胸膜下为甚，予抗感染治疗无明显好转。15天前患者出现双眼睑及颜面水肿，晨起为重，无尿频、尿急、尿痛或尿量减少，予利尿后水肿消失。5天前患者出现双下肢中度凹陷性水肿，气促加重。至我院门诊，查血常规WBC13×109／L↑；ALB 31﹒3g／L↓；血气分析PCO221mmHg↓，PO257﹒4mmHg↓。    weight=    assistCheck=血常规PLT46×109／L↓；24小时尿量850ml↓，尿蛋白106.7mg／d↑；尿沉渣RBC总数105000个／ml↑，变异性RBC60%；肝肾功能ALB19.7g／L↓，TBIL 48﹒7μmol／L↑，DBIL22.4μmol／L↑；血气分析pH7.433，PO255﹒4mmHg↓，PCO2 29﹒7mmHg；C反应蛋白14.3mg／L↑；补体C30.53g／L↓；可提取性核抗原（ENA）14项示SS‐A（＋＋）；血沉、抗链“O”、类风湿因子、结核全套、肝炎病毒抗体、免疫球蛋白、抗核抗体（ANA）组均（－）；痰涂片找真菌、痰涂片抗酸染色均（－）；痰培养示大量真菌生长；胸腹部B超示胸腹腔少量积液；肺功能示中度限制性肺通气功能障碍。支气管镜检镜下未见明显异常。右下后肺行肺活检和刷片，病理提示：（右下后段）呈黏膜慢性炎，有少量淋巴细胞浸润，切片未见癌，未见典型结核病灶，抗酸染色（－）；刷片见较多红细胞及柱状上皮细胞，少量淋巴细胞及中性粒细胞，未见癌细胞。ANA（＋，1∶20，均质型）、自身免疫性肝炎抗体LC‐1（＋）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    间质性肺病

呼吸科经典病历72行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=18    ageType=岁    allergyHistory=    bodyTempr=37.3    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=110    lowBldPress=80    personalHistory=吸烟2余年，20支／天。    previousHistory=
    ...    symptom=发热咳嗽、流血涕2个月余#####SpO297%，神清，全身皮肤无黄染及出血点，双侧巩膜充血。双侧颌下淋巴结肿大，约2cm×2cm大小，质硬，压痛不明显，活动度差，余浅表淋巴结无肿大，鼻中隔黏膜糜烂，见肉芽生长，以右侧明显，左侧鼻腔内血块较多。双肺呼吸音粗，双肺可闻及少许干啰音，心界不大，心率100次／分，律齐，各瓣膜区未闻及病理性杂音。 现病史:患者2个月余前无明显诱因出现鼻塞、流涕、咳嗽，咳白色泡沫痰，偶带血丝，右侧额部疼痛，以夜间明显，10余天后出现涕中带血及间断发热，体温最高达39.5℃，行局麻下鼻内窥镜鼻中隔左侧新生物切除术，病理示慢性肉芽肿性炎，多核巨细胞反应及淋巴组织增生，考虑真菌感染或异物可能，出院后一直服用抗生素抗感染治疗，上述症状未见好转。查胸部CT示右下肺内有多个大小不等的空洞，无液平面，予抗结核1个月后，病情无好转，且发现右鼻腔有新生物生长，双侧颌下淋巴结肿大，为求进一步诊治入我院就诊。    weight=    assistCheck=血常规WBC18.4×109／L，N85.8%，L9.4%，Hb116g／L，PLT520×109／L；24小时尿蛋白定量148.2mg；血沉92mm／h；C反应蛋白60.1mg／L。尿常规、尿沉渣、尿特定蛋白测定（BMG、NAG、RBP）、肝肾功能、结核全套、免疫球蛋白及补体、血管炎三项、抗核抗体（ANA）组、类风湿因子、抗链“O”均（－）；血培养（－）。肺部CT示右下肺空腔及液平形成；右下肺结节；右肺门淋巴结肿大。骨髓细胞学：骨髓增生活跃，粒系占61.5%，形态大致正常；红系占17.5%以中晚幼红细胞为主，形态未见异常。淋巴细胞占19%，巨核细胞分布无明显异常，血小板成堆散在分布。左中鼻道新生物活检，病理结果：镜下为炎性黏膜与炎性肉芽组织，附有炎性与纤维素性坏死物及少量骨组织，较多淋巴细胞、浆细胞、中性粒细胞混有组织细胞，少数多核巨细胞，部分毛细血管壁有中性粒细胞浸润，个别血管壁破坏，免疫组化：LCA（＋＋），CD15粒细胞（＋），CD3（＋），CD45R0（＋），CD5灶性（＋），CD20小灶（＋），CD56（－），CD57（－），TiA（－），S10散在（＋），CD34血管（＋）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    韦格纳肉芽肿病

呼吸科经典病历73行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=29    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=
    ...    gender=1    heartRate=100    highBldPress=130    lowBldPress=80    personalHistory=司机    previousHistory=
    ...    symptom=反复咳嗽咳痰近2年，听力下降、进行性呼吸困难半年#####双手掌、左肘、左足部皮损。左肺呼吸音减低，余未见明显阳性体征。 现病史:患者2年前因咳嗽咳痰伴有发热2个月第1次入院，查体无明显阳性体征。肺部CT示两肺上中下肺野均有结节伴空洞形成，胸膜增厚。CT引导下经皮肺穿刺病理结果示：纤维坏死病灶，极少数呈干酪样坏死。给予抗结核治疗。2个月后因患者咳嗽、咳痰症状未缓解，影像学病灶未吸收，第二次入院。纤维支气管镜检查未见异常，两次经皮肺穿刺活检及一次经支气管镜肺活检示明显坏死组织，少量干酪样坏死。患者坚持抗结核治疗2年，症状反复出现，半年前出现听力下降、呼吸困难进行性加重，不能整句说话而第三次入院。入院后行纤支镜检查见声门下及上段气管多个结节、肉芽肿样病变，气管不规则狭窄，左上叶开口肉芽肿样病变。气管黏膜活检示鳞状上皮化生，灶性乳头状增生并纤维肉芽肿增生，较多淋巴细胞、浆细胞，少量中性粒细胞浸润，其一粒组织边缘有小灶放线菌。予以抗结核及放线菌治疗，患者病情稳定后带药出院继续治疗。出院后咳嗽咳痰及呼吸困难症状无缓解，听力进行性下降，故第4次入院。    weight=    assistCheck=尿常规：蛋白（＋），尿隐血（2＋），RBC0～2／HP；尿沉渣RBC37500个／ml。抗中性粒细胞胞浆抗体cANCA（＋）。肺功能示中度混合性通气功能障碍，呼气相平台。皮肤活检病理：灶性棘层肥厚，真皮血管充血，淋巴细胞浸润，纤维组织轻度增生。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    韦格纳肉芽肿病

呼吸科经典病历74行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=63    ageType=岁    allergyHistory=    bodyTempr=36.8    familyHistory=无家族遗传病史。
    ...    gender=0    heartRate=95    highBldPress=110    lowBldPress=70    personalHistory=    previousHistory=既往有慢性支气管炎、风湿性关节炎病史，无肝炎结核病史。不嗜烟酒，无毒物接触史。否认糖尿病、高血压病史。
    ...    symptom=咳嗽、胸痛、气促20天#####SaO2%97%。神清，全身皮肤黏膜无黄染及皮疹，浅表淋巴结未扪及肿大，双肺未闻及干湿啰音，心、腹部检查无阳性体征，神经系统检查正常。 现病史:患者20天前无明显诱因出现咳嗽、胸痛、气促症状，在当地医院肺部CT检查诊断为“双肺弥漫性病变”，病因不明，遂入我院。    weight=    assistCheck=血常规示WBC7.5×109／L，N71.5%↑，余正常。ESR37mm／h↑，血气分析示pH7.48，PaO231﹒6mmHg，PaCO250mmHg。免疫球蛋白、抗核抗体（ANA）阴性；CRP12.9mg／L↑，余正常。肿瘤标记物12项：AFP55.96ng／ml↑，CA12547.63kU／L↑，余正常。影像学改变：肺CT示双肺散在多发团絮样片状模糊影，双肺野模糊，双侧肋膈角稍钝。支气管镜检查，镜下见左上叶上分支、左下叶及右下叶基底各级支气管黏膜充血肿胀，管腔内有较多黄白色牛奶样分泌物，用生理盐水灌洗出牛奶样分泌物，放置后沉淀，于右下叶后基底支及背支行肺活检。灌洗液PAS染色阳性。肺活检病理诊断：镜下为少许肺组织与增生纤维组织，灶性肺泡上皮增生，肺泡腔见PAS染色呈红色的颗粒，少数淋巴细胞浸润及炭末沉着，抗酸染色（－），切片未见癌，未见结核病变    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺泡蛋白沉积症

呼吸科经典病历75行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=69    ageType=岁    allergyHistory=有“青霉素、磺胺类”过敏史    bodyTempr=36.6    familyHistory=无家族遗传病史。
    ...    gender=0    heartRate=80    highBldPress=139    lowBldPress=78    personalHistory=不嗜烟酒，无毒物，粉尘接触史    previousHistory=既往因“右股骨颈及粗隆间巨细胞瘤”行“右股骨肿瘤切除术”后一直卧床，有“冠心病”史15年，有胆囊切除史，否认肝炎、结核、伤寒病史，有输血史。否认糖尿病、高血压病史。
    ...    symptom=反复气促、夜间憋醒半年，再发加重3天#####SpO291%。神清，被动体位，颜面水肿，表情淡漠，全身皮肤巩膜无黄染及皮疹，全身皮肤干燥，浅表淋巴结未扪及肿大。颈软，甲状腺不大，颈静脉稍充盈，双肺呼吸音低，未闻及干湿啰音及胸膜摩擦音。心尖搏动位于第5肋间左锁骨中线外侧1cm处，心界稍大，心率80次／分，律齐，心音较低，未闻及杂音。腹部查体无明显异常。脊柱无畸形，右下肢稍萎缩，活动受限，双下肢无水肿，神经系统检查正常。 现病史:患者半年前开始出现气促，以夜间为甚，常伴夜间憋醒，吸氧后缓解，无发热盗汗、咳嗽咳痰。在当地医院查肺部CT示右心缘旁占位影，予以对症治疗后好转。3天前再次出现气促及夜间憋醒症状并加重而入我院。起病来精神睡眠差，食纳可，大小便无异常。    weight=    assistCheck=血常规RBC3.09×1012／L，Hb91／L；血气分析（吸氧时）pH7.34，PaO2 83mmHg，PaCO259mmHg↑；肝肾功能AST41.2U／L↑，GLO35.2U／L略↑；血脂＋心肌酶CK376.4U／L↑，LDH283.5U／L↑，TG3.31mmol／L↑，CHOL8.9mmol／L↑；肿瘤标志物12项中仅癌胚抗原6.17ng／ml略↑，神经原特异性烯醇化酶19.17ng／ml略↑，余均正常；脑钠肽（－）。多导睡眠监测：AHI34.5次／小时，夜间最低血氧饱和度为78%，考虑重度阻塞性睡眠呼吸暂停低通气综合征。心脏彩超：①主动脉瓣退行性变；②心包积液（少量）；③左室顺应性减退，收缩功能正常范围。头部CT：脑白质病变，脑萎缩，未见转移病灶。肺部CT示：①中下纵隔右心缘旁长条形水样密度影，较外院有明显缩小；考虑包裹性积液可能性大。②肺部感染。③心包积液。④左心室肥厚，提示冠心病或肥厚性心肌病。SPECT：①双侧肋骨软骨连接处代谢增强，考虑骨质疏松所致可能性大。②相当于腰2椎体长条状骨代谢增强，考虑压缩性骨折所致可能性大。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历75行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=69    ageType=岁    allergyHistory=有“青霉素、磺胺类”过敏史    bodyTempr=36.6    familyHistory=无家族遗传病史。
    ...    gender=0    heartRate=80    highBldPress=139    lowBldPress=78    personalHistory=不嗜烟酒，无毒物，粉尘接触史    previousHistory=既往因“右股骨颈及粗隆间巨细胞瘤”行“右股骨肿瘤切除术”后一直卧床，有“冠心病”史15年，有胆囊切除史，否认肝炎、结核、伤寒病史，有输血史。否认糖尿病、高血压病史。
    ...    symptom=反复气促、夜间憋醒半年，再发加重3天#####SpO291%。神清，被动体位，颜面水肿，表情淡漠，全身皮肤巩膜无黄染及皮疹，全身皮肤干燥，浅表淋巴结未扪及肿大。颈软，甲状腺不大，颈静脉稍充盈，双肺呼吸音低，未闻及干湿啰音及胸膜摩擦音。心尖搏动位于第5肋间左锁骨中线外侧1cm处，心界稍大，心率80次／分，律齐，心音较低，未闻及杂音。腹部查体无明显异常。脊柱无畸形，右下肢稍萎缩，活动受限，双下肢无水肿，神经系统检查正常。 现病史:患者半年前开始出现气促，以夜间为甚，常伴夜间憋醒，吸氧后缓解，无发热盗汗、咳嗽咳痰。在当地医院查肺部CT示右心缘旁占位影，予以对症治疗后好转。3天前再次出现气促及夜间憋醒症状并加重而入我院。起病来精神睡眠差，食纳可，大小便无异常。    weight=    assistCheck=血常规RBC3.09×1012／L，Hb91／L；血气分析（吸氧时）pH7.34，PaO2 83mmHg，PaCO259mmHg↑；肝肾功能AST41.2U／L↑，GLO35.2U／L略↑；血脂＋心肌酶CK376.4U／L↑，LDH283.5U／L↑，TG3.31mmol／L↑，CHOL8.9mmol／L↑；肿瘤标志物12项中仅癌胚抗原6.17ng／ml略↑，神经原特异性烯醇化酶19.17ng／ml略↑，余均正常；脑钠肽（－）。多导睡眠监测：AHI34.5次／小时，夜间最低血氧饱和度为78%，考虑重度阻塞性睡眠呼吸暂停低通气综合征。心脏彩超：①主动脉瓣退行性变；②心包积液（少量）；③左室顺应性减退，收缩功能正常范围。头部CT：脑白质病变，脑萎缩，未见转移病灶。肺部CT示：①中下纵隔右心缘旁长条形水样密度影，较外院有明显缩小；考虑包裹性积液可能性大。②肺部感染。③心包积液。④左心室肥厚，提示冠心病或肥厚性心肌病。SPECT：①双侧肋骨软骨连接处代谢增强，考虑骨质疏松所致可能性大。②相当于腰2椎体长条状骨代谢增强，考虑压缩性骨折所致可能性大。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    阻塞性睡眠呼吸暂停综合征

呼吸科经典病历76行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=岁    allergyHistory=    bodyTempr=40    familyHistory=
    ...    gender=1    heartRate=110    highBldPress=110    lowBldPress=80    personalHistory=嗜烟、酒10 余年    previousHistory=数年前曾因“斜疝”在外院行手术治疗
    ...    symptom=发热10天#####急性面容；右上肢近端可见皮疹，右侧腹股沟区见一长约3cm 手术瘢痕，耳后、腋窝、会阴等处未见焦痂，全身浅表淋巴结未触及肿大。结膜充血，咽充血。双肺呼吸音清，未闻干湿性啰音。心界不大，心率110次／分，律齐，各瓣膜听诊区未闻及病理性杂音。腹平软，全腹无压痛及反跳痛，肝、脾肋下未及，Murphy 征（－），双肾区、肝区无叩痛，肠鸣音正常。四肢肌力、肌张力正常，生理反射存在，病理反射未引出 现病史:患者于10天前起无明显诱因出现畏寒、发热，体温最高达40℃，伴全身肌肉酸痛、疲倦、乏力、口干、食欲下降，稍咳嗽，无鼻塞、流涕，无胸痛、气促，无腹痛、呕吐，无尿频、尿急、尿痛、血尿，无广泛出血性皮疹；6天前曾解黄色烂便，无黏液脓血便，服“中药”2天后大便恢复正常。一直在附近卫生站治疗，用药后可退热，但数小时后体温又升高，发热以夜间及早上明显。因病情反复，遂到我院就诊。起病后，患者精神欠佳，小便正常，体重下降2～3kg。    weight=    assistCheck=血常规：PLT 43 ×10 9／L，余正常；尿常规：正常；生化八项：钙1.9mmol／L，余正常；外周血涂片找疟原虫阴性。胸片：支气管炎；心电图：窦性心律，非特异性室内传导延迟，不完全性右束支传导阻滞。DIC 套餐：PTINR 1﹒18，余正常；血脂四项：CH 2﹒1mmol／L，TG 2﹒5mmol／L，HDL‐C 0﹒2mmol／L，余正常；肝功全套：ALT 136IU／L，GGT 73IU／L，TP 57﹒8g／L，ALB 32g／L，AST 155IU／L，A／G 1﹒2，余正常；胆碱酯酶（CHE）2783U／L；肝炎免疫全套：HBsAg（＋），HBcAb（＋），余正常；USR、HIV‐Ab、抗结核抗体（－）；PPD 试验（－）；风湿三项：CRP 75﹒5mg／L，RF（类风湿因子）及ASO（抗链球菌溶血素“O”）正常；C3、C4、IgG、IgA、IgM、dS‐DNA、ESR 均正常；肿瘤标志物阴性；腹部B 超：肝内外胆管轻度扩张，壁增厚，胆囊壁增厚、毛糙，脾、肾、输尿管、膀胱未见异常。肥达试验（－），外斐试验（－）；血培养及登革热抗体结果未回（后结果回报均为阴性）；上腹部CT：肝左叶内胆管轻度扩张，双侧胸膜增厚。血涂片及骨髓象检查未见明显异常，大便查到肝吸虫虫卵    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    病毒性上呼吸道感染

呼吸科经典病历77L-行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=17    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=106    highBldPress=113    lowBldPress=64    personalHistory=无嗜烟史    previousHistory="否认结核、肝炎、糖尿病等病史。"
    ...    symptom=左侧胸痛7天，伴胸闷2天#####神清，自主体位。全身浅表淋巴结未触及肿大。口唇无发绀，气管居中。左侧胸廓稍饱满，左侧呼吸运动度稍减低，触觉语颤减弱，叩诊呈浊音，左中下肺呼吸音明显减弱，右侧呼吸音粗，未闻及干湿啰音。心前区无隆起，心尖搏动位于左侧锁骨中线内2cm，左侧心界叩诊不清，心率106次／分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未及。双下肢无水肿，无杵状指。 现病史:入院前7天无明显诱因出现左侧胸痛及单声咳嗽，无痰，胸痛以深呼吸及咳嗽时明显，伴畏寒、出汗，无发热。曾在我院门诊就诊，口服“头孢拉定及天葵冲剂”等治疗3天后，胸痛有所减轻，但仍有咳嗽。入院前2天出现胸闷、气促，活动后明显，休息可缓解，无心悸、夜间阵发性呼吸困难。患者起病后精神、胃纳尚可，大小便正常，体重无明显变化。    weight=    assistCheck=血常规：WBC 9﹒2 ×10 9 L，NE%73﹒2%，LY%15﹒5%，Hb 134g／L，PLT 227 ×10 9／L。ESR 53mm／h。血清总蛋白65g／L。PPD 试验（＋＋）。大小便常规、肝肾功能、电解质、血糖及心电图均正常。胸片示：左下肺野见大片致密影，左侧胸壁见带状致密影，左心缘及左膈面被掩盖，心影大小正常；考虑：左侧胸腔积液（有包裹征象），左下肺感染。胸部B超：左侧胸腔见大片液性暗区，最大前后径90mm。胸腔积液常规示：李凡他试验（＋），JW‐WBC 2432 ×10 6／L，JW‐RBC 2570 ×10 6／L，单核75%，多核25%，LDH 483U／L，氯化物107mg／dl，葡萄糖3.7mg／dl，总蛋白49.6g／L；胸腔积液找抗酸杆菌（－），胸腔积液细菌培养（－），查癌细胞（－）；胸膜活检示：胸膜慢性炎症。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    结核性胸膜炎

呼吸科经典病历77行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=17    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=106    highBldPress=113    lowBldPress=64    personalHistory=无嗜烟史    previousHistory="否认结核、肝炎、糖尿病等病史。"
    ...    symptom=左侧胸痛7天，伴胸闷2天#####神清，自主体位。全身浅表淋巴结未触及肿大。口唇无发绀，气管居中。左侧胸廓稍饱满，左侧呼吸运动度稍减低，触觉语颤减弱，叩诊呈浊音，左中下肺呼吸音明显减弱，右侧呼吸音粗，未闻及干湿啰音。心前区无隆起，心尖搏动位于左侧锁骨中线内2cm，左侧心界叩诊不清，心率106次／分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软，肝脾肋下未及。双下肢无水肿，无杵状指。 现病史:入院前7天无明显诱因出现左侧胸痛及单声咳嗽，无痰，胸痛以深呼吸及咳嗽时明显，伴畏寒、出汗，无发热。曾在我院门诊就诊，口服“头孢拉定及天葵冲剂”等治疗3天后，胸痛有所减轻，但仍有咳嗽。入院前2天出现胸闷、气促，活动后明显，休息可缓解，无心悸、夜间阵发性呼吸困难。患者起病后精神、胃纳尚可，大小便正常，体重无明显变化。    weight=    assistCheck=血常规：WBC 9﹒2 ×10 9 L，NE%73﹒2%，LY%15﹒5%，Hb 134g／L，PLT 227 ×10 9／L。ESR 53mm／h。血清总蛋白65g／L。PPD 试验（＋＋）。大小便常规、肝肾功能、电解质、血糖及心电图均正常。胸片示：左下肺野见大片致密影，左侧胸壁见带状致密影，左心缘及左膈面被掩盖，心影大小正常；考虑：左侧胸腔积液（有包裹征象），左下肺感染。胸部B超：左侧胸腔见大片液性暗区，最大前后径90mm。胸腔积液常规示：李凡他试验（＋），JW‐WBC 2432 ×10 6／L，JW‐RBC 2570 ×10 6／L，单核75%，多核25%，LDH 483U／L，氯化物107mg／dl，葡萄糖3.7mg／dl，总蛋白49.6g／L；胸腔积液找抗酸杆菌（－），胸腔积液细菌培养（－），查癌细胞（－）；胸膜活检示：胸膜慢性炎症。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胸腔积液

呼吸科经典病历78行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=22    ageType=岁    allergyHistory=    bodyTempr=39.3    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=    lowBldPress=    personalHistory=农民    previousHistory=
    ...    symptom=发热、咳嗽、咽痛2天#####发育正常,急性病容,营养一般,咽红，双侧扁桃体I度红肿，双肺呼吸音稍粗，未闻及干、湿性罗音及哮鸣音,心前区无隆起，心尖搏动不弥散，无抬举性搏动，心率96次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹平软，无压痛及反跳动痛，肠鸣音4-5次/分。脊柱、四肢无畸形，生理反射正常，病理反射无异常 现病史:2日前因受凉出现发热，最高体温39.3℃，稍感头昏，咳嗽，咳白色粘痰，无痰中带血，无流涕，无喷嚏、咯血、胸闷、胸痛、眼花、乏力、腹痛、腹泻等症状。曾在当地诊所治疗，无明显好转，遂来我院门诊求治。自发病以来患儿体重略有下降，精神睡眠一般，食欲可，二便正常    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性上呼吸道感染

呼吸科经典病历79行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=18    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽3天伴有发热1天#####患者神清，查咽喉部红肿，扁桃腺（－）双肺呼吸音清，心脏听诊无异常，腹检无异常。血象WBC正常，L稍高。余（－） 现病史:患者3日前自觉鼻塞、流涕，轻微咳嗽，自服抗感冒药物效果不佳，近1日觉畏寒，发热，体温37.7℃。遂来本院就诊    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性上呼吸道感染

呼吸科经典病历80行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.3    familyHistory=
    ...    gender=1    heartRate=126    highBldPress=109    lowBldPress=71    personalHistory=无吸烟史，平日少量饮酒    previousHistory=既往无高血压病、冠心病、糖尿病病史。否认肝炎、结核等传染病史。无手术及外伤史，无输血史。预防接种史随当地。
    ...    symptom=发热4天#####身高170c m。口唇无发绀，咽部充血，扁桃体无肿大。胸廓对称，无皮下气肿，胸骨无压痛，双侧呼吸动度对称，语颤正常，叩诊清音，双肺呼吸音粗，未闻及干湿性啰音 现病史:    weight=63    assistCheck=患者4天前无明显诱因出现发热，体温最高时达38.6℃，伴畏寒、头痛、四肢关节酸痛，食欲不振。无咳嗽、咳痰，无鼻塞、流涕，无咽痒、咽痛，无腹痛、腹泻，无皮疹，无尿频、尿急、尿痛。于当地诊所给予“利巴韦林600mg、阿奇霉素0.5g”静滴2天，体温无明显下降；2天前出现咳嗽，无痰。于中医医院就诊，血常规：WBC3.41 ×109／L，MON%17﹒6，PLT 89×109／L；给予中药治疗2天，体温无明显下降。1天前出现恶心，无呕吐。今日于门诊就诊，门诊化验示：血常规：WBC2.14 ×109／L，MON%8﹒4，PLT 75 ×109／L；胸片示双肺纹理增多    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    病毒性上呼吸道感染

呼吸科经典病历81行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=无药物食物过敏史    bodyTempr=38    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=无烟酒等不良嗜好    previousHistory=
    ...    symptom=头痛、流涕1周，咳嗽、咳痰2天#####听诊：呼吸23次／分，两肺散在哮鸣音及少量湿啰音。 现病史:1周前受凉后出现乏力、头痛、鼻塞、流涕。2天后出现咳嗽、咳黄脓痰。    weight=    assistCheck=血常规：WBC 11 ×10 9／L，N 80%。胸部X 片示两肺未见明显异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    病毒性上呼吸道感染

呼吸科经典病历81行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=38    ageType=岁    allergyHistory=无药物食物过敏史    bodyTempr=38    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=无烟酒等不良嗜好    previousHistory=
    ...    symptom=头痛、流涕1周，咳嗽、咳痰2天#####听诊：呼吸23次／分，两肺散在哮鸣音及少量湿啰音。 现病史:1周前受凉后出现乏力、头痛、鼻塞、流涕。2天后出现咳嗽、咳黄脓痰。    weight=    assistCheck=血常规：WBC 11 ×10 9／L，N 80%。胸部X 片示两肺未见明显异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性支气管炎

呼吸科经典病历82行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=45    ageType=岁    allergyHistory=    bodyTempr=38.3    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽、咳痰1周#####两肺呼吸音粗 现病史:1周前，无明显诱因出现咽痛不适，继而咳嗽、咳白黏痰，未及时就医。2天来畏寒发热、咳嗽咳痰症状加重。    weight=    assistCheck=血常规：WBC12.6 ×10 9／L，N80%。胸部X 线片示两肺纹理增粗。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性支气管炎

呼吸科经典病历83行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=74    ageType=岁    allergyHistory=无药物食物过敏史    bodyTempr=38    familyHistory=父母双亡，死因不详。否认有家族性遗传病、传染病病史
    ...    gender=1    heartRate=96    highBldPress=126    lowBldPress=67    personalHistory="生于原籍，无外地久居史及疫区停留史，无特殊毒物及放射性物质接触史，无烟酒不良嗜好。"    previousHistory=半年前曾患“肺炎”，治疗后仍间断咳嗽，有“前列腺手术史”5年，无乙肝、结核等传染病史，无高血压病、糖尿病病史。无重大外伤史，无输血史。预防接种史随当地。
    ...    symptom=咳嗽、咳痰伴发热2天#####身高180cm。发育正常，营养良好，神志清，精神可，自主体位，查体合作。全身浅表淋巴结未触及肿大。口唇无发绀，咽无充血，扁桃体无肿大。双侧呼吸动度对称，语颤正常，叩诊清音，双肺呼吸音粗，未闻及干湿性啰音。 现病史:患者于2天前无明显诱因出现咳嗽、咳痰，为白色黏痰，量少，伴发热，体温在38.3℃左右，伴乏力、全身酸痛，伴头晕、头痛。无鼻塞、流涕，无寒战、盗汗，无胸痛及痰中带血，无恶心、呕吐，无喘息、呼吸困难。在家未处理，后于门诊查血常规示：WBC 16﹒57 ×109／L，为求进一步诊治收入院    weight=99    assistCheck="1.血常规：WBC 16﹒57×109／L，NEU 12.13 ×109／L，NEU%73﹒24。2﹒胸部X线：双侧肺纹理增粗。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    急性气管支气管炎

呼吸科经典病历84行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=140    highBldPress=140    lowBldPress=90    personalHistory=有吸烟史1 包／天×20年    previousHistory=既往有冠心病史
    ...    symptom=突发胸闷、气促、呼吸困难2小时#####听诊：心率140次／分，律齐，双肺满布干湿性啰音。 现病史:突发胸闷、气促、呼吸困难2小时，咳粉红色泡沫痰，烦躁不安    weight=    assistCheck=血气分析（吸空气）：p H7.42，PaCO 2 32mmHg，PaO 2 42mmHg，血氧饱和度85%，胸片示心影增大，肺门呈蝴蝶状，肺野可见大片融合阴影。血常规：白细胞（WBC）12.0 ×10 9／L，中性粒细胞（N）76%。心电图：窦性心动过速，左室肥大劳损    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    呼吸衰竭

呼吸科经典病历84行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=56    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=140    highBldPress=140    lowBldPress=90    personalHistory=有吸烟史1 包／天×20年    previousHistory=既往有冠心病史
    ...    symptom=突发胸闷、气促、呼吸困难2小时#####听诊：心率140次／分，律齐，双肺满布干湿性啰音。 现病史:突发胸闷、气促、呼吸困难2小时，咳粉红色泡沫痰，烦躁不安    weight=    assistCheck=血气分析（吸空气）：p H7.42，PaCO 2 32mmHg，PaO 2 42mmHg，血氧饱和度85%，胸片示心影增大，肺门呈蝴蝶状，肺野可见大片融合阴影。血常规：白细胞（WBC）12.0 ×10 9／L，中性粒细胞（N）76%。心电图：窦性心动过速，左室肥大劳损    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺水肿

呼吸科经典病历85行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=19    ageType=岁    allergyHistory=    bodyTempr=36.9    familyHistory=
    ...    gender=0    heartRate=130    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=咳嗽14天，呼吸困难4小时#####神清，精神萎靡，全身发绀，面色苍白，出冷汗。颈软，气管居中，甲状腺不大，双肺呼吸音粗，双肺中下部闻及较多中细湿啰音，心界不大，心率130次／分，律齐，主动脉瓣副区闻及连续性杂音，收缩期相对响亮。腹部膨隆，子宫脐上2～3指。双下肢无水肿，无病理反射。 现病史:14天前患者受凉后出现咳嗽、流清涕等症状，因为孕妇，害怕药物对胎儿有影响，未做治疗。近3天症状加重，咳嗽频繁，伴气促，在当地小诊所输青霉素后症状稍有缓解。今下午4点左右洗热水澡后出现明显呼吸困难，全身发绀，由家人送来急诊。患者既往体健，未做过任何体检，孕8个月。怀孕后也没有体检及建孕妇卡。    weight=    assistCheck=心电监护示：心率130次／分，窦性心律，SaO273%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺水肿

呼吸科经典病历85行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=19    ageType=岁    allergyHistory=    bodyTempr=36.9    familyHistory=
    ...    gender=0    heartRate=130    highBldPress=100    lowBldPress=60    personalHistory=    previousHistory=
    ...    symptom=咳嗽14天，呼吸困难4小时#####神清，精神萎靡，全身发绀，面色苍白，出冷汗。颈软，气管居中，甲状腺不大，双肺呼吸音粗，双肺中下部闻及较多中细湿啰音，心界不大，心率130次／分，律齐，主动脉瓣副区闻及连续性杂音，收缩期相对响亮。腹部膨隆，子宫脐上2～3指。双下肢无水肿，无病理反射。 现病史:14天前患者受凉后出现咳嗽、流清涕等症状，因为孕妇，害怕药物对胎儿有影响，未做治疗。近3天症状加重，咳嗽频繁，伴气促，在当地小诊所输青霉素后症状稍有缓解。今下午4点左右洗热水澡后出现明显呼吸困难，全身发绀，由家人送来急诊。患者既往体健，未做过任何体检，孕8个月。怀孕后也没有体检及建孕妇卡。    weight=    assistCheck=心电监护示：心率130次／分，窦性心律，SaO273%。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    先天性心脏病

呼吸科经典病历86行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=17    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=1    heartRate=80    highBldPress=86    lowBldPress=58    personalHistory=近期患者班级有3人发热，与其有接触史。    previousHistory=
    ...    symptom=近期患者班级有3人发热，与其有接触史。 现病史:患者1周前无明显诱因出现发热，体温最高39.0℃，伴畏寒、寒战，无咽痛、咳嗽、咳痰，无胸痛、胸闷、气促，遂就诊，予口服抗炎、退热等药物治疗1天，体温无明显下降，出现阵发性干咳，无胸痛、气促，予“仙力素”静脉滴注抗感染治疗1天，并以口服“日夜百服宁”，体温逐步降至正常，咳嗽次数减少，4天后患者再次出现发热，体温最高达40.3℃，予以头孢曲松抗炎、盐酸氨溴索（沐舒坦）祛痰等治疗1天，体温下降不明显，且出现咳少量黄色稀痰，行胸片提示双肺纹理增多。遂改用阿奇霉素抗感染、洛索洛芬钠（乐松）退热等治疗1天，但体温无明显下降，波动在38℃左右，为进一步诊治入院。    weight=    assistCheck=血常规示WBC 13.28×109/L，N 89.2%。BNP 288.4pg/ml。甲型流感病毒检测为阳性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    流行性感冒

呼吸科经典病历87行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=对青霉素及甲硝唑过敏，无食物过敏史    bodyTempr=37.3    familyHistory=父亲身体健康，母亲患脑梗死。否认家族中有传染病及遗传病史。
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，40年前来本地，无疫区久居史，无吸烟史，无饮酒史    previousHistory=既往体健。否认肝炎、结核病史及接触史，无外伤史，无输血史，预防接种史随当地。
    ...    symptom="进行性胸闷2月余，发热3天##### 身高163cm，体表面积1.51m2，KPS 80分。皮肤、黏膜无黄染及出血点，浅表淋巴结未触及肿大。唇无发绀，咽部无充血，双侧扁桃体无肿大，伸舌居中。胸廓无畸形，右侧呼吸动度减小，节律规则，胸骨无压痛，未触及胸膜摩擦感，右肺叩诊呈浊音，右中下肺呼吸音低，未闻及干、湿性啰音。" 现病史:2个多月前患者无明显诱因出现胸闷，伴右侧背部隐痛，可以忍受，不伴发热，无咳嗽、咳痰，无心慌、心悸，无恶心、呕吐，无腹痛、腹泻，无尿频、尿急、尿痛，无皮疹及关节肿痛，当时未在意，此后患者胸闷进行性加重，3天前患者出现发热，体温最高达37.8℃，不伴畏寒、寒战，在当地医院给予抗炎对症治疗，效果不佳，今日到我院就诊。自发病以来，患者神志清，精神好，饮食、睡眠、大小便正常，体重明显减轻。    weight=48    assistCheck="1.胸部X线片：右侧胸腔大量积液。2﹒血常规：WBC 4﹒78 ×109／L；RBC 4﹒24 ×1012／L；HGB 129﹒7g／L；PLT 24 ×109／L。3.超声示：右侧胸腔内探及大量液性暗区，上下径约221mm，前后径约118mm，左右径约133 mm，内透声可；胸水细胞学找到癌细胞；腹部超声无明显异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    恶性胸腔积液

呼吸科经典病历87行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=对青霉素及甲硝唑过敏，无食物过敏史    bodyTempr=37.3    familyHistory=父亲身体健康，母亲患脑梗死。否认家族中有传染病及遗传病史。
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=生于原籍，40年前来本地，无疫区久居史，无吸烟史，无饮酒史    previousHistory=既往体健。否认肝炎、结核病史及接触史，无外伤史，无输血史，预防接种史随当地。
    ...    symptom="进行性胸闷2月余，发热3天##### 身高163cm，体表面积1.51m2，KPS 80分。皮肤、黏膜无黄染及出血点，浅表淋巴结未触及肿大。唇无发绀，咽部无充血，双侧扁桃体无肿大，伸舌居中。胸廓无畸形，右侧呼吸动度减小，节律规则，胸骨无压痛，未触及胸膜摩擦感，右肺叩诊呈浊音，右中下肺呼吸音低，未闻及干、湿性啰音。" 现病史:2个多月前患者无明显诱因出现胸闷，伴右侧背部隐痛，可以忍受，不伴发热，无咳嗽、咳痰，无心慌、心悸，无恶心、呕吐，无腹痛、腹泻，无尿频、尿急、尿痛，无皮疹及关节肿痛，当时未在意，此后患者胸闷进行性加重，3天前患者出现发热，体温最高达37.8℃，不伴畏寒、寒战，在当地医院给予抗炎对症治疗，效果不佳，今日到我院就诊。自发病以来，患者神志清，精神好，饮食、睡眠、大小便正常，体重明显减轻。    weight=48    assistCheck="1.胸部X线片：右侧胸腔大量积液。2﹒血常规：WBC 4﹒78 ×109／L；RBC 4﹒24 ×1012／L；HGB 129﹒7g／L；PLT 24 ×109／L。3.超声示：右侧胸腔内探及大量液性暗区，上下径约221mm，前后径约118mm，左右径约133 mm，内透声可；胸水细胞学找到癌细胞；腹部超声无明显异常。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺癌

呼吸科经典病历88行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=50    ageType=岁    allergyHistory=有“头孢曲松、清开灵”过敏史，否认食物及其他物品过敏史    bodyTempr=36.5    familyHistory=父亲因肺癌去世15年，母亲有高血压病病史，否认家族中有传染病及其他家族性遗传病史。
    ...    gender=0    heartRate=96    highBldPress=128    lowBldPress=80    personalHistory=生活规律，无吸烟史，不规律饮酒，无其他不良嗜好    previousHistory=既往体健，否认肝炎、结核等传染病及密切接触史，否认高血压病、冠心病、糖尿病病史。7年前行右侧乳腺癌切除术，术后行化疗4个疗程，放疗1个疗程，无输血史，无重大外伤史，预防接种史随当地。
    ...    symptom=咳嗽、咳痰1个月，胸闷10天#####身高161cm。全身浅表淋巴结未及肿大。口唇无发绀，伸舌居中。咽无充血，扁桃体无肿大。胸廓不对称，右侧饱满，无皮下气肿，无胸壁压痛，右肺中下叩浊，呼吸音消失，双肺未闻及干湿性啰音。移动性浊音阴性。 现病史:患者于1个月前受凉后出现咳嗽，咳黄白色痰，痰多，黏稠不易咳出。发热，最高体温38℃，伴畏寒，无胸闷、憋气，无头晕、头痛，无痰中带血或咯血。至当地县医院就诊，静滴药物治疗8天，患者体温正常，咳嗽、咳痰较前减轻后停用。10天前患者出现右侧胸痛，于深呼吸及活动后加剧，并逐渐出现胸闷、憋气，夜间平卧困难，再次到当地医院就诊。患者自患病以来，大小便无异常，饮食睡眠可，体重无明显变化。    weight=    assistCheck="1﹒血常规：WBC 4﹒32 ×109／L，NEU%58﹒10% 2﹒血生化：ALT 10U／L，AST 19U／L，γ‐GT 20U／L，AKP 72U／L，血白蛋白32.2g／L，球蛋白35.2g／L 3﹒呼吸系统肿瘤系列：癌胚抗原139.80ng／ml（参考值0～5ng／ml），糖类抗原CA‐125 803﹒60U／ml（参考值0～35U／ml），神经元特异性烯醇化酶31.53ng／ml（参考值0～20ng／ml），细胞角蛋白19片段＞500.00ng／ml（参考值0.1～3.3ng／ml）肿瘤相关物质73.00U／ml（参考值0～71U／ml）。 4﹒胸水超声：右侧大量胸腔积液。5.胸部CT 平扫示：右乳癌术后改变，左肺上叶结节，右肺中叶病变，性质待定，转移不除外，右侧胸腔积液。6.胸水检查示：2次查见癌细胞（腺癌）"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    恶性胸腔积液

呼吸科经典病历89行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=23    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽咳痰1个月#####听诊右肺未闻及呼吸音，左侧呼吸音清。 现病史:1个月前无诱因出现咳嗽，偶有黄痰，无呼吸困难    weight=    assistCheck=动脉血气分析：pH 7﹒40，PaO272﹒40mmHg，PaCO238﹒10mmHg，血氧饱和度94.70%。肺DR示右侧大量气胸；肺CT 示右肺多发肺大疱，气肿，慢性炎症性肿块纵隔疝。肺通气／灌注显像显示：右肺几乎无显像剂分布，二者显像相匹配；左肺未见异常    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺大泡

呼吸科经典病历90行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=35    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=发热1个月#####两前臂、两下肢及前胸后背可见多发结节性红斑 现病史:发热1个月，体温最高达39.8℃，伴轻咳，胸憋。外院曾予以青霉素、红霉素治疗无效。    weight=    assistCheck=实验室检查白细胞计数不高。CT示两肺沿支气管血管束散在分布的结节灶，病灶边缘模糊，右下叶后基底段融合成片状病灶，肺门纵隔未见增大淋巴结。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    过敏性肺炎

呼吸科经典病历91行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=5    ageType=月    allergyHistory=    bodyTempr=    familyHistory=毛细支气管炎
    ...    gender=1    heartRate=150    highBldPress=    lowBldPress=    personalHistory=    previousHistory=出生后易反复患湿疹。
    ...    symptom=咳嗽、打喷嚏2天，喘息伴呼气性呼吸困难1天#####神志清楚，一般状况差，周身无出血点及皮疹，咽部略充血，呼吸促，烦躁不安，鼻翼扇动，口周轻度发绀，轻度三凹征，胸部叩诊呈过清音，肺肝界位于右锁骨中线第6肋间；听诊双肺呼吸音延长，可闻及典型的呼气性哮鸣音，偶可闻及细小湿性啰音；心率150次／分，腹软，肝脏右肋下2.0cm，四肢活动良好，肢端温。 现病史:2天前受凉后咳嗽、打喷嚏，近1天出现喘息，喉部可闻及“咝咝”声，伴呼气性呼吸困难，夜间及晨起发作明显，剧烈活动、哭闹或吃奶后喘鸣加重，无发热。    weight=7    assistCheck=外周血白细胞及CRP正常；RSV‐IgM阳性，RSV抗原检测阳性；MP‐IgM阴性；其他病毒抗体均阴性。胸部X线检查示肺气肿改变。入院时未吸氧下动脉血气PaO249mmHg，PaCO234mmHg。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    毛细支气管炎

呼吸科经典病历92行-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.9    familyHistory=
    ...    gender=0    heartRate=86    highBldPress=145    lowBldPress=71    personalHistory=    previousHistory=“高血压”史4年
    ...    symptom=反复咳嗽、气促、咯血4年，再发10 余天#####库欣面容。双肺呼吸音粗，未闻湿啰音，可闻中等量哮鸣音。心界不大，心率86次／分，律齐，未闻及病理性杂音。腹平软，上腹剑突下压痛，无反跳痛，肝、脾、胆检查无特殊。神经系统检查无异常。 现病史:患者4年前不明原因下反复出现阵发性咳嗽、气促咯血伴胸闷不适；当时无发热、心悸、下肢水肿等。具体治疗经过不详，经治疗后病情好转出院。但咳嗽、咳痰、咯血症状反复，曾先后多次在我院门诊及住院治疗，经抗感染、止血、平喘及对症支持治疗后均能好转。近10 多天来，再次出现咳嗽、咯血、气促，咯少量鲜血，稍有胸壁疼痛，无胸闷，无发热、畏寒，无心悸。曾在我院门诊治疗，经静脉滴注“氨茶碱、地塞米松、沐舒坦”后，病情无转。起病以来精神一般，胃口尚可，体重无明显变化    weight=    assistCheck="血常规、肝功能未见明显异常。血清尿酸371μmol／L。血脂：高密度脂蛋白胆固醇2.6mmol／L。心电图示：T 波改变。查心脏彩超示：①左室肥厚，左房肥大；②主动脉硬化；③三尖瓣、肺动脉瓣关闭不全（轻度）；④左室收缩功能测值正常，顺应性减低；⑤心包少量积液。胸片示：双下肺感染，右侧水平裂增厚，主动脉型心影改变。胸部CT 平扫＋增强示：右上肺后段病情有所吸收好转，增强片肺部及纵隔内未见有畸形血管。行支气管镜检查示：进入声门后，见气管上段浸润性狭窄。颈部CT检查示：弥漫性甲状腺肿大，考虑甲状腺肿合并腺瘤，恶性病变待排除，伴气道狭窄。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    上气道梗阻

呼吸科经典病历92行-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=70    ageType=岁    allergyHistory=    bodyTempr=36.9    familyHistory=
    ...    gender=0    heartRate=86    highBldPress=145    lowBldPress=71    personalHistory=    previousHistory=“高血压”史4年
    ...    symptom=反复咳嗽、气促、咯血4年，再发10 余天#####库欣面容。双肺呼吸音粗，未闻湿啰音，可闻中等量哮鸣音。心界不大，心率86次／分，律齐，未闻及病理性杂音。腹平软，上腹剑突下压痛，无反跳痛，肝、脾、胆检查无特殊。神经系统检查无异常。 现病史:患者4年前不明原因下反复出现阵发性咳嗽、气促咯血伴胸闷不适；当时无发热、心悸、下肢水肿等。具体治疗经过不详，经治疗后病情好转出院。但咳嗽、咳痰、咯血症状反复，曾先后多次在我院门诊及住院治疗，经抗感染、止血、平喘及对症支持治疗后均能好转。近10 多天来，再次出现咳嗽、咯血、气促，咯少量鲜血，稍有胸壁疼痛，无胸闷，无发热、畏寒，无心悸。曾在我院门诊治疗，经静脉滴注“氨茶碱、地塞米松、沐舒坦”后，病情无转。起病以来精神一般，胃口尚可，体重无明显变化    weight=    assistCheck="血常规、肝功能未见明显异常。血清尿酸371μmol／L。血脂：高密度脂蛋白胆固醇2.6mmol／L。心电图示：T 波改变。查心脏彩超示：①左室肥厚，左房肥大；②主动脉硬化；③三尖瓣、肺动脉瓣关闭不全（轻度）；④左室收缩功能测值正常，顺应性减低；⑤心包少量积液。胸片示：双下肺感染，右侧水平裂增厚，主动脉型心影改变。胸部CT 平扫＋增强示：右上肺后段病情有所吸收好转，增强片肺部及纵隔内未见有畸形血管。行支气管镜检查示：进入声门后，见气管上段浸润性狭窄。颈部CT检查示：弥漫性甲状腺肿大，考虑甲状腺肿合并腺瘤，恶性病变待排除，伴气道狭窄。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    甲状腺癌

呼吸科经典病历93行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=28    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=0    heartRate=    highBldPress=    lowBldPress=    personalHistory=会计师    previousHistory=
    ...    symptom=嗜睡十余年，近两年加重#####心理检查：SDS、SAS、MMPI等项检查均提示“抑郁因子”分较高 现病史:患者主要以“白天嗜睡难以控制，夜间失眠，严重影响工作和生活”为主症来医院求治，经询问病史，未发现患者有其他躯体疾病。当问及嗜睡病史时，患者回忆从初中开始。嗜睡十余年，近几年加重。每次发病时腿脚都不听使唤，夜间难以入睡，有时彻夜不眠。患者希望能尽快治愈自己的怪病，“让自己能像正常人一样生活”。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    发作性睡病

呼吸科经典病历94行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=47    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=高血压3年，间断服药。先天性左眼外斜伴眼震，抑郁症病史1年，口服抗抑郁药物，无糖尿病、高血脂
    ...    symptom=反复出现的呼吸困难2个月##### 现病史:患者2个月来睡眠中或安静状态下反复出现呼吸困难、二氧化碳潴留、低氧血症及呼吸暂停，伴或不伴有意识障碍，给予机械通气后临床症状快速改善，神经系统症状无明显改变    weight=    assistCheck=支气管镜、肺功能及肌电图检查未见明显异常。颅脑MRI横断面扫描T2像，示左侧延髓腹外侧片状长T2异常信号，累及锥体束、网状结构。CEMRA扫描，示右侧椎动脉纤细，基底动脉略迂曲，余颅内血管未见明显异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    中枢性睡眠呼吸暂停综合征

呼吸科经典病历95行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=76    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=输液2小时后胸闷#####听诊双肺布满湿啰音，脉搏细速 现病史:因车祸致左上肢离断入院，由于失血过多，医嘱予以配输血1500ml，护士立即用留置针为患者建立两条静脉通路补液，一条通路输注低分子右旋糖酐500ml，80滴／分；另一条通路予双人床边核对后快速输血，100～120滴／分，2小时后，患者突然出现胸闷、气促、咳粉红色泡沫样痰。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    肺水肿

呼吸科经典病历96行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=59    ageType=岁    allergyHistory=    bodyTempr=37.4    familyHistory=
    ...    gender=0    heartRate=82    highBldPress=110    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=咳嗽、咳痰伴咯血2个月#####一般稍弱，无皮疹，浅表淋巴结未触及，巩膜不黄，气管居中，两上肺呼吸音稍减低，并闻及少量湿啰音，心叩不大，心率94次/分，律齐，无杂音，腹部平软，肝脾未触及，下肢不肿。 现病史:2个月前劳累后出现咳嗽、咳痰，少量咯血伴低热、盗汗、胸闷、乏力。病后进食少，二便正常，睡眠稍差。    weight=    assistCheck=血Hb 110g/L， WBC 4.5×109/L， N 53%， L47%， plt 210×109/L， ESR 35mm/h，空腹血糖9.6mmol/L，尿蛋白（－），尿糖（++）    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺结核

呼吸科经典病历97行
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=15    ageType=岁    allergyHistory=    bodyTempr=37.5    familyHistory=
    ...    gender=1    heartRate=76    highBldPress=120    lowBldPress=70    personalHistory=初中学生。无旅游史及结核病密切接触史。无职业粉尘接触史。但近3个月放学后到同学家中玩，同学家中室内养鸽子10余只    previousHistory=既往身体健康。
    ...    symptom=发热、咳嗽伴气短3个月#####神清，结膜无充血，口唇无发绀，咽不赤。气管居中，锁骨上及腋窝淋巴结未触及。胸廓对称，双侧呼吸运动一致。双肺可闻及散在干啰音，未闻及湿啰音。心界不大，心率76次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹软无压痛，肝脾肋下未触及。未见皮疹、皮下结节、肌肉无握痛，四肢神经系统检查未见异常。 现病史:患者3个月前缓慢起病，发热，体温37.5℃，间断性，无寒战、无盗汗。干咳，咳嗽多在晚上和夜间出现，伴有胸闷和气短，清晨症状有缓解。无关节肌肉疼痛、口腔溃疡、脱发等。曾就诊于当地医院，给予抗生素、平喘药治疗1周，咳嗽气短症状无明显改善。    weight=    assistCheck=1.肺功能：用力肺活量占预计值百分比（FVC%）为67%，一秒量占预计值百分比（FEV1.0%）为90%，一氧化碳弥散量占预计值百分比（DLCO%）为46%。2.动脉血气分析（未吸氧）：pH 7.38，PaO2 63mmHg，PaCO238 mmHg。3.血常规：WBC 10.5×109/L，中性粒细胞分数：56%。4.胸片：肺容积略缩小，肺动脉段突出（肺动脉高压形成），双肺中下野透过度减低，呈磨玻璃改变。5.肺HRCT：两肺中下野见弥漫性分布粟粒样小结节影，边缘模糊，呈小叶中心分布。6.ERS：25mm/h；结核抗体（+）；PPD 7.5 mm ×7.5mm（+）。7.CRP（+）、RF（+）、IgG、IgA、IgM均增高。8.血清抗原抗体沉淀试验（+）。9.纤维支气管镜和支气管肺泡灌洗：镜下见双侧各级支气管黏膜普遍充血红肿，未见狭窄和阻塞。灌洗液外观透明无混浊。10.肺泡灌洗液细胞学检查：细胞总数0.6×106/ml，细胞分类巨噬细胞62%，中性粒细胞3%，淋巴细胞35%。T淋巴细胞亚群：辅助性T淋巴细胞（CD4+）38%，抑制性T淋巴细胞（CD8+）44%，CD4+/ CD8+＜1。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    过敏性肺炎

呼吸科经典病历98L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=28    ageType=岁    allergyHistory=    bodyTempr=36.4    familyHistory=
    ...    gender=0    heartRate=82    highBldPress=110    lowBldPress=80    personalHistory=    previousHistory=
    ...    symptom=进行性气短4个月#####一般状态可，神志清楚。面色、口唇、甲床红润，球结膜无水肿，无颈静脉怒张、肝颈回流征阴性，双锁骨上未触及肿大淋巴结。胸廓正常，双肺叩诊清音，听诊呼吸音普遍较弱，未闻及干湿啰音。心率82次/分，节律规整。各瓣膜听诊区未闻及病理性杂音。腹软，肝肋下未触及。双下肢无水肿，无杵状指。 现病史:患者于4个月前感活动后气短，无咳嗽，几乎无痰，无胸痛，无发热，无喘息。未予处理。以后气短呈持续性进行性加重，步行上一层楼即需要休息，给予抗生素治疗2周，症状无好转。为进一步诊治来诊。发病以来体力差，食欲轻度下降，二便正常，体重无明显变化。    weight=    assistCheck=①血常规：WBC 10.9×109/L，S 73%，L 27%，Hb 123g/L，PLT 238×109/L。②心电图：未见异常。除外由心律失常引起的呼吸困难。③肺HRCT：显示为全肺均匀分布的大小不等的薄壁囊肿，直径在0.5～5cm之间，局部见多个气囊相互融合。④肺功能：肺总量（TLC）增加，占预计值的81%，RV/TLC42%，第一秒用力呼气量（FEV1.0）占预计值的63%，肺活量占预计值的65%，FEV1.0/FVC43%。DLCO占预计值的45%，表明存在气流受限，肺总量和残气增加，肺功能呈混合性通气功能障碍，弥散功能显著降低。⑤动脉血气：pH 7.33，PaO2 71.5mmHg，PaCO2 34.5mmHg。⑥心脏扇扫：心脏各房室腔及瓣膜未见异常。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺淋巴管平滑肌瘤病

呼吸科经典病历99L-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=2    ageType=岁    allergyHistory=    bodyTempr=39    familyHistory=
    ...    gender=1    heartRate=170    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往无反复呼吸道感染和喘息病史。生长发育与同龄儿相当。
    ...    symptom=咳嗽、发热7天#####神志清楚，精神反应弱，呼吸促，左上臂可见卡疤1枚。有鼻翼扇动，口唇稍绀，口周发青，咽充血，可见多量黏稠分泌物，气管居中，可见三凹征，胸廓对称，双侧呼吸运动一致，双肺叩诊清音，呼吸音粗，双肺可闻及中小水泡音，偶有呼气性喘鸣音。心率170次/分，心音稍钝，律齐，各瓣膜区未闻及杂音，腹软肝肋下3cm，剑突下1.5cm，质中，边钝。四肢、神经系统查体未见异常。 现病史:患者7天前出现发热、咳嗽，为阵发性连声咳嗽，体温最高达40℃以上。咽部有痰，不易咳出，偶有喘息。无抽搐，无声音嘶哑，无呼吸困难。予抗生素治疗，不见效，病情进行性加重，出现咳嗽，气短，呼吸困难、心率快。查血象不高。    weight=    assistCheck=胸X线正位片：左侧上下肺叶内带可见大片阴影，左肺门增宽。血常规 WBC 10.4×109/L，N 0.278，L 0.651，RBC、Hb、PLT正常。ESR、CRP均正常、血气为低氧血症。咽部分泌物的腺病毒的PCR阳性，进一步测序为腺病毒7型。痰培养无致病菌，血培养为阴性。PPD试验阴性。心脏彩超提示心脏结构及功能正常。IgE正常，过敏原筛查试验阴性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    腺病毒肺炎

呼吸科经典病历99L-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=2    ageType=岁    allergyHistory=    bodyTempr=39    familyHistory=
    ...    gender=1    heartRate=170    highBldPress=    lowBldPress=    personalHistory=    previousHistory=既往无反复呼吸道感染和喘息病史。生长发育与同龄儿相当。
    ...    symptom=咳嗽、发热7天#####神志清楚，精神反应弱，呼吸促，左上臂可见卡疤1枚。有鼻翼扇动，口唇稍绀，口周发青，咽充血，可见多量黏稠分泌物，气管居中，可见三凹征，胸廓对称，双侧呼吸运动一致，双肺叩诊清音，呼吸音粗，双肺可闻及中小水泡音，偶有呼气性喘鸣音。心率170次/分，心音稍钝，律齐，各瓣膜区未闻及杂音，腹软肝肋下3cm，剑突下1.5cm，质中，边钝。四肢、神经系统查体未见异常。 现病史:患者7天前出现发热、咳嗽，为阵发性连声咳嗽，体温最高达40℃以上。咽部有痰，不易咳出，偶有喘息。无抽搐，无声音嘶哑，无呼吸困难。予抗生素治疗，不见效，病情进行性加重，出现咳嗽，气短，呼吸困难、心率快。查血象不高。    weight=    assistCheck=胸X线正位片：左侧上下肺叶内带可见大片阴影，左肺门增宽。血常规 WBC 10.4×109/L，N 0.278，L 0.651，RBC、Hb、PLT正常。ESR、CRP均正常、血气为低氧血症。咽部分泌物的腺病毒的PCR阳性，进一步测序为腺病毒7型。痰培养无致病菌，血培养为阴性。PPD试验阴性。心脏彩超提示心脏结构及功能正常。IgE正常，过敏原筛查试验阴性    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    心力衰竭

呼吸科经典病历100L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=27    ageType=岁    allergyHistory=    bodyTempr=38    familyHistory=
    ...    gender=0    heartRate=96    highBldPress=105    lowBldPress=68    personalHistory=    previousHistory=患者既往体健。发病前 10天曾去广州出差，当时广州有严重急性呼吸综合征（SARS）流行。否认家族传染病史及遗传病史。
    ...    symptom=发热、乏力 12天，咳嗽、气促 7天#####精神差，全身皮肤无黄染、无皮疹，全身淋巴结未触及肿大，口腔黏膜完整，未见白斑，扁桃体无肿大。胸廓无畸形，双肺叩诊呈清音，听诊双肺中、下部呼吸音粗，未闻及干湿性啰音及胸膜摩擦音。心脏、腹部、神经系统查体未见异常。 现病史:患者12天前下午开始出现发热、乏力、寒战、头痛、关节酸痛和肌痛，无寒战，无咳痰，无鼻塞、流涕，给予“阿奇霉素、利巴韦林”治疗，病情无缓解。7天前出现干咳、气短、憋喘，以坐位为明显，平卧后有所缓解，查嗜肺军团菌抗体、肺炎衣原体抗体、肺炎支原体抗体均阴性，胸片检查示“双下肺炎症”，调整抗菌药物治疗，症状无减轻    weight=    assistCheck="血常规：WBC5.3×109/L，N75%，嗜酸性粒细胞正常，Hb111g/L，PLT276×109/L，异形淋巴细胞 0。尿便常规正常。肝功、肾功正常。ESR：93mm/h。柯萨奇、EB 病毒（EBV）、巨细胞病毒（CMV）抗体 IgM 均为阴性，冷凝集试验阴性。动脉血气分析：PaO2 84.2mmHg，PaCO2 39.9mmHg，SaO2 98%。X 线胸片：双侧肺中野内均可见大片状模糊影，边缘清晰，肺门影无明显增大，纵隔心影未见异常，双膈面光滑，两侧肋膈角锐利。"    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    严重急性呼吸综合征

呼吸科经典病历101L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=3    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=进食瓜子后出现呛咳、憋气3小时#####颈部:无颈部肿物，三凹征( +)。口咽:口唇发绀，口内固定气管插管。肺部:听诊双肺呼吸音粗，双侧呼吸音均低，左侧较明显，有哮鸣音。 现病史:3小时前患儿进食“瓜子”后哭闹，出现呛咳，喘憋，有呼吸困难，急诊入院。    weight=    assistCheck=    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    气管内异物

呼吸科经典病历102L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=17    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=父母体健，无兄弟姐妹。
    ...    gender=0    heartRate=74    highBldPress=100    lowBldPress=70    personalHistory=    previousHistory=既往体健，儿时体质与同龄儿童同。2年前曾在当地医院诊断为“焦虑症”，无减肥药接触史。
    ...    symptom=活动后气短4年，反复晕厥2年#####双肺呼吸音清晰，未闻及干湿性啰音，双肺未闻及血管杂音。HR 74次/分，心律齐，P2亢进，胸骨左缘3～4肋间闻及3/6级收缩期吹风样杂音，双下肢无水肿。 现病史:患者于4年前出现活动后气短，无胸闷、心悸、头晕等不适，未予注意。2年前出现活动后反复晕厥4次，无抽搐、尿便失禁，1分钟后自行恢复。自此活动耐量逐渐下降，上1层楼或快步行走即出现气短，口唇发绀，伴咳嗽，无咯血、胸痛。为进一步诊治来诊。病程中无发热、关节疼痛、口干、眼干、鼻出血等不适。    weight=    assistCheck=血常规：RBC 4.86×1012/L，Hb 133g/L。甲状腺功能指标：正常。尿常规：正常。肝肾功能：正常。NT-proBNP：1211fmol/L。乙肝、丙肝：阴性。HIV：阴性。Hs-CRP：13.02mg/L。免疫学检查：抗双链DNA抗体、抗核抗体、抗Sm、抗RNP，抗Scl-70，抗J0-1、抗SSA、抗SSB抗体均阴性；补体C3、C4正常；IgG、IgA正常。心电图：窦性心律，电轴右偏，右心室肥厚，广泛ST-T改变。X线胸片：双肺门动脉扩张，外周纹理纤细，主动脉结不宽，肺动脉段凸出，右心房、室扩大，心胸比0.61。超声心动图：左心房前后径31mm、左心室舒张末前后径39mm，右心室舒张末前后径31mm，左心室射血分数70%，估测肺动脉收缩压102mmHg。右心房明显扩大，右心室壁增厚，运动正常，左心室内径大致正常，室间隔左移，左心室呈“D”字形，肺动脉扩张，腔内未见异常回声，三尖瓣瓣环扩张，致瓣叶对合欠佳，三尖瓣少～中量高速反流，余瓣膜结构、形态和启闭未见异常。超声诊断：重度肺动脉高压，右心扩大，三尖瓣中～大量反流。肺功能：肺容量、肺通气功能正常，FEV1/FVC 95%，小气道功能正常，肺弥散功能明显减退。动脉血气分析：pH 7.46，PO2 67.7mmHg，PCO2 30.3mmHg，HCO3-20.2mmol/L，SaO2 94.4%。肺动脉增强CT：主肺动脉及左右肺动脉明显扩张，未见狭窄及充盈缺损，右心房、室增大，双肺实质未见异常。肺动脉造影：主肺动脉及左、右肺动脉明显扩张，外周纹理纤细，充盈不良，未见狭窄及充盈缺损。放射性核素肺灌注显像：双肺非肺段性放射性稀疏，符合肺动脉高压改变。    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺动脉高压

呼吸科经典病历103L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=64    ageType=岁    allergyHistory=    bodyTempr=37    familyHistory=
    ...    gender=0    heartRate=116    highBldPress=160    lowBldPress=75    personalHistory=农民    previousHistory=既往高血压病10年，无家族相关病史。
    ...    symptom=反复咳嗽2年，加重伴气促半个月#####全身浅表淋巴结无肿大，唇无发绀，双肺呼吸音清，未闻及明显干湿啰音。心界不大，心率98次／分，律齐，无杂音。腹平软，无压痛及反跳痛，肝脾肋下未扪及，肠鸣音正常。双下肢无水肿。 现病史:患者2年前开始出现咳嗽，以干咳为主，偶有白色黏痰。半个月前开始咳嗽加重，少量白色黏痰，咳嗽剧烈伴有明显气促，活动后明显，休息可缓解，给予抗炎及舒张支气管治疗后，症状稍有缓解，但反复发作，且进行性加重，为求进一步诊治而来我院。    weight=    assistCheck=肺通气功能＋舒张试验检查：FEV1 0﹒99L、用药后1.23L、FEV1／FVC56%、FEV1%61%提示中度阻塞性通气功能障碍，舒张试验阳性；呼气相有平台，考虑大气道阻塞。血常规：WBC7.0×109／L，N72.2%，Hb130g／L；血沉16mm／h，C反应蛋白5.7mg／L；肝肾功能、结核全套、肿瘤标志物、凝血功能均（－）。气管CT＋三维重建检查，发现气管中下段占位，遂在全麻下行支气管镜检查，发现气管下段肿块阻塞，管腔高度狭窄，行高频电圈套器切除，术后组织病理为支气管黏液腺瘤    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    支气管腺瘤

呼吸科经典病历104L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=1    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=急性细支气管炎
    ...    gender=    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=患儿在新生儿及小婴儿期有轻微的特应性皮炎史。患儿分别于生后5个月、7个月及1岁时出现咳嗽和喘息，均伴有发热，无活动受限，急性症状治愈后即停止治疗。
    ...    symptom=反复咳嗽、喘息3天##### 现病史:患儿3天前出现咳嗽和喘息，伴有发热，经过抗感染及规律雾化吸入布地奈德和复方异丙托溴铵治疗，病情略有缓解，但咳喘症状持续存在，甚至时有加重，做胸部CT结果提示：双肺马赛克灌注，考虑存在小气道病变    weight=    assistCheck=检查患儿的过敏状态，食物组和吸入组皮肤点刺试验均阴性，血清特异性IgE结果提示食物组为阳性，嗜酸性粒细胞阳离子蛋白和过敏原总IgE显著升高，分别为＞200μg/L（正常值0～13.3μg/L）和130KU/L（正常值0～60 KU/L）。患儿哮喘预测指数阳性。抗炎性反应和缓解气道痉挛治疗（长期雾化吸入布地奈德配合复方异丙托溴铵的主要治疗方案）8个月后，患儿肺功能检查示患儿潮气肺功能显示反映小气道功能的达峰容积比和达峰时间比均降低（分别为25.2%和23%），结果提示患儿存在小气道阻塞性通气功能障碍    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj}    急性细支气管炎

呼吸科经典病历105L-1
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽咳痰2周,伴发热胸痛3天##### 现病史:患者2周前出现咳嗽、咳痰,先为白色粘液痰,后渐转为黄粘痰,3天前起高热寒战、右下胸痛.    weight=    assistCheck=血常规白细胞计数(WBC)15.8×109/L,中性(N)72.9%,胸片表现"右下肺炎伴少量胸腔积液".    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺炎

呼吸科经典病历105L-2
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0    age=60    ageType=岁    allergyHistory=    bodyTempr=    familyHistory=
    ...    gender=1    heartRate=    highBldPress=    lowBldPress=    personalHistory=    previousHistory=
    ...    symptom=咳嗽咳痰2周,伴发热胸痛3天##### 现病史:患者2周前出现咳嗽、咳痰,先为白色粘液痰,后渐转为黄粘痰,3天前起高热寒战、右下胸痛.    weight=    assistCheck=血常规白细胞计数(WBC)15.8×109/L,中性(N)72.9%,胸片表现"右下肺炎伴少量胸腔积液".    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    肺炎
