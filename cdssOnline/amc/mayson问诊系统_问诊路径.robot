*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
mayson问诊系统_问诊路径
    [Documentation]    断言:""
    ${getRes}   问诊路径    symptomId=4    age=8    ageType=岁    sex=88    patientName=jackdaw    saveFlag=true
    ${aj}    Evaluate    [aj['nodeDesc'] for aj in $getRes['body']['result']]
    Should Contain    ${aj}    呕吐导致持续腹痛>4小时未缓解？
    # Should Be Equal As Strings    ${getRes['body']}    1


