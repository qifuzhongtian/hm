*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    保存中药饮片处方模板    id=    tempName=${catenate}饮片处方模板_个人    tempType=1    tempAuthority=1    linkId=20    chinesePrescriptionList=
...    AND    保存中药饮片处方模板    id=    tempName=${catenate}饮片处方模板_诊所    tempType=1    tempAuthority=2    linkId=20    chinesePrescriptionList=
...    AND    新增药品    drugName=${catenate}查询药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=2.00    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
...    AND    保存输液卡模板    id=    tempName=${catenate}输液卡模板    tempType=1    tempAuthority=1    linkId=20    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉滴注","useRate":"1日1次(qd)","drippingSpeed":1,"speedUnit":"g/分钟","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"袋","totalDosage":1,"totalDosageUnit":"瓶","skinTest":"皮试","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}


Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime

# tempName    Strng   否   处方名
# tempAuthority    int 是   处方类型 0：全部，1：个人，2：诊所

*** Test Cases ***
3.1 显示全部处方
    [Documentation]    断言:""
    ${getRes}    获取载入常用处方列表    tempName=    tempAuthority=0
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    模板
    # Should Contain    ${aj}    尹博安全用药处方


3.2 显示个人处方
    [Documentation]    断言:""
    ${getRes}    获取载入常用处方列表    tempName=    tempAuthority=1
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    模板

# 3.3 显示诊所处方
#     [Documentation]    断言:""
#     ${getRes}    获取载入常用处方列表    tempName=    tempAuthority=2
#     # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
#     Should Contain    ${getRes['body']['templates'][1]['tempName']}    诊所


3.4 处方名称搜索-模糊搜索
    [Documentation]    断言:""
    ${getRes}    获取载入常用处方列表    tempName=1    tempAuthority=0
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    模板

3.5 处方名称搜索-模糊搜索-诊所
    [Documentation]    断言:""
    ${getRes}    获取载入常用处方列表    tempName=处方    tempAuthority=2
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    模板


3.6 处方名称搜索-精确搜索
    [Documentation]    断言:""
    ${getRes}    获取载入常用处方列表    tempName=处方    tempAuthority=0
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    模板


3.7 处方名称搜索-精确搜索-诊所
    [Documentation]    断言:""
    ${getRes}    获取载入常用处方列表    tempName=处方    tempAuthority=2
    # ${aj}    Evaluate    [aj['tempName'] for aj in $getRes['body']['templates']]
    Should Contain    ${getRes['body']['templates'][0]['tempName']}    模板

