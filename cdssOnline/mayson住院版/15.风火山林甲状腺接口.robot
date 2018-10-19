*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名 类型  是否必须    说明
# {
# 	"userGuid": "血",
# 	"serialNumber": "",
# 	"gender": 10,
# 	"age": 1
# }

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############风火山林甲状腺接口自动化评测#############

风火山林甲状腺case1
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}   风火山林甲状腺    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    gender=1    age=60
    ...    ageType=岁    examinationName=    examinationDesc=甲状腺低回声结节, 双叶甲状腺内见多个低回声结节，最大约（0.5）×（0.6）cm，内呈点状回声，结节周边无血管环绕。
    ...    examinationResult=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    甲状腺结节




风火山林甲状腺case2
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}   风火山林甲状腺    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    gender=1    age=57.8
    ...    ageType=岁    examinationName=甲状腺检查报告    examinationDesc=甲状腺左叶偏大，可触及多个结节，最大的直径（1.5）cm，质稍硬，光滑，随吞咽活动，无压痛。
    ...    examinationResult=双叶甲状腺内见多个低回声及实性结节，最大一个大小约（1.8）×（0.9）cm，结节周边有血管环绕。
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    甲状腺结节



