*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
科室sug
    [Documentation]    断言error:"subject存在口腔科"
    ${getRes}    amcPc版_科室sug    subject=
    ${aj}    Evaluate    [aj for aj in $getRes['body']]
    Should Contain    ${aj}    急诊医学科
