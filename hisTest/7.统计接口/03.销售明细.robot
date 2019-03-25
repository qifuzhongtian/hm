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
# {
# 	"startDate": "2017-08-01",
# 	"endDate": "2017-08-01",
# 	"type": null,
# 	"itemName": null,
# 	"customType": null,
# 	"doctorName": null,
# 	"patientName": null
# 	"currentPage": 1,
# 	"pageSize": 20,

# }

*** Variables ***
*** Test Cases ***
2.1 销售明细
    [Documentation]    断言:"error=0"
    # ${doctorName}    Create List    ${orderPrescriptionId}
    # log    ${tempIds}
    ${getRes}    销售明细    startDate=${today}    endDate=${today}
    ...    doctorName=${null}    patientName=${null}    type=${null}    itemName=${null}    customType=
    ...    currentPage=1    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0

