*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0    status=1    customType=自定义分类    drugBatchNo=    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=同仁堂
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# drugName    String  否   药品名搜索
# drugType    int 否   "药品分类:  枚举值饮片：1中成药：2化学制剂：3耗材:4生物制品:5"
# status  int 是   状态 1：启用 2：禁用
# currentPage int 是   当前页数
# pageSize    int 否   分页数量大小
*** Test Cases ***
1.1 药品列表查询,指定类型
    [Documentation]    断言:"drugName"
    ${getRes}    药品列表查询    drugName=    drugType=    status=1    currentPage=1    pageSize=50
    Should Contain    ${getRes['body']['drugList'][0]['drugName']}    接口发


# 1.2 查询条件为空
#     [Documentation]    断言:"drugName"
#     ${getRes}    药品列表查询    drugName=    drugType=    status=1    currentPage=1    pageSize=50
#     Should Not Be Empty    ${getRes['body']['drugList'][0]['drugName']}    白蚀丸

