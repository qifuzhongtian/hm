*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型    是否必须    说明    # patientConditions    String    否
# 字段名 类型  是否必须    说明
# patientConditions   String  否   为空时查询全部
# diagnosis   String  否   诊断名称
# currentPage Int 是   当前页数
# pageSize    Int 是   分页数量大小
*** Test Cases ***
8.1 医生病患列表
    [Documentation]    断言:"patientName=接口自动保存病例"
    ${getRes}    医生病患列表    patientConditions=接口自动保存病例    diagnosis=    currentPage=1    pageSize=50
    Should Be Equal As Strings    ${getRes['body']['patientList'][0]['patientName']}    接口自动保存病例
