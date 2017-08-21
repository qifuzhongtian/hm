*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}条形码药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名    类型    # barCode    String    # 6924962599294

*** Test Cases ***
14.1 根据条形码验证药品-重复
    [Documentation]    断言:"message=当前新增药品与诊所已配置的药品信息重复"
    ${getRes}    根据条形码验证药品是否重复    barCode=${barCode}
    Should Be Equal As Strings    ${getRes['head']['message']}    当前新增药品与诊所已配置的药品信息重复
    # log    ${getRes}
    # log    ${getRes.status_code}
    # Should Be Equal As Strings    ${getRes.status_code}    200

14.2 根据条形码验证药品-不重复
    [Documentation]    断言:"error=0"
    ${getRes}    根据条形码验证药品是否重复    barCode=123
    Should Be Equal As Strings    ${getRes['head']['error']}    0
    # log    ${getRes}
    # log    ${getRes.status_code}
    # Should Be Equal As Strings    ${getRes.status_code}    200
