*** Settings ***
Suite Setup    Run keywords       登录接口
...    AND    获取日期
...    AND    已退费列表订单列表    startDate=2013-05-03    endDate=${today}    patientName=    doctorId=    currentPage=    pageSize=50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime
# 字段名	类型	是否必须	说明
# orderNo	String	是	订单号
*** Test Cases ***
8.1 获取已退费列表订单详情
    [Documentation]    断言:""
    ${getRes}    获取已退费列表订单详情    orderNo=${orderNo}
    # ${aj}    Evaluate    [aj['drugName'] for aj in $getRes['body']['orderPrescriptions'][0]['orderDrugs']]
    Should Contain    ${getRes['body']['orderNo']}    ${orderNo}

