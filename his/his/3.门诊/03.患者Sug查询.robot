*** Settings ***
Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# patientName	String	是	患者名称或拼音

*** Test Cases ***
3.1 患者Sug查询
    [Documentation]    断言:""
    患者Sug查询    ['body']['patientList'][0]['patientName']    患者1    patientName=患者1
