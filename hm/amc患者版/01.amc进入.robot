*** Settings ***
Resource          ../cdss.robot    # Suite Setup    登录接口    # Suite Teardown    Delete All Sessions
Library           Collections
Library           RequestsLibrary    # 字段名 类型    说明    # {    #    "AlgoID": 2959,    #
...               # "age": "26",    #    "ageStyle": "岁",    #    "gender": 88,    #    "symptomId": 8,
...               #    "patientName": "咳嗽患者",    #    "patientPhone": "13810578456"    # }

*** Variables ***

*** Test Cases ***
1.1 amc进入
    # [Documentation]    断言:"error=0 成功"
    ${getRes}    amc进入    AlgoID=2960    age=26    ageStyle=岁    gender=88    symptomId=12
    ...    symptomName=体重问题（指南）    patientName=接口发    patientPhone=13810578454
    Should Be Equal As Strings    ${getRes['head']['error']}    0
