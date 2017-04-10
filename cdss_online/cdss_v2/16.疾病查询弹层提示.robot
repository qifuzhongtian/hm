*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# diseaseName String 是 疾病名称

*** Test Cases ***
15.1 疾病查询弹层提示
    [Documentation]    断言error:"error=0"
    疾病查询弹层提示    0    diseaseName=感冒


# 15.2疾病查询弹层提示,diseaseName错误显示失败
#     [Documentation]    断言error:"error=500"
#     疾病查询弹层提示    500    diseaseName=111

