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
# 问诊记录添加备注
#     # [Documentation]    断言:"error=0 成功"
#     ${getRes}    问诊记录添加备注    number=${number}    recordRemark=接口加备注
#     Should Be Equal As Strings    ${getRes['head']['error']}    0
