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

# #######女  28  岁 因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗未见好转 甲状腺功能减退症
# 市场部全科版演示case-2行
#     [Documentation]    主诉:女 28  岁 因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗未见好转 甲状腺功能减退症
#     ${getRes}    智能诊断4.0
#     ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
#     ...    symptom=因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗未见好转
#     ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
#     ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
#     ...    heartRate=    age=28    ageType=岁    confirmDiagnosis=
#     ...    confirmDiagnosisMap={"icdCode": "","key": "","value": "荨麻疹"}
#     ...    presentHistory=
#     ...    hasDetail=    symptomClickDiseaseId=
#     #疑似诊断
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
#     #治疗方案
#     # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
#     #评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
#     #检查解读
#     # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]
#     Should Contain    ${aj[:10]}    甲状腺功能减退症3


###低血钠,血清钠146mmol/L-低钠血症
#粘连性中耳炎 ,编辑中
#


1111
    [Documentation]
    ${getRes}    智能诊断4.0
    ...    userGuid=    doctorGuid=    serialNumber=    hospitalGuid=
    ...    symptom=血钾低,血钾高
    ...    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=
    ...    confirmDiagnosisMap={"icdCode": "","key": "","value": ""}
    ...    presentHistory=
    ...    hasDetail=    symptomClickDiseaseId=
    #疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['suspectedDiseases']]
    #检查解读
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['examResponseList']]
    #治疗方案
    # ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['regimenInfo']['itemInfoResponseList']]
    #评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['maysonInfo']['illnessAssessList']]
    #检查解读
    # ${aj}    Evaluate    [aj['diagnosticPoint'] for aj in $getRes['body']['maysonInfo']['examinationInterpreList']]
    Should Contain    ${aj}    甲状腺功能减退症3222222



