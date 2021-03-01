*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
单病种填报保存
    [Documentation]         mayson/gc/report/save
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}   单病种填报保存      baseGroupId=6  branchGroupId=202   code=hm_crf_item_kb90zbs63jp
    ...     itemList=[]     recordId=${timestamp}${random}   reportStatus=1
    Should Be Equal As Strings   ${getRes['head']['error']}     0