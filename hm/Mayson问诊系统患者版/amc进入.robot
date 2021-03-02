# *** Settings ***
# Resource          ../cdss.robot
# Library           Collections
# Library           RequestsLibrary
# *** Variables ***

# *** Test Cases ***
# amc进入
#     # [Documentation]    cdss/amc/exam_enter
#     ${getRes}    amc进入    AlgoID=2960    age=26    ageStyle=岁    gender=88    symptomId=12
#     ...    symptomName=体重问题（指南）    patientName=接口发    patientPhone=13810578454
#     Should Be Equal As Strings    ${getRes['head']['error']}    0
