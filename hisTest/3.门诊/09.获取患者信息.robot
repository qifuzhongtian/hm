*** Settings ***
Suite Setup       Run Keywords    登录接口
...    AND    医生病患列表    接口自动保存病例    ${empty}    1    50
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型    是否必须    说明    # patientConditions    String    否
# 字段名	类型	是否必须	说明
# patientId	Long	是	患者ID
*** Test Cases ***
9.1 获取患者信息
    [Documentation]    断言:""
    ${getRes}    获取患者信息    patientId=${patientId}
    Should Be Equal As Strings    ${getRes['body']['patientName']}    接口自动保存病例



# 新建病历接口
#     [Arguments]    ${patientId}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     # Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    patientId=${patientId}
#     ${addr}    Post Request    api    his/outpatient/newRecord    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
#     # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
#     # Delete All Sessions
#     ${recordId}    Get From Dictionary    ${responsedata["body"]}    recordId
#     Set Global Variable    ${recordId}
#     # Return From Keyword    ${recordId}
#     # ${str}    Get From Dictionary    ${responsedata}    head
#     # $response["body"]["recordId"]
#     # 先转换成json    然后 ${response["body"]["recordId"]}
#     # ${diagnosis}    evaluate    [${diagnosis}]
