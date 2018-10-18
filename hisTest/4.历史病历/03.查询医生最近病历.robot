*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型    是否必须    说明    # patientId    String    否
# 字段名 类型  是否必须    说明
# patientId   String  否   为空时查询全部
# pageSize   String  否   诊断名称
# currentPage Int 是   当前页数
# pageSize    Int 是   分页数量大小
*** Test Cases ***
3.1 查询医生最近病历
    [Documentation]    断言:"patientName=患者1"
    ${getRes}    查询医生最近病历    pageSize=50
    # Should Contain    ${getRes['body'][0]['patientName']}    患者1
    ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']]
    Should Contain    ${aj}    接口自动保存病例


