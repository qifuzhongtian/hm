*** Settings ***
Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名	类型	是否必须	说明
# patientId	Long	否	没有患者id时可为空
*** Test Cases ***
3.1 新建病历
    [Documentation]    断言:""
    新建病历    ['head']['error']    0
    ...    patientId=