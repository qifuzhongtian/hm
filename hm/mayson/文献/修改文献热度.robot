*** Settings ***
Suite Setup       文献申请列表    pageSize=100    currentPage=1
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
修改文献热度
    ${getRes}    修改文献热度    id=${id}
    # ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    # Should Contain    ${aj}    脑出血后脑血流低灌注的临床研究进展
    Should Be Equal As Strings    ${getRes['body']}    1
