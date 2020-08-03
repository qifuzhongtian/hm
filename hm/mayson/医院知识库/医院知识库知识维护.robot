*** Settings ***
Suite Setup       医院知识库登录    name=privateTestingprivateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    type=0
Force Tags    skip
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
医院知识库知识维护
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    医院知识库知识维护
    Should Contain    ${getRes['msg']}    success

