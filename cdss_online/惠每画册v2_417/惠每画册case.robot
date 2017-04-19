*** Settings ***
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

案例一
    [Documentation]    断言error:"上气道梗阻id=35015"
    智能诊断    ['body']['suspectedDiseases'][4]['id']    35015    symptom=间断喘憋5年,哮喘5年,吸入激素治疗,疗效不明显,扔发作喘憋,有时自行缓解,颈部局限性哮鸣音CXR,CT-气管新生物    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
    ...    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]



案例二
    [Documentation]    断言error:"主动脉夹层id=8213"
    智能诊断    ['body']['suspectedDiseases'][0]['id']    8213    symptom=妊娠26周,先兆子痫住产科,凌晨1点突感胸痛,患者数小时后出现休克,抢救无效死亡    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=35    ageType=岁
    ...    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]



案例三
    [Documentation]    断言error:"甲状腺功能减退症id=4888"
    智能诊断    ['body']['suspectedDiseases'][12]['id']    4888    symptom=便秘1年余就诊,大便由平常每日1次渐至每周1次,且伴有体重增加(约10kg),纳差,腹胀,易疲劳等症,病人曾在多家医院诊治,被诊断为慢性结肠炎,功能性消化不良等,单治疗未见好转,TSH明显增高    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=28    ageType=岁
    ...    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]




案例四
    [Documentation]    断言error:"急性胰腺炎id=36"
    智能诊断    ['body']['suspectedDiseases'][5]['id']    36    symptom=突发上腹部疼痛,阵发性加剧,伴恶心,呕吐10小时,既往主动脉夹层手术史,腹平坦,上腹部压痛明显,无肌紧张,反跳痛,肝脾区无叩击痛,移动性浊音阴性,双侧桡动脉,股动脉搏动可    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=1    bodyTempr=    lowBldPress=80    highBldPress=130    examInfo=    heartRate=    age=38    ageType=岁
    ...    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]





