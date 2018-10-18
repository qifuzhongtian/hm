*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明    # userGuid String 是 患者ID（接入放定义）    # doctorGuid String 是 医生ID（接入放定义）    # serialNumber String 是 业务流水ID（接入方定义）    # hospitalGuid String 是 医院ID（惠每分配）    # gender Integer 否 性别1男,0女
# age double 否 年龄    # ageType String 否 岁、月、天    # bodyTempr Double 否 体温    # weight Double 否 体重    # heartRate Integer 否 心率    # lowBldPress Integer 否 收缩压    # highBldPress Integer 否 舒张压
# examInfo String 否 检查    # previousHistory String 否 既往史    # personalHistory String 否 个人史    # allergyHistory String 否 过敏史    # familyHistory String 否 家族史    # symptom String 否 主诉    # confirmDiagnosis String 否 已确定诊断

*** Test Cases ***
市场部全科版演示case-2行
    [Documentation]    断言:"存在急性弥漫性腹膜炎"
    智能诊断    ['diseaseName']    甲状腺功能减退症    symptom=因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗未见好转    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.2 体格检查_体温>=37.5
#     [Documentation]    断言:"急性上呼吸道感染"
#     智能诊断    ['diseaseName']    急性上呼吸道感染    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=37.5    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3b'b,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.3 体格检查_体温>39
#     [Documentation]    断言:"diseaseName=败血症"
#     智能诊断    ['diseaseName']    败血症    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=39.1    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2. 4体格检查_心率<60,心率过慢
#     [Documentation]    断言:"diseaseName=心动过缓"
#     智能诊断    ['diseaseName']    心动过缓    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=44    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.5 体格检查_心率>100,心率过快
#     [Documentation]    断言:"diseaseName=动过速"
#     智能诊断    ['diseaseName']    心动过速    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=101    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.6 体格检查_收缩压>=140/90,高血压
#     [Documentation]    断言:"diseaseName=高血压"
#     智能诊断    ['diseaseName']    高血压    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=90    highBldPress=140
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.7 体格检查_收缩压<90/60,低血压
#     [Documentation]    断言:"diseaseName=败血症"
#     智能诊断    ['diseaseName']    败血症    symptom=    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=59    highBldPress=89
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=

