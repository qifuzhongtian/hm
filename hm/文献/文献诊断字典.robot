*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
文献诊断字典
    [Documentation]    doc/seer/document/disease_dict
    ${getRes}    文献诊断字典
    ${aj}    Evaluate    [aj['section'] for aj in $getRes['body']]
    Should Contain    ${aj}    心脏科
