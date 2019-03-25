*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名   类型  是否必须    说明
# cnName    String  否   名称
# type  Integer 是   类型

# 类型ID  类型名称
# 1 成药用法
# 2 用药频率
# 3 用药单位
# 4 包装单位
# 5 最小单位
# 6 饮片用法
# 7 服用要求
# 8 规格单位

*** Test Cases ***
12.1 成药用法type=1,显示正确
    [Documentation]    type=1
    ${getRes}    字典sug    cnName=    type=1
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    口服

12.2 用药频率type=2,显示正确
    [Documentation]    type=2
    ${getRes}    字典sug    cnName=    type=2
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    1日1次(qd)


12.3 用药单位 type=3,显示正确
    [Documentation]    type=3
    ${getRes}    字典sug    cnName=    type=3
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    片


12.4 包装单位 type=4,显示正确
    [Documentation]    type=4
    ${getRes}    字典sug    cnName=    type=4
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    盒


12.5 最小单位 type=5,显示正确
    [Documentation]    type=5
    ${getRes}    字典sug    cnName=    type=5
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    ug

12.6 饮片用法 type=6,显示正确
    [Documentation]    type=6
    ${getRes}    字典sug    cnName=    type=6
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    口服


12.7 服用要求 type=7,显示正确
    [Documentation]    type=7
    ${getRes}    字典sug    cnName=    type=7
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    水煎400ml；分早晚两次空腹温服



12.8 规格单位 type=8,显示正确
    [Documentation]    type=8
    ${getRes}    字典sug    cnName=    type=8
    ${aj}    Evaluate    [aj['cnName'] for aj in $getRes['body']['dictList']]
    # log    ${aj}
    Should Contain    ${aj}    片
