*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# diseaseName String 是 疾病名称

*** Test Cases ***
17.1 疾病查询
    [Documentation]    断言error:"糖尿病id=34470"
    疾病查询    ['body']['diseaseList'][0]['id']    34470    diseaseName=糖尿病


# 15.2疾病查询,diseaseName错误显示失败
#     [Documentation]    断言error:"error=500"
#     疾病查询    ['body']['diseaseList'][0]['id']    500    diseaseName=1111111111


