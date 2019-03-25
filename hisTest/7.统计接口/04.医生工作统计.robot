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
# 	"startDate": "2017-08-02",
# 	"endDate": "2017-08-02",
# 	"doctorName": null,
# 	"drugType": null,
# 	"currentPage": 1,
# 	"pageSize": 20,
# 	"customType": null
# }

*** Variables ***
*** Test Cases ***
4.1 医生工作统计
    [Documentation]    断言:"error=0"
    # ${doctorName}    Create List    ${orderPrescriptionId}
    # log    ${tempIds}
    ${getRes}    医生工作统计    startDate=${today}    endDate=${today}
    ...    doctorName=${null}    drugType=${null}    itemName=${null}    customType=${null}
    ...    currentPage=1    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0


