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
# cdr病历管理_患者统计列表
#     [Documentation]    :3025/patientsStatistics/list
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    cdr病历管理_患者统计列表    type=2020-09    year=${1}    month=${20}
#     Should Contain    ${getRes['msg']}    success



