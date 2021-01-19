*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
搜索肿瘤文献页
    [Documentation]    doc/seer/document/update_hot
    ############评估历史#############
    ${getRes}    搜索肿瘤文献页    name=    orgId=71    pageSize=${10}    contentType=-1    startDate=0
    ...    endDate=0    currentPage=${1}    countryId=0    orgName=    departmentId=${39}
    # ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['']]
    # Should Contain    ${aj}    治疗幽门螺杆菌对胃癌的预防作用
    Should Be Equal As Strings    ${getRes['head']['error']}    0


