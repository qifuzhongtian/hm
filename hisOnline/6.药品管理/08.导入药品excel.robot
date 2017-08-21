*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  说明  说明
# hospitalId String  批次号 诊所药品ID
# excelFile    String  药品名 药品数据源 1：惠每  0：诊所
# drugType    String  药品类型
# allInstock  String  含空库存

*** Test Cases ***
# 8.1 导入药品excel
#     [Documentation]    断言:""
#     ${getRes}    导入药品excel    hospitalId=    excelFile=
#     Should Be Equal As Strings    ${getRes['body']['message']}    没有药品批次信息，更换查询条件试试


