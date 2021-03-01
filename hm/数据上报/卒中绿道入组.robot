*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../cdss.robot    # Force Tags    skip
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
卒中绿道入组
    [Documentation]         mayson/green_channel/report/info/group/join
     [Setup]    Run Keywords    获取时间戳
     ...    AND    获取随机数
     ${getRes}  卒中绿道入组  items={"record_id":"${random}","group_id":"1","group_name":"脑卒中数据填报","report_id":"1","report_name":"卒中静脉溶栓治疗"}
     Should Be Equal As Strings   ${getRes['head']['error']}     0