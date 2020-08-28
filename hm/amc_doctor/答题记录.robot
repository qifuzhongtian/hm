*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
mayson问诊系统_答题记录
    [Documentation]    断言问诊结果:呕吐导致持续腹痛>4小时未缓解
    ${getRes}    答题记录    nodeId=1    algoIdList=14    seqIdList=3    symptomIdList=1    algoId=38
    ...    seqId=3    age=8    ageType=岁    sex=88
    # ${aj}    Evaluate    [aj['nodeDesc'] for aj in $getRes['body']['result']]
    # Should Contain    ${aj}    呕吐导致持续腹痛>4小时未缓解
    Should Be Equal As Strings    ${getRes['body']['recordResult']}    发热；皮疹伴发热
