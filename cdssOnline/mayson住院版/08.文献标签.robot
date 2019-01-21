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

文献标签
    [Documentation]
    ${getRes}   文献标签
    ${aj}    Evaluate    [aj['name'] for aj in $getRes['body']['1']]
    Should Contain    ${aj}    消化科
    # Should Be Equal As Strings    ${getRes['head']['error']}    0







