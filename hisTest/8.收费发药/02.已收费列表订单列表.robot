*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    获取日期
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
...    AND    新建病历接口    patientId=${patientId}
...    AND    保存病历    recordId=${recordId}    patientId=${patientId}    patientName=${secs}接口自动保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList={"isCharged":"0","prescription":${null},"patentDrugList":[{"drugId":"29087","drugName":"萃仙丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日2次(bid)","dosage":"1","dosageUnit":"粒","totalDosage":2,"totalDosageUnit":"盒","price":1,"univalence":2,"prescription":${null},"specification":"每100粒重3g","manufacturer":"本溪仙草堂药业有限公司"}]}
...    AND    待收费订单列表    startDate=2016-05-03    endDate=2020-06-12    currentPage=    pageSize=50
...    AND    获取待收费订单详情    orderNo=${orderNo}
...    AND    收费    orderNo=${orderNo}    orderExamListId=${orderExamListId}    orderPrescriptionIds=${orderPrescriptionIds}    payMode=3    orderAdditionAmtListId=    actualAmt=${receivableAmt}    recordVersion=${recordVersion}    debtorsName=    debtorsPhone=13810578454    debtAmt=0    medicalInsurance=0    commercialInsurance=
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library           DateTime

# 字段名 类型  是否必须    说明
# startDate   String  否   检索开始就诊日期，时间格式：yyyy-MM-dd
# endDate String  否   检索结束就诊日期，时间格式：yyyy-MM-dd
# patientName String  否   患者名称
# doctorId    Long    否   医生id
# currentPage int 否   页码，翻页时使用，默认从1开始
# pageSize    int 否   每页显示数
*** Test Cases ***
2.1 已收费列表订单列表
    [Documentation]    断言:"返回的 pageSize含有 阿莫西林片[益萨林] "
    ${getRes}    已收费列表订单列表    startDate=2013-05-03    endDate=${today}
    ...    patientName=    doctorId=    currentPage=    pageSize=50
    # ${aj}    Evaluate    [aj['patientName'] for aj in $getRes['body']['orders'][0]['patientName']]
    Should Contain    ${getRes['body']['orders'][0]['patientName']}    接口自动保存病例



