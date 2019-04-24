*** Variables ***
#mayson生产环境
${mayson_url}     http://mayson.huimeionline.com/cdss
#apollo生产环境
# ${base_url}     http://apollo.huimeionline.com
# ${base_url}     http://10.165.102.219:8080
${base_url}       http://mayson.huimeionline.com/cdss
#文献生产环境
${doc_url}        http://doc.huimeionline.com/doc
#ame生产环境
${base_url_ame}    http://10.46.74.95:8092
${base_url_sf}    http://10.27.213.55:9092
#fuxi验证接口
${fuxi_data}      http://fuxi.huimeionline.com/node/active/
#adminse
${adminse}        http://admin-se.huimeionline.com/
######################apollo######################
#apollo测试环境
# ${base_url}     http://10.117.64.153:8080
#apollo预发环境
# ${base_url}     http://pretest-apollo.huimeionline.com
#apolloPD环境
# ${base_url}     http://pd-apollo.huimeionline.com
######################mayson######################
#maysonPD环境
# ${mayson_url}    http://pd-mayson.huimeionline.com/cdss
#maysonDev环境
# ${mayson_url}    http://dev-mayson.huimeionline.com/cdss
#mayson测试环境
# ${mayson_url}    http://test-mayson.huimeionline.com/cdss
# ${mayson_url}    http://profile.huimeionline.com/cdss
# ${mayson_profile}    http://test-profile.huimeionline.com/cdss
${mayson_profile}    http://profile.huimeionline.com/cdss
#mayson预发环境
# ${mayson_url}    http://pretest-mayson.huimeionline.com/cdss
######################文献######################
#文献测试环境
# ${doc_url}      http://test-doc.huimeionline.com/
######################ovf模板地址######################
# ${mayson_url}    http://192.168.1.13/cdss
# ${base_url}     http://192.168.1.13/cdss
${null}           null
#####线上识别接口地址 http://10.165.102.219:8080/v_3_0/recognize
#妇产科诊断性别_测试环境
${base_url_95}    http://10.46.74.95:9200
#妇产科诊断性别_线上环境
${base_url_219}    http://10.165.102.219:9200
#宏利号
${Huimei_id}      7195F12825788F09375C2DB1E922F108
#亚心id
${Huimei_id2}     831ECD7EBA1EDBCE677AC9DB679DF815
${Huimei_his}     01217002C571E1622927516DB4A1C803
${Huimei_id_safe_medication}    7195F12825788F09375C2DB1E922F108
###建德
${Huimei_id_jd}    C3E74C229156E6B31534E946BCDEBA94
#his
${Huimei_id_his}    D7928B9182ABF6E0A6A6EBB71B353585
##宣武医院
${Huimei_id_xw}    8C946583A4EE9174D7B2D1697066BFA2
#amcPc版
${base_url_amc}    http://amc.huimeionline.com
${doc_fe}         http://doc.huimeionline.com

*** Keywords ***
获取时间戳
    ${timestamp}    Get Time    epoch
    Set Global Variable    ${timestamp}

获取随机数
    ${random}    Generate Random String    3    1234567890
    Set Global Variable    ${random}
    ################安全用药################

安全用药
    [Arguments]    ${drugCommonNames}    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}
    ...    ${confirmDiagnosis}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugCommonNames=${drugCommonNames}    gender=${gender}    age=${age}    ageType=${ageType}    drugIds=${drugIds}
    ...    symptom=${symptom}    confirmDiagnosis=${confirmDiagnosis}
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
    [Arguments]    ${hasAssessType}    ${name}
    ${true}    Set Variable    ${true}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    hasAssessType=${hasAssessType}    name=${name}
    ${addr}    Post Request    api    v_2_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

药品详情
    [Arguments]    ${drugId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
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
    # 常见症状
    #    [Arguments]    ${slice}    ${msg}
    #    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    Create Session    api    ${base_url}    ${dict}
    #    ${data}    Create Dictionary
    #    ${addr}    Post Request    api    v_2_0/common_symptom    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    # ${str}    Get From Dictionary    ${responsedata}    head
    #    # ${str1}    Get From Dictionary    ${str}    error
    #    # Should Be Equal As Strings    ${str1}    ${msg}
    #    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    #    Delete All Sessions
    [Return]    ${responsedata}

常见症状
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

常见诊断
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_diseases    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

常见个人史
    [Arguments]    ${gender}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}
    ${addr}    Post Request    api    v_2_0/common_personal_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

常见过敏史
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_allergy_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

常见家族史
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_family_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

常见体格检查
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_physical    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    [Return]    ${responsedata}

常见症状和类型
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
    Create Session    api    ${mayson_url}    ${dict}
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
    Create Session    api    ${mayson_url}    ${dict}
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
    Create Session    api    ${mayson_url}    ${dict}
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
    Create Session    api    ${mayson_url}    ${dict}
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

智能诊断2.0
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
    ${addr}    Post Request    api    v_2_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    log    ${aj}
    log    ${aj[:3]}
    Should Contain    ${aj}    ${msg}
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
    Delete All Sessions

智能诊断2.2
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
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    # log    ${aj}
    # log    ${aj[:3]}
    # Should Contain    ${aj}    ${msg}
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
    Delete All Sessions

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
    # Delete All Sessions
    [Return]    ${responsedata}

病例识别
    [Arguments]    ${symptom}    ${gender}    ${age}    ${ageType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    gender=${gender}    age=${age}    ageType=${ageType}
    ${addr}    Post Request    api    /recognize    data=${data}
    ${responsedata}    To Json    ${addr.content}
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
    Create Session    api    ${base_url_219}    ${dict}
    ${object}    Set Variable    {"bool":{"must":[{"term":{"department":"妇产科"}}],"filter":{"bool":{"should":[{"term":{"gender":0}},{"term":{"gender":1}}]}}}}
    ${query}    Evaluate    dict(${object})
    ${data}    Create Dictionary    query=${query}
    ${addr}    Post Request    api    /disease/disease/_search?_source=false    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Delete All Sessions
    # 妇产科诊断性别1
    #    [Arguments]    ${query}    ${department}
    #    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    Create Session    api    ${base_url_95}    ${dict}
    #    ${object}    Set Variable    {"bool":{"must":[{"term":{"department":"${department}"}}],"filter":{"bool":{"should":[{"term":{"gender":0}},{"term":{"gender":1}}]}}}}
    #    ${query}    Evaluate    dict(${object})
    #    ${data}    Create Dictionary    query=${query}
    #    ${addr}    Post Request    api    /disease/disease/_search?_source=false    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #
    #    # Delete All Sessions
    #    [Return]    ${responsedata}
    ################################
    ########慢病##########
    ################################
    [Return]    ${responsedata}

查询常用药品
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    ncds/v_1_0/open/routine/medicine    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询病种列表
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    ncds/v_1_0/open/disease    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询病种下药品信息
    [Arguments]    ${id}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    ncds/v_1_0/open/disease/medicine    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    ########amc管理后台######
    [Return]    ${responsedata}

amcPc版_用户登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amca}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    /user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amcPc版_症状sug
    [Arguments]    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amc}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}
    ${addr}    Post Request    api    apollo/amc/symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amcPc版_科室sug
    [Arguments]    ${subject}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amc}    ${dict}
    ${data}    Create Dictionary    subject=${subject}
    ${addr}    Post Request    api    /apollo/amc/query_subject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amcPc版_问诊症状统计
    [Arguments]    ${currentPage}    ${pageSize}    ${countmode}    ${userGuid}    ${doctorGuid}    ${doctorName}
    ...    ${hospitalGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amc}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    pageSize=${pageSize}    countmode=${countmode}    userGuid=${userGuid}    doctorGuid=${doctorGuid}
    ...    doctorName=${doctorName}    hospitalGuid=${hospitalGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /apollo/amc/static_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amcPc版_问诊科室统计
    [Arguments]    ${currentPage}    ${pageSize}    ${countmode}    ${userGuid}    ${doctorGuid}    ${doctorName}
    ...    ${hospitalGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amc}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    pageSize=${pageSize}    countmode=${countmode}    userGuid=${userGuid}    doctorGuid=${doctorGuid}
    ...    doctorName=${doctorName}    hospitalGuid=${hospitalGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /apollo/amc/static_subject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amcPc版_问诊记录列表
    [Arguments]    ${currentPage}    ${pageSize}    ${countmode}    ${userGuid}    ${doctorGuid}    ${doctorName}
    ...    ${hospitalGuid}    ${serialNumber}    ${recordStart}    ${recordEnd}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amc}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    pageSize=${pageSize}    countmode=${countmode}    userGuid=${userGuid}    doctorGuid=${doctorGuid}
    ...    doctorName=${doctorName}    hospitalGuid=${hospitalGuid}    serialNumber=${serialNumber}    recordStart=${recordStart}    recordEnd=${recordEnd}
    ${addr}    Post Request    api    /apollo/amc/record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    ${number}    Get From Dictionary    ${responsedata['body']['recordList'][0]}    number
    Set Global Variable    ${number}
    [Return]    ${responsedata}

amcPc版_问诊记录列表详情
    [Arguments]    ${number}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_amc}    ${dict}
    ${data}    Create Dictionary    number=${number}
    ${addr}    Post Request    api    /apollo/amc/record_info    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc进入
    [Arguments]    ${AlgoID}    ${age}    ${ageStyle}    ${gender}    ${symptomId}    ${symptomName}
    ...    ${patientName}    ${patientPhone}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    AlgoID=${AlgoID}    age=${age}    ageStyle=${ageStyle}    gender=${gender}    symptomId=${symptomId}
    ...    symptomName=${symptomName}    patientName=${patientName}    patientPhone=${patientPhone}
    ${addr}    Post Request    api    amc/exam_enter    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    ${hms}    Get From Dictionary    ${responsedata['head']}    _hms
    Set Global Variable    ${hms}
    log    ${hms}
    # #旧的
    # amc下一题
    #    [Arguments]    ${incoming_ids}    ${question}    ${answers}
    #    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    # Create Session    api    ${base_url}    ${dict}
    #    ${object}    Set Variable    {"NODE_ID": 292}
    #    ${question}    Evaluate    dict(${object})
    #    ${answers}    Evaluate    [${answers}]
    #    ${data}    Create Dictionary    incoming_ids=${incoming_ids}    question=${question}    answers=${answers}
    #    ${addr}    Post Request    api    amc/next_question?_hms=${hms}    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    #    [Return]    ${responsedata}
    #新版
    [Return]    ${responsedata}

amc下一题
    [Arguments]    ${questionId}    ${type}    ${answer}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${answer}    Create List    ${answer}
    # ${data}    Create Dictionary    questionId=${questionId}    type=${type}    answer=${answer}
    ${data}    Create Dictionary    questionId=${questionId}    type=${type}    answer=${answer}
    ${dataList}    Create List    ${data}
    ${addr}    Post Request    api    amc/next_question?_hms=${hms}    data=${dataList}
    ${responsedata}    To Json    ${addr.content}
    ${number}    Get from Dictionary    ${responsedata["body"]}    number
    Set Global variable    ${number}
    [Return]    ${responsedata}

amc问诊记录
    [Arguments]    ${number}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    number=${number}
    ${addr}    Post Request    api    amc/record_info    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

amc常见症状
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amc/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

问诊记录添加备注
    [Arguments]    ${number}    ${recordRemark}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    number=${number}    recordRemark=${recordRemark}
    ${addr}    Post Request    api    amc/update_record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

amcPc版症状统计图型
    [Arguments]    ${enterTime}    ${recordTime}    ${symptom}    ${gender}    ${subject}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    enterTime=${enterTime}    recordTime=${recordTime}    symptom=${symptom}    gender=${gender}    subject=${subject}
    ${addr}    Post Request    api    /amc/static_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

amcPc版科室统计图型
    [Arguments]    ${enterTime}    ${recordTime}    ${symptom}    ${gender}    ${subject}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    enterTime=${enterTime}    recordTime=${recordTime}    symptom=${symptom}    gender=${gender}    subject=${subject}
    ${addr}    Post Request    api    /amc/static_subject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

amcPc版症状搜索
    [Arguments]    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}
    ${addr}    Post Request    api    /amc/symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

amcPc客户信息
    [Arguments]    ${authKey}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    authKey=${authKey}
    ${addr}    Post Request    api    /customer_info    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ##########amc-mayson问诊系统####################
    [Return]    ${responsedata}

问诊路径
    [Arguments]    ${symptomId}    ${age}    ${ageType}    ${sex}    ${patientName}    ${saveFlag}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_his}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptomId=${symptomId}    age=${age}    ageType=${ageType}    sex=${sex}    patientName=${patientName}
    ...    saveFlag=${saveFlag}
    ${addr}    Post Request    api    /amc/node_tree    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

答题记录
    [Arguments]    ${nodeId}    ${algoIdList}    ${seqIdList}    ${symptomIdList}    ${algoId}    ${seqId}
    ...    ${age}    ${ageType}    ${sex}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_his}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${algoIdList}    Create List    ${algoIdList}
    ${seqIdList}    Create List    ${seqIdList}
    ${symptomIdList}    Create List    ${symptomIdList}
    ${data}    Create Dictionary    nodeId=${nodeId}    algoIdList=${algoIdList}    seqIdList=${seqIdList}    symptomIdList=${symptomIdList}    algoId=${algoId}
    ...    seqId=${seqId}    age=${age}    ageType=${ageType}    sex=${sex}
    ${addr}    Post Request    api    /amc/answer_record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

提交记录
    [Arguments]    ${nodeId}    ${algoId}    ${seqId}    ${age}    ${ageType}    ${sex}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_his}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    nodeId=${nodeId}    algoId=${algoId}    seqId=${seqId}    age=${age}    ageType=${ageType}
    ...    sex=${sex}
    ${addr}    Post Request    api    /amc/submit_record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

历史搜索
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_his}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amc/history_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

症状搜索
    [Arguments]    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_his}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}
    ${addr}    Post Request    api    amc/v_4_0/symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ##############################################################
    #########AME##################
    [Return]    ${responsedata}

ame登录
    [Arguments]    ${userName}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_ame}    ${dict}
    ${data}    Create Dictionary    userName=${userName}    password=${password}
    ${addr}    Post Request    api    ame/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

ame查询
    [Arguments]    ${name}
    ${dict}    Create Dictionary    Content-Type=application/json
    # Create Session    api    ${base_url_ame}    ${dict}
    ${data}    Create Dictionary    name=${name}
    ${addr}    Post Request    api    ame/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

ame管理_用户登录
    [Arguments]    ${doctorName}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_ame}    ${dict}
    ${data}    Create Dictionary    doctorName=${doctorName}    password=${password}
    ${addr}    Post Request    api    role/userLogin    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

ame管理_文档关联诊断sug
    [Arguments]    ${diseaseName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_ame}    ${dict}
    ${params}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Get Request    api    /etXml/queryXmlDiseaseSug?pId=22943,11    params=${params}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

ame管理_文档列表查询
    [Arguments]    ${zhName}    ${enName}    ${languageType}    ${type}    ${modifyStart}    ${modifyEnd}
    ...    ${index}    ${pageSize}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_ame}    ${dict}
    ${data}    Create Dictionary    zhName=${zhName}    enName=${enName}    languageType=${languageType}    type=${type}    modifyStart=${modifyStart}
    ...    modifyEnd=${modifyEnd}    index=${index}    pageSize=${pageSize}
    ${addr}    Post Request    api    /etXml/queryEtXmlList    data=${data}
    ${responsedata}    To Json    ${addr.content}    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}    # Delete All Sessions
    ...    ########################################################################################################################    ########Mayson######    # 识别接口    #    [Arguments]    ${bodyTempr}
    ...    # ${age}    ${ageType}    ${highBldPress}    ${lowBldPress}    # ${pregnancyStatus}    ${recordInfo}
    ...    #    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    #
    ...    # ${recordInfo}    Evaluate    dict(${recordInfo})    #    Create Session    api
    ...    # http://10.252.128.72:9088/inference    ${dict}    #    ${data}    Create Dictionary    bodyTempr=${bodyTempr}
    ...    # age=${age}    ageType=${ageType}    highBldPress=${highBldPress}    # lowBldPress=${lowBldPress}    pregnancyStatus=${pregnancyStatus}    recordInfo=${recordInfo}
    #    ${addr}    Post Request    api    /v_4_0/recognize    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    # Delete All Sessions
    #    [Return]    ${responsedata}
    [Return]    ${responsedata}

识别接口
    [Arguments]    ${symptom}    ${assert}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://10.117.64.153:8080    ${dict}
    # Create Session    api    http://10.165.102.219:9088    ${dict}
    # Create Session    api    http://10.165.102.219:8080    ${dict}
    #95环境
    # Create Session    api    http://10.46.74.95:8099    ${dict}
    #线上
    # Create Session    api    http://47.95.203.183:8080    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap[]=    presentHistory=
    ${addr}    Post Request    api    /v_4_0/recognize    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj['word'] for aj in $responsedata['body']['recognizeResultList']]
    Should Contain    ${aj}    ${assert}    ignore_case=true

智能推荐_xml
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}
    ...    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_jd}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}
    ...    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

智能推荐_宣武
    [Arguments]    ${userGuid}    ${serialNumber}    ${doctorGuid}    ${doctorName}    ${patientInfo}    ${physicalSign}
    ...    ${definiteDiagnosis}    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_xw}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    doctorGuid=${doctorGuid}    doctorName=${doctorName}    patientInfo=${patientInfo}
    ...    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

用药推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ${addr}    Post Request    api    mayson/v_1_0/medication_regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

用药推荐_宣武
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_xw}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ${addr}    Post Request    api    mayson/v_1_0/medication_regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

mayson搜索
    [Arguments]    ${name}    ${hasAssessType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    hasAssessType=${hasAssessType}
    ${addr}    Post Request    api    v_2_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

mayson默认推荐搜索
    [Arguments]    ${doctorGuid}    ${department}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    department=${department}
    ${addr}    Post Request    api    /mayson/track/default_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

治疗方案
    [Arguments]    ${symptom}    ${uuid}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}
    ...    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}
    ...    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_his}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    uuid=${uuid}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}
    ...    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}
    ...    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}
    ...    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    athena/v_1_0/regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

智能诊断4.0
    [Arguments]    ${userGuid}    ${doctorGuid}    ${serialNumber}    ${hospitalGuid}    ${symptom}    ${previousHistory}
    ...    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}
    ...    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}    ${hasDetail}    ${symptomClickDiseaseId}
    # ...    ${examItems}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    http://10.46.74.95:8080    ${dict}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    doctorGuid=${doctorGuid}    serialNumber=${serialNumber}    hospitalGuid=${hospitalGuid}    symptom=${symptom}
    ...    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}
    ...    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}
    ...    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap=${confirmDiagnosisMap}    presentHistory=${presentHistory}    hasDetail=${hasDetail}    symptomClickDiseaseId=${symptomClickDiseaseId}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_4_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Delete All Sessions
    [Return]    ${responsedata}

智能推荐门诊
    [Arguments]    ${userGuid}    ${serialNumber}    ${doctorGuid}    ${hospitalGuid}    ${symptom}    ${drugCommonNames}
    ...    ${examinationList}    ${newTestList}    ${labTestList}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}    ${hasDetail}    ${symptomClickDiseaseId}
    # ...    ${examItems}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    ${drugCommonNames}    Evaluate    [${drugCommonNames}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    http://10.46.74.95:8080    ${dict}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    doctorGuid=${doctorGuid}    hospitalGuid=${hospitalGuid}    symptom=${symptom}
    ...    drugCommonNames=${drugCommonNames}    examinationList=${examinationList}    newTestList=${newTestList}    labTestList=${labTestList}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}
    ...    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}
    ...    confirmDiagnosisMap=${confirmDiagnosisMap}    presentHistory=${presentHistory}    hasDetail=${hasDetail}    symptomClickDiseaseId=${symptomClickDiseaseId}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_4_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Delete All Sessions
    [Return]    ${responsedata}

智能推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}
    ...    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}    ${prescriptions}
    ...    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${operationRecord}    Evaluate    dict(${operationRecord})
    ${prescriptions}    Evaluate    ${prescriptions}
    ${medicalOrders}    Evaluate    dict(${medicalOrders})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=${patientName}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientDepartment=${inpatientDepartment}    pageSource=${pageSource}    patientInfo=${patientInfo}    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}
    ...    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}    operationRecord=${operationRecord}
    ...    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

智能推荐test
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}
    ...    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}    ${prescriptions}
    ...    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    Create Session    api    http://10.117.64.153:8080    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${operationRecord}    Evaluate    dict(${operationRecord})
    ${prescriptions}    Evaluate    ${prescriptions}
    ${medicalOrders}    Evaluate    dict(${medicalOrders})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=${patientName}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientDepartment=${inpatientDepartment}    pageSource=${pageSource}    patientInfo=${patientInfo}    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}
    ...    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}    operationRecord=${operationRecord}
    ...    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}
    ${addr}    Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}    # 智能推荐test    #    [Arguments]    ${userGuid}
    ...    # ${serialNumber}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}    # ${progressNoteList}    #
    ...    # ...    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    #    ${dict}
    ...    # Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    #    Create Session    api
    ...    # ${mayson_url}    ${dict}    #    ${patientInfo}    Evaluate    dict(${patientInfo})
    ...    #    ${physicalSign}    Evaluate    dict(${physicalSign})    #    ${definiteDiagnosis}
    ...    # Evaluate    [${definiteDiagnosis}]    #    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ...    #    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]    #    ${labTestList}
    ...    # Evaluate    [${labTestList}]    #    ${examinationList}    Evaluate    [${examinationList}]
    ...    #    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ...    # physicalSign=${physicalSign}    # definiteDiagnosis=${definiteDiagnosis}
    #    ...    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
    #    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    ########历史评估表################
    #    [Return]    ${responsedata}
    [Return]    ${responsedata}

保存评估历史记录
    [Arguments]    ${recordId}    ${assessId}    ${assessName}    ${patientGuid}    ${serialNumber}    ${assessResult}
    ...    ${assessConclusion}    ${historyItemList}    ${source}    ${resultContent}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${historyItemList}    Evaluate    [${historyItemList}]
    ${data}    Create Dictionary    recordId=${recordId}    assessId=${assessId}    assessName=${assessName}    patientGuid=${patientGuid}    serialNumber=${serialNumber}
    ...    assessResult=${assessResult}    assessConclusion=${assessConclusion}    historyItemList=${historyItemList}    source=${source}    resultContent=${resultContent}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/save    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${assessHistoryId}    Get From Dictionary    ${responsedata['body']}    assessHistoryId
    Set Global Variable    ${assessHistoryId}
    [Return]    ${responsedata}

根据评估历史记录id查询评估记录
    [Arguments]    ${Id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    Id=${Id}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorybyid    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

评估表历史记录
    [Arguments]    ${patientGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    patientGuid=${patientGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorylist    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

搜索文献
    [Arguments]    ${name}    ${diseaseId}    ${pageSize}    ${currentPage}    ${startDate}    ${endDate}
    ...    ${departmentId}    ${countryId}    ${orgName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    diseaseId=${diseaseId}    pageSize=${pageSize}    currentPage=${currentPage}    startDate=${startDate}
    ...    endDate=${endDate}    departmentId=${departmentId}    countryId=${countryId}    orgName=${orgName}
    ${addr}    Post Request    api    /seer/document/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

最新文献
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /seer/document/newest    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

文献详情
    [Arguments]    ${documentId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    documentId=${documentId}
    ${addr}    Post Request    api    /seer/v_1_0/document/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

文献标签
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /seer/document/label    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

文献下载
    [Arguments]    ${fileName}    ${filePath}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    fileName=${fileName}    filePath=${filePath}
    ${addr}    Get Request    api    /seer/document/download    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}

申请文献
    [Arguments]    ${documentName}    ${applyOrg}    ${applySection}    ${applyMessage}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    documentName=${documentName}    applyOrg=${applyOrg}    applySection=${applySection}    applyMessage=${applyMessage}
    ${addr}    Post Request    api    /seer/document/apply    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

文献诊断字典
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /seer/document/disease_dict    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

文献申请列表
    [Arguments]    ${pageSize}    ${currentPage}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    pageSize=${pageSize}    currentPage=${currentPage}
    ${addr}    Post Request    api    /seer/document/apply_list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${id}    Get From Dictionary    ${responsedata['body']['customerList'][0]}    id
    Set Global Variable    ${id}
    [Return]    ${responsedata}

修改文献热度
    [Arguments]    ${id}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    /seer/document/update_hot    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

mayson默认推荐
    [Arguments]    ${doctorGuid}    ${department}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    department=${department}
    ${addr}    Post Request    api    /mayson/track/default_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

风火山林甲状腺
    [Arguments]    ${userGuid}    ${serialNumber}    ${gender}    ${age}    ${ageType}    ${examinationName}
    ...    ${examinationDesc}    ${examinationResult}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    gender=${gender}    age=${age}    ageType=${ageType}
    ...    examinationDesc=${examinationDesc}    examinationResult=${examinationResult}
    ${addr}    Post Request    api    /mayson/v_1_1/smart_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

风火山林甲状腺接口
    [Arguments]    ${examinationDesc}    ${assert}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=99999999999    serialNumber=99999999999    gender=1    age=60    ageType=岁
    ...    examinationName=    examinationDesc=${examinationDesc}    examinationResult=
    ${addr}    Post Request    api    /mayson/v_1_1/smart_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj['interpretPostil'] for aj in $responsedata['body']['examinationInterpretList']]
    Should Contain    ${aj}    ${assert}

检验检查详情
    [Arguments]    ${examId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    examId=${examId}
    ${addr}    Post Request    api    /v_2_0/exam/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

智能推荐_医生团队
    [Arguments]    ${userGuid}    ${serialNumber}    ${doctorGuid}    ${doctorName}    ${pageSource}    ${patientInfo}
    ...    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}
    ...    ${newTestList}    ${operationRecord}    ${prescriptions}    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=D7928B9182ABF6E0A6A6EBB71B353585
    # Create Session    api    ${base_url}    ${dict}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${operationRecord}    Evaluate    dict(${operationRecord})
    ${prescriptions}    Evaluate    ${prescriptions}
    ${medicalOrders}    Evaluate    dict(${medicalOrders})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    doctorGuid=${doctorGuid}    doctorName=${doctorName}    pageSource=${pageSource}
    ...    examinationList=${examinationList}    newTestList=${newTestList}    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

新算法识别接口
    [Arguments]    ${contents}
    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${base_url_sf}    ${dict}
    ${contents}    Evaluate    [${contents}]
    ${data}    Create Dictionary    contents=${contents}
    ${addr}    Post Request    api    inference    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

智能推荐_新版质控
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${requestSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}
    ...    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}
    ...    ${prescriptions}    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    Create Session    api    ${mayson_profile}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${operationRecord}    Evaluate    dict(${operationRecord})
    ${prescriptions}    Evaluate    ${prescriptions}
    ${medicalOrders}    Evaluate    dict(${medicalOrders})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=${patientName}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientDepartment=${inpatientDepartment}    pageSource=${pageSource}    requestSource=${requestSource}    patientInfo=${patientInfo}    physicalSign=${physicalSign}
    ...    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
    ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}
    ${addr}    Post Request    api    mayson/v_1_1/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

新版质控统计明细
    [Arguments]    ${id}
    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    queryChartConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

新版质控统计
    [Arguments]    ${id}
    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    queryChartConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

adminse登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    node/user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

下发规则
    [Arguments]    ${customerId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    customerId=${customerId}
    ${addr}    Post Request    api    cdss/mayson/effectTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

规则模板配置
    [Arguments]    ${index}    ${pageSize}    ${customerId}    ${systemId}    ${progressType}    ${templateName}
    ...    ${modifyDateBegin}    ${modifyDateEnd}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    index=${index}    pageSize=${pageSize}    customerId=${customerId}    systemId=${systemId}    progressType=${progressType}
    ...    templateName=${templateName}    modifyDateBegin=${modifyDateBegin}    modifyDateEnd=${modifyDateEnd}
    ${addr}    Post Request    api    node/msParser/getMsParserList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

检查检验查看
    [Arguments]    ${customerId}    ${index}    ${pageSize}    ${orderBy}    ${sourceType}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    customerId=${customerId}    index=${index}    pageSize=${pageSize}    orderBy=${orderBy}    sourceType=${sourceType}
    ${addr}    Post Request    api    node/dictionary/queryExamCustomerList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

文献首页
    [Arguments]    ${fileName}    ${filePath}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    http://test-doc.huimeionline.com/index.html?auth=%7B%22autherKey%22%3A%227195F12825788F09375C2DB1E922F108%22    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    #${params}    Create Dictionary    fileName=${fileName}    filePath=${filePath}
    ${addr}    Get Request    api
    #${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}
