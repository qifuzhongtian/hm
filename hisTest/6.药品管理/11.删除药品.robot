*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=barCode    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
# ...    AND    药品列表查询    drugName=    drugType=    status=1    currentPage=1    pageSize=50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# drugIds	Int	是	诊所药品ID
# dataSource	Int	是	药品数据源 1：惠每  0：诊所
*** Variables ***
#drugIds 相互作用的两种药,grade=0 ,element=966,524
# @{drugIds}        148300

*** Test Cases ***
11.1 删除药品
    ${drugIds}    Create List    ${drugId}
    [Documentation]    断言:"cndrugIds=北大国际医院集团西南合成制药股份有限公司"
    ${getRes}    删除药品    drugIds=${drugIds}
    Should Be Equal As Strings    ${getRes['head']['error']}    0

