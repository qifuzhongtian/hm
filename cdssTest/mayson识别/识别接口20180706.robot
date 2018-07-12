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
识别接口0706
    左心室功能障碍    左心室功能障碍
    左束支传导阻滞    左束支传导阻滞
    卒中史    卒中史
    血清总铁结合力64.45μmol/L    总铁结合力(TIBC)>64.44μmol/L
    血清总铁结合力64.45μmol/L    总铁结合力(TIBC)>360μg/dl
    前列腺特异抗原增高    总前列腺特异性抗原(TPSA)升高
    转铁蛋白饱和度14％    转铁蛋白饱和度(TS)低于15％
    蛛网膜下腔出血    蛛网膜下腔出血
    周身酸痛    周身酸痛
    周身乏力    周身乏力
    癌胚抗原增高    肿瘤标记物升高(CEA)
    癌抗原724增高    肿瘤标记物升高(CA72.4)
    癌抗原242增高    肿瘤标记物升高(CA242)
    糖链抗原199增高    肿瘤标记物升高(CA199)
    中性粒细胞增高    中性粒细胞增多
    中性粒细胞增高    中性粒细胞升高
    中性粒细胞百分比升高    中性粒细胞百分比升高
    中度肾功能不全    中度肾功能不全
    智力发育迟缓    智力发育迟缓
    直肠指检发现前列腺结节    直肠指检发现前列腺结节
    阵发性夜间呼吸困难    阵发性夜间呼吸困难
    粘液血便    粘液血便
    运动时心率额外增加    运动时心率额外增加
    淤血性肝大    淤血性肝大
    右心室负荷过重表现    右心室负荷过重表现
    右下腹有固定压痛    右下腹有固定压痛
    右室功能异常    右室功能异常
    右上腹深压痛    右上腹深压痛
    游离前列腺特异抗原增高    游离前列腺特异性抗原(FPSA)升高
    游离型甲状腺素正常    游离甲状腺素水平正常
    游离型甲状腺素增高    游离甲状腺素水平升高
    游离型甲状腺素减低    游离甲状腺素水平降低
    阴囊钝痛    阴囊钝痛
    以中性粒细胞为主    以中性粒细胞为主
    遗传性出血性疾病    遗传性出血性疾病
    腋窝淋巴结压痛    腋窝淋巴结压痛
    液体潴留    液体潴留
    阳痿    阳痿
    厌油    厌油
    眼球突出    眼球突出
    眼科手术(1月内)30天    眼科手术(1月内)
    眼科手术(1月内)29天    眼科手术(1月内)
    严重心力衰竭    严重心力衰竭
    严重肾功能不全    严重肾功能不全
    严重创伤(15天内)15天    严重创伤(15天内)
    严重创伤(15天内)14天    严重创伤(15天内)
    咽拭子分离支原体阳性    咽拭子分离支原体阳性
    血压140/90mmHg    血压高
    血压141/90mmHg    血压高
    血压高    血压高
    血小板450×109/L    血小板>=450×109/L
    血小板451×109/L    血小板>=450×109/L
    血小板99×109/L    血小板<100×109/L
    血渗透压增高    血渗透压增高
    血清总胆红素增高    血清总胆红素增高
    血清铁蛋白11μg/L    血清铁蛋白(SF)低于12μg/L
    血清铁8.94μmol/L    血清铁(S1)<8.95μmol/L
    血清铁49μg/dl    血清铁(S1)<50μg/dl
    降钙素增高    血清降钙素原升高
    降钙素101ng/L    血清降钙素>100ng/L
    肌酸激酶同工酶(CK-MB)升高    血清肌酶谱升高
    肌酸激酶异型(MB2/MB1)升高    血清肌酶谱升高
    肌酸激酶异型(CK-MB2)升高    血清肌酶谱升高
    肌酸激酶异型(CK-MB1)升高    血清肌酶谱升高
    肌酸激酶同工酶(CK-MM)升高    血清肌酶谱升高
    肌酸激酶同工酶(CK-BB)升高    血清肌酶谱升高
    肌酸激酶升高    血清肌酶谱升高
    肺炎衣原体抗体IgM阳性    血清肺炎支原体IgM抗体阳性
    促甲状腺素减低    血清TSH浓度降低
    促红细胞生成素降低    血清EPO水平低于正常参考值水平
    血精    血精
    血清肌酐升高    血肌酐升高
    血红蛋白升高    血红蛋白增高
    血红蛋白降低    血红蛋白下降
    血红蛋白119g/L    血红蛋白<120g/L
    血管穿刺史60天    血管穿刺史(2月内)
    血管穿刺史59天    血管穿刺史(2月内)
    血管穿刺史60天    血管穿刺史(2月内)
    血管穿刺史59天    血管穿刺史(2月内)
    血苯丙氨酸3mg/dl    血苯丙氨酸(Phe)浓度>2mg/dl
    血苯丙氨酸121μmol/L    血苯丙氨酸(Phe)浓度>120μmol/L
    白细胞计数升高    血白细胞总数增多
    白细胞计数升高    血白细胞总数升高
    白细胞计数正常    血白细胞正常
    白细胞计数升高    血白细胞升高
    白细胞计数升高    血白细胞计数增高
    选择性肺动脉造影阳性    选择性肺动脉造影阳性
    胸部撕裂样痛    胸部撕裂样痛
    新生儿期开始大便灰白    新生儿期开始大便灰白
    心率难控制    心率难控制
    心率151次/分    心率>150次/分
    心率111次/分    心率>110次/分
    心率110次/分    心率>=110次/分
    心率111次/分    心率>=110次/分
    心率39次/分    心率<40次/分
    心率109次/分    心率<110次/分
    心律不齐    心律不齐
    心力衰竭症状    心力衰竭症状
    心力衰竭史    心力衰竭史
    心尖搏动侧移    心尖搏动侧移
    心肌收缩力下降    心肌收缩力下降
    心肺复苏(10天内)10天    心肺复苏(10天内)
    心肺复苏(10天内)9天    心肺复苏(10天内)
    心肺储备差    心肺储备差
    心房增大    心房增大
    心包填塞180天    心包填塞(6个月内)
    心包填塞179天    心包填塞(6个月内)
    消化道出血180天    消化道出血(6个月内)
    消化道出血179天    消化道出血(6个月内)
    消化道出血10天    消化道出血(10天内)
    消化道出血9天    消化道出血(10天内)
    下肢血管超声阳性    下肢血管超声阳性
    下腹坠胀不适    下腹坠胀不适
    下腹部疼痛    下腹部疼痛
    吸入史    吸入史
    无门诊抗凝条件    无门诊抗凝条件
    无脉    无脉
    无法达到心率控制    无法达到心率控制
    胃灼热    胃灼热
    胃部不适    胃部不适
    畏寒    畏寒
    外周血B淋巴细胞5109/L    外周血B淋巴细胞>=5×109/L
    外周血B淋巴细胞6109/L    外周血B淋巴细胞>=5×109/L
    外科手术(10天内)10天    外科手术(10天内)
    外科手术(10天内)9天    外科手术(10天内)
    停止排气排便    停止排气排便
    体重增加    体重增加
    体重下降    体重下降
    糖尿病性出血性视网膜病    糖尿病性出血性视网膜病
    糖化血红蛋白6.5%    糖化血红蛋白>=6.5%
    糖化血红蛋白6.6%    糖化血红蛋白>=6.5%
    随机血糖3.9mmol/L    随机血糖<=3.9mmol/L
    随机血糖3.8mmol/L    随机血糖<=3.9mmol/L
    随机血糖2.8mmol/L    随机血糖<=2.8mmol/L
    随机血糖2.7mmol/L    随机血糖<=2.8mmol/L
    撕裂样胸痛    撕裂样胸痛
    水肿加重    水肿加重
    水样便    水样便
    输尿管点压痛    输尿管点压痛
    舒张压111mmHg    舒张压>110mmHg
    收缩压181mmHg    收缩压>180mmHg
    收缩压121mmHg    收缩压>120mmHg
    收缩压180mmHg    收缩压>=180mmHg
    收缩压181mmHg    收缩压>=180mmHg
    食欲不振    食欲不振
    湿啰音    湿啰音
    肾小球滤过率44ml/min1.73m2    肾小球滤过率eGFR<45mL/min/1.73m2
    肾区叩击痛    肾区叩击痛
    射血分数降低    射血分数降低
    射血分数保留    射血分数保留
    射频消融手术失败    射频消融手术失败
    少哭    少哭
    少动    少动
    少吃    少吃
    上腹不适    上腹不适
    乳房红肿热痛    乳房红肿热痛
    蠕动波    蠕动波
    溶栓禁忌    溶栓禁忌
    妊娠140天    妊娠20周
    缺血性脑卒中60天    缺血性脑卒中(2月内)
    缺血性脑卒中59天    缺血性脑卒中(2月内)
    缺血性脑卒中60天    缺血性脑卒中(2个月内)
    缺血性脑卒中59天    缺血性脑卒中(2个月内)
    全身肌肉压痛    全身肌肉压痛
    情绪波动    情绪波动
    清洁中段尿沉渣涂片1个细菌    清洁中段尿沉渣涂片>=1个细菌
    清洁中段尿沉渣涂片2个细菌    清洁中段尿沉渣涂片>=1个细菌
    前囟门饱满    前囟门饱满
    前列腺肿物    前列腺肿物
    前列腺结节质地坚硬    前列腺结节质地坚硬
    前列腺肥大    前列腺肥大
    髂股血管炎    髂股血管炎
    髂股血管血栓    髂股血管血栓
    器官活检史14天    器官活检史(2周内)
    器官活检史13天    器官活检史(2周内)
    皮肤硬肿    皮肤硬肿
    皮肤感染创伤    皮肤感染创伤
    皮肤发花    皮肤发花
    膀胱出血180天    膀胱出血(6个月内)
    膀胱出血179天    膀胱出血(6个月内)
    排尿困难    排尿困难
    怕热    怕热
    怕冷    怕冷
    脓性痰    脓性痰
    脓性白带    脓性白带
    脓臭痰    脓臭痰
    尿渗透压降低    尿渗透压降低
    细胞管型红细胞管型    尿红细胞管型
    尿道脓性分泌物    尿道脓性分泌物
    尿道口做淋球菌涂片阳性    尿道口做淋球菌涂片阳性
    尿道口做淋球菌核酸检测阳性    尿道口做淋球菌核酸检测阳性
    尿道口红肿    尿道口红肿
    尿蛋白阳性    尿蛋白阳性
    尿蛋白    尿蛋白
    尿白细胞5个/HP    尿沉渣镜检白细胞>=5个HP
    尿白细胞6个/HP    尿沉渣镜检白细胞>=5个HP
    尿比重增高    尿比重增高
    尿比重降低    尿比重降低
    尿白细胞阳性    尿白细胞阳性
    细胞管型白细胞管型    尿白细胞颗粒管型
    黏液性水肿    黏液性水肿
    脑膜刺激征    脑膜刺激征
    免疫球蛋白G增高    免疫球蛋白IgG水平升高
    脉搏消失    脉搏消失
    脉搏细弱    脉搏细弱
    脉搏加快    脉搏加快
    颅内肿瘤活动期    颅内肿瘤活动期
    颅内手术60天    颅内手术(2个月内)
    颅内手术59天    颅内手术(2个月内)
    颅内手术30天    颅内手术(1月内)
    颅内手术29天    颅内手术(1月内)
    颅内高压    颅内高压
    流感病毒核酸检测阳性    流感病毒核酸检测阳性
    流感病毒    流感病毒
    劳力性咳嗽    劳力性咳嗽
    哭闹不安    哭闹不安
    口腔疾病    口腔疾病
    空腹血糖3.9mmol/L    空腹血糖<=3.9mmol/L
    空腹血糖3.8mmol/L    空腹血糖<=3.9mmol/L
    空腹血糖2.8mmol/L    空腹血糖<=2.8mmol/L
    抗平滑肌抗体阳性    抗平滑肌抗体(SMA)阳性
    抗核抗体阳性    抗核抗体(ANA)阳性
    抗肝细胞胞质I型抗体阳性    抗肝细胞胞质I型抗体(anti-LC1)阳性
    抗肝肾微粒体I型抗体阳性    抗肝肾微粒体I型抗体(anti-LKM1)阳性
    甲型肝炎病毒抗体IgM阳性    抗HAVIgM阳性
    甲型肝炎病毒抗体IgG阳性    抗HAVIgG阳性
    拒食    拒食
    静息性咳嗽    静息性咳嗽
    静脉血栓栓塞史    静脉血栓栓塞史
    胫前粘液性水肿    胫前粘液性水肿
    颈前疼痛    颈前疼痛
    颈前肌无力    颈前肌无力
    颈静脉压升高    颈静脉压升高
    颈部肿物    颈部肿物
    精神障碍    精神障碍
    近期自发性颅内出血    近期自发性颅内出血
    结合胆红素增高    结合胆红素增高
    碱性磷酸酶升高    碱性磷酸酶升高
    甲状腺质韧硬    甲状腺质韧硬
    总甲状腺素正常    甲状腺素水平正常
    总甲状腺素升高    甲状腺素水平升高
    总甲状腺素降低    甲状腺素水平降低
    甲状腺素结合球蛋白60ng/ml    甲状腺球蛋白(TG)>=60ng/ml
    甲状腺素结合球蛋白61ng/ml    甲状腺球蛋白(TG)>=60ng/ml
    甲状腺弥漫性肿大    甲状腺弥漫性肿大
    总甲状腺素升高    甲状腺激素浓度升高
    甲状腺毒症    甲状腺毒症
    甲状腺触痛    甲状腺触痛
    促甲状腺激素受体抗体阳性    甲状腺TSH受体抗体(TSAb)阳性
    促甲状腺激素受体抗体阳性    甲状腺TSH受体抗体(TRAb)阳性
    家族性凝血功能障碍    家族性凝血功能障碍
    加压超声阳性    加压超声阳性
    脊髓手术史30天    脊髓手术史(1月内)
    脊髓手术史29天    脊髓手术史(1月内)
    挤压疮疖    挤压疮疖
    急性胸痛    急性胸痛
    急性心肌梗死    急性心肌梗死
    急性发热    急性发热
    急性短暂性脑缺血发作    急性短暂性脑缺血发作
    畸形红细胞尿    畸形红细胞尿
    肌酸激酶升高    肌酸激酶(CK)显著升高
    肌酸激酶升高    肌酸激酶(CK)升高
    血清肌酐升高    肌酐升高
    肌酐清除率29ml/min    肌酐清除率<30ml/min
    肌酐清除率<30ml/min    肌酐清除率<30ml/min
    心肌肌钙蛋白T增高    肌钙蛋白阳性
    心肌肌钙蛋白I增高    肌钙蛋白阳性
    心肌肌钙蛋白I增高    肌钙蛋白升高(至少超过99%参考值上限)
    心肌肌钙蛋白T增高    肌钙蛋白升高(至少超过99%参考值上限)
    活动性内出血    活动性内出血
    黄稀便    黄稀便
    黄疸持续无法消褪    黄疸持续无法消褪
    红细胞数增多    红细胞减少
    红细胞比容增高    红细胞比容增高
    中性粒细胞核象变化核左移    核左移
    含NTG不缓解    含NTG不缓解
    谷草转氨酶50U/L    谷草转氨酶>=50U/L
    谷草转氨酶51U/L    谷草转氨酶>=50U/L
    谷草转氨酶100U/L    谷草转氨酶>=100U/L
    谷草转氨酶101U/L    谷草转氨酶>=100U/L
    谷丙转氨酶50U/L    谷丙转氨酶>=50U/L
    谷丙转氨酶51U/L    谷丙转氨酶>=50U/L
    谷丙转氨酶100U/L    谷丙转氨酶>=100U/L
    谷丙转氨酶101U/L    谷丙转氨酶>=100U/L
    γ-谷氨酰转移酶301U/L    谷氨酰转肽酶升高(>300IU/L)
    巩膜黄染    巩膜黄染
    宫颈口粘液脓性分泌物    宫颈口粘液脓性分泌物
    宫颈红肿    宫颈红肿
    宫颈分泌物淋球菌检测阳性    宫颈分泌物做淋球菌涂片阳性
    宫颈分泌物淋球菌检测阳性    宫颈分泌物做淋球菌培养阳性
    宫颈分泌物做淋球菌核酸检测阳性    宫颈分泌物做淋球菌核酸检测阳性
    肝区压痛    肝区压痛
    肝区疼痛    肝区疼痛
    肝脾肿大    肝脾肿大
    肝颈静脉反流征持续存在    肝颈静脉反流征持续存在
    腹部振水音    腹部振水音
    腹部气过水声    腹部气过水声
    腹部叩诊鼓音    腹部叩诊鼓音
    腹部高调金属音    腹部高调金属音
    大便甲型肝炎病毒阳性    粪便中检出HAV颗粒
    大便甲型肝炎病毒RNA阳性    粪便中检出HAVRNA
    大便甲型肝炎病毒抗原阳性    粪便中检出HAVAg
    大便隐血阳性    粪便隐血阳性
    分娩14天    分娩(2周内)
    分娩13天    分娩(2周内)
    肺淤血    肺淤血
    肺血管栓塞面积50％    肺血管栓塞面积>=50%
    肺血管栓塞面积51％    肺血管栓塞面积>=50%
    肺动脉CTA阳性    肺动脉CTA阳性
    肺动脉CTA不能排除肺栓塞    肺动脉CTA不能排除肺栓塞
    非瓣膜性房颤    非瓣膜性房颤
    反流    反流
    对称性肢体肌无力    对称性肢体肌无力
    端坐呼吸    端坐呼吸
    动静脉畸形    动静脉畸形
    第三心音奔马律    第三心音奔马律
    蛋花汤样便    蛋花汤样便
    胆道感染    胆道感染
    大手术史14天    大手术史(2周内)
    大手术史13天    大手术史(2周内)
    大面积肺栓塞    大面积肺栓塞
    大便轮状病毒阳性    大便轮状病毒检测阳性
    创伤60天    创伤(2个月内)
    创伤59天    创伤(2个月内)
    出血性脑卒中    出血性脑卒中
    出血体质    出血体质
    出血风险过高    出血风险过高
    持续性右下腹痛    持续性右下腹痛
    持续性低血压    持续性低血压
    肠型    肠型
    肠鸣音活跃    肠鸣音活跃
    餐后血糖3.9mmol/L    餐后血糖<=3.9mmol/L
    餐后血糖3.8mmol/L    餐后血糖<=3.9mmol/L
    餐后血糖2.8mmol/L    餐后血糖<=2.8mmol/L
    餐后血糖2.7mmol/L    餐后血糖<=2.8mmol/L
    濒死感    濒死感
    大便隐血阳性    便潜血阳性
    大便脓细胞阳性    便常规有脓细胞
    大便红细胞阳性    便常规有红细胞
    大便白细胞阳性    便常规有白细胞
    大便红细胞阳性    便常规可见红细胞
    大便白细胞阳性    便常规可见白细胞
    闭角型青光眼    闭角型青光眼
    血清苯丙氨酸/酪氨酸3    苯丙氨酸/酪氨酸(Phe/Tyr)>2
    背部撕裂样痛    背部撕裂样痛
    白细胞计数增高    白细胞总数升高
    白细胞计数降低    白细胞总数降低
    白细胞计数11 109/L    白细胞数量>10×109/L
    白细胞计数3 109/L    白细胞数量<4×109/L
    血清清蛋白降低    白蛋白偏低
    白/球比例倒置    白/球蛋白比例倒置
    谷草转氨酶升高    氨基转移酶升高
    谷丙转氨酶升高    氨基转移酶升高
    免疫球蛋白升高    γ-球蛋白水平升高
    Wells评分2    Wells评分中度可能急性肺栓塞
    Wells评分6    Wells评分中度可能急性肺栓塞
    Wells评分7    Wells评分高度可能急性肺栓塞
    Wells评分1    Wells评分低度可能急性肺栓塞
    Wells评分7    Wells评分>6分
    Wells评分2    Wells评分>=2分
    Wells评分3    Wells评分>=2分
    Wells评分1    Wells评分<2分
    Wells评分2    Wells评分[2-6]分
    Wells评分6    Wells评分[2-6]分
    V/Q升高    V/Q升高
    总甲状腺素增高    TT4升高
    三碘甲状腺原氨酸增高    TT3升高
    促甲状腺素正常    TSH水平正常
    促甲状腺素增高    TSH水平升高
    促甲状腺素减低    TSH水平降低
    血氧饱和度89％    SPO2<90%
    proBNP升高    proBNP升高
    脑利钠肽前体7501ng/L    proBNP>7500
    PPI试验阳性    PPI试验阳性
    PESI评分1    PESI>0
    PESI评分0    PESI=0
    OGTT(75g)2h200mg/dl    OGTT(75g)2h>=200mg/dl
    OGTT(75g)2h201mg/dl    OGTT(75g)2h>=200mg/dl
    OGTT(75g)2h11.1mmol/L    OGTT(75g)2h>=11.1mmol/L
    OGTT(75g)2h11.2mmol/L    OGTT(75g)2h>=11.1mmol/L
    血人绒毛膜促性腺激素升高    HCG升高
    血红蛋白186g/L    Hb>185g/L
    血红蛋白166g/L    Hb>165g/L
    HAS-BLED评分3    HAS-BLED评分>=3
    HAS-BLED评分3    HAS-BLED评分>=3
    游离型甲状腺素增高    FT4升高
    游离三碘甲状腺原氨酸增高    FT3升高
    EV71特异性核酸检测阳性    EV71特异性核酸检测阳性
    射血分数50％    EF>=50%
    射血分数51％    EF>=50%
    C反应蛋白升高    Ｃ反应蛋白可升高
    心肌肌钙蛋白T升高    cTnT升高
    心肌肌钙蛋白I升高    cTnI升高
    CTA禁忌    CTA禁忌
    CoxA16特异性核酸检测阳性    CoxA16特异性核酸检测阳性
    CHA2DS2-VASc评分2    CHA2DS2-VASc评分>1
    CHA2DS2-VASc评分1    CHA2DS2-VASc评分>=1
    脑利钠肽501pg/ml    BNP>500
    OGTT(75g)2h11.1mmol/L    75g口服葡萄糖耐量试验，服糖后2h血糖>=11.1mmol/L
    OGTT(75g)2h11.2mmol/L    75g口服葡萄糖耐量试验，服糖后2h血糖>=11.1mmol/L
    24小时尿量增多    24小时尿量显著增加
    压力性尿失禁    压力性尿失禁
    下肢深静脉血栓形成待查    下肢深静脉血栓形成待查
    深静脉血栓形成待查    深静脉血栓形成待查
    膀胱过度活动症    膀胱过度活动症
    排尿功能障碍    排尿功能障碍
    帕金森    帕金森
    尿失禁    尿失禁
    脑出血    脑出血
    弥漫大B细胞淋巴瘤    弥漫大B细胞淋巴瘤
    毛细胞白血病    毛细胞白血病
    慢性淋巴细胞白血病    慢性淋巴细胞白血病
    急性早幼粒细胞性白血病    急性早幼粒细胞性白血病
    急性早幼粒细胞白血病    急性早幼粒细胞白血病
    急性髓系白血病    急性髓系白血病
    急性脑梗死    急性脑梗死
    急性脑出血    急性脑出血
    急性淋巴细胞白血病    急性淋巴细胞白血病
    急性非ST段抬高型心肌梗塞    急性非ST段抬高型心肌梗塞
    急性白血病    急性白血病
    急性ST段抬高型心肌梗塞    急性ST段抬高型心肌梗塞
    急迫性尿失禁    急迫性尿失禁
    混合性尿失禁    混合性尿失禁
    功能性尿失禁    功能性尿失禁
    复发性急性早幼粒细胞性白血病    复发性急性早幼粒细胞性白血病
    非器质性失眠症    非器质性失眠症
    非ST段抬高型心肌梗死    非ST段抬高型心肌梗死
    充溢性尿失禁    充溢性尿失禁
    伯基特淋巴瘤    伯基特淋巴瘤
    阿尔茨海默病性痴呆    阿尔茨海默病性痴呆
    ST段抬高型心肌梗死    ST段抬高型心肌梗死
    DLBCL    DLBCL
    Burkitt淋巴瘤    Burkitt淋巴瘤
    压力性尿失禁    压力性尿失禁
    下肢深静脉血栓形成待查    下肢深静脉血栓形成待查
    深静脉血栓形成待查    深静脉血栓形成待查
    膀胱过度活动症    膀胱过度活动症
    排尿功能障碍    排尿功能障碍
    帕金森    帕金森
    尿失禁    尿失禁
    脑出血    脑出血
    弥漫大B细胞淋巴瘤    弥漫大B细胞淋巴瘤
    毛细胞白血病    毛细胞白血病
    慢性淋巴细胞白血病    慢性淋巴细胞白血病
    急性早幼粒细胞性白血病    急性早幼粒细胞性白血病
    急性早幼粒细胞白血病    急性早幼粒细胞白血病
    急性髓系白血病    急性髓系白血病
    急性脑梗死    急性脑梗死
    急性脑出血    急性脑出血
    急性淋巴细胞白血病    急性淋巴细胞白血病
    急性非ST段抬高型心肌梗塞    急性非ST段抬高型心肌梗塞
    急性白血病    急性白血病
    急性ST段抬高型心肌梗塞    急性ST段抬高型心肌梗塞
    急迫性尿失禁    急迫性尿失禁
    混合性尿失禁    混合性尿失禁
    功能性尿失禁    功能性尿失禁
    复发性急性早幼粒细胞性白血病    复发性急性早幼粒细胞性白血病
    非器质性失眠症    非器质性失眠症
    非ST段抬高型心肌梗死    非ST段抬高型心肌梗死
    充溢性尿失禁    充溢性尿失禁
    伯基特淋巴瘤    伯基特淋巴瘤
    阿尔茨海默病性痴呆    阿尔茨海默病性痴呆
    ST段抬高型心肌梗死    ST段抬高型心肌梗死
    DLBCL    DLBCL
    Burkitt淋巴瘤    Burkitt淋巴瘤
    左心衰合并冠状动脉三支血管病变    左心衰合并冠状动脉三支血管病变
    左心室充盈压16mmHg    左心室充盈压升高>15mmHg
    左心房血栓    左心房血栓
    左心耳血栓    左心耳血栓
    左室附壁血栓    左室附壁血栓
    阻抗pH监测正常    阻抗pH监测结果正常
    卒中静脉溶栓禁忌    卒中静脉溶栓禁忌
    主动脉弓动脉粥样硬化斑块    主动脉弓动脉粥样硬化斑块
    重度主动脉瓣关闭不全    重度主动脉瓣关闭不全
    肿瘤溶解    肿瘤溶解
    中心静脉压5mmHg    中心静脉压降低<6mmHg
    中心静脉压降低    中心静脉压降低
    中度主动脉瓣关闭不全    中度主动脉瓣关闭不全
    中等量出血    中等量出血
    中等或较低的细胞遗传学风险和分子学风险    中等或较低的细胞遗传学风险和分子学风险
    智力减退    智力减退
    质子泵抑制剂治疗效果不佳    质子泵抑制剂治疗效果不佳
    制订首次诱导化疗方案    制订首次诱导化疗方案
    肢体瘫痪    肢体瘫痪
    症状性脾肿大    症状性脾肿大
    症状性颅外椎动脉粥样硬化狭窄    症状性颅外椎动脉粥样硬化狭窄
    症状轻    症状轻
    症状缓解    症状缓解
    症状好转    症状好转
    症状波动    症状波动
    证实为完全缓解    证实为完全缓解
    震颤明显    震颤明显
    早发型帕金森    早发型帕金森
    弥漫性大B细胞淋巴瘤再分期评估    弥漫性大B细胞淋巴瘤再分期评估
    预防真菌感染    预防真菌感染
    预防细菌感染    预防细菌感染
    预防病毒感染    预防病毒感染
    语言能力丧失    语言能力丧失
    诱导化疗期    诱导化疗期
    有明显合并症    有明显合并症
    有弥散性血管内凝血风险    有弥散性血管内凝血风险
    有肺栓塞既往史    有肺栓塞既往史
    影像学检查脑中线结构移位超过5mm    影像学检查脑中线结构移位超过5mm
    影像学检查发现侧脑室受压闭塞超过1/2    影像学检查发现侧脑室受压闭塞超过1/2
    营养风险筛查2002(NRS)3分    营养风险筛查2002(NRS)>=3分
    营养风险筛查2002(NRS)4分    营养风险筛查2002(NRS)>=3分
    营养风险筛查2002(NRS)2分    营养风险筛查2002(NRS)<3分
    异动症    异动症
    疑似良性肝细胞肿瘤    疑似良性肝细胞肿瘤
    伊马替尼治疗期间    伊马替尼治疗期间
    一过性ST段抬高    一过性ST段抬高
    一侧肢体瘫痪    一侧肢体瘫痪
    言语交流障碍    言语交流障碍
    压疮(Braden)评分0    压疮(Braden)评分>=0
    压疮(Braden)评分1    压疮(Braden)评分>=0
    压疮(Braden)评分9    压疮(Braden)评分<=9
    压疮(Braden)评分8    压疮(Braden)评分<=9
    压疮(Braden)评分15    压疮(Braden)评分[15-18]
    压疮(Braden)评分18    压疮(Braden)评分[15-18]
    压疮(Braden)评分13    压疮(Braden)评分[13-14]
    压疮(Braden)评分14    压疮(Braden)评分[13-14]
    压疮(Braden)评分10    压疮(Braden)评分[10-12]
    压疮(Braden)评分12    压疮(Braden)评分[10-12]
    循环缺血症状    循环缺血症状
    血肿超过10ml    血肿超过10ml
    血脂异常    血脂异常
    血幼稚杆状核细胞增多    血幼稚杆状核细胞增多
    血幼稚杆状核细胞11%    血幼稚杆状核细胞>10％
    血压正常    血压正常
    血小板计数99*109/L    血小板计数低于100*109/L
    血糖<2.7mmol/L    血糖<2.7mmol/L
    血栓易栓症    血栓易栓症
    血栓前状态    血栓前状态
    血清总钙2.64mmol/L    血清总钙>2.63mmol/L
    血清总钙10.6mg/dl    血清总钙>10.5mg/dl
    血清游离钙6mg/dl    血清游离钙>5mg/dl
    血清游离钙2.61mmol/L    血清游离钙>2.60mmol/L
    血清游离钙10.5mg/dl    血清游离钙>10.4mg/dl
    血清游离钙1.26mmol/L    血清游离钙>1.25mmol/L
    血清游离钙8.7mg/dl    血清游离钙<8.8mg/dl
    血清游离钙2.1mmol/L    血清游离钙<2.2mmol/L
    血清钠134mmol/L    血清钠<135mmol/L
    血清钠124mmol/L    血清钠<125mmol/L
    血清钠130mmol/L    血清钠[130mmol/L-135mmol/L)
    血清钠134mmol/L    血清钠[130mmol/L-135mmol/L)
    血清钠125mmol/L    血清钠[125mmol/L-130mmol/L)
    血清钠129mmol/L    血清钠[125mmol/L-130mmol/L)
    血清镁3.1mg/dl    血清镁>3.0mg/dl
    血清镁2.6mg/dl    血清镁>2.5mg/dl
    血清镁2.07mEq/L    血清镁>2.06mEq/L
    血清镁1.26mmol/L    血清镁>1.25mmol/L
    血清镁1.04mmol/L    血清镁>1.03mmol/L
    血清镁1.7mg/dl    血清镁<1.8mg/dl
    血清镁1.81mg/dl    血清镁<1.82mg/dl
    血清镁1.4mEq/L    血清镁<1.5mEq/L
    血清镁0.74mmol/L    血清镁<0.75mmol/L
    血清镁0.73mmol/L    血清镁<0.74mmol/L
    血清磷4.6mg/dl    血清磷>4.5mg/dl
    血清磷1.46mmol/L    血清磷>1.45mmol/L
    血清磷2.4mg/dl    血清磷<2.5mg/dl
    血清磷0.78mmol/L    血清磷<0.8mmol/L
    血清钾5.5mmol/L    血清钾>=5.5mmol/L
    血清钾5.6mmol/L    血清钾>=5.5mmol/L
    血清钾3.4mmol/L    血清钾<3.5mmol/L
    血清钾2.4mmol/L    血清钾<2.5mmol/L
    血清钾3.0mmol/L    血清钾［3.0mmol/L-3.5mmol/L)
    血清钾3.4mmol/L    血清钾［3.0mmol/L-3.5mmol/L)
    血清钾2.5mmol/L    血清钾［2.5mmol/L-3.0mmol/L)
    血清钾2.9mmol/L    血清钾［2.5mmol/L-3.0mmol/L)
    血清钙8.4mg/dl    血清钙<8.5mg/dl
    血清钙2.mmol/L    血清钙<2.1mmol/L
    血清蛋白浓度正常    血清蛋白浓度正常
    血培养阳性    血培养出现阳性结果
    血尿素氮9mmol/L    血尿素氮>8.9mmol/L
    血尿素氮26mg/dl    血尿素氮>25mg/dl
    血流动力学监测肺毛细血管楔压(PCWP)15mmHg    血流动力学监测肺毛细血管楔压(PCWP)>=15mmHg
    血流动力学监测肺毛细血管楔压(PCWP)16mmHg    血流动力学监测肺毛细血管楔压(PCWP)>=15mmHg
    血流动力学监测肺毛细血管楔压(PCWP)15mmHg    血流动力学监测肺毛细血管楔压(PCWP)<=15mmHg
    血流动力学监测肺毛细血管楔压(PCWP)14mmHg    血流动力学监测肺毛细血管楔压(PCWP)<=15mmHg
    血流动力学监测RAP>RADP    血流动力学监测RAP>RADP
    血流动力学监测RAP10cmH2O    血流动力学监测RAP>＝10cmH2O
    血流动力学监测RAP11cmH2O    血流动力学监测RAP>＝10cmH2O
    血流动力学监测PCWP15mmHg    血流动力学监测PCWP<=15mmHg
    血流动力学监测PCWP14mmHg    血流动力学监测PCWP<=15mmHg
    血浆渗透压正常    血浆渗透压正常
    血浆渗透压升高    血浆渗透压升高
    血浆渗透压降低    血浆渗透压降低
    血浆渗透压296mmol/L    血浆渗透压>295mmol/L
    血浆渗透压279mmol/L    血浆渗透压<280mmol/L
    血浆渗透压280mmol/L    血浆渗透压[280mmol/L-295mmol/L]
    血浆渗透压295mmol/L    血浆渗透压[280mmol/L-295mmol/L]
    血红蛋白10g/dl    血红蛋白<11g/dl
    血管介入治疗后    血管介入治疗后
    血白细胞计数13×10E9/L    血白细胞计数>12×10E9/L
    血白细胞计数3×10E9/L    血白细胞计数<4×10E9/L
    胸痛发作持续时间19min    胸痛发作持续时间<20min
    胸痛持续时间25小时    胸痛持续时间>24小时
    胸痛持续时间9min    胸痛持续时间<10min
    胸痛31分钟    胸痛>30分钟
    胸痛72小时    胸痛>=72小时
    胸痛73小时    胸痛>=72小时
    胸痛24小时    胸痛>=24小时
    胸痛25小时    胸痛>=24小时
    胸痛12小时    胸痛>=12小时
    胸痛13小时    胸痛>=12小时
    胸骨左缘收缩期杂音    胸骨左缘收缩期杂音
    新发完全性左束支传导阻滞    新发完全性左束支传导阻滞
    新发病理性Q波    新发病理性Q波
    新出现的左束支传导阻滞    新出现的左束支传导阻滞
    心脏缺血症状    心脏缺血症状
    心源性栓塞性短暂性脑缺血发作    心源性栓塞性短暂性脑缺血发作
    心前区突发粗糙全收缩期杂音    心前区突发粗糙全收缩期杂音
    心心排出量测定(热稀释法)心脏指数(CI)2.1L/(min*m2)    心排出量测定(热稀释法)心脏指数(CI)<2.2L/(min*m2)
    心率正常    心率正常
    心率91次/分    心率>90次/分
    心律平稳    心律平稳
    心肌梗死待查    心肌梗死待查
    心肌顿挫    心肌顿挫
    心功能评价能耐受蒽环类药物    心功能评价能耐受蒽环类药物
    心梗后心脏破裂    心梗后心脏破裂
    心梗后室壁瘤    心梗后室壁瘤
    心梗后乳头肌断裂    心梗后乳头肌断裂
    协调障碍    协调障碍
    小脑幕切迹疝    小脑幕切迹疝
    小脑毒性作用    小脑毒性作用
    小脑出血    小脑出血
    痫性发作    痫性发作
    下肢深静脉血栓形成史    下肢深静脉血栓形成史
    喜多盐饮食    喜多盐饮食
    膝平面以下DVT    膝平面以下DVT
    无震颤症状的帕金森    无震颤症状的帕金森
    无胸痛    无胸痛
    无痛性淋巴结肿大    无痛性淋巴结肿大
    无GRACE评分    无GRACE评分
    胃食管反流病待查    胃食管反流病待查
    急性髓系白血病未治疗者    急性髓系白血病未治疗者
    萎缩性阴道炎    萎缩性阴道炎
    维甲酸治疗    维甲酸治疗
    危险分层为细胞遗传性中危    危险分层为细胞遗传性中危
    危险分层为细胞遗传性分析正常    危险分层为细胞遗传性分析正常
    晚发型帕金森    晚发型帕金森
    外周血涂片未明确毛细胞白血病复发者    外周血涂片未明确毛细胞白血病复发者
    外周血白细胞计数增高无法用感染解释    外周血白细胞计数增高无法用感染解释
    外阴阴道萎缩    外阴阴道萎缩
    腿部麻木    腿部麻木
    头臂干病变    头臂干病变
    体温38℃    体温>=38℃
    体温39℃    体温>=38℃
    疼痛评分7    疼痛评分[7-10]
    疼痛评分10    疼痛评分[7-10]
    疼痛评分4    疼痛评分[4-6]
    疼痛评分6    疼痛评分[4-6]
    疼痛评分1    疼痛评分[1-3]
    疼痛评分3    疼痛评分[1-3]
    糖尿病合并冠状动脉三支血管病变    糖尿病合并冠状动脉三支血管病变
    锁骨下动脉狭窄    锁骨下动脉狭窄
    锁骨下动脉闭塞    锁骨下动脉闭塞
    髓外肿瘤负荷大    髓外肿瘤负荷大
    四脑室受压    四脑室受压
    四脑室闭塞    四脑室闭塞
    输血    输血
    首次鞘内治疗    首次鞘内治疗
    手臂麻木    手臂麻木
    收缩压(SBP)79mmHg    收缩压(SBP)<80mmHg
    室间隔穿孔    室间隔穿孔
    室壁瘤    室壁瘤
    使用速尿    使用速尿
    使用大剂量MTX化疗后第一天    使用大剂量MTX化疗后第一天
    使用大剂量MTX化疗后第三天    使用大剂量MTX化疗后第三天
    使用大剂量MTX化疗后第二天    使用大剂量MTX化疗后第二天
    实测颅内压ICP26mmHg    实测颅内压ICP>25mmHg
    实测颅内压ICP26mmHg    实测颅内压ICP>25mmHg
    神经毒性作用    神经毒性作用
    少量出血    少量出血
    三氧化二砷治疗    三氧化二砷治疗
    乳头肌功能失调    乳头肌功能失调
    乳房结节    乳房结节
    妊娠期深静脉血栓形成待查    妊娠期深静脉血栓形成待查
    妊娠期深静脉血栓形成    妊娠期深静脉血栓形成
    人工心脏瓣膜    人工心脏瓣膜
    确诊时WBC高    确诊时WBC高
    确诊时LDH高    确诊时LDH高
    缺血中危    缺血中危
    缺血性胸痛反复发作    缺血性胸痛反复发作
    缺血极高危    缺血极高危
    缺血高危    缺血高危
    缺血低危    缺血低危
    丘脑出血    丘脑出血
    轻度阿尔茨海默病痴呆    轻度阿尔茨海默病痴呆
    髂静脉DVT    髂静脉DVT
    平均动脉压(MAP)69mmHg    平均动脉压(MAP)<70mmHg
    平衡障碍    平衡障碍
    皮肤湿冷    皮肤湿冷
    膀胱中的残余尿量201ml    膀胱中的残余尿量>200ml
    凝血功能正常    凝血功能正常
    颞叶钩回疝    颞叶钩回疝
    尿渗透压101mmol/L    尿渗透压>100mmol/L
    尿钠31mmol/L    尿钠>30mmol/L
    尿沉渣镜检红细胞数多为3~10个HP    尿沉渣镜检红细胞数多为3~10个HP
    脑室铸型    脑室铸型
    脑室出血超过脑室容积75%    脑室出血超过脑室容积75%
    脑室出血    脑室出血
    脑疝    脑疝
    脑梗死急性期    脑梗死急性期
    难治性心力衰竭    难治性心力衰竭
    难治性心绞痛    难治性心绞痛
    难治性疾病    难治性疾病
    幕上血肿清除术后    幕上血肿清除术后
    目前正接受化疗    目前正接受化疗
    目前使用雌激素治疗    目前使用雌激素治疗
    明显颅高压升高    明显颅高压升高
    明显的残留白血病细胞    明显的残留白血病细胞
    面部麻木    面部麻木
    慢性髓系白血病待查    慢性髓系白血病待查
    慢性期DVT    慢性期DVT
    慢性淋巴结肿大    慢性淋巴结肿大
    慢性呼吸困难    慢性呼吸困难
    洛杉矶分级B级    洛杉矶分级B级
    洛杉矶分级A级    洛杉矶分级A级
    颅外椎动脉狭窄    颅外椎动脉狭窄
    颅外颈动脉狭窄70%    颅外颈动脉狭窄[70%-99%]
    颅外颈动脉狭窄99%    颅外颈动脉狭窄[70%-99%]
    颅外颈动脉狭窄50%    颅外颈动脉狭窄[50%-69%]
    颅外颈动脉狭窄69%    颅外颈动脉狭窄[50%-69%]
    颅内大动脉粥样硬化性狭窄    颅内大动脉粥样硬化性狭窄
    颅脑外伤1周    颅脑外伤后2周内
    良性肝细胞肿瘤    良性肝细胞肿瘤
    理解障碍    理解障碍
    拉布立酶治疗前    拉布立酶治疗前
    口腔温度38.1℃    口腔温度>38℃
    可疑蛛网膜下腔出血    可疑蛛网膜下腔出血
    可疑HLAB*58:01等位基因携带者    可疑HLAB*58:01等位基因携带者
    可耐受再诱导化疗    可耐受再诱导化疗
    抗凝治疗    抗凝治疗
    抗胆碱能药禁忌    抗胆碱能药禁忌
    绝经期泌尿生殖系统综合征    绝经期泌尿生殖系统综合征
    剧烈胸痛    剧烈胸痛
    局部主动脉弓病变    局部主动脉弓病变
    静息性胸痛持续21分钟    静息性胸痛持续>20分钟
    静息性胸痛    静息性胸痛
    静脉血管造影髂血管狭窄29%    静脉血管造影髂血管狭窄<30%
    静脉血管造影股血管狭窄29%    静脉血管造影股血管狭窄<30%
    静脉溶栓禁忌    静脉溶栓禁忌
    颈总动脉病变    颈总动脉病变
    颈动脉狭窄率70%    颈动脉狭窄率70%-99%
    颈动脉狭窄率99%    颈动脉狭窄率70%-99%
    颈动脉颅外段中度狭窄    颈动脉颅外段中度狭窄
    颈动脉颅外段严重狭窄    颈动脉颅外段严重狭窄
    颈动脉颅外段狭窄程度49%    颈动脉颅外段狭窄程度<50%
    近期有椎管内手术    近期有椎管内手术
    近期有颅内手术    近期有颅内手术
    近3个月有手术史    近3个月有手术史
    近3个月内有卒中史    近3个月内有卒中史
    近3个月内有重大头颅外伤史    近3个月内有重大头颅外伤史
    近3个月曾接受中心静脉置管史    近3个月曾接受中心静脉置管史
    近1周内有在不易压迫止血部位的动脉穿刺    近1周内有在不易压迫止血部位的动脉穿刺
    近1周内股动脉穿刺    近1周内股动脉穿刺
    进行性淋巴结肿大    进行性淋巴结肿大
    金刚烷胺禁忌    金刚烷胺禁忌
    结合胆红素/总胆红素[50%~80%]    结合胆红素/总胆红素[50%~80%]
    较大量出血    较大量出血
    降尿蛋白治疗前    降尿蛋白治疗前
    继发癫痫    继发癫痫
    既往有颅内出血    既往有颅内出血
    急性右室心肌梗死    急性右室心肌梗死
    急性缺血性卒中待查    急性缺血性卒中待查
    急性缺血性脑卒中    急性缺血性脑卒中
    急性脑梗死待查    急性脑梗死待查
    急性脑梗死9h    急性脑梗死>8h
    急性脑梗死7h    急性脑梗死>6h
    急性脑梗死4周    急性脑梗死>3周
    急性高尿酸    急性高尿酸
    急性出血倾向    急性出血倾向
    基底节区出血    基底节区出血
    肌钙蛋白阴性    肌钙蛋白阴性
    肌钙蛋白升高    肌钙蛋白升高
    肌钙蛋白0.2ug/L    肌钙蛋白>0.1ug/L
    肌钙蛋白0.2ug/L    肌钙蛋白>0.1ug/L
    肌钙蛋白0.009ug/L    肌钙蛋白<0.01ug/L
    肌钙蛋白0.01ug/L    肌钙蛋白[0.01ug/L-0.1ug/L]
    肌钙蛋白0.1ug/L    肌钙蛋白[0.01ug/L-0.1ug/L]
    怀疑中枢神经系统浸润    怀疑中枢神经系统浸润
    怀疑痫性发作    怀疑痫性发作
    怀疑脑梗死    怀疑脑梗死
    怀疑短暂性脑缺血发作    怀疑短暂性脑缺血发作
    化疗前    化疗前
    呼吸音消失    呼吸音消失
    呼吸21次/分    呼吸>20次/分
    后遗症期DVT    后遗症期DVT
    冠状动脉造影左主干分叉处病变    冠状动脉造影左主干分叉处病变
    冠状动脉造影严重左主干病变    冠状动脉造影严重左主干病变
    冠状动脉造影血管狭窄>50%    冠状动脉造影血管狭窄>50%
    冠状动脉造影前降支近端病变    冠状动脉造影前降支近端病变
    冠状动脉造影多支病变    冠状动脉造影多支病变
    股静脉DVT    股静脉DVT
    睾丸长径2.6cm    睾丸长径>2.5cm
    睾丸容积增大    睾丸容积增大
    睾丸容积4ml    睾丸容积>=4ml
    睾丸容积4.1ml    睾丸容积>=4ml
    高肿瘤负荷者    高肿瘤负荷者
    高血压患者收缩压(SBP)从原水平降低30%以上    高血压患者收缩压(SBP)从原水平降低30%以上
    高血压患者收缩压(SBP)89mmHg    高血压患者收缩压(SBP)<90mmHg
    高血压动脉硬化性出血    高血压动脉硬化性出血
    高纤维蛋白原血症    高纤维蛋白原血症
    高危患者PCI治疗后    高危患者PCI治疗后
    高剂量羟基脲治疗无效    高剂量羟基脲治疗无效
    高剂量羟基脲治疗    高剂量羟基脲治疗
    肝细胞癌待查    肝细胞癌待查
    风湿性二尖瓣病变    风湿性二尖瓣病变
    肺栓塞危险因素    肺栓塞危险因素
    肺栓塞史    肺栓塞史
    非心源性短暂性脑缺血发作    非心源性短暂性脑缺血发作
    非高血压患者收缩压(SBP)79mmHg    非高血压患者收缩压(SBP)<80mmHg
    非风湿性二尖瓣病变    非风湿性二尖瓣病变
    非二氢吡啶CCB    非二氢吡啶CCB
    非出血高危    非出血高危
    非T波低平    非T波低平
    非T波倒置    非T波倒置
    非ST段压低    非ST段压低
    非ST段抬高型心肌梗死待查    非ST段抬高型心肌梗死待查
    反复感染者    反复感染者
    二尖瓣环钙化    二尖瓣环钙化
    二次或三次打击淋巴瘤    二次或三次打击淋巴瘤
    恶性肿瘤史    恶性肿瘤史
    恶化性胸痛    恶化性胸痛
    多脑叶梗死    多脑叶梗死
    短暂性脑缺血发作待查    短暂性脑缺血发作待查
    动脉血气分析氧分压7kPa    动脉血气分析氧分压<8kPa
    动脉血气分析氧分压79mmHg    动脉血气分析氧分压<80mmHg
    动脉血气分析氧分压59mmHg    动脉血气分析氧分压<60mmHg
    动脉血气分析氧分压6.66kPa    动脉血气分析氧分压<6.67kPa
    动脉血气分析氧分压49mmHg    动脉血气分析氧分压<50mmHg
    动脉血气分析氧分压10.66kPa    动脉血气分析氧分压<10.67kPa
    动脉血气分析二氧化碳分压7kPa    动脉血气分析二氧化碳分压>6kPa
    动脉血气分析二氧化碳分压6.68kPa    动脉血气分析二氧化碳分压>6.67kPa
    动脉血气分析二氧化碳分压51mmHg    动脉血气分析二氧化碳分压>50mmHg
    动脉血气分析二氧化碳分压46mmHg    动脉血气分析二氧化碳分压>45mmHg
    动脉血气分析二氧化碳分压4.5kPa    动脉血气分析二氧化碳分压<4.6kPa
    动脉血气分析二氧化碳分压34mmHg    动脉血气分析二氧化碳分压<35mmHg
    动脉血气分析二氧化碳分压6.67kPa    动脉血气分析二氧化碳分压<=6.67kPa
    动脉血气分析二氧化碳分压6.66kPa    动脉血气分析二氧化碳分压<=6.67kPa
    动脉血气分析二氧化碳分压50mmHg    动脉血气分析二氧化碳分压<=50mmHg
    动脉血气分析二氧化碳分压49mmHg    动脉血气分析二氧化碳分压<=50mmHg
    动脉血气分析PO27kPa    动脉血气分析PO2<8kPa
    动脉血气分析PO279mmHg    动脉血气分析PO2<80mmHg
    动脉血气分析PO259mmHg    动脉血气分析PO2<60mmHg
    动脉血气分析PO26.66kPa    动脉血气分析PO2<6.67kPa
    动脉血气分析PO249mmHg    动脉血气分析PO2<50mmHg
    动脉血气分析PO210.66kPa    动脉血气分析PO2<10.67kPa
    动脉血气分析PCO27kPa    动脉血气分析PCO2>6kPa
    动脉血气分析PCO26.68kPa    动脉血气分析PCO2>6.67kPa
    动脉血气分析PCO251mmHg    动脉血气分析PCO2>50mmHg
    动脉血气分析PCO246mmHg    动脉血气分析PCO2>45mmHg
    动脉血气分析PCO24.5kPa    动脉血气分析PCO2<4.6kPa
    动脉血气分析PCO234mmHg    动脉血气分析PCO2<35mmHg
    动脉血气分析PCO26.67kPa    动脉血气分析PCO2<=6.67kPa
    动脉血气分析PCO26.66kPa    动脉血气分析PCO2<=6.67kPa
    动脉血气分析PCO250mmHg    动脉血气分析PCO2<＝50mmHg
    动脉血气分析PCO249mmHg    动脉血气分析PCO2<＝50mmHg
    典型ALL    典型ALL
    第二性征发育提前    第二性征发育提前
    低血压持续30分钟    低血压持续30分钟
    低心排血量综合征    低心排血量综合征
    低钠血症持续时间48小时    低钠血症持续时间>=48小时
    低钠血症持续时间49小时    低钠血症持续时间>=48小时
    低钠血症持续时间47小时    低钠血症持续时间<48小时
    低密度影>1/3大脑半球    低密度影>1/3大脑半球
    单眼视力下降    单眼视力下降
    单核细胞亚型    单核细胞亚型
    大手术后    大手术后
    大脑白细胞淤滞    大脑白细胞淤滞
    达到骨髓缓解    达到骨髓缓解
    初始治疗    初始治疗
    出血破入脑室    出血破入脑室
    出血量大    出血量大
    出血极高危    出血极高危
    持续卧床4天    持续卧床>3天
    成熟B淋巴细胞白血病    成熟B淋巴细胞白血病
    陈旧性心肌梗死    陈旧性心肌梗死
    不能耐受克拉屈滨    不能耐受克拉屈滨
    不明原因胸痛难    不明原因胸痛难
    不明原因胸痛    不明原因胸痛
    不明原因呼吸困难    不明原因呼吸困难
    不接受克拉屈滨治疗    不接受克拉屈滨治疗
    不存在骨髓细胞数量过少    不存在骨髓细胞数量过少
    病理性Q波    病理性Q波
    别嘌呤醇治疗前    别嘌呤醇治疗前
    便秘住院指征    便秘住院指征
    便秘待查    便秘待查
    便秘持续存在    便秘持续存在
    白细胞分离术    白细胞分离术
    巴雷特食管待查    巴雷特食管待查
    WBC51*10E9/L    WBC>50*10E9/L
    WBC11*10E9/L    WBC>10*10E9/L
    WBC30×10E9/L    WBC>=30×10E9/L
    WBC31×10E9/L    WBC>=30×10E9/L
    WBC100*109/L    WBC>=100*109/L
    WBC101*109/L    WBC>=100*109/L
    WBC49x10E9/L    WBC<50x10E9/L
    WBC10*109/L    WBC<=10*109/L
    WBC9*109/L    WBC<=10*109/L
    T波改变    T波改变
    T波低平    T波低平
    T波倒置0.3mv    T波倒置>0.2mv
    T波倒置0.2mv    T波倒置<=0.2mv
    T波倒置0.1mv    T波倒置<=0.2mv
    ST段压低0.2mv    ST段压低>0.1mv
    ST段压低0.05mv    ST段压低［0.05mv-0.1mv］
    ST段压低0.1mv    ST段压低［0.05mv-0.1mv］
    ST段压低    ST段压低
    ST段抬高型心肌梗死待查    ST段抬高型心肌梗死待查
    ST段抬高0.06mv    ST段抬高>0.05mv
    ST段抬高0.04mv    ST段抬高<0.05mv
    ST段抬高    ST段抬高
    ST段不抬高    ST段不抬高
    ß受体阻滞剂    ß受体阻滞剂
    R-CHOP方案治疗缓解    R-CHOP方案治疗缓解
    PT16s    PT>15s
    PaCO231mmHg    PaCO2<32mmHg
    Myc伴Bcl-2/Bcl-6基因断裂    Myc伴Bcl-2/Bcl-6基因断裂
    INR1.8    INR>1.7
    HbA1c增高    HbA1c增高
    GRACE评分中危    GRACE评分中危
    GRACE评分极高危    GRACE评分极高危
    GRACE评分高危    GRACE评分高危
    GRACE评分低危    GRACE评分低危
    GRACE评分141    GRACE评分>140
    GRACE评分140    GRACE评分=<140
    GRACE评分139    GRACE评分=<140
    GRACE评分108    GRACE评分<109
    GRACE评分109    GRACE评分[109-140]
    GRACE评分140    GRACE评分[109-140]
    GnRH刺激试验LH峰值(免疫荧光法IFMA)9.7U/L    GnRH刺激试验LH峰值>9.6U/L(免疫荧光法IFMA)
    GnRH刺激试验LH峰值(免疫荧光法IFMA)7.0U/L    GnRH刺激试验LH峰值>6.9U/L(免疫荧光法IFMA)
    GnRH刺激试验LH峰值(放免法)16U/L    GnRH刺激试验LH峰值>15U/L(放免法)
    GnRH刺激试验LH峰值(放免法)13U/L    GnRH刺激试验LH峰值>12U/L(放免法)
    GnRH刺激试验LH峰值(免疫化学发光法)5U/L    GnRH刺激试验LH峰值>＝5U/L(免疫化学发光法)
    GnRH刺激试验LH峰值(免疫化学发光法)6U/L    GnRH刺激试验LH峰值>＝5U/L(免疫化学发光法)
    GnRH刺激试验LH峰值(免疫化学发光法)5U/L    GnRH刺激试验LH峰值>=5U/L(免疫化学发光法)
    GnRH刺激试验LH峰值(免疫化学发光法)6U/L    GnRH刺激试验LH峰值>=5U/L(免疫化学发光法)
    GnRH刺激试验LH峰值/FSH峰值0.7    GnRH刺激试验LH峰值/FSH峰值>0.6
    GCS9分    GCS>8分
    GCS7分    GCS<8分
    GCS8分    GCS<＝8分
    GCS7分    GCS<＝8分
    FLT3基因突变    FLT3基因突变
    FDG敏感淋巴瘤    FDG敏感淋巴瘤
    D-二聚体明显升高    D-二聚体明显升高
    cTnT阴性    cTnT阴性
    cTnT阳性    cTnT阳性
    cTnI阴性    cTnI阴性
    cTnI阳性    cTnI阳性
    CK-MB正常    CK-MB正常
    CK-MB升高    CK-MB升高
    CHA2DS2-VASc评分0    CHA2DS2-VASc评分>=0
    CHA2DS2-VASc评分1    CHA2DS2-VASc评分>=0
    B超子宫长度3.4cm    B超子宫长度[3.4cm-4cm]
    B超子宫长度4cm    B超子宫长度[3.4cm-4cm]
    B超卵巢容积1ml    B超卵巢容积[1ml-3ml]
    B超卵巢内2个以上卵泡直径4mm    B超卵巢内2个以上卵泡直径>=4mm
    B超卵巢内2个以上卵泡直径4.1mm    B超卵巢内2个以上卵泡直径>=4mm
    BUN9mmol/L    BUN>8.9mmol/L
    BUN26mg/dl    BUN>25mg/dl
    BRAF-V600E分子检测BRAFV600E阳性    BRAF-V600E分子检测BRAFV600E阳性
    BNP升高    BNP升高
    BCR-ABL融合基因阴性    BCR-ABL融合基因阴性
    ATRA治疗    ATRA治疗
    APTT增高    APTT增高
    AnnArbor淋巴瘤分期系统分期I期    AnnArbor淋巴瘤分期系统分期I期
    AnnArbor淋巴瘤分期系统分期IV期    AnnArbor淋巴瘤分期系统分期IV期
    AnnArbor淋巴瘤分期系统分期II期    AnnArbor淋巴瘤分期系统分期II期
    AnnArbor淋巴瘤分期系统分期III期    AnnArbor淋巴瘤分期系统分期III期
    ABCD2评分4    ABCD2评分>=4
    ABCD2评分5    ABCD2评分>=4
    短暂性脑缺血发作史5月    6个月内短暂性脑缺血发作史
    48小时内接受过肝素治疗    48小时内接受过肝素治疗
    24小时尿量2.6L    24小时尿量>2.5L
    ECOG体能状况评分3分    ECOG体能状况评分>2分
    短暂性脑缺血发作    短暂性脑缺血发作
    结合胆红素/总胆红素50%    结合胆红素/总胆红素[50%~80%]
    结合胆红素/总胆红素80%    结合胆红素/总胆红素[50%~80%]
    尿沉渣镜检红细胞数多为3~10个HP    尿沉渣镜检红细胞数多为3~10个HP
    血清铁(S1)49μg/dl    血清铁(S1)<50μg/dl
    总铁结合力(TIBC)64.45μmol/L    总铁结合力(TIBC)>64.44μmol/L
    心脏指数(CI)1.9L/(min*m2)    心脏指数(CI)<2.0L/(min*m2)
    心脏指数(CI)1.7L/(min*m2)    心脏指数(CI)<1.8L/(min*m2)
    心脏指数(CI)2.1L/(min*m2)    心脏指数(CI)<2.2L/(min*m2)