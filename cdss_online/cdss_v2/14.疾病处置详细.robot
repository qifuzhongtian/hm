*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
14.1疾病处置详细
    [Documentation]    断言error:"error=0"
    疾病处置详细    0    diseaseId=8457C0ACE01


14.2疾病处置详细,diseaseId错误显示失败
    [Documentation]    断言error:"error=500"
    疾病处置详细    500    diseaseId=啊啊啊啊




