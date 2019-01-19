*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明    # userGuid String 是 患者ID（接入放定义）    # doctorGuid String 是 医生ID（接入放定义）    # serialNumber String 是 业务流水ID（接入方定义）    # hospitalGuid String 是 医院ID（惠每分配）    # gender Integer 否 性别1男,0女
# age double 否 年龄    # ageType String 否 岁、月、天    # bodyTempr Double 否 体温    # weight Double 否 体重    # heartRate Integer 否 心率    # lowBldPress Integer 否 收缩压    # highBldPress Integer 否 舒张压
# examInfo String 否 检查    # previousHistory String 否 既往史    # personalHistory String 否 个人史    # allergyHistory String 否 过敏史    # familyHistory String 否 家族史    # symptom String 否 主诉    # confirmDiagnosis String 否 已确定诊断

*** Test Cases ***
1.市场部案例一
    [Documentation]    主诉:突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时.期望诊断结果返回的diseaseName top5含有'肠扭转'
    ${getRes}    智能诊断2.3    symptom=突发上腹部疼痛，阵发性加剧，伴恶心、呕吐10小时    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=38    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][1]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:5]}    肠扭转
