*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    获取日期
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime
# 字段名 类型  是否必须    说明
# startDate String  是   订单号
# endDate long    是   检查单id 1497339528535
# doctorName    List[Long]  是   处方id集合
# operateType  long    是   附加费用单id
# payMode   double  是   实收金额
# currentPage   Long    是   病历版本，来自详情接口返回值
# pageSize String  否   欠款人
# debtorsPhone    String  否   欠款人联系方式
# debtAmt Double  否   欠款金额
# medicalInsurance    Double  否   医保支付金额
# commercialInsurance Double  否   商报支付金额



*** Variables ***
# 处方集合数组
# @{doctorName}        6805
*** Test Cases ***
5.1 财务查询
    [Documentation]    断言:"error=0"
    # ${doctorName}    Create List    ${orderPrescriptionId}
    # log    ${tempIds}
    ${getRes}    财务查询    startDate=${today}    endDate=${today}
    ...    doctorName=${null}    operateType=${null}    payMode=${null}
    ...    currentPage=1    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0


# 财务查询
#     [Arguments]    ${startDate}    ${endDate}    ${doctorName}    ${operateType}    ${payMode}    ${currentPage}    ${pageSize}
#     # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     # Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    doctorName=${doctorName}    operateType=${operateType}    payMode=${payMode}
#     ...    currentPage=${currentPage}    pageSize=${pageSize}
#     ${addr}    Post Request    api    his/statistics/chargeRecords    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     [Return]    ${responsedata}





