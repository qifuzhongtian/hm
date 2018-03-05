*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           ExcelLibrary    # 字段名 类型 是否必须 说明    # userGuid String 是 患者ID（接入放定义）    # doctorGuid String 是 医生ID（接入放定义）    # serialNumber String 是 业务流水ID（接入方定义）    # hospitalGuid String 是 医院ID（惠每分配）    # gender Integer 否 性别1男,0女
...               # ...    # age double 否 年龄    # ageType String 否 岁、月、天    # bodyTempr Double 否 体温    # weight Double 否 体重    # heartRate Integer 否 心率    # lowBldPress Integer 否 收缩压
...               # highBldPress Integer 否 舒张压    # ...    # examInfo String 否 检查    # previousHistory String 否 既往史    # personalHistory String 否 个人史    # allergyHistory String 否 过敏史    # familyHistory String 否 家族史
...               # symptom String 否 主诉    # confirmDiagnosis String 否 已确定诊断

*** Test Cases ***
识别接口1214
    鼻咽癌    鼻咽癌
    鼻炎    鼻炎
    变应性鼻结膜炎    变应性鼻结膜炎
    低血糖    低血糖
    肺炎    肺炎
    附件肿物    附件肿物
    关节感染    关节感染
    脊柱侧凸    脊柱侧凸
    继发性雷诺综合征    继发性雷诺综合征
    颈大动脉炎    颈大动脉炎
    颈动脉疾病    颈动脉疾病
    颈动脉夹层    颈动脉夹层
    颈动脉狭窄    颈动脉狭窄
    颈动脉血管炎    颈动脉血管炎
    颈动脉硬化    颈动脉硬化
    颈巨细胞动脉炎    颈巨细胞动脉炎
    口腔癌    口腔癌
    雷诺综合征    雷诺综合征
    尿道结石    尿道结石
    尿路结石    尿路结石
    膀胱结石    膀胱结石
    肾结石    肾结石
    输尿管结石    输尿管结石
    哮喘    哮喘
    原发性雷诺综合征    原发性雷诺综合征
    鼻咽癌    鼻咽癌
    鼻炎    鼻炎
    变应性鼻结膜炎    变应性鼻结膜炎
    血糖3.8mmol/L    低血糖
    低血糖    低血糖
    肺炎    肺炎
    附件肿物    附件肿物
    关节感染    关节感染
    脊柱侧凸    脊柱侧凸
    继发性雷诺综合征    继发性雷诺综合征
    颈大动脉炎    颈大动脉炎
    颈动脉疾病    颈动脉疾病
    颈动脉夹层    颈动脉夹层
    颈动脉狭窄    颈动脉狭窄
    颈动脉血管炎    颈动脉血管炎
    颈动脉硬化    颈动脉硬化
    颈巨细胞动脉炎    颈巨细胞动脉炎
    口腔癌    口腔癌
    雷诺综合征    雷诺综合征
    尿道结石    尿道结石
    尿路结石    尿路结石
    膀胱结石    膀胱结石
    输尿管结石    输尿管结石
    哮喘    哮喘
    原发性雷诺综合征    原发性雷诺综合征
    足趾溃疡    足趾溃疡
    足趾坏疽    足趾坏疽
    足月小样儿    足月小样儿
    足部畸形    足部畸形
    自杀意念    自杀意念
    自杀倾向    自杀倾向
    自杀企图    自杀企图
    自杀行为史    自杀行为史
    准备妊娠    准备妊娠
    椎体骨折    椎体骨折
    转移性鼻咽癌    转移性鼻咽癌
    住院48小时    住院>=48小时后
    住院49小时    住院>=48小时后
    主胰管直径5mm    主胰管直径为[5mm-10mm)
    主胰管直径9mm    主胰管直径为[5mm-10mm)
    主胰管型导管内乳头状黏液瘤    主胰管型导管内乳头状黏液瘤
    主胰管型    主胰管型
    主胰管受累    主胰管受累
    主胰管扩张1.1cm    主胰管扩张>1cm
    主胰管管径10mm    主胰管管径>=10mm
    主胰管管径11mm    主胰管管径>=10mm
    主动脉瘤    主动脉瘤
    周围动脉疾病    周围动脉疾病
    重症肺炎    重症肺炎
    重度抑郁    重度抑郁
    重度药物性鼻炎    重度药物性鼻炎
    重度炎性痤疮    重度炎性痤疮
    重度颈动脉狭窄    重度颈动脉狭窄
    重度脊柱侧凸    重度脊柱侧凸
    重度低血糖    重度低血糖
    重度变应性鼻结膜炎    重度变应性鼻结膜炎
    重度阿尔茨海默病痴呆    重度阿尔茨海默病痴呆
    肿瘤性囊肿    肿瘤性囊肿
    肿瘤细胞分期早    肿瘤细胞分期早
    中性粒细胞1.4 109/L    中性粒细胞绝对值<1.5×109/L
    中性粒细胞0.9 109/L    中性粒细胞绝对值<1.0×109/L
    中性粒细胞0.6 109/L    中性粒细胞绝对值(ANC)>0.5×109/L
    中性粒细胞0.4 109/L    中性粒细胞绝对值(ANC)<0.5×109/L
    中性粒细胞0.6 109/L    中性粒细胞绝对值(0.5-1.0)×109/L
    中性粒细胞0.9 109/L    中性粒细胞绝对值(0.5-1.0)×109/L
    中性粒细胞减少    中性粒细胞减少
    中危自杀倾向    中危自杀倾向
    中晚期鼻咽癌    中晚期鼻咽癌
    中枢性紫绀    中枢性紫绀
    中枢性尿崩症    中枢性尿崩症
    中腹部短期锐痛    中腹部短期锐痛
    中耳炎    中耳炎
    中度抑郁患者不同意抗抑郁药物治疗    中度抑郁患者不同意抗抑郁药物治疗
    中度抑郁    中度抑郁
    中度炎性痤疮    中度炎性痤疮
    中度皮损    中度皮损
    中度颈动脉狭窄    中度颈动脉狭窄
    中度变应性鼻结膜炎    中度变应性鼻结膜炎
    中度阿尔茨海默病痴呆    中度阿尔茨海默病痴呆
    直立性低血压    直立性低血压
    脂肪肝    脂肪肝
    肢体组织坏死    肢体组织坏死
    肢体长度差异    肢体长度差异
    支具治疗效果不好    支具治疗效果不好
    正常活动无影响    正常活动无影响
    震颤    震颤
    长期应用皮质类固醇激素    长期应用皮质类固醇激素
    长期应用免疫抑制剂    长期应用免疫抑制剂
    长期应用化疗药物    长期应用化疗药物
    长期痤疮治疗失败    长期痤疮治疗失败
    长骨骨折    长骨骨折
    粘连性小肠梗阻    粘连性小肠梗阻
    躁狂症    躁狂症
    早产儿    早产儿
    早7:01-晚10:59快速血糖水平69mg/dl    早7:01-晚10:59快速血糖水平<70mg/dl
    在服氯霉素    在服氯霉素
    在服甲氨蝶呤    在服甲氨蝶呤
    在服环磷酰胺    在服环磷酰胺
    在服6-巯基嘌呤    在服6-巯基嘌呤
    运动性哮喘    运动性哮喘
    孕妇    孕妇
    月经性哮喘    月经性哮喘
    月经来潮前    月经来潮前
    原发性肺部恶性肿瘤    原发性肺部恶性肿瘤
    原发附件囊肿增大    原发附件囊肿增大
    有自杀计划    有自杀计划
    有外伤史    有外伤史
    有生育要求    有生育要求
    有尿培养结果    有尿培养结果
    有颈部放射治疗史    有颈部放射治疗史
    用力呼吸讲话不能成句    用力呼吸讲话不能成句
    用力呼吸    用力呼吸
    硬皮病    硬皮病
    营养不良    营养不良
    意识状态迅速恢复    意识状态迅速恢复
    意识状态改变    意识状态改变
    意识水平持续性下降    意识水平持续性下降
    意识改变    意识改变
    抑郁症状持续<2周    抑郁症状持续<2周
    抑郁症    抑郁症
    抑郁障碍    抑郁障碍
    抑郁    抑郁
    异位妊娠    异位妊娠
    已绝经    已绝经
    已建立静脉通路    已建立静脉通路
    乙酰甲胆碱激发试验阳性    乙酰甲胆碱激发试验阳性
    疑似抑郁    疑似抑郁
    疑似哮喘    疑似哮喘
    疑似先天性低血糖症    疑似先天性低血糖症
    疑似社区获得性肺炎    疑似社区获得性肺炎
    疑似口腔癌    疑似口腔癌
    疑似颈动脉疾病    疑似颈动脉疾病
    疑似肺炎    疑似肺炎
    疑似低血糖    疑似低血糖
    疑似鼻咽癌    疑似鼻咽癌
    胰腺肿块    胰腺肿块
    胰腺炎病史    胰腺炎病史
    胰腺腺癌    胰腺腺癌
    胰腺实性假乳头状瘤    胰腺实性假乳头状瘤
    胰腺神经内分泌瘤    胰腺神经内分泌瘤
    胰腺囊肿直径5cm    胰腺囊肿直径>4cm
    胰腺囊肿直径4cm    胰腺囊肿直径>3cm
    胰腺囊肿直径1.6cm    胰腺囊肿直径>1.5cm
    胰腺囊肿直径3cm    胰腺囊肿直径>=3cm
    胰腺囊肿直径4cm    胰腺囊肿直径>=3cm
    胰腺囊肿直径2mm    胰腺囊肿直径[2mm-3mm]
    胰腺囊肿直径3mm    胰腺囊肿直径[2mm-3mm]
    胰腺囊肿内有钙化    胰腺囊肿内有钙化
    胰腺囊肿    胰腺囊肿
    胰腺囊性病变    胰腺囊性病变
    胰腺浆液性囊腺瘤    胰腺浆液性囊腺瘤
    胰腺假性囊肿    胰腺假性囊肿
    胰腺恶性肿瘤    胰腺恶性肿瘤
    胰头囊肿    胰头囊肿
    胰管直径10mm    胰管直径>=10mm
    胰管直径11mm    胰管直径>=10mm
    胰管直径5mm    胰管直径[5mm-10mm)
    胰管直径9mm    胰管直径[5mm-10mm)
    医院获得性肺炎    医院获得性肺炎
    医患沟通结果中度抑郁患者不同意抗抑郁药物治疗    医患沟通结果中度抑郁患者不同意抗抑郁药物治疗
    偏侧忽略7天    一周内偏侧忽略
    偏侧忽略6天    一周内偏侧忽略
    一过性黑矇7天    一周内出现一过性黑矇
    一过性黑矇6天    一周内出现一过性黑矇
    同侧暂时性单眼失明7天    一周内出现同侧暂时性单眼失明
    同侧暂时性单眼失明6天    一周内出现同侧暂时性单眼失明
    手臂无力重于腿部无力7天    一周内出现手臂无力重于腿部无力
    手臂无力重于腿部无力6天    一周内出现手臂无力重于腿部无力
    手臂麻木重于腿部麻木7天    一周内出现手臂麻木重于腿部麻木
    手臂麻木重于腿部麻木6天    一周内出现手臂麻木重于腿部麻木
    失语症7天    一周内出现失语症
    失语症6天    一周内出现失语症
    对侧面部无力重于腿部无力7天    一周内出现对侧面部无力重于腿部无力
    对侧面部无力重于腿部无力6天    一周内出现对侧面部无力重于腿部无力
    对侧面部麻木重于腿部麻木7天    一周内出现对侧面部麻木重于腿部麻木
    对侧面部麻木重于腿部麻木6天    一周内出现对侧面部麻木重于腿部麻木
    一侧头痛    一侧头痛
    一侧颅神经功能障碍    一侧颅神经功能障碍
    夜醒2次/月    夜醒2次/月
    夜醒1次/月    夜醒1次/月
    夜醒2次/周    夜醒>1次/周
    夜醒3次/月    夜醒[3-4]次/月
    夜醒4次/月    夜醒[3-4]次/月
    夜间咳嗽加重    夜间咳嗽加重
    夜间持续脊柱疼痛    夜间持续脊柱疼痛
    腰痛    腰痛
    腰部不适    腰部不适
    眼周痒    眼周痒
    眼痛    眼痛
    眼球活动障碍    眼球活动障碍
    眼脓性分泌物    眼脓性分泌物
    眼部瘙痒    眼部瘙痒
    言语增多    言语增多
    言语紊乱    言语紊乱
    严重自杀想法    严重自杀想法
    严重心肺疾病    严重心肺疾病
    严重肾疾病    严重肾疾病
    严重龋坏    严重龋坏
    严重尿路感染    严重尿路感染
    严重呼吸系统疾病    严重呼吸系统疾病
    严重感染    严重感染
    严重肝疾病    严重肝疾病
    严重肥胖    严重肥胖
    烟草使用    烟草使用
    咽痒    咽痒
    亚硝酸盐检测阳性    亚硝酸盐检测阳性
    血液系统恶性肿瘤    血液系统恶性肿瘤
    血氧饱和度89%    血氧饱和度<90%
    血糖降低    血糖低
    血糖54mg/dl    血糖<55mg/dl
    血糖44mg/dl    血糖<45mg/dl
    血糖3.0mmol/L    血糖<3.1mmol/L
    血糖:2.4mmol/L    血糖<2.5mmol/L
    血糖40mg/dl    血糖<=40mg/dl
    血糖39mg/dl    血糖<=40mg/dl
    血糖:25mg/dl    血糖<=25mg/dl
    血糖:24mg/dl    血糖<=25mg/dl
    血糖.2:2mmol/L    血糖<=2.2mmol/L
    血糖.2:1mmol/L    血糖<=2.2mmol/L
    血糖1.4mmol/L    血糖<=1.4mmol/L
    血糖1.3mmol/L    血糖<=1.4mmol/L
    血糖25mg/dl    血糖[25-40]mg/dl
    血糖40mg/dl    血糖[25-40]mg/dl
    血糖1.5mmol/L    血糖(1.4-2.2]mmol/L
    血糖2.2mmol/L    血糖(1.4-2.2]mmol/L
    血嗜酸性粒细胞5%    血嗜酸性粒细胞>4%
    血清变应原特异性试验阳性    血清变应原特异性试验阳性
    血培养阳性    血培养阳性
    血尿素氮结果    血尿素氮结果
    血流动力学不稳定    血流动力学不稳定
    血肌酐:265umol/L    血肌酐>=265umol/L
    血肌酐:266umol/L    血肌酐>=265umol/L
    血管痉挛    血管痉挛
    血管闭塞性疾病    血管闭塞性疾病
    需较高的葡萄糖输液速度才能维持血糖>60mg/dl    需较高的葡萄糖输液速度才能维持血糖>60mg/dl
    需大剂量糖皮质激素控制哮喘    需大剂量糖皮质激素控制哮喘
    嗅觉完全丧失    嗅觉完全丧失
    休克    休克
    胸腰椎脊柱畸形    胸腰椎脊柱畸形
    胸腔积液6cm    胸腔积液深度>5cm
    胸闷    胸闷
    胸廓发育不良综合征    胸廓发育不良综合征
    胸骨骨折    胸骨骨折
    胸部X线片见肺结节    胸部X线片见肺结节
    胸壁凹陷    胸壁凹陷
    擤鼻后涕中带血    擤鼻后涕中带血
    星状瘢痕    星状瘢痕
    新生儿低血糖症状    新生儿低血糖症状
    新生儿低血糖症风险高    新生儿低血糖症风险高
    新生儿低血糖体征    新生儿低血糖体征
    新生儿低血糖    新生儿低血糖
    新发尿失禁    新发尿失禁
    新出现尿失禁    新出现尿失禁
    心脏病    心脏病
    心脑血管疾病    心脑血管疾病
    心率79次/分    心率<80次/分
    心力衰竭    心力衰竭
    心境恶劣    心境恶劣
    心慌    心慌
    心动过速    心动过速
    哮喘8天/周    哮喘症状>7天/周
    哮喘1天/周    哮喘症状<2天/周
    哮喘3天/周    哮喘症状[3-6]天/周
    哮喘6天/周    哮喘症状[3-6]天/周
    哮喘严重度分类6级    哮喘严重度分类6级
    哮喘严重度分类5级    哮喘严重度分类5级
    哮喘严重度分类4级    哮喘严重度分类4级
    哮喘严重度分类3级    哮喘严重度分类3级
    哮喘严重度分类2级    哮喘严重度分类2级
    哮喘严重度分类1级    哮喘严重度分类1级
    哮喘未控制    哮喘未控制
    哮喘控制测试控制良好    哮喘控制测试控制良好
    哮喘控制测试控制极差    哮喘控制测试控制极差
    哮喘控制测试控制不佳    哮喘控制测试控制不佳
    哮喘家族史    哮喘家族史
    哮喘急性发作需要气管插管    哮喘急性发作需要气管插管
    哮喘急性发作    哮喘急性发作
    哮喘复发    哮喘复发
    哮喘发作影响睡眠    哮喘发作影响睡眠
    哮喘发作持续2天    哮喘发作持续>1天
    小肠转移    小肠转移
    小肠内无粪便    小肠内无粪便
    小肠梗阻管腔内有气泡和残渣    小肠梗阻管腔内有气泡和残渣
    小肠梗阻    小肠梗阻
    消瘦    消瘦
    腺样体肥大    腺样体肥大
    纤维肌发育不良    纤维肌发育不良
    先天性脊柱侧凸    先天性脊柱侧凸
    下肾盏结石    下肾盏结石
    下尿路结石    下尿路结石
    细菌性脑膜炎    细菌性脑膜炎
    细菌性结膜炎    细菌性结膜炎
    细胞色素P450有诱导作用的药物    细胞色素P450有诱导作用的药物
    细胞色素P450有抑制作用的药物    细胞色素P450有抑制作用的药物
    吸烟    吸烟
    吸收不良    吸收不良
    吸入性肺炎    吸入性肺炎
    无症状性菌尿    无症状性菌尿
    无夜醒    无夜醒
    无痛性颈部淋巴结肿大    无痛性颈部淋巴结肿大
    无排气    无排气
    无排便    无排便
    无明显外伤    无明显外伤
    无明显潜在病因的脊柱侧凸    无明显潜在病因的脊柱侧凸
    无法手术切除    无法手术切除
    无法口服抗菌药物    无法口服抗菌药物
    无法解释的意识水平下降    无法解释的意识水平下降
    喂食后血糖40mg/dl    喂食后血糖<=40mg/dl
    喂食后血糖39mg/dl    喂食后血糖<=40mg/dl
    喂食后血糖2.2mmol/L    喂食后血糖<=2.2mmol/L
    喂食后血糖2.1mmol/L    喂食后血糖<=2.2mmol/L
    喂食后    喂食后
    畏光    畏光
    未建立静脉通路    未建立静脉通路
    未建立静脉通道    未建立静脉通道
    萎缩性鼻炎    萎缩性鼻炎
    围绝经期    围绝经期
    违拗性木僵者    违拗性木僵者
    威胁说要伤害自己    威胁说要伤害自己
    威胁说要伤害他人    威胁说要伤害他人
    妄想    妄想
    网膜饼征    网膜饼征
    晚期鼻咽癌    晚期鼻咽癌
    顽固性头痛    顽固性头痛
    顽固性便秘    顽固性便秘
    外周血白细胞增多    外周血白细胞增多
    托伐普坦    托伐普坦
    突发共济失调    突发共济失调
    透明细胞癌    透明细胞癌
    透过X线结石    透过X线结石
    头孢类药物过敏史    头孢类药物过敏史
    头孢过敏    头孢过敏
    铜绿假单胞菌感染    铜绿假单胞菌感染
    停用抗抑郁药物1月    停用抗抑郁药物>=1个月
    停用抗抑郁药物2月    停用抗抑郁药物>=1个月
    听诊时胸部安静    听诊时胸部安静
    听幻觉    听幻觉
    体温不稳定    体温不稳定
    体温38.6°C    体温>38.5°C
    体温39℃    体温>=39℃
    体温40℃    体温>=39℃
    疼痛    疼痛
    特应性皮炎    特应性皮炎
    特异性性腺间质细胞肿瘤    特异性性腺间质细胞肿瘤
    特发性脊柱侧凸    特发性脊柱侧凸
    糖皮质激素无效    糖皮质激素无效
    痰培养阴性    痰培养阴性
    痰培养阳性    痰培养阳性
    思维奔逸    思维奔逸
    睡眠障碍    睡眠障碍
    睡眠需求减少    睡眠需求减少
    睡眠时呼吸暂停    睡眠时呼吸暂停
    睡眠呼吸暂停    睡眠呼吸暂停
    水摄入过多    水摄入过多
    双膦酸盐类药物    双膦酸盐类药物
    双合诊触及盆腔肿物    双合诊触及盆腔肿物
    双侧上尿路结石    双侧上尿路结石
    输尿管中段结石    输尿管中段结石
    输尿管严重扭曲    输尿管严重扭曲
    输尿管下段结石    输尿管下段结石
    输尿管狭窄    输尿管狭窄
    输尿管细小    输尿管细小
    输尿管石街    输尿管石街
    输尿管上段结石    输尿管上段结石
    输卵管卵巢脓肿    输卵管卵巢脓肿
    手足颤抖    手足颤抖
    手指溃疡    手指溃疡
    手指坏疽    手指坏疽
    嗜睡    嗜睡
    视网膜脱落潜在危险    视网膜脱落潜在危险
    视敏度降低    视敏度降低
    视力下降    视力下降
    视幻觉    视幻觉
    使用过大环内酯类抗菌素    使用过大环内酯类抗菌素
    实性假乳头状瘤    实性假乳头状瘤
    实体器官移植    实体器官移植
    湿疹    湿疹
    失语    失语
    失明    失明
    生长曲线不良    生长曲线不良
    肾脏感染严重    肾脏感染严重
    肾脏对精氨酸加压素产生抵抗    肾脏对精氨酸加压素产生抵抗
    肾脏超声异常    肾脏超声异常
    肾盂肾炎    肾盂肾炎
    肾盂结石    肾盂结石
    肾移植后3月     肾移植后3个月
    肾移植后4月     肾移植后3个月
    肾移植后    肾移植后
    肾移植    肾移植
    肾性尿崩症    肾性尿崩症
    肾下极嵌顿性结石    肾下极嵌顿性结石
    肾衰竭多尿期    肾衰竭多尿期
    肾衰竭    肾衰竭
    肾实质结石    肾实质结石
    肾区叩痛    肾区叩痛
    肾脓肿    肾脓肿
    肾内型肾盂结石    肾内型肾盂结石
    肾结石病史    肾结石病史
    肾绞痛    肾绞痛
    肾积水    肾积水
    肾积脓    肾积脓
    肾后性肾衰竭    肾后性肾衰竭
    肾动脉瘤    肾动脉瘤
    神经源性膀胱    神经源性膀胱
    神经系统异常表现    神经系统异常表现
    神经肌肉性脊柱侧凸    神经肌肉性脊柱侧凸
    神经过敏    神经过敏
    身高不再变化    身高不再变化
    身高变化    身高变化
    社区获得性肺炎    社区获得性肺炎
    上尿路结石    上尿路结石
    上呼吸道感染    上呼吸道感染
    沙丁胺醇治疗无效    沙丁胺醇治疗无效
    沙丁胺醇无效    沙丁胺醇无效
    软弱无力    软弱无力
    乳腺癌家族史    乳腺癌家族史
    妊娠晚期    妊娠晚期
    妊娠期糖尿病母亲    妊娠期糖尿病母亲
    妊娠期前3月    妊娠期前3个月
    妊娠期    妊娠期
    认知障碍    认知障碍
    缺血性卒中家族史    缺血性卒中家族史
    缺乏体力活动    缺乏体力活动
    全天有哮喘症状    全天有哮喘症状
    全年无急性哮喘发作    全年无急性哮喘发作
    全面性惊厥性癫痫持续状态    全面性惊厥性癫痫持续状态
    龋齿    龋齿
    情绪亢奋    情绪亢奋
    轻度抑郁    轻度抑郁
    轻度炎性痤疮    轻度炎性痤疮
    轻度皮损    轻度皮损
    轻度颈动脉狭窄    轻度颈动脉狭窄
    青霉素类药物过敏史    青霉素类药物过敏史
    青霉素过敏    青霉素过敏
    侵及咽旁    侵及咽旁
    腔外造影剂    腔外造影剂
    嵌顿性疝    嵌顿性疝
    前尿道结石    前尿道结石
    前列腺增生经尿道手术前    前列腺增生经尿道手术前
    髂骨翼与髂骨融合    髂骨翼与髂骨融合
    髂骨翼未与髂骨融合    髂骨翼未与髂骨融合
    髂骨翼骨骺骨化75%    髂骨翼骨骺骨化75%
    髂骨翼骨骺骨化50%    髂骨翼骨骺骨化50%
    髂骨翼骨骺骨化25％    髂骨翼骨骺骨化25％
    髂骨翼骨骺骨化100%    髂骨翼骨骺骨化100%
    髂骨翼骨骺骨化    髂骨翼骨骺骨化
    气-液平面    气-液平面
    气管插管    气管插管
    气短    气短
    气道阻塞    气道阻塞
    葡萄糖注射后    葡萄糖注射后
    频繁使用短效支气管扩张剂效果不佳    频繁使用短效支气管扩张剂效果不佳
    皮肤点刺试验阳性    皮肤点刺试验阳性
    盆腔肿物固定    盆腔肿物固定
    盆腔探查阳性    盆腔探查阳性
    喷嚏    喷嚏
    膀胱炎症状持续2周    膀胱炎症状持续>1周
    膀胱炎症状    膀胱炎症状
    膀胱炎    膀胱炎
    膀胱炎    膀胱炎
    膀胱输尿管反流    膀胱输尿管反流
    膀胱憩室病变    膀胱憩室病变
    膀胱积脓    膀胱积脓
    膀胱感染严重    膀胱感染严重
    排气    排气
    排便    排便
    呕吐胆汁    呕吐胆汁
    脓尿    脓尿
    脓毒性休克    脓毒性休克
    尿酸结石    尿酸结石
    尿培养有细菌生长    尿培养有细菌生长
    尿培养阴性    尿培养阴性
    尿培养药敏试验    尿培养药敏试验
    尿培养细菌菌落计数10E5CFU/ml    尿培养细菌菌落计数>=10E5CFU/ml
    尿培养细菌菌落计数11E5CFU/ml    尿培养细菌菌落计数>=10E5CFU/ml
    尿培养细菌菌落计数10E3CFU/ml    尿培养细菌菌落计数>=10E3CFU/ml
    尿培养细菌菌落计数11E3CFU/ml    尿培养细菌菌落计数>=10E3CFU/ml
    尿培养48小时阴性    尿培养48小时呈阴性
    尿培养10^4 CFU/ml    尿培养104个菌落形成单位/ml
    尿路结石直径21mm    尿路结石直径>20mm
    尿路结石直径30mm    尿路结石直径>=30mm
    尿路结石直径31mm    尿路结石直径>=30mm
    尿路结石直径20mm    尿路结石直径>=20mm
    尿路结石直径21mm    尿路结石直径>=20mm
    尿路结石直径<6mm    尿路结石直径<6mm
    尿路结石直径29mm    尿路结石直径<30mm
    尿路结石直径19mm    尿路结石直径<20mm
    尿路结石嵌顿紧密    尿路结石嵌顿紧密
    尿路结石经尿道取石术前    尿路结石经尿道取石术前
    尿路结石定位困难    尿路结石定位困难
    尿路结石成分    尿路结石成分
    尿路梗阻解除后    尿路梗阻解除后
    尿路感染治疗后    尿路感染治疗后
    尿路感染症状体征    尿路感染症状体征
    尿路感染未控制    尿路感染未控制
    尿路感染    尿路感染
    尿路操作    尿路操作
    尿沉渣白细胞6个/每高倍视野    尿沉渣显微镜检查每高倍视野下白细胞>5个
    尿沉渣白细胞11个/每高倍视野    尿沉渣显微镜检查每高倍视野下白细胞>10个
    尿沉渣白细胞:11个/Hp    尿沉渣显微镜检白细胞计数>10个/Hp
    尿崩症    尿崩症
    尿白细胞酯酶阳性    尿白细胞酯酶阳性
    尿白细胞管型    尿白细胞管型
    尿白细胞10/mcL    尿>=10个白细胞/mcL
    尿白细胞11/mcL    尿>=10个白细胞/mcL
    黏液性囊性肿瘤    黏液性囊性肿瘤
    能量多普勒血流显像显示附件实性成分内有血流    能量多普勒血流显像显示附件实性成分内有血流
    脑器质性疾病    脑器质性疾病
    脑膜炎体征    脑膜炎体征
    脑电图提示非惊厥性癫痫持续状态    脑电图提示非惊厥性癫痫持续状态
    囊肿内有厚分隔    囊肿内有厚分隔
    囊肿内无房隔    囊肿内无房隔
    囊肿壁厚    囊肿壁厚
    囊液细胞学检查阳性    囊液细胞学检查阳性
    囊液CEA增高    囊液CEA增高
    囊内实性成分强化    囊内实性成分强化
    囊内钙化    囊内钙化
    囊壁增厚    囊壁增厚
    囊壁强化    囊壁强化
    难治性呕吐    难治性呕吐
    难治性癫痫持续状态    难治性癫痫持续状态
    难以纠正的出血性疾病    难以纠正的出血性疾病
    耐甲氧西林金黄色葡萄球菌感染的危险因素    耐甲氧西林金黄色葡萄球菌感染的危险因素
    耐甲氧西林金黄色葡萄球菌感染    耐甲氧西林金黄色葡萄球菌感染
    木僵    木僵
    面色苍白    面色苍白
    面部疼痛    面部疼痛
    免疫抑制    免疫抑制
    免疫性粒细胞减少症    免疫性粒细胞减少症
    免疫力抑制    免疫力抑制
    免疫功能缺陷    免疫功能缺陷
    泌尿系统畸形    泌尿系统畸形
    泌尿外科手术史    泌尿外科手术史
    泌尿生殖系统畸形    泌尿生殖系统畸形
    咪达硫仑治疗有效    咪达硫仑治疗有效
    咪达硫仑治疗无效    咪达硫仑治疗无效
    孟鲁司特无效    孟鲁司特无效
    门诊治疗无效    门诊治疗无效
    门静脉积气    门静脉积气
    每小时尿量5ml/kg    每小时尿量>4ml/kg体重
    冒险行为增加    冒险行为增加
    慢性阻塞性肺疾病    慢性阻塞性肺疾病
    慢性肾脏病    慢性肾脏病
    慢性肾盂肾炎    慢性肾盂肾炎
    慢性骨髓炎    慢性骨髓炎
    慢性鼻窦炎    慢性鼻窦炎
    马蹄形肾    马蹄形肾
    麻痹性肠梗阻    麻痹性肠梗阻
    卵巢肿瘤    卵巢肿瘤
    卵巢性索-间质肿瘤    卵巢性索-间质肿瘤
    卵巢上皮性癌    卵巢上皮性癌
    卵巢扭转    卵巢扭转
    卵巢囊肿    卵巢囊肿
    卵巢良性肿瘤    卵巢良性肿瘤
    卵巢畸胎瘤    卵巢畸胎瘤
    卵巢低恶性潜能肿瘤    卵巢低恶性潜能肿瘤
    卵巢癌家族史    卵巢癌家族史
    卵巢癌I期    卵巢癌I期
    卵巢癌    卵巢癌
    鹿角形结石    鹿角形结石
    颅骨骨折    颅骨骨折
    流涕    流涕
    流泪    流泪
    留置导尿管    留置导尿管
    磷酸钙类结石    磷酸钙类结石
    磷酸铵镁结石    磷酸铵镁结石
    磷苯妥英给药后    磷苯妥英给药后
    淋巴细胞减少    淋巴细胞减少
    淋巴结外侵部位    淋巴结外侵部位
    利尿剂    利尿剂
    锂盐药物    锂盐药物
    冷球蛋白血症    冷球蛋白血症
    肋脊角压痛    肋脊角压痛
    肋脊角疼痛    肋脊角疼痛
    肋骨骨折    肋骨骨折
    狼疮    狼疮
    哭声弱    哭声弱
    哭声尖细    哭声尖细
    口腔癌转移    口腔癌转移
    口腔癌阳性切缘    口腔癌阳性切缘
    口腔癌T5期    口腔癌T5期
    口腔癌T4期    口腔癌T4期
    口腔癌T3期    口腔癌T3期
    口腔癌T2期    口腔癌T2期
    口腔癌T1期    口腔癌T1期
    口腔癌N3期    口腔癌N3期
    口腔癌N2期    口腔癌N2期
    口腔癌N1期    口腔癌N1期
    口腔癌N0期    口腔癌N0期
    口服糖皮质激素无效    口服糖皮质激素无效
    口服抗组胺药耐药    口服抗组胺药耐药
    可提取性核抗原阴性    可提取性核抗原阴性
    可提取性核抗原阳性    可提取性核抗原阳性
    咳痰    咳痰
    抗组胺药无效    抗组胺药无效
    抗着丝点抗体阴性    抗着丝点抗体阴性
    抗着丝点抗体阳性    抗着丝点抗体阳性
    抗抑郁治疗达到缓解期    抗抑郁治疗达到缓解期
    抗抑郁药治疗无效者    抗抑郁药治疗无效者
    抗抑郁药物减药期    抗抑郁药物减药期
    抗生素治疗无效    抗生素治疗无效
    抗生素治疗48小时无效    抗生素治疗48小时无效
    抗生素治疗48小时    抗生素治疗48小时
    抗菌治疗72h无效    抗菌治疗72h无效
    抗核抗体阴性    抗核抗体阴性
    抗核抗体阳性    抗核抗体阳性
    抗核抗体4U    抗核抗体>3U
    抗核抗体1U    抗核抗体[1U-3U]
    抗核抗体3U    抗核抗体[1U-3U]
    抗癫痫药物治疗    抗癫痫药物治疗
    绝经前女性    绝经前女性
    绝经后    绝经后
    月经初潮后1年    距月经初潮<2年
    剧烈背痛    剧烈背痛
    拒食性木僵者    拒食性木僵者
    巨舌    巨舌
    巨囊型    巨囊型
    静脉抗生素治疗后    静脉抗生素治疗后
    颈内血管重建术后随访    颈内血管重建术后随访
    颈动脉再狭窄    颈动脉再狭窄
    颈动脉杂音    颈动脉杂音
    颈动脉纤维肌发育不良    颈动脉纤维肌发育不良
    颈动脉狭窄70%    颈动脉狭窄>=70%
    颈动脉狭窄71%    颈动脉狭窄>=70%
    颈动脉狭窄49%    颈动脉狭窄<50%
    颈动脉狭窄50%    颈动脉狭窄[50%-70%)
    颈动脉狭窄51%    颈动脉狭窄[50%-70%)
    颈动脉手术风险高    颈动脉手术风险高
    颈动脉供血区暂时性脑缺血发作    颈动脉供血区暂时性脑缺血发作
    精神性烦渴    精神性烦渴
    精神紧张    精神紧张
    精神病    精神病
    精氨酸加压素生成减少    精氨酸加压素生成减少
    精氨酸加压素降解增加    精氨酸加压素降解增加
    惊厥性发作完全缓解    惊厥性发作完全缓解
    惊厥性发作    惊厥性发作
    惊厥    惊厥
    近期胰腺炎病史    近期胰腺炎病史
    近期使用喹诺酮    近期使用喹诺酮
    近期使用抗菌治疗    近期使用抗菌治疗
    进行性黄疸    进行性黄疸
    进行性腹痛    进行性腹痛
    紧张性木僵者    紧张性木僵者
    结石标本    结石标本
    结膜充血    结膜充血
    结节状盆腔肿物    结节状盆腔肿物
    结节    结节
    结核性腹膜炎    结核性腹膜炎
    结缔组织病    结缔组织病
    结肠内存在造影剂    结肠内存在造影剂
    绞窄性小肠梗阻的体征    绞窄性小肠梗阻的体征
    绞窄性小肠梗阻    绞窄性小肠梗阻
    角膜缘周围结膜充血    角膜缘周围结膜充血
    焦虑    焦虑
    浆液性囊腺瘤    浆液性囊腺瘤
    肩胛骨骨折    肩胛骨骨折
    间歇性鼻后痰中带血    间歇性鼻后痰中带血
    假单胞菌感染    假单胞菌感染
    继发泌尿生殖道感染    继发泌尿生殖道感染
    既往有尿路感染体温:38.6°C病史    既往有尿路感染体温>38.5°C病史
    既往有腹部手术史    既往有腹部手术史
    脊柱左凸    脊柱左凸
    脊柱异常弯曲    脊柱异常弯曲
    脊柱侧凸进展迅速    脊柱侧凸进展迅速
    脊髓损伤    脊髓损伤
    急性血尿    急性血尿
    急性哮喘发作3次/年    急性哮喘发作>2次/年
    急性哮喘发作1次/年    急性哮喘发作<=1次/年
    急性小肠梗阻    急性小肠梗阻
    急性完全性梗阻无尿    急性完全性梗阻无尿
    急性全身感染    急性全身感染
    急性尿路梗阻    急性尿路梗阻
    极度躁动冲动伤人者    极度躁动冲动伤人者
    极度易激惹    极度易激惹
    激惹    激惹
    肌张力减退    肌张力减退
    肌肉骨骼疾病    肌肉骨骼疾病
    机械通气    机械通气
    饥饿感    饥饿感
    活动性结核病    活动性结核病
    昏迷    昏迷
    黄疸    黄疸
    幻觉    幻觉
    怀疑有颈动脉夹层    怀疑有颈动脉夹层
    怀疑胰腺癌    怀疑胰腺癌
    怀疑吸入性肺炎    怀疑吸入性肺炎
    怀疑神经源膀胱    怀疑神经源膀胱
    怀疑全面性惊厥性癫痫持续状态    怀疑全面性惊厥性癫痫持续状态
    怀疑尿路梗阻    怀疑尿路梗阻
    怀疑关节感染者    怀疑关节感染者
    怀疑革兰阴性菌感染    怀疑革兰阴性菌感染
    怀疑附件肿物    怀疑附件肿物
    怀疑肥胖    怀疑肥胖
    怀疑非惊厥性癫痫持续状态    怀疑非惊厥性癫痫持续状态
    怀疑癫痫持续状态    怀疑癫痫持续状态
    怀疑低血糖    怀疑低血糖
    化脓性关节炎    化脓性关节炎
    呼吸暂停    呼吸暂停
    呼吸衰竭    呼吸衰竭
    呼吸急促    呼吸急促
    呼吸不规则    呼吸不规则
    呼出气一氧化氮水平升高    呼出气一氧化氮水平升高
    呼出气一氧化氮升高    呼出气一氧化氮升高
    后尿道结石    后尿道结石
    红细胞沉降率25mm/h    红细胞沉降率ESR>=25mm/h
    红细胞沉降率26mm/h    红细胞沉降率ESR>=25mm/h
    红细胞沉降率101mm/h    红细胞沉降率>100mm/h
    红细胞沉降率:25mm/h    红细胞沉降率>=25mm/h
    红细胞沉降率:26mm/h    红细胞沉降率>=25mm/h
    黑头    黑头
    喝酒    喝酒
    行为紊乱    行为紊乱
    寒战    寒战
    过去一周出现大脑前循环短暂性脑缺血发作TIA或卒中的症状    过去一周出现大脑前循环短暂性脑缺血发作TIA或卒中的症状
    留置导尿管48小时    过去48h内留置导尿管
    留置导尿管47小时    过去48h内留置导尿管
    胱氨酸结石    胱氨酸结石
    冠状动脉旁路手术前评估    冠状动脉旁路手术前评估
    冠状动脉疾病    冠状动脉疾病
    冠心病家族史    冠心病家族史
    关节缺血性坏死    关节缺血性坏死
    寡囊型    寡囊型
    骨髓增殖性疾病    骨髓增殖性疾病
    骨髓炎    骨髓炎
    骨密度Z值:-1.9    骨密度Z值>-2.0
    骨密度Z值:-2.0    骨密度Z值<=-2.0
    骨密度Z值:-2.1    骨密度Z值<=-2.0
    骨密度Z值:2.0    骨密度Z值<=2.0
    骨密度Z值:1.9    骨密度Z值<=2.0
    骨关节疾病    骨关节疾病
    骨骼发育未成熟    骨骼发育未成熟
    骨骼发育成熟    骨骼发育成熟
    股骨骨折    股骨骨折
    孤立肾上尿路结石    孤立肾上尿路结石
    估计碎石后易形成输尿管内石街    估计碎石后易形成输尿管内石街
    估计结石坚硬难碎    估计结石坚硬难碎
    构音障碍    构音障碍
    肱骨中段骨折    肱骨中段骨折
    梗阻性黄疸    梗阻性黄疸
    革兰阳性球菌阳性    革兰阳性球菌阳性
    革兰氏染色阳性    革兰氏染色阳性
    高脂血症    高脂血症
    高位颈动脉分叉    高位颈动脉分叉
    高危自杀倾向    高危自杀倾向
    高危患者心脏瓣膜手术    高危患者心脏瓣膜手术
    血清钠146mmol/L     高钠血症
    高胆固醇血症    高胆固醇血症
    干细胞移植    干细胞移植
    干骺端骨折    干骺端骨折
    感染性尿路结石    感染性尿路结石
    感染性骨关节炎    感染性骨关节炎
    感冒无关的喘息    感冒无关的喘息
    感觉障碍    感觉障碍
    肝功能损害    肝功能损害
    肝大    肝大
    腹网膜结块    腹网膜结块
    腹痛减轻    腹痛减轻
    腹痛不缓解    腹痛不缓解
    腹水量多    腹水量多
    腹腔探查阳性    腹腔探查阳性
    腹膜炎    腹膜炎
    腹膜内游离液体    腹膜内游离液体
    腹部转移    腹部转移
    腹部查体触及盆腔肿物    腹部查体触及盆腔肿物
    腹部X线平片示游离气体    腹部X线平片示游离气体
    复杂血行性感染    复杂血行性感染
    复杂性肾结石    复杂性肾结石
    复杂性膀胱炎    复杂性膀胱炎
    复杂性尿路感染    复杂性尿路感染
    复杂性附件肿物    复杂性附件肿物
    复视    复视
    复发性中耳炎    复发性中耳炎
    复发性尿路感染    复发性尿路感染
    复发性骨折    复发性骨折
    复发性肠梗阻病史    复发性肠梗阻病史
    附件肿物非单纯性囊肿    附件肿物非单纯性囊肿
    附件肿物恶性可能性较大    附件肿物恶性可能性较大
    附件肿物癌变    附件肿物癌变
    附件实性肿物    附件实性肿物
    附件囊肿内间隔    附件囊肿内间隔
    附件囊肿8cm    附件囊肿>7cm
    附件囊壁增厚    附件囊壁增厚
    附件囊壁结节    附件囊壁结节
    附件囊壁不规则    附件囊壁不规则
    附件巨大肿物    附件巨大肿物
    附件间隔结节    附件间隔结节
    附件非强回声的实性成分    附件非强回声的实性成分
    附壁结节    附壁结节
    粉刺    粉刺
    分支胰管型导管内乳头状黏液瘤    分支胰管型导管内乳头状黏液瘤
    分支胰管型    分支胰管型
    分娩期    分娩期
    肺气肿    肺气肿
    肺结节靠近胸壁    肺结节靠近胸壁
    肺结节接近支气管    肺结节接近支气管
    肺结节恶性概率61%    肺结节恶性概率>60%
    肺结节10mm    肺结节>9mm
    肺结节4cm    肺结节>3cm
    肺结节1.1cm    肺结节>1cm
    肺结节7mm    肺结节<8mm
    肺结节9mm    肺结节[9-30)mm
    肺结节29mm    肺结节[9-30)mm
    肺结节    肺结节
    肺部肿块    肺部肿块
    肺部浸润    肺部浸润
    肥胖危险因素    肥胖危险因素
    肥胖报警症状和体征    肥胖报警症状和体征
    肥胖    肥胖
    非炎性开放性粉刺    非炎性开放性粉刺
    非炎性粉刺型痤疮    非炎性粉刺型痤疮
    非炎性痤疮    非炎性痤疮
    非炎性闭合性粉刺    非炎性闭合性粉刺
    非惊厥性癫痫持续状态    非惊厥性癫痫持续状态
    非浸润性鼻咽癌    非浸润性鼻咽癌
    非动脉粥样硬化性颈动脉疾病    非动脉粥样硬化性颈动脉疾病
    非典型认知表现    非典型认知表现
    非变应性鼻结膜炎    非变应性鼻结膜炎
    泛影葡胺激发失败    泛影葡胺激发失败
    泛影葡胺激发    泛影葡胺激发
    反复尿路感染    反复尿路感染
    烦躁不安    烦躁不安
    儿童哮喘分类(梅奥版)间歇期    儿童哮喘症状分类:间歇期
    儿童哮喘分类(梅奥版)持续重度    儿童哮喘症状分类:持续重度
    儿童哮喘分类(梅奥版)持续中度    儿童哮喘症状分类:持续中度
    儿童哮喘分类(梅奥版)持续轻度    儿童哮喘症状分类:持续轻度
    恶性小肠梗阻    恶性小肠梗阻
    恶性生殖细胞肿瘤    恶性生殖细胞肿瘤
    恶性毛玻璃样结节    恶性毛玻璃样结节
    恶心减轻    恶心减轻
    多重耐药菌感染风险高    多重耐药菌感染风险高
    多重耐药    多重耐药
    多药耐药菌感染的危险因素    多药耐药菌感染的危险因素
    多尿的常见病因    多尿的常见病因
    多尿    多尿
    多汗    多汗
    多房性肿瘤    多房性肿瘤
    多发性骨折    多发性骨折
    对正常活动有极度影响    对正常活动有极度影响
    对侧卵巢外观异常    对侧卵巢外观异常
    对侧颈动脉闭塞    对侧颈动脉闭塞
    短效β受体激动剂每天数次可控制    短效β受体激动剂每天数次可控制
    动脉粥样硬化性主动脉瘤    动脉粥样硬化性主动脉瘤
    动脉粥样硬化    动脉粥样硬化
    癫痫患者近期调整抗惊厥药物    癫痫患者近期调整抗惊厥药物
    癫痫发作间期完全缓解    癫痫发作间期完全缓解
    癫痫发作间期不能完全缓解    癫痫发作间期不能完全缓解
    癫痫发作缓解    癫痫发作缓解
    癫痫发作2次    癫痫发作次数>=2次
    癫痫发作3次    癫痫发作次数>=2次
    癫痫发作6分钟    癫痫发作持续>5分钟
    癫痫发作51分钟    癫痫发作持续>50分钟
    癫痫发作75分钟    癫痫发作持续<=75分钟
    癫痫发作74分钟    癫痫发作持续<=75分钟
    癫痫发作70分钟    癫痫发作持续<=70分钟
    癫痫发作69分钟    癫痫发作持续<=70分钟
    癫痫发作65分钟    癫痫发作持续<=65分钟
    癫痫发作64分钟    癫痫发作持续<=65分钟
    癫痫发作5分钟    癫痫发作持续<=5分钟
    癫痫发作4分钟    癫痫发作持续<=5分钟
    癫痫发作50分钟    癫痫发作持续<=50分钟
    癫痫发作40分钟    癫痫发作持续<=40分钟
    癫痫发作39分钟    癫痫发作持续<=40分钟
    癫痫发作30分钟    癫痫发作持续<=30分钟
    癫痫发作29分钟    癫痫发作持续<=30分钟
    癫痫发作持续15分钟    癫痫发作持续<=15分钟
    癫痫发作持续14分钟    癫痫发作持续<=15分钟
    癫痫发作持续10分钟    癫痫发作持续<=10分钟
    癫痫发作持续9分钟    癫痫发作持续<=10分钟
    癫痫发作76分钟    癫痫发作>75分钟
    癫痫发作66分钟    癫痫发作>65分钟
    癫痫发作11分钟    癫痫发作>10分钟
    癫痫发作71分钟    癫痫发作(70-75]分钟
    癫痫发作75分钟    癫痫发作(70-75]分钟
    癫痫发作6分钟    癫痫发作(5-10]分钟
    癫痫发作10分钟    癫痫发作(5-10]分钟
    癫痫发作51分钟    癫痫发作(50-70]分钟
    癫痫发作70分钟    癫痫发作(50-70]分钟
    癫痫发作51分钟    癫痫发作(50-65]分钟
    癫痫发作65分钟    癫痫发作(50-65]分钟
    癫痫发作41分钟    癫痫发作(40-50]分钟
    癫痫发作50分钟    癫痫发作(40-50]分钟
    癫痫发作31分钟    癫痫发作(30-50]分钟
    癫痫发作50分钟    癫痫发作(30-50]分钟
    癫痫发作16分钟    癫痫发作(15-40]分钟
    癫痫发作16分钟    癫痫发作(15-30]分钟
    癫痫发作30分钟    癫痫发作(15-30]分钟
    癫痫发作11分钟    癫痫发作(10-40]分钟
    癫痫发作40分钟    癫痫发作(10-40]分钟
    癫痫发作11分钟    癫痫发作(10-15]分钟
    癫痫发作15分钟    癫痫发作(10-15]分钟
    癫痫发作    癫痫发作
    癫痫持续状态    癫痫持续状态
    癫痫持续状态    癫痫持续状态
    癫痫    癫痫
    地美环素    地美环素
    低血糖症状    低血糖症状
    低血糖风险高    低血糖风险高
    低危自杀倾向    低危自杀倾向
    低危卵巢肿瘤    低危卵巢肿瘤
    低危多重耐药菌感染β内酰胺类过敏    低危多重耐药菌感染β内酰胺类过敏
    低危多重耐药菌感染    低危多重耐药菌感染
    低能量创伤有关骨折3次    低能量创伤有关骨折>2次
    低级别卵巢侵袭性肿瘤    低级别卵巢侵袭性肿瘤
    导尿管相关性尿路感染    导尿管相关性尿路感染
    导尿管导尿尿液标本任一次尿菌落计数:10^2 CFU/ml    导尿管导尿尿液标本任一次尿菌落计数>=10E2CFU/ml
    导尿管导尿尿液标本任一次尿菌落计数:11^2 CFU/ml    导尿管导尿尿液标本任一次尿菌落计数>=10E2CFU/ml
    导管内乳头状黏液瘤    导管内乳头状黏液瘤
    单纯性膀胱炎    单纯性膀胱炎
    单纯性尿路感染    单纯性尿路感染
    单纯性附件囊肿8cm    单纯性附件囊肿>7cm
    单纯性附件囊肿6cm    单纯性附件囊肿(5-7]cm
    单纯性附件囊肿7cm    单纯性附件囊肿(5-7]cm
    单侧运动障碍    单侧运动障碍
    单侧性耳阻塞感    单侧性耳阻塞感
    单侧性耳鸣    单侧性耳鸣
    单侧性耳闷胀    单侧性耳闷胀
    单侧头痛    单侧头痛
    单侧肾积脓功能丧失    单侧肾积脓功能丧失
    单侧眶周胀痛    单侧眶周胀痛
    单侧复视    单侧复视
    代谢异常    代谢异常
    大肠杆菌感染    大肠杆菌感染
    大肠杆菌对甲氧苄啶-磺胺甲噁唑的耐药率<20%    大肠杆菌对甲氧苄啶-磺胺甲噁唑的耐药率<20%
    大肠杆菌对氟喹诺酮的耐药率10%    大肠杆菌对氟喹诺酮的耐药率>=10%
    大肠杆菌对氟喹诺酮的耐药率11%    大肠杆菌对氟喹诺酮的耐药率>=10%
    大肠杆菌对氟喹诺酮的耐药率9%    大肠杆菌对氟喹诺酮的耐药率<10%
    打算实施自杀    打算实施自杀
    痤疮    痤疮
    痤疮    痤疮
    存在哮喘危险症状    存在哮喘危险症状
    存在耐药菌    存在耐药菌
    存在免疫力抑制    存在免疫力抑制
    纯磨玻璃肺结节    纯磨玻璃肺结节
    喘息    喘息
    初始治疗有效    初始治疗有效
    初始治疗无效    初始治疗无效
    初始治疗发作未缓解    初始治疗发作未缓解
    初始抗抑郁药物治疗后显著副作用    初始抗抑郁药物治疗后显著副作用
    初始抗抑郁药物治疗不耐受    初始抗抑郁药物治疗不耐受
    初始抗抑郁药物无效    初始抗抑郁药物无效
    初始经验性治疗失败    初始经验性治疗失败
    初次尿路感染年龄1月    初次尿路感染年龄<2个月
    出血性卵巢囊肿    出血性卵巢囊肿
    出血性疾病    出血性疾病
    出血性动脉畸瘤    出血性动脉畸瘤
    充血性心力衰竭    充血性心力衰竭
    耻骨弓上压痛    耻骨弓上压痛
    耻骨弓上方疼痛    耻骨弓上方疼痛
    耻骨弓上方不适    耻骨弓上方不适
    持续性抑郁障碍    持续性抑郁障碍
    持续性咳嗽    持续性咳嗽
    持续性鼻塞    持续性鼻塞
    持续皮肤刺激    持续皮肤刺激
    持续多尿    持续多尿
    持续单侧流涕    持续单侧流涕
    持续存在尿路感染    持续存在尿路感染
    吃奶情况差    吃奶情况差
    超重    超重
    常规治疗难以改善息肉病变    常规治疗难以改善息肉病变
    常规治疗难以改善鼻部炎症    常规治疗难以改善鼻部炎症
    肠系膜血管充血    肠系膜血管充血
    肠系膜水肿    肠系膜水肿
    肠系膜扭转    肠系膜扭转
    肠球菌感染    肠球菌感染
    肠腔外存在造影剂    肠腔外存在造影剂
    肠管壁增厚    肠管壁增厚
    肠壁积气    肠壁积气
    侧腹痛    侧腹痛
    草酸钙类结石    草酸钙类结石
    彩色多普勒血流显像显示附件实性成分内有血流    彩色多普勒血流显像显示附件实性成分内有血流
    不稳定动脉畸瘤    不稳定动脉畸瘤
    不透过X线结石    不透过X线结石
    不适合手术    不适合手术
    不能安全吞咽    不能安全吞咽
    不耐受抗抑郁药物减量    不耐受抗抑郁药物减量
    不耐受氟喹诺酮    不耐受氟喹诺酮
    哺乳期    哺乳期
    跛行怀疑关节感染者    跛行怀疑关节感染者
    跛行    跛行
    搏动性耳鸣    搏动性耳鸣
    病原体不是大肠杆菌    病原体不是大肠杆菌
    病态面容    病态面容
    病情恶化    病情恶化
    病情不稳定    病情不稳定
    病理性骨折    病理性骨折
    变应性哮喘    变应性哮喘
    变应性黑眼圈    变应性黑眼圈
    变应性鼻炎    变应性鼻炎
    变应性鼻结膜炎治疗无效    变应性鼻结膜炎治疗无效
    闭袢性梗阻    闭袢性梗阻
    比平时活动增多    比平时活动增多
    鼻中隔偏曲    鼻中隔偏曲
    鼻用类固醇激素耐药    鼻用类固醇激素耐药
    鼻翼扇动    鼻翼扇动
    鼻痒    鼻痒
    鼻咽未分化癌    鼻咽未分化癌
    鼻咽角化鳞状细胞癌    鼻咽角化鳞状细胞癌
    鼻咽分化癌    鼻咽分化癌
    鼻咽非角化性癌    鼻咽非角化性癌
    鼻咽癌转移性疾病症状    鼻咽癌转移性疾病症状
    鼻咽癌局部复发    鼻咽癌局部复发
    鼻咽癌复发    鼻咽癌复发
    鼻咽癌TisN0M0期    鼻咽癌TisN0M0期
    鼻咽癌UICC/AJCC分期第8版T4期    鼻咽癌T4期
    鼻咽癌T4N3M0期    鼻咽癌T4N3M0期
    鼻咽癌T4N2M0期    鼻咽癌T4N2M0期
    鼻咽癌T4N1M0期    鼻咽癌T4N1M0期
    鼻咽癌T4N0M0期    鼻咽癌T4N0M0期
    鼻咽癌UICC/AJCC分期第8版T3期    鼻咽癌T3期
    鼻咽癌T3N3M0期    鼻咽癌T3N3M0期
    鼻咽癌T3N2M0期    鼻咽癌T3N2M0期
    鼻咽癌T3N1M0期    鼻咽癌T3N1M0期
    鼻咽癌T3N0M0期    鼻咽癌T3N0M0期
    鼻咽癌UICC/AJCC分期第8版T2期    鼻咽癌T2期
    鼻咽癌T2N2M0期    鼻咽癌T2N2M0期
    鼻咽癌T2N1M0期    鼻咽癌T2N1M0期
    鼻咽癌T2N0M0期    鼻咽癌T2N0M0期
    鼻咽癌UICC/AJCC分期第8版T1期    鼻咽癌T1期
    鼻咽癌T1N3M0期    鼻咽癌T1N3M0期
    鼻咽癌T1N2M0期    鼻咽癌T1N2M0期
    鼻咽癌T1N1M0期    鼻咽癌T1N1M0期
    鼻咽癌T1N0M0期    鼻咽癌T1N0M0期
    鼻咽癌T0N3M0期    鼻咽癌T0N3M0期
    鼻咽癌T0N2M0期    鼻咽癌T0N2M0期
    鼻咽癌T0N1M0期    鼻咽癌T0N1M0期
    鼻咽癌UICC/AJCC分期第8版Nx期    鼻咽癌Nx期
    鼻咽癌UICC/AJCC分期第8版N3期    鼻咽癌N3期
    鼻咽癌UICC/AJCC分期第8版N2期    鼻咽癌N2期
    鼻咽癌UICC/AJCC分期第8版N1期    鼻咽癌N1期
    鼻咽癌UICC/AJCC分期第8版N0期    鼻咽癌N0期
    鼻息肉    鼻息肉
    鼻塞    鼻塞
    鼻清稀分泌物    鼻清稀分泌物
    鼻腔溃疡    鼻腔溃疡
    鼻衄    鼻衄
    鼻脓性分泌物    鼻脓性分泌物
    鼻黏膜水肿    鼻黏膜水肿
    鼻黏膜苍白    鼻黏膜苍白
    鼻-鼻窦炎    鼻-鼻窦炎
    苯妥英给药后    苯妥英给药后
    瘢痕形成    瘢痕形成
    白细胞减少    白细胞减少
    白头    白头
    阿司匹林哮喘    阿司匹林哮喘
    阿司匹林禁忌症    阿司匹林禁忌症
    阿尔茨海默病痴呆    阿尔茨海默病痴呆
    阿尔茨海默病    阿尔茨海默病
    阿尔茨海默病    阿尔茨海默病
    β内酰胺类过敏    β内酰胺类过敏
    X线阴性结石    X线阴性结石
    X线阳性结石    X线阳性结石
    Tanner分期0期    Tanner分期[0期-3期]
    Tanner分期3期    Tanner分期[0期-3期]
    Risser征4级    Risser征[4级-5级]
    Risser征5级    Risser征[4级-5级]
    Risser征0级    Risser征[0级-3级]
    患者健康问卷(PHQ-9)抑郁自评量表5分    PHQ-9评分>=5分
    患者健康问卷(PHQ-9)抑郁自评量表6分    PHQ-9评分>=5分
    患者健康问卷(PHQ-9)抑郁自评量表20分    PHQ-9量表评分>=20分
    患者健康问卷(PHQ-9)抑郁自评量表5分    PHQ-9量表评分[5分-10分)
    患者健康问卷(PHQ-9)抑郁自评量表9分    PHQ-9量表评分[5分-10分)
    患者健康问卷(PHQ-9)抑郁自评量表10分    PHQ-9量表评分[10分-20分)
    患者健康问卷(PHQ-9)抑郁自评量表19分    PHQ-9量表评分[10分-20分)
    PHQ-9#9问题:1分    PHQ-9#9问题>=1分
    PHQ-9#9问题:2分    PHQ-9#9问题>=1分
    PET-CT扫描肺结节示为恶性    PET-CT扫描肺结节示为恶性
    MRI禁忌    MRI禁忌
    I期卵巢癌    I期卵巢癌
    IV期鼻咽癌    IV期鼻咽癌
    II期卵巢癌    II期卵巢癌
    III期鼻咽癌    III期鼻咽癌
    ICU抗菌治疗无效    ICU抗菌治疗无效
    ICU抗菌治疗72h无效    ICU抗菌治疗72h无效
    IA期卵巢癌    IA期卵巢癌
    HIV感染    HIV感染
    FEV1正常    FEV1正常
    FEV1:81%    FEV1>80%
    FEV1:59%    FEV1<60%
    FEV1:60%    FEV1[60-80]%
    FEV1:61%    FEV1[60-80]%
    FEV1/FVC:86%    FEV1/FVC>85%
    FEV1/FVC:81%    FEV1/FVC>80%
    FEV1/FVC:74%    FEV1/FVC<75%
    FEV1/FVC:75%    FEV1/FVC[75-80]%
    FEV1/FVC:80%    FEV1/FVC[75-80]%
    ESR:101mm/h    ESR>100mm/h
    ESR:25mm/h    ESR>=25mm/h
    ESR:26mm/h    ESR>=25mm/h
    ENA阴性    ENA阴性
    ENA阳性    ENA阳性
    C-反应蛋白101mg/L    C-反应蛋白>100mg/L
    CURB-65评分3分    CURB-65评分>=3分
    CURB-65评分4分    CURB-65评分>=3分
    CURB-65评分2分    CURB-65评分=2分
    CURB-65评分1分    CURB-65评分=1分
    CURB-65评分0分    CURB-65评分=0分
    CURB-65评分0分    CURB-65评分[0-1]分
    CURB-65评分1分    CURB-65评分[0-1]分
    CT禁忌    CT禁忌
    CT检查示小肠扩张    CT检查示小肠扩张
    CT检查示门静脉积气    CT检查示门静脉积气
    CRP:101mg/L    CRP>100mg/L
    CRP:10mg/L    CRP>=10mg/L
    CRP:11mg/L    CRP>=10mg/L
    CRB-65评估严重程度评分4分    CRB-65评估严重程度评分=4分
    CRB-65评估严重程度评分3分    CRB-65评估严重程度评分=3分
    CRB-65评估严重程度评分2分    CRB-65评估严重程度评分=2分
    CRB-65评估严重程度评分1分    CRB-65评估严重程度评分=1分
    CRB-65评估严重程度评分0分    CRB-65评估严重程度评分=0分
    Cobb角41°    Cobb角>40°
    Cobb角50°    Cobb角>=50°
    Cobb角51°    Cobb角>=50°
    Cobb角10°    Cobb角>=10°
    Cobb角11°    Cobb角>=10°
    Cobb角40°    Cobb角<=40°
    Cobb角39°    Cobb角<=40°
    Cobb角40°    Cobb角[40°-50°]
    Cobb角50°    Cobb角[40°-50°]
    Cobb角20°    Cobb角[20°-45°]
    Cobb角45°    Cobb角[20°-45°]
    Cobb角10°    Cobb角[10°-20°)
    Cobb角19°    Cobb角[10°-20°)
    CD4计数199个/mm3    CD4计数<200个/mm3
    CD4百分比14%    CD4百分比<15%
    CCr:29ml/min    CCr<=30ml/min
    CA-125升高    CA-125水平升高
    CA-125:201U/ml    CA-125>200U/ml
    CA-125:35U/ml    CA-125>=35U/ml
    CA-125:36U/ml    CA-125>=35U/ml
    BMI百分位99%    BMI百分位>=99%
    BMI百分位99.1%    BMI百分位>=99%
    BMI百分位95%    BMI百分位[95%-99%)
    BMI百分位98%    BMI百分位[95%-99%)
    BMI百分位86%    BMI百分位(85%-95%)
    BMI百分位94%    BMI百分位(85%-95%)
    BMI:36kg/m2    BMI>35kg/m2
    BMI:36kg/m2    BMI>=35
    ANA阴性    ANA阴性
    ANA阳性    ANA阳性
    ANA检测1U    ANA检测[1U-3U]
    ANA:4U    ANA>3U
    ANA:1U    ANA>=1U
    ANA:2U    ANA>=1U
    ANA:1:640(IFA法)    ANA>=1:640(IFA法)
    ANA:1:639(IFA法)    ANA>=1:640(IFA法)
    ANA:0.9U    ANA<1U
    ANA:1U    ANA[1U-3U]
    ANA:3U    ANA[1U-3U]
    ANA1:40(IFA法)    ANA[1:40-1:320](IFA法)
    ANA1:320(IFA法)    ANA[1:40-1:320](IFA法)
    儿童哮喘分类(梅奥版):20分    ACT>19分
    儿童哮喘分类(梅奥版)15分    ACT<16分
    儿童哮喘分类(梅奥版)16分    ACT[16-19]分
    儿童哮喘分类(梅奥版)19分    ACT[16-19]分
    Ⅳ期卵巢癌    Ⅳ期卵巢癌
    Ⅳ级痤疮    Ⅳ级痤疮
    Ⅲ期卵巢癌    Ⅲ期卵巢癌
    Ⅲ级痤疮    Ⅲ级痤疮
    6个月内体重下降>10%    6个月内体重下降>10%
    60岁之前动脉粥样硬化的家族史    60岁之前动脉粥样硬化的家族史
    使用抗生素治疗3月    3个月内使用抗生素治疗
    使用抗生素治疗2月    3个月内使用抗生素治疗
    2种试验性治疗无效    2种试验性治疗无效
    2型糖尿病家族史    2型糖尿病家族史
    24小时总尿量4L    24小时总尿量>3L
    24小时总尿量:2001ml/m2    24小时总尿量>2000ml/m2体表面积
    1型糖尿病    1型糖尿病
    喘息发作5次/年    1年喘息发作>4次
    月经初潮后3年    >月经初潮后2年
    脓丘疱疹:20个    >=20个脓丘疱疹
    脓丘疱疹:21个    >=20个脓丘疱疹
    实性肺结节7mm    <8mm实性肺结节
    脓丘疱疹19个    <20个脓丘疱疹
    肺结节9mm    肺结节>=9mm
    肺结节10mm    肺结节>=9mm
    低能量创伤有关骨折2次    低能量创伤有关骨折>=2次
    低能量创伤有关骨折3次    低能量创伤有关骨折>=2次
    哮喘发作持续1天    哮喘发作持续>=1天
    哮喘发作持续2天    哮喘发作持续>=1天
    实性肺结节8mm    <=8mm实性肺结节
    实性肺结节7mm    <=8mm实性肺结节
    哮喘症状2天/周    哮喘症状<=2天/周
    哮喘症状1天/周    哮喘症状<=2天/周
    血氧饱和度90%    血氧饱和度<=90%
    血氧饱和度89%    血氧饱和度<=90%
    肺结节8mm    肺结节<=8mm
    肺结节7mm    肺结节<=8mm
    肺结节3cm    肺结节>=3cm
    肺结节4cm    肺结节>=3cm
    短效β受体激动剂每天1次可控制    短效β受体激动剂每天1次可控制
    轻度影响正常活动    轻度影响正常活动
    喘息发作4次/年    1年喘息发作>=4次
    喘息发作5次/年    1年喘息发作>=4次
    血嗜酸性粒细胞4%    血嗜酸性粒细胞>=4%
    血嗜酸性粒细胞5%    血嗜酸性粒细胞>=4%
    每天有哮喘症状    每天有哮喘症状