*** Settings ***
Resource          ../安全用药接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# drugName String 是 药品名称


*** Test Cases ***
2.1药品查询,输入存在的药品名称,查询成功
    [Documentation]    断言error:"drugId=1"
    药品查询    ['body']['drugList'][0]['drugId']    1
    ...    drugName=18种氨基酸注射液

# 2.2药品查询,输入错误的药品名称查询失败
#     [Documentation]    断言error:""
#     药品查询    ['body']['drugList'][0]['drugId']    0    drugName=感冒药
#     ...    drugName=


