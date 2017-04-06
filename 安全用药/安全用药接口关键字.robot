*** Variables ***
${base_url}       http://apollo.huimeionline.com/
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A
# ${base_url_common}    http://test2.common.wmiweb.com/v1
# ${base_url_base}    http://doctor-dev.api.wmiweb.com/
# ${base_url_gy}    http://60.205.93.39
# U-TOKEN 医生 U-TOKEN-A 患者    U-TOKEN-b 医助
# ${U-TOKEN}      DDDDDD
# ${U-TOKEN-A}    PPPPPP
# ${U-TOKEN-B}    AAAAAA
# ${app-type}     999
# ${device-code}    163FE899-3267-43B1-9465-82B5ADC712DA
# ${timestamp}    123456789
# ${sign}         c54533230ee50db2cff7c7d6226d5aa1
# ${version}      1.0

*** Keywords ***

安全用药
    [Arguments]    ${msg}    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}    age=${age}    ageType=${ageType}    drugIds=${drugIds}    symptom=${symptom}
    ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${str}    Get From Dictionary    ${responsedata}    head
    ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${str1}    ${msg}



药品查询
    [Arguments]    ${msg}    ${drugName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/search                data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${str}    Get From Dictionary    ${responsedata}    head
    ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${str1}    ${msg}



查询药品与诊断
    [Arguments]    ${msg}    ${name}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    name=${name}
    ${addr}    Post Request    api    hmsm/v_1_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${str}    Get From Dictionary    ${responsedata}    head
    ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${str1}    ${msg}





药品详情
    [Arguments]    ${msg}    ${drugId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugId=${drugId}
    ${addr}    Post Request    api    hmsm/v_1_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${str}    Get From Dictionary    ${responsedata}    head
    ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${str1}    ${msg}














