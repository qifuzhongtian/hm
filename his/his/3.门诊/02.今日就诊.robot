*** Settings ***
Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型    是否必须    说明    # patientConditions    String    否
# 字段名 类型  是否必须    说明
# patientConditions   String  否   为空时查询全部
# diagnosis   String  否   诊断名称
# currentPage Int 是   当前页数
# pageSize    Int 是   分页数量大小
*** Test Cases ***
8.1 今日就诊
    [Documentation]    断言:""
    今日就诊    ['body']['safeStatus']    patientName    doctorId=674
