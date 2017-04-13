*** Settings ***
Resource          ../安全用药接口关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型 是否必须 说明    # gender Integer 否 性别1.男，0.女    # age Double 否 年龄    # ageType String 否 岁/月/天/    # drugIds List 是 药品ID集合    # symptom String 否 患者主诉
# 字段名 类型  是否必须    说明
# gender  Integer 否   性别1.男，0.女
# age Double  否   年龄
# ageType String  否   岁/月/天/
# drugIds List    是   药品ID集合
# symptom String  否   患者主诉



*** Variables ***
#drugIds 相互作用的两种药,grade=2
@{drugIds_interactionList_grade1}        8126    5714
#drugIds 相互作用的两种药,grade=1
@{drugIds_interactionList_grade2}        1255    3525
#drugIds 可以合用的两种药,grade=1
@{drugIds_interactionList_grade3}        4285    1945
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
#高血压用药不重复
@{drugIds_repetitionList2}        17440    2459    8126



*** Test Cases ***
# 1.1相互作用等级为'谨慎'的两种药,grade=2
#     [Documentation]    断言error:"grade=2"
#     安全用药    ['body']['interactionList'][0]['grade']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade1}    symptom=

# 1.2相互作用等级为'禁用'的两种药,grade=1
#     [Documentation]    断言error:"grade=2"
#     安全用药    ['body']['interactionList'][0]['grade']    1
#     ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade2}    symptom=


# 1.3相互作用等级为'可以合用'的两种药,grade=3
#     [Documentation]    断言error:"grade=3"
#     安全用药    ['body']['interactionList'][0]['grade']    3
#     ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade3}    symptom=


# 1.4相互作用等级为'禁用'的两种药,用药审核结果应为不通过
#     [Documentation]    断言error:"safeStatus=1"
#     安全用药    ['body']['safeStatus']    1
#     ...    gender=    age=    ageType=    drugIds=${drugIds_interactionList_grade2}    symptom=

# 人群年龄、性别、妊娠、哺乳、月经期
# 哺乳、妊娠、月经期 需对his的主诉／现病史、诊断进行识别
# 若禁忌人群同时对应人群年龄和性别时，需患者同时满足，才审核不合理
# grade 1.禁用，2.不适用，3.不推荐，4.不宜应用，5.忌用，
# ...6.避免使用，7.不建议，8.慎用，9.权衡利弊


# 1.5人群禁忌等级为'1禁用'的药,结果正确
#     [Documentation]    断言error:"grade=1"
#     安全用药    ['body']['tabooList'][0]['grade']    1
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade1}    symptom=


# 1.6人群禁忌等级为'2不适用'的药,结果正确
#     [Documentation]    断言error:"grade=2"
#     安全用药    ['body']['tabooList'][0]['grade']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade2}    symptom=


# 1.7人群禁忌等级为'3不推荐'的药,结果正确
#     [Documentation]    断言error:"grade=3"
#     安全用药    ['body']['tabooList'][0]['grade']    3
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade3}    symptom=


# 1.8人群禁忌等级为'4不宜应用'的药,结果正确
#     [Documentation]    断言error:"grade=4"
#     安全用药    ['body']['tabooList'][0]['grade']    4
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade4}    symptom=


# 1.9人群禁忌等级为'5.忌用'的药,结果正确
#     [Documentation]    断言error:"grade=5"
#     安全用药    ['body']['tabooList'][0]['grade']    5
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade5}    symptom=

# 1.10人群禁忌等级为'6.避免使用'的药,结果正确
#     [Documentation]    断言error:"grade=6"
#     安全用药    ['body']['tabooList'][0]['grade']    6
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade6}    symptom=

# 1.11人群禁忌等级为'7.不建议'的药,结果正确
#     [Documentation]    断言error:"grade=7"
#     安全用药    ['body']['tabooList'][0]['grade']    7
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade7}    symptom=

# 1.12人群禁忌等级为'8.慎用'的药,结果正确
#     [Documentation]    断言error:"grade=8"
#     安全用药    ['body']['tabooList'][0]['grade']    8
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade8}    symptom=

# 1.13人群禁忌等级为'9.权衡利弊'的药,结果正确
#     [Documentation]    断言error:"grade=9"
#     安全用药    ['body']['tabooList'][0]['grade']    9
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade9}    symptom=


# 1.14人群禁忌等级'症状'为妊娠的药,结果正确
#     [Documentation]    断言error:"crowd": "3个月以上妊娠妇女
#     安全用药    ['body']['tabooList'][0]['crowd']    3个月以上妊娠妇女
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_symptom1}    symptom=妊娠


# 1.15人群禁忌等级'性别'为女的药,结果正确
#     [Documentation]    断言error:"crowd": "gender=0"
#     安全用药    ['body']['tabooList'][0]['crowd']    备孕妇女
#     ...    gender=0    age=    ageType=    drugIds=${drugIds_tabooList_gender1}    symptom=


# 岁/月/天/
# 1.16人群禁忌等级,ageType=岁,'年龄'=10岁,结果正确
#     [Documentation]    断言error:"crowd": "crowd=10岁以下儿童"
#     安全用药    ['body']['tabooList'][0]['crowd']    10岁以下儿童
#     ...    gender=    age=10    ageType=岁    drugIds=${drugIds_tabooList_age1}    symptom=

# 1.17人群禁忌等级,ageType=月,'年龄mix_day'=30,结果正确
#     [Documentation]    断言error:"crowd": "description=1个月以内的新生儿禁用"
#     安全用药    ['body']['tabooList'][0]['description']    1个月以内的新生儿禁用
#     ...    gender=    age=30    ageType=月    drugIds=${drugIds_tabooList_age2}    symptom=

# 1.18人群禁忌等级,ageType=月,'年龄min_day'=4380,结果正确
#     [Documentation]    断言error:"crowd": "min_day最小值 ,description=12岁以上儿童慎用"
#     安全用药    ['body']['tabooList'][0]['description']    12岁以上儿童慎用
#     ...    gender=    age=4381    ageType=月    drugIds=${drugIds_tabooList_age3}    symptom=

# 1.19人群禁忌等级,ageType=天,'年龄1-43799',结果正确
#     [Documentation]    断言error:"crowd": "description=不适用于妇女"
#     安全用药    ['body']['tabooList'][0]['description']    不适用于妇女
#     ...    gender=    age=43799    ageType=天     drugIds=${drugIds_tabooList_age4}    symptom=



# 1.20人群禁忌等级,年龄+症状,结果正确
#     [Documentation]    断言error:"crowd=41",description=3个月以上孕妇慎用"
#     安全用药    ['body']['tabooList'][0]['description']    3个月以上孕妇慎用
#     ...    gender=    age=91    ageType=天     drugIds=${drugIds_tabooList_age5}    symptom=妊娠



# 1.21人群禁忌等级,年龄+性别,结果正确
#     [Documentation]    断言error:"crowd=49",description=40岁以上妇女禁用"
#     安全用药    ['body']['tabooList'][0]['description']    40岁以上妇女禁用
#     ...    gender=0    age=14600    ageType=天     drugIds=${drugIds_tabooList_age6}    symptom=




# 1.22人群禁忌等级,年龄+性别+病症,结果正确
#     [Documentation]    断言error:"crowd=93",description=未婚妇女不宜使用"
#     安全用药    ['body']['tabooList'][0]['description']    未婚妇女不宜使用
#     ...    gender=0    age=2459    ageType=天     drugIds=${drugIds_tabooList_age7}    symptom=未婚







# 1.23人群禁忌等级grade为'1禁用'的药,用药审核结果为'禁用'
#     [Documentation]    断言error:"safeStatus=1"
#     安全用药    ['body']['safeStatus']    1
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade1}    symptom=

# 1.24人群禁忌等级grade为'2不适用'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade2}    symptom=


# 1.25人群禁忌等级grade为'3不推荐'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade3}    symptom=


# 1.26人群禁忌等级grade为'4不宜应用'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade4}    symptom=


# 1.27人群禁忌等级grade为'5.忌用'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade5}    symptom=

# 1.28人群禁忌等级grade为'6.避免使用'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade6}    symptom=

# 1.29人群禁忌等级grade为'7.不建议'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade7}    symptom=

# 1.30人群禁忌等级grade为'8.慎用'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade8}    symptom=

# 1.31人群禁忌等级grade为'9.权衡利弊'的药,用药审核结果为'待审核'
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    ['body']['safeStatus']    2
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade9}    symptom=



# 1.32人群禁忌等级grade为'合理'的药,用药审核结果为'审核通过'
#     [Documentation]    断言error:"safeStatus=3"
#     安全用药    ['body']['safeStatus']    3
#     ...    gender=    age=    ageType=    drugIds=${drugIds_tabooList_grade10}    symptom=



1.33高血压用药重复,用药审核结果为'高血压用药重复'
    [Documentation]    断言error:"safeStatus=3"
    安全用药    ['body']['repetitionList'[0]]    3
    ...    gender=    age=    ageType=    drugIds=${drugIds_repetitionList1}    symptom=



1.34高血压用药不重复,等级grade为'合理'的药,用药审核结果为'审核通过'
    [Documentation]    断言error:"safeStatus=3"
    安全用药    ['body']['safeStatus']    3
    ...    gender=    age=55    ageType=岁    drugIds=${drugIds_repetitionList2}    symptom=









































# 1.2相互作用为谨慎的两种药,审核结果为'待审核'safeStatus=2
#     [Documentation]    断言error:"safeStatus=2"
#     安全用药    2    gender=    age=55    ageType=    drugIds=${drugIds}    symptom=




    # 1.1安全用药,填写药品id,通过
    #    [Documentation]    断言error:""
    #    安全用药1    0    gender=    age=
    #    ...    ageType=    drugIds=    symptom=
    # 1.安全用药,填写药品id,不通过
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=
    #    ...    ageType=    drugIds=1,2    symptom=
    # 1.安全用药,填写药品id,待审核
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=
    #    ...    ageType=    drugIds=1,3    symptom=
    # 1.2安全用药,不填写药品id提交失败
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=
    #    ...    ageType=    drugIds=    symptom=
    # 1.3安全用药,填写性别提交成功
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=1    age=
    #    ...    ageType=    drugIds=    symptom=
    # 1.4安全用药,填写年龄:岁,提交成功
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=22
    #    ...    ageType=岁    drugIds=    symptom=
    # 1.5安全用药,填写年龄:月,提交成功
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=22
    #    ...    ageType=月    drugIds=    symptom=
    # 1.6安全用药,填写年龄:天,提交成功
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=22
    #    ...    ageType=天    drugIds=    symptom=
    # 1.7安全用药,填写患者主诉提交成功
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=    age=
    #    ...    ageType=    drugIds=    symptom=头疼
    # 1.8安全用药,全部填写提交成功
    #    [Documentation]    断言error:""
    #    安全用药    0    gender=1    age=22
    #    ...    ageType=岁    drugIds=1    symptom=头疼
