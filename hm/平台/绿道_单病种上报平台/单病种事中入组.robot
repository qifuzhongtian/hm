*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot    # Force Tags    skip
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种事中入组
    [Documentation]         mayson/gc/join
     [Setup]    Run Keywords    获取时间戳
     ...    AND    获取随机数
     ${getRes}  单病种事中提醒入组  joinGroupData={"recordId":"${random}","customerId":"1219","customerEnv":"1","joinGroup":[{"baseGroupId":"8","branchGroupName":"脑梗死(首次住院)数据上报","branchGroupId":"204"}]}
     Should Be Equal As Strings   ${getRes['head']['error']}     0    