*** Settings ***
Suite Setup       amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12    symptomName=体重问题（指南）
...               patientName=接口自动发    patientPhone=13810578454
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***

*** Test Cases ***
amc下一题
    [Documentation]    cdss/amc/next_question?_hms=OWVjNDkwZWUtMTY1Ny00NDE5LTkwMTktMzFhMmZlYmU0ZjRk
    ${getRes}    amc下一题    questionId=${292}    type=option    answer=1
    Should Be Equal As Strings    ${getRes['head']['error']}    0
