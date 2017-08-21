*** Settings ***
Suite Setup       登录接口
Suite Teardown    RequestsLibrary.Delete All Sessions
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
1.1 诊所信息查询
    [Documentation]    断言:"hospitalName=尹博的测试诊所"
    ${getRes}    诊所信息查询
    # Should Contain    ${getRes['body']['hospitalName']}    尹博的测试诊所
    Should Contain    ${getRes['body']['headerSystemName']}    惠每云诊所系统

