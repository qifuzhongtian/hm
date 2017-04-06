*** Settings ***
Resource          ../安全用药接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# gender Integer 否 性别1.男，0.女
# age Double 否 年龄
# ageType String 否 岁/月/天/
# drugIds List 是 药品ID集合
# symptom String 否 患者主诉

*** Test Cases ***
1.1安全用药,填写药品id提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=    age=
    ...    ageType=    drugIds=1    symptom=

1.2安全用药,不填写药品id提交失败
    [Documentation]    断言error:""
    安全用药    0    gender=    age=
    ...    ageType=    drugIds=    symptom=

1.3安全用药,填写性别提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=1    age=
    ...    ageType=    drugIds=    symptom=

1.4安全用药,填写年龄:岁,提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=    age=22
    ...    ageType=岁    drugIds=    symptom=

1.5安全用药,填写年龄:月,提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=    age=22
    ...    ageType=月    drugIds=    symptom=


1.6安全用药,填写年龄:天,提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=    age=22
    ...    ageType=天    drugIds=    symptom=


1.7安全用药,填写患者主诉提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=    age=
    ...    ageType=    drugIds=    symptom=头疼


1.8安全用药,全部填写提交成功
    [Documentation]    断言error:""
    安全用药    0    gender=1    age=22
    ...    ageType=岁    drugIds=1    symptom=头疼

