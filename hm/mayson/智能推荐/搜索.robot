*** Settings ***
Suite Teardown    Delete All Sessions    # 字段名 类型 是否必须 说明    # name String 是 名称
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
搜索诊断
    [Documentation]    cdss/v_2_0/search/all 断言:"高血压"
    ${getRes}    mayson搜索    hasAssessType=${true}    name=血压
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    高血压

搜索药品简拼
    [Documentation]    cdss/v_2_0/search/all,name=aspl,断言:"阿司匹林片"
    ${getRes}    mayson搜索    hasAssessType=${true}    name=aspl
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

搜索药品名称
    [Documentation]    cdss/v_2_0/search/all,name=阿司匹林片 断言:""阿司匹林片
    ${getRes}    mayson搜索    hasAssessType=${true}    name=阿司匹林片
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

搜索通用名
    [Documentation]    name=阿司匹林片 断言:"阿司匹林片"
    ${getRes}    mayson搜索    hasAssessType=${true}    name=阿司匹林片
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    阿司匹林片

搜索药品商品名
    [Documentation]    cdss/v_2_0/search/all,name=捷平 乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=捷平
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液

搜索商品名拼音
    [Documentation]    cdss/v_2_0/search/all,name=jieping 商品名=乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=jieping
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液

搜索商品名简拼
    [Documentation]    cdss/v_2_0/search/all,name简拼=jp 断言商品名=乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=jp
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液

用简拼搜索
    [Documentation]    cdss/v_2_0/search/all,name简拼=exin 断言商品名=乌拉地尔氯化钠注射液
    ${getRes}    mayson搜索    hasAssessType=${true}    name=exin
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseList']]
    Should Contain    ${aj}    恶性肿瘤

搜索评估表
    [Documentation]    cdss/v_2_0/search/all,搜索GRACE评分评估表
    ${getRes}    mayson搜索    hasAssessType=${true}    name=GRACE
    ${aj}    Evaluate    [aj['assessType'] for aj in $getRes['body']['assessTypeList']]
    Should Contain    ${aj}    GRACE评分

搜索检验检查
    [Documentation]    搜索血脂检查
    ${getRes}    mayson搜索    hasAssessType=${true}    name=血脂
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examInfo']]
    Should Contain    ${aj}    血脂检查



# 搜索数据填报
#     [Documentation]    搜索
#     ${getRes}    mayson搜索    hasAssessType=${true}    name=脑卒中
#     ${aj}    Evaluate    [aj['Name'] for aj in $getRes['body']['green_channel']['channels']]
#     Should Contain    ${aj}    血脂检查





