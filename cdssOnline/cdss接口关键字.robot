*** Variables ***
${base_url}     http://apollo.huimeionline.com
# ${base_url}       http://10.117.64.153:8080
# ${base_url}     http://10.46.74.95:8080

#妇产科诊断性别_测试环境
${base_url_95}     http://10.46.74.95:9200
#妇产科诊断性别_线上环境
${base_url_72}     http://10.252.128.72:9200
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A
${Huimei_id_safe_medication}      C3B844493A477BCF3D7B73A5E902B269

#amc管理端
${base_url_amca}     http://amca.huimeionline.com


*** Keywords ***
################安全用药################
安全用药
    [Arguments]    ${drugCommonNames}    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}    ${confirmDiagnosis}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugCommonNames=${drugCommonNames}    gender=${gender}    age=${age}    ageType=${ageType}    drugIds=${drugIds}    symptom=${symptom}
    ...    confirmDiagnosis=${confirmDiagnosis}
    ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


药品查询
    [Arguments]    ${drugName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


查询药品与诊断
    [Arguments]    ${name}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    name=${name}
    ${addr}    Post Request    api    v_2_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

药品详情
    [Arguments]    ${drugId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugId=${drugId}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


诊断依据
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/basis    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}






随机字符-1
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    ${arg1}    set variable    1111111
    [Return]    ${arg1}

# 常见症状
#     [Arguments]    ${slice}    ${msg}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary
#     ${addr}    Post Request    api    v_2_0/common_symptom    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # ${str}    Get From Dictionary    ${responsedata}    head
#     # ${str1}    Get From Dictionary    ${str}    error
#     # Should Be Equal As Strings    ${str1}    ${msg}
#     Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
#     Delete All Sessions


常见症状
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



常见诊断
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_diseases    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    [Return]    ${responsedata}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions


常见个人史
    [Arguments]    ${gender}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}
    ${addr}    Post Request    api    v_2_0/common_personal_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

常见过敏史
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_allergy_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


常见家族史
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_family_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


常见体格检查
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_physical    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    [Return]    ${responsedata}


常见症状和类型
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom_obj    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    [Return]    ${responsedata}


鉴别诊断
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/suspected_diagnosis    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

疾病详情
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

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
    [Return]    ${responsedata}

梅奥疾病详情
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/mayo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

疾病处置详细
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/treatment    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

相关疾病
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/reference    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

疾病查询弹层提示
    [Arguments]    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_0/disease/popup    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

智能诊断0
    [Arguments]    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}
    ...    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}
    ...    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    # ${responsedata}    To Json    ${addr.content}
    # ${con}    Get Dict List    ${responsedata['body']}    suspectedDiseases
    # List Should Contain Value    ${con}    ${responsedata${slice}}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    Should Contain    ${addr.text}    ${msg}
    Delete All Sessions

智能诊断
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    log    ${aj}
    log    ${aj[:3]}
    Should Contain    ${aj}    ${msg}
    # Should Contain    ${aj[:15]}    ${msg}
    Delete All Sessions
    # 测试一下
    # ${ajson}    Evaluate    {"api": "api.name","v": "1.0","code": "10000","error_msg": "success","data": {"userlist": [{"uid": "94901","nickName": "test1",}, {"uid": "1010640","nickName": "test2",}, {"uid": "1012130","nickName": "test3",}]}}
    # log    ${ajson['data']['userlist'][0]['nickName']}
    # ${nicks}    Evaluate    [nicks['nickName'] for nicks $ajson['data']['userlist']]



智能诊断2.2
    [Arguments]    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    # log    ${aj}
    # log    ${aj[:3]}
    # Should Contain    ${aj}    ${msg}
    # Should Contain    ${aj[:15]}    ${msg}
    Delete All Sessions
    # 测试一下
    # ${ajson}    Evaluate    {"api": "api.name","v": "1.0","code": "10000","error_msg": "success","data": {"userlist": [{"uid": "94901","nickName": "test1",}, {"uid": "1010640","nickName": "test2",}, {"uid": "1012130","nickName": "test3",}]}}
    # log    ${ajson['data']['userlist'][0]['nickName']}
    # ${nicks}    Evaluate    [nicks['nickName'] for nicks $ajson['data']['userlist']]



智能诊断top5
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    log    ${aj}
    log    ${aj[:5]}
    # Run Keyword If
    Should Contain    ${aj[:5]}    ${msg}
    # Should Contain    ${aj[:15]}    ${msg}
    Delete All Sessions

智能诊断top6
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    log    ${aj}
    log    ${aj[:6]}
    # Run Keyword If
    Should Contain    ${aj[:5]}    ${msg}
    # Should Contain    ${aj[:15]}    ${msg}
    Delete All Sessions

智能诊断前top15
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    log    ${aj}
    log    ${aj[:3]}
    # Run Keyword If
    Should Contain    ${aj}    ${msg}
    # Should Contain    ${aj[:15]}    ${msg}
    Delete All Sessions
    # 测试一下
    # ${ajson}    Evaluate    {"api": "api.name","v": "1.0","code": "10000","error_msg": "success","data": {"userlist": [{"uid": "94901","nickName": "test1",}, {"uid": "1010640","nickName": "test2",}, {"uid": "1012130","nickName": "test3",}]}}
    # log    ${ajson['data']['userlist'][0]['nickName']}
    # ${nicks}    Evaluate    [nicks['nickName'] for nicks $ajson['data']['userlist']]

# 智能诊断1
#     [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
#     ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
#     ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
#     ...    ${presentHistory}
#     # ...    ${examItems}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
#     ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
#     ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
#     # ...    examItems[]=${examItems}
#     ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
#     log    ${aj[:3]}
#     Should Contain    ${aj[:3]}    ${msg}
#     Delete All Sessions
#     # 测试一下
#     # ${ajson}    Evaluate    {"api": "api.name","v": "1.0","code": "10000","error_msg": "success","data": {"userlist": [{"uid": "94901","nickName": "test1",}, {"uid": "1010640","nickName": "test2",}, {"uid": "1012130","nickName": "test3",}]}}
#     # log    ${ajson['data']['userlist'][0]['nickName']}
#     # ${nicks}    Evaluate    [nicks['nickName'] for nicks $ajson['data']['userlist']]



# 智能诊断2.33
#     [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
#     ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
#     ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
#     ...    ${presentHistory}
#     # ...    ${examItems}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
#     ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
#     ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
#     # ...    examItems[]=${examItems}
#     ${addr}    Post Request    api    v_2_3/diagnose_through_interrogation    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     log    ${aj[:3]}
#     Should Contain    ${aj}    ${msg}
#     # Should Contain    ${aj[:15]}    ${msg}
#     Delete All Sessions

智能诊断2.3
    [Arguments]    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_2_3/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

# his
    # log    ${responsedata['body']['suspectedDiseases'][0]}
    # log    ${responsedata['body']['suspectedDiseases'][0]['id']}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Delete All Sessions
    # 疾病详情2
    #    [Arguments]    ${msg}    ${diseaseId}
    #    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    Create Session    api    ${base_url}    ${dict}
    #    ${data}    Create Dictionary    diseaseId=${diseaseId}
    #    ${addr}    Post Request    api    v_2_0/disease/detail    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    log    ${addr.content}
    #    log    ${responsedata}
    #    # ${str}    Get From Dictionary    ${responsedata}    head
    #    Should Be Equal As Strings    ${responsedata['head']['message']}    ${msg}
    #    # log    ${responsedata['head']['message']}
    #    Delete All Sessions
病例识别
    [Arguments]    ${symptom}    ${gender}    ${age}    ${ageType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    gender=${gender}    age=${age}   ageType=${ageType}
    ${addr}    Post Request    api    /recognize    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

疾病查询
    [Arguments]    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_0/disease/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

随机字符-2
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    [Return]    ${arg1}    ${arg2}

随机字符-3
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    [Return]    ${arg1}

test
    [Arguments]    ${symptom}
    [Documentation]    主诉:腰痛、下肢疼痛、尿潴留,出现'腰椎间盘突出症'.期望诊断结果返回的diseaseName含有'腰椎间盘突出症'
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://apollo.huimeionline.com    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap[]=    presentHistory=
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $responsedata['body']['suspectedDiseases']]
    #Should Contain    ${aj}    null
    #Should Not Be Empty    ${aj}
    Should Be Empty    ${aj}


妇产科诊断性别
    [Arguments]    ${query}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_72}    ${dict}
    ${object}    Set Variable    {"bool":{"must":[{"term":{"department":"妇产科"}}],"filter":{"bool":{"should":[{"term":{"gender":0}},{"term":{"gender":1}}]}}}}
    ${query}    Evaluate    dict(${object})
    ${data}    Create Dictionary    query=${query}
    ${addr}    Post Request    api    /disease/disease/_search?_source=false    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


########amc管理后台######

amc管理端_用户登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amca}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    node/user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_症状sug
    [Arguments]    ${symptomName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_amca}    ${dict}
    ${params}    Create Dictionary    symptomName=${symptomName}
    ${addr}    Get Request    api    node/amcRecord/amcSymptomQuerySug    params=${params}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_科室sug
    [Arguments]    ${subject}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_amca}    ${dict}
    ${params}    Create Dictionary    subject=${subject}
    ${addr}    Get Request    api    node/amcRecord/subjectQuerySug    params=${params}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_问诊症状统计
    [Arguments]
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    node/amcRecord/tAmcRecordQuerySymptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_问诊科室统计
    [Arguments]
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    node/amcRecord/tAmcRecordQuerySubject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_问诊记录列表
    [Arguments]    ${recordStart}    ${recordEnd}    ${symptom}    ${patient_gender}    ${subject}    ${index}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    recordStart=${recordStart}    recordEnd=${recordEnd}    symptom=${symptom}    patient_gender=${patient_gender}    subject=${subject}    index=${index}
    ...    pageSize=${pageSize}
    ${addr}    Post Request    api    node/amcRecord/tAmcRecordQueryList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${id}    Get From Dictionary    ${responsedata['body']['rows'][0]}    id
    Set Global Variable    ${id}
    [Return]    ${responsedata}


amc管理端_问诊记录列表详情
    [Arguments]    ${id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    node/amcRecord/tAmcRecordQueryDetial    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


amc进入
    [Arguments]    ${AlgoID}    ${age}    ${ageStyle}    ${gender}    ${symptomId}    ${patientName}    ${patientPhone}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    AlgoID=${AlgoID}    age=${age}    ageStyle=${ageStyle}    gender=${gender}    symptomId=${symptomId}    patientName=${patientName}    patientPhone=${patientPhone}
    ${addr}    Post Request    api    amc/exam_enter    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    ${hms}    Get From Dictionary    ${responsedata['head']}    _hms
    Set Global Variable    ${hms}
    log    ${hms}
    [Return]    ${responsedata}

amc下一题
    [Arguments]    ${incoming_ids}    ${question}    ${answers}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${object}    Set Variable    {"NODE_ID": 292}
    ${question}    Evaluate    dict(${object})
    ${answers}    Evaluate    [${answers}]
    ${data}    Create Dictionary    incoming_ids=${incoming_ids}    question=${question}    answers=${answers}
    ${addr}    Post Request    api    amc/next_question?_hms=${hms}    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


