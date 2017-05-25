*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           ExcelLibrary    # 字段名 类型 是否必须 说明    # userGuid String 是 患者ID（接入放定义）    # doctorGuid String 是 医生ID（接入放定义）    # serialNumber String 是 业务流水ID（接入方定义）    # hospitalGuid String 是 医院ID（惠每分配）    # gender Integer 否 性别1男,0女
...               # age double 否 年龄    # ageType String 否 岁、月、天    # bodyTempr Double 否 体温    # weight Double 否 体重    # heartRate Integer 否 心率    # lowBldPress Integer 否 收缩压    # highBldPress Integer 否 舒张压
...               # examInfo String 否 检查    # previousHistory String 否 既往史    # personalHistory String 否 个人史    # allergyHistory String 否 过敏史    # familyHistory String 否 家族史    # symptom String 否 主诉    # confirmDiagnosis String 否 已确定诊断

*** Test Cases ***
# 2.1 只填写主诉
#     [Documentation]    断言:"存在急性弥漫性腹膜炎"
#     open Excel    /Users/yinbo/Downloads/新密_病历_0509.xls
#     # ${symptom}    Read Cell Data By Name    Sheet1    A1
#     ${table}    set variable    1    test
#     : FOR    ${i}    IN    ${table}
#     ${symptom}    Read Cell Data By Name    Sheet1    ${table}
#     智能诊断    ['diseaseName']    急性弥漫性腹膜炎    symptom=${symptom}    previousHistory=    personalHistory=    allergyHistory=
#     ...    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     # ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]
