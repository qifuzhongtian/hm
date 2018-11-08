*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

# *** Test Cases ***
# mayson问诊系统_问诊路径
#     [Documentation]    断言:""
#     ${getRes}   问诊路径    symptomId=4    age=8    ageType=岁    sex=88    patientName=jackdaw    saveFlag=true
#     ${aj}    Evaluate    [aj['nodeDesc'] for aj in $getRes['body']['result']]
#     Should Contain    ${aj}    体重轻微减轻（10周内＜4kg）？
#     # Should Be Equal As Strings    ${getRes['body']}    1



# 问诊路径
#     [Arguments]    ${symptomId}    ${age}    ${ageType}    ${sex}    ${patientName}    ${saveFlag}    ${algoIdList}    ${seqIdList}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_his}
#     Create Session    api    ${mayson_url}    ${dict}
#     ${algoIdList}    Create List    ${algoIdList}
#     ${seqIdList}    Create List    ${seqIdList}
#     # Create Session    api    ${mayson_url}    ${dict}
#     ${data}    Create Dictionary    symptomId=${symptomId}    age=${age}    ageType=${ageType}    sex=${sex}    patientName=${patientName}    saveFlag=${saveFlag}
#     ${addr}    Post Request    api    /amc/node_tree    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     [Return]    ${responsedata}

