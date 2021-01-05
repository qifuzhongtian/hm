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
# cdr患者统计singleDiseasesList
#     [Documentation]    :3025/patientsStatistics/singleDiseasesList
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    cdr患者统计singleDiseasesList    type=2    year=${1}    month=${20}    disease_code=144
#     Should Contain    ${getRes['msg']}    success



