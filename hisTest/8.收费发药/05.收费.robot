*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
...    AND    新建病历接口    patientId=${patientId}
...    AND    保存病历    recordId=${recordId}    patientId=${patientId}    patientName=${secs}接口自动保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList={"isCharged":"0","prescription":${null},"patentDrugList":[{"drugId":"29087","drugName":"萃仙丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日2次(bid)","dosage":"1","dosageUnit":"粒","totalDosage":2,"totalDosageUnit":"盒","price":1,"univalence":2,"prescription":${null},"specification":"每100粒重3g","manufacturer":"本溪仙草堂药业有限公司"}]}
...    AND    待收费订单列表    startDate=2016-05-03    endDate=2020-06-12    currentPage=    pageSize=50
...    AND    获取待收费订单详情    orderNo=${orderNo}
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# orderNo String  是   订单号
# orderExamListId long    是   检查单id 1497339528535
# orderPrescriptionIds    List[Long]  是   处方id集合
# orderAdditionAmtListId  long    是   附加费用单id
# actualAmt   double  是   实收金额
# recordVersion   Long    是   病历版本，来自详情接口返回值
# debtorsName String  否   欠款人
# debtorsPhone    String  否   欠款人联系方式
# debtAmt Double  否   欠款金额
# medicalInsurance    Double  否   医保支付金额
# commercialInsurance Double  否   商报支付金额



*** Variables ***
# 处方集合数组
# @{orderPrescriptionIds}        6805
*** Test Cases ***
5.1 收费
    [Documentation]    断言:"error=0"
    # ${orderPrescriptionIds}    Create List    ${orderPrescriptionId}
    # log    ${tempIds}
    ${getRes}    收费    orderNo=${orderNo}    orderExamListId=${orderExamListId}
    ...    orderPrescriptionIds=${orderPrescriptionIds}    payMode=3
    ...    orderAdditionAmtListId=    actualAmt=${receivableAmt}    recordVersion=${recordVersion}    debtorsName=
    ...    debtorsPhone=13810578454    debtAmt=0    medicalInsurance=0    commercialInsurance=
    Should Be Equal As Strings    ${getRes['head']['error']}    0



