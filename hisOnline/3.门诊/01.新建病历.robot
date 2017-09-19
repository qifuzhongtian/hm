*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名	类型	是否必须	说明
# patientId	Long	否	没有患者id时可为空
# *** Test Cases ***
# 1.1 新建病历
#     [Documentation]    断言:""
#     ${getRes}    新建病历    patientId=${patientId}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0
