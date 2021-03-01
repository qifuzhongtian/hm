*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
疾病处置详细
    [Documentation]    v_2_0/disease/treatment,断言error:"acId=3868"
    ${getRes}    疾病处置详细    diseaseId=8457C0ACE01
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']]
    # Should Contain    ${aj}    处置建议


