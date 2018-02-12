*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# doctorGuid String 是 名称


*** Test Cases ***
8.1 mayson默认推荐搜索
    [Documentation]    查看默认推荐搜索词:包含流行性感冒
    ${getRes}    mayson默认推荐搜索    doctorGuid=1    department=儿科
    ${aj}    Evaluate    [aj['recommend'] for aj in $getRes['body'][0]['recommends']]
    Should Contain    ${aj}    脑出血
    # Should Be Equal As Strings    ${getRes['body'][0]['recommends'][0]['recommend']}    急性心肌梗死

