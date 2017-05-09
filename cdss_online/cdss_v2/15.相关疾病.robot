*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
15.1相关疾病
    [Documentation]    断言error:"diseaseName=流行性感冒"
    相关疾病    ['body'][0]['diseaseName']    流行性感冒    diseaseId=8457C0ACE01


15.2相关疾病,diseaseId错误显示失败
    [Documentation]    断言error:"error=500"
    相关疾病    ['head']['error']    500    diseaseId=啊啊啊啊



