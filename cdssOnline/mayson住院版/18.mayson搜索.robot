*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# name String 是 名称


*** Test Cases ***
搜索诊断
    [Documentation]    断言:""
    ${getRes}    mayson搜索    hasAssessType=${true}    name=血压
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    高血压

搜索药品简拼
    [Documentation]    name=aspl,断言:"阿司匹林片"
    ${getRes}    mayson搜索    hasAssessType=${true}    name=aspl
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

搜索药品名称
    [Documentation]    name=阿司匹林片 断言:""阿司匹林片
    ${getRes}    mayson搜索    hasAssessType=${true}    name=阿司匹林片
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片


搜索通用名
    [Documentation]    name=阿司匹林片 断言:"阿司匹林片"
    ${getRes}    mayson搜索    hasAssessType=${true}    name=阿司匹林片
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

搜索药品商品名
    [Documentation]    name=捷平 乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=捷平
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液


搜索商品名拼音,查询成功
    [Documentation]    name=jieping 商品名=乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=jieping
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液

搜索商品名简拼,查询成功
    [Documentation]    name简拼=jp 断言商品名=乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=jp
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液

常用exin简拼,查询成功
    [Documentation]    name简拼=exin 断言商品名=乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=exin
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    恶性肿瘤


搜索评估表,查询成功
    [Documentation]    搜索GRACE评分评估表
    ${getRes}    mayson搜索    hasAssessType=${true}    name=GRACE
    ${aj}    Evaluate    [aj['assessType'] for aj in $getRes['body']['assessTypeList']]
    Should Contain    ${aj}    GRACE评分


搜索检验检查,查询成功
    [Documentation]    搜索血脂检查
    ${getRes}    mayson搜索    hasAssessType=${true}    name=血脂
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examInfo']]
    Should Contain    ${aj}    血脂检查


