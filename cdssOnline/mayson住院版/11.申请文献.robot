*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


申请文献
    [Documentation]
    ${getRes}   申请文献    documentName=测试申请文献    applyOrg=测试文献内容    applySection=测试文献来源    applyMessage=测试文献科室
    # ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    # Should Contain    ${aj}    脑出血后脑血流低灌注的临床研究进展
    Should Be Equal As Strings    ${getRes['body']}    1

