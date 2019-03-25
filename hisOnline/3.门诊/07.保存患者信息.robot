*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# patientId   Long    否   患者ID，新增患者时为空，修改患者信息时为非空
# patientName String  是   患者名称
# gender  String  是   性别取值为：男/女
# age Long    是   年龄
# ageType String  是   年/月/日
# idCardNo    String  否   身份证号码
# phoneNo Long    否   电话号码
# linkman String  否   联系人
# linkmanPhone    String  否   联系人电话
# comment String  否   备注
# address String  否   地址
# occupation  String  否   职业

*** Test Cases ***
7.1 保存患者信息
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    保存患者信息    patientId=    patientName=接口自动保存病例    gender=1
    ...    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333
    ...    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
    Should Be Equal As Strings    ${getRes['head']['error']}    0


# 7.2 修改患者信息
#     [Documentation]    断言:"error=0保存成功"
#     ${getRes}    保存患者信息    patientId=53202    patientName=接口自动保存病改    gender=1
#     ...    age=50    ageType=天    idCardNo=110221199901015859    phoneNo=15333333333
#     ...    linkman=紧急联系人项改    linkmanPhone=1354444444    comment=备注项改    address=地址项改    occupation=职业项改
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

