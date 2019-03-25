*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}查询药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# drugId	Int	是	诊所药品ID
# dataSource	Int	是	药品数据源 1：惠每  0：诊所

*** Test Cases ***
6.1 查询诊所库中药品
    [Documentation]    断言:"manufacturer=林省健今药业有限责任公司"
    ${getRes}    查询药品详细信息    drugId=${drugId}   dataSource=0
    Should Be Equal As Strings    ${getRes['body']['manufacturer']}    吉林省健今药业有限责任公司


# 6.2 查惠每所库中药品
#     [Documentation]    断言:"cndrugId="
#     ${getRes}    查询药品详细信息    drugId=a694e8d1766811e6a39900163f0004aa   dataSource=1
#     Should Be Equal As Strings    ${getRes['body']['drugIdList'][0]['cndrugId']}    北大国际医院集团西南合成制药股份有限公司

