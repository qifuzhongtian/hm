*** Settings ***
Suite Teardown    Delete All Sessions
# Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
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


*** Test Cases ***
1.市场部案例一
    [Documentation]    主诉:突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时.期望诊断结果返回的diseaseName top5含有'急性胰腺炎'
    ${getRes}    智能诊断2.3    symptom=突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=38    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    急性胰腺炎

2.市场部案例二
    [Documentation]    主诉:妊娠26周，先兆子痫住产科。突感胸痛,低压100,高压160.期望诊断结果返回的diseaseName top5含有'主动脉夹层'
    ${getRes}    智能诊断2.3    symptom=突妊娠26周，先兆子痫住产科。突感胸痛    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=100    highBldPress=160    examInfo=
    ...    heartRate=    age=35    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    主动脉夹层

3.市场部案例三
    [Documentation]    主诉:查体颈部局限性哮鸣音间断喘憋5年，咳嗽，与体位有关，有时可自行缓解.期望诊断结果返回的diseaseName top6含有'上气道梗阻'
    ${getRes}    智能诊断2.3    symptom=查体颈部局限性哮鸣音间断喘憋5年，咳嗽，与体位有关，有时可自行缓解,查体颈部局限性哮鸣音CXR(-),CT-气管新生物    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=14    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:6]}    上气道梗阻

4.市场部案例四
    [Documentation]    主诉:腹泻，腹痛，血便1周 结膜苍白.期望诊断结果返回的diseaseName含有'结肠癌'
    ${getRes}    智能诊断2.3    symptom=腹泻，腹痛，血便1周 结膜苍白    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=70    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:15]}    结肠癌

5.市场部案例五
    [Documentation]    主诉:腹泻，腹痛，血便1周 结膜苍白.期望诊断结果返回的diseaseName含有'甲状腺功能减退症'
    ${getRes}    智能诊断2.3    symptom=便秘1年余就诊，大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=28    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    甲状腺功能减退症

6.惠每医疗宣传手册案例一
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,出现'腰椎间盘突出症'.期望诊断结果返回的diseaseName top5含有'腰椎间盘突出症'
    ${getRes}    智能诊断2.3    symptom==腰痛、下肢疼痛、尿潴留    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    腰椎间盘突出症

7.惠每医疗宣传手册案例二
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,性别女.诊断结果返回的diseaseName不会出现'前列腺增生'
    ${getRes}    智能诊断2.3    symptom==腰痛、下肢疼痛、尿潴留    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Not Contain    ${aj[:5]}    前列腺增生

8.惠每医疗宣传手册案例三
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,性别女,4岁.诊断结果返回的diseaseName top5不会出现'前列腺增生'
    ${getRes}    智能诊断2.3    symptom=腰痛、下肢疼痛、尿潴留    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=4    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Not Contain    ${aj[:5]}    腰椎间盘突出症

9.妇产科室演示病例15例-1.1
    [Documentation]    主诉:34＋3周孕，单胎，不明原因阴道流液1小时，量中，湿透外裤，不伴腹痛.断言:妊娠'
    ${getRes}    智能诊断2.3    symptom=34＋3周孕，单胎，不明原因阴道流液1小时，量中，湿透外裤，不伴腹痛.查体：四步触诊检查：胎位为头位，摇动胎头时见有清亮液体自阴道口流出。外裤大片湿透，外阴湿润，无明显宫缩。    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=26    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    Should Contain    ${aj[:10]}    妊娠

10.妇产科室演示病例15例-1.2
    [Documentation]    主诉:34＋3周孕，单胎，不明原因阴道流液1小时，量中，湿透外裤，不伴腹痛 断言:胎膜早破'
    ${getRes}    智能诊断2.3    symptom=34＋3周孕，单胎，不明原因阴道流液1小时，量中，湿透外裤，不伴腹痛.查体：四步触诊检查：胎位为头位，摇动胎头时见有清亮液体自阴道口流出。外裤大片湿透，外阴湿润，无明显宫缩。    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=26    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    Should Contain    ${aj[:10]}    胎膜早破

11.妇产科室演示病例15例-2
    [Documentation]    主诉:'月经紊乱2年，伴阵发性潮热、多汗、心悸、烦躁。近2年月经周期长短不等，经量偏多，淋漓不尽，曾用中药调经效果不佳，末次月经淋漓不尽至今未净。15年前安放宫内节育器（I UD）。'
    ${getRes}    智能诊断2.3    symptom=月经紊乱2年，伴阵发性潮热、多汗、心悸、烦躁。近2年月经周期长短不等，经量偏多，淋漓不尽，曾用中药调经效果不佳，末次月经淋漓不尽至今未净。15年前安放宫内节育器（I UD）。    previousHistory=    personalHistory=G2P1，末次月经40日前。    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    Should Contain    ${aj[:10]}    围绝经期综合征
    ####
    # 12.妇产科室演示病例15例-3
    #    [Documentation]    主诉:阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血'
    #    ${getRes}    智能诊断2.3    symptom=阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血
    #    ...    previousHistory=    personalHistory=G2P1
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=44    ageType=岁    confirmDiagnosis=
    #    ...    confirmDiagnosisMap=    presentHistory=
    #    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    #    Should Contain    ${aj[:10]}    宫颈原位癌

12.妇产科室演示病例15例-3-子疾病
    [Documentation]    主诉:阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血'
    ${getRes}    智能诊断2.3    symptom=阴道分泌物增多并有异味4个月，偶有性交后出血1个月.妇科查体：阴道内分泌物多、色白、阴道无充血，宫颈中度糜烂，触之有少许出血    previousHistory=    personalHistory=G2P1    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=44    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:10]}    宫颈原位癌

13.妇产科室演示病例15例-4
       [Documentation]    主诉:'患者近5日感白带增多，臭鱼腥味，伴轻度外阴瘙痒，同房后加重，无尿频、尿急、尿痛等症状,妇科查体：外阴无红肿，阴道分泌物多，色白，米汤样，无充血。宫颈轻度糜烂，无充血水肿。妇科查体：外阴无红肿，阴道分泌物多，色白，米汤样，无充血。宫颈轻度糜烂，无充血水肿。'
       ${getRes}    智能诊断2.3    symptom=患者近5日感白带增多，臭鱼腥味，伴轻度外阴瘙痒，同房后加重，无尿频、尿急、尿痛等症状,妇科查体：外阴无红肿，阴道分泌物多，色白，米汤样，无充血。宫颈轻度糜烂，无充血水肿。妇科查体：外阴无红肿，阴道分泌物多，色白，米汤样，无充血。宫颈轻度糜烂，无充血水肿。
       ...    previousHistory=    personalHistory=G4P1
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=29    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    细菌性阴道病

14.妇产科室演示病例15例-5
       [Documentation]    主诉:'腹胀、纳差、消瘦4个月 查体：腹部明显膨隆，移动性浊音阳性。妇科检查：子宫颈光滑，子宫较正常小，双附件区扪及质硬，固定包块，大小约10cm，包块界线不清，后陷凹扪及质硬肿块压迫直肠，直肠粘膜光滑。'
       ${getRes}    智能诊断2.3    symptom=腹胀、纳差、消瘦4个月 查体：腹部明显膨隆，移动性浊音阳性。妇科检查：子宫颈光滑，子宫较正常小，双附件区扪及质硬，固定包块，大小约10cm，包块界线不清，后陷凹扪及质硬肿块压迫直肠，直肠粘膜光滑。
       ...    previousHistory=    personalHistory=绝经4年
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=56    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    卵巢恶性肿瘤

15.妇产科室演示病例15例-6
       [Documentation]    主诉:'停经35周，皮肤瘙痒2周 现病史：妊娠33周出现皮肤瘙痒，以四肢和腹部为主。已经在皮肤科就诊排除皮肤疾病。查体：巩膜轻度黄染，全身有抓痕，无皮疹，无肝肿大及肝区压痛'
       ${getRes}    智能诊断2.3    symptom=停经35周，皮肤瘙痒2周 现病史：妊娠33周出现皮肤瘙痒，以四肢和腹部为主。已经在皮肤科就诊排除皮肤疾病。查体：巩膜轻度黄染，全身有抓痕，无皮疹，无肝肿大及肝区压痛
       ...    previousHistory=无肝炎及输血史。    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=30    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    妊娠期肝内胆汁淤积症

16.妇产科室演示病例15例-7
       [Documentation]    主诉:'痛经进行性加重5年，伴经期肛门坠胀2年 查体：外阴阴道无异常，宫颈光滑，子宫正常大小，活动差，左侧附件区扪及6c m大小囊性包块，与子宫粘连，不活动，触痛。右附件增厚，触痛。子宫骶韧带、后陷凹扪及触痛性结节。'
       ${getRes}    智能诊断2.3    symptom=痛经进行性加重5年，伴经期肛门坠胀2年 查体：外阴阴道无异常，宫颈光滑，子宫正常大小，活动差，左侧附件区扪及6c m大小囊性包块，与子宫粘连，不活动，触痛。右附件增厚，触痛。子宫骶韧带、后陷凹扪及触痛性结节。
       ...    previousHistory=    personalHistory=G3P2
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=38    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    子宫内膜异位症

17.妇产科室演示病例15例-8
       [Documentation]    主诉:'7天前不洁性交后出现大量黏液脓性、黄色、有异味阴道分泌物，伴有外阴瘙痒、灼痛，尿急、尿频症状，无下腹部疼痛不适。既往无妇科肿瘤病史。查体：外阴、阴道充血，无肿物；尿道口充血，挤压可见有脓性分泌物流出，宫颈充血明显，可见脓性分泌物从宫口流出；子宫正常大小，质软，无压痛，活动正常；两侧附件区未触及肿块，无压痛。'
       ${getRes}    智能诊断2.3    symptom=7天前不洁性交后出现大量黏液脓性、黄色、有异味阴道分泌物，伴有外阴瘙痒、灼痛，尿急、尿频症状，无下腹部疼痛不适。既往无妇科肿瘤病史。查体：外阴、阴道充血，无肿物；尿道口充血，挤压可见有脓性分泌物流出，宫颈充血明显，可见脓性分泌物从宫口流出；子宫正常大小，质软，无压痛，活动正常；两侧附件区未触及肿块，无压痛。
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=24    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    急性宫颈炎

18.妇产科室演示病例15例-9
       [Documentation]    主诉:'阴道接触性出血1年、不规则阴道流血5个月。1年前同房后出现少量阴道出血，未予重视，未做任何处理。5个月前发生不规则阴道流血，无发热及腹痛。查体:宫颈中度糜烂、下唇长大呈菜花状，直径约4c m'
       ${getRes}    智能诊断2.3    symptom=阴道接触性出血1年、不规则阴道流血5个月。1年前同房后出现少量阴道出血，未予重视，未做任何处理。5个月前发生不规则阴道流血，无发热及腹痛。查体:宫颈中度糜烂、下唇长大呈菜花状，直径约4c m
       ...    previousHistory=    personalHistory=G4P1
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=50    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases'][0]['subDiseases']]
       Should Contain    ${aj[:10]}    子宫颈癌

19.妇产科室演示病例15例-10
       [Documentation]    主诉:'现病史：3年前因功能性子宫出血住院，曾用雌孕激素序贯治疗，用药时有规律撤血，停药复发。此次无明显诱因停经5个月，要求诊治。患病以来体重逐渐增加约5kg。 查体：面部痤疮，四肢毛较多、长、黑，双乳发育正常，乳头有长毛多根。下腹脐下正中至耻骨联合有长毛分布。妇科检查：外阴发育正常，阴毛浓密，肛周有分布。肛查：子宫正常大，双侧卵巢可触及，约4c m×4c m×5c m。'
       ${getRes}    智能诊断2.3    symptom=现病史：3年前因功能性子宫出血住院，曾用雌孕激素序贯治疗，用药时有规律撤血，停药复发。此次无明显诱因停经5个月，要求诊治。患病以来体重逐渐增加约5kg。 查体：面部痤疮，四肢毛较多、长、黑，双乳发育正常，乳头有长毛多根。下腹脐下正中至耻骨联合有长毛分布。妇科检查：外阴发育正常，阴毛浓密，肛周有分布。肛查：子宫正常大，双侧卵巢可触及，约4c m×4c m×5c m。
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    多囊卵巢综合征

20.妇产科室演示病例15例-11
       [Documentation]    主诉:'现病史：月经量增多2年，下腹胀半年，无痛经。查体：妇科检查提示子宫增大近3个月孕，质硬，形状不规则，活动度好'
       ${getRes}    智能诊断2.3    symptom=现病史：月经量增多2年，下腹胀半年，无痛经。查体：妇科检查提示子宫增大近3个月孕，质硬，形状不规则，活动度好
       ...    previousHistory=    personalHistory=G2P1
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=45    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    子宫平滑肌瘤

21.妇产科室演示病例15例-12
       [Documentation]    主诉:'停经70日，反复阴道流血1个月余现病史：停经45日时出现恶心，呕吐，每日10余次，呕吐物为胃内容物。入院30日前无诱因下阴道少量流血，伴小血块查体：妇科检查为外阴已婚已产式，阴道少量血，无紫蓝色结节，宫颈软，轻糜，子宫前位，如孕3+个月大，质中，活动好，无压痛，双附件未及包块及压痛'
       ${getRes}    智能诊断2.3    symptom=停经70日，反复阴道流血1个月余现病史：停经45日时出现恶心，呕吐，每日10余次，呕吐物为胃内容物。入院30日前无诱因下阴道少量流血，伴小血块查体：妇科检查为外阴已婚已产式，阴道少量血，无紫蓝色结节，宫颈软，轻糜，子宫前位，如孕3+个月大，质中，活动好，无压痛，双附件未及包块及压痛
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=20    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    完全性葡萄胎

22.妇产科室演示病例15例-13
       [Documentation]    主诉:'孕40周，下腹阵发性疼痛3小时 现病史：产程进展顺利，胎心音正常。4小时后宫口开全，胎膜自然破裂，羊水量少，色清。破膜后，产妇出现呛咳，口唇发紫，诉心慌，气急，立即面罩加压给氧，症状无缓解 查体:胎心音100次/分，先露+2。听诊双肺少量湿啰音'
       ${getRes}    智能诊断2.3    symptom=孕40周，下腹阵发性疼痛3小时 现病史：产程进展顺利，胎心音正常。4小时后宫口开全，胎膜自然破裂，羊水量少，色清。破膜后，产妇出现呛咳，口唇发紫，诉心慌，气急，立即面罩加压给氧，症状无缓解 查体:胎心音100次/分，先露+2。听诊双肺少量湿啰音
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=37.2    lowBldPress=70    highBldPress=120
       ...    examInfo=    heartRate=130    age=30    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
       Should Contain    ${aj[:10]}    羊水栓塞

23.妇产科室演示病例15例-14.1
       [Documentation]    主诉:'经紊乱6个月 现病史：近6个月来，月经量增多，较发病前增加2～3倍，并有小血块；经期延长达12日；月经周期规则；经期伴有轻微下腹阵发性疼痛、略有头晕 断言:排卵性月经失调'
       ${getRes}    智能诊断2.3    symptom=经紊乱6个月 现病史：近6个月来，月经量增多，较发病前增加2～3倍，并有小血块；经期延长达12日；月经周期规则；经期伴有轻微下腹阵发性疼痛、略有头晕
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=28    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    排卵性月经失调

24.妇产科室演示病例15例-14.2
       [Documentation]    主诉:'经紊乱6个月 现病史：近6个月来，月经量增多，较发病前增加2～3倍，并有小血块；经期延长达12日；月经周期规则；经期伴有轻微下腹阵发性疼痛、略有头晕 断言:子宫黏膜下肌瘤'
       ${getRes}    智能诊断2.3    symptom=经紊乱6个月 现病史：近6个月来，月经量增多，较发病前增加2～3倍，并有小血块；经期延长达12日；月经周期规则；经期伴有轻微下腹阵发性疼痛、略有头晕
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=28    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:10]}    子宫粘膜下平滑肌瘤
25.妇产科室演示病例15例-15
       [Documentation]    主诉:'早孕自然流产3次。近1年月经周期不规律，自原来的28～30天变为28～49天，经量无变化 查体：妇科检查未见异常'
       ${getRes}    智能诊断2.3    symptom=早孕自然流产3次。近1年月经周期不规律，自原来的28～30天变为28～49天，经量无变化 查体：妇科检查未见异常
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=38    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    子宫粘连
26.体格检查case-1
       [Documentation]    主诉:'空腹血糖: 6.6mmol／L    ->    空腹血糖升高    -> 慢性肾衰竭'
       ${getRes}    智能诊断2.3    symptom=腹血糖升高 空腹血糖: 6.6mmol／L
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    慢性肾衰竭
27.体格检查case-2.1
       [Documentation]    主诉:'血红蛋白: 170g／L    ->    血红蛋白增高    -> 血红蛋白增高,法洛四联症 断言:血红蛋白增高'
       ${getRes}    智能诊断2.3    symptom=红蛋白增高 血红蛋白: 170g／L
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    血红蛋白增高
28.体格检查case-2.2
       [Documentation]    主诉:'血红蛋白: 170g／L    ->    血红蛋白增高    -> 血红蛋白增高,法洛四联症 断言:法洛四联症 '
       ${getRes}    智能诊断2.3    symptom=红蛋白增高 血红蛋白: 170g／L
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    法洛四联症

29.体格检查case-3
       [Documentation]    主诉:'C反应蛋白升高 C反应蛋白3mmol/L'
       ${getRes}    智能诊断2.3    symptom=C反应蛋白升高 C反应蛋白3mmol/L
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    细菌性肺炎

30.体格检查case-4
       [Documentation]    主诉:'小板计数减少 PLT:90'
       ${getRes}    智能诊断2.3    symptom=小板计数减少 PLT:90
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    法洛四联症

31.体格检查case-5
       [Documentation]    主诉:'清肌酐升高 血清肌酐：120umol/L'
       ${getRes}    智能诊断2.3    symptom=清肌酐升高 血清肌酐：120umol/L
       ...    previousHistory=    personalHistory=
       ...    allergyHistory=    familyHistory=
       ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
       ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
       ...    confirmDiagnosisMap=    presentHistory=
       ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
       Should Contain    ${aj[:15]}    肾衰竭
