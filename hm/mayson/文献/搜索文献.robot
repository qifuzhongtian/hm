*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
搜索文献
    [Documentation]    doc/seer/document/update_hot
    ############评估历史#############
    ${getRes}    搜索文献    name=幽门螺杆菌    diseaseId=    pageSize=10    currentPage=1    startDate=0
    ...    endDate=0    departmentId=0    countryId=0    orgName=
    ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    Should Contain    ${aj}    治疗幽门螺杆菌对胃癌的预防作用
    # Should Be Equal As Strings    ${getRes['head']['error']}    0

按筛选文献搜索
    [Documentation]    doc/seer/document/update_hot
    ${getRes}    搜索文献    name=血    diseaseId=    pageSize=10    currentPage=1    startDate=2017
    ...    endDate=2018    departmentId=1    countryId=0    orgName=中国
    ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    Should Contain    ${aj}    非甾体消炎药相关消化道溃疡与溃疡并发症的预防与治疗规范建议
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
