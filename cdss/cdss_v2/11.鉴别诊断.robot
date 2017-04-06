*** Settings ***
Resource          ../惠每决策引擎接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
11.1鉴别诊断
    [Documentation]    断言error:"error=0"
    鉴别诊断    0    diseaseId=8457C0ACE01


11.2鉴别诊断,diseaseId错误显示失败
    [Documentation]    断言error:"error=500"
    鉴别诊断    500    diseaseId=啊啊啊啊


