*** Settings ***
Test Template     识别接口_年龄
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
jira相关问题回归病历-年龄相关
    患者，男，20天，主要症状黄疸，诊断高胆红素血症    20    天    新生儿高胆红素血症
