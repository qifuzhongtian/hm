*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

drg样本数据查看
    [Documentation]    :3027/sample/sampleItemList
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    drg样本数据查看    sample_id=${21}    mdc_no=    page_size=${20}    current_index=${1}    content=
    ...    order={"name":"mdc_name","sort":"asc"}
    Should Contain    ${getRes['msg']}    success




