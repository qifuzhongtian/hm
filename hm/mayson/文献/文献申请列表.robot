*** Settings ***
Suite Setup       申请文献    documentName=测试申请文献    applyOrg=测试文献内容    applySection=测试文献来源    applyMessage=测试文献科室
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
文献申请列表
    ${getRes}    文献申请列表    pageSize=100    currentPage=1
    ${aj}    Evaluate    [aj['documentName'] for aj in $getRes['body']['customerList']]
    Should Contain    ${aj}    测试申请文献
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
