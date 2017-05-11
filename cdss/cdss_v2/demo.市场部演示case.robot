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
    [Documentation]    断言:"diseaseName=急性胰腺炎"
    智能诊断top5    ['diseaseName']    急性胰腺炎    symptom=突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=1    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=38    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=

案例二
    [Documentation]    断言:"diseaseName="主动脉夹层"
    智能诊断top5    ['diseaseName']    主动脉夹层    symptom=妊娠26周，先兆子痫住产科。凌晨1点突感胸痛    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=100
    ...    highBldPress=160    examInfo=    heartRate=    age=35    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=


案例三
    [Documentation]    断言:"diseaseName="上气道梗阻"
    智能诊断top5    ['diseaseName']    上气道梗阻    symptom=查体颈部局限性哮鸣音间断喘憋5年，咳嗽，与体位有关，有时可自行缓解    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=14    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=

案例四
    [Documentation]    断言:"diseaseName=结肠癌"
    智能诊断前top15    ['diseaseName']    结肠癌    symptom=腹泻，腹痛，血便1周 结膜苍白    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=70    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=

案例五
    [Documentation]    断言:"diseaseName="甲状腺功能减退症"
    智能诊断top5    ['diseaseName']    甲状腺功能减退症    symptom=便秘1年余就诊，大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=
    ...    highBldPress=    examInfo=    heartRate=    age=28    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=



# 惠美医疗案例:主诉:腰痛、下肢疼痛、尿潴留
#     [Documentation]    断言:"diseaseName=腰椎间盘突出症"
#     智能诊断top5    ['diseaseName']    腰椎间盘突出症1    symptom=腰痛、下肢疼痛、尿潴留    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=
#     ...    highBldPress=    examInfo=    heartRate=    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=


惠美医疗案例:主诉:腰痛、下肢疼痛、尿潴留,出现'腰椎间盘突出症'
    [Documentation]    断言:"diseaseName top5 腰椎间盘突出症"
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://apollo.huimeionline.com    ${dict}
    ${data}    Create Dictionary    symptom=腰痛、下肢疼痛、尿潴留    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=38    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap[]=    presentHistory=
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $responsedata['body']['suspectedDiseases']]
    Should Contain    ${aj[:5]}    腰椎间盘突出症
    # Should Not Contain    ${aj[:5]}    前列腺增生
    Delete All Sessions



惠美医疗案例:主诉:腰痛、下肢疼痛、尿潴留,性别女,不出现前列腺增生
    [Documentation]    断言:"diseaseName top5 不出现前列腺增生"
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://apollo.huimeionline.com    ${dict}
    ${data}    Create Dictionary    symptom=腰痛、下肢疼痛、尿潴留    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=38    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap[]=    presentHistory=
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $responsedata['body']['suspectedDiseases']]
    Should Not Contain    ${aj[:5]}    前列腺增生
    Delete All Sessions

惠美医疗案例:主诉:腰痛、下肢疼痛、尿潴留,4岁,不出现'腰椎间盘突出症'
    [Documentation]    断言:"diseaseName top5 腰椎间盘突出症"
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://apollo.huimeionline.com    ${dict}
    ${data}    Create Dictionary    symptom=腰痛、下肢疼痛、尿潴留    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=4    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap[]=    presentHistory=
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $responsedata['body']['suspectedDiseases']]
    Should Not Contain    ${aj[:5]}    腰椎间盘突出症
    Delete All Sessions


