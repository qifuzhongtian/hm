*** Settings ***
# Suite Setup       Run Keywords    登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Setup       Run Keywords    登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    新建病历接口    patientId=${empty}
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
#下边3条是输液卡
...    AND    新增药品    drugName=${catenate}输液卡药品    drugType=2   isOtc=0    status=1    customType=    drugBatchNo=${secs}    expirationOptions=    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒    frequency=    prescribeAmount=    prescribeAmountUnit=盒    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=2.00    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000    goodsShelfCode=    openStock=0    supplier=
...    AND    查询药品详细信息    drugId=${drugId}   dataSource=0
...    AND    保存输液卡模板    id=    tempName=${catenate}输液卡模板    tempType=1    tempAuthority=1    linkId=20    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉滴注","useRate":"1日1次(qd)","drippingSpeed":1,"speedUnit":"g/分钟","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"袋","totalDosage":1,"totalDosageUnit":"瓶","skinTest":"皮试","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
...    AND    药品搜索Sug    drugName=输液卡药品    dataSource=2    saleChannel=1    drugType=100    version=4

Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library    DateTime

# 字段名 类型  说明
# recordId    Long    病历ID
# patientId   Long    患者ID
# patientName String  患者名称
# gender  Long    性别  1 男 0 女
# age Double  年龄
# ageType String  年/月/日
# phoneNo String  患者手机号
# temperature Double  体温
# sbp Integer 收缩压(大值)
# dbp Integer 舒张压(小值)
# heartRate   Integer 心率
# height  Double  身高
# weight  Double  体重
# otherPhysique   String  其它体格检查
# symptom String  主诉
# previousHistory String  既往史
# personalHistory String  个人史
# allergyHistory  String  过敏史
# familyHistory   String  家族史
# modle   Integer 病历类型1:门诊病历-     2. 门诊处方     3. 补录病历
# examList    List    检查结果
#     patientExamId   Long    记录ID
#     examName    String  检查项
#     examId  Long    检查ID
#     examPrice   Double  检查价格
#     isCharged   Int 1收费，0未收
# diagnosis   List    诊断
#     diseaseId   Long    疾病id
#     diseaseName String  疾病名称
# patentPrescriptionList  List    成药处方
#   patentPrescription    Obj 成药处方药物列表
#     isCharged   Int 1收费，0未收
#     patentDrugList  List    成药处方药物列表
#         drugId  Long    药物ID
#         drugName    String  药物名称
# specification   String  生产厂家
# manufacturer    String  规格包装描述
#         dataSource  Integer 药物来源
#         assId   Long    组号
#         usage   String  用法
#         frequency   String  用药频率
#         dosage  Double  单次剂量值
#         dosageUnit  String  单次剂量单位
#         totalDosage Object  开药量
#         totalDosageUnit Double  开药量单位
#         price   Double  出售价格
#         univalence  double  出售单价
#         prescription    Long    处方编号
# chinesePrescriptionList List    饮片处方
#     isCharged   Int 1收费，0未收
#     totalDosage Long    剂量值
#     dailyDosage Long    每日剂量
#     frequency   String  用药频率
#     usage   String  用法
#     requirement String  要求
#     prescription    Long    处方编号
#     decoctionPiecesList List    饮片集合
#         drugId  Long    药物ID
#         drugName    String  饮片名称
#         dataSource  Integer 药物来源
#         value   Double  剂量值
#         unit    String  单位
#         price   String  销售价格
#         comment String  备注
#         dataSource  Long    药品来源 1,惠每 0,诊所
#         univalence  double  出售单价
# additionalList  List    附件项目
#     additionalId    Long    ID
#     additionalName  String  附件项目名称
#     additionalPrice Double  出售价格
#     isCharged   Long    是否收费
# attachmentList  List    附件项目
#     uri String  文件的url
#     fileName    String  文件名称
#     fileType    String  文件的后缀名
# doctorAdvice    String  医嘱
# price   Double  价格
# deleteExamIdList    List    删除检查ID集合
#      patientExamId  Integer 检查记录ID
# deletePatentPrescriptionList    List    删除西药处方ID集合
#      prescription   Integer 处方编号
# deleteChinesePrescriptionList   List    删除中药处方ID集合
#      prescription   Integer 处方编号
# deleteAdditionalIdList  List    删除附加费用ID集合
#      id Integer 附加费用ID


*** Variables ***

*** Test Cases ***

#与保存病历用的同一个接口

12.2 补录病历
    [Tags]    skip

   # [Documentation]    断言:"error=0 成功"
    ${getRes}    保存病历_输液卡    inquiryType=0    address=测试地址    recordId=${recordId}    patientId=${patientId}    patientName=接口自动补录病例    gender=1    age=50
    ...    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90
    ...    height=181    weight=71.5    otherPhysique=
    ...    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=我是补录的    familyHistory=心脏病
    ...    modle=3    doctorAdvice=我是医嘱
    ...    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}
    ...    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}
    ...    patentPrescriptionList={"isCharged":${0},"prescription":${null},"patentDrugList":[{"drugId":"29087","drugName":"萃仙丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日2次(bid)","dosage":"1","dosageUnit":"粒","totalDosage":2,"totalDosageUnit":"盒","price":1,"univalence":2,"prescription":${null},"specification":"每100粒重3g","manufacturer":"本溪仙草堂药业有限公司"}]}
    # ...    chinesePrescriptionList={"isCharged":${0},"prescription":${null},"totalDosage":"1","dailyDosage":"1","frequency":"1日1次(qd)","usage":"口服","requirement":"水煎400ml；分早晚两次空腹温服","prescription":${null},"decoctionPiecesList":[{"drugId":"18939","drugName":"胖大海","value":"1","unit":"盒","price":"0.00","comment":"先煎","univalence":"0","dataSource":"1","specification":"1.0g/粒*20/盒"}]}
    ...    chinesePrescriptionList=
    # ...    additionalList={"additionalId":${null},"additionalName":"附加费用1","additionalPrice":"1.00","isCharged":"0"},{"additionalId":${null},"additionalName":"附加费用2","additionalPrice":"2.00","isCharged":"0"}
    ...    infusionList={"infusionGroupList":[{"group":1,"usage":"静脉注射","useRate":"1日1次(qd)","drippingSpeed":0,"speedUnit":"","startTime":"${today}","dayCount":1,"patientDrugList":[{"drugId":"${drugId}","drugName":"${drugName}","dosage":"1","dosageUnit":"粒","totalDosage":1,"totalDosageUnit":"盒","price":99.8,"univalence":99.8,"skinTest":"","dataSource":0,"specification":"","manufacturer":"${manufacturer}"}]}]}
    # ...    infusionList=
    Should Be Equal As Strings    ${getRes['head']['error']}    0

