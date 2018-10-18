*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
mayson问诊系统_历史搜索
    [Documentation]
    ${getRes}   历史搜索
    ${aj}    Evaluate    [aj['SYMP_NAME'] for aj in $getRes['body']['commonSymptom']]
    Should Contain    ${aj}    发热
    # Should Be Equal As Strings    ${getRes['body']['commonSymptom']['c']['EXPL']}    头部严重受伤，导致出血，会引起头痛、呕吐。

