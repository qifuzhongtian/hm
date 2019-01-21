*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions
*** Test Cases ***
疾病处置详细
    [Documentation]    断言error:"acId=3868"
    ${getRes}    疾病处置详细    diseaseId=8457C0ACE01
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']]
    # Should Contain    ${aj}     处置建议
