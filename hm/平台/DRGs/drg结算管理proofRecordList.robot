*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

drg结算管理proofRecordList
    [Documentation]    :3027/st/proofRecordList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg结算管理proofRecordList    discharge_department=骨一科    month=2020-06    profit_status=    proof_status=    current_index=${1}    page_size=${20}
    ...    order={"name":"display_id","sort":"asc"}
    Should Contain    ${getRes['msg']}    success

