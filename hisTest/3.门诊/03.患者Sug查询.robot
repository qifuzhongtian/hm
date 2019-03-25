*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名    类型    是否必须    说明
# patientName    String # 是    患者名称或拼音

*** Test Cases ***

3.1 患者Sug查询
    [Documentation]    断言:"patientName"
    ${getRes}    患者Sug查询    patientName=接口自动保存病例
    Should Be Equal As Strings    ${getRes['body']['patientList'][0]['patientName']}    接口自动保存病例
