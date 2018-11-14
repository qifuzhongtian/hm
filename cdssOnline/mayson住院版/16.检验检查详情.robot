*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名 类型  是否必须    说明
# {
# 	"examId": "血",
# 	"serialNumber": "",
# 	"gender": 10,
# 	"age": 1
# }

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############检验检查详情接口自动化评测#############

检验检查详情
    [Documentation]    断言:""615
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}   检验检查详情    examId=111039
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['catalogueList']]
    Should Contain    ${aj}    甲状腺激素

