*** Settings ***
Suite Setup       肿瘤平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
患者列表
    ${getRes}    肿瘤_患者列表    time_start=2020-08-01    time_end=2020-08-30
    Should Contain    ${getRes['msg']}    success

患者稽查表
    ${getRes}    肿瘤_患者稽查表    recordId=11111
    Should Contain    ${getRes['msg']}    success

稽查评分
    ${getRes}    肿瘤_患者保存    recordId=11111
    Should Contain    ${getRes['msg']}    success
