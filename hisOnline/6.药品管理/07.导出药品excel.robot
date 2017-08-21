*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...     AND    药品列表查询    drugName=    drugType=    status=    currentPage=1    pageSize=50
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  说明  说明
# drugBatchNo String  批次号 诊所药品ID
# drugName    String  药品名 药品数据源 1：惠每  0：诊所
# drugType    String  药品类型
# allInstock  String  含空库存

*** Test Cases ***
7.1.1 导出药品excel,批次管理
    [Documentation]    断言:"响应码"
    ${getRes}    导出药品excel,批次管理    drugBatchNo=${drugBatchNo}    drugName=    drugType=    allInstock=
    Should Be Equal As Strings    ${getRes.status_code}    200



7.1.2 导出药品excel_非批次管理
    [Documentation]    断言:"响应码"
    ${getRes}    导出药品excel,非批次管理    drugBatchNo=${drugBatchNo}    drugName=    drugType=    allInstock=
    Should Be Equal As Strings    ${getRes.status_code}    200


