*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# name String 是 名称


*** Test Cases ***
3.1 查询药品与诊断
    [Documentation]    断言:""
    # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=血压
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    高血压

3.2 输入拼音缩写,查询成功
    [Documentation]    name=aspl,断言:"阿司匹林片"
    # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=aspl
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

3.3 药品查询,输入存在的药品名称,查询成功
    [Documentation]    name=阿司匹林片 断言:""阿司匹林片
    # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=阿司匹林片
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

# 3.4 输入拼音缩写,查询成功
#     [Documentation]    name=阿司匹林简拼 'asplp' 断言:""
#     # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
#     # ...    name=高血糖
#     ${getRes}    查询药品与诊断    name=asplp
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
#     Should Contain    ${aj}    阿司匹林片

3.5 通用名,查询成功
    [Documentation]    name=阿司匹林片 断言:"阿司匹林片"
    # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=阿司匹林片
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

3.6 商品名,查询成功
    [Documentation]    name=捷平 乌拉地尔氯化钠注射液
    # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=捷平
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液


3.7 商品名拼音,查询成功
    [Documentation]    name=jieping 商品名=乌拉地尔氯化钠注射液
    # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=jieping
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液

3.8 商品名简拼,查询成功
    [Documentation]    name简拼=jp 断言商品名=乌拉地尔氯化钠注射液
    # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=jp
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液



3.8 常用exin简拼,查询成功
    [Documentation]    name简拼=exin 断言商品名=乌拉地尔氯化钠注射液
    # 查询药品与诊断    ['body']['drugList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=exin
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    恶性肿瘤

