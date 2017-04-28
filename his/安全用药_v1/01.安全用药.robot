*** Settings ***
Resource          ../安全用药接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# gender  Integer     性别1.男，0.女
# age Double      年龄
# ageType String      岁/月/天/
# drugIds List    是   药品ID集合
# symptom String      患者主诉

*** Variables ***
#drugIds 相互作用的两种药,grade=0 ,element=966,524
@{drugIds_interactionList_grade0}        1360    742
#drugIds 相互作用的两种药,grade=2
@{drugIds_interactionList_grade1}        8126    5714
#drugIds 相互作用的两种药,grade=1
@{drugIds_interactionList_grade2}        4498    8603
#drugIds 可以合用的两种药,grade=3
@{drugIds_interactionList_grade3}        8    9
#drugIds 人群禁忌'没有禁忌'的药,grade=0
@{drugIds_tabooList_grade0}        581
#drugIds 人群禁忌'禁用'的两种药,grade=1
@{drugIds_tabooList_grade1}        551
#drugIds 人群禁忌的两种药,grade=2
@{drugIds_tabooList_grade2}        3517
#drugIds 人群禁忌的两种药,grade=3
@{drugIds_tabooList_grade3}        579
#drugIds 人群禁忌的两种药,grade=4
@{drugIds_tabooList_grade4}        3850
#drugIds 人群禁忌的两种药,grade=5
@{drugIds_tabooList_grade5}        3700
#drugIds 人群禁忌的两种药,grade=6
@{drugIds_tabooList_grade6}        2610
#drugIds 人群禁忌的两种药,grade=7
@{drugIds_tabooList_grade7}        3827
#drugIds 人群禁忌的两种药,grade=8
@{drugIds_tabooList_grade8}        139
#drugIds 人群禁忌的两种药,grade=9
@{drugIds_tabooList_grade9}        4173
#drugIds 人群禁忌的两种药,grade=null
@{drugIds_tabooList_grade10}        137
#drugIds 孕妇慎用crowd_id=41
@{drugIds_tabooList_symptom1}        930
#drugIds 性别为女
@{drugIds_tabooList_gender1}        8133
#drugIds ageType=年,age=10
@{drugIds_tabooList_age1}        579
#drugIds ageType=月,age=30
@{drugIds_tabooList_age2}        1458
#drugIds ageType=月,age=4380-6570
@{drugIds_tabooList_age3}        139
#drugIds ageType=月,age=
@{drugIds_tabooList_age4}        8280
#drugIds ageType=月,age=
@{drugIds_tabooList_age5}        928
#drugIds ageType=月,age=
@{drugIds_tabooList_age6}        1940
#drugIds ageType=月,age=2459
@{drugIds_tabooList_age7}        2459
#高血压用药重复
@{drugIds_repetitionList1}        2726    2391
#高血压用药重复,只有一种药
@{drugIds_repetitionList2}        5647
#不同分组,高血压用药不重复,2391=1,5660=2
@{drugIds_repetitionList0}        2391    5660
#相同分组,高血压用药不重复,2391=1,5660=2
@{drugIds_repetitionList3}        2391    5647
#相互作用grade=1,人群禁忌grade=1,均不通过 drugIds_interactionList_grade2 drugIds_tabooList_grade1
@{drugIds_interactionList_tabooList_grade1}   1255    3525    551
##相互作用=0,人群禁忌=1,不通过
@{drugIds_interactionList_grade0_tabooList_grade1}        1360    742    551
##相互作用grade=1,人群禁忌grade=2-9
@{drugIds_interactionList_grade1_tabooList_grade2}        4498    8603    3517
##相互作用=2,人群禁忌=1
@{drugIds_interactionList_grade2_tabooList_grade1}        8126    5714    551
##相互作用=1,人群禁忌=0
@{drugIds_interactionList_grade1_tabooList_grade0}        4498    8603    581
#相互作用=1,人群禁忌=0,有高血压
@{drugIds_interactionList_grade1_tabooList_grade0_repetitionList1}        1255    3525    581    2726    2391
#人群禁忌-2,高血压用药重复
@{drugIds_tabooList_grade2_repetitionList1}        3517    2726    2391
#相互作用=1,高血压用药重复
@{drugIds_interactionList_grade1_repetitionList1}        8126    5714    2726    2391
#相互作用=1,人群禁忌=2,高血压用药重复
@{drugIds_interactionList_grade1_tabooList2_repetitionList1}        8126    5714    3517    2726    2391
#三无,通过
@{drugIds_interactionList_grade0_tabooList_grade0_repetitionList2}        1360    742    2391    5660
#drugIds 相互作用的两种药,grade=1 ,#高血压用药重复
@{drugIds_interactionList_grade2_drugIds_repetitionList1}        8126    5714    5323    5647
#drugIds 相互作用的两种药,grade=1 ,#高血压用药重复
@{drugIds_interactionList_symptom}        930


*** Test Cases ***
1.1相互作用等级为'谨慎'的两种药,grade=2
    [Documentation]    断言:"grade=2"
    安全用药    ['body']['interactionList'][0]['grade']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade1}    symptom=    confirmDiagnosis=
#
1.2相互作用等级为'禁用'的两种药,grade=1
    [Documentation]    断言:"grade=1"
    安全用药    ['body']['interactionList'][0]['grade']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade2}    symptom=    confirmDiagnosis=

1.3相互作用等级为'可以合用'的两种药,interactionList为空
    [Documentation]    断言:"interactionList[]=空"
    安全用药    ['body']['interactionList']    []
    ...    gender=    age=55    ageType=岁    drugIds=${drugIds_interactionList_grade3}    symptom=    confirmDiagnosis=

1.4人群禁忌等级为'1禁用'的药,结果正确
    [Documentation]    断言:"grade=1"
    安全用药    ['body']['tabooList'][0]['grade']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade1}    symptom=    confirmDiagnosis=

1.5人群禁忌等级为'2不适用'的药,结果正确
    [Documentation]    断言:"grade=2"
    安全用药    ['body']['tabooList'][0]['grade']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade2}    symptom=    confirmDiagnosis=

1.6人群禁忌等级为'3不推荐'的药,结果正确
    [Documentation]    断言:"grade=3"
    安全用药    ['body']['tabooList'][0]['grade']    3
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade3}    symptom=    confirmDiagnosis=

1.7人群禁忌等级为'4不宜应用'的药,结果正确
    [Documentation]    断言:"grade=4"
    安全用药    ['body']['tabooList'][0]['grade']    4
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade4}    symptom=    confirmDiagnosis=

1.8人群禁忌等级为'5.忌用'的药,结果正确
    [Documentation]    断言:"grade=5"
    安全用药    ['body']['tabooList'][0]['grade']    5
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade5}    symptom=    confirmDiagnosis=

1.9人群禁忌等级为'6.避免使用'的药,结果正确
    [Documentation]    断言:"grade=6"
    安全用药    ['body']['tabooList'][0]['grade']    6
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade6}    symptom=    confirmDiagnosis=

1.10人群禁忌等级为'7.不建议'的药,结果正确
    [Documentation]    断言:"grade=7"
    安全用药    ['body']['tabooList'][0]['grade']    7
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade7}    symptom=    confirmDiagnosis=

1.11人群禁忌等级为'8.慎用'的药,结果正确
    [Documentation]    断言:"grade=8"
    安全用药    ['body']['tabooList'][0]['grade']    8
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade8}    symptom=    confirmDiagnosis=

1.12人群禁忌等级为'9.权衡利弊'的药,结果正确
    [Documentation]    断言:"grade=9"
    安全用药    ['body']['tabooList'][0]['grade']    9
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade9}    symptom=    confirmDiagnosis=


1.13人群禁忌等级'症状'为妊娠的药,结果正确
    [Documentation]    断言:"crowd": "3个月以上妊娠妇女
    安全用药    ['body']['tabooList'][0]['crowd']    3个月以上妊娠妇女
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_symptom1}    symptom=妊娠    confirmDiagnosis=

1.14人群禁忌等级,'性别'为女的药+主诉=备孕,结果正确
    [Documentation]    断言:"crowd": "crowd=备孕妇女"
    安全用药    ['body']['tabooList'][0]['crowd']    备孕妇女
    ...    gender=0    age=4381    ageType=天    drugIds=${drugIds_tabooList_gender1}    symptom=备孕    confirmDiagnosis=

1.15人群禁忌等级,ageType=岁,'年龄'=10岁,结果正确
    [Documentation]    断言:"crowd": "crowd=10岁以下儿童"
    安全用药    ['body']['tabooList'][0]['crowd']    10岁以下儿童
    ...    gender=    age=10    ageType=岁    drugIds=${drugIds_tabooList_age1}    symptom=    confirmDiagnosis=

1.16人群禁忌等级,ageType=月,'年龄mix_day'=30,结果正确
    [Documentation]    断言:"crowd": "description=1个月以内的新生儿禁用"
    安全用药    ['body']['tabooList'][0]['description']    1个月以内的新生儿禁用
    ...    gender=    age=30    ageType=天    drugIds=${drugIds_tabooList_age2}    symptom=    confirmDiagnosis=

1.17人群禁忌等级,ageType=月,'年龄min_day'=4380,结果正确
    [Documentation]    断言:"crowd": "min_day最小值 ,description=12岁以上儿童慎用"
    安全用药    ['body']['tabooList'][0]['description']    12岁以上儿童慎用
    ...    gender=    age=4382    ageType=天    drugIds=${drugIds_tabooList_age3}    symptom=    confirmDiagnosis=

1.18人群禁忌等级,ageType=天,'年龄1-43799',结果正确
    [Documentation]    断言:"crowd": "description=不适用于妇女"
    安全用药    ['body']['tabooList'][0]['description']    不适用于妇女
    ...    gender=    age=43799    ageType=天     drugIds=${drugIds_tabooList_age4}    symptom=    confirmDiagnosis=


1.19人群禁忌等级,年龄+症状,结果正确
    [Documentation]    断言:"crowd=41",description=3个月以上孕妇慎用"
    安全用药    ['body']['tabooList'][0]['description']    3个月以上孕妇慎用
    ...    gender=    age=91    ageType=天     drugIds=${drugIds_tabooList_age5}    symptom=妊娠    confirmDiagnosis=


1.20人群禁忌等级,年龄+性别,结果正确
    [Documentation]    断言:"crowd=49",description=40岁以上妇女禁用"
    安全用药    ['body']['tabooList'][0]['description']    40岁以上妇女禁用
    ...    gender=0    age=14600    ageType=天     drugIds=${drugIds_tabooList_age6}    symptom=    confirmDiagnosis=


1.21人群禁忌等级,年龄+性别+病症,结果正确
    [Documentation]    断言:"description=未婚妇女不宜使用,crowd=93""
    安全用药    ['body']['tabooList'][0]['description']    未婚妇女不宜使用
    ...    gender=0    age=43800    ageType=天     drugIds=${drugIds_tabooList_age7}    symptom=未婚    confirmDiagnosis=

1.22人群禁忌等级,用药没有人群禁忌,结果正确,断言 tabooList[]
    [Documentation]    断言:",tabooList[]=空"
    安全用药    ['body']['tabooList']    []
    ...    gender=0    age=2459    ageType=天     drugIds=${drugIds_tabooList_grade0}    symptom=未婚    confirmDiagnosis=


################################高血压
1.23高血压用药重复,repetitionList_diseaseName显示为'高血压用药重复'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['repetitionList'][0]['diseaseName']    高血压
    ...    gender=1    age=    ageType=    drugIds=${drugIds_repetitionList1}    symptom=    confirmDiagnosis=

1.23.5高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=1    age=50    ageType=岁    drugIds=${drugIds_repetitionList1}    symptom=    confirmDiagnosis=

1.23.6无高血压用药重复,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['safeStatus']    3
    ...    gender=1    age=    ageType=    drugIds=${drugIds_repetitionList2}    symptom=    confirmDiagnosis=



1.24高血压用药不重复,等级grade为'合理'的药,用药审核结果为'审核通过'
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['repetitionList']    []
    ...    gender=    age=55    ageType=岁    drugIds=${drugIds_repetitionList2}    symptom=    confirmDiagnosis=


################################审核结果不通过
1.25 相互作用等级为'禁用'的两种药,用药审核结果应为"不通过"
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade2}    symptom=    confirmDiagnosis=


1.26 人群禁忌等级为'禁用'的药,用药审核结果应为"不通过"
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade1}    symptom=    confirmDiagnosis=


1.27 人群禁忌&相互作用等级均为'禁用'的药,用药审核结果应为"不通过"
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_tabooList_grade1}    symptom=    confirmDiagnosis=


1.28 相互作用grade=1,人群禁忌grade=2,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade1_tabooList_grade2}    symptom=    confirmDiagnosis=


1.29 相互作用grade=2,人群禁忌grade=1,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade2_tabooList_grade1}    symptom=    confirmDiagnosis=

1.30 相互作用grade=2,人群禁忌grade=1,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade2_tabooList_grade1}    symptom=    confirmDiagnosis=

1.31 相互作用grade=1,人群禁忌grade=0,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade1_tabooList_grade0}    symptom=    confirmDiagnosis=

1.32 相互作用grade=0,人群禁忌grade=1,的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade0_tabooList_grade1}    symptom=    confirmDiagnosis=

1.33 相互作用grade1,人群禁忌grade=0,有高血压用药重复的药,用药审核结果为'不通过'
    [Documentation]    断言:"safeStatus=1"
    安全用药    ['body']['safeStatus']    1
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade1_tabooList_grade0_repetitionList1}    symptom=    confirmDiagnosis=

################################待审核

1.34 相互作用等级grade为'2不适用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade1}    symptom=    confirmDiagnosis=

1.35 人群禁忌等级grade为'2不适用'的药+高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=20    ageType=岁    drugIds=${drugIds_tabooList_grade2_repetitionList1}    symptom=    confirmDiagnosis=

1.36 高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=22    ageType=岁    drugIds=${drugIds_repetitionList1}    symptom=    confirmDiagnosis=

1.36.5 无高血压重复用药,相同分组,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_repetitionList3}    symptom=    confirmDiagnosis=


1.37 相互作用=2,高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=1    age=50    ageType=岁    drugIds=${drugIds_interactionList_grade2_drugIds_repetitionList1}    symptom=    confirmDiagnosis=

1.38 相互作用=2,人群禁忌=2,高血压用药重复,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=0    age=50    ageType=岁    drugIds=${drugIds_interactionList_grade1_tabooList2_repetitionList1}    symptom=    confirmDiagnosis=

1.39 人群禁忌等级grade为'2不适用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade2}    symptom=    confirmDiagnosis=

1.40 人群禁忌等级grade为'3不推荐'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade3}    symptom=    confirmDiagnosis=


1.41 人群禁忌等级grade为'4不宜应用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade4}    symptom=    confirmDiagnosis=

1.42 人群禁忌等级grade为'5.忌用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade5}    symptom=    confirmDiagnosis=

1.43 人群禁忌等级grade为'6.避免使用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade6}    symptom=    confirmDiagnosis=

1.44 人群禁忌等级grade为'7.不建议'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade7}    symptom=    confirmDiagnosis=

1.45 人群禁忌等级grade为'8.慎用'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade8}    symptom=    confirmDiagnosis=

1.46 人群禁忌等级grade为'9.权衡利弊'的药,用药审核结果为'待审核'
    [Documentation]    断言:"safeStatus=2"
    安全用药    ['body']['safeStatus']    2
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade9}    symptom=    confirmDiagnosis=


################################审核通过
1.47 相互作用grade=3,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['safeStatus']    3
    ...    gender=    age=22    ageType=岁    drugIds=${drugIds_interactionList_grade3}    symptom=    confirmDiagnosis=

1.48 人群禁忌grade=0,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['safeStatus']    3
    ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}    symptom=    confirmDiagnosis=


1.49 无高血压重复用药不同分组,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['safeStatus']    3
    ...    gender=1    age=    ageType=    drugIds=${drugIds_repetitionList0}    symptom=    confirmDiagnosis=


1.50 相互作用=0,人群禁忌=0,无高血压重复用药,用药审核结果为'通过'
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['safeStatus']    3
    ...    gender=1    age=    ageType=岁    drugIds=${drugIds_interactionList_grade0_tabooList_grade0_repetitionList2}    symptom=    confirmDiagnosis=


1.51 药物禁忌与confirmDiagnosis不匹配,不显示禁忌
    [Documentation]    断言:"['tabooList']为空"
    安全用药    ['body']['tabooList']    []
    ...    gender=0    age=    ageType=    drugIds=${drugIds_interactionList_symptom}    symptom=    confirmDiagnosis=13895



1.52 药物禁忌与confirmDiagnosis匹配,显示禁忌
    [Documentation]    断言:"['tabooList'][0]['description']"
    安全用药    ['body']['tabooList'][0]['description']    3个月以上孕妇慎用
    ...    gender=0    age=    ageType=    drugIds=${drugIds_interactionList_symptom}    symptom=    confirmDiagnosis=14234



1.53 药物禁忌与主诉匹配,显示禁忌
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['tabooList'][0]['description']    3个月以上孕妇慎用
    ...    gender=0    age=    ageType=    drugIds=${drugIds_interactionList_symptom}    symptom=怀孕    confirmDiagnosis=


1.54 药物禁忌与主诉不匹配,不显示禁忌
    [Documentation]    断言:"safeStatus=3"
    安全用药    ['body']['tabooList']    []
    ...    gender=0    age=    ageType=    drugIds=${drugIds_interactionList_symptom}    symptom=痛经    confirmDiagnosis=






# 1.51安全用药,填写药品id,通过
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.52安全用药,填写药品id,不通过
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.53安全用药,填写药品id,待审核
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.54安全用药,不填写药品id提交失败
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.55安全用药,填写性别提交成功
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.56安全用药,填写年龄:岁,提交成功
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=岁    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.57安全用药,填写年龄:月,提交成功
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=月    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.58安全用药,填写年龄:天,提交成功
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=天    drugIds=${drugIds_tabooList_grade0}   symptom=    confirmDiagnosis=
# 1.59安全用药,填写患者主诉提交成功
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade0}   symptom=头疼    confirmDiagnosis=
# 1.60安全用药,全部填写提交成功
#        [Documentation]    断言:""
#     安全用药    ['body']['safeStatus']    3
#        ...    gender=    age=    ageType=岁    drugIds=${drugIds_tabooList_grade0}    symptom=头疼    confirmDiagnosis=
