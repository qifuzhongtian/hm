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
# bodyTempr Doubl3e 否 体温
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

#######女  28  岁 因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗效果不明显 甲状腺功能减退症
市场部全科版演示case-2行
    [Documentation]    主诉:女 28  岁 因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗效果不明显 甲状腺功能减退症
    ${getRes}    智能诊断2.3    symptom=因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗效果不明显    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=28    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    Should Contain    ${aj[:10]}    甲状腺功能减退症


######男 38  岁 "突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时, 体格检查：血压： 130/80mmHg, 腹平坦，上腹部压痛明显，无肌紧张、反跳痛，肝脾区无叩击痛，移动性浊音阴性，双侧桡动脉、股动脉搏动可 腹部CT：腹主动脉内仍可见低密度隔膜，并分为真假两腔"  急性胰腺炎
市场部全科版演示case-3行
    [Documentation]    主诉:男 38  岁 "突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时,体格检查：血压： 130/80mmHg, 腹平坦，上腹部压痛明显，无肌紧张、反跳痛，肝脾区无叩击痛，移动性浊音阴性，双侧桡动脉、股动脉搏动可腹部CT：腹主动脉内仍可见低密度隔膜，并分为真假两腔"  急性胰腺炎
    ${getRes}    智能诊断2.3    symptom="突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时,.体格检查：血压:130/80mmHg,腹平坦，上腹部压痛明显，无肌紧张、反跳痛，肝脾区无叩击痛，移动性浊音阴性，双侧桡动脉、股动脉搏动可 腹部CT：腹主动脉内仍可见低密度隔膜，并分为真假两腔"    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=38    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    Should Contain    ${aj[:10]}    急性胰腺炎


########女 14  岁 "间断喘憋5年，外院诊断哮喘5年，吸入激素治疗，疗效不明显，仍发作喘憋，有时自行缓解 追问：喘息与体位有关。查体颈部局限性哮鸣音 肺功能：舒张试验（-）CXR(-)"  气管内异物
市场部全科版演示case-4行
    [Documentation]    主诉:女 14  岁 "间断喘憋5年，外院诊断哮喘5年，吸入激素治疗，疗效不明显，仍发作喘憋，有时自行缓解 追问：喘息与体位有关。查体颈部局限性哮鸣音 肺功能：舒张试验（-）CXR(-)"  气管内异物
    ${getRes}    智能诊断2.3    symptom="间断喘憋5年，外院诊断哮喘5年，吸入激素治疗，疗效不明显，仍发作喘憋，有时自行缓解.追问：喘息与体位有关。查体颈部局限性哮鸣音 肺功能：舒张试验（-）CXR(-)",气管内异物    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=14    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    Should Contain    ${aj[:10]}    气管内异物


########女 70  岁 腹泻，腹痛，血便1周，结膜苍白，门诊诊断感染性腹泻，补液，口服抗生素治疗。症状有所缓解，但持续贫血难以纠正 结肠癌
市场部全科版演示case-5行
    [Documentation]    主诉:女 70  岁 腹泻，腹痛，血便1周，结膜苍白，门诊诊断感染性腹泻，补液，口服抗生素治疗。症状有所缓解，但持续贫血难以纠正 结肠癌
    ${getRes}    智能诊断2.3    symptom=腹泻，腹痛，血便1周，结膜苍白，门诊诊断感染性腹泻，补液，口服抗生素治疗。症状有所缓解，但持续贫血难以纠正    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=70    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    Should Contain    ${aj[:10]}    结肠恶性肿瘤


#########女 35  岁 妊娠26周，先兆子痫住产科。凌晨1点突感胸痛，血压160/100mmHg  主动脉夹层
市场部全科版演示case-6行
    [Documentation]    主诉:妊娠26周，先兆子痫住产科。凌晨1点突感胸痛，血压160/100mmHg
    ${getRes}    智能诊断2.3    symptom=妊娠26周，先兆子痫住产科。凌晨1点突感胸痛    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=100    highBldPress=160    examInfo=
    ...    heartRate=    age=35    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    Should Contain    ${aj[:10]}    主动脉夹层


