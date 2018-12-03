*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
识别接口出血缺血风险回归
    患者既往有“夜间阵发性呼吸困难”病史。    夜间阵发性呼吸困难
    患者胸闷憋气，夜间加重，夜间入睡后经常憋醒，呼吸困难，端坐呼吸。    夜间阵发性呼吸困难
    患者上楼梯后呼吸困难加重。    劳力性呼吸困难
    患者行走后呼吸困难加重。    劳力性呼吸困难
    患者自诉胸闷、憋气，夜间睡眠差，不能平卧，夜间入睡后经常被憋醒。查体：神志清楚，端坐呼吸，呼吸急促，口唇紫绀，双肺满布湿罗音；心率：100次/分，心律不齐，肺动脉瓣区舒张期奔马律，双下肢水肿。    腿部水肿
    患者双下肢水肿，肿胀疼痛。    腿部水肿
    双下肢水肿及腹部水肿，按下时有凹陷。咳嗽、劳累时有呼吸困难。    腹部水肿
    双肺满布湿罗音；，双下肢水肿。    下肢水肿
    心率：100次/分，心律不齐，肺动脉瓣区舒张期奔马律。    奔马律
    初步诊断：急性肺水肿。    急性肺水肿
    患者十年前确诊为1型糖尿病，一直口服药物治疗。    糖尿病
    患者确诊为2型糖尿病。    糖尿病
    患者2年前确诊为“下肢静脉曲张”，未治疗。    外周血管疾病史
    “脑卒中”病史10年。    卒中史
    患者既往有“脑梗塞”病史。    卒中史
    既往患有缺血性脑卒中。    卒中史
    胃镜检查可见胃底部有活动性出血灶。    活动性出血
    患者2年前曾因“脑出血”住院治疗。    脑出血病史
    2年前确诊为“小脑出血”，经治疗后好转。    脑出血病史
    患者半年前查胃镜诊断为“十二指肠球部溃疡”，一直口服药物治疗，目前仍未痊愈。    未治愈的消化道溃疡史
    患者曾患“胃溃疡出血”，一直服用药物治疗，至今未痊愈。    未治愈的消化道出血病史
    患者1个月前因车祸导致“颅内出血”，至今仍住院治疗。    颅内损伤<=3个月
    患者2个月前从高处跌落，造成左侧颧骨骨折，左侧面部软组织损伤严重，面部肿胀，眼周青紫。    面部严重损伤<=3个月
    患者以头痛伴四肢抽搐半年加重10天入院，颅脑MRI及对症检查后确诊为：颅内胶质母细胞瘤    颅内恶性肿瘤
    患者为出血性体质，建议减少抗凝药应用。    出血体质
    患者既往患有“血管性血友病”病史。    血友病
    最后诊断：血友病甲。    血友病
    初步诊断：血小板减少症。    血小板减少症
     患者经常无明显诱因出现皮肤粘膜瘀点、瘀斑。查体：脾脏轻度增大。入院检查：血小板计数25万/μl。怀疑“血小板减少症”。    血小板减少症
    父亲因肝硬化导致凝血功能障碍    凝血功能障碍
    患者肝硬化晚期，经常有鼻衄、牙龈出血，间断黑便等凝血功能异常表现。    凝血功能障碍
    患者大出血后出现血压降低，四肢湿冷，皮肤花斑，少尿等不适，血压：70/30mmHg，心率102次/分。肺毛细血管嵌顿压(PCWP)5mmHg,右心房压(RAP)6mmHg。    血流动力学不稳定
    患者血流动力学检查异常。    血流动力学不稳定
    患者血压进行性降低，出现昏迷，四肢湿冷，少尿等症状。    进行性低血压
    诊断：低血容量性休克。    休克
    初步诊断：出血性休克。    休克
    最后诊断：心源性休克。    休克
    诊断：急性充血性心力衰竭。    急性心力衰竭
    缺血性胸痛，进行性加重。    进行性缺血性胸痛
    患者因“胸前区疼痛，进行性加重5小时”就诊，急诊查心电图、超声心动图及生化后，确诊为“前壁心肌梗死”。    进行性缺血性胸痛
    患者1小时前突然晕倒，急诊送院。    晕厥
    既往有“一过性晕厥”病史。    晕厥
    胡言乱语，意识不清。    意识障碍
    昏迷嗜睡，意识模糊。    意识障碍
    患者突然休克，急诊心电图提示：广泛前壁心肌梗死。    心源性休克
    心前区疼痛5小时，加重30分钟来诊。患者1年前确诊心绞痛，坚持口服抗凝扩冠药物治疗。    用药后复发性胸痛
    患者，男性，50岁，以“发热、胸痛”入院，胸痛呈持续性，舌下含服硝酸甘油后，胸痛未能缓解。    用药后持续性胸痛
    心电图提示：尖端扭转型室速。    尖端扭转型室速
    诊断：心律失常 阵发性室上速。    阵发性室上性心动过速
    初步诊断：阵发性室性心动过速。    阵发性室性心动过速
    患者突然心悸，胸闷，急查心电图示：室性心动过缓，几分钟后心脏骤停，患者死亡。    心脏骤停
    当地医院心电图提示“多形性室性心动过速”。    危重心律失常
    患者急诊心电图示“室颤”，立即药物除颤。    危重心律失常
    诊断：心律失常 窦性停搏。    窦性停搏
    诊断：病窦综合征。    病态窦房结综合征
    诊断：窦房传导阻滞    窦房传导阻滞
    心房颤动伴快速心室率。    快速心室率的房颤
    入院后胸闷、气急、不能平卧，尿少，全身浮肿，心律不齐，心率120次/min，经心电图检查为心房纤颤。    快速心室率的房颤
    确诊为：心律失常，Ⅲ度房室传导阻滞。    高度房室传导阻滞
    诊断：Ⅱ度二型房室传导阻滞。    高度房室传导阻滞
    诊断：完全性房室传导阻滞。    三度房室传导阻滞>=3度
    心电图示：室颤    心室颤动
    心电图示：室扑    心室扑动
    WPW综合征。    预激综合征
    诊断：阵发性室上性心动过速。    快速性心律失常
    诊断：房性心动过速。    快速性心律失常
    诊断：快速房颤。    快速性心律失常
    诊断：下壁心肌梗死。    心肌梗死
    诊断：急性心肌梗死并发左室游离壁破裂乳头肌断裂。    心肌梗死
    超声心动图示：左心室乳头肌部分断裂。    左室乳头肌断裂
    超声心动图示：左室前壁游离壁破裂    游离壁破裂
    诊断：急性心肌梗死并发左室游离壁破裂    游离壁破裂
    超声心动图：室间隔穿孔。    室间隔穿孔
    诊断：冠心病合并室间隔穿孔。    室间隔穿孔
    超声心动图检查：室间隔破裂,左向右分流。    室间隔破裂
    游离壁破裂    心肌梗死机械性并发症
    室间隔穿孔    心肌梗死机械性并发症
    室间隔破裂    心肌梗死机械性并发症
    患者胸痛持续30分钟不缓解，伴有面色苍白，冷汗淋漓。舌下含服硝酸甘油胸痛不缓解。初步诊断为“顽固性心绞痛”。    顽固性心绞痛
    心电图显示：Ⅱ、Ⅲ、aVF导联ST段水平下移。    ST段下移
    查心电图示：Ⅲ、avF导联ST段抬高0.05-0.1mv，Ⅰ、avL导联，V3-V5导联ST段压低0.05-0.1mv伴T波负正双向，    ST段下移
    行心电图检查示窦性心动过速，I、II导联ST段压低，AVR导联ST段抬高0.1mv，V1-V2导联可见病理性Q波，V5-V6导联ST段压低。    ST段下移
    进行动态心电图检测，发现ST-T改变，ST段明显压低。    ST段下移
    入院时行心电图检查提示前壁导联T波高尖，入院第二天，患者心电图检查提示胸前导联广泛T波倒置，与前一天心电图检查相比，ST段有明显动态演变    ST段重复性动态演变
    患者伴或不伴有胸痛，动态心电图显示：T波随时间变化，间断出现T波低平或倒置。    T波重复性动态演变
    24小时动态心电图提示：st段间歇性抬高改变。    间歇性ST段抬高
    肌钙蛋白I升高    肌钙蛋白升高
    cTnI 0.76 μg/L    肌钙蛋白升高
    心肌钙蛋白T升高    肌钙蛋白升高
    急诊心电图(图1)见V3~6导联ST段抬高以及胸前导联的高尖T波。急诊科考虑急性心肌梗死，请心内科会诊。当心内科医生到达急诊科会诊时，患者心电图(图2)演变为V1~3 导联ST段上斜型压低，胸前导联T波高尖对称，立即开通绿色通道行冠脉造影。    ST-T动态演变
    ST－T异常，并呈动态演变。    ST-T动态演变
    GRACE评分 150    GRACE评分>140
    GRACE评分 160分    GRACE评分>140
    肾功能不全三期    肾功能不全分期>=2期
    慢性肾脏病4期    肾功能不全分期>=2期
    患者有慢性肾衰竭病史，门诊查：GFR 10ml/min·1.73m2。    肾功能不全分期>=2期
    eGFR 50ml/min/1.73m2    eGFR<60ml/min/1.73m2
    LVEF 30%    LVEF<40%
    左心室射血分数 38%    LVEF<40%
    初步诊断：急性充血性心力衰竭。    充血性心力衰竭
    GRACE评分 140    GRACE评分(109-140]
    GRACE评分 110分    GRACE评分(109-140]
    患者一月前因心绞痛住院治疗，出院后常规服药，病情稳定，1天前因劳累再次诱发心绞痛发作，急诊就诊。    复发心绞痛
    患者，男，78岁，在劳累后出现心前区疼痛，呈压榨性，含服硝酸甘油后可缓解，门诊初步诊断为“冠心病 不稳定性心绞痛”；患者既往心绞痛病史10年，间断发作，长期口服药物治疗。    复发心绞痛
    入院诊断：冠心病 心肌缺血。    心肌缺血
    心电图提示：心肌缺血。    心肌缺血
    无复发性胸痛,无心衰,入院后6-12h内无新的心电图演变,入院后6-12h多次复查 cTn均 为阴性。    无复发性胸痛
    患者因“胸闷、心慌，心前区疼痛1天，加重2小时”入院，无夜间阵发性呼吸困难，无下肢水肿。    无夜间阵发性呼吸困难
    患者因“胸闷、心慌、气短”入院，无咳粉红色泡沫痰，无劳力性呼吸困难。    无劳力性呼吸困难
    患者无劳力性呼吸困难，无下肢肿胀。    无劳力性呼吸困难
    下肢无水肿。    无腿部水肿
    下肢水肿（-）。    无腿部水肿
    腹部无水肿。    无腹部水肿
    腹部水肿（-）。    无腹部水肿
    腿部无水肿。    无下肢水肿
    双下肢水肿（-）。    无下肢水肿
    心脏各瓣膜听诊区未闻及病理性杂音。    无奔马律
    肺动脉瓣听诊区未闻及奔马律。    无奔马律
    患者“胸闷胸痛、气短、乏力”入院，无粉红色泡沫痰，无急性肺水肿表现。    无急性肺水肿
    患者因“剧烈胸痛2小时”入院，心电图提示：心肌供血不足。对症治疗后胸痛缓解。6小时后复查心电图未见明显异常改变。    入院6-12h内无新的心电图演变
    患者因“胸痛1天，加重1小时”入院。入院时查心肌酶未见异常，入院8小时复查心肌酶：cTnI 0.03 μg/L，CTNT 0.1 μg/L,心电图未见异常，排除心肌梗死。    入院6-12h cTnI阴性
    最低收缩压为170mmHg。    收缩压>160mmHg
    血压：175/80mmHg。    收缩压>160mmHg
    5年前诊断为“慢性乙型病毒性肝炎”。    慢性肝病
    肝脏超声提示：肝脏纤维化改变。    肝纤维化
    患者，男，20岁，生化检查：胆红素600μmol/L。请用最新版测试病历测试    胆红素>2倍正常值上限
    丙氨酸转氨酶 250U/L 。    丙氨酸转氨酶>3倍正常值上限
    谷丙转氨酶 1170U/L 。    丙氨酸转氨酶>3倍正常值上限
    患者因慢性肾功能衰竭定期进行血液透析。    透析
    患者因急性药物中毒急诊给予腹膜透析。    透析
    患者，男，60岁，主因"慢性肾功能不全尿毒症期"于2015年12月20日入院。2015年12月20日行同种异体肾移植手术    肾移植
    受者，女性，36岁。原发病：慢性肾小球肾炎(无活检)，2002年首次移植，移植肾失功(无活检)。    肾移植
    患者，男，44 岁，2004 年 9 月 13 日行肾移植术    肾移植
    血清肌酐 200μmol/L    血清肌酐>=200μmol/L
    Scr 260μmol/L    血清肌酐>=200μmol/L
    最后诊断：缺血性脑卒中。    脑卒中
    既往脑出血病史。    脑卒中
    既往健康无结核病史,吸烟史 20 余年,每天超过 20 支,嗜酒。    嗜酒
    产后第二天突发肺栓塞，出院四个月一直服华法林钠，但INR一直不稳定，最近出现胸闷气短，监测INR值为1.48    INR不稳定
    服用华法林9个月，INR监测有3个月达标。    INR达标<60%
    既往脑出血病史。    出血史
    1年前因胃溃疡引起呕血、黑便，治疗后好转。    出血史
    患者经常无诱因出现牙龈出血，皮肤瘀斑瘀点，门诊查血常规：血小板50×109／L。    出血倾向
    患者肝硬化晚期，凝血功能障碍，经常有牙龈出血，鼻出血，皮肤瘀斑瘀点等症状。    出血倾向
    超声心动图发现左心室收缩功能降低。    左心室收缩期功能障碍
    患者血压：150/90mmHg。    收缩压>140mmHg
    收缩压最低为145mmHg。    收缩压>140mmHg
    患者血压：150/95mmHg。    舒张压>90mmHg
    舒张压：100mmHg。    舒张压>90mmHg
    患者血压：170/90mmHg。    高血压
    患者收缩压最低位160mmHg。诊断为高血压。    高血压
    患者既往有短暂性脑缺血发作病史。    短暂性脑缺血发作病史
    半年前确诊“TIA”，间断服药。    短暂性脑缺血发作病史
    有下肢静脉血栓栓塞病史。    血栓栓塞病史
    患者有肺栓塞病史。    血栓栓塞病史
    下肢静脉曲张    血管性疾病
    下肢动脉粥样硬化    血管性疾病
    血栓闭塞性脉管炎    周围血管动脉性疾病
    下肢动脉硬化性闭塞症    周围血管动脉性疾病
    下壁心肌梗死    心肌梗死
    广泛前壁心肌梗塞    心肌梗死
    超声检查发现腹主动脉斑块形成。    主动脉斑块
    脑出血病史1年。    出血性脑卒中病史
    男，79岁，以两下肢发沉及麻木感2个月加重8天入院，头颅核磁检查发现：“大脑胶质瘤病”，入院后病情逐渐加重，逐渐出现两下肢完全瘫，胸6以下感觉消失，伴大小便障碍。    颅内肿瘤活动期
    患者，女性，48岁，阵发性头痛20余年，近半年加重，以前额部为主，头痛时恶心、呕吐，3周前癫痫大发作1次，表现为意识丧失，四肢抽搐，约1分钟后缓解，来院行MRI示“左额矢状窦旁脑膜瘤”，收入院手术治疗。    颅内肿瘤活动期
    颅脑外伤30天。    创伤<=2个月
    14天前左下肢胫骨骨折。    创伤<=2个月
    10天前行颅内肿瘤手术。    颅内手术<=2个月
    “颅内插入异物摘除术”1个月。    颅内手术<=2个月
    既往心包填塞病史。    心包填塞
    腹部超声发现：腹主动脉夹层动脉瘤，建议急诊手术治疗。    主动脉夹层
    胃溃疡出血30天。    内出血<=6个月
    2个月前因外伤导致颅内出血。    内出血<=6个月
    3个月前肠镜检查发现结肠多发溃疡伴局部出血点。    消化道出血<=6个月
    上消化道出血14天，伴恶心呕吐。    消化道出血<=6个月
    患者，女，71岁，房颤20余年，因为是出血体质，未服用抗凝药物。    出血体质
    患者2天前急诊行“阑尾炎手术”。    外科手术<=10天
    5天前行“冠脉搭桥术”    外科手术<=10天
    1个月前确诊为“脑栓塞”。    缺血性脑卒中<=2个月
    1个月前诊断为“缺血性脑卒中”    缺血性脑卒中<=2个月
    血小板计数：80×10E9/L。    血小板<100×10E9/L
    血小板 87 10^9/L    血小板<100×10E9/L
    血小板 43×109/L    血小板<100×10E9/L
    口服降压药物，血压控制不佳。    未控制的高血压
    收缩压最低为195mmHg。    收缩压>180mmHg
    血压：190/85mmHg。    收缩压>180mmHg
    血压波动在181-185/85-90mmHg。    收缩压>180mmHg
    舒张压：120mmHg。    舒张压>110mmHg
    血压：190/115mmHg。    舒张压>110mmHg
    自发性颅内出血病史1个月。    自发性颅内出血<=1个月
    5天前因“子宫恶性肿瘤”行子宫全切术。    大手术<=2周
    10天前行“心脏搭桥术”，手术顺利。    大手术<=2周
    分娩2天    分娩<=2周
    7天前做宫颈活检。    器官活检<=2周
    2018年7月12日曾做胃镜活检。（就诊日期2018年7月18日）    器官活检<=2周
    3天前股动脉穿刺术病史。    不能压迫止血部位的血管穿刺<=2周
    1周前曾行股动脉穿刺术。    股动脉血管穿刺<=2周
    1周前胃出血    消化道出血<=10天
    3天前因醉酒导致上消化道出血。    消化道出血<=10天
    7天前胫骨开放性骨折。    严重创伤<=15天
    5天前从高出坠落造成颅骨骨折。    严重创伤<=15天
    10天前行“颞肌下减压术”，术后平稳。    神经外科手术<=1个月
    3周前患者因颅脑外伤行“颅脑外伤钻孔探查术”，以明确诊断。    神经外科手术<=1个月
    患者因“第三腰椎椎管狭窄”影响活动，20天前在本院行“腰椎椎板减压术（后入路）”，术后恢复良好。    神经外科手术<=1个月
    2周前行白内障手术。    眼科手术<=1个月
    半月前曾因眼底出血行玻璃体剥切手术。    眼科手术<=1个月
    8天前因心脏骤停，急诊行“心肺复苏术”。    心肺复苏<=10天
    患者既往有血友病    出血性疾病
    患者高血压病史2年，曾服用多种降压药物，但血压控制不佳，时高时低，经常波动在150-170/75-85mmHg。    未获良好控制的高血压
    患者，男，65岁。2年前诊断高血压病，未规律服药，血压控制不佳，近日因劳累血压波动明显，最高达195/80mmHg。建议调整降压药物，改善生活方式。    未获良好控制的高血压
    收缩压最低为180mmHg。    收缩压>=180mmHg
    血压：180/85mmHg。    收缩压>=180mmHg
    舒张压：110mmHg。    舒张压>=110mmHg
    血压：190/110mmHg。    舒张压>=110mmHg
    2个月前因外伤致颅骨骨折，急诊行手术治疗，目前一般状况好。    重大头颅外伤<=3个月
    脑卒中病史2个月。    卒中<=3个月
    2个月前脑出血，头颅CT扫描证实（图8－2），遗留右侧肢体偏瘫。    卒中<=3个月
    患者6天前睡眠中突发头晕、呕吐伴腹泻，急送当地医院，门诊以“蛛网膜下腔出血待查？”收入院。    可疑蛛网膜下腔出血
    初步诊断：蛛网膜下腔出血？    可疑蛛网膜下腔出血
    3天前曾有股动脉穿刺病史。    不能压迫止血部位的血管穿刺<=1周
    股动脉穿刺术后3天。    股动脉血管穿刺<=1周
    硬脑膜下出血病史。    颅内出血史
    蛛网膜下腔出血病史。    颅内出血史
    小脑出血病史。    颅内出血史
    初步诊断：小脑星形细胞瘤    颅内肿瘤
    头颅MRI“脑干丘脑异常信号，不均匀强化”，考虑脑干肿瘤。    颅内肿瘤
    下肢血管造影确诊：下肢动静脉畸形。    动静脉畸形
    全脑DSA及头颅MRI示：右侧顶叶动静脉畸形，为求进一步治疗，前来我院，门诊以“右顶AVM”收入院。神经系统查体无阳性体征。    动静脉畸形
    患者，女，30岁，以“头晕半月”入院，入院头颅CT检查及各项检查提示：颅内动脉瘤。    动脉瘤
    最后诊断：左侧椎动脉远端夹层动脉瘤。    动脉瘤
    20天前行“颅内支架手术”，术后恢复良好。    颅内手术<=1月
    20天前行“侧脑室肿瘤切除术”    颅内手术<=1月
    男性，14岁，15天前因颈椎椎管内肿瘤行C 2 ～3椎板切除，椎管内肿瘤切除术，术后逐渐出现颈椎后凸畸形，合并慢性颈脊髓病。    椎管内手术<=1月
    测血压：200/105mmHg。    舒张压>=100mmHg
    左侧卵巢囊性增大约4cm，可见破口，有活动性出血。    活动性内出血
    胃镜检查结果提示：胃角巨大溃疡伴活动性出血。    活动性内出血
    患者有急性出血倾向    急性出血倾向
    患者范xx，男，42岁，工人，住院号：xxxx。因“黑便半天”入院于2015年01月16日收入我科。2007年因外伤后致脾出血，行脾切除术，并发现有肝硬化，术中及术后均有输血（具体不详）；随后有2次消化道出血病史，患者及家属自诉当时有食管胃底血管曲张，无病毒性肝炎（未见有病历资料；否认有饮酒史，否认有家族性遗传性肝病。    急性出血倾向
    血小板计数 80*109/L    血小板计数<=100*109/L
    患者，男，45岁，凝血功能检查：APTT 45s 。    APTT>正常范围上限
    患者，女，45岁，凝血功能检查：APTT 43.9s 。    APTT>正常范围上限
    INR 1.8    INR>1.7
    国际标准化比率 1.9    INR>1.7
    国际标准化比值 1.95    INR>1.7
    凝血功能检查：PT 19s    PT>15s
    急诊查血糖 1.8mmol/L。    血糖<2.7mmol/L
    随机血糖：2.6mmol/L。    血糖<2.7mmol/L
    CT提示：左侧额、顶、颞叶脑梗死。    CT提示多脑叶梗死
    CT提示：右额颞叶脑梗死。    CT提示多脑叶梗死
    于二炮医院行MRI检查，示右侧基底节区、右额叶、顶叶多发脑梗塞，并住院治疗。    CT提示多脑叶梗死
    头颅ct示：右侧大脑半球低密度影    低密度影>1/3大脑半球
    头颅CT(2018-06-21宣武医院急诊)：左侧额叶、颞叶、顶叶、基底节区大片状低密度灶。    低密度影>1/3大脑半球
    头颅CT示（2018-06-15 宣武医院）：右侧额叶、颞叶、顶叶大片低密度影，中线结构略移位，中脑轻度受压。     低密度影>1/3大脑半球
    患者，女，20岁，凝血功能检查发现APTT偏高。    APTT异常
    患者，女，20岁，凝血功能检查：APTT 45s。    APTT异常
    患者，男，45岁，凝血功能检查发现：活化部分凝血活酶时间测定 47s。    APTT异常
    INR 1.8    INR异常
    INR高于正常。    INR异常
    血小板计数：80×10E9/L。    血小板计数异常
    血常规检查提示：血小板计数偏高。    血小板计数异常
    血常规检查提示：血小板计数偏低。    血小板计数异常
    血小板计数：480×10E9/L。    血小板计数异常
    ECT全身骨扫描结果：“腰椎轻度侧弯，放射性分布欠均匀。”    ECT异常
    ECT检查提示：双侧唾液腺摄取功能减低，排泌功能正常。    ECT异常
    甲状腺ECT检查提示：甲状腺癌可能性大？    ECT异常
    抗凝血因子Xa活性测定：阳性。    Xa因子活性测定异常
    短暂性脑缺血发作(TIA)    轻型卒中
    NIHSS评分 3分    轻型卒中
    患者，女，25岁，孕25周。    妊娠
    血糖偏高病史2年，未诊断糖尿病，平时饮食控制，诉妊娠分娩时有“痫性发作”。    痫性发作
    患者外伤导致正中神经受损，出现左手的桡半侧出现感觉障碍、拇指对掌、对指功能受限。    神经功能损害
    5年前患者无明显诱因出现发作性左足趾搐溺，多于长时间行走后出现，每次持续约半小时左右，休息后可缓解，起初未在意。4年前患者上述症状较前加重，伴行走不稳，起步缓慢，小碎步，抬腿困难，步态略前倾。半年前自觉书写困难，写字偏小，伴右手拇指末梢及右下肢膝关节以下麻木感。无肢体不自主震颤，无肌肉僵硬，无双上肢运动迟缓，曾于外院诊断为“帕金森综合征、焦虑状态、植物神经功能紊乱”    神经功能损害
    15个月前（2017年1月）开始，自觉左下肢不自主抖动明显加重，静止时出现，悬空位时明显，紧张、激动时加重；并出现左上肢活动变笨拙、僵直感明显、灵活性差，家人发现其行走时左上肢摆臂动作明显减少、左下肢拖步。遂于2017年3月就诊于江西南昌第一附属医院，考虑为“帕金森综合征可能”。    神经功能损害
    二尖瓣置换术后1周    大型外科手术<=2周
    5天前行左肺下叶切除术。    大型外科手术<=2周
    冠状动脉搭桥术后10天。    大型外科手术<=2周
    患者家住3层，1周前擦玻璃时不小心从窗台心坠落，导致左侧胫骨和肱骨开放性骨折，颅骨骨折。患者当时昏迷，大量出血，救护车送院治疗。    严重外伤<=2周
    1周前患者因车祸导致“右侧6、7肋骨骨折；右胫腓骨闭合性粉粹性骨折”在本院骨科手术治疗。    严重外伤<=2周
    柏油样便4次、暗红色稀便2次伴头晕、心慌、出汗、少尿2天，急诊入院。胃镜检查：胃内大量血性液体。诊断：胃出血。    胃出血<=3周
    因直肠出血（鲜红色）伴全腹痛、稀便一周入院，患者去年曾有类似发作史3次。    肠出血<=3周
    “呕血，黑便一周，加重1天”入院，胃镜检查发现：消化性溃疡伴出血。    胃肠出血<=3周
    膀胱出血7天，服用止血，消炎药物后未见好转。    泌尿系统出血<=3周
    2周前因“小便疼痛伴血尿”就诊，B超发现“泌尿系结石”。    泌尿系统出血<=3周
    3天因“前壁心肌梗死”，急诊行“冠脉支架植入术”，目前病情稳定。    心肌梗死<=3个月
    患者因急性脑出血入院，NIHSS评分 28分。    严重卒中
    NIHSS评分：30分。    NIHSS评分>25分
    2型糖尿病病史。    糖尿病病史
    既往有脑梗塞病史。    缺血脑卒中病史
    10年前曾因“缺血性脑卒中”住院治疗。    缺血脑卒中病史
    患者忽然晕倒在地，120及时赶到，查患者呼之不应，颈动脉搏动消失，血压测不到。心电图呈直线。考虑“心脏骤停”，紧急进行“心肺复苏”，救护车送院。    院前心脏骤停
    心电图示：窦性心律，ST段水平性下移。    ST段下移
    患者，男，60岁，因胸痛就诊，急诊生化检查：血清肌酸激酶（CK）330 U/L。    心肌酶升高
    急诊生化检查：肌酸激酶同工酶（CK-MB）29.0μg/L    心肌酶升高
    心肌酶谱 2017/12/7 乳酸脱氢酶 307 IU/L;肌酸激酶 572 U/L;肌酸激酶同功酶 23 IU/L;    心肌酶升高