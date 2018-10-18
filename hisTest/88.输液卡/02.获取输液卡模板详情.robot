*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取日期
...    AND    获取时间戳
...    AND    新增药品    drugName=${catenate}查询药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=2.00    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
...    AND    保存输液卡模板    id=    tempName=${catenate}输液卡模板    tempType=1    tempAuthority=1    linkId=20    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉滴注","useRate":"1日1次(qd)","drippingSpeed":1,"speedUnit":"g/分钟","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"袋","totalDosage":1,"totalDosageUnit":"瓶","skinTest":"皮试","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}

# ...    AND    获取模板列表        currentPage=1    tempName=    tempType=1    tempAuthority=1    pageSize=20
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library        DateTime
# 字段名 类型  是否必须    说明
# id  Long    是   模板id
# tempAuthority   Int 是   1:个人处方模板     2：诊所处方模板


*** Test Cases ***
2.1 获取输液卡模板详情
    [Tags]    skip
    [Documentation]    断言:""
    ${getRes}    获取输液卡模板详情    tempAuthority=1    id=${templateId}
    Should Be Equal As Strings    ${getRes['body']['id']}    ${templateId}

