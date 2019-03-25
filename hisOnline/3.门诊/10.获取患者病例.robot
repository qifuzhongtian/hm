*** Settings ***
Suite Setup       Run Keywords    登录接口
...    AND    医生病患列表    接口自动保存病例    ${empty}    1    50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型    是否必须    说明    # patientConditions    String    否
# 字段名	类型	是否必须	说明
# patientId	Long	是	患者ID
*** Test Cases ***
10.1 获取患者病例
    [Documentation]    断言:""
    ${getRes}    获取患者信息    patientId=${patientId}
    Should Be Equal As Strings    ${getRes['body']['patientName']}    接口自动保存病例




