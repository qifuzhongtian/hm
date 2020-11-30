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
分项质控达标率
    [Documentation]     :3026/quality/getItemChart
    ${getRes}   肿瘤_分项达标  dept_nam=  dept_type=1  doctor_name=  end_time=2020-11-29  start_time=2020-11-01
    ...  sub_time_type=  time_type=1
    Should Contain  ${getRes['msg']}    success

分项患者完成状态-全部
    [Documentation]     :3026/quality/getItemList
    ${getRes}   肿瘤_分项患者列表  dept_name=  dept_type=1  doctor_name=  end_time=2020-11-29  start_time=2020-11-01
    ...  sub_time_type=  time_type=1  final_result=
    Should Contain  ${getRes['msg']}    success

分项患者完成状态-未完成
    [Documentation]     :3026/quality/getItemList
    ${getRes}   肿瘤_分项患者列表  dept_name=  dept_type=1  doctor_name=  end_time=2020-11-29  start_time=2020-11-01
    ...  sub_time_type=  time_type=1  final_result=未完成
    Should Contain  ${getRes['msg']}    success

分项患者完成状态-完成
    [Documentation]     :3026/quality/getItemList
    ${getRes}   肿瘤_分项患者列表  dept_name=  dept_type=1  doctor_name=  end_time=2020-11-29  start_time=2020-11-01
    ...  sub_time_type=  time_type=1  final_result=完成
    Should Contain  ${getRes['msg']}    success