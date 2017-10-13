*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# userGuid String 是 患者ID（接入放定义）
# doctorGuid String 是 医生ID（接入放定义）
# serialNumber String 是 业务流水ID（接入方定义）
# hospitalGuid String 是 医院ID（惠每分配）
# gender Integer 否 性别1男,0女
# age double 否 年龄
# ageType String 否 岁、月、天
# bodyTempr Double 否 体温
# weight Double 否 体重
# heartRate Integer 否 心率
# lowBldPress Integer 否 收缩压
# highBldPress Integer 否 舒张压
# examInfo String 否 检查
# previousHistory String 否 既往史
# personalHistory String 否 个人史
# allergyHistory String 否 过敏史
# familyHistory String 否 家族史
# symptom String 否 主诉
# confirmDiagnosis String 否 已确定诊断
# assistCheck    辅助检查
*** Variables ***
*** Test Cases ***

消化科经典病历L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0
    ...    age=    ageType=岁
    ...    allergyHistory=
    ...    bodyTempr=
    ...    familyHistory=
    ...    gender=
    ...    heartRate=
    ...    highBldPress=
    ...    lowBldPress=
    ...    personalHistory=
    ...    previousHistory=
    ...    symptom= 现病史:
    ...    weight=
    ...    assistCheck=
    ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胆石病


# 神经科经典病历L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"key": "","value":"流行性乙型脑炎"}
#     ...    presentHistory=
#     ...    assistCheck=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    胆石病


# ######神经科经典病历
# ###
# 神经科经典病历2L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=2    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=39.6
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=“高热惊厥”病史
#     ...    symptom=发热1天、抽搐1次#####精神稍倦怠，口唇红润，咽部充血，双侧扁桃体Ⅰ度肿大颈软 1天前无明显诱因出现发热，精神食欲差，偶有头痛，无咳嗽、腹痛等。半天前突然出现四肢抽搐、双眼上翻，伴口吐泡沫，即送急诊，对症治疗后缓解，但患儿体温仍反复。第2天起患儿渐出现嗜睡，又抽搐一次，伴呕吐3次，哭闹不安。
#     ...    weight=
#     ...    assistCheck=血常规示WBC 18.7×109/L，中性粒细胞85%。，腰椎穿刺示脑脊液压力偏高，无色透明，潘氏试验（+），细胞数62×106/L，脑脊液涂片检查未见结核菌，脑脊液乙型脑炎特异性IgM抗体阳性
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    流行性乙型脑炎


# 神经科经典病历3L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=发热5天，意识不清1天#####浅昏迷，压眶有反应，面色红，呼吸急促，双侧瞳孔等大等圆，对光反射迟钝，颈抵抗阳性，心律齐，112次/分，各瓣膜听诊区未闻及病理性杂音。四肢肌张力较高，双膝反射未引出，左侧巴氏征阳性，右侧巴氏征阴性。5天前无明显诱因发热，体温38°C～40°C，全身乏力，恶心、呕吐。无腹痛、腹泻，无尿频尿急尿痛。在当地医院消炎抗病毒治疗后，体温不降，尿蛋白（++），1天前意识不清，呈谵妄状态，半天后出现牙关紧闭，四肢屈曲，转入我院。无外耳道流脓史，无咽痛、无传染病接触史。未注射乙脑疫苗。居住地蚊虫较多，当地无类似疾病发生。
#     ...    previousHistory=既往体健。无结核病史
#     ...    personalHistory=已婚、未育、职业为护士。
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=38.4    lowBldPress=100    highBldPress=150
#     ...    examInfo=    heartRate=112    age=32    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=血常规：Hb:165g/L,WBC:11×109/L,NEU:0.8,LYM:0.2,PLT:115×109/L.尿常规：尿蛋白（++）；K+:4.0mmol/L,.脑脊液常规检查：微混，总细胞500×106/L，白细胞460×106/L，分类多核细胞0.70，单核0.30；生化检查：蛋白：558mg/L，糖3.48mmol/L，颅脑CT显示局限性低密度阴影。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     # log    ${aj}
#     Should Contain    ${aj}    流行性乙型脑炎


# 神经科经典病历4L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=发热、头痛6天，加重伴意识模糊、左侧肢体无力1天#####T38.8℃，P86次／分，R20次／分，Bp150／80mmHg。神经系统检查：意识模糊，轻度烦躁。双眼裂等大，眼球居中，各方向活动不受限。双侧瞳孔不等大，左侧3.5mm3右侧2.5mm，对光反射灵敏。眼底检查不配合。角膜反射存在。额纹及鼻唇沟对称。咽反射存在，伸舌居中。左上下肢肌力3级，右上下肢肌力5级；四肢肌张力正常；腱反射正常；双侧Hoffman征阳性，左Chaddock征阳性，双Babinski征阴性。颈抵抗阳性，Kernig征阳性。其他神经系统检查不配合。6天前淋雨后出现畏寒、发热（39℃）、头痛、头晕，按“上呼吸道感染”予以静脉输注氧氟沙星，3天后体温降至正常停止使用。入院前1天再次发热（40℃），头痛加重，多次呕吐胃内容物，但为非喷射性；意识模糊，不认家人，答不切题；左侧肢体无力。我院急诊头颅CT扫描显示：“右侧基底核区占位性病变，性质待定”（图14－1）。
#     ...    previousHistory=既往无高血压病和糖尿病史，无中耳炎、鼻窦炎、皮肤疖肿等感染史，无颅脑外伤史；无慢性疾病及传染病史。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=38.8    lowBldPress=80    highBldPress=150
#     ...    examInfo=    heartRate=86    age=68    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=血常规：WBC16.3×109／L，NE80%，RBC4.66×1012／L，Hb154g／L，PLT150×109／L。血生化：GLU173mg／dl，Ca2＋8﹒1mg／dl，Cl－94mmol／L，其余指标正常。发病第8天腰椎穿刺脑脊液检查：外观淡黄微浊；压力170mmH2O；WBC814×106／L，多核粒细胞18%，单核细胞82%；葡萄糖1.4mmol／L（25mg／dl），氯化物128mmol／L，蛋白3.92g／L（392mg／dl）；革兰染色未找到细菌，细菌培养阴性，墨汁染色未见隐球菌，抗酸染色未见结核杆菌；结核抗体（同期血液结核抗体阴性）、病毒抗体、囊虫抗体均阴性。发病第9天头颅MRI显示：“右侧丘脑T1WI高信号、T2WI不规则高信号，边缘模糊；Gd‐DTPA强化显示病灶呈环形强化，形态规则，壁薄，约2.8×2.3cm大小，周边水肿，右侧侧脑室和第三脑室受压，右侧中脑受压”
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     log    ${aj}
#     Should Contain    ${aj}    脑脓肿


# 神经科经典病历5L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因反复头痛2个月，伴右侧肢体不全性偏瘫15天入院#####体温36.7℃，神清，双视乳头轻度水肿，右上肢肌力Ⅲ级，下肢为Ⅱ级，感觉无缺失，病理征未及。CT：左枕部可见一等密度影，附近可见大片状低密度影，左侧脑室受压变小并向右移，增强后可见多个边缘性强化之囊状肿块，考虑为Ⅱ～Ⅲ级星形细胞瘤.因反复头痛2个月，伴右侧肢体不全性偏瘫15天入院，在术中发现此占位为囊性肿块，包膜完整有韧性，予以穿刺抽出稠厚脓液有臭味，遂肉眼下全切。术后病检为“脑脓肿胞膜形成期”。
#     ...    previousHistory=10年前患有肝脓肿，于3月前“感冒”“发热”一次，因无大碍，故未引起重视。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=36.7    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=46    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=白细胞计数：10.6×109／L
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑脓肿


# 神经科经典病历6L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因发热、恶寒、伴头痛1天，以“发热待查”收住我院内科治疗。#####入院体查：体温38.9℃，嗜睡状，指鼻试验及跟膝胫试验均阳性，双肺有大量湿性罗音，可闻及喉中痰鸣音，呼吸急促30次／分，因发热、恶寒、伴头痛1天，以“发热待查”收住我院内科治疗。经内科治疗5天，体温虽得到控制，但头痛不减反而增剧，且逐渐出现意识障碍，追问病史患者起病后即有行走困难，右侧肢体协调运动障碍。
#     ...    previousHistory=既往有慢性化脓性中耳炎。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=38.9    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=36    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"key": "","value":""}
#     ...    presentHistory=
#     ...    assistCheck=CT检查：右侧小脑占位性病变、双侧脑室积水，考虑右小脑半球脑脓肿
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑脓肿

# 6.神经科经典病历7L-1
#     [Documentation]    断言:"化脓性脑膜炎"
#     ${getRes}    智能诊断3.0    symptom=主因“发热12天，视物成双7天，意识模糊3天”于2007年1月25日收入神经内科重症监护病房。#####神经系统检查：嗜睡，呼之能睁眼，能回答简单问题，言语流利，能执行简单指令。双侧瞳孔不等大，右侧直径5mm，对光反射迟钝；左侧直径2.5mm，对光反射灵敏。右眼球外展充分，但内收、上视和下视均不能；左眼球各方向运动充分。张口不偏。额纹对称，左侧鼻唇沟浅。软腭上抬可，悬雍垂不无偏，咽反射存在，伸舌左偏。颈项强直，向左侧强迫头位，Kernig征阳性，Lasague征阳性。左上肢肌力0级，下肢2级，肌张力低，腱反射减弱，Babinski征阳性；右上、下肢肌力5级，肌张力正常，腱反射正常，Babinski征阴性。左偏身痛觉减退。患者入院前12天因受凉而发热（体温最高达38.5℃）、咳嗽、头痛，按“上感”治疗，但效果不佳。入院前7天视物成双，但无意识障碍、头晕、呕吐等不适，日常生活尚能自理。入院前3天寒战、多语、幻觉。核中性粒细胞60%，淋巴细胞12%，单核细胞7%，未见中幼粒细胞、晚幼粒细胞、嗜酸粒细胞、嗜碱粒细胞及有核红细胞。骨髓穿刺细胞学检查：粒系增生活跃，红系增生减低，巨核细胞及血小板正常，考虑与感染有关。按“血小板减少原因待查、颅内病变性质待定”给予甘露醇（250ml静脉输注，6小时1次）脱水降颅压治疗，头孢唑肟钠（2g静脉输注，12小时1次）抗感染治疗，氢化可的松（200mg静脉输注）抗感染治疗和补充血小板（静脉输注1单位）治疗。为进一步诊治收入N‐ICU。患者发病以来饮食差，二便可，无抽搐发作。
#     ...    previousHistory=既往体健。发病前10天义务献血200ml。否认药物过敏、输血、重大手术及外伤史，否认毒物接触史。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=37.6    lowBldPress=64    highBldPress=107
#     ...    examInfo=    heartRate=68    age=    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    化脓性脑膜炎

# 6.神经科经典病历7L-2
#     [Documentation]    断言:"血小板减少症"
#     ${getRes}    智能诊断3.0    symptom=主因“发热12天，视物成双7天，意识模糊3天”于2007年1月25日收入神经内科重症监护病房。#####神经系统检查：嗜睡，呼之能睁眼，能回答简单问题，言语流利，能执行简单指令。双侧瞳孔不等大，右侧直径5mm，对光反射迟钝；左侧直径2.5mm，对光反射灵敏。右眼球外展充分，但内收、上视和下视均不能；左眼球各方向运动充分。张口不偏。额纹对称，左侧鼻唇沟浅。软腭上抬可，悬雍垂不无偏，咽反射存在，伸舌左偏。颈项强直，向左侧强迫头位，Kernig征阳性，Lasague征阳性。左上肢肌力0级，下肢2级，肌张力低，腱反射减弱，Babinski征阳性；右上、下肢肌力5级，肌张力正常，腱反射正常，Babinski征阴性。左偏身痛觉减退。患者入院前12天因受凉而发热（体温最高达38.5℃）、咳嗽、头痛，按“上感”治疗，但效果不佳。入院前7天视物成双，但无意识障碍、头晕、呕吐等不适，日常生活尚能自理。入院前3天寒战、多语、幻觉。核中性粒细胞60%，淋巴细胞12%，单核细胞7%，未见中幼粒细胞、晚幼粒细胞、嗜酸粒细胞、嗜碱粒细胞及有核红细胞。骨髓穿刺细胞学检查：粒系增生活跃，红系增生减低，巨核细胞及血小板正常，考虑与感染有关。按“血小板减少原因待查、颅内病变性质待定”给予甘露醇（250ml静脉输注，6小时1次）脱水降颅压治疗，头孢唑肟钠（2g静脉输注，12小时1次）抗感染治疗，氢化可的松（200mg静脉输注）抗感染治疗和补充血小板（静脉输注1单位）治疗。为进一步诊治收入N‐ICU。患者发病以来饮食差，二便可，无抽搐发作。现病史:入院3天前，晨8时出现全头爆裂样疼痛，持续存在，无恶心、呕吐，进食差，发热，烦躁，双上肢不自主抖动，尿潴留，对外界问题能正确回答。能自行走路，生活能自理，走路较前缓慢。当日下午1时（发病5小时后）不能言语，但对别人的问题能正确反应。当地医院行头CT 检查：未见明显异常。次日晨4时（发病20小时后），来我院急诊，查血常规：WBC：19.6× 109／L；NEUT：17.4× 109／L；NEUT%：89.2%。血生化全项示胆红素异常，CK：208U／L。晨6时（发病22小时后），患者能够说话，给予阿奇霉素等治疗，头痛较前减轻，头爆裂样疼痛呈阵发性，每次1分钟内缓解。为进一步诊治入院。
#     ...    previousHistory=既往体健。发病前10天义务献血200ml。否认药物过敏、输血、重大手术及外伤史，否认毒物接触史。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=37.6    lowBldPress=64    highBldPress=107
#     ...    examInfo=    heartRate=68    age=    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    血小板减少症


# 神经科经典病历8L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=发热，头痛，言语困难3天#####体温：38.0℃；脉搏：80次／分；呼吸：20次／分；血压：120／70mmHg。发育正常，营养中等。烦躁，双上肢抖动。神经系统查体：神志清楚，语言流利，高级智能正常，双目失明，余颅神经（－），四肢肌力Ⅴ－，肌张力正常。双侧腱反射对称低下（＋），左侧巴宾斯基征，Chaddock征（＋），颈有抵抗，下腭距前胸5 指，双侧凯尔尼格征（＋）。
#     ...    previousHistory=6年前，因车祸双眼失明，平时无头痛，否认输血史，平时无流清涕症状，无手术史，无药物和食物过敏史，无中毒史，免疫接种史随当地。11岁患甲型肝炎，否认其他传染病史，否认疫区和疫水接触史。
#     ...    personalHistory=生于内蒙古，16岁到山西大同市，并长期生活在大同市。22岁结婚，生有1 子，配偶和儿子均体健。20岁开始吸烟，20支／日，偶有饮酒。
#     ...    allergyHistory=青霉素，头孢曲松过敏。
#     ...    familyHistory=否认家族性遗传病史。
#     ...    weight=65    gender=1    bodyTempr=38    lowBldPress=70    highBldPress=120
#     ...    examInfo=    heartRate=80    age=    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="CSF 检查：压力135mmH2O，淡黄色；CSF 常规：细胞总数8120 ×106／L，白细胞4850 ×106／L；CSF 生化：蛋白 483mg／dl，糖10mg／dl，氯112mmol／L；G 染色、墨汁染色、抗酸染色均阴性。血常规检查：WBC：19.6×109／L；NEUT：17.4×109／L；NEUT%：89.2%。"
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    化脓性脑膜炎


# 神经科经典病历9L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因剧烈头痛伴频吐2天为主诉人院。#####T 36℃，P110次／分，R 20次／分，Bp13／9kPa（98／68mmHg）。发育营养佳，神清，痛苦面容，烦躁不安，查体合作。内科系统检查未见异常。神经系统颅神经及周围神经亦未见异常。脑膜刺激征颈强明显，布氏征阳性，病理反射未引出。现病史:2天前被母用毛巾抽打到头部，半小时后患儿突然出现剧烈头痛，似炸裂样痛，以前额及后头部为重。随即出现喷射状呕吐20 余次，吐后自觉疼痛稍有减轻可忍受，但仍持续疼痛不止。病后无发热、无抽搐、无肢瘫、无意识障碍等。近一年来，有间歇性头痛，可片刻缓解。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=36    lowBldPress=68    highBldPress=98
#     ...    examInfo=    heartRate=120    age=10    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=WBC13.3×10 9／L，RBC 4﹒35 ×10 12／L，Hb122g／L。EEG 右枕、中央顶慢波灶，中度异常。TCD 左侧大脑中A、前A 轻度痉挛，右侧大脑后A 供血不足。脑脊液为均匀一致血性，离心后上清液黄染，压力偏高，除细胞数94 ×10 6／L，蛋白1.178／L 改变外；其余均正常。头部CT 检查左顶叶脑出血破入脑室。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    脑出血


# 神经科经典病历10L-1
#     [Documentation]    断言:"脑出血"
#     ${getRes}    智能诊断3.0    symptom=左侧肢体无力15小时#####神经系统：嗜睡，精神较差，声音较低微。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球活动自如，双侧额纹对称，左侧鼻唇沟变浅，示齿时口角右偏，伸舌左偏。左侧肢体肌力Ⅲ级，右侧肢体肌力Ⅴ级，四肢肌张力正常，双侧腱反射（＋＋），左侧巴氏征（＋）。左侧肢体痛觉减退，共济检查欠合作。右侧肢体感觉共济检查未见明显异常。颈软。现病史:
#     ...    previousHistory=既往体健，未监测血压、血糖，否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=75    gender=1    bodyTempr=36.4    lowBldPress=120    highBldPress=190
#     ...    examInfo=    heartRate=64    age=48    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="血常规：WBC 8﹒21×109／L，NEUT%70﹒8%，RBC 4﹒5×1012／L，HGB 150﹒0（g／L），PLT 178×109／L。凝血常规：PT 14﹒20秒，PA 86﹒00，INR 1﹒08，APTT 31﹒80秒，APTT‐R 1﹒11，Fib 2﹒27g／L，TT 14﹒30秒，TT‐R 1﹒02。血生化：ALT 15﹒00U／L，AST 23﹒00U／L，BUN 5﹒80mmol／L，CREA 86﹒0μmol／L，Na＋137﹒8mmol／L，K＋4﹒19mmol／L，CHOL 4﹒38，TG 0﹒79mmol／L，HDL 1﹒91mmol／L↓，LDL 2﹒54mmol／L，Glu 5﹒00mmol／L。"
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑出血

# 神经科经典病历10L-2
#     [Documentation]    断言:"高血压"
#     ${getRes}    智能诊断3.0    symptom=左侧肢体无力15小时#####神经系统：嗜睡，精神较差，声音较低微。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球活动自如，双侧额纹对称，左侧鼻唇沟变浅，示齿时口角右偏，伸舌左偏。左侧肢体肌力Ⅲ级，右侧肢体肌力Ⅴ级，四肢肌张力正常，双侧腱反射（＋＋），左侧巴氏征（＋）。左侧肢体痛觉减退，共济检查欠合作。右侧肢体感觉共济检查未见明显异常。颈软。现病史:
#     ...    previousHistory=既往体健，未监测血压、血糖，否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=75    gender=1    bodyTempr=36.4    lowBldPress=120    highBldPress=190
#     ...    examInfo=    heartRate=64    age=48    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="血常规：WBC 8﹒21×109／L，NEUT%70﹒8%，RBC 4﹒5×1012／L，HGB 150﹒0（g／L），PLT 178×109／L。凝血常规：PT 14﹒20秒，PA 86﹒00，INR 1﹒08，APTT 31﹒80秒，APTT‐R 1﹒11，Fib 2﹒27g／L，TT 14﹒30秒，TT‐R 1﹒02。血生化：ALT 15﹒00U／L，AST 23﹒00U／L，BUN 5﹒80mmol／L，CREA 86﹒0μmol／L，Na＋137﹒8mmol／L，K＋4﹒19mmol／L，CHOL 4﹒38，TG 0﹒79mmol／L，HDL 1﹒91mmol／L↓，LDL 2﹒54mmol／L，Glu 5﹒00mmol／L。"
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    高血压

# 神经科经典病历11L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因左侧肢体麻木，无力4个月，头痛伴喷射样呕吐2个月入院。#####入院检查：神清，双眼视乳头水肿，左半身痛觉减退，左上、下肢肌张力增高，肌力4 级。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=44    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=腰穿脑脊液压力2.75kPa，细胞数9 ×10 6／L，蛋白定量0.6g／L。脑电图示右额顶区局灶性慢波，头颅平片无异常。头颅CT 显示右颞顶大片不规则低密度阴影，范围为2.8cm×3.6cm，病灶外缘达皮质。脑皮质密度稍高，右侧脑室轻度受压与移位。增强后低密度区未见强化，脑皮质呈现回状轻度强化（CT 值由平扫时39 H 增至59 H）。CT 诊断：右顶叶胶质瘤。行右前开颅肿块切除术，病变组织活检证实为脑型血吸虫病。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑型血吸虫病


# 神经科经典病历12L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=#####神清，双侧瞳孔直径3mm，对称等大，对光反射灵敏，口齿含糊不清，对答切题，颈软，右侧肢体肌力Ⅳ级，右侧浅感觉减退，肌张力正常，左侧肌力肌张力正常，感觉正常，左巴氏征（+）。现病史:发作性口齿不清伴右侧肢体无力20余天，20天前起出现口齿不清，伴右侧肢体无力，持续约半小时左右缓解，无肢体麻木，无意识障碍，无头痛，无恶心、呕吐。
#     ...    previousHistory=既往史：高血压病史13年，最高达160/100mm　Hg。否认心脏病、糖尿病史，不饮酒，吸烟史7年（每天5支）。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=66    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=实验室检查：血糖5.42mmol/L，总胆固醇5.01mmol/L，高密度脂蛋白1.45mmol/L，低密度脂蛋白3.72mmol/L。辅助检查：头颅CT检查示左侧额、顶区低密度灶；头颅MRI检查示左侧额、顶叶T1W低信号，T2W高信号。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
# #     Should Contain    ${aj}    脑梗死


# 神经科经典病历13L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=#####血压105/75mm　Hg，心肺查体未见异常。现病史:入院3天前，患者在工作疲劳后出现右颞部持续胀痛，当时未予诊治。入院1天前夜间起床上厕所时自觉左侧肢体活动不利，不能站立，伴恶心、呕吐及头痛。无意识障碍，无头昏，无肢体抽搐。
#     ...    previousHistory=既往史：10年前发现心脏病，心电图检查示早博。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=51    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑梗死

# 神经科经典病历14L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=#####神清，口齿含糊不清，对答切题，颈软，左侧肢体肌力正常，左侧浅感觉正常，肌张力正常，左侧巴氏征（−）。现病史:左侧同向性偏盲2小时，视动性眼震颤，双侧瞳孔对光反射正常，双侧眼球运动正常；无意识障碍，无头昏，无肢体抽搐。高血压病史10年，血压145/100mm　Hg，血糖18.24mmol/L。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=68    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=辅助检查：头颅CT检查示右侧枕区低密度灶；头颅MRI检查示右侧枕区T1WI低信号，T2WI高信号；
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑梗死

# 神经科经典病历15L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=#####神志清，反应迟钝，口齿模糊，对答切题，右侧鼻唇沟浅，伸舌偏右，咽壁反射减退，洼田饮水试验2级（可疑），右侧肢体肌张力减退，左侧肢体肌张力正常，右侧肢体肌力0级，四肢腱反射（++），双侧Hoffmann征（−），双侧巴氏征（−）。现病史:因右侧肢体无力伴口齿不清1天，加重5小时入院。
#     ...    previousHistory=既往有高血压病史
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=80    highBldPress=140
#     ...    examInfo=    heartRate=    age=77    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="辅助检查：头颅　MRI检查示左侧基底节区新鲜梗死灶。头颅MRA检查示左侧大脑中动脉M1段明显狭窄、闭塞，周围见少量侧支血管；左侧后交通动脉局部狭窄。左侧椎动脉上段多发狭窄。影像学诊断：左侧基底节脑梗死（图1-137）。美国国立卫生院神经功能缺损评分（NIHSS）12分。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑梗死

# 神经科经典病历16L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=1994年5月以四肢运动障碍5个月为主诉来诊#####状态尚好，神志清，搀扶入病房，呼吸平稳，颈短，后发际低。无面瘫，双眼球运动灵活，双瞳孔等大正圆，有水平眼震，伸舌居中，张口下颌不偏，转头受限。四肢肌张力增强，肌力I V 级，无肌萎缩。走路不稳，两足距离宽，昂白征（闭目直立征）阳性，Mann 征（足尖对另一足跟站立）阳性，指鼻不准，跟膝胫试验阳性。腱反射亢进，巴彬斯基征双侧均阳性，霍夫曼征左可疑，右阳性。脑膜刺激征阴性。现病史:无明显诱因患儿于5个月前出现双下肢无力，继之双上肢无力，双手无力，吃饭拿筷子及穿衣困难，不能系纽扣及提裤子。近3个月出现走路不稳如喝醉酒样；走路跌跤，站立不稳。近1个月来除上述症状加重外出现吐字不清；饮水呛咳、眼球震颤。病来无颈痛及肢体麻木，无尿便及痛温觉障碍，无头痛、呕吐，无热。
#     ...    previousHistory=既往无脑疾患史，生时无窒息，生长发育良好，智力正常。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=11    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=颅侧位片：颅底测量见环椎和枢椎齿突向枕骨大孔内突出，齿突上端位于腭‐枕线以上10mm。齿突向后仰。头部MRI：各序列扫描双侧大脑半球、小脑及桥脑未见异常，脑室、脑池正常，中线结构不偏。枕骨斜坡畸形变大，枢椎齿突向后移位，位置高压迫颈髓，使颈部脊髓成角畸形。MRI结合X 线片诊断颅底凹陷症，枢椎齿突后移压迫颈髓成角畸形。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    颅底凹陷症


# 神经科经典病历17L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=头晕、四肢麻木2年，行走不稳5天#####短颈，后发际低。现病史:主因“头晕、四肢麻木2年，行走不稳5天”入院，摔倒当时有短暂昏迷，苏醒后自觉四肢麻木症状加重。伴有头晕，声音嘶哑、吞咽困难、构音障碍和舌肌萎缩。查体：眼球震颤。颈部及上肢疼痛。有躯干束带感，行走乏力，大、小便障碍，气短，说话无力。
#     ...    previousHistory=有外伤史；无高血压、糖尿病、梅尼埃综合征病史
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=53    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=X线片显示寰枕融合，颅底畸形。头颅MRI：颈椎无不稳，椎间孔无狭窄。肺功能检查：肺功能轻度下降
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    颅底凹陷症


# 神经科经典病历18L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=产后2天，头痛、恶心、呕吐及间断性抽搐#####体检：神志清楚，舌咬伤，肌张力正常，未引出病理反射，血压150/95mmHg。
#     ...    previousHistory=有外伤史；无高血压、糖尿病、梅尼埃综合征病史
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=95    highBldPress=150
#     ...    examInfo=    heartRate=    age=22    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=CT平扫：双侧额顶叶皮质下及半卵圆中心（图44a）、两侧颞枕叶（未列出）多发斑片状低密度影。T1WI病变呈低信号（图44b）。T2WI及FLAIR图像显示上述病变呈斑片状高信号，对称性分布，皮质也见受累，局部脑回肿胀
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    高血压性脑病

# 神经科经典病历19L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=#####神清、面色苍白、肺无音，心无杂音，节律正，神经系统无异常体征。现病史:自3岁半起经常头痛，为一侧或双侧太阳穴痛，每次持续1～3小时，无视觉先兆，间隔时间不定。每2个月左右或3～4个月发作一次，间歇期正常。近半年头痛比以前加重，每月1～2次，表现为先双眼前闪光、暗点、视物模糊，而后部分视野缺失，20分钟后头晕以后偏头痛，常为右侧有搏动感，伴恶心、呕吐、畏光、厌烦声音和气味，让家长闭灯、遮窗帘、用被或衣服蒙头，持续2小时左右入睡。醒后头痛已减轻，感到头痛，发胀，2日后消失。10日前第2次来诊正值头痛发作，家人搀扶入诊室，用手捂着左侧太阳穴，不时呻吟。本次发作已1小时，先是视觉先兆，眼前闪光出现“马赛克” 状的图形，而后左眼眶痛，很快波及额颞部，恶心，腹痛就诊中吐过2次胃内容。自3岁半起做头CT3次，头MRI 4次，均未见异常。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=父母均有偏头痛史。
#     ...    weight=    gender=1    bodyTempr=    lowBldPress=95    highBldPress=150
#     ...    examInfo=    heartRate=    age=22    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=数字减影脑血管造影（DSA）无脑血管畸形。经颅多普勒（TCD）大脑前A、中A 供血不足。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    偏头痛

# 神经科经典病历20L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=反复右侧头部发作性疼痛10年，再发2天。#####神经系统检查：神清语利，双眼裂等大，眼球各方向活动充分，无眼球震颤，双瞳孔等大、正圆，直径3.0mm，直接间接对光反射灵敏，余脑神经检查无阳性体征；四肢肌力、肌张力、腱反射对称正常，未引出病理反射，共济运动协调，双侧深浅感觉对称正常；颈软，无抵抗，Kernig 征（-），Brudzinski征（-）。眼科检查：视力正常、眼压正常、眼底检查未见异常。现病史: 患者于10年前无明显诱因开始出现右侧头部发作性疼痛。每次头痛发作前有视物模糊、星形闪光，持续10分钟左右，随后出现右侧眶后、额颞部搏动性疼痛，伴有恶心、呕吐、冷汗、面色苍白，对光和声音特别敏感，持续6～12小时。头痛发作时喜欢躲在黑暗的房间睡眠或服止痛药缓解头痛。月经、疲劳及情绪激动可诱发，病程中无发热、头晕，头痛与体位改变关系不大，每年发作5～10次不等，每次发病症状大致相同，无进行性加重趋势，不发作时如常。
#     ...    previousHistory=以往身体健康，否认头颈部外伤史、脑炎、脑膜炎及癫痫病史；否认眼耳鼻喉齿科疾病、高血压以及糖尿病等病史；无化学毒物接触及长期滥用药物史，月经正常。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=家族中无类似病史；家族中无慢性遗传性疾病。
#     ...    weight=    gender=0    bodyTempr=36.7    lowBldPress=70    highBldPress=115
#     ...    examInfo=    heartRate=86    age=30    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="1.头颅及颈椎CT、头颅MRI未见异常；脑电图正常；经颅超声多普勒提示椎基底动脉血流速度加快。2. 腰椎穿刺术 脑脊液检查压力、常规、生化均正常。"
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    先兆偏头痛


# 神经科经典病历21L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因“左侧头痛、恶心、呕吐7天，视物成双5天”就诊。#####神志清楚，对答切题，头颅五官无畸形，左眼睑下垂，左侧瞳孔直径3.5mm，对光反射减弱，右侧瞳孔直径2.5mm，对光反射灵敏，左侧眼球运动内收、上下视受限，外展正常，无眼球震颤，右侧眼球活动正常。现病史:患者7天前无诱因出现左侧搏动性头痛，以左颞、额部及眼眶为主，伴恶心、呕吐，呕吐为胃内容物，无先兆症状及发热、鼻塞、流涕、流泪、畏光等症状，自服止痛片无好转。2天后感眼花、视物成双、自觉左眼睑上抬无力。病程中无肢体乏力、步态不稳，不伴头晕、耳鸣、听力下降、吞咽困难、饮水呛咳、言语含糊及胸闷、气促等症状。患者诉近4年来有类似发作3次，每次持续约20余天自行恢复，不遗留任何症状。无毒物接触史，无烟酒嗜好，家族中无偏头痛患者及慢性遗传性疾病病史。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=36.7    lowBldPress=65    highBldPress=105
#     ...    examInfo=    heartRate=    age=35    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=头颅MRI平扫+增强扫描显示两侧海绵窦不对称，左侧海绵窦扩大，局部可见块影病变，T1相呈等信号，T2相呈稍低信号；增强扫描显示左侧海绵窦区肿块病灶明显强化；头颅MRA提示：左侧颈内动脉海绵窦段狭窄、粗糙。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    偏头痛


# 神经科经典病历22L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=“反复头痛3年”#####心脏各瓣膜区未闻及病理性杂音。神经系统检查：神清，言语清晰，眼球各方向活动自如，瞳孔等大正圆，脑神经未见异常，四肢肌力5 级，肌张力适中。双侧膝反射、踝反射对称存在，双侧Babinski 征阴性，颈软。现病史:患者3年前出现头痛，为双枕部非搏动性、持续性钝痛，如带子紧束头部或呈头周紧箍感、压迫感或沉重感，偶有恶心，不伴呕吐、畏光或畏声、视力障碍等，几乎每日均有不适，曾行头部CT 检查未发现异常。头痛重时服用对乙酰氨基酚，头痛略减轻。体位改变不加重，自觉生气、紧张等情绪变化时明显，注意力转移可减轻。曾就诊于北京某大医院，诊断枕大神经痛，采用风池穴局部封闭，症状稍有减轻。头痛频繁发作，但日常生活不受影响。10天前自觉工作压力大症状加重，行头部MRI 检查未见异常，EEG 正常。为明确诊治，以“头痛待查”入院。病来有头晕、心烦、失眠、焦虑等症状，同时颈肩背部肌肉有僵硬感，捏压时肌肉感觉舒适。无发热、体重减轻、复视或耳鸣，无抽搐发作，无意识障碍，尿便正常。
#     ...    previousHistory=个性敏感，无高血压、糖尿病史，家族中无类似疾病史。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=    bodyTempr=36.3    lowBldPress=72    highBldPress=114
#     ...    examInfo=    heartRate=64    age=29    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=头颅MRI、CT 检查和EEG 检查未见异常
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    紧张性头痛

# 神经科经典病历23L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=发热、头痛、恶心、呕吐5天，烦躁不安、胡言乱语1天。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志模糊，谵妄状态，问话部分可回答，语言流利，查体不合作。双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，视乳头边界欠清晰，色淡红，A∶V＝2∶3。额纹对称，口角无偏斜，伸舌居中，咽反射存在。四肢可自主活动，双侧肱二头肌腱反射（＋＋），双膝腱反射（＋＋），四肢肌张力可，双侧病理征。颈抵抗，颏下2横指。感觉检查不配合。现病史:5天前出现发热，体温最高38.1℃，以午后为重，夜间有盗汗，伴有头痛，以双侧顶部为重，呈胀痛，难以忍受，伴恶心及喷射性呕吐，呕吐物为胃内容物，无咳嗽、咳痰，就诊于当地医院。给予抗病毒、抗感染、脱水降低颅内压等药物治疗，头痛稍缓解，但仍发热。1天前患者出现烦躁不安，胡言乱语，不能与人交流，仍高热，体温达39.0℃，并行脑电图检查：广泛中度异常，为求进一步诊治转入综合医院神经内科病房。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=65    gender=    bodyTempr=38.9    lowBldPress=89    highBldPress=139
#     ...    examInfo=    heartRate=99    age=36    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="血常规：白细胞计数（WBC）14.5×109／L，中性粒细胞分类（NEUT%）88%↑，红细胞计数（RBC）4.1×1012／L，血小板计数（PLT）240×109／L。血生化：血钠离子：131mmol／L↓，钾离子：4.2mmol／L，葡萄糖：6.2mmol／L↑，余无异常。腰椎穿刺术检查：脑脊液压力300mmH2O，外观无色透明；脑脊液常规：总细胞数300×106／L，白细胞数220×106／L，单核80%，多核20%；脑脊液生化：蛋白：1.6g／L，葡萄糖：2.6mmol／L，氯化物：116mmol／L。脑电图：广泛中度异常。"
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    结核性脑膜炎

# 神经科经典病历24L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因发热10天，头昏7天而入院。#####现病史:入院后有发热38℃，间有头昏、头痛及呕吐，颈有抵抗力，脑膜刺激征、病理反射阴性。入院后10天出现左侧面瘫，左侧上下肢瘫痪，膝、踝反射活跃，Babinski征、Chaddock征阳性。提示右侧大脑中动脉炎。脑CT有多发散在性高密度阴影及梗阻性脑积水。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=6    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=腰穿：脑脊液清亮，白细胞162×106／L，中性0.95，淋巴0.05，Pandy试验（＋），蛋白质326mg／L，糖2.4mmol／L，氯化物105mmol／L，细菌培养（─），新隐球菌阴性，抗PPD‐IgM2次（─），血抗PPD‐IgM（＋），血沉15mm／h。肺部X线摄片正常。血清CMV‐IgM阳性。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    结核性脑膜炎

# 神经科经典病历25L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因“双下肢皮疹5小时”入院。#####T 37.8℃，神志清醒，精神稍倦怠，双下肢可见3～10mm大小的出血性皮疹，双侧大致对称。前囟已闭合，口唇红润，咽部充血，双侧扁桃体无肿大，心肺听诊无异常，腹软，无压痛，肝脾未触及，神经系统无明显阳性体征。现病史:5小时前家属为患儿洗澡时发现其双下肢出现皮疹，精神稍差，无咳嗽及呕吐等，送急诊，查体温37.4℃，血常规示：WBC 9.9×109/L，血小板 75×1012/L，以“原发性血小板减少性紫癜？”收治。予静脉滴注地塞米松和静脉丙种球蛋白等治疗。2小时后巡房时发现患儿病情急剧变化，出现高热寒战，四肢冰凉，脉搏微弱，烦躁不安，皮疹较前范围扩大至全身，且局部融合成片。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=37.8    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=2    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=白细胞：16.7×109/L，血小板：52×1012/L；脑脊液常规、生化检查及脑脊液涂片检查均正常；血浆纤维蛋白原明显降低，3P试验阳性；颅脑CT未见异常；皮疹淤点处挑破压片找到革兰阴性双球菌疑似脑膜炎奈瑟菌
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    流行性脑膜炎


# 神经科经典病历26L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因“发作性右眼闪光感3次，进行性言语欠清3个月”于2011年5月23日收入院。#####查体：神志清楚，言语欠流利，近记忆力差，计算力差。双眼裂等大，左瞳孔中等偏小，对光反应弱，调节反射好，为阿-罗瞳孔（Argyll Robertson pupil），双眼外展露白2mm，余各方向运动充分，鼻唇沟对称，伸舌略偏左，软腭活动好。四肢肌力5级，双上肢肌张力稍高，腱反射偏低对称，双侧病理征阴性。双手指鼻欠准，跟膝胫稳准，Romberg征（−），深浅感觉无异常。颈部无抵抗，脑膜刺激征（−）。现病史:患者于2011年2月2日无明显诱因发作4次右眼外侧视野闪光感，闪光呈红、黄、蓝三色，持续1分钟左右自行缓解。2月12日出现言语欠流利，就诊于北京某医院，行头颅MRI检查显示左侧顶叶皮质下缺血灶，左侧脑干长T1长T2信号，考虑为缺血性脑血管病，并给予阿司匹林口服治疗。闪光感未再发作，而言语不清进行性加重，并出现计算力、记忆力减退，书写缓慢等症状，为进一步诊治收入北京医院神经内科。
#     ...    previousHistory=患者承认10余年前有冶游史。高血压病史10余年。无乙肝、结核病史。无输血及外伤、手术史。无药物过敏史。
#     ...    personalHistory=吸烟史20余年，每日30支。饮酒史20余年，平均每日1两。
#     ...    allergyHistory=
#     ...    familyHistory=否认家族遗传病史。
#     ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=42    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck="动态脑电图：左侧后部导联散在中-高波幅尖波、尖慢波及慢活动。血常规：WBC 13.39×109/L，PLT 325×109/L，中性粒细胞78.4%，淋巴细胞14.7%。血梅毒抗体测定（TPAB）阳性。腰穿：脑脊液（CSF）压力50mmH2O，无色，Pandy试验（++），WBC 18/mm3，RBC 2/mm3，单核70%，多核30%。蛋白1482mg/L（150～450mg/L），糖正常，氯化物111.6mmol/L（120～130mmol/L）。脑电图示双侧额颞部多发的单个棘波、棘慢波、尖波。头颅MRI平扫示双侧海马、岛叶、丘脑、内囊后肢和下丘脑T2、T2FLAIR高信号，增强T1WI呈轻度强化。颞叶病灶MRS呈代谢活跃改变。脑脊液梅毒快速血清反应素试验（RPR）阳性（1∶64），梅毒螺旋体凝集试验（TPHA）和性病研究实验室试验（VDRL）均为阳性。"
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    神经梅毒


# 神经科经典病历27L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=患者因反应迟钝4年，记忆减退2年，近来加重来我院就诊#####神志清楚，轻度构音障碍，时间、人物和地点定向力明显减退，查体不能完全合作。眼球运动尚充分，未见眼球震颤。额纹和鼻唇沟两侧对称，颜面部肌肉无不自主运动，舌不能完全伸出口腔前庭，未见舌肌萎缩和纤颤。张口不充分，咽反射迟钝。四肢及躯干针刺觉存在，两侧对称。四肢罕见主动运动，肌力Ⅳ级，肌张力普遍增高，指鼻试验和踵膝试验不能完成。四肢腱反射低，无病理反射。颈软，Kernig征阴性。现病史:家属反映患者近两个月来注意力不集中，精神恍惚，工作时常常出错、与人交流明显减少。近一周来缄默不语，不能独立行走和主动进食。追问病史发现患者4年前即有反应迟钝，貌似装傻充愣，当时家人以为患者工作劳累所致，未予充分重视。此后发现患者好忘事，丢三落四。近来逐渐不认得家人，不能辨认周围环境。患者发病以来无发热、头痛、恶心、呕吐等症状，无抽搐发作，无二便失禁。入院后1周出现幻觉，尿失禁，入院20天出现肌阵挛。脑活检术后一直昏迷，间断发作抽搐。抗癫痫药物治疗及对症支持治疗无效。入院46天死亡。
#     ...    previousHistory=患者既往体健，家属否认患者有结核病、肝炎等传染病病史。无药物、食物过敏史。无外伤、手术史。预防接种史不详。否认疫区居住史。
#     ...    personalHistory=患者出生并生长在北京，在工厂从事机加工工作。
#     ...    allergyHistory=
#     ...    familyHistory=其母58岁时出现不自主运动、智能减退及抽搐样动作，曾在外院诊断“小脑萎缩”，半年后死亡。患者外祖父58岁时“又瘫又傻”，卧床不起，半年后死亡。
#     ...    weight=    gender=0    bodyTempr=36    lowBldPress=80    highBldPress=110
#     ...    examInfo=    heartRate=72    age=47    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=腰穿脑脊液初压90mmH2O，脑脊液标本红细胞和白细胞计数均为0，蛋白20mg/dl，糖79mg/ dl，氯化物99mg/dl。脑电图检查呈重度不正常，可见阵发性三相波出现。病理学检查：脑活检见皮质内弥漫性神经元变性，数目减少，变性坏死，部分呈缺血性改变，皮质基质可见空泡形成，呈明显海绵样改变，部分融合成较大空泡。血管周围间隙增宽，呈水肿表现。轻度星形胶质细胞增生，未见炎性细胞浸润。电镜检测结果可见神经元及神经胶质细胞明显变性，膜系统溶解破坏，细胞器溶解、减少，核染色质呈块状凝集，可见细胞碎片。有髓神经纤维解离并有部分溶解，轴索溶解消失或呈空泡样变。特殊检查：活检脑组织抽提DNA后经蛋白印迹法检测结果提示可能有PRNP基因插入突变。长片段序列分析发现有168bp插入，为7个八肽重复序列的插入突变
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    克罗伊茨费尔特-雅各布病

# 神经科经典病历28L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=发热、头痛10天，意识障碍、小便失禁1天入院。#####体温38℃，心前区有收缩期及舒张期杂音，余一般内科检查未见异常。精神症状明显，有时问话可答，有时不答，检查不合作、违拗，颅神经检查未见明显异常，四肢均可动，无明显偏瘫，双下肢张力稍高，反射活跃，双上肢反射偏弱，双侧掌颌反射阳性，双侧巴氏征阳性，脑膜刺激征阴性。现病史:10天前感冒、发热、头痛，体温多在38℃上下，有时达40℃，1天前出现精神恍惚，小便失禁。平时身健。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=38    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=23    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=胸片示双侧肺纹理增重。心脏彩超示主动脉瓣及二尖瓣关闭不全。脑电图轻度弥散异常。周围血白细胞11×10 9/L，中性粒细胞偏高，腰穿压力180mmH2O（脱水后），内容正常（白细胞数2个）。头颅CT，示双侧大脑多发斑片状及片状低密度影，以皮层为主，右颞枕部有一三角形低密度影，无占位效应；E～H为CT增强扫描，示软脑膜强化，病灶本身强化不明显，另见脑回水肿
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    病毒性脑炎


# 神经科经典病历29L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=#####呼吸18次/分。发育正常，营养一般，体型偏瘦。双侧呼吸动度一致，双肺呼吸音粗。右侧面颊部痛觉较左侧减退，双侧角膜反应存在。左侧额纹较右侧稍浅，闭目有力，左侧鼻纹稍浅，示齿鼓腮有力。颈有抵抗，颏胸距两横指，Kernig征阴性。现病史:患者住院前2日无明显诱因出现头痛，双颞侧为主，呈持续性胀痛，不能缓解，就诊于附近医院并行头颅CT扫描检查，结果未见异常。服用“泰诺林”后病情并未缓解。患者于住院前1日出现发热，体温为37.6℃，并且出现恶心，曾呕吐一次。转诊于我院急诊，腰穿脑脊液初压为130mmH2O，脑脊液标本白细胞计数60×106/L，蛋白64.2mg/dl，脑脊液涂片抗酸染色及墨汁染色均呈阴性。患者住院前8日在深圳出差时出现腹泻，持续2日，未发现脓血便，自行服用“黄连素”后缓解。患者住院头几日仍有间断腹泻，为少量水样便，自觉左上腹隐痛，无恶心和呕吐。
#     ...    previousHistory=患者有左侧面瘫史20余年。否认高血压、糖尿病、冠心病等病史。否认肝炎、结核病等传染病病史。否认食物及药物过敏史。无手术及输血史。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=无家族性遗传病病史。
#     ...    weight=    gender=0    bodyTempr=37.2    lowBldPress=75    highBldPress=120
#     ...    examInfo=    heartRate=63    age=35    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=患者住院前2日无明显诱因出现头痛，双颞侧为主，呈持续性胀痛，不能缓解，就诊于附近医院并行头颅CT扫描检查，结果未见异常。服用“泰诺林”后病情并未缓解。患者于住院前1日出现发热，体温为37.6℃，并且出现恶心，曾呕吐一次。转诊于我院急诊，腰穿脑脊液初压为130mmH2O，脑脊液标本白细胞计数60×106/L，蛋白64.2mg/dl，脑脊液涂片抗酸染色及墨汁染色均呈阴性。患者住院前8日在深圳出差时出现腹泻，持续2日，未发现脓血便，自行服用“黄连素”后缓解。患者住院头几日仍有间断腹泻，为少量水样便，自觉左上腹隐痛，无恶心和呕吐。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    病毒性脑膜炎


# 神经科经典病历30L-1
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=因发热，剧烈头痛和呕吐半月余住院。#####体温38℃，脉搏76次/分，血压120/80mmHg。神志清楚，双眼外展欠充分，眼底可见视神经乳头水肿，颈抵抗，骈四指，Kernig征阳性。现病史:无明显诱因可寻。体温38℃左右，在当地曾用青霉素、链霉素短期治疗无效。住院前1日出现谵语，抽搐。在某医院腰穿，脑脊液压力325mmH2 O，白细胞计数305×106/L，Pandy试验阳性，脑脊液标本涂片找到隐球菌，以隐球菌性脑膜炎转入我院。给予两性霉素B，大蒜液和肾上腺皮质激素等治疗，不显效。视力逐渐下降，至近乎失明。出现双侧病理反射。经脑室穿刺引流，病情一度稳定。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=38    lowBldPress=80    highBldPress=120
#     ...    examInfo=    heartRate=76    age=21    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=脑室Conray造影显示“两侧脑室，第三脑室，导水管和第四脑室轻度扩大，未见梗阻。左侧脑室前角有一囊性影向前突出，大小约为2.0cm×2.0cm，内有造影液，显示较淡，不甚规则。大脑导水管和第四脑室未见移位。”血红蛋白9.4g/dl，外周血白细胞计数6.8×109/L，血沉25mm/第一小时末。尿常规检查有白细胞（0.02～0.03）×109/L，蛋白（±）。病理解剖：脑重1350g，脑膜表面淤血、稍混浊，略呈毛玻璃样。双侧大脑半球对称，脑回增宽，脑沟变浅。主要病变位于颅底脑膜处，从视交叉至脑桥周围及大脑外侧裂深处有大量淡黄绿色胶冻样渗出物，颅底动脉环与基底动脉，视交叉及乳头体均埋于渗出物中，结构难以辨认。双侧小脑扁桃体疝，未见钩回疝。冠状切面示侧脑室轻度扩大，透明中隔向右移位左侧脑室最宽处2.2cm，右侧脑室最宽处1.0cm。第三脑室最宽处0.8cm。中脑处大脑导水管管腔高度狭窄，呈受压状。第四脑室未见扩大。双侧侧脑室之脉络丛均增厚呈灰白、暗褐色。镜检：病变主要位于脑膜，以颅底明显，有大量渗出物，并呈干酪样坏死，于血管周围可见栅栏样排列的上皮细胞，并于多处见到朗格汉斯细胞，上述病变亦累及双侧侧脑室脉络丛和大脑半球浅部皮质。肺内找到结核结节，其他脏器有淤血和营养不良。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    结核性脑膜炎

# 神经科经典病历30L-2
#     [Documentation]    断言:"枕骨大孔疝"
#     ${getRes}    智能诊断3.0    symptom=因发热，剧烈头痛和呕吐半月余住院。#####体温38℃，脉搏76次/分，血压120/80mmHg。神志清楚，双眼外展欠充分，眼底可见视神经乳头水肿，颈抵抗，骈四指，Kernig征阳性。现病史:无明显诱因可寻。体温38℃左右，在当地曾用青霉素、链霉素短期治疗无效。住院前1日出现谵语，抽搐。在某医院腰穿，脑脊液压力325mmH2 O，白细胞计数305×106/L，Pandy试验阳性，脑脊液标本涂片找到隐球菌，以隐球菌性脑膜炎转入我院。给予两性霉素B，大蒜液和肾上腺皮质激素等治疗，不显效。视力逐渐下降，至近乎失明。出现双侧病理反射。经脑室穿刺引流，病情一度稳定。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=38    lowBldPress=80    highBldPress=120
#     ...    examInfo=    heartRate=76    age=21    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=脑室Conray造影显示“两侧脑室，第三脑室，导水管和第四脑室轻度扩大，未见梗阻。左侧脑室前角有一囊性影向前突出，大小约为2.0cm×2.0cm，内有造影液，显示较淡，不甚规则。大脑导水管和第四脑室未见移位。”血红蛋白9.4g/dl，外周血白细胞计数6.8×109/L，血沉25mm/第一小时末。尿常规检查有白细胞（0.02～0.03）×109/L，蛋白（±）。病理解剖：脑重1350g，脑膜表面淤血、稍混浊，略呈毛玻璃样。双侧大脑半球对称，脑回增宽，脑沟变浅。主要病变位于颅底脑膜处，从视交叉至脑桥周围及大脑外侧裂深处有大量淡黄绿色胶冻样渗出物，颅底动脉环与基底动脉，视交叉及乳头体均埋于渗出物中，结构难以辨认。双侧小脑扁桃体疝，未见钩回疝。冠状切面示侧脑室轻度扩大，透明中隔向右移位左侧脑室最宽处2.2cm，右侧脑室最宽处1.0cm。第三脑室最宽处0.8cm。中脑处大脑导水管管腔高度狭窄，呈受压状。第四脑室未见扩大。双侧侧脑室之脉络丛均增厚呈灰白、暗褐色。镜检：病变主要位于脑膜，以颅底明显，有大量渗出物，并呈干酪样坏死，于血管周围可见栅栏样排列的上皮细胞，并于多处见到朗格汉斯细胞，上述病变亦累及双侧侧脑室脉络丛和大脑半球浅部皮质。肺内找到结核结节，其他脏器有淤血和营养不良。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    枕骨大孔疝

# 神经科经典病历31L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=50天前咽痛，咳嗽，1周后发热呕吐，精神异常。#####现病史:入院后舌及咽喉出现单纯疱疹，入院时体查示脑膜刺激征阳性；腰穿：压力280mmH2O脑脊液WBC 24/μl，蛋白质106mg/gl，潘氏试验阳性，Glu 2.6mmol/L，氯化物111mmol/L；脑脊液细胞学示淋巴细胞异型性。
#     ...    previousHistory=
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=50    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=核磁：T1WI：双侧额叶眶直回、右侧颞叶外侧及内侧皮质、左侧海马旁回等多处脑回肿胀，相应区域皮层及皮层下见片状低信号，边界不清。T2WI：病灶为稍高信号，占位效应不明显。增强扫描T1WI：病灶呈“脑回样”强化。脑脊液TORCH结果示单纯疱疹病毒（HSV）－ IgG（+）。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    疱疹病毒性脑炎

# 神经科经典病历32L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0    symptom=发热、头痛1周，抽搐伴意识不清2天。#####T 39.5℃，P 124次/分，R 22次/分，BP 150/80mmHg。呼吸促，发热面容，口唇无发绀，未见皮肤黏膜出血点，双肺呼吸音清，未闻及干湿啰音，心音钝，节律规整，腹软。嗜睡，刺激睁眼，双瞳孔等大，对光反射（-，-），面瘫（-，-），四肢肌张力正常，四肢无瘫痪，BCR（++，++），PSR（++，++），Babinski征（+，+），颈强（+）。现病史:病前受凉、感冒、有口唇疱疹及全身不适症状。1周前出现发热，体温达39.5℃，持续发热，伴有头痛，为全头胀痛，有呕吐，为喷射性，3天前开始出现反应迟钝，胡言乱语，不认识家人，2天前出现抽搐发作，表现为不明白，双眼上翻，尿失禁，约4～5分钟缓解，反复发作，3～4次逐渐至意识不清。
#     ...    previousHistory=病前受凉、感冒、有口唇疱疹及全身不适症状。1周前出现发热，体温达39.5℃，持续发热，伴有头痛，为全头胀痛，有呕吐，为喷射性，3天前开始出现反应迟钝，胡言乱语，不认识家人，2天前出现抽搐发作，表现为不明白，双眼上翻，尿失禁，约4～5分钟缓解，反复发作，3～4次逐渐至意识不清。
#     ...    personalHistory=
#     ...    allergyHistory=
#     ...    familyHistory=
#     ...    weight=    gender=1    bodyTempr=39.5    lowBldPress=80    highBldPress=150
#     ...    examInfo=    heartRate=123    age=23    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap=
#     ...    presentHistory=
#     ...    assistCheck=血常规：WBC 11.0×109/L。脑电图：全导联弥漫性高波幅慢波，提示重度异常改变。头颅MRI检查：可见双侧颞叶内侧、额叶及岛叶片状长T1长T2异常信号。FLAIR呈高信号。头颅CT检查：一侧或双侧颞叶、额叶低密度灶，若低密度灶中有点状高密度灶，提示有出血。脑脊液检查：压力：200mmH2O；细胞数：103×106/L，淋巴细胞比率：70%；蛋白：897g/ L；糖及氯化物正常。
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    疱疹病毒性脑炎



# 神经科经典病历33L-1
#     [Documentation]    断言:"结核性脑膜炎"
#     ${getRes}    智能诊断3.0
#     ...    age=60    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=    highBldPress=105    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=30年前诊断肺结核，否认其他慢性病和传染病史。
#     ...    symptom=间断发热、头痛2个月。#####血压：105／70mmHg，神志清楚，高级皮质功能正常，言语流利，双侧瞳孔等大等圆，直径3mm，对光反应灵敏，无面舌瘫，眼震（－），复视（－），余颅神经查体无异常。四肢肌力Ⅴ级，肌张力正常，双上肢腱反射（＋＋），双下肢膝腱反射跟腱反射消失。感觉（－），共济（－），双侧病理征（－），心肺查体无异常。现病史:患者于入院2个月前无明显诱因开始出现头痛，呈间断性钝痛，以前额部为主，时而伴呕吐，于当地按“感冒” 治疗，疗效欠佳。后头痛加重，为进一步诊断和治疗来我院。该患者在外院共行3次腰穿，脑脊液压力波动于150～200mmH2O，2次结核抗体阳性，1次PCR 阳性，2次隐球菌阳性。
#     ...    weight=
#     ...    assistCheck=
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    结核性脑膜炎

# 神经科经典病历33L-2
#     [Documentation]    断言:"隐球菌性脑膜炎"
#     ${getRes}    智能诊断3.0
#     ...    age=60    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=    highBldPress=105    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=30年前诊断肺结核，否认其他慢性病和传染病史。
#     ...    symptom=间断发热、头痛2个月。#####血压：105／70mmHg，神志清楚，高级皮质功能正常，言语流利，双侧瞳孔等大等圆，直径3mm，对光反应灵敏，无面舌瘫，眼震（－），复视（－），余颅神经查体无异常。四肢肌力Ⅴ级，肌张力正常，双上肢腱反射（＋＋），双下肢膝腱反射跟腱反射消失。感觉（－），共济（－），双侧病理征（－），心肺查体无异常。现病史:患者于入院2个月前无明显诱因开始出现头痛，呈间断性钝痛，以前额部为主，时而伴呕吐，于当地按“感冒” 治疗，疗效欠佳。后头痛加重，为进一步诊断和治疗来我院。该患者在外院共行3次腰穿，脑脊液压力波动于150～200mmH2O，2次结核抗体阳性，1次PCR 阳性，2次隐球菌阳性。
#     ...    weight=
#     ...    assistCheck=
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    隐球菌性脑膜炎

# 神经科经典病历34L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=16    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=家族史无特殊记载。
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=中学生，中午常在外就餐。月经史：12岁初潮，经期不规律，3～6个月1次，每次3天，量不多。
#     ...    previousHistory=
#     ...    symptom=以“乏力12天，黄染、右上腹不适10天”为主诉入院#####体温36.4℃，脉搏76次／分，呼吸18次／分，血压120／70mmHg。神清语明，周身皮肤及巩膜黄染，睑结膜苍白，口唇无发绀，浅表淋巴结未触及肿大。双肺呼吸音清，未闻及干湿啰音。心音纯，律齐，各瓣膜听诊区未闻及病理性杂音。全腹无压痛、反跳痛及肌紧张，肝未触及，脾肋下1cm，Murphy征阴性，肝区无叩痛，肠鸣音约4次／分。双下肢无水肿。现病史:患者12天前跑3000米后感乏力，10天前出现巩膜黄染，未重视，7天前出现皮肤黄染，无瘙痒，渐加重，伴食欲不振，无厌油腻，曾恶心，呕吐胃内容物2次，曾疑为“病毒性肝炎”，但两次肝炎病毒表面标志物均阴性，未能确诊。病来偶有阵发性右上腹不适，与饮食及排便无明显关系。无发热，无寒战，无尿频、尿急及尿痛，尿色略有加深，无腰疼，大便颜色正常，无陶土便。入院后给予补充清蛋白及凝血酶原复合物等对症支持治疗。患者未输血，1周后血红蛋白升至100g／L，之后突然出现发热、寒战，最高体温达到40.4℃，血压下降至90／60mmHg，伴有腰背痛，化验血红蛋白95g／L，次日升至101g／L。又接连2天发作后，血红蛋白降至80g／L，尿潜血3＋，血清总胆红素升至246.5μmol／L，直接胆红素129.5μmol／L。考虑有溶血性贫血。
#     ...    weight=
#     ...    assistCheck="血常规：白细胞3.3×109／L，中性粒细胞44.9%，血红蛋白66g／L，HCV：100fl，MCHC：34%，血小板73×109／L。肝功能：总蛋白68.1g／L，清蛋白27.1g／L，谷丙转氨酶17U／L，谷草转氨酶71U／L，碱性磷酸酶14U／L，总胆红素53.4μmol／L，直接胆红素35.3μmol／L。凝血功能：凝血酶原时间24.0秒，活化部分凝血活酶时间54.0秒。尿常规：蛋白＋＋，胆红素＋，尿胆原2＋，红细胞10～15／HP，白细胞40～50／HP。血清肿瘤标记物：AFP：21.93ng／ml（正常值0～13ng／ml），CA19-9：60.60U／ml（正常值0～37U／ml），CEA正常。腹部彩超：肝脏大小正常，肝实质回声普遍略粗糙；门脉直径0.9cm；胆囊明显增大，13.07cm×4.54cm，内可见少量淤积性胆汁，壁厚0.45cm；脾稍大，肋间厚4.28cm；结论：符合肝脏慢性弥漫性损伤；胆汁淤积。肝脏MRI检查：肝脏表面略不光滑，肝叶比例失调，左叶增大，弥漫网格样异常信号，T1WI稍高，T2WI低信号；胆囊体积增大，12.85cm×4.86cm；脾厚4.1cm。结论：符合肝硬化表现。化验血清铜蓝蛋白0.16g／L，血清铜33.1mg／L，24小时尿铜测定1002.5μg。眼科裂隙灯下角膜K-F环阳性。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    肝豆状核变性


# 神经科经典病历35L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=39    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=父母均体健，家族中无此类疾病发生。
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=既往体健。入院前7天开始发热，伴鼻塞、流涕、咽痛，就诊于社区医院，查血常规示：白细胞计数8.0×109／L，中性粒细胞百分比80%，拟诊“上呼吸道感染”，给予青霉素钠640万单位／日，静脉滴注，共治疗3天，症状好转。否认高血压、心脏病病史，否认结核等传染病病史，无手术、外伤及输血史，预防接种史不详。
#     ...    symptom="突然双下肢无力3天#####神志清楚，言语流利，双侧瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。双上肢肌力正常，肱二头肌腱反射（＋＋），双下肢肌力Ⅱ级，膝腱反射（＋），T10以下针刺觉减退，深感觉消失。双侧病理征（＋）。颈软，无抵抗。"现病史:患者，女，39岁，3天前无明显诱因突然出现双下肢无力，不能行走，需要人搀扶，伴有小便失禁，就诊于神经内科门诊，行腰椎穿刺术检查：脑脊液（CSF）压力140mmH2O；脑脊液（CSF）常规：外观无色透明，总细胞数295×106／L，白细胞数20×106／L；脑脊液生化：蛋白质0.46g／L，葡萄糖及氯化物正常。血常规示：白细胞计数（WBC）7.8×109／L，中性粒细胞百分比（NEUT%）72%。血电解质：钾离子4.2mmol／L。为求进一步诊治，入神经内科病房。
#     ...    weight=
#     ...    assistCheck="血常规：白细胞计数7.8×109／L，中性粒细胞百分比72% 血生化：钾离子4.2mmol／L心电图：窦性心律，正常心电图腰椎穿刺检查：CSF压力：140mmH2O。脑脊液常规：外观无色透明脑脊液，总细胞数295×106／L，白细胞20×106／L；脑脊液生化：蛋白0.46g／L，葡萄糖、氯化物正常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    急性脊髓炎


# 神经科经典病历36L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37.8
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=78    highBldPress=104    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=否认特殊病史及近期接种史。
#     ...    symptom=以“发热10天，双下肢麻木、无力1周”为主诉入院。#####T：37.8℃，P：78次／分，R：21次／分，BP：104／70mmHg，心脏各瓣膜区未闻及病理性杂音。神经系统检查：脑神经检查未见异常。右下肢肌力4 级弱，左下肢及双上肢肌力4 级，T2 以下痛觉感觉减退。双上肢腱反射（＋），双下肢腱反射（＋＋＋），双侧踝阵挛（＋），双侧病理征（＋），大、小便困难。现病史:患者10天前发热37.3℃，并咽痛，1周前双下肢麻木，逐渐向上蔓延至胸部，同时伴有双下肢无力（以右下肢为主），双上肢麻木无力，逐渐出现排尿、排便困难、盗汗。为明确诊治以“脊髓炎？”入院。病来无头痛、恶心、呕吐，饮食、睡眠略差。
#     ...    weight=
#     ...    assistCheck="MRI 示：颈3～7 脊髓增粗，髓内片状异常信号（T1略低信号、T2 高信号）（图12‐1）。腰穿脑脊液检查：压力正常范围，脑脊液物色透明，单核细胞50 ×106／L，蛋白0.5g／L，糖及氯化物正常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    急性脊髓炎

# 神经科经典病历37L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=42    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.5
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=72    highBldPress=120    lowBldPress=80
#     ...    personalHistory=
#     ...    previousHistory=既往无高血压、糖尿病、心脏疾病、肺炎结核等病史。其父50岁时有类似症状，62岁时不能行走，70岁因肺部感染死亡。
#     ...    symptom=主因进行性步态不稳3年收入院。#####神志清楚，言语呈吟诗样，对答切题，检查合作，计算力、记忆力及定向力正常。双眼侧视时可见水平和旋转眼震，无复视。双侧面部感觉对称存在，张口下颌不偏。额纹对称，鼻唇沟等深。听力粗测正常。悬雍垂居中，双侧软腭上抬有力，双侧咽反射灵敏。双侧转头耸肩有力。伸舌居中。双上肢远端肌肉轻度萎缩，四肢肌力4级，肌张力减低。双手指鼻均不准确、有意向性震颤、轮替动作缓慢，双侧跟膝胫试验阳性，Romberg征睁闭眼均不稳。针刺觉、关节位置觉及音叉振动觉无异常。腹壁反射对称引出，四肢腱反射对称亢进，双侧Babinski征阳性。颈无抵抗，Kernig征（─）、Brudzinski征（─）。现病史:患者3年前无明显诱因出现步态不稳，走路摇晃，容易跌倒，走路步基宽。继而出现发音困难，言语含糊，呈吟诗样，双手笨拙，运动时震颤明显，持物不准。无头痛、呕吐，无抽搐、意识障碍，无视物模糊及视物成双，无尿便障碍。因病情进展缓慢，未诊治。近1年来出现手部肌肉的轻度萎缩，为明确诊断来院就诊。
#     ...    weight=
#     ...    assistCheck=颅脑MRI示小脑、脑干萎缩。心电图示窦性心律，心电图大致正常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    遗传性共济失调



# 神经科经典病历38L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=24    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.4
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=75    highBldPress=100    lowBldPress=75
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=双下肢僵硬、无力伴智能差10 余年，加重5年。#####神经系统检查：意识清楚，构音欠清，计算力差（86－7＝？），定向力及记忆力可。视力、视野粗测正常，双侧瞳孔等大等圆，直径约3mm，对光反射灵敏，双眼水平注视时可见细小水平眼震，无复视。双上肢肌容积、肌力、肌张力均正常，双下肢远端肌肉萎缩，双下肢近端肌力4 级，足背屈肌力2 级，跖屈肌力3 级，肌张力折刀样增高。双足音叉振动觉消失。双侧膝腱、跟腱反射对称活跃，双侧踝阵挛阳性，双侧Babinski 征、Chaddock 征阳性。现病史:自幼精神运动发育迟滞，2岁会走路，4岁会说话；言语含糊，反应较同龄儿童迟钝，学习成绩一直差。10岁后逐渐出现双下肢僵硬、无力。近5年症状加重，行走困难，走路时双足尖着地，呈剪刀步态，易摔跤。无发热、抽搐、头痛、恶心、呕吐、视力下降、吞咽困难、饮水呛咳等，无肌肉萎缩，无上肢力弱。
#     ...    weight=
#     ...    assistCheck="神经电生理 针极肌电图未见异常；神经传导示胫神经、腓总神经运动传导速度减慢伴部分CMAP 波幅降低，腓肠神经感觉传导速度减慢。体感诱发电位 双侧正中神经N9、N13潜伏期均延长，双侧胫神经未引出反应。简易智能量表（MMSE）评分21／30分。头颅MRI 示胼胝体变薄，脑沟及脑裂略增宽。颈椎MRI 未见异常。胸椎MRI 示胸段脊髓变细"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    遗传性痉挛性截瘫


# 神经科经典病历39L-1
#     [Documentation]    断言:"帕金森病"
#     ${getRes}    智能诊断3.0
#     ...    age=68    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.3
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=90    highBldPress=120    lowBldPress=79
#     ...    personalHistory=不吸烟，偶饮酒，1两／日，约30年
#     ...    previousHistory=既往高血压史病史10年，血压最高达180／110mmHg，规律口服苯磺酸左旋氨氯地平片，2.5mg，1次／日，血压控制在130～140／80～90mmHg之间。否认心脏病病史、糖尿病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。无前列腺增生病史。
#     ...    symptom=右手震颤1年，伴走路不稳半年。#####心率90次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；面部无表情，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。四肢肌力Ⅴ级，双下肢肌张力稍高，右手震颤，频率约3～4次／秒，双侧肱二头肌腱反射（＋＋），双下肢膝腱反射（＋）。双侧病理征阴性。颈软，感觉未见异常。慌张步态。 现病史:1年前无明显诱因出现右手震颤，不能控制，频率为3～4次／秒，紧张时加重，休息时减轻，睡眠后消失，无肢体无力，无肢体麻木，无大小便失禁，就诊于当地医院，给予“盐酸苯海索片，1mg，2次／日，口服”，震颤较前好转。半年前出现走路不稳，启动困难，走起路来不能停下，仍伴有震颤，为求进一步诊治收入院。
#     ...    weight=
#     ...    assistCheck="血常规：白细胞5.6×109／L，中性粒细胞百分比72%，血红蛋白130g／L，血小板220×109／L。生化：CHOL 6﹒8mmol／L↑，TG 2﹒4mmol／L↑，余未见异常。心电图：窦性心律，正常心电图。便常规：镜检未见异常，OB。辅助检查：脑CT平扫未见异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    帕金森病


# 神经科经典病历39L-2
#     [Documentation]    断言:"高血压"
#     ${getRes}    智能诊断3.0
#     ...    age=68    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.3
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=90    highBldPress=120    lowBldPress=79
#     ...    personalHistory=不吸烟，偶饮酒，1两／日，约30年
#     ...    previousHistory=既往高血压史病史10年，血压最高达180／110mmHg，规律口服苯磺酸左旋氨氯地平片，2.5mg，1次／日，血压控制在130～140／80～90mmHg之间。否认心脏病病史、糖尿病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。无前列腺增生病史。
#     ...    symptom=右手震颤1年，伴走路不稳半年。#####心率90次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；面部无表情，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。四肢肌力Ⅴ级，双下肢肌张力稍高，右手震颤，频率约3～4次／秒，双侧肱二头肌腱反射（＋＋），双下肢膝腱反射（＋）。双侧病理征阴性。颈软，感觉未见异常。慌张步态。 现病史:1年前无明显诱因出现右手震颤，不能控制，频率为3～4次／秒，紧张时加重，休息时减轻，睡眠后消失，无肢体无力，无肢体麻木，无大小便失禁，就诊于当地医院，给予“盐酸苯海索片，1mg，2次／日，口服”，震颤较前好转。半年前出现走路不稳，启动困难，走起路来不能停下，仍伴有震颤，为求进一步诊治收入院。
#     ...    weight=
#     ...    assistCheck="血常规：白细胞5.6×109／L，中性粒细胞百分比72%，血红蛋白130g／L，血小板220×109／L。生化：CHOL 6﹒8mmol／L↑，TG 2﹒4mmol／L↑，余未见异常。心电图：窦性心律，正常心电图。便常规：镜检未见异常，OB。辅助检查：脑CT平扫未见异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    高血压

# 神经科经典病历40L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=58    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.3
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=72    highBldPress=114    lowBldPress=67
#     ...    personalHistory=吸烟史10年，现已戒烟，偶饮酒，量少。
#     ...    previousHistory="既往体健，否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。家族史"
#     ...    symptom=左下肢震颤半年。#####神志清楚，语言流利，近记忆力差，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，皱额有力，余颅神经检查未见明显异常，四肢肌力Ⅴ级，肌张力高，双侧腱反射（＋＋），双侧病理征未引出，感觉、共济检查未见明显异常。慌张步态，左下肢于静止时震颤较明显。现病史:患者缘于半年前在感冒输液治疗后出现左下肢震颤，震颤在静止时明显，活动时减轻，不伴肢体无力、肢体抽搐及舞蹈样动作，不伴头痛、头晕，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，近1个月患者左下肢震颤较前加重，伴左手不灵活。
#     ...    weight=78
#     ...    assistCheck=血常规：WBC 7﹒18×109／L，NT%69﹒1%，RBC 4﹒3×1012／L，HGB 138g／L，PLT 212×109／L。血生化：CHOL 3﹒63mmol／L，TG 0﹒79mmol／L，HDL 1﹒02mmol／L↓，LDL 2﹒86mmol／L，余无异常。头颅MRI示：轻度脑萎缩。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    帕金森病


# 神经科经典病历41L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=56    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=家族史：母亲及妹妹有类似病史。
#     ...    gender=1
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=家族史：母亲及妹妹有类似病史。
#     ...    symptom=右手抖动5年#####神经系统查体：神清，语利，颅神经检查（－），四肢肌力5 级，右手可见姿势性震颤，四肢肌张力正常，深浅感觉正常，腱反射（＋＋），病理征（－）。现病史:5年前，患者逐渐出现右手抖动，主要在拿东西、端杯子和写字时抖动明显，静止时不抖动，饮酒后右手抖动好转。无肢体无力、麻木。
#     ...    weight=
#     ...    assistCheck=头颅MRI 未见异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    特发性震颤


# 神经科经典病历42L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=50    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=既往史：糖尿病。
#     ...    symptom=双手抖动3年#####神经系统查体：神清，语利，颅神经检查（－），四肢肌力5 级，右手可见姿势性震颤，四肢肌张力正常，深浅感觉正常，腱反射（＋＋），病理征（－）。现病史:3年前，患者逐渐出现双手抖动（右手较左手稍重），在拿东西、写字或紧张、情绪激动时抖动明显，静止时不抖动，近1年出现头部轻微震颤，情绪激动时加重。无肢体无力、麻木。
#     ...    weight=
#     ...    assistCheck=头颅MRI 未见异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    特发性震颤


# 神经科经典病历43L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=58    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=以“记忆减退5年，加重伴行为异常1年”为主诉就诊。#####神清，表情淡漠，定向力、记忆力、判断力、计算力明显减退，言语减少，面部老年斑多而色深，四肢肌力5－级，双侧腱反射对称活跃。现病史:患者5年前逐渐出现记忆力减退，表现为丢三落四，尤以近记忆力减退明显。后渐出现远记忆力减退，反应迟钝，重复言语。近1年来症状加重，行为异常，表情淡漠，出门找不到家，有时不认识身边亲人。于2006年1月门诊求诊。
#     ...    weight=
#     ...    assistCheck="颅脑CT 及MRI 检测显示广泛的脑沟变深，皮质萎缩，脑室扩大的全脑萎缩征象。尤其额、颞叶和顶叶萎缩明显的影像学图像。简易精神状态测试（Mini‐mental State Ex amination，M MSE）≤17分；日常生活量表（Activity of Daily Living，ADL）评分45分。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    阿尔茨海默病


# 神经科经典病历44L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=70    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=无家族遗传史。
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=无脑卒中史，无脑器质病史。
#     ...    symptom=出门不认识回家的路、亲戚朋友都不认识数月。##### 现病史:患者退休10年，记忆力逐渐减退，进而对老同事名字都忘了，渐渐连拜访探视者、老朋友见面也不认识了。退休7年后对亲戚、子女渐不认识，见人表现欣快、有时呆滞。在家全靠人照顾吃喝，自己不知饥、饱。睡眠尚可，叫睡即睡，叫醒即醒，生活不能自理。前几天，由于看管不严，自己单独出外，乱跑乱窜，在外3天，经派出所收容，家属报警正好送回。
#     ...    weight=
#     ...    assistCheck=MRI 显示弥漫性脑皮质萎缩，脑室显著扩大，脑沟回退缩。EEG 出现各导联弥散性慢波，以θ波为主，δ波屡屡出现。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    阿尔茨海默病


# 神经科经典病历45L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=46    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.4
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=78    highBldPress=125    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=既往无高血压、糖尿病史，否肝炎、结核病史，无长期大量饮酒史，无家族史。
#     ...    symptom=主因“眩晕伴步态不稳2年”第二次住院。#####神志清楚，言语流利，计算力、记忆力及定向力均正常。视力视野粗测正常，双眼球各向活动正常，可见水平眼震，双瞳孔等大同圆，对光反射灵敏。无面部感觉障碍，张口下颌居中。双侧额纹对称，鼻唇沟等深。听力粗测正常。无声音嘶哑、饮水返呛及吞咽困难，双侧咽反射存在。双侧转头耸肩对称有力，伸舌居中，舌肌无萎缩。四肢肌力5级，肌张力正常，双手指鼻试验、轮替试验、双下肢跟膝胫试验均差，轻度共济失调步态，Romberg征睁、闭目均不稳。深浅感觉正常。四肢腱反射对称正常，病理反射未引出。现病史:患者2年前无任何诱因出现步态不稳伴眩晕，视物晃动感，15个月前第一次入院治疗。当时体检：双眼水平眼震，双侧指鼻试验不稳，双侧跟膝胫试验不准，Romberg征阳性，病理反射未引出。辅助检查：头颅CT正常，血糖、肾功能、肝功能、TCD、EEG均未见异常。乙肝六项检查示：HBsAg（＋），抗HBcAg（＋），HBeAg（＋）。给予对症治疗症状无缓解，以“共济失调待查”出院。出院后上述症状持续存在并渐出现双手震颤，系纽扣等精细活动受限而第二次住院。
#     ...    weight=
#     ...    assistCheck=患者2年前无任何诱因出现步态不稳伴眩晕，视物晃动感，15个月前第一次入院治疗。当时体检：双眼水平眼震，双侧指鼻试验不稳，双侧跟膝胫试验不准，Romberg征阳性，病理反射未引出。辅助检查：头颅CT正常，血糖、肾功能、肝功能、TCD、EEG均未见异常。乙肝六项检查示：HBsAg（＋），抗HBcAg（＋），HBeAg（＋）。给予对症治疗症状无缓解，以“共济失调待查”出院。出院后上述症状持续存在并渐出现双手震颤，系纽扣等精细活动受限而第二次住院。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    小脑变性



# 神经科经典病历46L-1
#     [Documentation]    断言:"多发性硬化"
#     ${getRes}    智能诊断3.0
#     ...    age=59    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=9个月前反复出现右侧季肋部疼痛，数天后突然出现左眼失明。#####查体：嗜睡、构音障碍，左眼视力指动2 尺，左眼直接对光反射迟钝，四肢肌力3 级，双膝腱反射亢进，双侧Hoff man 征（＋），双侧Babinski 征（＋），深浅感觉正常。诊断：①多发性硬化；②低钠血症；③脑桥中央髓鞘溶解症 现病史:查眼底：左眼视乳头边界模糊，考虑为视神经病变。给予球后注射地塞米松，口服“卡马西平”等治疗后右侧季肋部疼痛好转，左眼视力恢复到指动2 尺。7个月前再次出现右侧季肋部疼痛伴双下肢麻木、无力。行胸椎MRI示中胸段（T5～T9）脊髓异常信号。诊断为“视神经脊髓炎”，予甲泼尼龙冲击治疗后上述症状好转。20天前再次出现头晕、呃逆、伴恶心、呕吐。查电解质：血钠126.5mmol／L，头颅MRI 示双侧脑室旁白质长T1、长T2 信号。给予补钠治疗，3天后突然出现四肢无力，言语不清，饮水呛咳，
#     ...    weight=
#     ...    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    多发性硬化



# 神经科经典病历46L-2
#     [Documentation]    断言:"低钠血症"
#     ${getRes}    智能诊断3.0
#     ...    age=59    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=9个月前反复出现右侧季肋部疼痛，数天后突然出现左眼失明。#####查体：嗜睡、构音障碍，左眼视力指动2 尺，左眼直接对光反射迟钝，四肢肌力3 级，双膝腱反射亢进，双侧Hoff man 征（＋），双侧Babinski 征（＋），深浅感觉正常。诊断：①多发性硬化；②低钠血症；③脑桥中央髓鞘溶解症 现病史:查眼底：左眼视乳头边界模糊，考虑为视神经病变。给予球后注射地塞米松，口服“卡马西平”等治疗后右侧季肋部疼痛好转，左眼视力恢复到指动2 尺。7个月前再次出现右侧季肋部疼痛伴双下肢麻木、无力。行胸椎MRI示中胸段（T5～T9）脊髓异常信号。诊断为“视神经脊髓炎”，予甲泼尼龙冲击治疗后上述症状好转。20天前再次出现头晕、呃逆、伴恶心、呕吐。查电解质：血钠126.5mmol／L，头颅MRI 示双侧脑室旁白质长T1、长T2 信号。给予补钠治疗，3天后突然出现四肢无力，言语不清，饮水呛咳，
#     ...    weight=
#     ...    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    低钠血症


# 神经科经典病历46L-3
#     [Documentation]    断言:"脑桥中央髓鞘溶解症"
#     ${getRes}    智能诊断3.0
#     ...    age=59    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=    highBldPress=    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=9个月前反复出现右侧季肋部疼痛，数天后突然出现左眼失明。#####查体：嗜睡、构音障碍，左眼视力指动2 尺，左眼直接对光反射迟钝，四肢肌力3 级，双膝腱反射亢进，双侧Hoff man 征（＋），双侧Babinski 征（＋），深浅感觉正常。诊断：①多发性硬化；②低钠血症；③脑桥中央髓鞘溶解症 现病史:查眼底：左眼视乳头边界模糊，考虑为视神经病变。给予球后注射地塞米松，口服“卡马西平”等治疗后右侧季肋部疼痛好转，左眼视力恢复到指动2 尺。7个月前再次出现右侧季肋部疼痛伴双下肢麻木、无力。行胸椎MRI示中胸段（T5～T9）脊髓异常信号。诊断为“视神经脊髓炎”，予甲泼尼龙冲击治疗后上述症状好转。20天前再次出现头晕、呃逆、伴恶心、呕吐。查电解质：血钠126.5mmol／L，头颅MRI 示双侧脑室旁白质长T1、长T2 信号。给予补钠治疗，3天后突然出现四肢无力，言语不清，饮水呛咳，
#     ...    weight=
#     ...    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑桥中央髓鞘溶解症



# 神经科经典病历47L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=28    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=父母均体健，家族中无此类疾病发生。
#     ...    gender=1
#     ...    heartRate=90    highBldPress=126    lowBldPress=79
#     ...    personalHistory=
#     ...    previousHistory=既往体健。无发热、感冒史，否认高血压、心脏病病史，否认结核等传染病病史，无手术、外伤及输血史，预防接种史不详。
#     ...    symptom=发作性抽搐3天#####神志清楚，言语流利，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，额纹对称，口角无偏斜，咬肌有力，伸舌居中，咽反射存在，转头、耸肩有力。双上肢肌力Ⅴ级，肱二头肌腱反射（＋＋），双下肢肌力Ⅴ级，膝腱反射（＋＋）。深浅感觉检查未见异常。双侧病理征阴性。颈软，无抵抗。共济运动检查稳准、协调。现病史:3天前无明显诱因突然出现抽搐，表现为双眼上吊，双上肢屈曲，双下肢伸直，伴有小便失禁，当时唤之不能答应，伴有舌咬伤，约20分钟后症状缓解，缓解后如正常人，遂就诊于当地医院，行头颅CT检查：平扫未见异常，随机血糖：7.4mmol／L，血常规检查：白细胞计数（WBC）5.6×109／L，血红蛋白（Hgb）123g／L，血小板计数（PLT）230×109／L，未予特殊治疗。1天前再次出现上述症状，表现为双眼上吊，双上肢屈曲，双下肢伸直，唤之不能应，伴有小便失禁、舌咬伤，约30分钟后缓解，缓解后如正常人，为求进一步诊治收入神经内科病房。
#     ...    weight=
#     ...    assistCheck=复查头部MRI 示脑桥基底部片状长T1、长T2 信号。电解质：血Na＋140mmol／L。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    癫痫


# 神经科经典病历48L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=36    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=否认家族性遗传疾病。
#     ...    gender=
#     ...    heartRate=68    highBldPress=152    lowBldPress=83
#     ...    personalHistory=
#     ...    previousHistory=既往有癫痫病史5年，服用苯妥英钠0.1g，每日二次，控制尚可，近1年未发作，因服药后出现齿龈增生、头晕、视物不清，近一周未服用药物。否认高血压、糖尿病等病史，否认肝炎、结核等传染病史，无外伤史，无手术及输血史，无药物及食物过敏史，预防接种史不详。
#     ...    symptom= 2小时内连续全身性抽搐4次。#####神志不清，唤之不能应答。双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，眼球可活动，双侧额纹对称，鼻唇沟无变浅，伸舌不合作。四肢可活动，四肢肌张力正常，双侧腱反射（＋＋），双侧巴氏征阴性。感觉检查、共济检查不合作。颈软，双侧克氏征。现病史:缘于2小时前突然出现意识丧失，唤之不能应答，抽搐表现为双眼上吊，口吐白沫，双上肢屈曲，双下肢伸直，伴有小便失禁，无寒战高热，无摔伤，约持续20分钟抽搐缓解，唤之不能应答。1.5小时前再次出现上述症状，约持续20分钟缓解，仍意识不清，共发作4次，急就诊于当地医院，当时测血压为150／80mmHg，未经特殊诊治而来我院，急诊查头颅CT示：平扫未见异常，为求进一步诊治入我院神经内科。自发病以来，患者神志不清，暂未进食，小便失禁，体重无明显变化。
#     ...    weight=
#     ...    assistCheck="血生化：ALT 18﹒00U／L，AST 23﹒00U／L，BUN 5﹒40mmol／L，CREA 86﹒0μmol／L，Na＋139mmol／L，K＋4﹒49mmol／L。随机血糖：5.6mmol／L。头颅CT平扫：未见异常。脑电图：左额及左中央导联可见癫痫样异常放电。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    癫痫持续状态


# 神经科经典病历49L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=64    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=    highBldPress=148    lowBldPress=94
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=头晕月余，时轻时重，近1周来有眩晕感，头重脚轻，走路有轻飘感。发现血压高半年，未正规治疗。#####神经系统检查未见异常。现病史:
#     ...    weight=
#     ...    assistCheck=TCD报告：椎-基底动脉供血不足。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    椎-基底动脉供血不足


# 神经科经典病历50L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=28    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.5
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=80
#     ...    highBldPress=105
#     ...    lowBldPress=69
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=口角歪斜，右眼闭合无力2天#####体重55kg，身高165cm，发育正常，营养良好，无急性病容；神志清楚，言语流利，双瞳孔等大等圆，d＝3.0mm，对光反射灵敏，右侧周围性面瘫，示齿口角左偏，伸舌居中，右侧额纹及鼻唇沟变浅、右眼闭合无力，右侧口角下垂，双耳听力正常，咽反射存在，四肢肌力、肌张力正常，感觉共济无异常，双侧腱反射（＋＋），双侧病理征未引出。现病史:3天前洗澡受凉后出现右耳后疼痛，2天前晨起出现口角向左侧歪斜，右眼闭合无力，讲话漏风，无耳鸣、耳聋及味觉异常，无言语障碍及四肢活动障碍，遂前往医院就诊。
#     ...    weight=
#     ...    assistCheck="尿常规：无异常 血常规：无异常 生化：无异常 心电图：窦性心律，正常心电图"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    特发性面神经麻痹


# 神经科经典病历51L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=36    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.8
#     ...    familyHistory=无遗传病病史、无重症肌无力疾病史、无甲状腺疾病病史、无肌营养不良疾病史。
#     ...    gender=1
#     ...    heartRate=106
#     ...    highBldPress=140
#     ...    lowBldPress=80
#     ...    personalHistory=
#     ...    previousHistory=无肿瘤病史、无肺病病史、无药物过敏史。
#     ...    symptom=双眼睑下垂8个月，颈部及四肢无力5个月，伴呼吸困难10天。#####口唇轻度发绀，声音嘶哑低微，讲话疲劳后失声。头颅无畸形，面部、背部可见痤疮。呼吸急促，双肺无啰音，心音有力，无病理性杂音，腹部正常。神志清楚，精神差，智能正常。双眼视力、视野粗测正常，眼底正常，双侧上眼睑下垂，左眼裂2mm，右眼裂3mm，双瞳孔直径3mm，直接、间接对光反射正常，双眼球各方向活动充分。张口无偏斜，面部感觉正常，咀嚼肌反复咀嚼动作后力量递减，无肌肉萎缩。双侧额纹对称，闭目力弱，鼓腮有力。听力正常，无眼球震颤，软腭上抬可，咽下运动差，咽反射存在。耸肩、转颈无力。伸舌居中，舌肌无萎缩及纤颤。四肢肌肉无萎缩，初查四肢肌力Ⅴ级，反复运动后肌力递减，肌张力正常，四肢腱反射正常，腹壁反射存在。深、浅感觉均正常。指鼻试验、跟膝胫试验均稳准。双侧Hoffmann征，Babinski征，Chaddock征均阴性。颈部无抵抗，Kernig征阴性。现病史:
#     ...    weight=
#     ...    assistCheck=乙酰胆碱受体（AChR）抗体阳性。抗胸腺瘤抗体间接血凝实验1∶2为阴性。 低频重复电刺激波幅递减。单纤维肌电图显示颤抖增宽。 CT检查未发现胸腺肿瘤或增生肥大。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    重症肌无力

# 神经科经典病历52L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=37    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=因握拳松开不易17年，双手变细无力8年，言语含糊5年就诊。患者于17年前偶有疲劳后持物放松不易，渐发展为握拳松开困难。8年前发现双手臂变细、无力，活动发僵感，伴颈部酸胀乏力。5年前言语含糊，时有进食呛咳，行走乏力易跌跤，呈缓慢进行加重。#####血压16／11kPa，心、肺、肝、肾等内科无异常，智能正常，咬肌和颞肌平削呈斧头脸，口唇尚不翘，面肌力弱，示齿差，闭眼尚不紧。轻度脱发，颈部细长前屈，眼底正常，轻度白内障，双侧瞳孔等大同圆，光反应灵敏，无眼震及眼球运动受限，构音不清，腭弓升高，咽反射迟钝，伸舌居中，舌体小无舌肌萎缩、纤颤，舌肌见叩击性肌强直。双侧胸锁乳突肌、前臂和手部肌肉、胫前肌等萎缩，前臂和手部肌肉见叩击性肌强直，双手用力握紧后放松困难，四肢肌力-级、腱反射减低，深浅感觉正常，共济运动无异常，未引出病理反射，睾丸小，性功能障碍。患者兄弟姊妹4人，一弟的症状较患者重，一妹的症状较患者轻。
#     ...    weight=
#     ...    assistCheck="血清CK 685IU/L，AST 44IU/L，LDH 134IU/L。心电图示右束支传导阻滞，电生理检查见肌强直电位，VEP为P100潜伏期延长，MCV、SCV减慢。肌肉活检取自左股外侧肌，经冷冻切片，各种酶组织化学染色，HE见散在分布的部分肌纤维轻度-中度萎缩，无肌内膜，肌束膜增生。明显的组织学改变是大多数肌纤维内见肌核内移（图5-57，图5-58）。ATPase染色见萎缩的肌纤维主要是 型纤维。 电镜观察见萎缩肌纤维肌核增多，肌膜破损，基膜增生，肌膜核内移。肌膜下见排列紊乱的肌丝团和肌膜下肌质块。部分肌纤维内见小灶性肌纤维溶解，线粒体肿胀。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    萎缩性肌强直


# 神经科经典病历53L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=22    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37
#     ...    familyHistory=无类似发病史，无遗传性疾病史。
#     ...    gender=1
#     ...    heartRate=80
#     ...    highBldPress=105
#     ...    lowBldPress=75
#     ...    personalHistory=
#     ...    previousHistory=无类似发病史。否认慢性腹泻史。否认外伤及手术史。
#     ...    symptom=四肢无力1天。#####发育正常，营养好，神志清，抬入病房，被动体位，查体合作。神志清，问答切题，定向力、记忆力、计算力正常。视力、视野粗测无异常，眼底视乳头边界清。双侧瞳孔等大等圆，对光反射存在。双眼球活动自如，无眼球震颤，双眼睑无下垂。面部痛觉正常，咀嚼运动对称有力，双侧角膜反射存在。双侧额纹及鼻唇沟对称，味觉无异常。听力正常。无吞咽困难、饮水呛咳及发音嘶哑。咽反射存在。胸锁乳头肌无萎缩，转颈、耸肩对称有力。伸舌居中。无肌萎缩，四肢肌张力减弱。双上肢肌力3级，双下肢肌力2级，腱反射消失。全身痛觉无异常。脑膜刺激征未引出。病理反射未引出。无共济运动失调。现病史:患者下午跑步时感双下肢肌肉疼痛，当时未引起重视。晚饭前感四肢乏力，行走困难。晚上病情逐渐加重，双下肢不能行走及站立，双上肢不能抬举，双手不能持物。排尿困难。无肢体麻木及抽搐。病程中无发热及腹泻。
#     ...    weight=
#     ...    assistCheck=血钾1.9mmol /L，肝功能、肾功能、血糖、血脂均正常，血常规、尿常规、大便常规均正常，胸部平片正常。心电图提示低血钾。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    低钾型周期性麻痹


# 神经科经典病历54L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=25    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.5
#     ...    familyHistory=本家系3 代共10 人，年龄3～69岁，其母亲有低血钾瘫痪史2次，均在夏天活动后出汗休息时发生，分别发生在34岁和40岁时，当时出现乏力、四肢活动不能，曾诊断为低钾型周期性瘫痪，予补钾治疗症状缓解，血钾恢复正常。
#     ...    gender=1
#     ...    heartRate=72
#     ...    highBldPress=130
#     ...    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=患者平素体健。
#     ...    symptom=因“反复发作性四肢活动不灵2年”于2008年3月12日入神经内科病房。#####T：36.5℃，P：72次／分，R：18次／分，BP：130／70mmHg，神清，语明，扶入病房，查体合作。甲状腺无肿大，双肺呼吸音清，未闻及干湿啰音，心率：72次／分，律齐，各瓣膜听诊区未闻及杂音，腹平软，无压痛。神经系统专科检查：神志清楚，言语流利，双瞳孔等大等圆，直径2.5mm，直接、间接对光反应灵敏，双眼各方向运动充分，无复视，无眼震，双侧额纹、鼻唇沟对称，双眼闭目有力，耸肩、转颈对称有力，伸舌居中。四肢肌力3 级，肌张力低，双侧腱反射对称减弱，双侧病理征阴性。双侧肢体、躯干包括面部痛觉对称存在。颈软，克、布鲁津斯基征阴性。现病史:患者2年前清晨睡醒后感四肢活动不灵，表现为双下肢不能移动，手指尚能屈曲，但肘部不能抬起及移动，轻微胸闷、心慌，无呼吸困难及吞咽困难，于当地医院就诊，测血钾2.2mmol／L，经补钾治疗约5～6h 后即恢复正常，四肢活动自如，继续口服氯化钾每次500mg，2次／日，1周后停药。1.5年前饮酒后再次发作，自觉四肢乏力，疲劳，渐出现四肢活动不灵伴头颈部活动障碍，胸闷，说话困难，当地医院查血钾2.1mmol／L，经补钾治疗约6～7h 后好转，未再服药。8个月前腹泻2天后再次发作，口服止泻药物后腹泻停止，但出现四肢活动不能，无胸闷、言语障碍，经补钾治疗症状缓解后未再服药。本次入院前1天，无诱因再次发作，症状同前，入院急诊行心电图未见异常，血钾2.34mmol／L，予口服10%氯化钾20ml 后收入神经内科。入院后经补钾治疗，血钾7h 后恢复正常，住院期间监测血钾3次均正常。
#     ...    weight=
#     ...    assistCheck="血钠、氯及尿同步电解质均正常。空腹血糖、餐后2h 血糖、血醛固酮、尿醛固酮、甲状腺功能均正常。尿可滴定酸测定、血皮质醇节律检查、促肾上腺皮质激素测定、血浆肾素活性测定及血管紧张素测定均正常。B超肝胆胰脾肾、肾上腺均无异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    低钾型周期性麻痹


# 神经科经典病历55L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=6    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=其母亲孕龄25岁，患儿为第一胎，早产，剖宫产，双胞胎，出生时低体重。其双胞胎妹妹具有相似障碍且症状更严重。
#     ...    symptom=双下肢活动障碍，行走困难5年。#####神清，言语清晰，对答切题，心、肺、腹无明显异常。可独立站立，髋膝屈曲，足尖着地，足放平时双膝过伸。能短距离独立步行，行走时屈膝屈髋，跳跃剪刀步态，呈尖足。双侧髋关节后伸、外展、外旋受限，双足跖屈内翻，踝关节背伸活动受限。双下肢内收肌、绳肌、小腿三头肌张力增高，跟腱挛缩。双侧臀大肌、臀中肌、股四头肌、胫骨前肌、趾长伸肌肌力减弱（4 级）。长坐位平衡及站立平衡差。双膝、跟腱反射亢进，髌阵挛（－），踝阵挛（＋）。Ely 征、Thomas 征（＋），Babinski 征（＋）。TLR、ATNR、STNR、MORO（－）。现病史:5年前，患儿家人逐渐发现其双下肢强硬，活动不灵活，爬行困难，不能独坐，扶站时双腿紧靠，双下肢呈尖足，足跟不能着地，站立困难。因家中经济困难，未到医院就医及治疗。2岁时屈膝屈髋位能独坐。3＋岁，扶持下站立足跟放平困难，放平时膝过伸；在扶持下短距离行走，行走时屈膝屈髋，呈跳跃剪刀步态。双上肢活动及语言、智力无明显异常。4岁可独站。4＋岁能独立短距离行走，但行走困难，仍呈跳跃剪刀步态。现在亲友支持下到康复中心治疗。
#     ...    weight=
#     ...    assistCheck=头颅CT 未见明显异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑性瘫痪


# 神经科经典病历56L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=9    ageType=月
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=家族中否认同类病史。
#     ...    gender=1
#     ...    heartRate=120
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=个人史无特殊记载，
#     ...    previousHistory=既往健康，母孕期正常，出生史正常，
#     ...    symptom=因发现头大8天入院。#####一般状态较差，精神不振，易激惹，营养发育中等，R 36次／分，颅缝开大，头围44cm，前囟1.0×1.0cm，紧张，稍膨隆。双侧球结膜无水肿，颈软，心、肺、腹无异常。神经系统 双瞳孔等大正常，瞳孔＝2.5mm，光反应迅速，眼球各方向运动充分，无落日征，无面瘫，痛觉存在，四肢肌力、肌张力、肌容积正常，角膜反射存在，腹壁反射（上、中、下）消失，肱二头、三头肌反射减弱，膝反射、跟腱反射正常，双侧巴氏征阳性，脑膜刺激征阴性，植物神经系统正常。现病史:"近10天，患儿烦躁，精神不振，用手拍头。家人发现患儿头逐渐增大，并有运动发育倒退，爬站、翻身均不能，不认人。无热，不吐，未抽。1个月前，患化脓性脑膜炎，曾发热、抽搐伴吐。CSF 呈典型化脓性改变。用先锋Ⅴ、氯霉素、地塞米松等治疗，痊愈。"
#     ...    weight=9
#     ...    assistCheck=血常规10.0×10 9／L，N 0﹒62，L 0﹒38，RBC5.08 ×10 12／L，Hb 130 g／L。CSF 外观无色透明，细胞数0 ×10 6／L，潘氏试验阴性，葡萄糖2.5mmol／L，蛋白0.2g／L，氯化物114 mmol／L，涂片未找到细菌，培养无细菌生长。头MRI 扫描 后颅窝扩大，天幕上抬，小脑下蚓部缺如，小脑半球发育不良，后颅窝可见巨大囊肿（小脑延髓池内）并与第四脑室相通，侧脑室第三脑室积水扩张，脑室旁围绕以长T 1长T 2信号影，胼胝体变薄，印象诊断符合变异型Dandy‐walker 综合征改变。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    脑积水


# 神经科经典病历57L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=43    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=突起头晕、呕吐3天，加重伴意识障碍1天。#####现病史:头晕当天患者神志清楚，当地医院查头颅CT未见明显异常。给以改善循环治疗过程中患者逐渐出现意识障碍，神志清楚变为嗜睡。意识障碍当天复查头颅CT示：小脑梗死，幕上脑积水。在脱水降颅压过程中患者神志障碍进一步加重，由嗜睡变为昏迷。意识障碍第二天至我院复查头颅CT，并行侧脑室穿刺引流术放脑脊液。患者意识障碍减轻，扩大脑室明显缩小。
#     ...    weight=
#     ...    assistCheck=
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑积水

# 神经科经典病历58L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=40    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=体位性头痛，表现为坐位或立位症状加重，平卧位症状消失或明显减轻；偶有恶心、呕吐、头晕、视物模糊等。##### 现病史:
#     ...    weight=
#     ...    assistCheck=腰穿CSF压力低于588Pa（60mmH2O），脑脊液轻度白细胞增高，蛋白含量增高。影像学表现：T2WI平扫横断面，显示第四脑室变窄；T2-FLAIR平扫横断面，显示双侧大脑表面硬脑膜增厚（箭）；T1WI平扫矢状面，显示小脑下垂（箭），脑干前移、桥前池变窄（箭）；MRM图，显示外漏的脑脊液（箭）；T1WI增强冠状面，显示脑表面弥漫性对称性线样强化的硬脑膜（箭）；T1WI增强矢状面，显示脑膜均匀强化与枕大池变小，提示小脑下垂（箭）；T1WI增强横断面，显示脑表面弥漫性对称性线样强化的硬脑膜（箭）；T1WI平扫矢状面，显示扩张的窦汇后下缘向外凸呈弧形改变（箭）。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    低颅压综合征

# 神经科经典病历59L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=45    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=左下肢进行性肌肉萎缩10年，加重1年入院。#####查体：左下肢肌肉萎缩，肌力3级，体表感觉减退，左踝不能背曲（肌力0级），左胫骨前肌、趾伸肌、腓骨长肌肌力0肌。左膝腱反射、跟腱反射减退，左足不能内外翻，未引出病理反射。肌电图示：①左腓总神经受损（轴索为主）；②左股四头肌、左胫前肌神经源性损害。
#     ...    weight=
#     ...    assistCheck=MRI T1WI显示T12-S1平面椎管内髓外硬膜下混杂信号灶，病灶以等或稍低信号为主。T2WI显示病灶呈明显高、低混杂信号，主要位于脊髓及马尾神经前方，T12水平脊髓受压轻度前移，脊髓信号无异常。T1增强扫描示：病灶未见明确强化。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    椎管内肿物

# 神经科经典病历60L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=32    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=双眼视物模糊3天，伴头痛半月。#####视力双眼裸视0.1，Jr4，矫正视力 0.1（不提高），眼压右眼13mmHg，左眼15mmHg，双眼睑无下垂，结膜无充血，角膜清亮，KP（–），前房深度正常，Tyn（+），虹膜纹理清晰，瞳孔等大同圆，光反射存在，RAPD征（–），晶状体较透明，玻璃体混浊，视盘边界略模糊，C/D约0.3，A/V约2∶3，黄斑水肿，后极部视网膜灰白色水肿，脱离。双眼球无突出，运动自如。现病史:半月前出现感冒样症状，随后自觉双眼视物模糊，无头晕、虹视等症状，后于我院门诊就诊。患者应用环孢素联合糖皮质激素治疗3个月后，双眼眼底脉络膜色素脱失，呈“晚霞状”改变，周边网膜出现Dalen-Fuchs结节。患者自行停药2周后，出现视物不清，再次就诊，眼科常规检查见：双角膜后羊脂状KP，Tyn（+++），虹膜后粘连，瞳孔缘可见Koeppe结节，眼底不能窥入。再次应用全身应用环孢素联合糖皮质激素治疗，局部应用糖皮质激素眼药及散瞳眼药水治疗，症状得到缓解。患者此后一直按医嘱治疗，整个口服药物疗程大约为1年左右，最终患者的视力双眼保持在1.0。停药半年后，睫毛根部、背部皮肤出现脱色素。
#     ...    weight=
#     ...    assistCheck=眼底荧光血管造影（FFA）该例患者双眼造影早期，视乳头轻度着染，后极部视网膜下点状强荧光斑，造影晚期形成“多糊状”荧光积存。实验室检查 白细胞密度为9.78×109个/L，肝、肾功能检查均未见异常；抗结核抗体检查阴性，弓形虫抗体IgM为阴性，梅毒血清特异性抗体为阴性；病毒抗体（抗单纯疱疹病毒抗体、抗巨细胞病毒抗体）、免疫抗体、乙型肝炎病毒、艾滋病病毒等检查均为阴性。 B超检查 双眼玻璃体点状混浊，后极部脉络膜低至中度反射性增厚，伴视网膜脱离。眼眶CT和头颅MRI检查 未见眼部肿物及颅内占位性病变。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    原田病

# 神经科经典病历61L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=21    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=患者1周前无明显原因出现眩晕，平卧向两侧翻身时均出现眩晕，感觉整个身体向一侧翻转，持续几十秒后停止。患者多家医院就诊，曾行中药治疗，无明显好转。现病史:因体位改变眩晕发作1周来我院就诊。#####查体：一般情况可，双侧外耳道通畅，鼓膜完整，标志清。音叉试验：双耳RT（＋），WT居中。Romberg征阴性，指鼻试验正常。Dix‐Hallpike试验无眼震及眩晕发作，水平翻转试验左右转头导致眩晕发作，伴有向地性眼震，其中左转头时眩晕和眼震持续时间长。
#     ...    weight=
#     ...    assistCheck=
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    良性阵发性眩晕


# 神经科经典病历62L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=1    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=左眼眉弓部黄豆大皮肤硬结节#####T36.2℃，发育营养良好。面色红润，神志清，反应佳，全身皮肤未见出血点。浅表淋巴结未及。心肺未见异常。腹软，肝肋下1cm，剑突下约1.5cm，脾未及。左眼上睑下垂，眼裂变小，左眼上睑眉弓部可见一鸽蛋大肿块，本皮本色，囊性感。眼底检查未见异常改变。现病史:生后第5个月时于左眼眉弓部出现黄豆大皮肤硬结节，口服抗生素一个月不见好转且进行性增大（鸽卵大）。先后在国内多家眼科医院诊治达7个月，未能确诊而来我院。
#     ...    weight=
#     ...    assistCheck=血常规：WBC 4﹒2 ×10 9／L，N 0﹒56，L 0﹒44，分数外偶见有核红细胞，Hb120g／L，PLT148 ×10 9／L。尿便检查正常。全肝功、肾功能正常。X 线：胸片未见异常。骨髓像：粒、红、巨三系大致正常，于片尾偶见瘤样细胞（裸核退化状）。尿V MA 点片法：可疑阳性。B 超检查：先用腹部超声探查腹部未能查到肿物（探头大探查不方便）。后改用二维心脏超声探查（探头小）于左肾上腺发现3 ×3cm 2实质性肿块，内部回声不均匀。肿物穿刺：于左眼眉梢部行肿物穿刺，抽吸困难，取0.5ml 血性液体涂片染色，镜检，发现大量神经母细胞瘤，再行桥联酶标AP 再生障碍性贫血P 法做单克隆抗体F 3系列检测结果为阳性表达，百分率82%，同时用抗急淋、急非淋抗体做对照检测，结果均为阴性表达（可除外白血病）。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    神经母细胞瘤

# 神经科经典病历63L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=8    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=右足跟疼痛，跛行1年半。#####T37.8℃，意识清楚，消瘦，痛苦面容，跛行。面色黄白全身皮肤未见淤点，双颌下及右腹股沟部可触及黄豆大小淋巴结数个，心肺未见异常。腹软，肝肋下2cm，剑突下3cm。右足跟、足掌部肿胀，轻度发红，活动受限，拒触拒按，脊柱生理弯曲正常，活动自如。现病史:右足跟疼痛，跛行先后在国内多所医院就诊，按风湿热，类风湿性关节炎治疗长达18个月，未见好转。骨穿6次未能确诊，来我院。
#     ...    weight=
#     ...    assistCheck="血常规WBC 2﹒4 ×10 9／L，St0.30，晚幼粒0.10，N 0﹒38，L 0﹒10 异淋0.10，分数外偶见幼红细胞，Hb 85g／L，PLT 118 ×10 9／L，NAP 阳性反应，积分186分。ESR：32mmH 2 O／1h 80 mmH 2 O／2h，ASO：1∶800，CRP 阳性，类风湿因子阳性，尿常规、肝、肾功能检查未见异常，X线检查胸片未见异常，右踝关节及右足掌正位像：可见软组织肿胀，骨膜反应性增生，骨质有虫蚀样改变。B超检查二维心脏超生探头于腹后壁脊柱左侧查到3 ×5cm 实质性肿块，内部回声不均匀且有钙化区。骨髓检查：外院骨穿5次，未能明确诊断。来我院后易位骨穿3次，取材极困难，抽吸出少量淡黄色骨髓液，特殊腥臭味。涂片染色镜下所见：增生极度低下，呈现一片荒芜，部分呈空白区，有核与无核细胞呈破碎溶解状，片尾部偶见3～5个瘤细胞团，多为裸核细胞，粒、红、巨三系受抑。尿VMA 点片法：阳性。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    神经母细胞瘤


# 神经科经典病历64L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=60    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=头痛、恶心、呕吐1个月，加重10天。#####左侧肢体肌力下降（Ⅱ～Ⅲ级）。现病史:
#     ...    weight=
#     ...    assistCheck=右额叶见一椭圆形囊状病变，大小为6.4cm×5.0cm×4.6cm，囊壁呈T1WI等信号（图5a）、T2WI（图5b）稍高信号及FLAIR高信号，壁厚薄不均匀，下壁较厚，且见局限结节样隆起凸向腔内，囊内为长T1、长T2信号与FLAIR低信号，病变周围见晕状轻度T1WI低信号与T2WI高信号带环绕。病变局部脑沟裂变浅，右侧侧脑室受压变形。增强T1WI（图5c～e）显示病变囊壁呈花环状明显强化，内壁毛糙，见数个棘状突起向腔内延伸。病变周围相邻脑膜未见异常强化。病理诊断：多形性胶质母细胞瘤
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    胶质母细胞瘤

# 神经科经典病历65L-1
#     [Documentation]    断言:"脑栓塞"
#     ${getRes}    智能诊断3.0
#     ...    age=55    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=81
#     ...    highBldPress=118
#     ...    lowBldPress=67
#     ...    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。
#     ...    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
#     ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。
#     ...    weight=72
#     ...    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    脑栓塞

# 神经科经典病历65L-2
#     [Documentation]    断言:"风湿性心脏病"
#     ${getRes}    智能诊断3.0
#     ...    age=55    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=81
#     ...    highBldPress=118
#     ...    lowBldPress=67
#     ...    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。
#     ...    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
#     ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。
#     ...    weight=72
#     ...    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    风湿性心脏病

# 神经科经典病历65L-3
#     [Documentation]    断言:"二尖瓣狭窄"
#     ${getRes}    智能诊断3.0
#     ...    age=55    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=81
#     ...    highBldPress=118
#     ...    lowBldPress=67
#     ...    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。
#     ...    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
#     ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。
#     ...    weight=72
#     ...    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    二尖瓣狭窄

# 神经科经典病历65L-4
#     [Documentation]    断言:"心房颤动"
#     ${getRes}    智能诊断3.0
#     ...    age=55    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.7
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=81
#     ...    highBldPress=118
#     ...    lowBldPress=67
#     ...    personalHistory=吸烟史8年，20支／日，现已戒烟2年，偶饮酒，量少。
#     ...    previousHistory=既往“风湿性心脏病、心房颤动”病史3年，平素服用酒石酸美托洛尔，12.5mg，每日2次；否认高血压、糖尿病及冠心病史，否认肝炎、结核病史，否认手术、输血史，否认药物过敏史，预防接种史不详。
#     ...    symptom=右侧肢体不灵活2小时#####脉率78次／分，心律不整，有力，心尖部可闻及舒张期隆隆样杂音；神经系统：神志清楚，运动性失语，双侧瞳孔直径约3.0mm，等大等圆，对光反射灵敏，双眼球向各方向活动自如，双侧额纹对称，闭目有力，右侧鼻唇沟浅，伸舌偏右，余颅神经检查未见明显异常，右侧肢体肌力Ⅱ级，肌张力可，左侧肢体肌力Ⅴ级，四肢腱反射（＋＋），右侧巴氏征（＋），左侧巴氏征，右侧半身痛温觉减退。颈软，无抵抗。现病史:2小时前干活时突然出现右侧肢体不灵活，不能抬起及持物，伴说话不清，无头痛、头晕，无肢体抽搐，无意识丧失，无尿便失禁，不伴视物不清、视物成双及视物旋转，不伴声音嘶哑、吞咽困难及饮水呛咳，曾到当地医院就诊，脑CT示：平扫未见明显异常，心电图示：心房颤动，大致正常心电图，为求进一步诊治收入院。
#     ...    weight=72
#     ...    assistCheck="血常规：WBC 7﹒4×109／L，NT%69﹒1%，RBC 4﹒4×1012／L，HGB 138g／L，PLT 200×109／L。心电图：心房颤动，大致正常心电图。脑CT：平扫未见异常。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    心房颤动


# 神经科经典病历66L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=13    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=38.5
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=96
#     ...    highBldPress=105
#     ...    lowBldPress=68
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=因头痛、呕吐3天，发热1天为主诉来诊。#####发育营养良，神志清，痛苦面容，被动体位。内科系统检查心尖搏动于锁中线外第5 肋间10cm，胸骨左缘第2 肋间处可闻及Ⅳ级以上收缩期粗糙喷射性杂音并可扪及细震颤，余无异常。神经系统检查，颅神经、周围神经均未见异常。脑膜刺激征：颈强明显，布氏征及克氏征阳性。现病史:3天前在用力大便时，突然出现剧烈头痛难忍，以左侧前额部为重，为持续爆裂样痛，随之出现喷射状呕吐，约数十次；吐物为胃内容。吐后头痛自觉稍有减轻。来诊前1天出现发热T 38℃，无流涕、咳、泻。无抽搐、昏迷、失语及肢体活动障碍。既往自幼好头痛，患有先天性心脏病主动脉瓣狭窄。
#     ...    weight=
#     ...    assistCheck=WBC 20﹒7 ×10 9／L，Hb116g／L，PLT150 ×10 9／L。头部CT：左半侧环池、小脑幕上及大脑大静脉池内可见高密度灶，左侧海绵窦内亦见高密度灶，提示蛛网膜下腔出血，不除外海绵窦内血管畸形。脑脊液检查为均匀一致血性，离心上清液黄染。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    蛛网膜下腔出血


# 神经科经典病历67L-1
#     [Documentation]    断言:"蛛网膜下腔出血"
#     ${getRes}    智能诊断3.0
#     ...    age=55    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.4
#     ...    familyHistory=家族中无心、脑血管疾病患者。
#     ...    gender=0
#     ...    heartRate=99
#     ...    highBldPress=130
#     ...    lowBldPress=74
#     ...    personalHistory=
#     ...    previousHistory=高血压病史3年，最高达160／90mmHg，平素服用卡托普利，一次12.5mg，每日3次，血压控制在130／70mmHg水平；否认糖尿病史；否认心脏病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。
#     ...    symptom=头痛、恶心、呕吐3小时。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志清楚，语言流利，双瞳孔等大等圆，d＝4.0mm，对光反射灵敏，眼球活动自如，眼睑无下垂，额纹对称，鼻唇沟对称，示齿口角无偏斜，咬肌有力，咽反射存在，转头、耸肩有力，伸舌居中。四肢肌力Ⅴ级，四肢肌张力可。双肱二头肌腱反射（＋＋）、双膝腱反射（＋＋），右侧巴氏征，左侧巴氏征。颈抵抗，颏下4横指。克氏征阳性。无感觉障碍。现病史:3小时前打麻将时突然出现头痛，以整个顶部为著，呈胀痛，伴恶心、喷射性呕吐，呕吐物为胃内容物，无肢体活动障碍，无头晕、耳鸣等，无意识丧失、尿便失禁，无发热、咳嗽、咳痰，就诊于综合医院，脑CT示：脑沟、脑裂及外侧裂高密度影，考虑蛛网膜下腔出血。心电图：窦性心律，正常心电图，为求进一步治疗入神经内科病房。
#     ...    weight=68
#     ...    assistCheck="血常规：白细胞计数（WBC）8.6×109／L，中性粒细胞百分比：68%，血红蛋白（Hb）132g／L，血小板计数（PLT）206×109／L。血生化：电解质：血钠：140mmol／L，血钾：4.1mmol／L，余检查正常。脑CT：脑沟、脑裂及外侧裂高密度影。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    蛛网膜下腔出血

# 神经科经典病历67L-2
#     [Documentation]    断言:"高血压"
#     ${getRes}    智能诊断3.0
#     ...    age=55    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.4
#     ...    familyHistory=家族中无心、脑血管疾病患者。
#     ...    gender=0
#     ...    heartRate=99
#     ...    highBldPress=130
#     ...    lowBldPress=74
#     ...    personalHistory=
#     ...    previousHistory=高血压病史3年，最高达160／90mmHg，平素服用卡托普利，一次12.5mg，每日3次，血压控制在130／70mmHg水平；否认糖尿病史；否认心脏病病史，否认结核等传染病病史，无外伤、输血史，预防接种史不详。
#     ...    symptom=头痛、恶心、呕吐3小时。#####心脏：心率99次／分，律整，有力，各心脏瓣膜听诊区未闻及杂音；神经系统：神志清楚，语言流利，双瞳孔等大等圆，d＝4.0mm，对光反射灵敏，眼球活动自如，眼睑无下垂，额纹对称，鼻唇沟对称，示齿口角无偏斜，咬肌有力，咽反射存在，转头、耸肩有力，伸舌居中。四肢肌力Ⅴ级，四肢肌张力可。双肱二头肌腱反射（＋＋）、双膝腱反射（＋＋），右侧巴氏征，左侧巴氏征。颈抵抗，颏下4横指。克氏征阳性。无感觉障碍。现病史:3小时前打麻将时突然出现头痛，以整个顶部为著，呈胀痛，伴恶心、喷射性呕吐，呕吐物为胃内容物，无肢体活动障碍，无头晕、耳鸣等，无意识丧失、尿便失禁，无发热、咳嗽、咳痰，就诊于综合医院，脑CT示：脑沟、脑裂及外侧裂高密度影，考虑蛛网膜下腔出血。心电图：窦性心律，正常心电图，为求进一步治疗入神经内科病房。
#     ...    weight=68
#     ...    assistCheck="血常规：白细胞计数（WBC）8.6×109／L，中性粒细胞百分比：68%，血红蛋白（Hb）132g／L，血小板计数（PLT）206×109／L。血生化：电解质：血钠：140mmol／L，血钾：4.1mmol／L，余检查正常。脑CT：脑沟、脑裂及外侧裂高密度影。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    高血压


# 神经科经典病历68L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=3    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=00
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=生后发现左眼睑裂较右眼小3年。#####远视力：右眼0.5，左眼0.1（欠合作），近视力检查不合作。右眼睑裂高度正常，瞳孔大小相对恒定，左眼睑裂及瞳孔大小则呈现周期性变化。麻痹期：左眼睑裂3mm，瞳孔直径5mm，对光反射消失，左眼外斜–8°，左眼外转轻度受限，内转、上、下转均不能过中线。痉挛期：左眼睑裂7mm，瞳孔直径2mm，对光反射消失，双眼正位，左眼外转轻度受限，程度与麻痹期大致相同，可轻度内转、上转及下转。麻痹期持续时间约50s，痉挛期持续时间约15s（图36-1～图36-4）。散瞳眼底检查正常。其余脑神经检查未见异常。现病史:女性，3岁，足月顺产，无吸氧史，无严重感染史，无类似疾病家族史。于生后即出现左眼睑裂较右眼小，在强光刺激下症状更加明显，同时左眼间断呈现外斜状态，于2岁时就诊于当地医院诊断为“左眼先天性动眼神经不全麻痹，左眼弱视”，并于该院行左眼外直肌减弱术（后徙9mm）。术后外斜稍有好转，效果不满意。为纠正左眼小来我院就诊。
#     ...    weight=
#     ...    assistCheck=" Bell征 右眼（阳性），左眼（弱阳性）。睑裂高度和瞳孔周期性变化的动态观察：（1）麻痹期：睑裂高度3mm，持续时间约50秒，瞳孔直径5mm，对光反射消失（2）痉挛期：睑裂高度7mm，持续时间约15秒，瞳孔直径2mm，对光反射消失。颅脑磁共振检查（MRI）未见明显异常改变。脑血管超声检查（TCD）双侧大脑中动脉血流不对称。肌电图检查 麻痹期内直肌、提上睑肌和上、下直肌均无自发电位产生，痉挛期可见内直肌有较强的动作电位痉挛相持续15秒，然后又回到麻痹相，如此循环不已。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    动眼神经麻痹


# 神经科经典病历69L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=19    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=进行性双下肢无力伴肌萎缩2年。#####现病史:双下肢肌无力以远端重，行走呈足下垂，肌萎缩呈“鹤腿”或倒立的香槟酒瓶状，双膝反射正常，踝反射引不出，双足呈弓形足，伴有营养障碍，深浅感觉障碍不明显（似有短袜套痛觉减退）。肌电图显示以轴索损害为主，运动神经传导速度稍减慢。双手肌萎缩不明显。
#     ...    weight=
#     ...    assistCheck=影像学检查示：“鹤腿”或倒立的香槟酒瓶样改变
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    腓骨肌萎缩症

# 神经科经典病历70L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=54    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=无高血压、糖尿病史。
#     ...    symptom=2009年5月26日突然出现复视，伴头晕，28日出现上睑下垂，无头痛及视力下降，无肢体运动障碍，2009年6月3日就诊于解放军总医院神经眼科门诊。#####眼部检查：视力右眼1.2、左眼0.9，左上睑下垂、完全不能上抬，瞳孔直径右眼3mm、左眼6mm，左眼对光反射消失，双眼视盘色淡红、界清，左眼球固定于外下斜位，向上、内、下运动受限。现病史:
#     ...    weight=
#     ...    assistCheck=头颅CT及MRI未见异常；磁共振动脉成像（MRA）报告左侧后交通动脉起始处见一6.1mm×8.8mm的动脉瘤，瘤顶指向后外下方，瘤颈宽4.4mm
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    颅内动脉瘤


# 神经科经典病历71L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=19    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=因“发现皮肤奶油咖啡斑9年，多发皮肤结节4年，脊柱侧弯2年”入院。#####患者全身皮肤见散在多发性奶油咖啡斑及皮肤结节，大小不一。皮肤结节直径约0.5～1.5cm，质软，边界清，无压痛，以颈、肩部为密集。脊柱胸腰段后凸畸形，并向右轻度侧弯畸形，各棘突及棘旁无压痛，活动功能尚好，双下肢肌力Ⅴ级，肌张力和感觉功能良好，各腱反射正常引出。
#     ...    weight=
#     ...    assistCheck=胸腰椎正侧位平片示：T11、T12椎体呈不规则楔形，前缘和左侧缘见弧形压迹，压迹旁骨质轻度硬化，椎间隙未见明显变窄；左侧第11、12肋骨头变尖。脊柱下胸上腰段后凸、轻度右侧弯畸形。CT平扫示：T11、T12椎体旁见软组织样肿块影，椎体、附件及相邻肋骨骨质不同程度受破坏。MRIT1WI示：肿块呈等信号，部分经左侧椎间孔向椎管内延伸；主动脉、双侧膈肌脚受推移、向前；椎体、附件及相邻肋骨受侵犯，信号混杂。T2WI示：肿块以高信号为主，呈“葡萄串”样，内见散在多发点状低信号“葡萄籽”，横断面呈“孔雀开屏”状；脊髓信号未见明确异常。T1WI+C示：肿块中等强化，部分“葡萄籽”强化明显。背部照片示：皮肤多发奶油咖啡斑和结节。病理诊断：神经纤维瘤。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    神经纤维瘤病



# 神经科经典病历72L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=8    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=据调查患儿三代近亲亦无癫痫史。
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=患儿既往身体健康，无任何相关疾病的过敏惊厥史和后遗症。曾接种过脊髓灰质炎糖丸疫苗、乙脑及百白破疫苗，均无癫痫发作。
#     ...    symptom=1周内反复晕倒5次##### 现病史:上课时，突然两眼上翻，头后仰，手上举，晕倒；面色苍白，四肢抽搐，呼之不应，2～3分钟后清醒，但不知有发作之事，全身瘫痪30分钟。23日、26日又有2次发作，发作时不伴有咬牙、粪尿失禁，亦无发作先兆症状。患者1天前常规注射A群脑膜炎球菌多糖疫苗0.5ml
#     ...    weight=
#     ...    assistCheck=实验室检查（血清钙3.0mmol/L，钠328.9mmol/L），脑电图左侧慢波，尖波较右侧显著
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    癫痫样发作


# 神经科经典病历73L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=4    ageType=月
#     ...    allergyHistory=
#     ...    bodyTempr=37.6
#     ...    familyHistory=家族史：父母非近亲结婚，无遗传代谢病家族史，也无同类病史。
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=个人史：母孕期健康，足月顺产，生后无窒息。现4个月不会大笑，见母亲无特殊表现。已添加蛋黄及维生素D、钙等。
#     ...    previousHistory=既往史：患儿生后3个月在我院眼科做过青光眼手术。
#     ...    symptom=生后即发现整个面部均由血管痣覆盖，唇部向上突出也为血管痣所致，近1天因出现抽搐来就诊。#####R32次／分，神清，状态可，呼吸平稳，无发绀。前囟平坦。颜面部皮肤均为血管痣所覆盖，暗红色，不突出于皮肤表面，唇向上突出，也呈暗红色。浅表淋巴结肿大，颈软，心肺未闻及异常，腹平，肢温。神经系统检查未见异常。现病史:抽时双眼凝视，牙关紧闭，四肢屈曲强直、抖动，持续至1～2分钟自缓。抽时意识不清，无二便失禁，不伴发热。
#     ...    weight=
#     ...    assistCheck=脑CT显示双侧脑皮质有异常钙化区，当时未行脑血管造影及MRI检查。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    斯特奇－卡利舍－韦伯综合征

# 神经科经典病历74L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=28    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=双侧上肢无力及行走困难2年，加重1个月。#####现病史:
#     ...    weight=
#     ...    assistCheck=矢状位T1WI及T2WI显示第4～7颈椎水平脊髓增粗、局部蛛网膜下腔变窄，脊髓内椭圆形T1WI低信号与T2WI高信号病变。矢状位增强扫描，病变中央轻度条状强化，边缘模糊。病理诊断：脊髓星形细胞瘤
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    星形细胞瘤



# 神经科经典病历75L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=38    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=左侧面部抽搐5个月余。#####现病史:
#     ...    weight=
#     ...    assistCheck=影像学表现：脑实质内室管膜瘤图1-15-1A～C为横断面T1WI、T2WI及矢状T1WI，图1-15-1D为冠状水抑制，图1-15-1E、F为增强后横断面、矢状位。右侧额叶内可见一团状异常信号影，边界清楚，大小约为27mm×23mm×22mm，在T2WI和T2 FLAIR上 病灶中央呈稍高、高信号，周围可见环状低信号影，在 T1WI上呈高、等混杂信号，增强扫描病灶不均匀强化。术中所见：右额后回皮层及皮层下见一肿物，边界较清，周围可见含铁血黄素沉着，脑组织水肿轻，行全瘤切除。病理结果：送检组织内可见呈乳头状生长的异型细胞，细胞核大，核分裂象可见。免疫组化显示异型 细 胞GFAP（+），P53（部 分+），EMA（少 数+），Vimentin（+），Ki-67 1%（+），CK（－）。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    室管膜瘤


# 神经科经典病历76L-1
#     [Documentation]    断言:"颅脑损伤"
#     ${getRes}    智能诊断3.0
#     ...    age=44    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=64
#     ...    highBldPress=107
#     ...    lowBldPress=75
#     ...    personalHistory=
#     ...    previousHistory=吸烟史20年，每日20-40支。有饮酒史，具体不详。
#     ...    symptom=摔伤后意识障碍进行性加重1小时10分钟#####昏迷状态，查体不合作，皮肤无黄染，无水肿，无脱水。双侧瞳孔等大等圆，对光反射迟钝。左外耳道可见血性液体流出，鼻无堵塞，无流液。咽部查体不合作。双肺叩诊音清，肺肝相对浊音界位于右侧锁骨中线第5肋间，双肺呼吸音粗，未闻及干湿性啰音。脊柱四肢无畸形。现病史:患者于1小时10分钟前，饮大约3两白酒6瓶啤酒后不慎摔倒，可唤醒但言语不清，伴左耳道流血，约半小时后呼之不应，无抽搐、无呕吐，无大小便失禁。院外未做特殊处理，120送院。急诊以“重度颅脑损伤”收入病房。患病以来，患者意识障碍进行性加重，目前呈昏迷状态，未进饮食，呕吐一次，无大便失禁。
#     ...    weight=
#     ...    assistCheck=头颅CT：脑干损伤，广泛蛛网膜下腔出血、脑挫裂伤、颅底骨折。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    颅脑损伤

# 神经科经典病历76L-2
#     [Documentation]    断言:"脑挫伤"
#     ${getRes}    智能诊断3.0
#     ...    age=44    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=64
#     ...    highBldPress=107
#     ...    lowBldPress=75
#     ...    personalHistory=
#     ...    previousHistory=吸烟史20年，每日20-40支。有饮酒史，具体不详。
#     ...    symptom=摔伤后意识障碍进行性加重1小时10分钟#####昏迷状态，查体不合作，皮肤无黄染，无水肿，无脱水。双侧瞳孔等大等圆，对光反射迟钝。左外耳道可见血性液体流出，鼻无堵塞，无流液。咽部查体不合作。双肺叩诊音清，肺肝相对浊音界位于右侧锁骨中线第5肋间，双肺呼吸音粗，未闻及干湿性啰音。脊柱四肢无畸形。现病史:患者于1小时10分钟前，饮大约3两白酒6瓶啤酒后不慎摔倒，可唤醒但言语不清，伴左耳道流血，约半小时后呼之不应，无抽搐、无呕吐，无大小便失禁。院外未做特殊处理，120送院。急诊以“重度颅脑损伤”收入病房。患病以来，患者意识障碍进行性加重，目前呈昏迷状态，未进饮食，呕吐一次，无大便失禁。
#     ...    weight=
#     ...    assistCheck=头颅CT：脑干损伤，广泛蛛网膜下腔出血、脑挫裂伤、颅底骨折。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑挫伤


# 神经科经典病历77L-1
#     [Documentation]    断言:"脑梗死"
#     ${getRes}    智能诊断3.0
#     ...    age=53    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.2
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=82
#     ...    highBldPress=148
#     ...    lowBldPress=87
#     ...    personalHistory=吸烟30年，40支／日，饮酒30年，白酒5两／日。
#     ...    previousHistory=既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
#     ...    symptom=头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。现病史:患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。
#     ...    weight=80
#     ...    assistCheck="尿常规：葡萄糖（＋＋＋＋）.血常规：红细胞5.85×1012／L，血红蛋白195.0g／L，血细胞比容0.542l／L生化：总胆红素21.70μmol／L，间接胆红素18.70μmol／L，葡萄糖12.81mmol／L，总胆固醇7.36mmol／L，甘油三酯3.37mmol／L，低密度脂蛋白5.13mmol／L。血同型半胱氨酸：27.60μmol／L。糖化血红蛋白：11.1%。OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。颈部血管超声：①双侧颈总动脉、颈内外动脉起始处及椎动脉硬化症；②双侧颈总动脉、颈内外动脉起始处及椎动脉管壁毛糙，内膜增厚；③左侧颈总动脉膨大处硬化斑块形成；④右侧椎动脉内径狭窄，右侧颈部低回声反射；⑤淋巴结肿大可能。头部CT：左侧顶枕区低密度影。头MRI：左侧顶枕区急性脑梗死；双侧半卵圆中心、左侧基底节区腔隙性脑梗死；左侧颈内动脉虹吸部狭窄。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑梗死

# 神经科经典病历77L-2
#     [Documentation]    断言:"高血压"
#     ${getRes}    智能诊断3.0
#     ...    age=53    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.2
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=82
#     ...    highBldPress=148
#     ...    lowBldPress=87
#     ...    personalHistory=吸烟30年，40支／日，饮酒30年，白酒5两／日。
#     ...    previousHistory=既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
#     ...    symptom=头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。现病史:患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。
#     ...    weight=80
#     ...    assistCheck="尿常规：葡萄糖（＋＋＋＋）.血常规：红细胞5.85×1012／L，血红蛋白195.0g／L，血细胞比容0.542l／L生化：总胆红素21.70μmol／L，间接胆红素18.70μmol／L，葡萄糖12.81mmol／L，总胆固醇7.36mmol／L，甘油三酯3.37mmol／L，低密度脂蛋白5.13mmol／L。血同型半胱氨酸：27.60μmol／L。糖化血红蛋白：11.1%。OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。颈部血管超声：①双侧颈总动脉、颈内外动脉起始处及椎动脉硬化症；②双侧颈总动脉、颈内外动脉起始处及椎动脉管壁毛糙，内膜增厚；③左侧颈总动脉膨大处硬化斑块形成；④右侧椎动脉内径狭窄，右侧颈部低回声反射；⑤淋巴结肿大可能。头部CT：左侧顶枕区低密度影。头MRI：左侧顶枕区急性脑梗死；双侧半卵圆中心、左侧基底节区腔隙性脑梗死；左侧颈内动脉虹吸部狭窄。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    高血压

# 神经科经典病历77L-3
#     [Documentation]    断言:"2型糖尿病"
#     ${getRes}    智能诊断3.0
#     ...    age=53    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.2
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=82
#     ...    highBldPress=148
#     ...    lowBldPress=87
#     ...    personalHistory=吸烟30年，40支／日，饮酒30年，白酒5两／日。
#     ...    previousHistory=既往高血压病史10年，最高达180／110mmHg，规律服用吲达帕胺（寿比山）一天一次，一次2.5mg，血压控制不佳。
#     ...    symptom=头晕，视物模糊，有头重脚轻感，行走不稳3天。#####神经系统：神清语利，双瞳孔等大等圆，对光反射灵敏，眼球活动自如，双眼右侧同向性偏盲，双侧额纹、唇沟对称，伸舌居中，软腭上提对称，咽反射（＋），四肢肌力、肌张力正常，四肢腱反射（＋），双手轮替动作协调，指鼻试验准确，双侧肢体深浅感觉对称存在，指绳试验不能，双侧巴氏征。现病史:患者于3天前吃午饭时出现双眼视物不清，眼前发花，自觉有视物不真实感，伴有头晕、头闷、憋胀感，伴头重脚轻，无视物旋转、恶心、呕吐、言语不清、意识障碍、肢体活动不灵等症状，当时未在意，2天前起床后自觉视物模糊加重，向左侧看比向右侧看清晰，有行走不稳感，就诊社区医院，考虑结膜炎，对症治疗，症状不能缓解。1天前就诊于我院急诊，头部CT检查：左侧顶枕区低密度影，为进一步诊治，入我院神经内科治疗。
#     ...    weight=80
#     ...    assistCheck="尿常规：葡萄糖（＋＋＋＋）.血常规：红细胞5.85×1012／L，血红蛋白195.0g／L，血细胞比容0.542l／L生化：总胆红素21.70μmol／L，间接胆红素18.70μmol／L，葡萄糖12.81mmol／L，总胆固醇7.36mmol／L，甘油三酯3.37mmol／L，低密度脂蛋白5.13mmol／L。血同型半胱氨酸：27.60μmol／L。糖化血红蛋白：11.1%。OGTT试验：空腹血糖10.44mmol／L↑，餐后1小时14.72mmol／L↑，餐后2小时血糖12.20mmol／L↑，餐后3小时血糖11.16mmol／L↑。颈部血管超声：①双侧颈总动脉、颈内外动脉起始处及椎动脉硬化症；②双侧颈总动脉、颈内外动脉起始处及椎动脉管壁毛糙，内膜增厚；③左侧颈总动脉膨大处硬化斑块形成；④右侧椎动脉内径狭窄，右侧颈部低回声反射；⑤淋巴结肿大可能。头部CT：左侧顶枕区低密度影。头MRI：左侧顶枕区急性脑梗死；双侧半卵圆中心、左侧基底节区腔隙性脑梗死；左侧颈内动脉虹吸部狭窄。"
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    2型糖尿病



# 神经科经典病历78L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=32    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=既往有高血压病史5年左右，未规律服用降压药物，血压控制差，收缩压最高达200mmHg，2年前发生过“脑室出血”，在当地医院住院治疗，未遗留后遗症。
#     ...    symptom=因“突发昏迷不醒3小时”入院#####入院查体: T 36. 8℃，P 92 次/分，R 20次/分，BP 225/114mmHg，深昏迷，查体不合作，GCS评分: E1V1M2，双侧瞳孔针尖样，光反射消失。颈部有抵抗感，克氏征( +)。双侧鼻唇沟无变浅，口角无歪斜。双侧肢体深浅感觉检查不合作。四肢肌力0级，肌张力减弱，双侧膝腱及跟腱反射亢进，双侧巴氏征( +)。现病史:本次入院前3小时患者无明显诱因突发头痛、头晕，呈全头性胀痛，伴喷射性恶心呕吐及左侧肢体活动不灵，数分钟后意识不清，呕吐物为胃内容物，无发热寒战，无肢体抽搐，无大小便失禁。
#     ...    weight=
#     ...    assistCheck=颅脑CT扫描发现“脑干出血”。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑干出血



# 神经科经典病历79L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=7    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.6
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=101
#     ...    highBldPress=95
#     ...    lowBldPress=60
#     ...    personalHistory=
#     ...    previousHistory=2年来出现类似四肢无力2次，两次发作时均不能行走，发作间期肌力正常。每次查电解质血钾均正常。
#     ...    symptom=发作性四肢无力8天#####神清，心肺腹未见明显异常。颅神经（-）。双上肢肌力近端IV级，远端V级，双下肢肌力近端IV级，远端III级。四肢腱反射正常，肌张力减弱，深浅感觉正常，病理征未引出。现病史:患者8天前受凉后轻微发热，继而四肢无力，不能行走。口服药物治疗后，热退，但仍有四肢无力，不能行走。
#     ...    weight=
#     ...    assistCheck=电解质：血钾：4.12mmol/l,血钠：135mmol/l。心电图正常，心肌酶正常，甲状腺功能正常。肌电图传导速度正常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    正常钾型周期性麻痹


# 神经科经典病历80L-1
#     [Documentation]    断言:"腔隙性脑梗死"
#     ${getRes}    智能诊断3.0
#     ...    age=56    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=
#     ...    highBldPress=150
#     ...    lowBldPress=90
#     ...    personalHistory=
#     ...    previousHistory=既往高血压病史2年，未规律服用降压药物。
#     ...    symptom=主因突发言语笨拙1天就诊#####右侧颈内动脉听诊区可及血管杂音。神志清晰，左侧轻度舌瘫，双侧瞳孔等大同圆，对光反射灵敏，余颅神经检查未见异常。四肢肌力肌张力正常，左侧Chaddock 征阳性。
#     ...    weight=
#     ...    assistCheck=头部CT 示右侧基底节区腔隙性脑梗死。血管超声示右侧颈内动脉中‐重度狭窄，左侧锁骨下动脉中度狭窄。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    腔隙性脑梗死



# 神经科经典病历80L-2
#     [Documentation]    断言:"高血压"
#     ${getRes}    智能诊断3.0
#     ...    age=56    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=
#     ...    heartRate=
#     ...    highBldPress=150
#     ...    lowBldPress=90
#     ...    personalHistory=
#     ...    previousHistory=既往高血压病史2年，未规律服用降压药物。
#     ...    symptom=主因突发言语笨拙1天就诊#####右侧颈内动脉听诊区可及血管杂音。神志清晰，左侧轻度舌瘫，双侧瞳孔等大同圆，对光反射灵敏，余颅神经检查未见异常。四肢肌力肌张力正常，左侧Chaddock 征阳性。
#     ...    weight=
#     ...    assistCheck=头部CT 示右侧基底节区腔隙性脑梗死。血管超声示右侧颈内动脉中‐重度狭窄，左侧锁骨下动脉中度狭窄。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    高血压

# 神经科经典病历81L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=57    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=无家族性遗传病史及传染病人密切接触史。父亲已故，自然死亡；母亲体健。
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=无吸烟饮酒史，无毒品接触史。已婚，结婚年龄24岁，配偶健康状况良好。
#     ...    previousHistory=平素健康状况良好，无传染病史，无手术外伤史，无过敏史。
#     ...    symptom=突发头痛3天#####神志清楚，GCS评分15分，双瞳等大等圆，直径2.5mm，对光反射灵敏，伸舌居中，四肢肌力、肌张力正常，病理征（－），心肺腹（－）。 现病史:病人3天前无明显诱因突发头痛伴呕吐，有小便失禁，在当地人民医院行头颅CT检查示左侧脑室三角区占位，脑室出血，今为求进一步诊治转来我院。起病以来，病人精神、食欲差，大便未解，体力下降。
#     ...    weight=
#     ...    assistCheck=CT提示左侧脑室脑膜瘤。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    脑膜瘤




###########消化科经典病例##############

# 消化科经典病历2L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=30    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37.2
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=91
#     ...    highBldPress=105
#     ...    lowBldPress=87
#     ...    personalHistory=菜农
#     ...    previousHistory=
#     ...    symptom=腹痛3天伴恶心、呕吐#####神志清楚，精神可；双肺呼吸音清晰，未闻及干湿性啰音。心界不大，心率91次/分，律齐。腹平坦，腹肌稍紧，上腹压痛明显，无反跳痛，Murphy 征阳性，移动性浊音阴性，肠鸣音2～3次/分，双下肢无水肿。 现病史:发作性上腹痛3天，呈发作性绞痛，进食后加重，伴有恶心、呕吐，吐后腹痛缓解
#     ...    weight=
#     ...    assistCheck=血常规示：WBC 9.3×10 9/L，NEUT%为80.4%，Hct 0.54；血清淀粉酶1238U/L，尿淀粉酶873U/L。腹部B 超提示：胆总管增宽，内可见条索状低信号影。上腹部CT 提示：胰头体积增大，周围可见少量渗出改变；腹部平片示：肠管少量积气。心电图及胸片正常，肝功能、肾功能、血糖、血脂未见异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性胰腺炎

# 消化科经典病历3L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=31    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37.8
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=80
#     ...    highBldPress=130
#     ...    lowBldPress=80
#     ...    personalHistory=
#     ...    previousHistory=既往无肺结核史，肝炎病史5年
#     ...    symptom=咳嗽，低热，右胸胀痛一个月，双下肢浮肿十天#####皮肤无黄染、皮疹及出血点，全身浅表淋巴结不大，巩膜不黄，心率80次/分，律齐，各瓣膜区未闻杂音，肺部呼吸音减低，未闻干湿啰音及胸膜摩擦音，腹平软，无压痛，肝肋下1cm，脾未及，未触及包块，无腹水征，下肢轻度水肿。 现病史:患者1个月前因受凉后出现低热，体温在38℃以下，右侧胸部胀痛，咳嗽，乏力，食欲减退，腹胀，无痰。二便正常。
#     ...    weight=
#     ...    assistCheck=血红蛋白110g/L，白细胞4.0 ×109/L，血小板120 ×109/L，尿、便常规正常，胸透示右侧胸腔少量积液，肾功能正常，腹部B超示肝脾大，有少量腹水。肝功能：谷丙转氨酶中度升高，血清白蛋白降低，球蛋白升高，蛋白电泳r球蛋白明显升高，HBsAg阳性
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    肝硬化


# 消化科经典病历4L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=69    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=38.6
#     ...    familyHistory=母亲患胃癌去世，妹妹患有乙肝
#     ...    gender=1
#     ...    heartRate=82
#     ...    highBldPress=130
#     ...    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=发现乙肝10年，间断乏力2年余，加重伴腹胀10天#####肝病面容，全身皮肤黏膜无黄染，无皮下出血、皮疹。可见肝掌及蜘蛛痣。全身浅表淋巴结未触及肿大。腹部膨隆，测腹围90cm，胁腹部及脐周未见瘀斑，无腹壁静脉曲张。腹肌不紧，无压痛及反跳痛，Murphy征阴性。肝脏肋下未触及，脾触诊肋下3cm，移动性浊音（＋）。 现病史:患者10年前查体发现乙肝，因无任何不适，未行进一步诊治，期间未定期复查。2年前无明显诱因出现乏力，为间断性发作，劳累后加重，休息后症状可缓解，无腹痛、腹泻，无反酸、嗳气、恶心、呕吐。1年前体检行腹部B超检查示：脂肪肝，脾大，脾静脉扩张，未予重视。10天前无明显诱因自感乏力症状加重，同时感腹胀，休息后症状无缓解，无发冷、发热，无腹痛、腹泻，无呕血、黑便。发病近10天来，食纳差、小便量少，夜间睡眠差。
#     ...    weight=71
#     ...    assistCheck=血常规：WBC 2.49×109/L，RBC 2.67×1012/L，Hb 92g/L，PLT 57×109/L。肝功：TBIL 29.2μmol/L、TP 54g/L、A 28.6g/L。血凝全套：PT 17.3s、APTT 52.9s、FIB 0.96g/L，PTA 1.7%，INR　1.42。胃镜：食管胃底静脉重度曲张，红色征阳性，慢性胃炎。腹部彩超：肝硬化，门静脉内径增粗，血流通畅，脾大，腹水（大量）。。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    肝硬化失代偿期



# 消化科经典病历5L-1
#     [Documentation]    断言:"十二指肠溃疡"
#     ${getRes}    智能诊断3.0
#     ...    age=27    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=间断呕吐2个月#####患者消瘦体型，慢性病容，生命体征正常。浅表淋巴结未及。腹部可见巨大胃型，触诊张力高，振水音（+），肠鸣音正常，余未见异常。 现病史:患者自6年前起无明显诱因出现反复上腹烧灼痛，夜间、餐前明显，服用抗酸药物有效，未规律诊治。近2年来腹痛逐渐加重，2个月来开始反复于下午和夜间呕吐隔夜宿食。
#     ...    weight=
#     ...    assistCheck=立伟腹部平片：大量胃潴留，幽门梗阻。幽门螺杆菌（Hp）阳性。未见膈下游离气体。胃镜：十二指肠球部溃疡、球腔变形狭窄。活检病理：慢性炎症。腹部CT：幽门梗阻，十二指肠球部黏膜增厚。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    十二指肠溃疡


# 消化科经典病历5L-2
#     [Documentation]    断言:"幽门梗阻"
#     ${getRes}    智能诊断3.0
#     ...    age=27    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=间断呕吐2个月#####患者消瘦体型，慢性病容，生命体征正常。浅表淋巴结未及。腹部可见巨大胃型，触诊张力高，振水音（+），肠鸣音正常，余未见异常。 现病史:患者自6年前起无明显诱因出现反复上腹烧灼痛，夜间、餐前明显，服用抗酸药物有效，未规律诊治。近2年来腹痛逐渐加重，2个月来开始反复于下午和夜间呕吐隔夜宿食。
#     ...    weight=
#     ...    assistCheck=立伟腹部平片：大量胃潴留，幽门梗阻。幽门螺杆菌（Hp）阳性。未见膈下游离气体。胃镜：十二指肠球部溃疡、球腔变形狭窄。活检病理：慢性炎症。腹部CT：幽门梗阻，十二指肠球部黏膜增厚。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    幽门梗阻


# 消化科经典病历6L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=32    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=公司职员
#     ...    previousHistory=发病前工作压力大、生活不规律、经常加班。既往体健，无肾炎、胰腺炎、糖尿病、甲状腺功能亢进、肺结核、急性痢疾等病史，无血吸虫疫水接触史。
#     ...    symptom=腹泻5年#####一般状态好，营养良好。心肺查体正常。腹部平软，未见静脉曲张，全腹无压痛，肝脾肋下未触及，胆囊未触及，Murphy征（－），移动性浊音（－），肠鸣音15次/分，双下肢无水肿。 现病史:患者5年来，大便不规律，反复腹泻，大便2～4次/日，稀糊黏液便，无脓血，每次量少，便前腹痛，排便后缓解。排便多在晨起和早餐后，无里急后重。经常腹痛、腹胀、排气多。腹泻好转时即出现便秘，排便费力，1～2次/周。体重无明显变化。发病多与情绪、睡眠有关，与饮食关系不大，禁食后腹泻无明显改善。曾在外院查过便常规：正常；血生化正常。每次发病时应用抗生素、多种止泻药、益生菌、酵母片和中药等。各种药物治疗开始均有效，3～5天后效果不明显。发病以来睡眠差、精神不佳、心慌、心悸、腰背酸痛，无发热、盗汗等。
#     ...    weight=
#     ...    assistCheck=便常规：正常。WBC 5﹒22 ×109/L，N 0﹒61，HGB 128g/L，PLT 352 ×109/L；肝肾功能和电解质正常，Alb 37﹒4g/L；ESR 2 mm/h；CRP 0﹒234 mg/dl；甲状腺功能正常。便培养（－）。便找阿米巴滋养体（－）。便苏丹Ⅲ染色（－）。PPD（－）。全消化道造影和胸片：未见异常。结肠镜：全结肠及直肠黏膜未见异常。B超和CT：肝、胆、脾、胰、双肾未见异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    肠易激综合征


# 消化科经典病历7L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=38    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.4
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=64
#     ...    highBldPress=120
#     ...    lowBldPress=70
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=反复腹痛、腹泻2年余#####营养良好。浅表淋巴结未触及肿大，心、肺查体正常。腹部平软，全腹无压痛、反跳痛和肌紧张，肝脾肋下未及，肠鸣音6次/分，无气过水声和高调肠鸣音。 现病史:患者2年前开始反复于进冰冷食物或冷水后出现脐周、下腹绞痛，程度不剧烈，不放射，不影响日常生活。伴腹泻，3～5次/日，为黄色稀水或稀糊便，不含油滴及未消化食物，无脓血，无恶臭，不伴里急后重。腹痛多在腹泻后缓解。上述症状多在每日上午出现，进早餐后加重，如不进早餐症状减轻，夜间无腹泻。不伴发热、皮疹、体重下降、水肿等。
#     ...    weight=
#     ...    assistCheck=粪常规：WBC、RBC（－），便潜血（－）×3次；便苏丹Ⅲ染色（－）。血常规：WBC 7﹒8 ×109/L，N 0﹒65，HGB 132g/L，PLT 257 ×109/L；肝肾功能、电解质正常。甲状腺功能：T3、T4、TSH均正常范围。ESR 10 mm/h；CRP 0.7 mg/dl。B超：肝胆胰脾及双肾未见明显异常。全消化道造影未见异常。结肠镜：进镜至末段回肠10c m，所经末段回肠、结肠、直肠黏膜未见异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    肠易激综合征

# 消化科经典病历8L-1
#     [Documentation]    断言:"乙型病毒性肝炎"
#     ${getRes}    智能诊断3.0
#     ...    age=33    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=既往体健无特殊传染病
#     ...    symptom=反复乏力，食欲低下，肝区不适3年#####慢性病容，神志清，巩膜轻度黄染，颜面及颈部有数枚蜘蛛痣，未见明显肝掌，心肺无异常发现，腹平软，无压痛，未扪及包块，肝右肋下2cm，质中等，无明显触痛，肝侧位可及，无移动性浊音。 现病史:患者3年前感乏力、食欲减退，肝功能检查发现转氨酶升高、HBsAg 阳性，经当地医院保肝治疗，效果不明显，间断有肝区不适等症状。近1个月来因症状加重而就诊。
#     ...    weight=
#     ...    assistCheck=肝功能：ALT 1945U/L，AST 1562U/L，血清白蛋白30g/L，球蛋白42g/L，TBIL 30μmol/L；血清乙肝标志物检测：HBsAg（＋），抗-HBs（－），HBeAg（＋），抗-HBe（－），抗-HBc（＋）
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    乙型病毒性肝炎

# 消化科经典病历8L-2
#     [Documentation]    断言:"慢性病毒性肝炎"
#     ${getRes}    智能诊断3.0
#     ...    age=33    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=既往体健无特殊传染病
#     ...    symptom=反复乏力，食欲低下，肝区不适3年#####慢性病容，神志清，巩膜轻度黄染，颜面及颈部有数枚蜘蛛痣，未见明显肝掌，心肺无异常发现，腹平软，无压痛，未扪及包块，肝右肋下2cm，质中等，无明显触痛，肝侧位可及，无移动性浊音。 现病史:患者3年前感乏力、食欲减退，肝功能检查发现转氨酶升高、HBsAg 阳性，经当地医院保肝治疗，效果不明显，间断有肝区不适等症状。近1个月来因症状加重而就诊。
#     ...    weight=
#     ...    assistCheck=肝功能：ALT 1945U/L，AST 1562U/L，血清白蛋白30g/L，球蛋白42g/L，TBIL 30μmol/L；血清乙肝标志物检测：HBsAg（＋），抗-HBs（－），HBeAg（＋），抗-HBe（－），抗-HBc（＋）
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    慢性病毒性肝炎


# 消化科经典病历9L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=20    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=70
#     ...    highBldPress=120
#     ...    lowBldPress=70
#     ...    personalHistory=高校学生
#     ...    previousHistory=既往体健，否认结核、肝炎、伤寒等传染病史。“国庆”期间曾与同学外出旅游2天。
#     ...    symptom=恶心、呕吐、腹痛3天#####急性病容，巩膜轻度黄染，未见皮疹和出血点。浅表淋巴结无肿大。心、肺（－）。腹平软，无明显压痛和反跳痛，肝肋下2cm，质软，轻触痛，脾未及，肠鸣音正常。 现病史:患者3天前突起畏寒、发热，全身乏力，体温39℃，自服“板蓝根”等药，第2天热退，出现恶心、呕吐，每天10余次，为胃内容物，量不多，无咖啡色样物。同时伴有腹泻、腹痛，大便黄色，为稀水样便，无脓血，每天4次。病后几乎未进食，小便浓茶样。
#     ...    weight=
#     ...    assistCheck=血细胞分析：Hb 135g/L，WBC 8.5×109/L，N 0.55，L 0.45，PLT 185×109/L
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性病毒性肝炎


# 消化科经典病历10L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=19    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=高校学生
#     ...    previousHistory=既往体健，否认结核、肝炎、伤寒等传染病史。“五一”期间曾与同学外出旅游3天。
#     ...    symptom=恶心、呕吐、腹痛4天#####急性病容，巩膜轻度黄染，未见皮疹和出血点。浅表淋巴结无肿大。心、肺未见异常。腹平软，无明显压痛和反跳痛，肝肋下1cm，质软，轻触痛，脾未及，肠鸣音正常。 现病史:患者4天前突起畏寒、发热，全身乏力，体温39.3℃，自服“抗病毒冲剂”等药，第2天热退，出现恶心、呕吐，同时伴有腹泻、腹痛，大便黄色，为稀水样便，无脓血。病后几乎未进食，小便浓茶样。
#     ...    weight=
#     ...    assistCheck=ALT 235U/L，AST 166U/L，TBIL 73μmol/L；尿液Bil（＋＋＋）；Uro（＋＋）；血清甲肝IgM抗体阳性；血清乙肝标志物检测：HBsAg（－），抗‐HBs（＋），HBeAg（－），抗‐HBe（－），抗‐HBc（－）；血清丙肝抗体检测（－）。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性病毒性肝炎


# 消化科经典病历11L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=37    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=右下腹痛12小时#####右下腹明显压痛，反跳痛，肌紧张，肝浊音界缩小，移动性浊音阳性 现病史:12小时前突起转移性右下腹痛，伴恶心、呕吐、发热
#     ...    weight=
#     ...    assistCheck=血常规白细胞17×109/L，N 0.88
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性腹膜炎


# 消化科经典病历12L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=75    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=64
#     ...    highBldPress=140
#     ...    lowBldPress=100
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=反复发作右上腹胀痛5年余，加重5天#####腹部平坦，未见胃肠型及蠕动波，无腹壁静脉曲张。腹软，右上腹部轻压痛，无反跳痛，无胃区震水音，未触及腹部及腹壁包块。肝脾肋下未触及肿大，Murphy征（-），麦氏点压痛。腹部叩诊呈鼓音，肝肾区无叩痛，移动性浊音（-）。肠鸣音5次/分。 现病史:患者5年前无诱因出现右上腹部疼痛，呈持续性胀痛，进食后疼痛尤为明显，间断行止痛抗感染治疗。近5天来，腹痛加重，伴纳差，腹胀，心悸，全身乏力，无恶心呕吐，无呕血。无头痛及头晕，无咳嗽及咳痰，无咯血及呼吸困难，无喘憋，无尿频、尿急及尿痛，无肉眼血尿。为求进一步诊治入院。自患病以来，神志清，精神一般，饮食差，睡眠欠佳，大小便正常。
#     ...    weight=
#     ...    assistCheck=腹部彩超：胆囊壁厚约0.3cm。血常规：WBC　10×109/L，中性细胞比率74．14%。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    慢性胆囊炎



# 消化科经典病历13L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=45    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36.2
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=90
#     ...    highBldPress=120
#     ...    lowBldPress=85
#     ...    personalHistory=
#     ...    previousHistory=无胆石症等胆道疾病，无手术史，否认肝炎、饮酒及服药史
#     ...    symptom=反复皮肤瘙痒5年，加重伴黄染半个月#####神志清楚，查体合作。皮肤巩膜中度黄染，心肺未见阳性体征，腹平软，无压痛，肝未触及、无叩痛，脾于左肋下2cm可触及，无压痛。移动性浊音阴性，双下肢无水肿。 现病史:患者近5年来无明显诱因反复出现皮肤瘙痒，常感乏力不适，无皮疹，曾服抗过敏药物治疗，症状时轻时重。近半个月来皮肤巩膜黄染，瘙痒加重，无发热、腹痛，体重无减轻。
#     ...    weight=
#     ...    assistCheck=尿胆原阳性。肝功能：总蛋白 61.4g/L、白蛋白 38.9g/L、球蛋白 22.5g/L、ALT 480U/L、AST 371U/L、ALP 134U/L、GGT 326U/L、TBA 196.2μmol/L、TBIL 99.9μmol/L、DBIL 67.7μmol/L、IBIL 32.2μmol/L；胆固醇 4.5μmol/L、甘油三酯 3.27mmol/L。MRCP 肝内外胆管变细、僵直，肝门区胆管显示欠佳。胆囊不大，壁稍厚，脾脏大。肝组织病理检查提示小胆管减少，胆管周围纤维组织明显增生。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    原发性硬化性胆管炎


# 消化科经典病历14L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=45    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37.2
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=70
#     ...    highBldPress=130
#     ...    lowBldPress=80
#     ...    personalHistory=
#     ...    previousHistory=体检发现脂肪肝3年余，肝功能正常未予治疗。
#     ...    symptom=反酸、胸骨后烧灼感半年，吞咽不畅、胸痛半月#####腹部稍膨，腹壁未见曲张静脉，剑突下压迫隐痛不适，全腹未扪及包块，肝脾肋下未触及。肝肾区叩击痛（-），移动性浊音（-），肠鸣音正常。 现病史:患者反酸、胸骨后烧灼感半年，常于饮酒后出现，反酸以进食后或卧位明显，空腹时或坐立位减轻，曾经间断服用“铝碳酸镁”等药物，烧心症状稍有减轻，但仍有反酸。近半月来渐出现胸骨后不适感，伴有间隙性吞咽不畅和轻度胸痛。病程中时有嗳气、反胃，伴有上腹饱胀不适。食欲稍差，二便正常。无反复咳嗽、喘息，无呕血、黑便，无节律性上腹痛，近期无明显消瘦。
#     ...    weight=
#     ...    assistCheck=B超提示脂肪肝。肝肾功能正常，甘油三酯轻度增高，血糖正常。24小时pH监测提示酸反流。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    胃食管反流病



# 消化科经典病历15L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=44    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=76
#     ...    highBldPress=105
#     ...    lowBldPress=75
#     ...    personalHistory=
#     ...    previousHistory=身体健康，无外伤及手术史，无药物过敏史
#     ...    symptom=咽下困难5年，加重伴胸骨后疼痛1年#####营养中等，皮肤黏膜无黄染，浅表淋巴结未触及肿大，心肺未见异常，未见胃肠型、蠕动波，腹软，振水音（－），肝脾肋下未触及，移动性浊音（－），肠鸣音正常。 现病史:患者于5年前无明显诱因出现咽下困难，开始进硬质食物时明显，用水送服后食物可咽下，近1年出现上述症状加重，同时出现进食时胸骨后疼痛，不能进硬食，经 常有食物反流至咽喉部引起咳嗽，无恶心、呕吐、腹痛、嗳气、腹胀、腹泻、黑便，无黄疸、鼻出血、胸痛，曾服用硝苯地平治疗，症状一度缓解，近1年服用该药物无明显效果，为进一步诊治收入院。自发病以来，患者食欲尚好，睡眠及大小便正常，体重减轻约10kg。
#     ...    weight=
#     ...    assistCheck=食管造影：食管下端呈鸟嘴样狭窄
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    贲门失弛缓症


# 消化科经典病历16L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=73    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=110
#     ...    highBldPress=85
#     ...    lowBldPress=50
#     ...    personalHistory=
#     ...    previousHistory=1个月前患者曾心肌梗死入住心内科，行冠状动脉支架植入术，术后规律服用氯吡格雷及阿司匹林双抗治疗。
#     ...    symptom=呕吐咖啡样胃内容物9小时#####贫血貌，双肺呼吸音清。腹平软，无压痛或反跳痛，肝脾肋下未触及，肠鸣音活跃。 现病史:患者入院前9小时无明显诱因出现眩晕，伴剧烈呕吐，先呕出胃内容物，继而出现呕血，为暗红色血液，总量约600ml，并伴头昏、心慌。
#     ...    weight=
#     ...    assistCheck=血红蛋白65g/L。胃镜下见食管贲门处黏膜12点、3点处线性撕裂伤，有活动性鲜血渗出，胃腔内大量咖啡样胃液，球部未见明显病变。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    食管贲门粘膜撕裂综合征


# 消化科经典病历17L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=26    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=38.2
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=90
#     ...    highBldPress=118
#     ...    lowBldPress=72
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=腹痛、腹泻、发热2天#####一般情况尚可，腹平软，左下腹轻压痛，肠鸣音活跃。 现病史:患者2天前进食剩饭、剩菜后出现腹痛和腹泻，腹痛为下腹阵发性绞痛，便前重，便后缓解，无放射痛，大便为黄色稀水样便，后为黏液脓血便，每日解5～7次，有里急后重感，稍感恶心，曾呕吐两次，非喷射性，为胃内容物，量不多，有轻微的畏寒、发热，自服“藿香正气液”，症状无缓解。发病来精神、睡眠欠佳，食欲差，尿量较少，体重无明显下降。
#     ...    weight=
#     ...    assistCheck=血常规：WBC 13.3×109/L，N 80%，L 14%，E 0.5%，M 5.5%，RBC 4.1 ×1012/L，HGB 145g/L，PLT 246×109/L。肝功能正常。肾功能正常。电解质：K＋3﹒8mmol/L，Na＋132﹒2mmol/L，CL－90﹒1mmol/L。血、尿淀粉酶正常。尿常规正常。大便常规：黏液脓血便，WBC 满视野，RBC 满视野，脓细胞4～7/HP，吞噬细胞3～5/HP，OB（＋），动力试验阴性。腹部B超正常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性细菌性痢疾


# 消化科经典病历18L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=67   ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=36
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=85
#     ...    highBldPress=128
#     ...    lowBldPress=77
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=上腹部隐痛、恶心、欲吐1天#####心肺（—）。腹平坦，未见胃肠型及蠕动波，未见腹壁静脉曲张，腹软，剑突下压痛，无反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性，肝浊音界位于右胸锁骨中线第5 肋间，肝区、脾区及双肾区无叩痛，肠鸣音4次/分，无气过水声。 现病史:患者1天前晚餐进食凉菜及冰冻西瓜后稍感上腹部隐痛不适，疼痛部位较固定，无明显放射，间断发作，疼痛发作时感恶心、欲吐，伴食欲降低，无畏寒、发热、黄疸、胸痛、胸闷、反酸、嗳气。肛门排气、排便正常。自患病以来，精神、睡眠差、未进食，大小便正常，体重无明显变化。
#     ...    weight=
#     ...    assistCheck=血常规示：WBC 6.5×109/L，HGB 123g/L，PL T 202×109/L。胃镜检查示：胃体黏膜充血肿胀。血尿淀粉酶正常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性胃炎



# 消化科经典病历19L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=60    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=吸烟20年，10支/天，其兄死于“消化道肿瘤”。
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=上腹部隐痛不适2个月#####一般状况尚可，浅表淋巴结未及肿大，皮肤无黄染，结膜甲床苍白，心肺未见异常，腹平坦，未见胃肠型及蠕动波，腹软，肝脾未及，腹部未及包块，剑突下深压痛，无肌紧张，移动性浊音（－），肠鸣音正常，直肠指检未及异常。 现病史:患者2个月前出现上腹部隐痛不适，进食后明显，伴饱胀感，食欲逐渐下降，无明显恶心、呕吐及呕血，治疗后稍好转。近半月自觉乏力，体重较2个月前下降6kg。近日大便色黑。
#     ...    weight=
#     ...    assistCheck=大便潜血（＋），血Hb 96g/L。上消化道钡剂造影示：胃角见约3cm大小龛影，位于胃轮廓内，周围黏膜僵硬粗糙；腹部B超检查未见肝异常，胃肠部分检查不满意。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    胃癌


# 消化科经典病历20L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=40    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=腹泻2个月、便血11天#####生命体征平稳，贫血貌，心肺未见明显异常阳性体征，腹平、软，无压痛、反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性。双下肢无水肿。 现病史:患者2个月前无明显诱因出现腹泻，每日黄色稀便2～3次，不成形，无黏液脓血，不伴腹痛、腹胀、里急后重、畏寒、发热，未予特殊处理。11天前患者进食辛辣食物后，出现便血，鲜红色血液便，共5次，量不多，伴夜间潮热、盗汗、食欲减退等表现，无腹痛、腹胀、里急后重，无黏液脓血，无便不尽感，无头昏、心慌、乏力等表现。患者患病以来，精神欠佳，食欲尚可，大便如上述，小便基本正常，体重下降约4kg。
#     ...    weight=
#     ...    assistCheck=血常规示WBC 4.85 ×109/L，Hb 69.2g/L，PLT 225×109/L，N 70.11%。肝、肾功能正常。电解质示血钾3.31mmol/L，血氯111.5mmol/L，余无异常。血沉为51mm/h，大小便常规无异常，大便隐血阴性。PPD（＋＋＋）。腹部彩超示：①右肝钙化灶；②左肾小囊肿；③胰、脾、右肾超声未见明显异常。心电图正常。胸片示右肋膈角胸膜增厚。肠镜示：升结肠、结肠肝曲各见一糜烂，黏膜颗粒不平，息肉样增生，回盲部及升结肠见多个息肉，黏膜活检示：黏膜组织慢性炎症。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    肠结核





# 消化科经典病历21L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=72    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=反复腹泻、黏液脓血便17年，再发3个月，加重伴腹痛1周余#####心、肺未见异常，腹部平坦，未见肠型及蠕动波，无腹壁静脉曲张，全腹软，左下腹部压痛，无反跳痛及肌紧张，未扪及包块，肝、脾肋缘下均未扪及，肝、脾、双肾区无叩痛，移动性浊音阴性，肠鸣音正常，未闻及气过水声。双下肢无水肿。 现病史:患者17年前无明显诱因开始出现腹泻，为黏液脓血便，具体次数不详，每天最多20 余次，每次量少，伴发热、里急后重感，最高体温为41.0℃，无反酸、恶心、呕吐、腹痛，无咳嗽、咳痰、心慌、胸闷、气短等，对症治疗后缓解。3个月前，上述症状再次发作，药物治疗无明显好转。近1周来腹泻逐渐加重，每天20余次，量少，为黏液脓血便，伴厌食、恶心、腹痛，腹痛以左下腹部为主，为间断性隐痛，无放射痛，最长持续几分钟，便后腹痛可缓解。
#     ...    weight=
#     ...    assistCheck=血常规：Hb 108g/L、WBC 4.8 ×109/L、N 74%；凝血三项基本正常；肝功示Alb 33.2g/L，余正常；尿常规示尿酮体阳性，余正常；乙肝两对半阴性；肾功示血钾3.06mmol/L、钠129.2mmol/L；大便隐血试验阳性，大便常规示白细胞0～3/HP、红细胞0～2/HP；大便普通培养无致病菌生长；胸片示双肺未见异常，胸椎骨质增生；心电图示窦性心律。行肠镜检查示全结直肠黏膜弥漫性充血、糜烂，并见息肉样增生，黏膜质脆易出血，印象：全结直肠病变，考虑炎症性肠病。病理结果示（结肠）黏膜组织慢性炎伴局部糜烂及中性粒细胞浸润。多肿瘤标志物蛋白芯片检查未见异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    溃疡性结肠炎



# 消化科经典病历22L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=26    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=腹痛、纳差6个月，腹泻、消瘦3月余#####生命体征平稳，体型消瘦，皮肤黏膜无苍白黄染，无口舌溃疡，无杵状指（趾），心肺未见异常阳性体征，腹平、软，无压痛、反跳痛及肌紧张，肝脾肋下未触及，腹部叩诊呈鼓音，移动性浊音阴性。双下肢无水肿。 现病史:患者6个月前无明显诱因出现间歇性上腹隐痛不适，以下午及夜间较明显，与进食、体位、排便无明显关系，精神食欲差，伴反酸、嗳气，无潮热盗汗，无腹泻、呕血、便血、黑便，无头昏、心悸、黄疸。予抑酸、对症支持治疗，腹痛无明显缓解。3个月前逐渐出现腹泻，4～5次/天，大便呈黄色糊状，内含少量食物残渣，无黏液脓血，仍有间歇性上腹隐痛，伴反酸、嗳气、消瘦、纳差。患者患病以来，精神食欲差，小便正常，大便如前述，体重下降15kg。
#     ...    weight=
#     ...    assistCheck=血常规示WBC 6.40 ×109/L，RBC 3.53×1012/L，HGB 88g/L，HCT 28.8，PLT 364×109/L，NEUT 69.4%；肝功示ALT 5U/L，AST 6U/L，GGT 12U/L，ALP 81U/L，TP 62.2g/L，Alb 26.9g/L，TBIL 6.1μmol/L，DBIL 1.1μmol/L，肾功示电解质：钾3.47mmol/L，余正常，乙肝三对、输血前ICT均阴性，大小便常规、凝血三项均正常，大便培养未见虫卵。多肿瘤标志物均阴性。妇科超声示：子宫体、卵巢超声未见明显异常。上腹部增强CT示：小肠、结肠肠壁增厚改变，肠系膜淋巴结肿大，考虑感染可能性大。结肠镜检查：乙状结肠横结肠见横形溃疡，底部糜烂，有周围增生性息肉隆起，呈节段性分布。升结肠及回盲部见大量息肉样隆起，广泛直径0.1～0.2cm憩室腔，肠壁增厚变硬，肠腔狭窄。回盲瓣变形未闭，未能观察回肠末端。病理示：（回盲部）黏膜组织慢性炎症伴部分炎性坏死。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    克罗恩病


# 消化科经典病历23L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=42    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=纳差、上腹肿物感、消瘦1年余#####体温、血压正常范围，明显消瘦，浅表淋巴结无肿大，皮肤黏膜无黄染，无肝掌、蜘蛛痣，心肺听诊无异常，腹软、上腹部有压痛，未见包块，肝脾未触及，腹水征阴性。 现病史:1年前因其姐姐患胃癌后感上腹不适、纳差、进食量逐渐减少，上腹肿物感，唯恐自己患了与姐姐同样的病，夜间入睡差。发病后二便正常，食欲差，睡眠不好，体重减轻7kg。
#     ...    weight=
#     ...    assistCheck=血、尿、大便常规检查，肝功能、腹部B超、胸片、心电图及胃肠镜检查均无明显异常。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    消化不良


# 消化科经典病历24L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=43    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=37.8
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=120
#     ...    highBldPress=130
#     ...    lowBldPress=90
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=腹痛、恶心、呕吐2天#####心肺未见异常。中上腹压痛、反跳痛，肌稍紧张，肝脾肋下未触及，Murphy 征阴性，肝上界位于右锁骨中线第5 肋间，肝脾肾区无叩痛，移动性浊音阴性，听诊肠鸣音正常，未闻及气过水声及血管杂音。 现病史:患者2天前进食过量油腻食物后出现上腹疼痛，呈持续性胀痛，并向肩、背部放射，前倾位后可稍减轻。伴恶心、呕吐，共3次，为胃内容物，非喷射状。无头晕、头痛、发热、寒战，无返酸、嗳气、呕血，无腹泻、黑便等，予以输液治疗，症状仍无缓解。发病以来，精神差，未进食，大小便正常，体重无明显变化。
#     ...    weight=
#     ...    assistCheck=肝功：ALT 90U/L，AST 17U/L，GGT 140U/L，ALP 248U/L，TP 62g/L，Alb 24.1g/L；血常规WBC 16.37×109/L，Hb 101.2g/L，N 0.92；尿淀粉酶2228.7U/L，血淀粉酶687.4U/L；肾功：血钠133.7mmol/L，血磷0.61mmol/L；心电图提示：窦性心动过速。腹部立卧位片未见明显异常。CT提示：胰腺边缘模糊，周围大片状炎性渗出，增强扫描，胰腺强化不均匀。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    急性胰腺炎


# 消化科经典病历25L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=57    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=间断上腹隐痛2年#####腹平坦，腹软，剑突下压痛，无反跳痛、肌紧张，肠鸣音正常，余（－）。 现病史:间断上腹隐痛2年#####腹平坦，腹软，剑突下压痛，无反跳痛、肌紧张，肠鸣音正常，余（－）。
#     ...    weight=
#     ...    assistCheck=血常规正常。胃镜提示食管下段可见条索状黏膜充血、糜烂，胃黏膜可见散在充血水肿。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    慢性胃炎


# 消化科经典病历26L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=34    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=上腹饱胀、恶心、呕吐3个月，加重1周#####消瘦、皮肤干燥、脱水，腹部可见胃型及胃蠕动波，无压痛、反跳痛，未触及肿块，可闻及振水音，肠鸣音稍弱，移动性浊音阴性。 现病史:无消化道溃疡病史，呕吐间歇发作，最近1周加重，量大，主要是所进食物，含有胆汁。仅有饱胀感，无明显腹痛，亦不影响食欲，俯卧或胸膝位时，呕吐及饱胀感减轻。
#     ...    weight=
#     ...    assistCheck=纤维胃镜检查可见胃及十二指肠扩张，潴留液较多，且有胆汁反流，幽门口开放。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    十二指肠淤积


# 消化科经典病历27L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=28    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=39
#     ...    familyHistory=
#     ...    gender=0
#     ...    heartRate=88
#     ...    highBldPress=109
#     ...    lowBldPress=63
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=恶心、呕吐20天，发热、腹胀1周#####神清，精神可。皮肤巩膜无黄染，未及全身浅表淋巴结，颈静脉无充盈，肝颈静脉回流征阴性；心肺查体无异常；腹膨隆，无腹壁静脉曲张，未见胃肠型及蠕动波，腹肌柔韧，有揉面感，无压痛，无反跳痛，全腹未及包块，肝脾未及肿大，移动性浊音（＋），肠鸣音6次/分。双下肢无凹陷性水肿。 现病史:患者20天前出现恶心、呕吐，进食或饮水后几分钟即吐出，无呕血、腹痛、吞咽困难，无视物旋转。1周前出现腹胀，自觉腹围进行性增大，伴发热、盗汗、腹水。无头晕、胸闷、心慌、气喘。患者食欲减退，1周来尿量明显减少，体重下降3kg。
#     ...    weight=
#     ...    assistCheck=胸片：正常；血常规：WBC3.0×109/L，N78.2%，RBC3.85×1012/L，Hb93g/L，PLT 336×109/L，尿常规：胆红素2＋，尿蛋白2＋。粪常规正常。生化检查ALT、AST、TB、DB均正常，ALB30.7g/L；凝血三项、心肌酶谱、ANCA正常。CA125340U/ml，AFP、CA724、CA199、CA153均正常，肺癌三项示NSE36.46ng/ml。全腹CT：大量腹水，网膜密度增高，局部胃壁及肠壁稍厚。腹水常规：黄色，浑浊，白细胞计数0.26×109/L，N10.0%，L90.0%，蛋白定性阳性；腹水生化示LDH429U/L，ALB26.8g/L，ADA46.7U/L，腹水CA125433U/ml。PPD试验：阴性。心电图在正常范围。抗心磷脂抗体：12.1RU/ml。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    结核性腹膜炎




# 消化科经典病历28L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=2    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=38.5
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=120
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=发热6小时、腹泻1小时伴惊厥1次#####神委思睡，反应较差，面色苍白，皮肤未见大理石花纹；颈阻阴性；双侧瞳孔等大等圆，直径0.2cm，对光反射存在；双肺呼吸音粗；心音低钝，律齐；腹软不胀，肝肋下2.0cm，质软缘锐，四肢肌张力高，手足稍凉，甲床微绀。病理征阴性。肛指检查：见黏液血丝便。 现病史:患者6小时前开始出现发热、畏寒、寒战，神委、思睡，有恶心，无皮疹、咳嗽、呕吐，1小时前出现腹泻稀水样便含少量粪质，可见黏液少许血丝，伴有里急后重；尿量减少；面色差，并突然出现双眼凝视，牙关紧闭，口吐白沫，四肢强直性抽动。病前有可疑不洁饮食史（冰冻西瓜）。
#     ...    weight=
#     ...    assistCheck=WBC 19.5 ×10 9/L，N 0.85，L 0.15，Hb 125g/L，PLT 385×10 9/L；大便常规为黏液血丝便，WBC ＋＋＋，RBC ＋，吞噬细胞5～8/HP。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj}    中毒型细菌性痢疾



# 消化科经典病历29L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=45    ageType=岁
#     ...    allergyHistory=
#     ...    bodyTempr=39.2
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=98
#     ...    highBldPress=113
#     ...    lowBldPress=68
#     ...    personalHistory=
#     ...    previousHistory=
#     ...    symptom=发热、肝区闷痛3周#####神志清，对答切题，定向力良好，急性病容。皮肤巩膜无黄染，未见肝掌及蜘蛛痣，全身未见出血点。心肺体检未见异常。腹软，无压痛、反跳痛，肝肋下约1.0cm，剑突下2.5cm，质地软，边缘光滑，触痛明显，脾肋下未触及，肝区轻度叩痛，移动性浊音阴性，双下肢无水肿。 现病史:患者近3周来无诱因出现高热、寒战。病后乏力明显，感肝区闷痛。当地曾用环丙沙星等药治疗5天无效就诊。
#     ...    weight=
#     ...    assistCheck=血常规：白细胞20.4×109/L，N 0.86。ESR 142mm/1h。腹部B超检查:肝右叶最大径14.7cm，右肝后叶及左肝各有一7.6cm×5.6cm×6.0cm及9.8cm×8.4cm×8.5cm低回声区，边缘不规则，其内回声不匀，有少许不规则液性暗区。肝穿刺液培养有类鼻疽假单胞菌生长。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    细菌性肝脓肿



# 消化科经典病历30L
#     [Documentation]    断言:""
#     ${getRes}    智能诊断3.0
#     ...    age=10    ageType=月
#     ...    allergyHistory=
#     ...    bodyTempr=38
#     ...    familyHistory=
#     ...    gender=1
#     ...    heartRate=135
#     ...    highBldPress=
#     ...    lowBldPress=
#     ...    personalHistory=
#     ...    previousHistory=邻居家中有类似腹泻患儿，该患儿与邻居类似病儿有接触史。
#     ...    symptom=发热伴腹泻蛋花水样便2天#####轻度脱水貌，无皮疹，咽部充血，扁桃体无肿大，双肺呼吸音清楚，无干湿啰音，心音有力律齐，胸骨左缘未闻及杂音，腹软不胀，四肢端暖和。 现病史:就诊前2天患儿出现发热，体温37.8～38.5℃，无寒战及抽搐，同时腹泻稀水样便，呈蛋花水样便，一天4～5次，每次量较多，无黏液及脓血，解大便时无坠胀，伴呕吐2次，呕吐物为胃内容物，无胆汁及咖啡色液体，呈非喷射状，无咳嗽及喉喘，无流涕，病后患儿口渴喜饮，哭时泪稍少，尿量稍减少，精神食欲下降。
#     ...    weight=
#     ...    assistCheck=大便常规：无白细胞、红细胞及吞噬细胞，仅见脂肪球。大便轮状病毒抗原阳性。
#     ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
#     Should Contain    ${aj[:10]}    轮状病毒肠炎



消化科经典病历31L
    [Documentation]    断言:""
    ${getRes}    智能诊断3.0
    ...    age=    ageType=岁
    ...    allergyHistory=
    ...    bodyTempr=
    ...    familyHistory=
    ...    gender=
    ...    heartRate=
    ...    highBldPress=
    ...    lowBldPress=
    ...    personalHistory=
    ...    previousHistory=
    ...    symptom= 现病史:
    ...    weight=
    ...    assistCheck=
    ...    examInfo=    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroupMap']["3"]]
    Should Contain    ${aj[:10]}    胆石病
