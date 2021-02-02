*** Settings ***
Suite Setup       神农登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
# 神农查看表结构
#     [Documentation]        :3028/model/getDetail
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    查看表结构    name=mt_patient_admission_record    table_id=4
#     Should Contain    ${getRes['msg']}    success

# 神农查看一致性数据质量
#     [Documentation]        :3028/quality/getDetail
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    查看数据质量    class_code=1    end_time=2020-11-29    project_code=06.01.6    project_unit_name=一般治疗记录    start_time=2020-11-23
#     Should Contain    ${getRes['msg']}    success

# 神农查看完整性数据质量
#     [Documentation]        :3028/quality/getDetail
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    查看数据质量    class_code=2    end_time=2020-11-29    project_code=06.01.6    project_unit_name=一般治疗记录    start_time=2020-11-23
#     Should Contain    ${getRes['msg']}    success

# 神农查看整合性数据质量
#     [Documentation]        :3028/quality/getDetail
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    查看数据质量    class_code=3    end_time=2020-11-29    project_code=06.01.6    project_unit_name=一般治疗记录    start_time=2020-11-23
#     Should Contain    ${getRes['msg']}    success

# 神农查看及时性数据质量
#     [Documentation]        :3028/quality/getDetail
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    查看数据质量    class_code=4    end_time=2020-11-29    project_code=06.01.6    project_unit_name=一般治疗记录    start_time=2020-11-23
#     Should Contain    ${getRes['msg']}    success

# 神农查看规则知识库
#     [Documentation]        :3028/review/getList
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    规则知识库    project_grade=1    role=
#     Should Contain    ${getRes['msg']}    success

# 神农查看数据地图
#     [Documentation]        :3028/model/getList
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    查看数据地图    current_index=${1}    name=    page_size=${20}
#     ${aj}    Evaluate    [aj['en_name'] for aj in $getRes['data']['list']]
#     Should Contain    ${aj}    mt_patient_admission_record

神农报告生成
    [Documentation]        :3028/review/getReport
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    报告生成    emr_grade=${1}    end_time=2020-11-29    start_time=2020-10-30
    Should Contain    ${getRes['msg']}    success

