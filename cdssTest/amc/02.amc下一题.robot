*** Settings ***
Suite Setup    amc进入    AlgoID=2959    age=44    ageStyle=岁    gender=88    symptomId=8    patientName=接口发    patientPhone=13810578454
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型  说明
# {
#     "incoming_ids": 2959,
#     "question": "26",
#     "answers": "岁",
#     "gender": 88,
#     "symptomId": 8,
#     "patientName": "咳嗽患者",
#     "patientPhone": "13810578456"
# }

*** Variables ***

*** Test Cases ***
1.2 amc下一题
   # [Documentation]    断言:"error=0 成功"
    ${getRes}    amc下一题    incoming_ids=13    question={"NODE_ID": 292}    answers={"index": 1,"value": 1}
    Should Be Equal As Strings    ${getRes['head']['error']}    0

