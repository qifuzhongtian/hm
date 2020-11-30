*** Settings ***
Suite Setup       肿瘤平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
患者列表
    [Documentation]    :3026/check/getList
    ${getRes}    肿瘤_患者列表    time_start=2020-08-01    time_end=2020-08-30
    Should Contain    ${getRes['msg']}    success

患者稽查表
    [Documentation]     :3026/check/getPatientCheckInfo
    ${getRes}   肿瘤_患者稽查表  recordId=111
    Should Contain    ${getRes['msg']}    success

患者稽查得分项
    [Documentation]     :3026/check/getPatientSocoreItem
    ${getRes}   肿瘤_患者稽查得分项  recordId=111
    Should Contain    ${getRes['msg']}    success   

患者科室列表
    [Documentation]     :3026/check/getDepartments
    ${getRes}   肿瘤_患者科室列表  dept_name=  dept_type=
    Should Contain    ${getRes['msg']}    success 

稽查得分项
    [Documentation]     :3026/check/getScoreItems
    ${getRes}   肿瘤_稽查得分项  
    Should Contain     ${getRes['msg']}    success
