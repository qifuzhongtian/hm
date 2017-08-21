
*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String
# 字段名	类型	是否必须	说明
# id	Long	否	模板id，非必填，如果有id则更新，没有则新增
# tempName	String	是	处方名称
# tempType	Integer	是	西药处方类型： 2
# tempAuthority	Int	是	处方类模板必填，模板权限类型: 1:个人处方模板     2：诊所处方模板
# linkId	Long	否	处方ID
# patentPrescriptionList
# patentDrugList	List		成药处方药物列表
#     drugId	Long		药物ID
#     drugName	String		药物名称
#     dataSource	Integer		药物来源
#     assId	Long		组号
#     usage	String		用法
#     frequency	String		用药频率
#     dosage	Double		单次剂量值
#     dosageUnit	String		单次剂量单位
#     totalDosage	Object		开药量
#     totalDosageUnit	Double 		开药量单位

*** Test Cases ***
10.1 保存西药成药处方模板-个人
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    保存西药成药处方模板    id=    tempName=${catenate}成药处方模板_个人    tempType=2
    ...    tempAuthority=1
    ...    linkId=
    ...    patentPrescriptionList=
    Should Be Equal As Strings    ${getRes['head']['error']}    0

10.2 保存西药成药处方模板-诊所
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    保存西药成药处方模板    id=    tempName=${catenate}成药处方模板_诊所    tempType=2
    ...    tempAuthority=2
    ...    linkId=
    ...    patentPrescriptionList=
    Should Be Equal As Strings    ${getRes['head']['error']}    0




# {
#     "id": "",
#     "tempName": "成药处方",
#     "tempType": 2,
#     "linkId": null,
#     "patentPrescriptionList": [{
#         "patentDrugList": [{
#             "assId": "",
#             "dataSource": "0",
#             "dosage": "1",
#             "dosageUnit": "袋",
#             "drugId": "148308",
#             "drugName": "白蚀丸",
#             "frequency": "隔日1次(qod)",
#             "totalDosage": "1",
#             "totalDosageUnit": "盒",
#             "usage": "口服",
#             "specification": "30.0g/瓶*1/盒",
#             "manufacturer": "广州白云山中一药业有限公司"
#         }, {
#             "assId": "",
#             "dataSource": "0",
#             "dosage": "",
#             "dosageUnit": "",
#             "drugId": "148335",
#             "drugName": "强肝丸",
#             "frequency": "",
#             "totalDosage": "1",
#             "totalDosageUnit": "盒",
#             "usage": "",
#             "specification": "丸*10/盒",
#             "manufacturer": "西安自力中药集团有限公司"
#         }]
#     }]
# }

