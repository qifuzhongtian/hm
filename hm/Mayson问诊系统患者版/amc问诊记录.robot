# *** Settings ***
# Suite Setup       Run Keywords    amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12
# ...               symptomName=体重问题（指南）    patientName=接口发    patientPhone=13810578454
# ...               AND    amc下一题    questionId=${292}    type=option    answer=1
# Suite Teardown    Delete All Sessions
# Resource          ../cdss.robot
# Library           Collections
# Library           RequestsLibrary

# *** Variables ***

# *** Test Cases ***
# amc问诊记录
#     # [Documentation]    amc/record_info
#     ${getRes}    amc问诊记录    number=${number}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0
