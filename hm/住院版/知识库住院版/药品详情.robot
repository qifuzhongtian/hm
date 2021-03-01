*** Settings ***
Suite Teardown    Delete All Sessions    # 字段名 类型 是否必须 说明    # drugId String 是 药品ID
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
药品详情
    [Documentation]    hmsm/v_1_0/drug/detai,断言error:"docName=阿司匹林片"
    ${getRes}    药品详情    drugId=1CD441A2C3
    Should Be Equal As Strings    ${getRes['body']['docName']}    阿司匹林口服常释剂型
