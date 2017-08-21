*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=    goodsShelfCode=    openStock=0    supplier=
...    AND    药品入库    supplier=同仁堂    batchInstockList={"drugId":"${drugId}","instockCount":"1","purchasePrice":"2.11","prescriptionPrice":"71.11","validityDate":4070880000000,"expirationOptions":"","instockUnit":"盒"}    purchaseOrderId=    createDate=
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime
# 字段名 类型  是否必须    说明
# startDate   String  否   入库日期开始日期
# endDate String  否   入库日期结束日期
# drugBatchNo String  否   批次号
# drugName    String  否   药品检索
# supplier    String  否   供货商

*** Test Cases ***
16.1 药品入库日志
    [Documentation]    断言:"返回的 drugName含有 阿莫西林片[益萨林] "
    ${getRes}    药品入库日志    startDate=2015-05-03    endDate=${today}
    ...    drugBatchNo=    drugName=    supplier=
    ${aj}    Evaluate    [aj['manufacturer'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    吉林省健今药业有限责任公司


16.2 供应商精确搜索
    [Documentation]    断言:"返回的 返回的供应商名字 "
    ${getRes}    药品入库日志    startDate=2015-05-03    endDate=${today}
    ...    drugBatchNo=    drugName=    supplier=同仁堂
    ${aj}    Evaluate    [aj['supplier'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    同仁堂


16.3 供应商模糊搜索
    [Documentation]    断言:"返回的供应商名字"
    ${getRes}    药品入库日志    startDate=2015-05-03    endDate=${today}
    ...    drugBatchNo=    drugName=    supplier=同
    ${aj}    Evaluate    [aj['supplier'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    同仁堂


16.4 日期搜索
    [Documentation]    断言:"返回的日期 为今日新增"
    ${getRes}    药品入库日志    startDate=2015-06-12    endDate=${today}
    ...    drugBatchNo=    drugName=    supplier=
    ${aj}    Evaluate    [aj['validityDateStr'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    ${today}
    # Should Be Equal As Strings    ${getRes['head']['message']}    药品名称、包装规格描述、包装单位、厂家名称已存在，不能重复


# 16.5 日期搜索
#     [Documentation]    断言:"返回的如期 "
#     ${getRes}    药品入库日志    startDate=2019-06-12    endDate=${today}
#     ...    drugBatchNo=    drugName=    supplier=
#     ${aj}    Evaluate    [aj['validityDateStr'] for aj in $getRes['body']['drugList']]
#     Should Contain    ${aj}    2019-06-12
#     # Should Be Equal As Strings    ${getRes['head']['message']}    药品名称、包装规格描述、包装单位、厂家名称已存在，不能重复

16.6 批次号搜索
    [Documentation]    断言:""
    ${getRes}    药品入库日志    startDate=2015-06-08    endDate=${today}
    ...    drugBatchNo=2019050502    drugName=    supplier=
    ${aj}    Evaluate    [aj['supplier'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    同仁堂


# 16.7 药品查询-商品名精确查询
#     [Documentation]    断言:""
#     ${getRes}    药品入库日志    startDate=2015-06-08    endDate=${today}
#     ...    drugBatchNo=    drugName=接口    supplier=
#     # ${aj}    Evaluate    [aj['drugName'] for aj in $getRes['body']['drugList']]
#     Should Contain    ${getRes['body']['drugList'][0]['drugName']}    接口发
#     # Should Contain    ${aj}    白蚀丸

16.8 药品查询-商品名模糊查询
    [Documentation]    断言:""
    ${getRes}    药品入库日志    startDate=2015-06-08    endDate=${today}
    ...    drugBatchNo=    drugName=接口    supplier=
    # ${aj}    Evaluate    [aj['drugName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${getRes['body']['drugList'][0]['drugName']}    接口发
    # Should Contain    ${aj}    白蚀丸


16.9 药品查询-厂家查询
    [Documentation]    断言:""
    ${getRes}    药品入库日志    startDate=2015-06-08    endDate=${today}
    ...    drugBatchNo=    drugName=    supplier=同仁堂
    # ${aj}    Evaluate    [aj['drugName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${getRes['body']['drugList'][0]['drugName']}    接口发


# 16.10 全部匹配
#     [Documentation]    断言:""
#     ${getRes}    药品入库日志    startDate=2015-06-08    endDate=${today}
#     ...    drugBatchNo=2019050502    drugName=白蚀丸    supplier=
#     ${aj}    Evaluate    [aj['drugName'] for aj in $getRes['body']['drugList']]
#     Should Contain    ${aj}    白蚀丸

