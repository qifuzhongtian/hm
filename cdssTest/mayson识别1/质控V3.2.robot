*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
识别接口V3.2

    2月1日：晨尿尿蛋白定性（3+）；2月3日：晨尿尿蛋白定性（4+）；2月5日：晨尿尿蛋白定性（3+）    1周内3次晨尿蛋白定性[3+-4+]
    24h尿蛋白定量 150mg/kg    24h尿蛋白定量>=50mg/kg
    出院医嘱：3个月内避免重体力活动    3个月内避免重体力活动
    C反应蛋白 40mg/L    CRP>30mg/L
    C反应蛋白 50mg/L    CRP>30mg/L
    心电图检查：大致正常心电图。    ECG
    ECG检查    ECG
    血沉：100mm/h    ESR增快
    血沉增快     ESR增快
    GCS评分 2    GCS>=0
    格拉斯哥评分（GCS）：15    GCS>=1
    IVIG 50g，静脉滴注qd，连用5天    IVIG治疗
    大剂量IVIG(静脉内免疫球蛋白)2g/kg(总量)分5天或2天给予    IVIG治疗
    mRS：1    mRS>=0
    mRS：0    mRS>=0
    NIHSS：0    nihss>=0
    NIHSS：11    nihss>=0
    NIHSS评分：6    nihss>3
    Padua评分 2分    Padua评分>=0
    Padua： 0    Padua评分>=0
    PaO2 55mmHg    PaO2<=60mmHg
    PaO2 60mmHg    PaO2<=60mmHg
    动脉血氧分压 56mmHg    PaO2>=0
    PPD试验及胸片可助鉴别    PPD试验
    结核菌素试验阳性    PPD试验
    Sa02 90%    SaO2<=0.92
    Sa02 70%    SaO2>=0
    动脉血氧饱和度 75%    SaO2>=0
    经皮血氧饱和度98%    SpO2>=0
    SPO2 70%    SpO2>=0
    VDLD治疗中及结束后总是腹痛    VDLD方案化疗
    补体C40﹒40g／L    补体C4>=0
    门诊做超声心动图检查    超声心动图
    超声心动图3次/周    超声心动图>=2次/周
    留取晨尿，检验结果：尿蛋白/肌酐 2.8    晨尿蛋白/肌酐(mg/mg)>=2.0
    急性肾功能不全，并且出现少尿、内环境紊乱，保守治疗无效，建议及时进行连续性血液净化治疗    持续血液净化
    出院后定期随访    出院随访
    出院后坚持随访    出院随访
    初步诊断：川崎病。    川崎病
    川崎病冠状动脉异常危险分层 1级    川崎病冠状动脉异常危险分层>=1级
    川崎病冠状动脉病变分级 1级     川崎病冠状动脉异常危险分层>=1级
    川崎病冠状动脉异常危险分层 3a级    川崎病冠状动脉异常危险分层3a级
    川崎病冠状动脉病变分级 3a级     川崎病冠状动脉异常危险分层3a级
    川崎病冠状动脉异常危险分层3b级    川崎病冠状动脉异常危险分层3b级
    川崎病冠状动脉病变分级3b级    川崎病冠状动脉异常危险分层3b级
    川崎病冠状动脉异常危险分层4a级    川崎病冠状动脉异常危险分层4a级
    川崎病冠状动脉病变分级4a级    川崎病冠状动脉异常危险分层4a级
    川崎病冠状动脉异常危险分层4b级    川崎病冠状动脉异常危险分层4b级
    川崎病冠状动脉病变分级4b级    川崎病冠状动脉异常危险分层4b级
    川崎病冠状动脉异常危险分层4c级    川崎病冠状动脉异常危险分层4c级
    川崎病冠状动脉病变分级4c级    川崎病冠状动脉异常危险分层4c级
    川崎病冠状动脉异常危险分层5a级    川崎病冠状动脉异常危险分层5a级
    川崎病冠状动脉病变分级5a级    川崎病冠状动脉异常危险分层5a级
    川崎病冠状动脉异常危险分层5b级    川崎病冠状动脉异常危险分层5b级
    川崎病冠状动脉病变分级5b级    川崎病冠状动脉异常危险分层5b级
    川崎病冠状动脉异常危险分层5c级    川崎病冠状动脉异常危险分层5c级
    川崎病冠状动脉病变分级5c级    川崎病冠状动脉异常危险分层5c级
    川崎病冠状动脉异常危险分层5d级    川崎病冠状动脉异常危险分层5d级
    川崎病冠状动脉病变分级5d级    川崎病冠状动脉异常危险分层5d级
    初步诊断：川崎病急性期    川崎病急性期
    患者喘息、气促、不能平卧。    喘息症状
    尿液检查可见大量蛋白尿。    大量蛋白尿
    初步诊断：单纯性肾病综合征    单纯性肾病综合征
    初步诊断：低蛋白血症    低蛋白血症
    癫痫入院病史采集完整性不完整    癫痫入院病史采集完整性
    必须坚持定期随访    定期随访
    患者确诊为“青光眼”，建议患者定期测眼压，观察病情变化。    定期眼科检查
    患者确诊“糖尿病视网膜病变”，建议定期检查眼底。    定期眼科检查
    完善相关检查：血常规，动脉血气分析    动脉血气分析
    入院后应尽快完成动脉血气分析检查    动脉血气分析
    患者体质虚弱，对利尿剂的反应较差。    对利尿剂反应差
    患者对利尿剂的反应较差，少尿症状未改善。    对利尿剂反应差
    儿童ALL临床危险度分型HR    儿童ALL临床危险度分型HR
    儿童ALL临床危险度分型IR    儿童ALL临床危险度分型IR
    儿童ALL临床危险度分型LR    儿童ALL临床危险度分型LR
    患者发热，体温最高达39度。    发热
    患者发热，恶心，呕吐6天，加重1天就诊。    发热>=5天
    患者5天前无明显诱因出现发热，头痛等不适。    发热>=5天
    最后诊断：肺不张    肺不张
    最后诊断：急性肺不张    肺不张
    初步诊断：肺脓肿    肺脓肿
    最后诊断：血源性肺脓肿    肺脓肿
    此患者为肺炎高危患儿    肺炎高危患儿
    肺炎流行病学史记录完整性：完整    肺炎流行病学史记录完整性
    患者入院检查提示：肺炎支原体检测阳性    肺炎支原体检测阳性
    肺炎支原体抗体 1:320    肺炎支原体抗体>=1:160
    肺炎支原体抗体 1:640    肺炎支原体抗体>=1:160
    定期复查血常规、血沉等    复查血沉
    入院后完善肝功能检查。    肝功能
    出院后定期复查肾功能、肝功能，如有异常及时就诊。    肝功能
    出院诊断：高血压脑病    高血压脑病
    5年前曾诊断为“高血压脑病”病情一直平稳。    高血压脑病
    患者1个月前确诊为高血压病，口服降压药物后，高血压未控制，平均血压波动在150～160/70～80mmHg。    高血压未控制
    患者高血压病未控制，血压最高可达160/80mmHg。    高血压未控制
    睾丸肿瘤楔形切除活检    睾丸楔形活检
    白血病微小残留病灶（MRD）2%    骨髓MRD>1%
    复查骨髓象：原始、幼稚淋巴细胞45%，MRD 39. 65%，提示白血病复发。    骨髓MRD>1%
    骨髓穿刺：吞噬细胞较多，占3%    骨髓穿刺
    向患者及家属交代骨髓穿刺必要性及风险，家属同意骨穿检查。    骨髓穿刺
    出院诊断：骨髓炎    骨髓炎
    初步诊断：风湿性关节炎。    关节炎
    曾诊断为左膝关节炎    关节炎
    超声心动图示冠状动脉内径快速扩张    冠脉内径快速扩张
    冠状动脉Z值2    冠状动脉Z值>=0
    冠状动脉Z值10    冠状动脉Z值>=10
    冠状动脉Z值2.5    冠状动脉Z值>=2.5
    冠状动脉Z值3    冠状动脉Z值>2.5
    入院后冠状动脉造影显示单支病变，回旋支中段90%狭窄，可见巨大冠状动脉瘤，药物保守治疗后出院。    冠状动脉瘤
    入院后完善肾功能，核素肾静态扫描等检查。    核素肾静态扫描
    入院检查：核素肾静态显像    核素肾静态扫描
    患者白细胞计数正常，建议行呼吸道病毒检测，以明确病因。    呼吸道病毒检测
    按医嘱每隔一日留取清晨第一次尿，尿蛋白定性结果分别为：2月5日尿蛋白定性3+；2月7日尿蛋白定性4+；2月9日尿蛋白定性3+    1周内>=3次晨尿蛋白定性[3+-4+]
    CHA2DS2-VASc1分    CHA2DS2-VASc<2分
    CHA2DS2-VASc评分1分    CHA2DS2-VASc<2分
    CHA2DS2-VASc2分    CHA2DS2-VASc>=2分
    CHA2DS2-VASc评分2分    CHA2DS2-VASc>=2分
    CHA2DS2-VASc评分3分    CHA2DS2-VASc>2分
    CHA2DS2-VASc3分    CHA2DS2-VASc>2分
    CHA2DS2-VASc评分1分    CHA2DS2-VASc评分>=1分
    CHA2DS2-VASc4分    CHA2DS2-VASc评分>=1分
    入院后头颅CT检查显示脑出血范围较前扩大。    CT示脑出血范围扩大
    CT示右额颞叶脑挫裂伤，右额颞顶硬膜下血肿，蛛网膜下腔出血，中线偏移，环池受压。    CT示中线移位
    EF 35%    EF<=35%
    EF 30%    EF<=35%
    GCS:15分    GCS>=0分
    GCS0分    GCS>=0分
    GCS评分15分    GCS>=0分
    HAS-BLED评分1分    HAS-BLED评分>=1分
    HAS-BLED出血危险评分5分    HAS-BLED评分>=1分
    ICH评分 5分    ICH>=0分
    ICH评分 0    ICH>=0分
    ICH评分 3分    ICH>=3分
    mRS 1分    mRS>=0分
    mRS 0分    mRS>=0分
    NIHSS1分    NIHSS>=0分
    NIHSS 0    NIHSS>=0分
    NIHSS 4分    nihss>3分
    NYHA Ⅳ级    NYHA分级>=1级
    心功能II级（NYHA分级）    NYHA分级>=1级
    心功能Ⅳ级（NYHA分级）    NYHA分级>=1级
    Sa02 92%    Sa02<=0.92
    Sa02 82%    Sa02<=0.92
    最后诊断：ST段抬高型心肌梗死    ST段抬高型心肌梗死
    出院后坚持口服卡马西平片，不可随意停药，定期复查。    不可随意停药
    出院诊断：持续性房颤    持续性房颤
    诊断为：癫痫持续状态    癫痫持续状态
    患者因“短暂性脑缺血发作”收入院治疗。    短暂性大脑缺血性发作
    儿童急淋VDLD方案化疗    儿童急淋VDLD方案化疗
    男，6岁，1年前诊断为”急性淋巴细胞白血病“，目前正在接受化疗。    儿童急淋化疗
    诊断为“儿童急性淋巴细胞白血病”，目前正接受化疗    儿童急淋化疗
    儿童急淋泼尼松试验提示泼尼松反应良好    儿童急淋泼尼松试验
    儿童急性淋巴细胞白血病患者，泼尼松试验显示泼尼松不敏感    儿童急淋泼尼松试验
    儿童急淋诱导缓解治疗    儿童急淋诱导缓解治疗
    患者,6岁,通过血常规、骨髓检查明确诊断为ALL（B细胞型），予以采用VDP方案诱导治疗    儿童急淋诱导缓解治疗
    患者记忆力下降，反应迟钝。    反应迟钝
    定期复查超声心动图    复查超声心动图
    超声心动图：冠状动脉Z值2.5    冠状动脉Z值>=2.5
    超声心动图：冠状动脉Z值3    冠状动脉Z值>2.5
    检测呼吸道合胞病毒    呼吸合胞病毒
    患者胸闷气短，呼吸困难。    呼吸困难
    昏迷5小时    昏迷
    风湿性心脏病，二尖瓣置换术后复查，机械瓣膜活动良好    机械瓣膜
    激素耐药型肾病综合征患者，确诊后应进行肾活检    激素耐药型肾病综合征
    诊断：急进性肾功能不全    急进性肾功能不全
    诊断：急性肺水肿    急性肺水肿
    诊断：急性呼吸衰竭    急性呼吸衰竭
    诊断：急性链球菌感染后肾炎    急性链球菌感染后肾炎
    诊断：急性淋巴细胞白血病    急性淋巴细胞白血病
    诊断：急性脑梗死    急性脑梗死
    患者以“急性肾功能不全”收入院    急性肾功能不全
    门诊以“急性肾盂肾炎”收入我院    急性肾盂肾炎
    下肢静脉加压物理治疗    加压物理治疗
    每日坚持锻炼，坚持口服调脂药物。    降脂药
    嘱戒烟及给予健康宣教（尤其糖尿病饮食指导）    进食指导
    患者10天前，确诊为下肢静脉血栓栓塞。    近期静脉血栓栓塞
    患者2天前因高热导致惊厥，门诊以“高热待查”收入院治疗。    惊厥
    患者因精神行为异常就诊。    精神行为异常
    暴躁易怒，多疑，妄想，总是怀疑有人要谋害自己，没有安全感    精神行为异常
    请看护着加强护理，避免意外事件发生    警惕意外事件发生
    患者因上腹痛，恶心，拒食就诊    拒食
    脑血栓后遗症，请康复科会诊    康复科会诊
    坚持抗感染治疗，病情好转    抗感染
    10天前，抗链球菌溶血素O测定为阳性    抗链球菌溶血素O阳性<=3个月
    15天前血液检查发现抗双磷酸吡啶核苷酸酶阳性    抗双磷酸吡啶核苷酸酶阳性<=3个月
    20天前检查发现抗透明质酸酶滴度增加    抗透明质酸酶滴度增加<=3个月
    2天前检查发现抗脱氧核糖核酸酶B阳性    抗脱氧核糖核酸酶B阳性<=3个月
    患者颅内压降低，    颅内压降低
    儿童，男，10岁，颅内压 48mmH2O    颅内压降低
    患者头颅外伤后，导致头痛，恶心，查颅内压未见异常。    颅内压正常
    出院诊断：泌尿系统感染    泌尿道感染
    患者2个月前曾患泌尿系统感染，痊愈后停药。今日又出现尿频，尿急，尿痛等泌尿系感染症状。    泌尿道感染复发
    病理诊断：膜性肾病（Ⅱ期），继发可能性大。    膜性肾病
    出院诊断：原发性肾病综合征（膜增生性肾小球肾炎）    膜增生肾炎
    头颅CT检查提示幕上脑出血 50ml    目上脑出血>=30ml
    头颅CT检查提示幕下小脑出血20ml    目下小脑出血>=15ml
    难以纠正的高钾血症    难以纠正的高钾血症
    头颅CT提示：小脑出血    脑出血
    脑干部出血5ml    脑出血出血量>=0ml
    头颅CT检查提示脑出血较前加重    脑出血加重
    脑实质内未见异常密度影，脑沟脑池未见异常狭窄或增宽，脑室大小形态位置正常，中线结构居中，增强：脑实质未见异常强化，脑沟脑室脑池未见异常    脑出血出血量>=0ml
    头颅CT显示脑干部出血约10ml    脑干出血>=5ml
    神经系统检查：颈项强直，Kernig氏征（+）Brudzinski征（+）    脑膜刺激征阳性
    最后诊断：病毒性脑膜炎    脑膜炎
    考虑右侧丘脑区脑脓肿。    脑脓肿
    诊断，TOAST分型：心源性脑栓塞（CE)    脑栓塞
    胸腔穿刺，提示为脓气胸。    脓气胸
    入院诊断：肺炎并脓胸、皮下气肿    脓胸
    影像学诊断：右侧原发性膀胱输尿管反流（Ⅱ度）    膀胱输尿管反流
    TIA患者入院后启动强化降脂治疗    强化降脂治疗
    症状性癫痫，全面性发作    全面性发作
    日常生活能力量表(ADL)评分1    日常生活能力量表(ADL)评分>=1
    1年前曾诊断溶血尿毒综合征    溶血尿毒综合征
    最后诊断：社区获得性肺炎    社区获得性肺炎
    初步诊断：肾病综合征    肾病综合征
    门诊诊断“肾积水”    肾积水
    诊断：①肾病综合征；②肾小球微小病变型（MCD）。    肾小球微小病变
    确诊为肾炎性肾病综合征    肾炎性肾病综合征
    行走不稳4月，加重伴束带感视力障碍2月    视力障碍
    昏迷，嗜睡    嗜睡
    血压：60/40mmHg    收缩压>=0
    入院查体:：双侧BP150/80mmHg。神志：嗜睡     收缩压>140mmHg
    患者首次诊断为房颤    首诊房颤
    血压：80/45mmHg    舒张压>=0
    血压：160/100mmHg    舒张压>90mmHg
    超声提示：左侧输尿管扩张    输尿管扩张
    HbA1c1%    糖化血红蛋白>=0
    2型糖尿病病史10余年，血糖控制可    糖尿病
    女，25岁，已婚，主因”2个月未来月经“就诊，考虑妊娠    停经
    双侧瞳孔不等大    瞳孔不等大
    左侧瞳孔3mm,右侧瞳孔5mm    瞳孔不等大
    患者脑出血后吞咽困难，建议及时进行吞咽功能训练，    吞咽治疗
    王某，男，15个月，因腹泻、呕吐4天入院。患者精神萎靡，脉搏速弱，150次/分，呼吸浅快，55次/分，血压86/50mmHg(11.5/6.67KPa)，皮肤弹性减退，两眼凹陷，前囟下陷等脱水症状。    脱水征
    洼田饮水试验：1级    洼田饮水试验[1-5]级
    洼田饮水试验2级    洼田饮水试验>=2级
    患者既往月经正常    未绝经
    出院后卧床休息，避免劳累。    卧床休息
    舌下含服硝酸甘油，吸氧3L/min    吸氧
    1个月前血细菌培养结果显示链球菌阳性    细菌培养链球菌阳性<=3个月
    诊断为急性心包炎    心包炎
    超声心动图提示心房粘液瘤    心房粘液瘤
    心功能Killip4级    心功能分级>=3级
    亚急性细菌性心内膜炎    心内膜炎
    CTA：双侧椎动脉闭塞。故考虑急性脑梗死诊断明确，患者有持续性心房纤颤病史2年。    心源性栓塞
    患者新发意识障碍，四肢抽搐。    新发意识障碍
    查体可见胸壁吸气性凹陷    胸壁吸气性凹陷
    肺部检查提示肺部感染及胸腔积液    胸腔积液
    胸腔积液持续渗出，临床给予胸腔闭式引流。    胸腔积液引流
    血白细胞计数110x10^9/L    血WBC>100x10^9/L
    血常规提示白细胞降低    血白细胞降低
    血白细胞计数3.0x10^9/L    血白细胞降低
    血常规未见异常    血白细胞正常
    定期复查血沉，血沉恢复正常后才可以开始上学    血沉正常后才可上学
    实验室检查：镜下血尿    血尿
    血细菌培养阳性    血培养阳性
    血细菌培养阴性    血培养阴性
    一过性血清C3降低    血清C3短暂性降低
    血清C3短暂性降低    血清C3短暂性降低
    血清补体C30.1mg/dL    血清C3降低
    血清C3降低    血清C3降低
    血清白蛋白20g/L    血清白蛋白<=25g/L
    血清抗核抗体滴度>1    血清抗核抗体滴度>1
    10天前实验室检查发现血清抗链球菌溶血素O阳性    血清抗链球菌溶血素O阳性<=3个月
    血糖1.8mmol/L    血糖>=0
    PLT11x10^9/L    血小板<20x10^9/L
    肺部顺应性降低，出现严重呼吸窘迫    严重呼吸窘迫
    四肢抽搐伴意识不清2天”于2018-05-02 13:20门诊以“意识障碍”收入我科    意识障碍
    病情加重，意识障碍较前加深    意识障碍加深
    患者2年前确诊为永久性房颤    永久性房颤
    患者因“高热昏迷、意识不清”入院，经治疗病情未见好转，意识障碍加重    意识障碍加深
    患者脑梗塞后，出现语言障碍，按医嘱进行语言训练，促进语言功能恢复    语言治疗
    建议患者进行造血干细胞移植手术    造血干细胞移植
    因阵发性房颤2年，拟行射频导管消融术住院。    阵发性房颤
    出院诊断：阵发性室上性心动过速    阵发性室上性心动过速
    初步诊断支气管胸膜瘘    支气管胸膜瘘
    最后诊断：支原体肺炎    支原体肺炎
    查体：中心性紫绀    中心性紫绀
    最后诊断：重度社区获得性肺炎    重度社区获得性肺炎
    患者以“重症肺炎”收入我科治疗    重症肺炎
    最终诊断为重症肺炎支原体性肺炎    重症支原体肺炎
    诊断为蛛网膜下腔出血    蛛网膜下腔出血
    Hunt-Hess分级2    蛛网膜下腔出血Hunt-Hess分级>=1
    蛛网膜下腔出血首程记录完整性    蛛网膜下腔出血首程记录完整性
    子宫切除2年，近期出现阴道流血    子宫切除
    经食道超声可见左心室血栓    左心室血栓
    超声心动图示冠状动脉内径快速扩张    冠脉内径快速扩张