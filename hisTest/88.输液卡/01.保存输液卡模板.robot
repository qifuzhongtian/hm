*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=2.00    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime
*** Variables ***
# 字段名 类型  是否必须    说明
# id  Long    否   模板id，非必填，如果有id则更新，没有则新增
# tempName    String  是   处方名称
# tempType    Integer 是   输液卡处方类型：4
# tempAuthority   Int 是   模板类型: 1:个人处方2:诊所处方
# linkId  Long    否   处方ID
# infusionList    List    否   输液卡列表
#   infusionGroupList List    否   输液卡组
# group   Integer 否   组号
# usage   String  否   用法
# useRate String  否   用药频率
# drippingSpeed   Float   否   滴速
# speedUnit   String  否   滴速单位
# startTime   String  否   开始时间
# dayCount    Integer 否   天数
# patientDrugList List    否   输液卡药品列表
#        drugId   Long    否   药品ID
# drugName    String  否   药品名
#        dosage   String  否   单次剂量
#        dosageUnit   String  否   单次剂量单位
#        totalDosage  Double  否   开药量
#        totalDosageUnit  String  否   开药量单位
#        skinTest String  否   皮试
# dataSource  Integer 是   数据来源  如果不是补出来的药品数据来源为5
# specification   String  是   药品描述
# manufacturer    String  是   制造商

*** Test Cases ***
1.1 保存输液卡模板-个人处方
    # [Tags]    skip
    [Documentation]    断言:"保存成功 error=0"
    # ${secs}    Get Time    epoch
    # log    ${secs}
    # ${tempName}    Catenate    SEPARATOR=    ${secs}    中药饮片处方模板
    # log    ${tempName}
    ${getRes}    保存输液卡模板    id=    tempName=${catenate}输液卡模板    tempType=4    tempAuthority=1    linkId=20
    ...    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉滴注","useRate":"1日1次(qd)","drippingSpeed":1,"speedUnit":"g/分钟","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"袋","totalDosage":1,"totalDosageUnit":"瓶","skinTest":"皮试","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
    Should Be Equal As Strings    ${getRes['head']['error']}    0

