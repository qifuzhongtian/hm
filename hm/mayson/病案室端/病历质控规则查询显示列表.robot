*** Settings ***
Force Tags    skip
Suite Setup       嵩山登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
病历质控规则查询显示列表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    病历质控规则查询显示列表    content=    filter_type=    category_id=    black_type=
    ...    order={"name": "black_render","sort": "asc"}    recommend_level=
    ...    current_index=${1}    page_size=${20}
    Should Contain    ${getRes['msg']}    success



