*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名 类型  是否必须    说明
# {
# 	"name": "血",
# 	"diseaseId": "",
# 	"pageSize": 10,
# 	"currentPage": 1
# }

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############评估历史#############

最新文献
    [Documentation]    断言:""
    ${getRes}   最新文献
    ${aj}    Evaluate    [aj for aj in $getRes['body']['searchDiagnose']]
    Should Contain    ${aj}    心肌病
    # Should Be Equal As Strings    ${getRes['head']['error']}    0



