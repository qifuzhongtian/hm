*** Settings ***
Suite Setup       drg绩效登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

drgQueryDict
    [Documentation]    :3034/st/statementResultList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drgQueryDict    doctor_group=false    drgs_no=false    doctor=${false}    dep=${true}
    Should Contain    ${getRes['msg']}    success





