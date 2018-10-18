*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
...    AND    新建病历接口    patientId=${patientId}
...    AND    保存病历    recordId=${recordId}    patientId=${patientId}    patientName=${secs}接口自动保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList={"isCharged":"0","prescription":${null},"patentDrugList":[{"drugId":"29087","drugName":"萃仙丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日2次(bid)","dosage":"1","dosageUnit":"粒","totalDosage":2,"totalDosageUnit":"盒","price":1,"univalence":2,"prescription":${null},"specification":"每100粒重3g","manufacturer":"本溪仙草堂药业有限公司"}]}
...    AND    待收费订单列表    startDate=2016-05-03    endDate=2020-06-12    currentPage=    pageSize=50
...    AND    获取待收费订单详情    orderNo=${orderNo}
...    AND    收费    orderNo=${orderNo}    orderExamListId=${orderExamListId}    orderPrescriptionIds=${orderPrescriptionIds}    payMode=3    orderAdditionAmtListId=    actualAmt=${receivableAmt}    recordVersion=${recordVersion}    debtorsName=    debtorsPhone=13810578454    debtAmt=0    medicalInsurance=0    commercialInsurance=
...    AND    获取已收费列表订单详情    orderNo=${orderNo}
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名	类型	是否必须	说明
# orderNo	String	是	订单号
# orderExamList	Object	否	选择的检查单号
#   orderExamListId	long	是	检查单id
#   orderExams	List	是	检查项集合
#      itemId	Long	是	检查项id
#      count	Int	是	退货数量
# orderPrescriptions	List[object]	否	选择的处方单号id集合
#   orderPrescriptionId	long	是	处方id
#   presciptionType	int	是	处方类型：1：西药处方，2：中药处方
#   orderDrugs	List	是	药品集合
#     itemId	Long	是	药品id
#     count	Int	是	退货数量 （中药处方，按剂数 退货）
# orderAdditionAmtList	Object	否	附加费用单号
#   orderAdditionAmtListId	long	是	附加费用单id
#   orderAdditionAmtIds	List[Long]	是	附加费用id
# sellDrugRecord	Object	否	直接售药记录
#   sellDrugRecordId	Long	是	直接售药记录的id
#   ordeDrugs	List[long]	是	药品Id集合
#     itemId	Long	是	药品id
#     count	Int	是	退货数量
# balanceId	Long	否	欠款单id
# debtAmt	Double	否	欠款金额
# refundAmt	double	是	实退金额


# {
# 	"refundAmt": "6.00",
# 	"balanceId": null,
# 	"debtAmt": 0,
# 	"recordVersion": "1498811540876",
# 	"orderAdditionAmtList": null,
# 	"orderExamList": {
# 		"orderExamListId": "7113",
# 		"orderExams": [{
# 			"itemId": "4169",
# 			"count": "1"
# 		}]
# 	},
# 	"orderPrescriptions": [{
# 		"orderPrescriptionId": "7114",
# 		"presciptionType": "1",
# 		"orderDrugs": [{
# 			"itemId": "13345",
# 			"count": "2"
# 		}, {
# 			"itemId": "13346",
# 			"count": "1"
# 		}]
# 	}],
# 	"sellDrugRecord": null,
# 	"orderNo": "67420170630163220098",
# 	"payMode": "1"
# }


*** Variables ***

*** Test Cases ***
5.1 退费
    [Documentation]    断言:"grade=2"
    # ${orderPrescriptionIds}    Create List    ${orderPrescriptionId}
    ${getRes}    退费    orderNo=${orderNo}
    # ...    orderExamList={"orderExamListId":"7113","orderExams":[{"itemId":"4169","count":"1"}]}
    ...    orderExamList={"orderExamListId":${orderExamListId},"orderExams":[{"itemId":${examItemId},"count":${examCount}}]}
    # ...    orderExamListId=${orderExamListId}
    ...    orderPrescriptions={"orderPrescriptionId": ${orderPrescriptionId},"presciptionType": "1","orderDrugs": [{"itemId": ${prescriptionItemId},"count": ${prescriptionCount}}]}
    ...    balanceId=${null}
    ...    refundAmt=${actualAmt}
    # ...    orderPrescriptionIds=111
    ...    recordVersion=${recordVersion}
    ...    debtAmt=0
    ...    payMode=3
    Should Be Equal As Strings    ${getRes['head']['error']}    0
