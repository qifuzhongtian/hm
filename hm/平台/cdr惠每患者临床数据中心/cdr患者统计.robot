# *** Settings ***
# Suite Setup       cdr登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
# Suite Teardown    Delete All Sessions
# Resource          ../../cdss.robot
# Library           Collections
# Library           RequestsLibrary
# Library           String
# Library           DateTime

# *** Variables ***

# *** Test Cases ***
# cdr患者统计
#     [Documentation]    :3025/patientsStatistics/figureHome
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    cdr患者统计    type=2   year=${2020}    month=${5}    figureType=${1}    id=1
#     Should Contain    ${getRes['msg']}    success

