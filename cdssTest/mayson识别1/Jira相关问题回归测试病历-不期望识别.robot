*** Settings ***
Test Template     识别接口_不识别
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
jira相关问题回归病历-不期望识别
    肾癌术后，血尿，肾脏肿块，乏力1周伴咳嗽咳痰    T1a期肾癌
