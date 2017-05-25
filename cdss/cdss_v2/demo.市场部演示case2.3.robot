*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Setup    Delete All Sessions
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
*** Test Cases ***
市场部案例一
    [Documentation]    主诉:突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时.期望诊断结果返回的diseaseName top5含有'急性胰腺炎'
    ${getRes}    智能诊断2.3    symptom=突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=38    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    急性胰腺炎


市场部案例二
    [Documentation]    主诉:妊娠26周，先兆子痫住产科。突感胸痛,低压100,高压160.期望诊断结果返回的diseaseName top5含有'主动脉夹层'
    ${getRes}    智能诊断2.3    symptom=突妊娠26周，先兆子痫住产科。突感胸痛
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=100    highBldPress=160
    ...    examInfo=    heartRate=    age=35    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    主动脉夹层



市场部案例三
    [Documentation]    主诉:查体颈部局限性哮鸣音间断喘憋5年，咳嗽，与体位有关，有时可自行缓解.期望诊断结果返回的diseaseName top6含有'上气道梗阻'
    ${getRes}    智能诊断2.3    symptom=查体颈部局限性哮鸣音间断喘憋5年，咳嗽，与体位有关，有时可自行缓解,查体颈部局限性哮鸣音CXR(-),CT-气管新生物
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=14    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:6]}    上气道梗阻


市场部案例四
    [Documentation]    主诉:腹泻，腹痛，血便1周 结膜苍白.期望诊断结果返回的diseaseName含有'结肠癌'
    ${getRes}    智能诊断2.3    symptom=腹泻，腹痛，血便1周 结膜苍白
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=70    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:15]}    结肠癌


市场部案例五
    [Documentation]    主诉:腹泻，腹痛，血便1周 结膜苍白.期望诊断结果返回的diseaseName含有'甲状腺功能减退症'
    ${getRes}    智能诊断2.3    symptom=便秘1年余就诊，大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=28    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    甲状腺功能减退症




惠每医疗宣传手册案例一
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,出现'腰椎间盘突出症'.期望诊断结果返回的diseaseName top5含有'腰椎间盘突出症'
    ${getRes}    智能诊断2.3    symptom==腰痛、下肢疼痛、尿潴留
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    腰椎间盘突出症

惠每医疗宣传手册案例二
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,性别女.诊断结果返回的diseaseName不会出现'前列腺增生'
    ${getRes}    智能诊断2.3    symptom==腰痛、下肢疼痛、尿潴留
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Not Contain    ${aj[:5]}    前列腺增生




惠每医疗宣传手册案例三
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,性别女,4岁.诊断结果返回的diseaseName top5不会出现'前列腺增生'
    ${getRes}    智能诊断2.3    symptom==腰痛、下肢疼痛、尿潴留
    ...    previousHistory=    personalHistory=
    ...    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=4    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Not Contain    ${aj[:5]}    腰椎间盘突出症





    [Teardown]    Delete All Sessions

