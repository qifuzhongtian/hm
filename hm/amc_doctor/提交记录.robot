*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
mayson问诊系统_提交记录
    [Documentation]    断言问诊结果:呕吐导致持续腹痛>4小时未缓解
    ${getRes}    提交记录    nodeId=1    algoId=38    seqId=63    age=8    ageType=岁
    ...    sex=89
    Should Be Equal As Strings    ${getRes['body']['conclusion']['c']['EXPL']}    头部严重受伤，导致出血，会引起头痛、呕吐。

