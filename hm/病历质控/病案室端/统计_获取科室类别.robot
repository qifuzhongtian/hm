*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
统计_获取科室类别
    [Documentation]    :3021/tj/getTJDepartByCategory
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    统计_获取科室类别    order={"name": "inpatient_department","sort": "desc"}
    ...    type=day    date=2019-10-16
    Should Contain    ${getRes['msg']}    success



# 统计_获取科室类别_week
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    统计_获取科室类别    order={"name": "inpatient_department","sort": "desc"}
#     ...    type=week    date=2019-10-16
#     Should Contain    ${getRes['msg']}    success



# 统计_获取科室类别_month
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    统计_获取科室类别    order={"name": "inpatient_department","sort": "desc"}
#     ...    type=month    date=2019-10-16
#     Should Contain    ${getRes['msg']}    success



