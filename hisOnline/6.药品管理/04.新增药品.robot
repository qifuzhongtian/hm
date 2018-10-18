*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名	类型	是否必须	说明
# drugName	String	是	药品名称
# drugType	int	是	药品分类
# isOtc	int	否	是否OTC 1：是 0：否
# status	int	是	状态 1：启用 2：禁用  3：已删除
# customType	String	否	自定义分类
# drugBatchNo	String	否	药品批号
# expirationOptions	Integer	否	"效期选项  1年：365   2年：730   3年：1095 "
# approvalNumber	String	否	批准文号
# barCode	String	否	条形码
# singleDosage	String	否	单次剂量
# singleDosageUnit	String	否	单次剂量单位
# frequency	String	否	使用频次
# prescribeAmount	Int	否	开药量
# prescribeAmountUnit	String	否	开药量单位
# instruction	String	否	用法
# doctorAdvice	String	否	医嘱
# specification	String	是	规格包装描述
# specMinimumDosage	String	否	最小剂量 --废弃保留
# specMinimumUnit	String	否	最小单位 --废弃保留
# specUnit	String	是	规格单位
# specUnitaryRatio	Integer	是	换算比
# specPackageUnit	String	是	包装单位
# manufacturer	String	是	生产厂家
# purchasePrice	double	是	进货价
# prescriptionPrice	double	是	处方价
# inventoryCount	int	是	库存统计
# inventoryThreshold	int	否	库存阈值
# validityDate	String	否	有效期
# goodsShelfCode	String	否	货架码
# openStock	int	是	支持拆零
# supplier	String	否	供应商
*** Test Cases ***
2.1 新增药品
    [Documentation]    断言:"drugId=148304"
    ${getRes}    新增药品    drugName=${catenate}药品    drugType=2   isOtc=0
    ...    status=1    customType=自定义分类    drugBatchNo=${secs}    expirationOptions=
    ...    approvalNumber=国药准字Z22024464    barCode=    singleDosage=1    singleDosageUnit=粒
    ...    frequency=    prescribeAmount=    prescribeAmountUnit=盒
    ...    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=
    ...    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒
    ...    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98
    ...    inventoryCount=    inventoryThreshold=11    validityDate=4102329600000
    ...    goodsShelfCode=    openStock=0    supplier=
    Should Be Equal As Strings    ${getRes['head']['error']}    0



# 2.2 新增已存在的药品
#     [Documentation]    断言:"message=药品名称、包装规格描述、包装单位、厂家名称已存在，不能重复"
#     ${getRes}    新增药品    drugName=安胃片    drugType=2   isOtc=0
#     ...    status=1    customType=    drugBatchNo=    expirationOptions=
#     ...    approvalNumber=国药准字Z22024464    barCode=${secs}    singleDosage=1    singleDosageUnit=粒
#     ...    frequency=    prescribeAmount=    prescribeAmountUnit=盒
#     ...    instruction=口服    doctorAdvice=先煎    specification=片*36/盒    specMinimumDosage=
#     ...    specMinimumUnit=    specUnit=    specUnitaryRatio=    specPackageUnit=盒
#     ...    manufacturer=吉林省健今药业有限责任公司    purchasePrice=    prescriptionPrice=99.98
#     ...    inventoryCount=    inventoryThreshold=11    validityDate=
#     ...    goodsShelfCode=    openStock=0    supplier=
#     Should Be Equal As Strings    ${getRes['head']['message']}    药品名称、包装规格描述、包装单位、厂家名称已存在，不能重复
