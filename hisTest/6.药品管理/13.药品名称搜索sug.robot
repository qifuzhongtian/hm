*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=barCode    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名   类型  是否必须    说明
# drugName    String  否   名称
# version  Integer 是   类型

# 类型ID  类型名称
# 1 成药用法
# 2 用药频率
# 3 用药单位
# 4 包装单位
# 5 最小单位
# 6 饮片用法
# 7 服用要求
# 8 规格单位

*** Test Cases ***
13.1 药品名称搜索sug,显示正确
    [Documentation]    assert
    ${getRes}    药品名称搜索sug    drugName=药品    version=19
    Should Contain   ${getRes['body']['drugList'][0]['drugName']}    接口发
    # ${aj}    Evaluate    [aj['drugName'] for aj in $getRes['body']['drugList']]
    # Should Contain    ${aj}    接口发药品
