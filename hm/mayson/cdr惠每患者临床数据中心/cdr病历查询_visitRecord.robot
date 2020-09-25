*** Settings ***
Suite Setup       cdr登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
cdr病历查询_visitRecord
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    cdr病历查询_visitRecord    customerId=1001    recordId=333229    visitType=1
    Should Be Equal As Strings    ${getRes['head']['error']}    0
