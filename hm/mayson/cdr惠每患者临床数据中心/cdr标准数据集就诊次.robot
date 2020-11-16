*** Settings ***
Suite Setup       cdr登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
cdr标准数据集就诊次
    [Documentation]    :3025/dataSet/patientDataSetList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    cdr标准数据集就诊次    admissionDateStart=2020-08-18    admissionDateEnd=2020-11-16    visitDepartment=    diseaseName=    operationName=    datasetId=    pageSize=${20}    currentPage=${1}
    Should Be Equal As Strings    ${getRes['head']['error']}    0


