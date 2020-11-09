*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
绿道_产品权限列表
    [Documentation]     :3022/manage/getProducts
    ${getRes}  绿道_产品权限列表    
    Should Contain    ${getRes['msg']}    success