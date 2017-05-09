*** Settings ***
Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型    是否必须    说明    # patientConditions    String    否
# 字段名	类型	是否必须	说明
# patientId	Long	是	患者ID
*** Test Cases ***
9.1 获取患者信息
    [Documentation]    断言error:""
    获取患者信息    ['body']['patientId']    53040
    ...    patientId=53040
