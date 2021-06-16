*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../cdss.robot    # Force Tags    skip
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种恢复入组
    [Documentation]         /mayson/gc/report/restore
     [Setup]    Run Keywords    获取时间戳
     ...    AND    获取随机数
     ${getRes}    单病种恢复入组    baseGroupId=5    branchGroupId=201    recordIds=${random}
    Should Be Equal As Strings   ${getRes['head']['error']}     0