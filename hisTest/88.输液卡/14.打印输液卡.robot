*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    新建病历接口    patientId=${empty}
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
#下边是输液卡
...    AND    新增药品    drugName=${catenate}查询药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=2.00    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
...    AND    保存输液卡模板    id=    tempName=${catenate}输液卡模板    tempType=1    tempAuthority=1    linkId=20    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉滴注","useRate":"1日1次(qd)","drippingSpeed":1,"speedUnit":"g/分钟","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"袋","totalDosage":1,"totalDosageUnit":"瓶","skinTest":"皮试","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
...    AND    保存病历_输液卡    inquiryType=0    address=    recordId=${recordId}    patientId=${patientId}    patientName=接口保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList=    chinesePrescriptionList=    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉注射","useRate":"1日1次(qd)","drippingSpeed":0,"speedUnit":"","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"","dosageUnit":"","totalDosage":1,"totalDosageUnit":"瓶","price":1,"univalence":2,"skinTest":"","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
# ...    AND    待收费订单列表    startDate=2015-05-03    endDate=2027-06-12    currentPage=    pageSize=50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime
# 字段名 类型  是否必须    说明


*** Test Cases ***
14.1 打印输液卡
    [Documentation]    断言:" "
    ${getRes}    打印输液卡    recordId=${recordId}
    # ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']['orderNo']]
    Should Contain    ${getRes['body']['title']}    接口自动化测试诊所
