*** Settings ***
Resource          ../安全用药接口关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# name String 是 名称


*** Test Cases ***
# 3.1查询药品与诊断
#     [Documentation]    断言error:""
#     查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
#     ...    name=高血糖

# 3.2查询药品与诊断,不输入药品名称提交失败
#     [Documentation]    断言error:""
#     查询药品与诊断    ['body']['safeStatus']    0
#     ...    name


