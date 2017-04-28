*** Variables ***
${base_url}     http://apollo.huimeionline.com
# ${base_url}     http://10.117.64.153:8080
# ${base_url}       http://192.168.2.7:8080
#彭宇开发环境huimeiId
${Huimei_id}      C3B844493A477BCF3D7B73A5E902B269
#吕医生Huimei_id
# ${Huimei_id}      8FBAB76D49264016BEA5651093B00DD9

*** Keywords ***
安全用药
    [Arguments]    ${slice}    ${msg}    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}    ${confirmDiagnosis}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}    age=${age}    ageType=${ageType}
    ...    drugIds=${drugIds}    symptom=${symptom}    confirmDiagnosis=${confirmDiagnosis}
    ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}

药品查询
    [Arguments]    ${slice}    ${msg}    ${drugName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}


查询药品与诊断
    [Arguments]    ${slice}    ${msg}    ${name}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    name=${name}
    ${addr}    Post Request    api    v_2_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}


药品详情
    [Arguments]    ${slice}    ${msg}    ${drugId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugId=${drugId}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}

# 安全用药1
#     [Arguments]    ${msg}    ${gender}    ${age}    ${ageType}    ${symptom}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    gender=${gender}    age=${age}    ageType=${ageType}
#     ...    drugIds=${drugIds}    symptom=${symptom}
#     ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     ${str}    Get From Dictionary    ${responsedata}    head
#     ${str1}    Get From Dictionary    ${str}    error
#     Should Be Equal As Strings    ${str1}    ${msg}



# 安全用药
#     [Arguments]    ${msg}    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    gender=${gender}    age=${age}    ageType=${ageType}    ${drugIds}    symptom=${symptom}
#     ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     ${str}    Get From Dictionary    ${responsedata}    head
#     ${str1}    Get From Dictionary    ${str}    error
#     Should Be Equal As Strings    ${str1}    ${msg}
