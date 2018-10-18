*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# startDate   String  否   检索开始就诊日期，时间格式：yyyy-MM-dd
# endDate String  否   检索结束就诊日期，时间格式：yyyy-MM-dd
# currentPage int 否   页码，翻页时使用，默认从1开始
# pageSize    int 否   每页显示数

#输出
# 字段名 类型  说明
# orders  list    订单
#   patientName   String  患者名称
#   gender    String  性别
#   age   int 年龄
#   ageType   String  年龄类型
#   diagnosis String  诊断
#   doctorName    String  医生名称
#   diagnosisDate String  就诊日期
#   receivableAmt double  应收金额
#   orderNo   String  订单号
# totalPage   Int 总页数

*** Test Cases ***
1.1 待收费订单列表
    [Documentation]    断言:"返回的 pageSize含有 阿莫西林片[益萨林] "
    ${getRes}    待收费订单列表    startDate=2016-05-03    endDate=2020-06-12
    ...    currentPage=    pageSize=50
    Should Contain    ${getRes['body']['orders'][0]['patientName']}    接口自动保存病例
    # ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']['orders']]
    # Should Contain    ${aj}    接口自动保存病例

