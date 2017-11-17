*** Settings ***
Resource          ../cdss接口关键字.robot
# Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型  是否必须    说明
# gender  Integer     性别1.男，0.女
# age Double      年龄
# ageType String      岁/月/天/
# drugIds List    是   药品ID集合
# symptom String      患者主诉

*** Variables ***

*** Test Cases ***

1.1 相互作用等级为'谨慎'的两种药,grade=2
    [Documentation]    断言:"grade=2"
    ${drugIds}    Create List    8126    5714
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['interactionList'][0]['grade']}    2


1.2 相互作用等级为'禁用'的两种药,grade=1
    [Documentation]    断言:"grade=1"
    ${drugIds}    Create List    4498    8603

    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['interactionList'][0]['grade']}    1


1.3 相互作用等级为'可以合用'的两种药,interactionList为空
    [Documentation]    断言:"interactionList[]=空"
    ${drugIds}    Create List     8    9
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['interactionList']}    []


1.4 人群禁忌等级为'1禁用'的药,结果正确
    [Documentation]    断言:"grade=1"
    ${drugIds}    Create List    551
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    1


1.5 人群禁忌等级为'2不适用'的药,结果正确
    [Documentation]    断言:"grade=2"
    ${drugIds}    Create List    3517
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    2

1.6 人群禁忌等级为'3不推荐'的药,结果正确
    [Documentation]    断言:"grade=3"
    ${drugIds}    Create List    579
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    3

1.7 人群禁忌等级为'4不宜应用'的药,结果正确
    [Documentation]    断言:"grade=4"
    ${drugIds}    Create List    3850
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    4

1.8 人群禁忌等级为'5.忌用'的药,结果正确
    [Documentation]    断言:"grade=5"
    ${drugIds}    Create List    3700
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    5

1.9 人群禁忌等级为'6.避免使用'的药,结果正确
    [Documentation]    断言:"grade=6"
    ${drugIds}    Create List    2610
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    6

1.10 人群禁忌等级为'7.不建议'的药,结果正确
    [Documentation]    断言:"grade=7"
    ${drugIds}    Create List    3827
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    7

1.11 人群禁忌等级为'8.慎用'的药,结果正确
    [Documentation]    断言:"grade=8"
    ${drugIds}    Create List    139
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    8

1.12 人群禁忌等级为'9.权衡利弊'的药,结果正确
    [Documentation]    断言:"grade=9"
    ${drugIds}    Create List    4173
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    9


1.13 人群禁忌等级'症状'为妊娠的药,结果正确
    [Documentation]    断言:"crowd": "3个月以上妊娠妇女
    ${drugIds}    Create List    930
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=妊娠    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['crowd']}    3个月以上妊娠妇女

1.14 人群禁忌等级,'性别'为女的药+主诉=备孕,结果正确
    [Documentation]    断言:"crowd": "crowd=备孕妇女"
    ${drugIds}    Create List    8133
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=4381    ageType=天    drugIds=${drugIds}    symptom=备孕    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['crowd']}    备孕妇女

1.15 人群禁忌等级,ageType=岁,'年龄'=10岁,结果正确
    [Documentation]    断言:"crowd": "crowd=10岁以下儿童"
    ${drugIds}    Create List    579
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=10    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['crowd']}    10岁以下儿童

1.16 人群禁忌等级,ageType=月,'年龄mix_day'=30,结果正确
    [Documentation]    断言:"crowd": "description=1个月以内的新生儿禁用"
    ${drugIds}    Create List    1458
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=30    ageType=天    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    1个月以内的新生儿禁用

1.17 人群禁忌等级,ageType=月,'年龄min_day'=4380,结果正确
    [Documentation]    断言:"crowd": "min_day最小值 ,description=12岁以上儿童慎用"
    ${drugIds}    Create List    139
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=4382    ageType=天    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    12岁以上儿童慎用

1.18 人群禁忌等级,ageType=天,'年龄1-43799',结果正确
    [Documentation]    断言:"crowd": "description=不适用于妇女"
    ${drugIds}    Create List    8280
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=43799    ageType=天    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    不适用于妇女


1.19 人群禁忌等级,年龄+症状,结果正确
    [Documentation]    断言:"crowd=41",description=3个月以上孕妇慎用"
    ${drugIds}    Create List    928
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=22    ageType=岁    drugIds=${drugIds}    symptom=妊娠    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    3个月以上孕妇慎用


1.20 人群禁忌等级,年龄+性别,结果正确
    [Documentation]    断言:"crowd=49",description=40岁以上妇女禁用"
    ${drugIds}    Create List    1940
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=14600    ageType=天    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    40岁以上妇女禁用


1.21 人群禁忌等级,年龄+性别+病症,结果正确
    [Documentation]    断言:"description=未婚妇女不宜使用,crowd=93""
    ${drugIds}    Create List    2459
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=43800    ageType=天    drugIds=${drugIds}    symptom=未婚    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    未婚妇女不宜使用

1.22 人群禁忌等级,用药没有人群禁忌,结果正确,断言 tabooList[]
    [Documentation]    断言:",tabooList[]=空"
    ${drugIds}    Create List    581
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=2459    ageType=天    drugIds=${drugIds}    symptom=未婚    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList']}    []


# ################################高血压
# 1.23 高血压用药重复,repetitionList_diseaseName显示为'高血压用药重复'
#     [Documentation]    断言:"safeStatus=2"
#     ${drugIds}    Create List    2726    2391
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['repetitionList'][0]['diseaseName']}    高血压

# 1.23.5 高血压用药重复,用药审核结果为'待审核'
#     [Documentation]    断言:"safeStatus=2"
#     ${drugIds}    Create List    2726    2391
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=50    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.23.6 无高血压用药重复,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    ${drugIds}    Create List    5647
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    3


1.24 高血压用药不重复,等级grade为'合理'的药,用药审核结果为'审核通过'
    [Documentation]    断言:"safeStatus=3"
    ${drugIds}    Create List    5647
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=55    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['repetitionList']}    []


