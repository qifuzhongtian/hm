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
质控达标率/时间趋势
    [Documentation]     :3026/quality/getOverallChart
    ${getRes}   肿瘤_质控达标率  dept_name=  dept_type=1  doctor_name=  end_time=2020-11-29
    ...       query_type=1  start_time=2020-11-01  sub_time_type=  time_type=1  rules=
    Should Contain  ${getRes['msg']}    success

质控整体统计
    [Documentation]     :3026/quality/getOverallList
     ${getRes}   肿瘤_质控达标率  dept_name=  dept_type=1  doctor_name=  end_time=2020-11-29
    ...       query_type=1  start_time=2020-11-01  sub_time_type=  time_type=1  rules=
    Should Contain  ${getRes['msg']}    success     