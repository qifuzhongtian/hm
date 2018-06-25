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
识别接口03261_0416_0430_0530_0531批次
    房间隔卵圆孔探及左向右分流呈红色为主的过隔血流束    房间隔卵圆孔探及左向右分流呈红色为主的过隔血流束
    腹腔内可见孕囊    腹腔内可见孕囊
    室间隔1.5cm    室间隔>=1.5cm
    室间隔1.6cm    室间隔>=1.5cm
    二尖瓣反流束面积4cm2    二尖瓣反流束面积[4-8]cm2
    二尖瓣反流束面积8cm2    二尖瓣反流束面积[4-8]cm2
    输卵管内可见孕囊    输卵管内可见孕囊
    宫颈内可见孕囊    宫颈内可见孕囊
    胎心    胎心
    胎芽    胎芽
    宫腔内未见孕囊    宫腔内未见孕囊
    卵黄囊    卵黄囊
    宫颈内可见孕囊    宫颈内可见孕囊
    腹腔内可见孕囊    腹腔内可见孕囊
    输卵管内可见孕囊    输卵管内可见孕囊
    主动脉瓣回声增强    主动脉瓣回声增强
    二尖瓣回声增强    二尖瓣回声增强
    左室舒张末期容积增加    左室舒张末期容积增加
    收缩期左房下部探及少量反流    收缩期左房下部探及少量反流
    收缩期右房下部探及少量反流    收缩期右房下部探及少量反流
    宫颈内可见胎心    宫颈内可见胎心
    宫颈内可见卵黄囊    宫颈内可见卵黄囊
    宫颈内可见胎芽    宫颈内可见胎芽
    腹腔内可见胎心    腹腔内可见胎心
    腹腔内可见卵黄囊    腹腔内可见卵黄囊
    腹腔内可见胎芽    腹腔内可见胎芽
    输卵管内可见胎心    输卵管内可见胎心
    输卵管内可见卵黄囊    输卵管内可见卵黄囊
    输卵管内可见胎芽    输卵管内可见胎芽
    口炎    口炎
    慢性扁桃体炎    慢性扁桃体炎
    阴茎阴囊部尿道下裂    阴茎阴囊部尿道下裂
    急性肛裂    急性肛裂
    蛔虫病    蛔虫病
    念珠菌性口炎    念珠菌性口炎
    分泌性中耳炎    分泌性中耳炎
    肛瘘    肛瘘
    急性扁桃体炎    急性扁桃体炎
    急性化脓性扁桃体炎    急性化脓性扁桃体炎
    龟头型尿道下裂    龟头型尿道下裂
    扁桃体周脓肿    扁桃体周脓肿
    链球菌性扁桃体炎    链球菌性扁桃体炎
    阴茎部尿道下裂    阴茎部尿道下裂
    急性肠套叠    急性肠套叠
    小儿肠套叠    小儿肠套叠
    尿道下裂    尿道下裂
    腭裂    腭裂
    蛲虫病    蛲虫病
    儿童消化不良    儿童消化不良
    慢性肛裂    慢性肛裂
    会阴部尿道下裂    会阴部尿道下裂
    急性阑尾炎    急性阑尾炎
    粘连性中耳炎    粘连性中耳炎
    细菌性口炎    细菌性口炎
    肛周脓肿    肛周脓肿
    功能性消化不良    功能性消化不良
    疱疹病毒性口炎    疱疹病毒性口炎
    疱疹病毒性咽扁桃体炎    疱疹病毒性咽扁桃体炎
    口炎    口炎
    慢性扁桃体炎    慢性扁桃体炎
    阴茎阴囊部尿道下裂    阴茎阴囊部尿道下裂
    急性肛裂    急性肛裂
    蛔虫病    蛔虫病
    念珠菌性口炎    念珠菌性口炎
    分泌性中耳炎    分泌性中耳炎
    肛瘘    肛瘘
    急性扁桃体炎    急性扁桃体炎
    急性化脓性扁桃体炎    急性化脓性扁桃体炎
    龟头型尿道下裂    龟头型尿道下裂
    扁桃体周脓肿    扁桃体周脓肿
    链球菌性扁桃体炎    链球菌性扁桃体炎
    阴茎部尿道下裂    阴茎部尿道下裂
    急性肠套叠    急性肠套叠
    小儿肠套叠    小儿肠套叠
    尿道下裂    尿道下裂
    腭裂    腭裂
    蛲虫病    蛲虫病
    儿童消化不良    儿童消化不良
    慢性肛裂    慢性肛裂
    会阴部尿道下裂    会阴部尿道下裂
    急性阑尾炎    急性阑尾炎
    粘连性中耳炎    粘连性中耳炎
    细菌性口炎    细菌性口炎
    肛周脓肿    肛周脓肿
    功能性消化不良    功能性消化不良
    疱疹病毒性口炎    疱疹病毒性口炎
    疱疹病毒性咽扁桃体炎    疱疹病毒性咽扁桃体炎
    扁桃体周围脓肿    扁桃体周围脓肿
    肛裂    肛裂
    肛裂    肛裂
    消化不良    消化不良
    咽旁脓肿    咽旁脓肿
    肠套叠    肠套叠
    肠套叠    肠套叠
    胃食管反流病    胃食管反流病
    咽后脓肿    咽后脓肿
    复杂性肛瘘    复杂性肛瘘
    耳痛    耳痛
    肛门梳硬结    肛门梳硬结
    认识障碍    认识障碍
    扁桃体炎急性发作期    扁桃体炎急性发作期
    弥漫性腹膜炎    弥漫性腹膜炎
    鼻咽癌高危人群    鼻咽癌高危人群
    听力测试声导抗B型    听力测试声导抗为B型
    颅面部发育异常    颅面部发育异常
    肛门狭窄    肛门狭窄
    心理障碍    心理障碍
    括约肌上瘘    括约肌上瘘
    唇疱疹    唇疱疹
    OME    OME
    非化脓性中耳炎    非化脓性中耳炎
    局部肠袢失活坏死    局部肠袢失活坏死
    急性化脓性扁桃体炎反复发作    急性化脓性扁桃体炎反复发作
    鼓室压图    鼓室压图
    蛔幼性肺炎    蛔幼性肺炎
    青霉素皮试过敏    青霉素皮试过敏
    晚期单纯性肠梗阻    晚期单纯性肠梗阻
    软腭过短    软腭过短
    LA-C级    LA-C级
    两性畸形    两性畸形
    单纯性肛瘘    单纯性肛瘘
    中耳积液持续时间4月    中耳积液持续时间>3个月
    肠管肿瘤    肠管肿瘤
    β-内酰胺类过敏    β-内酰胺类过敏
    裂口近端肛乳头肥大    裂口近端肛乳头肥大
    阑尾穿孔    阑尾穿孔
    乳突积液持续时间4月    乳突积液持续时间>3个月
    耳聋    耳聋
    运动发育迟缓    运动发育迟缓
    脐上疼痛持续发作    脐上疼痛持续发作
    急性单纯性阑尾炎    急性单纯性阑尾炎
    下颌明显后缩    下颌明显后缩
    肛管黏膜单纯撕裂    肛管黏膜单纯撕裂
    LA-D级    LA-D级
    结核性肠炎    结核性肠炎
    排便不畅    排便不畅
    单侧隐睾    单侧隐睾
    低位肠梗阻    低位肠梗阻
    高位肛瘘    高位肛瘘
    气压创伤性中耳炎    气压创伤性中耳炎
    复发性急性中耳炎    复发性急性中耳炎
    消化不良病程3月    消化不良病程>2月
    咽鼓管鼓室炎    咽鼓管鼓室炎
    难治性胃食管反流病    难治性胃食管反流病
    中耳积液持续时间3月    中耳积液持续时间<=3个月
    中耳积液持续时间2月    中耳积液持续时间<=3个月
    括约肌外瘘    括约肌外瘘
    卡他性中耳炎    卡他性中耳炎
    鼓室探查术    鼓室探查术
    术后疼痛    术后疼痛
    声导抗测试    声导抗测试
    中耳积液    中耳积液
    慢性化脓性中耳炎    慢性化脓性中耳炎
    PPI治疗失败    PPI治疗失败
    反复发作咽痛    反复发作咽痛
    诊断性PPI治疗有效    诊断性PPI治疗有效
    肠套叠待查    肠套叠待查
    妊娠早期    妊娠早期
    急性化脓性中耳炎    急性化脓性中耳炎
    黏液性中耳炎    黏液性中耳炎
    上颌骨段严重移位    上颌骨段严重移位
    蛔虫性肠梗阻    蛔虫性肠梗阻
    经括约肌瘘    经括约肌瘘
    语言发育迟缓    语言发育迟缓
    坐骨直肠窝脓肿    坐骨直肠窝脓肿
    急性化脓性扁桃体    急性化脓性扁桃体
    腹腔脓肿扩大    腹腔脓肿扩大
    中耳积液导致听力损失20dB    中耳积液导致听力损失<=20dB
    中耳积液导致听力损失19dB    中耳积液导致听力损失<=20dB
    双侧隐睾    双侧隐睾
    急性肠套叠待查    急性肠套叠待查
    乳突积液持续时间3月    乳突积液持续时间<=3个月
    乳突积液持续时间2月    乳突积液持续时间<=3个月
    手法复位失败    手法复位失败
    中耳通气引流时间7个月    中耳通气引流时间>6个月
    脐上疼痛反复发作    脐上疼痛反复发作
    中耳通气引流时间6月    中耳通气引流时间<=6个月
    中耳通气引流时间5月    中耳通气引流时间<=6个月
    直肠后脓肿    直肠后脓肿
    扁桃体切除术    扁桃体切除术
    术前    术前
    轻度食管炎    轻度食管炎
    小儿肠套叠待查    小儿肠套叠待查
    重度食管炎    重度食管炎
    扁桃体炎    扁桃体炎
    精神心理障碍    精神心理障碍
    咽鼓管鼓室卡他    咽鼓管鼓室卡他
    渗出性中耳炎    渗出性中耳炎
    易疲劳    易疲劳
    炎症性狭窄    炎症性狭窄
    急性扁桃体炎反复发作    急性扁桃体炎反复发作
    直肠指检波动感    直肠指检波动感
    肛裂术后肛门失禁    肛裂术后肛门失禁
    浆液性中耳炎    浆液性中耳炎
    裂口远端前哨痔    裂口远端前哨痔
    非酸反流食管炎    非酸反流食管炎
    阑尾炎炎性包块    阑尾炎炎性包块
    括约肌间瘘    括约肌间瘘
    粘连性中耳炎待查    粘连性中耳炎待查
    蛔虫性嗜酸粒细胞性肺炎    蛔虫性嗜酸粒细胞性肺炎
    牙列紊乱    牙列紊乱
    急性穿孔性阑尾炎    急性穿孔性阑尾炎
    急性化脓性阑尾炎穿孔    急性化脓性阑尾炎穿孔
    隐窝口潴留物    隐窝口潴留物
    肠坏死    肠坏死
    腭咽闭合功能差    腭咽闭合功能差
    言语发育延迟    言语发育延迟
    脱水征    脱水征
    中耳腔积液    中耳腔积液
    扁桃体慢性充血    扁桃体慢性充血
    食管裂孔疝    食管裂孔疝
    克罗恩病肛瘘    克罗恩病肛瘘
    急性阑尾炎穿孔    急性阑尾炎穿孔
    发音障碍    发音障碍
    活动性消化道出血    活动性消化道出血
    结核性肛瘘    结核性肛瘘
    鼓膜严重内陷    鼓膜严重内陷
    裂隙过宽    裂隙过宽
    面中部塌陷    面中部塌陷
    咽鼓管阻塞    咽鼓管阻塞
    未使用PPI    未使用PPI
    停经史    停经史
    外伤性肛瘘    外伤性肛瘘
    阴茎下弯    阴茎下弯
    陈旧性肛裂    陈旧性肛裂
    HP阳性    HP阳性
    顽固性肛裂    顽固性肛裂
    咀嚼障碍    咀嚼障碍
    肛门失禁    肛门失禁
    吸吮障碍    吸吮障碍
    肛裂皮下瘘管    肛裂皮下瘘管
    尿道口距阴茎头1.1cm    尿道口距阴茎头>1cm
    神经障碍    神经障碍
    牙咬合紊乱    牙咬合紊乱
    灌肠复位失败    灌肠复位失败
    肠梗阻待查    肠梗阻待查
    肛裂病8周    肛裂病程>=8周
    肛裂病9周    肛裂病程>=8周
    腹泻持续时间3月    腹泻持续时间>2个月
    长期PPI治疗    长期PPI治疗
    低位肛瘘    低位肛瘘
    胆道蛔虫    胆道蛔虫
    使用PPI    使用PPI
    腺样体新生物    腺样体新生物
    中耳积液导致听力损失21dB    中耳积液导致听力损失>20dB
    有青霉素过敏性休克史    有青霉素过敏性休克史
    蛲虫病待查    蛲虫病待查
    肠道蛔虫    肠道蛔虫
    咽鼓管功能不良    咽鼓管功能不良
    心电图正常    心电图正常
    中耳疾患    中耳疾患
    HP感染    HP感染
    腭裂语音    腭裂语音
    蛔虫性腹膜炎    蛔虫性腹膜炎
    早期肛裂    早期肛裂
    蛔虫性阑尾炎    蛔虫性阑尾炎
    肛裂溃疡    肛裂溃疡
    化脓性中耳炎    化脓性中耳炎
    中耳感染    中耳感染
    腭舌弓慢性充血    腭舌弓慢性充血
    急性扁桃体炎炎症控制    急性扁桃体炎炎症控制
    肛管高位肌间脓肿    肛管高位肌间脓肿
    灌肠    灌肠
    AOM    AOM
    感音神经性聋    感音神经性聋
    阑尾周围脓肿    阑尾周围脓肿
    消化道活动性出血    消化道活动性出血
    阴茎体尿道下裂    阴茎体尿道下裂
    骨盆直肠脓肿    骨盆直肠脓肿
    胶耳    胶耳
    急性化脓性阑尾炎    急性化脓性阑尾炎
    会阴型尿道下裂    会阴型尿道下裂
    急性结肠梗阻    急性结肠梗阻
    急性坏疽性阑尾炎    急性坏疽性阑尾炎
    急性坏疽性阑尾炎穿孔    急性坏疽性阑尾炎穿孔
    先天性食管闭锁    先天性食管闭锁
    先天性小肠闭锁    先天性小肠闭锁
    先天性脐膨出    先天性脐膨出
    三尖瓣下移    三尖瓣下移
    戊型病毒性肝炎    戊型病毒性肝炎
    先天性食管狭窄    先天性食管狭窄
    先天性胆道闭锁    先天性胆道闭锁
    先天性马蹄内翻足    先天性马蹄内翻足
    痔    痔
    不完全型川崎病    不完全型川崎病
    小儿皮肤黏膜淋巴结综合征    小儿皮肤黏膜淋巴结综合征
    急性坏死性中耳炎    急性坏死性中耳炎
    川崎病    川崎病
    先天性肺动脉瓣狭窄    先天性肺动脉瓣狭窄
    法洛四联症    法洛四联症
    有机磷中毒    有机磷中毒
    先天性甲状腺功能减退    先天性甲状腺功能减退
    先天性漏斗胸    先天性漏斗胸
    先天性食管闭锁    先天性食管闭锁
    先天性小肠闭锁    先天性小肠闭锁
    先天性脐膨出    先天性脐膨出
    三尖瓣下移    三尖瓣下移
    戊型病毒性肝炎    戊型病毒性肝炎
    先天性食管狭窄    先天性食管狭窄
    先天性胆道闭锁    先天性胆道闭锁
    先天性马蹄内翻足    先天性马蹄内翻足
    痔    痔
    不完全型川崎病    不完全型川崎病
    小儿皮肤黏膜淋巴结综合征    小儿皮肤黏膜淋巴结综合征
    急性坏死性中耳炎    急性坏死性中耳炎
    川崎病    川崎病
    先天性肺动脉瓣狭窄    先天性肺动脉瓣狭窄
    法洛四联症    法洛四联症
    有机磷中毒    有机磷中毒
    先天性甲状腺功能减退    先天性甲状腺功能减退
    先天性漏斗胸    先天性漏斗胸
    消化道接触有机磷毒物    消化道接触有机磷毒物
    先天性漏斗胸待查    先天性漏斗胸待查
    心室发育不良    心室发育不良
    巨大脐膨出    巨大脐膨出
    冠状动脉内腔明显不规则    冠状动脉内腔明显不规则
    TSH31mIU/L    TSH>30mIU/L
    房间隔缺损术后    房间隔缺损术后
    大便恶臭    大便恶臭
    高镁血症    高镁血症
    不宜行球囊扩张    不宜行球囊扩张
    周围性面瘫    周围性面瘫
    敌敌畏中毒    敌敌畏中毒
    肌酐清除率91ml/min    肌酐清除率>90ml/min
    有机磷中毒待查    有机磷中毒待查
    TSH30mIU/L    TSH<=30mIU/L
    TSH29mIU/L    TSH<=30mIU/L
    外周肺动脉分支发育不良    外周肺动脉分支发育不良
    先天性马蹄内翻足轻型    先天性马蹄内翻足轻型
    乳突病变    乳突病变
    骨疡型慢性化脓性中耳炎    骨疡型慢性化脓性中耳炎
    体肺侧支血管    体肺侧支血管
    肢体畸形    肢体畸形
    胚胎期漏斗部发育不良    胚胎期漏斗部发育不良
    有机磷中毒未治疗者    有机磷中毒未治疗者
    冠状动脉Z值4    冠状动脉Z值<5
    先天性小肠闭锁待查    先天性小肠闭锁待查
    任一节段冠状动脉内径超过邻近节段1.5倍    任一节段冠状动脉内径超过邻近节段1.5倍
    先天性脐膨出术后    先天性脐膨出术后
    肌力减退    肌力减退
    烟碱样症状    烟碱样症状
    食管吻合口狭窄    食管吻合口狭窄
    一期手术肠吻合困难    一期手术肠吻合困难
    胆碱酯酶活力降低    胆碱酯酶活力降低
    IVIG有反应    IVIG有反应
    乳突根治术    乳突根治术
    发热4天    发热<5天
    符合心脏移植指征    符合心脏移植指征
    胃出血    胃出血
    黄疸消退延迟    黄疸消退延迟
    有机磷中毒治疗后症状反跳    有机磷中毒治疗后症状反跳
    盆腔CT肛管直肠周围积液    盆腔CT肛管直肠周围积液
    染色体核型分析13-三体    染色体核型分析13-三体
    漏斗部间隔向头侧移位    漏斗部间隔向头侧移位
    心率130次/分    心率>=130次/分
    心率131次/分    心率>=130次/分
    小型脐膨出    小型脐膨出
    法洛四联症待查    法洛四联症待查
    心功能异常    心功能异常
    特发性马蹄内翻足轻型    特发性马蹄内翻足轻型
    妊娠合并戊型肝炎    妊娠合并戊型肝炎
    发热恢复36小时    发热恢复<=36小时
    发热恢复35小时    发热恢复<=36小时
    法洛四联症根治术后    法洛四联症根治术后
    巨大冠状动脉瘤    巨大冠状动脉瘤
    Apple‐Peel闭锁家族史    Apple‐Peel闭锁家族史
    主动脉骑跨    主动脉骑跨
    冠状动脉Z值>=5    冠状动脉Z值>=5
    皮肤接触有机磷毒物    皮肤接触有机磷毒物
    有机磷农药接触史    有机磷农药接触史
    冠状动脉评估    冠状动脉评估
    体重不增    体重不增
    有机磷中毒症状缓解2周    有机磷中毒症状缓解>1周
    超声无法探及胆囊    超声无法探及胆囊
    冠状动脉Z值10    冠状动脉Z值>=10
    冠状动脉Z值11    冠状动脉Z值>=10
    耸肩困难    耸肩困难
    先天性胆道闭锁待查    先天性胆道闭锁待查
    出生后肺动脉瓣口直径[1.5cm-2cm]    出生后肺动脉瓣口直径[1.5cm-2cm]
    左肺动脉发育不良    左肺动脉发育不良
    衣物沾染有机磷毒物    衣物沾染有机磷毒物
    漏斗部间隔向前移位    漏斗部间隔向前移位
    冠状动脉闭塞    冠状动脉闭塞
    低体重儿    低体重儿
    内痔    内痔
    妊娠中期    妊娠中期
    肛管严重感染    肛管严重感染
    先天性肛门闭锁    先天性肛门闭锁
    抬头无力    抬头无力
    儿童终末期肝病评分PELD9分    儿童终末期肝病评分PELD<10分
    妊娠期痔    妊娠期痔
    超声显示胆囊直径14mm    超声胆囊直径<15mm
    体重5.9kg    体重<6kg
    乳突病变气化不良    乳突病变气化不良
    亚急性重型戊型病毒性肝炎    亚急性重型戊型病毒性肝炎
    有机磷中毒治疗后反跳    有机磷中毒治疗后反跳
    肝包膜下血流增加    肝包膜下血流增加
    右心衰竭    右心衰竭
    腹腔积液    腹腔积液
    先天性肠闭锁术前    先天性肠闭锁术前
    鼓膜穿孔    鼓膜穿孔
    跨肺动脉瓣压差99mmHg    跨肺动脉瓣压差<100mmHg
    严重心律失常    严重心律失常
    出生后肺动脉瓣口直径[1.0cm-1.5cm)    出生后肺动脉瓣口直径[1.0cm-1.5cm)
    多指    多指
    冠状动脉分支横跨    冠状动脉分支横跨
    毒蕈碱样症状    毒蕈碱样症状
    粪便HEVRNA阳性    粪便HEVRNA阳性
    异常粗大体肺侧枝    异常粗大体肺侧枝
    先天性食管闭锁Ⅲb型    先天性食管闭锁Ⅲb型
    中型冠状动脉瘤    中型冠状动脉瘤
    对硫磷中毒    对硫磷中毒
    垂体性甲减    垂体性甲减
    碘缺乏    碘缺乏
    盆腔MRI肛管直肠周围积液    盆腔MRI肛管直肠周围积液
    冠状动脉内径8mm    冠状动脉内径>=8mm
    冠状动脉内径8.1mm    冠状动脉内径>=8mm
    冠状动脉Z值2.5    冠状动脉Z值>=2.5
    冠状动脉Z值2.6    冠状动脉Z值>=2.5
    颅脑并发症    颅脑并发症
    怀疑法洛四联症    怀疑法洛四联症
    冠状动脉Z值5    冠状动脉Z值[5-10)
    冠状动脉Z值9    冠状动脉Z值[5-10)
    轻度缺氧    轻度缺氧
    胎儿期碘暴露史    胎儿期碘暴露史
    大便潜血阳性    大便潜血阳性
    冠状动脉Z值2.6    冠状动脉Z值>2.5
    垂体功能减低    垂体功能减低
    染色体核型分析性染色体异常    染色体核型分析性染色体异常
    直肠严重感染    直肠严重感染
    染色体核型分析8-三体    染色体核型分析8-三体
    TSH61mIU/L    TSH>60mIU/L
    毛发接触有机磷毒物    毛发接触有机磷毒物
    小儿皮肤黏膜淋巴结综合征病程3周    小儿皮肤黏膜淋巴结综合征病程<4周
    先天性胆道闭锁术后6月    先天性胆道闭锁术后>=6个月
    先天性胆道闭锁术后7月    先天性胆道闭锁术后>=6个月
    硬化剂注射治疗2月    近3月内接受硬化剂注射治疗
    肺动脉狭窄    肺动脉狭窄
    特发性马蹄内翻足早期    特发性马蹄内翻足早期
    肌酐清除率10ml/min    肌酐清除率[10ml/min-50ml/min]
    肌酐清除率50ml/min    肌酐清除率[10ml/min-50ml/min]
    体重6kg    体重>=6kg
    体重7kg    体重>=6kg
    冠状动脉瘤    冠状动脉瘤
    球囊扩张失败    球囊扩张失败
    连续肾脏血液替代    连续肾脏血液替代
    敌百虫中毒    敌百虫中毒
    符合血运重建指征    符合血运重建指征
    超声胆囊体积小    超声胆囊体积小
    IV期内痔    IV期内痔
    轻度先天性肺动脉瓣狭窄    轻度先天性肺动脉瓣狭窄
    肛门疼痛    肛门疼痛
    川崎病病程3周    川崎病病程<4周
    超声胆囊无收缩    超声胆囊无收缩
    严重前列腺肥大    严重前列腺肥大
    持续发热37小时    持续发热>36小时
    痔疮术后    痔疮术后
    先天性食管闭锁Ⅲa型    先天性食管闭锁Ⅲa型
    调整甲状腺激素药物剂量    调整甲状腺激素药物剂量
    体重16kg    体重>15kg
    特发性马蹄内翻足    特发性马蹄内翻足
    血液净化    血液净化
    右心室肥厚    右心室肥厚
    难辨梭状芽孢杆菌感染    难辨梭状芽孢杆菌感染
    长期甲状腺激素替代治疗    长期甲状腺激素替代治疗
    血栓性外痔    血栓性外痔
    鼓室破坏    鼓室破坏
    急性淤胆型戊型病毒性肝炎    急性淤胆型戊型病毒性肝炎
    先天性食管狭窄术后    先天性食管狭窄术后
    肾功能正常    肾功能正常
    肺动脉闭锁    肺动脉闭锁
    肠道毒物清除彻底    肠道毒物清除彻底
    腹壁缺损直径5cm    腹壁缺损直径>=5cm
    腹壁缺损直径5.1cm    腹壁缺损直径>=5cm
    直肠畸形    直肠畸形
    转颈困难    转颈困难
    阿托品中毒    阿托品中毒
    先天性小肠闭锁家族史    先天性小肠闭锁家族史
    先天性食管闭锁Ⅴ型    先天性食管闭锁Ⅴ型
    右心室漏斗部狭窄    右心室漏斗部狭窄
    气促    气促
    食管胃底静脉曲张    食管胃底静脉曲张
    脓血便    脓血便
    右肺动脉发育不良    右肺动脉发育不良
    重度有机磷中毒13小时    重度有机磷中毒>12小时
    听力障碍    听力障碍
    肺部感染    肺部感染
    先天性甲状腺功能减退待查    先天性甲状腺功能减退待查
    发育落后    发育落后
    急性中毒    急性中毒
    四肢近端无力    四肢近端无力
    出生后肺动脉瓣口直径0.5cm    出生后肺动脉瓣口直径[0.5cm-1.0cm)
    出生后肺动脉瓣口直径0.9cm    出生后肺动脉瓣口直径[0.5cm-1.0cm)
    先天性漏斗胸术后    先天性漏斗胸术后
    染色体核型分析21-三体    染色体核型分析21-三体
    体重15kg    体重<=15kg
    体重14kg    体重<=15kg
    完全矫正足内翻畸形    完全矫正足内翻畸形
    经皮球囊肺动脉瓣成形术后    经皮球囊肺动脉瓣成形术后
    冠状动脉瘤合并血栓    冠状动脉瘤合并血栓
    IVIG治疗后    IVIG治疗后
    甲拌磷中毒    甲拌磷中毒
    先天性食管闭锁Ⅲ型    先天性食管闭锁Ⅲ型
    血清HEVRNA阳性    血清HEVRNA阳性
    肌酐清除率21ml/min    肌酐清除率(20-30]ml/min
    肌酐清除率30ml/min    肌酐清除率(20-30]ml/min
    跨肺动脉瓣压差100mmHg    跨肺动脉瓣压差>=100mmHg
    跨肺动脉瓣压差101mmHg    跨肺动脉瓣压差>=100mmHg
    有机磷中毒反跳现象    有机磷中毒反跳现象
    冠状动脉即将闭塞    冠状动脉即将闭塞
    先天性食管闭锁Ⅱ型    先天性食管闭锁Ⅱ型
    心房水平右向左分流    心房水平右向左分流
    冠状动脉Z值2.5    冠状动脉Z值[2.5-5)
    冠状动脉Z值4.9    冠状动脉Z值[2.5-5)
    先天性漏斗胸轻度    先天性漏斗胸轻度
    超声肝门囊性肿块    超声肝门囊性肿块
    脑栓塞    脑栓塞
    尿白细胞增多    尿白细胞增多
    先天性漏斗胸重度    先天性漏斗胸重度
    内吸磷中毒    内吸磷中毒
    PSS评分2分    PSS评分>=2分
    PSS评分3分    PSS评分>=2分
    冠状动脉内径4mm    冠状动脉内径>3mm
    母亲碘暴露史    母亲碘暴露史
    先天性胆道闭锁术后    先天性胆道闭锁术后
    严重不可逆心衰者    严重不可逆心衰者
    食管造影见食管盲端    食管造影见食管盲端
    先天性食管闭锁Ⅰ型    先天性食管闭锁Ⅰ型
    II期内痔    II期内痔
    冠状动脉扩张    冠状动脉扩张
    冠状动脉Z值2.4    冠状动脉Z值<2.5
    混合痔    混合痔
    中度有机磷中毒7小时    中度有机磷中毒>6小时
    先天性肺动脉瓣狭窄术后    先天性肺动脉瓣狭窄术后
    染色体核型分析18-三体    染色体核型分析18-三体
    不完全型川崎病病程3周    不完全型川崎病病程<4周
    胎儿期肺动脉瓣口直径2mm    胎儿期肺动脉瓣口直径<=2mm
    胎儿期肺动脉瓣口直径1mm    胎儿期肺动脉瓣口直径<=2mm
    染色体核型分析性染色体X0    染色体核型分析性染色体X0
    漏斗部间隔向左移位    漏斗部间隔向左移位
    咳粉红色泡沫样痰    咳粉红色泡沫样痰
    马拉硫磷中毒    马拉硫磷中毒
    乐果中毒    乐果中毒
    III期内痔    III期内痔
    中度先天性肺动脉瓣狭窄    中度先天性肺动脉瓣狭窄
    初始甲状腺激素替代治疗    初始甲状腺激素替代治疗
    染色体核型分析9-三体    染色体核型分析9-三体
    先天性食管狭窄重度    先天性食管狭窄重度
    肾上腺皮质功能减退    肾上腺皮质功能减退
    I期内痔    I期内痔
    单纯型慢性化脓性中耳炎    单纯型慢性化脓性中耳炎
    引流通畅    引流通畅
    冠状动脉内径5mm    冠状动脉内径>4mm
    预激综合征    预激综合征
    轻度有机磷中毒    轻度有机磷中毒
    胆脂瘤型慢性化脓性中耳炎    胆脂瘤型慢性化脓性中耳炎
    先天性马蹄内翻足早期    先天性马蹄内翻足早期
    肛门畸形    肛门畸形
    肌酐清除率9ml/min    肌酐清除率<10ml/min
    快速性心律失常    快速性心律失常
    先天性漏斗胸中度    先天性漏斗胸中度
    肌酐清除率10ml/min    肌酐清除率[10-20]ml/min
    肌酐清除率20ml/min    肌酐清除率[10-20]ml/min
    超声右侧门静脉前方纤维块厚度5mm    超声右侧门静脉前方纤维块厚度>4mm
    盆腔放疗史    盆腔放疗史
    胎粪排出延迟    胎粪排出延迟
    右心室与肺动脉收缩压阶差11mmHg    右心室与肺动脉收缩压阶差>10mmHg
    TSH60mIU/L    TSH<=60mIU/L
    TSH59mIU/L    TSH<=60mIU/L
    中度有机磷中毒    中度有机磷中毒
    轻度有机磷中毒7小时    轻度有机磷中毒>6小时
    多发性肠闭锁家族史    多发性肠闭锁家族史
    急性戊型病毒性肝炎    急性戊型病毒性肝炎
    肌酐清除率51ml/min    肌酐清除率(50ml/min-90ml/min]
    肌酐清除率90ml/min    肌酐清除率(50ml/min-90ml/min]
    脑脓肿    脑脓肿
    口服有机磷农药    口服有机磷农药
    急性黄疸型戊型病毒性肝炎    急性黄疸型戊型病毒性肝炎
    听骨链破坏    听骨链破坏
    肺动脉瓣狭窄    肺动脉瓣狭窄
    IVIG治疗后持续发热    IVIG治疗后持续发热
    染色体4p缺失    染色体4p缺失
    甲基对硫磷中毒    甲基对硫磷中毒
    血γ-谷氨酰转肽酶301U/L    血γ-谷氨酰转肽酶>300U/L
    严重肺动脉发育不良    严重肺动脉发育不良
    三尖瓣下移待查    三尖瓣下移待查
    甲状腺发育不全    甲状腺发育不全
    右心室收缩压31mmHg    右心室收缩压>30mmHg
    喷射性呕吐    喷射性呕吐
    胆汁瘀积型肝硬化    胆汁瘀积型肝硬化
    保守治疗有效    保守治疗有效
    肌酐清除率30ml/min    肌酐清除率<=30ml/min
    肌酐清除率29ml/min    肌酐清除率<=30ml/min
    三尖瓣下移根治术后    三尖瓣下移根治术后
    眼部接触有机磷毒物    眼部接触有机磷毒物
    肺动脉手术条件差    肺动脉手术条件差
    小型冠状动脉瘤    小型冠状动脉瘤
    外痔    外痔
    顽固性右室衰竭    顽固性右室衰竭
    鼓膜大穿孔    鼓膜大穿孔
    抗-HEVIgM阳性    抗-HEVIgM阳性
    冠脉异常    冠脉异常
    青光眼    青光眼
    腹壁缺损直径4.9cm    腹壁缺损直径<5cm
    重度先天性肺动脉瓣狭窄    重度先天性肺动脉瓣狭窄
    长段型食管闭锁    长段型食管闭锁
    青霉素类过敏    青霉素类过敏
    手术治疗失败    手术治疗失败
    冠状动脉畸形    冠状动脉畸形
    跨肺动脉瓣瓣压差40mmHg    跨肺动脉瓣瓣压差<=40mmHg
    跨肺动脉瓣瓣压差39mmHg    跨肺动脉瓣瓣压差<=40mmHg
    真菌感染    真菌感染
    食管吻合口漏    食管吻合口漏
    中毒性脑病    中毒性脑病
    喂养困难    喂养困难
    重度缺氧    重度缺氧
    MASA感染    MASA感染
    重度有机磷中毒    重度有机磷中毒
    PSS评分1分    PSS评分<2分
    肠道毒物再吸收    肠道毒物再吸收
    右室流出道反应性狭窄    右室流出道反应性狭窄
    跨肺动脉瓣压差41mmHg    跨肺动脉瓣压差>40mmHg
    皮肤粘膜淋巴结综合症    皮肤粘膜淋巴结综合症
    不完全KD    不完全KD
    多趾    多趾
    心脏扩大    心脏扩大
    重度肺动脉高压    重度肺动脉高压
    肝动脉增宽    肝动脉增宽
    急性重型戊型病毒性肝炎    急性重型戊型病毒性肝炎
    肝门囊肿直径3.1cm    肝门囊肿直径>3cm
    先天性食管闭锁术后    先天性食管闭锁术后
    抗-HEVIgG阳性    抗-HEVIgG阳性
    全血胆碱酯酶活力下降至正常值[50%-70%)    全血胆碱酯酶活力下降至正常值[50%-70%)
    全血胆碱酯酶活力下降至正常值<70%    全血胆碱酯酶活力下降至正常值<70%
    全血胆碱酯酶活力下降至正常值[30%-50%)    全血胆碱酯酶活力下降至正常值[30%-50%)
    全血胆碱酯酶活力下降至正常值<30%    全血胆碱酯酶活力下降至正常值<30%
    先天性膈膨升    先天性膈膨升
    新生儿红斑狼疮    新生儿红斑狼疮
    肺真菌感染    肺真菌感染
    绿脓杆菌性肺炎    绿脓杆菌性肺炎
    先天性动脉导管未闭    先天性动脉导管未闭
    侵袭性肺曲霉病    侵袭性肺曲霉病
    苯丙酮尿症    苯丙酮尿症
    肺炎克雷伯杆菌感染    肺炎克雷伯杆菌感染
    先天性幽门肥厚性狭窄    先天性幽门肥厚性狭窄
    肺孢子菌肺炎    肺孢子菌肺炎
    葡萄球菌性肺炎    葡萄球菌性肺炎
    膈膨升    膈膨升
    病毒性心肌炎    病毒性心肌炎
    肺隐球菌病    肺隐球菌病
    肺炎支原体肺炎    肺炎支原体肺炎
    先天性膈疝    先天性膈疝
    原位腺癌    原位腺癌
    高苯丙氨酸血症    高苯丙氨酸血症
    肺组织胞浆菌病    肺组织胞浆菌病
    肺念珠菌病    肺念珠菌病
    肺接合菌病    肺接合菌病
    母体系统性红斑狼疮新生儿    母体系统性红斑狼疮新生儿
    先天性肛门直肠畸形    先天性肛门直肠畸形
    幼年型皮肌炎    幼年型皮肌炎
    肺腺癌    肺腺癌
    先天性膈膨升    先天性膈膨升
    新生儿红斑狼疮    新生儿红斑狼疮
    肺真菌感染    肺真菌感染
    绿脓杆菌性肺炎    绿脓杆菌性肺炎
    先天性动脉导管未闭    先天性动脉导管未闭
    侵袭性肺曲霉病    侵袭性肺曲霉病
    苯丙酮尿症    苯丙酮尿症
    肺炎克雷伯杆菌感染    肺炎克雷伯杆菌感染
    先天性幽门肥厚性狭窄    先天性幽门肥厚性狭窄
    肺孢子菌肺炎    肺孢子菌肺炎
    葡萄球菌性肺炎    葡萄球菌性肺炎
    膈膨升    膈膨升
    病毒性心肌炎    病毒性心肌炎
    肺隐球菌病    肺隐球菌病
    肺炎支原体肺炎    肺炎支原体肺炎
    先天性膈疝    先天性膈疝
    原位腺癌    原位腺癌
    高苯丙氨酸血症    高苯丙氨酸血症
    肺组织胞浆菌病    肺组织胞浆菌病
    肺念珠菌病    肺念珠菌病
    肺接合菌病    肺接合菌病
    母体系统性红斑狼疮新生儿    母体系统性红斑狼疮新生儿
    先天性肛门直肠畸形    先天性肛门直肠畸形
    幼年型皮肌炎    幼年型皮肌炎
    肺腺癌    肺腺癌
    BH4无反应性PUK    BH4无反应性PUK
    BH4无反应性苯丙酮尿症    BH4无反应性苯丙酮尿症
    DHPR活性正常    DHPR活性正常
    DHPR缺乏    DHPR缺乏
    ECOG评分3分    ECOG评分>=3分
    ECOG评分4分    ECOG评分>=3分
    ECOG评分4分    ECOG评分>=4分
    ECOG评分5分    ECOG评分>=4分
    Ia期肺癌    Ia期肺癌
    Ib期肺癌    Ib期肺癌
    III期肺癌    III期肺癌
    II期肺癌    II期肺癌
    MPP急性期    MPP急性期
    MRSA肺炎    MRSA肺炎
    MRSE肺炎    MRSE肺炎
    MSSA肺炎    MSSA肺炎
    MSSE肺炎    MSSE肺炎
    PAH基因突变    PAH基因突变
    PAH缺乏症    PAH缺乏症
    PCD缺乏    PCD缺乏
    RMPP    RMPP
    SLE病情稳定    SLE病情稳定
    SLE预后好    SLE预后好
    苯丙氨酸/酪氨酸比值2.1    苯丙氨酸/酪氨酸比值>2.0
    苯丙氨酸羟化酶基因突变    苯丙氨酸羟化酶基因突变
    表皮葡萄球菌性肺炎    表皮葡萄球菌性肺炎
    播散性念珠菌病    播散性念珠菌病
    播散性隐球菌病    播散性隐球菌病
    不耐受手术    不耐受手术
    部分实性肺结节位于肺外周1/3    部分实性肺结节位于肺外周1/3
    常规药物治疗有效    常规药物治疗有效
    超广谱β内酰胺酶敏感菌株    超广谱β内酰胺酶敏感菌株
    超广谱β内酰胺酶耐药菌株    超广谱β内酰胺酶耐药菌株
    持续发热    持续发热
    出生后无胎粪排出    出生后无胎粪排出
    出生时无肛门    出生时无肛门
    纯毛玻璃样结节10mm    纯毛玻璃样结节[10mm-30mm]
    纯毛玻璃样结节30mm    纯毛玻璃样结节[10mm-30mm]
    纯毛玻璃样结节8mm    纯毛玻璃样结节>=8mm
    纯毛玻璃样结节8.1mm    纯毛玻璃样结节>=8mm
    大环内酯类敏感    大环内酯类敏感
    大剂量糖皮质激素治疗    大剂量糖皮质激素治疗
    倒立侧位X线摄片提示直肠盲端位于耻骨中点与骶尾关节连线(PC线)的远端    倒立侧位X线摄片提示直肠盲端位于耻骨中点与骶尾关节连线(PC线)的远端
    动脉导管未闭手术解剖结构复杂    动脉导管未闭手术解剖结构复杂
    多个肺结节    多个肺结节
    多个原发性肺结节    多个原发性肺结节
    多原发性肺癌    多原发性肺癌
    肺病灶实性成分增多    肺病灶实性成分增多
    肺病灶增大    肺病灶增大
    肺不典型腺瘤样增生    肺不典型腺瘤样增生
    肺部病灶扩大    肺部病灶扩大
    肺结节0.9cm    肺结节<1cm
    肺结节密度变实    肺结节密度变实
    肺结节明显增大    肺结节明显增大
    肺结节位于外周    肺结节位于外周
    肺结节位于优势段    肺结节位于优势段
    肺浸润前病变    肺浸润前病变
    肺浸润性腺癌    肺浸润性腺癌
    肺慢性肉芽肿者    肺慢性肉芽肿者
    肺内坏死灶    肺内坏死灶
    肺实性结节3cm    肺实性结节<=3cm
    肺实性结节2.9cm    肺实性结节<=3cm
    肺微浸润腺癌    肺微浸润腺癌
    肺微浸润性腺癌    肺微浸润性腺癌
    肺微小浸润腺癌    肺微小浸润腺癌
    肺腺癌Ib期    肺腺癌Ib期
    肺腺癌III期    肺腺癌III期
    肺腺癌II期    肺腺癌II期
    肺腺癌IV期    肺腺癌IV期
    肺腺癌I期    肺腺癌I期
    肺腺癌术后    肺腺癌术后
    肺亚实性结节3cm    肺亚实性结节<=3cm
    肺亚实性结节2.9cm    肺亚实性结节<=3cm
    肺炎支原体肺炎病原学治疗7天    肺炎支原体肺炎病原学治疗>=7天
    肺炎支原体肺炎病原学治疗8天    肺炎支原体肺炎病原学治疗>=7天
    肺炎支原体肺炎待查    肺炎支原体肺炎待查
    肺炎支原体肺炎重症    肺炎支原体肺炎重症
    肺原位腺癌    肺原位腺癌
    肺原位腺癌术后    肺原位腺癌术后
    腹腔镜下幽门环肌切开术术后    腹腔镜下幽门环肌切开术术后
    钙质沉积病变    钙质沉积病变
    钙质沉积病变药物治疗有效    钙质沉积病变药物治疗有效
    肛门成形术后    肛门成形术后
    肛门发育不全    肛门发育不全
    肛门皮肤瘘    肛门皮肤瘘
    肛门直肠狭窄    肛门直肠狭窄
    膈膨升术后    膈膨升术后
    骨质破坏    骨质破坏
    鼓膜炎性充血    鼓膜炎性充血
    红细胞二氢蝶啶还原酶活性正常    红细胞二氢蝶啶还原酶活性正常
    怀疑颅脑并发症    怀疑颅脑并发症
    缓慢性心律失常    缓慢性心律失常
    肌酐清除率10ml/min    肌酐清除率>=10ml/min
    肌酐清除率11ml/min    肌酐清除率>=10ml/min
    肌酐清除率21ml/min    肌酐清除率>20ml/min
    肌酐清除率31ml/min    肌酐清除率>30ml/min
    急性化脓性中耳炎反复发作    急性化脓性中耳炎反复发作
    甲氧西林敏感    甲氧西林敏感
    金黄色葡萄球菌性肺炎    金黄色葡萄球菌性肺炎
    仅少量胎粪从会阴部异常开口排出    仅少量胎粪从会阴部异常开口排出
    仅少量胎粪从尿道排出    仅少量胎粪从尿道排出
    颈静脉球体瘤    颈静脉球体瘤
    剧烈咳嗽    剧烈咳嗽
    抗磷脂抗体阳性    抗磷脂抗体阳性
    可疑肺原位腺癌    可疑肺原位腺癌
    可疑浸润性肺癌    可疑浸润性肺癌
    快速性室性心律失常    快速性室性心律失常
    狼疮危象    狼疮危象
    狼疮性肺炎    狼疮性肺炎
    狼疮性脑病    狼疮性脑病
    粒细胞减少者    粒细胞减少者
    毛玻璃样结节    毛玻璃样结节
    毛玻璃样结节位于肺外周1/3    毛玻璃样结节位于肺外周1/3
    泌尿道感染    泌尿道感染
    免疫性溶血性贫血    免疫性溶血性贫血
    耐甲氧西林    耐甲氧西林
    耐受免疫抑制剂治疗者    耐受免疫抑制剂治疗者
    难治性肺炎支原体肺炎    难治性肺炎支原体肺炎
    难治性风湿病    难治性风湿病
    难治性系统性红斑狼疮    难治性系统性红斑狼疮
    难治性幼年型皮肌炎    难治性幼年型皮肌炎
    尿蝶呤谱正常    尿蝶呤谱正常
    脓气胸    脓气胸
    脓胸    脓胸
    皮肤白    皮肤白
    皮肌炎性肺间质纤维化    皮肌炎性肺间质纤维化
    频繁电复律治疗    频繁电复律治疗
    普通肺炎支原体肺炎    普通肺炎支原体肺炎
    乳突骨质破坏    乳突骨质破坏
    沙利度胺治疗有效    沙利度胺治疗有效
    神经精神性狼疮    神经精神性狼疮
    实性肺结节    实性肺结节
    室颤    室颤
    室间隔缺损修补术后    室间隔缺损修补术后
    室速    室速
    鼠臭味    鼠臭味
    体温38.5℃    体温>=38.5℃
    体温38.6℃    体温>=38.5℃
    体温39.5℃    体温>=39.5℃
    体温39.6℃    体温>=39.5℃
    体温39.6℃    体温>39.5℃
    体重39kg    体重<40kg
    体重40kg    体重>=40kg
    体重40.1kg    体重>=40kg
    头孢菌素类过敏    头孢菌素类过敏
    头发黄    头发黄
    万古霉素耐药    万古霉素耐药
    维持治疗阶段    维持治疗阶段
    无膈疝    无膈疝
    系统性红斑狼疮轻度活动    系统性红斑狼疮轻度活动
    系统性红斑狼疮中度活动    系统性红斑狼疮中度活动
    系统性红斑狼疮重度活动    系统性红斑狼疮重度活动
    先天性动脉导管未闭术后    先天性动脉导管未闭术后
    先天性肛门直肠畸形低位    先天性肛门直肠畸形低位
    先天性肛门直肠畸形高位    先天性肛门直肠畸形高位
    先天性肛门直肠畸形中位    先天性肛门直肠畸形中位
    先天性膈膨升术后    先天性膈膨升术后
    先天性膈疝术后    先天性膈疝术后
    心电图无明显异常    心电图无明显异常
    心率59次/分    心率<60次/分
    心率101次/分    心率>100次/分
    心源性休克    心源性休克
    心脏泵衰竭    心脏泵衰竭
    新生儿狼疮综合征    新生儿狼疮综合征
    胸腔闭式引流治疗有效    胸腔闭式引流治疗有效
    胸腔穿刺治疗有效    胸腔穿刺治疗有效
    血苯丙氨酸浓度121μmol/L    血苯丙氨酸浓度>120μmol/L
    血苯丙氨酸浓度3mg/dl    血苯丙氨酸浓度>2mg/dl
    血压120/80mmHg    血压>=120/80mmHg
    血压121/80mmHg    血压>=120/80mmHg
    血压偏高    血压偏高
    严重窦性心动过缓    严重窦性心动过缓
    严重肺动脉高压    严重肺动脉高压
    严重心脏病    严重心脏病
    严重血液病    严重血液病
    药物治疗后血压不升    药物治疗后血压不升
    英夫利昔单抗治疗有效    英夫利昔单抗治疗有效
    幽门环肌切开术术后    幽门环肌切开术术后
    幼年型皮肌炎恢复期    幼年型皮肌炎恢复期
    幼年型皮肌炎急进型    幼年型皮肌炎急进型
    幼年型皮肌炎累及肺    幼年型皮肌炎累及肺
    幼年型皮肌炎轻症    幼年型皮肌炎轻症
    幼年型皮肌炎重症    幼年型皮肌炎重症
    诱导缓解阶段    诱导缓解阶段
    早期肺癌    早期肺癌
    早期肺腺癌    早期肺腺癌
    造血干细胞移植者    造血干细胞移植者
    长期糖皮质激素治疗    长期糖皮质激素治疗
    支气管通畅    支气管通畅
    直肠会阴瘘    直肠会阴瘘
    直肠尿道瘘    直肠尿道瘘
    直肠前庭瘘    直肠前庭瘘
    直肠阴道瘘    直肠阴道瘘
    治疗后血压不升    治疗后血压不升
    智能发育落后    智能发育落后
    中耳流脓    中耳流脓
    中耳乳突腔潜在病变    中耳乳突腔潜在病变
    重症MPP    重症MPP
    自身免疫性溶血    自身免疫性溶血
    纵隔淋巴结肿大    纵隔淋巴结肿大
    重度心脏病变    重度心脏病变
    重度心功能不全    重度心功能不全
    重度腹水    重度腹水
    智力低下    智力低下
    治疗部位有明显外伤    治疗部位有明显外伤
    骨折    骨折
    外固定支架    外固定支架
    游走肾    游走肾
    易发癫痫    易发癫痫
    上消化道穿孔    上消化道穿孔
    疑似胃肠道穿孔    疑似胃肠道穿孔
    严重心率失常    严重心率失常
    严重外伤    严重外伤
    严重肾损害    严重肾损害
    坏死性肠炎    坏死性肠炎
    严重腹泻    严重腹泻
    需生命维持系统    需生命维持系统
    需生命监护系统    需生命监护系统
    胸腔包虫    胸腔包虫
    心脏骤停    心脏骤停
    先心病    先心病
    无法耐受内镜检查    无法耐受内镜检查
    急性胃肠道出血    急性胃肠道出血
    萎缩肾    萎缩肾
    完全性幽门梗阻    完全性幽门梗阻
    吞食腐蚀物72小时    吞食腐蚀物[72小时-3周]
    吞食腐蚀物504小时    吞食腐蚀物[72小时-3周]
    体内有金属植入物    体内有金属植入物
    术后放置金属夹    术后放置金属夹
    视物不清    视物不清
    肾周围脓肿    肾周围脓肿
    肾肿瘤    肾肿瘤
    肾脏位置过高    肾脏位置过高
    肾脏大囊肿    肾脏大囊肿
    肾盂脓肿    肾盂脓肿
    肾结核    肾结核
    散热功能障碍    散热功能障碍
    发热2天    发热<3天
    妊娠中后期    妊娠中后期
    心肺功能衰竭    心肺功能衰竭
    屏气发作    屏气发作
    严重呼吸功能不全    严重呼吸功能不全
    膀胱充盈    膀胱充盈
    明显腹部胀气    明显腹部胀气
    明显出血倾向    明显出血倾向
    慢性呼吸系统疾病    慢性呼吸系统疾病
    麻醉药物过敏    麻醉药物过敏
    麻醉药过敏    麻醉药过敏
    困倦    困倦
    开放性骨折    开放性骨折
    剧烈哭闹    剧烈哭闹
    巨结肠危象    巨结肠危象
    巨大卵巢囊肿    巨大卵巢囊肿
    金属避孕环    金属避孕环
    严重碘对比剂不良反应史    严重碘对比剂不良反应史
    急性感染性疾病    急性感染性疾病
    急性腹膜炎    急性腹膜炎
    饥饿    饥饿
    活动性肾盂肾炎    活动性肾盂肾炎
    急性化脓性呼吸道炎症    急性化脓性呼吸道炎症
    过敏倾向    过敏倾向
    过度肥胖    过度肥胖
    体内失水    体内失水
    舒张压100mmhg    舒张压>=100mmhg
    舒张压101mmhg    舒张压>=100mmhg
    腹腔内广泛粘连    腹腔内广泛粘连
    服用镇静类药物    服用镇静类药物
    服用干扰睡眠药物    服用干扰睡眠药物
    发热    发热
    急性感染    急性感染
    电解质严重紊乱    电解质严重紊乱
    外伤伤口未愈    外伤伤口未愈
    穿刺部位有神经    穿刺部位有神经
    穿刺部位有感染    穿刺部位有感染
    穿刺部位有大血管    穿刺部位有大血管
    肠麻痹    肠麻痹
    腹部胀气    腹部胀气
    病情危重    病情危重
    变态反应性呼吸道疾病    变态反应性呼吸道疾病
    包虫病    包虫病
    神经刺激器    神经刺激器
    金属性心导管    金属性心导管
    NEC肠壁积气    NEC肠壁积气
    服用溴比斯的明17h    服用溴比斯的明<18h
    服用强的松<17h    服用强的松<18h
    腹膜广泛粘连    腹膜广泛粘连
    穿刺部位附近有神经    穿刺部位附近有神经
    穿刺部位附近有感染    穿刺部位附近有感染
    穿刺部位附近有大血管    穿刺部位附近有大血管
    自身免疫性脑炎    自身免疫性脑炎
    儿童良性癫痫伴中央颞区棘波    儿童良性癫痫伴中央颞区棘波
    急性播散性脑脊髓炎    急性播散性脑脊髓炎
    病毒性脑炎    病毒性脑炎
    儿童失神癫痫    儿童失神癫痫
    结核病    结核病
    面神经麻痹    面神经麻痹
    同型半胱氨酸血症    同型半胱氨酸血症
    视神经炎    视神经炎
    线粒体脑肌病    线粒体脑肌病
    贝尔面瘫    贝尔面瘫
    婴儿痉挛症    婴儿痉挛症
    甲基丙二酸血症    甲基丙二酸血症
    临床孤立综合征    临床孤立综合征
    丙酸血症    丙酸血症
    同型半胱氨酸尿症    同型半胱氨酸尿症
    结核性脑膜炎    结核性脑膜炎
    隐球菌脑膜炎    隐球菌脑膜炎
    进行性肌营养不良    进行性肌营养不良
    自身免疫性脑炎    自身免疫性脑炎
    儿童良性癫痫伴中央颞区棘波    儿童良性癫痫伴中央颞区棘波
    急性播散性脑脊髓炎    急性播散性脑脊髓炎
    病毒性脑炎    病毒性脑炎
    儿童失神癫痫    儿童失神癫痫
    结核病    结核病
    面神经麻痹    面神经麻痹
    同型半胱氨酸血症    同型半胱氨酸血症
    视神经炎    视神经炎
    线粒体脑肌病    线粒体脑肌病
    贝尔面瘫    贝尔面瘫
    婴儿痉挛症    婴儿痉挛症
    甲基丙二酸血症    甲基丙二酸血症
    临床孤立综合征    临床孤立综合征
    丙酸血症    丙酸血症
    同型半胱氨酸尿症    同型半胱氨酸尿症
    结核性脑膜炎    结核性脑膜炎
    隐球菌脑膜炎    隐球菌脑膜炎
    进行性肌营养不良    进行性肌营养不良
    静脉抗真菌有效    静脉抗真菌有效
    蛋氨酸合成酶还原酶(cblE)缺陷    蛋氨酸合成酶还原酶(cblE)缺陷
    同型半胱氨酸血症待查    同型半胱氨酸血症待查
    丙酸血症产前筛查    丙酸血症产前筛查
    结核性视神经炎    结核性视神经炎
    重症自身免疫性脑炎    重症自身免疫性脑炎
    敬礼发作    敬礼发作
    肿瘤阴性自身免疫性脑炎    肿瘤阴性自身免疫性脑炎
    钴胺素代谢障碍(Ⅲ型)    钴胺素代谢障碍(Ⅲ型)
    甲基丙二酸血症产前筛查    甲基丙二酸血症产前筛查
    持续角膜暴露    持续角膜暴露
    胱硫醚合成酶缺乏型(Ⅰ型)    胱硫醚合成酶缺乏型(Ⅰ型)
    青少年失神癫痫    青少年失神癫痫
    视神经脊髓炎相关性视神经炎    视神经脊髓炎相关性视神经炎
    自身免疫性视神经炎    自身免疫性视神经炎
    视神经炎急性期    视神经炎急性期
    视神经炎频繁复发    视神经炎频繁复发
    面肌瘫痪轻者    面肌瘫痪轻者
    胎儿期确诊丙酸血症    胎儿期确诊丙酸血症
    截瘫    截瘫
    进行性通气障碍    进行性通气障碍
    莱姆病相关性视神经炎    莱姆病相关性视神经炎
    糖皮质激素依赖型    糖皮质激素依赖型
    甲基丙二酸血症维生素B12无效型    甲基丙二酸血症维生素B12无效型
    椎管通畅    椎管通畅
    隐球菌脑膜炎病情轻    隐球菌脑膜炎病情轻
    感染性视神经炎    感染性视神经炎
    蛋氨酸合成酶(cblG)缺陷    蛋氨酸合成酶(cblG)缺陷
    AQP4抗体阳性    AQP4抗体阳性
    同侧复发性面神经麻痹    同侧复发性面神经麻痹
    产前检查确诊甲基丙二酸血症    产前检查确诊甲基丙二酸血症
    癫痫起病年龄14岁    癫痫起病年龄>=14岁
    癫痫起病年龄15岁    癫痫起病年龄>=14岁
    晶状体移位    晶状体移位
    面神经麻痹完全恢复3月    3个月内面神经麻痹完全恢复
    面神经麻痹完全恢复2月    3个月内面神经麻痹完全恢复
    血清肌酶谱正常    血清肌酶谱正常
    颅脑MRI中可见脱髓鞘病灶    颅脑MRI中可见脱髓鞘病灶
    暂时颅内高压    暂时颅内高压
    丙酸血症待查    丙酸血症待查
    隐球菌败血症    隐球菌败血症
    脑白质脱髓鞘病灶累及视神经    脑白质脱髓鞘病灶累及视神经
    双侧同时发作面神经麻痹    双侧同时发作面神经麻痹
    怀疑多发性硬化    怀疑多发性硬化
    常规治疗无效    常规治疗无效
    严重视功能损害    严重视功能损害
    特发性视神经炎    特发性视神经炎
    晶状体半脱位    晶状体半脱位
    血清NMDA受体抗体阴性    血清NMDA受体抗体阴性
    复发性自身免疫性脑炎    复发性自身免疫性脑炎
    亚甲基四氢叶酸还原酶缺陷(Ⅱ型)    亚甲基四氢叶酸还原酶缺陷(Ⅱ型)
    丙酸血症急性期    丙酸血症急性期
    真菌性鼻窦炎相关性视神经炎    真菌性鼻窦炎相关性视神经炎
    重度心脏传导阻滞    重度心脏传导阻滞
    丙种球蛋白有效    丙种球蛋白有效
    甲基丙二酸血症待查    甲基丙二酸血症待查
    梅毒性视神经炎    梅毒性视神经炎
    脑脊液NMDA受体抗体阳性    脑脊液NMDA受体抗体阳性
    高氨血症    高氨血症
    中枢性通气障碍    中枢性通气障碍
    特发性脱髓鞘性视神经炎    特发性脱髓鞘性视神经炎
    脑脊液蛋白量2.9g/L    脑脊液蛋白量<3.0g/L
    眼睑闭合不全    眼睑闭合不全
    同型半胱氨酸尿症待查    同型半胱氨酸尿症待查
    面肌无力持续时间4月    面肌无力持续时间>3个月
    产前筛查确诊丙酸血症    产前筛查确诊丙酸血症
    侧脑室穿刺引流有效    侧脑室穿刺引流有效
    外周血CD20阴性    外周血CD20阴性
    呼吸机麻痹    呼吸机麻痹
    阻塞性脑积水    阻塞性脑积水
    试验性维生素B12治疗无效    试验性维生素B12治疗无效
    长期颅内压增高    长期颅内压增高
    一线免疫治疗有效    一线免疫治疗有效
    高乳酸血症    高乳酸血症
