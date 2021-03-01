*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

结算病例分析drgsRecordAnalysisList
    [Documentation]    :3027/drgs/drgsRecordAnalysisList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    结算病例分析drgsRecordAnalysisList    time_start=2020-09    department=    mdc_no=    time_end=2020-09    drgs_no=    dead_risk=    query_num=    doctor_name=     order={"name":"settlement_date","sort":"desc"}
    Should Contain    ${getRes['msg']}    success




# 结算病例分析drgsRecordAnalysisList
#     [Arguments]    ${time_start}    ${mdc_no}    ${department}    ${time_end}    ${drgs_no}    ${dead_risk}    ${query_num}    ${doctor_name}    ${order}
#     ${order}    Evaluate    dict(${order})
#     ${data}    Create Dictionary    time_start=${time_start}    mdc_no=${mdc_no}    department=${department}    drgs_no=${drgs_no}    dead_risk=${dead_risk}    query_num=${query_num}    doctor_name=${doctor_name}    order=${order}
#     ...    time_end=${time_end}
#     ${addr}    Post Request    api    /drgs/drgsRecordAnalysisList    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     log    ${data}
#     [Return]    ${responsedata}

