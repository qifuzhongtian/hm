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
# cdr患者统计singleDiseases
#     [Documentation]    :3025/patientsStatistics/singleDiseases
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    cdr患者统计singleDiseases    month=${1}    type=${2}  year=${2020}
#     Should Contain    ${getRes['msg']}    success




