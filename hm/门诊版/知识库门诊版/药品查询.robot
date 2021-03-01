*** Settings ***
Suite Teardown    Delete All Sessions    # 字段名 类型 是否必须 说明    # drugName String 是 药品名称
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
药品查询,输入存在的药品名称,查询成功
    [Documentation]    cdss/hmsm/v_1_0/drug/search ,断言error:"drugCommonName=乌拉地尔氯化钠注射液"
    ${getRes}    药品查询    drugName=乌拉地尔氯化钠注射液
    Should Be Equal As Strings    ${getRes['body']['drugList'][0]['drugCommonName']}    乌拉地尔氯化钠注射液

输入拼音缩写,查询成功
    [Documentation]    断言error:"drugCommonName=乌拉地尔氯化钠注射液"
    ${getRes}    药品查询    drugName=wldelhnzsy
    Should Be Equal As Strings    ${getRes['body']['drugList'][0]['drugCommonName']}    乌拉地尔氯化钠注射液

商品名,查询成功
    [Documentation]    断言error:"drugCommonName=乌拉地尔氯化钠注射液"
    ${getRes}    药品查询    drugName=捷平
    Should Be Equal As Strings    ${getRes['body']['drugList'][0]['drugCommonName']}    乌拉地尔氯化钠注射液

商品名拼音,查询成功
    [Documentation]    断言error:"drugCommonName=乌拉地尔氯化钠注射液"
    ${getRes}    药品查询    drugName=jieping
    Should Be Equal As Strings    ${getRes['body']['drugList'][0]['drugCommonName']}    乌拉地尔氯化钠注射液

商品名简拼,查询成功
    [Documentation]    断言error:"drugCommonName=乌拉地尔氯化钠注射液"
    ${getRes}    药品查询    drugName=jp
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    乌拉地尔氯化钠注射液
