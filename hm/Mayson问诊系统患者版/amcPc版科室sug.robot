# *** Settings ***
# Suite Teardown    Delete All Sessions
# Resource          ../cdss.robot
# Library           Collections
# Library           RequestsLibrary

# *** Test Cases ***
# 科室sug
#     [Documentation]    apollo/amc/query_subject
#     ${getRes}    amcPc版_科室sug    subject=
#     ${aj}    Evaluate    [aj for aj in $getRes['body']]
#     Should Contain    ${aj}    急诊医学科
