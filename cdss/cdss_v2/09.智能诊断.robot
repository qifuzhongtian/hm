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

2.1智能诊断接口_只填症状
    [Documentation]    断言error:""
    智能诊断    0    symptom=发热    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
    ...    confirmDiagnosis=    confirmDiagnosisMap=
    # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]



# 2.2智能诊断接口_只填性别
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=1    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]



# 2.3智能诊断接口_只填症状
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]


# 2.4智能诊断接口_只填既往史
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=头疼
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.5智能诊断接口_只填个人史
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=鼻塞    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.6智能诊断接口_只填过敏史
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=流涕    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.7智能诊断接口_只填家族史
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=咳嗽    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.8智能诊断接口_只填体重
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=355    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.9智能诊断接口_心率正常
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=66    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]


# 2.10智能诊断接口_只填收缩压
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=100    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]

# 2.11智能诊断接口_只填舒张压
#     [Documentation]    断言error:""
#     智能诊断    0    symptom=发热    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=60    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]




# 2.12智能诊断接口_体格检查_体温>=37.5
#     [Documentation]    断言error:"断言急性上呼吸道感染id"
#     智能诊断_数字指标    34051    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=37.5    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]



# 2.13智能诊断接口_体格检查_体温>39
#     [Documentation]    断言error:"胆石病id"
#     智能诊断_数字指标    11    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=39.1    lowBldPress=    highBldPress=    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]



# 2.14智能诊断接口_体格检查_心率<60,心率过慢
#     [Documentation]    断言error:""
#     智能诊断_数字指标    7977    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=59    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]




# 2.15智能诊断接口_体格检查_心率>100,心率过快
#     [Documentation]    断言error:""
#     智能诊断_数字指标    7977    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=    heartRate=101    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]




# 2.16智能诊断接口_体格检查_收缩压>=140/90,高血压
#     [Documentation]    断言error:"高血压id"
#     智能诊断_数字指标    40031    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=90    highBldPress=140    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]




# 2.17智能诊断接口_体格检查_收缩压<90/60,低血压
#     [Documentation]    断言error:""
#     智能诊断_数字指标    7977    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=59    highBldPress=89    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]




# 2.智能诊断接口_体格检查_收缩压<90/60,低血压
#     [Documentation]    断言error:""
#     智能诊断_数字指标1    responsedata=['body']['suspectedDiseases'][0]['id']    7977    symptom=    previousHistory=
#     ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=59    highBldPress=89    examInfo=    heartRate=    age=    ageType=
#     ...    confirmDiagnosis=    confirmDiagnosisMap=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]


