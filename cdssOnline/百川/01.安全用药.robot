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

# 1.1 相互作用等级为'谨慎'的两种药,grade=2
#     [Documentation]    断言:"grade=2"
#     ${drugIds}    Create List    8126    5714
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['interactionList'][0]['grade']}    2



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
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    1


1.5 人群禁忌等级为'2不适用'的药,结果正确
    [Documentation]    断言:"grade=2"
    ${drugIds}    Create List    3517
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    2

1.6 人群禁忌等级为'3不推荐'的药,结果正确
    [Documentation]    断言:"grade=3"
    ${drugIds}    Create List    579
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    3

1.7 人群禁忌等级为'4不宜应用'的药,结果正确
    [Documentation]    断言:"grade=4"
    ${drugIds}    Create List    3850
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    4

1.8 人群禁忌等级为'5.忌用'的药,结果正确
    [Documentation]    断言:"grade=5"
    ${drugIds}    Create List    3700
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    5

1.9 人群禁忌等级为'6.避免使用'的药,结果正确
    [Documentation]    断言:"grade=6"
    ${drugIds}    Create List    2610
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=2    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    6

1.10 人群禁忌等级为'7.不建议'的药,结果正确
    [Documentation]    断言:"grade=7"
    ${drugIds}    Create List    3827
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    7

# 1.11 人群禁忌等级为'8.慎用'的药,结果正确
#     [Documentation]    断言:"grade=8"
#     ${drugIds}    Create List    139
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=12    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    8

1.12 人群禁忌等级为'9.权衡利弊'的药,结果正确
    [Documentation]    断言:"grade=9"
    ${drugIds}    Create List    4173
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    9


1.13 人群禁忌等级'症状'为妊娠的药,结果正确
    [Documentation]    断言:"crowd": "3个月以上妊娠妇女
    ${drugIds}    Create List    930
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=    ageType=    drugIds=${drugIds}    symptom=妊娠    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['crowd']}    3个月以上妊娠妇女

1.14 人群禁忌等级,'性别'为女的药+主诉=备孕,结果正确
    [Documentation]    断言:"crowd": "crowd=备孕妇女"
    ${drugIds}    Create List    8133
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=4381    ageType=天    drugIds=${drugIds}    symptom=备孕    confirmDiagnosis=
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

# 1.18 人群禁忌等级,ageType=天,'年龄1-43799',结果正确
#     [Documentation]    断言:"crowd": "description=不适用于妇女"
#     ${drugIds}    Create List    8280
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=43799    ageType=天    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    不适用于妇女


1.19 人群禁忌等级,年龄+症状,结果正确
    [Documentation]    断言:"crowd=41",description=3个月以上孕妇慎用"
    ${drugIds}    Create List    928
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=22    ageType=岁    drugIds=${drugIds}    symptom=妊娠    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    3个月以上孕妇慎用


# 1.20 人群禁忌等级,年龄+性别,结果正确
#     [Documentation]    断言:"crowd=49",description=40岁以上妇女禁用"
#     ${drugIds}    Create List    1940
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=14600    ageType=天    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    40岁以上妇女禁用


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


################################高血压
1.23 高血压用药重复,repetitionList_diseaseName显示为'高血压用药重复'
    [Documentation]    断言:"safeStatus=2"
    # ${drugIds}    Create List    2726    2391
    ${drugIds}    Create List    212    5773
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['repetitionList'][0]['diseaseName']}    高血压

1.23.5 高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    # ${drugIds}    Create List    2726    2391
    ${drugIds}    Create List    212    5773
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=50    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

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


################################审核结果不通过
1.25 相互作用等级为'禁用'的两种药,用药审核结果应为"不通过"
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    4498    8603
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1


1.26 人群禁忌等级为'禁用'的药,用药审核结果应为"不通过"
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    551
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1


1.27 人群禁忌&相互作用等级均为'禁用'的药,用药审核结果应为"不通过"
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    1255    3525    551
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1


1.28 相互作用grade=1,人群禁忌grade=2,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    4498    8603    3517
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1


1.29 相互作用grade=2,人群禁忌grade=1,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    8126    5714    551
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1

1.30 相互作用grade=2,人群禁忌grade=1,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    8126    5714    551
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1

1.31 相互作用grade=1,人群禁忌grade=0,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    4498    8603    581
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1

1.32 相互作用grade=0,人群禁忌grade=1,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    1360    742    551
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=5    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1

1.33 相互作用grade1,人群禁忌grade=0,有高血压用药重复的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    ${drugIds}    Create List    1255    3525    581    2726
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=月    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    1

################################待审核

# 1.34 相互作用等级grade为'2不适用'的药,用药审核结果为'待审核'
#     [Documentation]    断言:"safeStatus=2"
#     ${drugIds}    Create List    8126    5714
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.35 人群禁忌等级grade为'2不适用'的药+高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    3517    2726    2391
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=20    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.36 高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    # ${drugIds}    Create List    2726    2391
    ${drugIds}    Create List    212    5773
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=22    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

#######1.36.5 无高血压重复用药,相同分组,用药审核结果为'待审核'
#######    [Documentation]    断言:"safeStatus=2"
#######    ${drugIds}    Create List    2391    5647
#######    ${drugCommonNames}    Create List
#######    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#######    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

# 1.37 相互作用=2,高血压用药重复,用药审核结果为'待审核'
#     [Documentation]    断言:"safeStatus=2"
#     ${drugIds}    Create List    8126    5714    5323    5647
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=50    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.38 相互作用=2,人群禁忌=2,高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    8126    5714    3517    2726    2391
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=50    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.39 人群禁忌等级grade为'2不适用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    3517
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=月    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.40 人群禁忌等级grade为'3不推荐'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    579
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.41 人群禁忌等级grade为'4不宜应用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    3850
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.42 人群禁忌等级grade为'5.忌用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    3700
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.43 人群禁忌等级grade为'6.避免使用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    2610
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.44 人群禁忌等级grade为'7.不建议'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    3827
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

# 1.45 人群禁忌等级grade为'8.慎用'的药,用药审核结果为'待审核'
#     [Documentation]    断言:"safeStatus=2"
#     ${drugIds}    Create List    139
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=12    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2

1.46 人群禁忌等级grade为'9.权衡利弊'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    ${drugIds}    Create List    4173
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=3    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    2


################################审核通过
1.47 相互作用grade=3,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    ${drugIds}    Create List     8    9
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=22    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    3

1.48 人群禁忌grade=0,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    ${drugIds}    Create List    581
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    3


1.49 无高血压重复用药不同分组,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    ${drugIds}    Create List    2391    5660
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    3


1.50 相互作用=0,人群禁忌=0,无高血压重复用药,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    ${drugIds}    Create List    1360    742    2391    5660
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=    ageType=岁    drugIds=${drugIds}    symptom=    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['safeStatus']}    3


1.51 药物禁忌与confirmDiagnosis不匹配,不显示禁忌
    [Documentation]    断言:"confirmDiagnosis=痛经,['tabooList']为空"
    ${drugIds}    Create List    930
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=22    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=13895
    Should Be Equal As Strings    ${getRes['body']['tabooList']}    []


1.52 药物禁忌与confirmDiagnosis匹配,显示禁忌
    [Documentation]    断言:"['tabooList'][0]['description']"
    ${drugIds}    Create List    930
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=    ageType=    drugIds=${drugIds}    symptom=    confirmDiagnosis=14234
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    3个月以上孕妇慎用


1.53 药物禁忌与主诉匹配,显示禁忌
    [Documentation]    断言:"description=3个月以上孕妇慎用"
    ${drugIds}    Create List    930
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=    ageType=    drugIds=${drugIds}    symptom=怀孕    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    3个月以上孕妇慎用


1.54 药物禁忌与主诉不匹配,不显示禁忌
    [Documentation]    断言:"safeStatus=3,制霉菌素片"
    ${drugIds}    Create List    930
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=22    ageType=    drugIds=${drugIds}    symptom=痛经    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList']}    []

# 1.55 肾病审核结果
#     [Documentation]    断言:"主诉:严重肾功能损害（GFR=20ml/min）慎用 ,药品id16553 ,非洛地平缓释片(Ⅱ)"
#     ${drugIds}    Create List    16553
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=1    age=    ageType=    drugIds=${drugIds}    symptom=肌酐清除率=20ml/min    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    严重肾功能损害（GFR<30ml/min）慎用

1.56 通用名
    [Documentation]    添加drugCommonNames,断言:"3个月以上孕妇慎用"
    ${drugIds}    Create List
    ${drugCommonNames}    Create List    阿立哌唑片    盐酸氟西汀分散片    赖诺普利片    利福平片    赖诺普利胶囊
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=0    age=23    ageType=    drugIds=${drugIds}    symptom=妊娠4个月    confirmDiagnosis=1,3,4
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['description']}    3个月以上孕妇慎用

1.57 新增用药 症状:Roemhelo综合症 药品:8054 grade=1
    [Documentation]    断言:"grade=2"
    ${drugIds}    Create List    8054
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=Roemheld综合症    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    1

1.58 新增用药 症状:咯血 药品:7421 grade=1
    [Documentation]    断言:"grade=2"
    ${drugIds}    Create List    8054
    ${drugCommonNames}    Create List
    ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=肾功能损害（肌酐清除率<25ml/分）    confirmDiagnosis=
    Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    1

# 1.59 新增用药 症状:肌酐清除率<25ml/分 药品:8054 grade=1
#     [Documentation]    断言:"grade=2"
#     ${drugIds}    Create List    8054
#     ${drugCommonNames}    Create List
#     ${getRes}    安全用药    drugCommonNames=${drugCommonNames}    gender=    age=    ageType=    drugIds=${drugIds}    symptom=肌酐清除率24ml/分    confirmDiagnosis=
#     Should Be Equal As Strings    ${getRes['body']['tabooList'][0]['grade']}    1

