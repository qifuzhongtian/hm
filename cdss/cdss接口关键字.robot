*** Variables ***
# ${base_url}       http://apollo.huimeionline.com
${base_url}       http://10.117.64.153:8080
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
常见症状
    [Arguments]    ${slice}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions


常见诊断
    [Arguments]    ${slice}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_diseases    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions



常见个人史
    [Arguments]    ${slice}    ${msg}    ${gender}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}
    ${addr}    Post Request    api    v_2_0/common_personal_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions



常见过敏史
    [Arguments]    ${slice}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_allergy_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions



常见家族史
    [Arguments]    ${slice}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_family_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions





常见体格检查
    [Arguments]    ${slice}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_physical    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions


常见症状和类型
    [Arguments]    ${slice}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom_obj    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions




辅助问诊
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}
    ...    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}
    ${addr}    Post Request    api    v_2_0/assist_inquiry    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}




鉴别诊断
    [Arguments]    ${slice}    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/suspected_diagnosis    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions




疾病详情
    [Arguments]    ${slice}    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions






疾病详情2
    [Arguments]    ${slice}    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${addr.content}
    log    ${responsedata}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # Should Be Equal As Strings    ${responsedata['head']['message']}    ${msg}
    # log    ${responsedata['head']['message']}
    Delete All Sessions





梅奥疾病详情
    [Arguments]    ${slice}    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/mayo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions



疾病处置详细
    [Arguments]    ${slice}    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/treatment    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions




相关疾病
    [Arguments]    ${slice}    ${msg}    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/reference    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions


疾病查询弹层提示
    [Arguments]    ${slice}    ${msg}    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_0/disease/popup    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions






智能诊断
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}
    ...    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${con}    Get Dict List    ${responsedata['body']}    suspectedDiseases
    List Should Contain Value    ${con}    ${responsedata${slice}}    ${msg}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions


智能诊断2.2
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}
    ...    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions



智能诊断2.3
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}
    ...    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions




智能诊断_数字指标
    [Arguments]    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}
    ...    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_0/diagnose_through_interrogation    data=${data}
his    # log    ${responsedata['body']['suspectedDiseases'][0]}
    # log    ${responsedata['body']['suspectedDiseases'][0]['id']}
    Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${str1}    ${msg}
    Delete All Sessions



# 智能诊断_数字指标1
#     [Arguments]    ${str1}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
#     ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}
#     # ...    ${examItems}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}
#     ...    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}
#     # ...    examItems[]=${examItems}
#     ${addr}    Post Request    api    v_2_0/diagnose_through_interrogation    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # log    ${responsedata['body']['suspectedDiseases'][0]}
#     # log    ${responsedata['body']['suspectedDiseases'][0]['id']}
#     # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
#     # ${str}    Get From Dictionary    ${responsedata}    body
#     # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
#     Should Be Equal As Strings    responsedata=${responsedata}    ${msg}
#     # Should Be Equal As Strings    ${str['suspectedDiseases'][0]['id']}    ${msg}
#     # Should Be Equal As Strings    ${str1}    ${msg}

# 疾病详情2
#     [Arguments]    ${msg}    ${diseaseId}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    diseaseId=${diseaseId}
#     ${addr}    Post Request    api    v_2_0/disease/detail    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     log    ${addr.content}
#     log    ${responsedata}
#     # ${str}    Get From Dictionary    ${responsedata}    head
#     Should Be Equal As Strings    ${responsedata['head']['message']}    ${msg}
#     # log    ${responsedata['head']['message']}
#     Delete All Sessions






疾病查询
    [Arguments]    ${slice}    ${msg}    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_0/disease/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Delete All Sessions






