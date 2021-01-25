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

结算病例分析drgsRecordAnalysisOverAll
    [Documentation]    :3027/drgs/drgsRecordAnalysisOverAll
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    结算病例分析drgsRecordAnalysisOverAll    time_start=2020-09    current_index=${1}    page_size=${20}    department=    mdc_no=    time_end=2020-09    drgs_no=    dead_risk=    query_num=    doctor_name=     order={"name":"settlement_date","sort":"desc"}
    Should Contain    ${getRes['msg']}    success




