
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

sampleItemList
    [Documentation]    :3034/sample/sampleItemList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    sampleItemList    sample_id=36    mdc_no=    content=${1}    current_index=${20}    page_size=${20}
    ...    order={"name":"mdc_name","sort":"asc"}
    Should Contain    ${getRes['msg']}    success

