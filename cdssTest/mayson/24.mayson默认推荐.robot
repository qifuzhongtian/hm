*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名 类型  是否必须    说明
# {
# 	"doctorGuid": "血",
# 	"department": "",
# 	"pageSize": 10,
# 	"currentPage": 1
# }

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***

mayson默认推荐
    [Documentation]    断言:""
    ${getRes}   mayson默认推荐    doctorGuid=1    department=儿科
    ${aj}    Evaluate    [aj['recommend'] for aj in $getRes['body'][0]['recommends']]
    Should Contain    ${aj}    2型糖尿病
    # Should Be Equal As Strings    ${getRes['head']['error']}    0

