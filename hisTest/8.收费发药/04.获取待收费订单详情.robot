*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
...    AND    新建病历接口    patientId=${patientId}
...    AND    保存病历    recordId=${recordId}    patientId=${patientId}    patientName=${secs}接口自动保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList={"isCharged":"0","prescription":${null},"patentDrugList":[{"drugId":"29087","drugName":"萃仙丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日2次(bid)","dosage":"1","dosageUnit":"粒","totalDosage":2,"totalDosageUnit":"盒","price":1,"univalence":2,"prescription":${null},"specification":"每100粒重3g","manufacturer":"本溪仙草堂药业有限公司"}]}
...    AND    待收费订单列表    startDate=2015-05-03    endDate=2027-06-12    currentPage=    pageSize=50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
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
4.1 获取待收费订单详情
    [Documentation]    断言:" "
    ${getRes}    获取待收费订单详情    orderNo=${orderNo}
    # ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']['orderNo']]
    Should Contain    ${getRes['body']['orderNo']}    ${orderNo}



