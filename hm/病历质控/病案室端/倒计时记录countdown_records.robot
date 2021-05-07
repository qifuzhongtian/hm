*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           Collections
Library           DateTime

*** Variables ***

*** Test Cases ***
倒计时记录countdown_records
    [Documentation]    :3021/mc/countdown_records
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    倒计时记录countdown_records    admissionArea=
    ...    admissionDepartment=
    ...    attendingDoctor=true
    ...    currentPage=${1}    endAdmissionDate=2021-05-07    pageSize=${20}    startAdmissionDate=2021-04-30    order={"name":"入院时间","sort":"desc"}
    # Should Contain    ${getRes['head']['error']}    0
    Should Be Equal As Strings    ${getRes['head']['error']}    0

