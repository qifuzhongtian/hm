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

搜索文献
    [Documentation]    断言:""
    ${getRes}   搜索文献    name=血    diseaseId=    pageSize=10    currentPage=1
    ...    startDate=0    endDate=0    departmentId=0    countryId=0    orgName=
    ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    Should Contain    ${aj}    脑出血后脑血流低灌注的临床研究进展
    # Should Be Equal As Strings    ${getRes['head']['error']}    0

按筛选文献搜索
    [Documentation]    断言:""
    ${getRes}   搜索文献    name=血    diseaseId=    pageSize=10    currentPage=1
    ...    startDate=2017    endDate=2018    departmentId=1    countryId=12    orgName=中国
    ${aj}    Evaluate    [aj['cnTitle'] for aj in $getRes['body']['documentList']]
    Should Contain    ${aj}    非甾体消炎药相关消化道溃疡与溃疡并发症的预防与治疗规范建议
    # Should Be Equal As Strings    ${getRes['head']['error']}    0

