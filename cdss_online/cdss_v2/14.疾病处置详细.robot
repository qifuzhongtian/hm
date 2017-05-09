*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
14.1疾病处置详细
    [Documentation]    断言error:"acId=3868"
    疾病处置详细    ['body'][0]['children'][0]['acId']    7368    diseaseId=8457C0ACE01


14.2疾病处置详细,diseaseId错误显示失败
    [Documentation]    断言error:"error=500"
    疾病处置详细    ['head']['error']    500    diseaseId=啊啊啊啊




