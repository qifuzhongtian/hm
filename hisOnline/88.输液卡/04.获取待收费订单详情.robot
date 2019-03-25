*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    新建病历接口    patientId=${empty}

...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
#下边3条是输液卡
...    AND    新增药品    drugName=${catenate}查询药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=2.00    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
...    AND    保存输液卡模板    id=    tempName=${catenate}输液卡模板    tempType=1    tempAuthority=1    linkId=20    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉滴注","useRate":"1日1次(qd)","drippingSpeed":1,"speedUnit":"g/分钟","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"袋","totalDosage":1,"totalDosageUnit":"瓶","skinTest":"皮试","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
...    AND    保存病历_输液卡    inquiryType=0    address=    recordId=${recordId}    patientId=${patientId}    patientName=接口保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList=    chinesePrescriptionList=    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉注射","useRate":"1日1次(qd)","drippingSpeed":0,"speedUnit":"","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"","dosageUnit":"","totalDosage":1,"totalDosageUnit":"瓶","price":1,"univalence":2,"skinTest":"","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
...    AND    待收费订单列表    startDate=2015-05-03    endDate=2027-06-12    currentPage=    pageSize=50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime
# 字段名 类型  是否必须    说明
# orderNo   String  是   订单号

# 输出
# 字段名 类型  说明
# orderNo String  订单号
# patientName String  患者名称
# gender  String  性别
# age Long    年龄
# ageType String  年龄类型
# diagnosis   String  诊断
# doctorName  String  医生名称
# diagnosisDate   String  就诊日期
# orderExamList   Object  检查治疗单
#   orderExamListId   long    检查单id
#   orderExams    list    检查项
#     id  Long    检查项id
#     examName    String  检查项名称
#     salePrice   double  单价
#     count   int 数量
#     receivableAmt   double  金额
# orderPrescriptions  List    处方列表
#   orderPrescriptionId   Long    处方id
#   presciptionType   int 处方类型：1：西药处方，2：中药处方
#   orderDrugs    List    药物列表
#     id  Long    药物id
#     drugName    String  药物名称
#     salePrice   double  单价
#     count   string  数量
#     saleUnit        String  单位
#     receivableAmt   double  金额
# orderAdditionAmtList    object  附加费用单
#   orderAdditionAmtListId    long    附加费用单id
#   orderAdditionAmts List    附加费用列表
#     id  Long    附加费用id
#     amtName String  费用名称
#     salePrice   double  单价
#     count   int 数量
#     receivableAmt   double  金额
# recordVersion   Long    病历版本
# orderBalance        欠费信息
# balanceId   Integer 欠账单id
# debtorsName String  欠款人姓名
# debtorsPhone    String  欠款人电话
# debtAmt Double  欠款额
# isPaidOff   Integer 是否还清
*** Test Cases ***
# 4.1 获取待收费订单详情
#     [Documentation]    断言:" "
#     ${getRes}    获取待收费订单详情    orderNo=${orderNo}
#     # ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']['orderNo']]
#     Should Contain    ${getRes['body']['orderNo']}    ${orderNo}


4.2 获取输液卡待收费订单详情
    [Documentation]    断言:" "
    ${getRes}    获取待收费订单详情    orderNo=${orderNo}
    # ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']['orderNo']]
    Should Contain    ${getRes['body']['orderNo']}    ${orderNo}



