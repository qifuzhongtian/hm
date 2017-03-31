*** Variables ***
${base_url}       http://apollo.huimeionline.com/v_2_0
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
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A

*** Keywords ***
疾病详情2
    [Arguments]    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    # log    ${data}
    ${addr}    Post Request    api    disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${addr.content}
    log    ${responsedata}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # Should Be Equal As Strings    ${responsedata['head']['message']}    ${msg}
    # log    ${responsedata['head']['message']}
    Delete All Sessions

疾病详情
    [Arguments]    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    # diseaseId=${diseaseId}
    ${addr}    Post Request    api    disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${str}    Get From Dictionary    ${responsedata}    head
    ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${str1}    ${msg}
    Delete All Sessions

疾病详情1
    [Arguments]    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    # diseaseId=${diseaseId}
    ${addr}    Post Request    api    disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${str}    Get From Dictionary    ${responsedata}    head
    ${str1}    Get From Dictionary    ${str}    message
    Should Be Equal As Strings    ${str1}    ${msg}
    Delete All Sessions
