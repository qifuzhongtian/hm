*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名 类型  是否必须    说明


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############评估历史#############

文献详情
    [Documentation]
    ${getRes}   文献详情    documentId=9410C674FE
    # ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    # Should Contain    ${aj}    脑出血急性期血压管理新进展
    Should Be Equal As Strings    ${getRes['body']['cnTitle']}    脑出血急性期血压管理新进展
