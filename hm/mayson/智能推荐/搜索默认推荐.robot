*** Settings ***
Suite Teardown    Delete All Sessions    # 字段名 类型 是否必须 说明    # doctorGuid String 是 名称
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
mayson默认推荐搜索
    [Documentation]    cdss/mayson/track/default_recommend
    ${getRes}    mayson默认推荐搜索    doctorGuid=1    department=
    # ${aj}    Evaluate    [aj['recommend'] for aj in $getRes['body'][0]['recommends']]
    # Should Contain    ${getRes['head']['error']}    0
    Should Be Equal As Strings    ${getRes['head']['error']}    0
