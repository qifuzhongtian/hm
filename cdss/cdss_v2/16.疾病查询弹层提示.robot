*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# diseaseName String 是 疾病名称

*** Test Cases ***
15.1 疾病查询弹层提示
    [Documentation]    断言error:"diseaseName=病毒性上呼吸道感染(感冒)""
    ${getRes}    疾病查询弹层提示    diseaseName=感冒
    Should Be Equal As Strings    ${getRes['body']['diseaseList'][0]['diseaseName']}    病毒性上呼吸道感染(感冒)



