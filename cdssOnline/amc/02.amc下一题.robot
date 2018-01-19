*** Settings ***
Suite Setup    amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12    symptomName=体重问题（指南）    patientName=接口自动发    patientPhone=13810578454
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
*** Variables ***
*** Test Cases ***
# 1.2 amc下一题
#    # [Documentation]    断言:"error=0 成功"
#     ${getRes}    amc下一题    incoming_ids=13    question={"NODE_ID": 292}    answers={"index": 1,"value": 1}
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

1.3 amc下一题
   # [Documentation]    断言:"error=0 成功"
    # ${answer}    Create List    1
    ${getRes}    amc下一题    questionId=${292}    type=option     answer=1
    Should Be Equal As Strings    ${getRes['head']['error']}    0