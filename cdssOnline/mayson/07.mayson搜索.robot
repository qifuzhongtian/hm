*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# name String 是 名称


*** Test Cases ***
# 7.1 搜索评估表_中文
#     [Documentation]    搜索"出血",断言搜索结果包含评估表"出血危险分层"
#     # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
#     # ...    name=高血糖
#     ${getRes}    mayson搜索    name=出血    hasAssessType=true
#     ${aj}    Evaluate    [aj['assessType'] for aj in $getRes['body']['assessTypeList']]
#     Should Contain    ${aj}    出血危险分层

# 7.2 搜索评估表_全拼
#     [Documentation]    搜索"chuxue",断言搜索结果包含评估表"出血危险分层"
#     # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
#     # ...    name=高血糖
#     ${getRes}    mayson搜索    name=chuxue    hasAssessType=true
#     ${aj}    Evaluate    [aj['assessType'] for aj in $getRes['body']['assessTypeList']]
#     Should Contain    ${aj}    出血危险分层

# 7.3 搜索评估表_简拼
#     [Documentation]    搜索"cx",断言搜索结果包含评估表"出血危险分层"
#     # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
#     # ...    name=高血糖
#     ${getRes}    mayson搜索    name=cx    hasAssessType=true
#     ${aj}    Evaluate    [aj['assessType'] for aj in $getRes['body']['assessTypeList']]
#     Should Contain    ${aj}    出血危险分层


7.4 搜索药品
    [Documentation]    搜索"三金片",断言搜索结果包含药品"三金片"
    # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    mayson搜索    name=阿莫西林    hasAssessType=true
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿莫西林片

7.5 搜索诊断
    [Documentation]    搜索"心思梗死",断言搜索结果包含诊断"急性心肌梗死 "
    # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    mayson搜索    name=心肌梗死    hasAssessType=true
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    急性心肌梗死

