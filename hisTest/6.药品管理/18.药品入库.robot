*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# # {
# #   "supplier": "",
# #   "batchInstockList": [{
# #       "drugId": "148352",
# #       "instockCount": "1",
# #       "purchasePrice": "1.00",
# #       "prescriptionPrice": "99.98",
# #       "drugBatchNo": "1",
# #       "validityDate": 4070880000000,
# #       "expirationOptions": "",
# #       "instockUnit": "盒"
# #   }],
# #   "purchaseOrderId": "",
# #   "createDate": 1498521600000
# # }

# # ${ints}=    Create List    ${1}    ${2}    ${3}
*** Test Cases ***
17.1 药品入库
    [Documentation]    断言:""
    # ${drugIds}    Create List    ${drugId}
    ${getRes}    药品入库    supplier=同仁堂
    ...    batchInstockList={"drugId":"${drugId}","instockCount":"1","purchasePrice":"2.11","prescriptionPrice":"71.11","drugBatchNo":${secs},"validityDate":4102329600000,"expirationOptions":"","instockUnit":"盒"}
    ...    purchaseOrderId=    createDate=
    Should Be Equal As Strings    ${getRes['head']['error']}    0
    # ${aj}    Evaluate    [aj['createDate'] for aj in $getRes['body']['drugList']]
    # Should Contain    ${aj}    阿莫西林片[益萨林]



# ${batchInstockList}    evaluate    [{"drugId":"148349","instockCount":"1","purchasePrice":"1.00","prescriptionPrice":"88.11","validityDate":4070880000000,"expirationOptions":"","instockUnit":"盒"}]

    # ${diagnosis}    evaluate    [${diagnosis}]




# *** Settings ***
# Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
# Suite Teardown    Delete All Sessions
# Resource          ../his关键字.robot
# Library           Collections
# Library           RequestsLibrary
# # {
# # 	"supplier": "",
# # 	"batchInstockList": [{
# # 		"drugId": "148352",
# # 		"instockCount": "1",
# # 		"purchasePrice": "1.00",
# # 		"prescriptionPrice": "99.98",
# # 		"drugBatchNo": "1",
# # 		"validityDate": 4070880000000,
# # 		"expirationOptions": "",
# # 		"instockUnit": "盒"
# # 	}],
# # 	"purchaseOrderId": "",
# # 	"createDate": 1498521600000
# # }

# # ${ints}=    Create List    ${1}    ${2}    ${3}
# *** Variables ***

# *** Test Cases ***
# 18.1 药品入库
#     [Documentation]    断言:""
#     # ${batchInstockList}    Create List    ${drugId}    ${instockCount}    ${purchasePrice}    ${prescriptionPrice}    ${drugBatchNo}    ${validityDate}    ${expirationOptions}    ${instockUnit}
#     ${getRes}    药品入库    supplier=
#     ...    batchInstockList=    drugId=148352    instockCount=    purchasePrice=1.00    prescriptionPrice=2.00    drugBatchNo=123    validityDate=    expirationOptions=4070880000000    instockUnit=盒
#     ...    purchaseOrderId=    createDate=1498521600000
#     ${aj}    Evaluate    [aj['createDate'] for aj in $getRes['body']['drugList']]
#     Should Contain    ${aj}    阿莫西林片[益萨林]











