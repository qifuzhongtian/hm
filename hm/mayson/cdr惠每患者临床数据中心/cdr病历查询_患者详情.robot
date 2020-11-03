# *** Settings ***
# Suite Setup       cdr登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
# Suite Teardown    Delete All Sessions
# Resource          ../../cdss.robot
# Library           Collections
# Library           RequestsLibrary
# Library           String
# Library           DateTime

# *** Variables ***

# *** Test Cases ***
# cdr病历查询_患者详情
#     [Documentation]    :3025/medicalRecords/details
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    cdr病历查询_患者详情    visitType=1    customerId=1001    recordId=33325    type=1
#     Should Contain    ${getRes['msg']}    success

