*** Variables ***

${base_url_ol}     http://apollo.huimeionline.com
${amc_url_ol}     http://amc.huimeionline.com
# ${base_url}     http://apollo.huimeionline.com
#
#.,#蒋磊
# ${base_url}       http://192.168.1.23:8093
# ${base_url}       http://10.46.74.95:8080
#线上
# ${base_url}       http://118.178.109.153




#测试
# ${mayson_url}       http://10.117.64.153:8080
${mayson_url}       http://test-mayson.huimeionline.com/cdss
${base_url}       http://10.117.64.153:8080
${doc_url}       http://test-doc.huimeionline.com/

##负载
# ${mayson_url}       http://192.168.1.13/cdss
# ${base_url}       http://192.168.1.13/cdss





#线上
# ${mayson_url}     http://47.95.203.183/cdss
#95
# ${base_url}       http://10.46.74.95:9200
##测试
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A
# ${Huimei_id}      7195F12825788F09375C2DB1E922F108
###建德线上
# ${Huimei_id_jd}      C3E74C229156E6B31534E946BCDEBA94
###建德测试
${Huimei_id_jd}      3CB128E11897DD01BEBA5F520B7FB3D3
##宣武线上
${Huimei_id_xw}      8C946583A4EE9174D7B2D1697066BFA2
###宣武测试
# ${Huimei_id_xw}      EDB2CF1F384FD631A863A5D844A8FCF2
${Huimei_id_safe_medication}    C3B844493A477BCF3D7B73A5E902B269
# ${Huimei_id_safe_medication}    7195F12825788F09375C2DB1E922F108

#妇产科诊断性别_测试环境
${base_url_95}     http://10.46.74.95:9200
#妇产科诊断性别_线上环境
${base_url_72}     http://10.252.128.72:9200
#amc管理端
#测试
${base_url_amca}     http://10.117.64.153:3002
#线上
# ${base_url_amca}     http://amca.huimeionline.com

${base_url_ame}     http://10.46.74.95:8092

#####客户工单系统
# ${url_cs}     http://10.117.64.153:80
${url_cs}     http://cs.huimeionline.com



${empty}
${null}    null
*** Keywords ***
获取时间戳
    ${timestamp}    Get Time    epoch
    Set Global Variable    ${timestamp}

获取随机数
    ${random}    Generate Random String    3    1234567890
    Set Global Variable    ${random}

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
    ${addr}    Post Request    api    v_2_3/search/all    data=${data}
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
    # Should Contain    ${aj[:15]}    ${msg}
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
    Delete All Sessions



智能诊断2.3
    [Arguments]    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    http://10.46.74.95:8080    ${dict}
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



智能诊断3.0
    [Arguments]    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}    ${assistCheck}
    # ...    ${examItems}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap=${confirmDiagnosisMap}    presentHistory=${presentHistory}    assistCheck=${assistCheck}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_3_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


病例识别
    [Arguments]    ${symptom}    ${gender}    ${age}    ${ageType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    gender=${gender}    age=${age}   ageType=${ageType}
    ${addr}    Post Request    api    v_4_0/recognize    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}




疾病查询
    [Arguments]    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_3/disease/search    data=${data}
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
    Create Session    api    ${base_url_95}    ${dict}
    ${object}    Set Variable    {"bool":{"must":[{"term":{"department":"妇产科"}}],"filter":{"bool":{"should":[{"term":{"gender":0}},{"term":{"gender":1}}]}}}}
    ${query}    Evaluate    dict(${object})
    ${data}    Create Dictionary    query=${query}
    ${addr}    Post Request    api    /disease/disease/_search?_source=false    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}






################################
########慢病##########
################################

查询常用药品
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    ncds/v_1_0/open/routine/medicine    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询病种列表
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    ncds/v_1_0/open/disease   data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询病种下药品信息
    [Arguments]    ${id}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    ncds/v_1_0/open/disease/medicine   data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


########amc管理后台######

amc管理端_用户登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url_amca}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    /user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_症状sug
    [Arguments]    ${symptomName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_amca}    ${dict}
    ${params}    Create Dictionary    symptomName=${symptomName}
    ${addr}    Get Request    api    /amcRecord/amcSymptomQuerySug    params=${params}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_科室sug
    [Arguments]    ${subject}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_amca}    ${dict}
    ${params}    Create Dictionary    subject=${subject}
    ${addr}    Get Request    api    /amcRecord/subjectQuerySug    params=${params}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_问诊症状统计
    [Arguments]
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amcRecord/tAmcRecordQuerySymptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

amc管理端_问诊科室统计
    [Arguments]
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amcRecord/tAmcRecordQuerySubject    data=${data}
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
    ${addr}    Post Request    api    /amcRecord/tAmcRecordQueryList    data=${data}
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
    ${addr}    Post Request    api    /amcRecord/tAmcRecordQueryDetial    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


amc进入
    [Arguments]    ${AlgoID}    ${age}    ${ageStyle}    ${gender}    ${symptomId}    ${symptomName}    ${patientName}    ${patientPhone}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    AlgoID=${AlgoID}    age=${age}    ageStyle=${ageStyle}    gender=${gender}    symptomId=${symptomId}    symptomName=${symptomName}    patientName=${patientName}    patientPhone=${patientPhone}
    ${addr}    Post Request    api    amc/exam_enter    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    ${hms}    Get From Dictionary    ${responsedata['head']}    _hms
    Set Global Variable    ${hms}
    log    ${hms}
    [Return]    ${responsedata}



amc常见症状
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amc/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


amc身体部位
    [Arguments]    ${gender}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_url_ol}    ${dict}
    ${data}    Create Dictionary    gender=${gender}
    ${addr}    Post Request    api    /apollo/amc/part_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}




# #旧的
# amc下一题
#     [Arguments]    ${incoming_ids}    ${question}    ${answers}
#     # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     # Create Session    api    ${base_url}    ${dict}
#     ${object}    Set Variable    {"NODE_ID": 292}
#     ${question}    Evaluate    dict(${object})
#     ${answers}    Evaluate    [${answers}]
#     ${data}    Create Dictionary    incoming_ids=${incoming_ids}    question=${question}    answers=${answers}
#     ${addr}    Post Request    api    amc/next_question?_hms=${hms}    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
#     [Return]    ${responsedata}

#新版
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







#########AME##################
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
    [Arguments]    ${zhName}    ${enName}    ${languageType}    ${type}    ${modifyStart}    ${modifyEnd}    ${index}    ${pageSize}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url_ame}    ${dict}
    ${data}    Create Dictionary    zhName=${zhName}    enName=${enName}
    ...    languageType=${languageType}    type=${type}    modifyStart=${modifyStart}    modifyEnd=${modifyEnd}
    ...    index=${index}    pageSize=${pageSize}
    ${addr}    Post Request    api    /etXml/queryEtXmlList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}





########################################################################################################################
########Mayson######

# 智能推荐
#     [Arguments]    ${userGuid}    ${serialNumber}
#     ...    ${patientInfo}
#     ...    ${definiteDiagnosis}
#     ...    ${progressNoteList}
#     ...    ${deleteProgressNoteList}
#     ...    ${labTestList}
#     ...    ${examinationList}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     Create Session    api    ${base_url}    ${dict}
#     ${patientInfo}    Evaluate    dict(${patientInfo})
#     ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
#     ${progressNoteList}    Evaluate    [${progressNoteList}]
#     ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
#     ${labTestList}    Evaluate    [${labTestList}]
#     ${examinationList}    Evaluate    [${examinationList}]
#     ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
#     ...    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}
#     ...    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
#     ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     [Return]    ${responsedata}


#套了一层dict
# 老识别接口
#     [Arguments]    ${bodyTempr}    ${age}    ${ageType}    ${highBldPress}    ${lowBldPress}    ${pregnancyStatus}    ${recordInfo}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     ${recordInfo}    Evaluate    dict(${recordInfo})
#     Create Session    api    http://10.117.64.153:8099    ${dict}
#     ${data}    Create Dictionary    bodyTempr=${bodyTempr}    age=${age}   ageType=${ageType}    highBldPress=${highBldPress}    lowBldPress=${lowBldPress}    pregnancyStatus=${pregnancyStatus}    recordInfo=${recordInfo}
#     ${addr}    Post Request    api    apollo/v_3_0/recognize    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # Should Contain    ${aj[:15]}    ${msg}
#     # Delete All Sessions
#     [Return]    ${responsedata}

######循环方式读取识别接口
# 识别接口
#     [Arguments]    ${bodyTempr}    ${age}    ${ageType}    ${highBldPress}    ${lowBldPress}    ${pregnancyStatus}    ${symptom}
#     ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     # ${recordInfo}    Evaluate    dict(${recordInfo})
#     Create Session    api    http://10.117.64.153:8080    ${dict}
#     ${data}    Create Dictionary    bodyTempr=${bodyTempr}    age=${age}   ageType=${ageType}    highBldPress=${highBldPress}    lowBldPress=${lowBldPress}    pregnancyStatus=${pregnancyStatus}    symptom=${symptom}
#     ${addr}    Post Request    api    /v_3_0/recognize    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # Should Contain    ${aj[:15]}    ${msg}
#     # Delete All Sessions
#     [Return]    ${responsedata}


识别接口
    [Arguments]    ${symptom}    ${assert}
    [Documentation]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://10.117.64.153:8080    ${dict}
    #95环境
    # Create Session    api    http://10.46.74.95:8099    ${dict}
    #线上
    # Create Session    api    http://47.95.203.183:8080    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=    personalHistory=    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=30    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap[]=    presentHistory=
    ${addr}    Post Request    api    /v_3_0/recognize    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}      Evaluate    [aj['word'] for aj in $responsedata['body']['recognizeResultList']]
    Should Contain    ${aj}    ${assert}    ignore_case=true


智能推荐_xml
    [Arguments]    ${userGuid}    ${serialNumber}
    ...    ${patientInfo}
    ...    ${physicalSign}
    ...    ${definiteDiagnosis}
    ...    ${progressNoteList}
    ...    ${deleteProgressNoteList}
    ...    ${labTestList}
    ...    ${examinationList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_jd}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ...    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}
    ...    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



智能推荐_宣武
    [Arguments]    ${userGuid}    ${serialNumber}
    ...    ${patientInfo}
    ...    ${physicalSign}
    ...    ${definiteDiagnosis}
    ...    ${progressNoteList}
    ...    ${deleteProgressNoteList}
    ...    ${labTestList}
    ...    ${examinationList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_xw}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${definiteDiagnosis}    Evaluate    [${definiteDiagnosis}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${deleteProgressNoteList}    Evaluate    [${deleteProgressNoteList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ...    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}
    ...    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



智能推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${pageSource}
    ...    ${patientInfo}
    ...    ${physicalSign}
    ...    ${definiteDiagnosis}
    ...    ${progressNoteList}
    ...    ${deleteProgressNoteList}
    ...    ${labTestList}
    ...    ${examinationList}
    ...    ${newTestList}
    ...    ${operationRecord}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
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
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ...    physicalSign=${physicalSign}    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}
    ...    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}
    ...    newTestList=${newTestList}    operationRecord=${operationRecord}
    ${addr}    Post Request    api    mayson/v_1_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


用药推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_jd}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ${addr}    Post Request    api    mayson/v_1_0/medication_regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

用药推荐_宣武
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_xw}
    Create Session    api    ${base_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ${addr}    Post Request    api    mayson/v_1_0/medication_regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

mayson搜索
    [Arguments]    ${name}    ${hasAssessType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    hasAssessType=${hasAssessType}
    ${addr}    Post Request    api    v_2_3/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


mayson默认推荐搜索
    [Arguments]    ${doctorGuid}    ${department}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    department=${department}
    ${addr}    Post Request    api    mayson/track/default_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


治疗方案
    [Arguments]    ${symptom}    ${uuid}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    # ...    ${examItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    uuid=${uuid}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    athena/v_1_0/regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



智能诊断4.0
    [Arguments]    ${userGuid}    ${doctorGuid}    ${serialNumber}    ${hospitalGuid}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}    ${hasDetail}    ${symptomClickDiseaseId}
    # ...    ${examItems}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    http://10.46.74.95:8080    ${dict}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    doctorGuid=${doctorGuid}    serialNumber=${serialNumber}    hospitalGuid=${hospitalGuid}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap=${confirmDiagnosisMap}    presentHistory=${presentHistory}    hasDetail=${hasDetail}    symptomClickDiseaseId=${symptomClickDiseaseId}
    # ...    examItems[]=${examItems}
    ${addr}    Post Request    api    v_4_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}





################客户工单系统################

cs登录接口
    # [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${url_cs}    ${dict}
    ${data}    Create Dictionary    name=yinbo@huimei.com    password=222222
    ${addr}    Post Request    api    node/user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


cs登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${url_cs}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    node/user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}



cs客户列表
    [Arguments]    ${orderName}    ${userName}    ${productName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    # Create Session    api    ${url_cs}    ${dict}
    ${data}    Create Dictionary    orderName=${orderName}    userName=${userName}    productName=${productName}
    ${addr}    Post Request    api    node/order/getOrder    data=${data}
    ${respo空腹血糖nsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}



cs检查登录
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${url_cs}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    node/user/checkUser    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


新建客户
    [Arguments]   ${order_name}    ${status}    ${user_id}    ${address}    ${hospital_contact_info}    ${server}    ${network_role}    ${fk_company}    ${fk_contact_Info}    ${autherkey}    ${remark}    ${productList}    ${sys_id}    ${mail}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    # Create Session    api    ${url_cs}    ${dict}
    ${mail}    Evaluate    dict(${mail})
    ${productList}    Evaluate    [${productList}]
    ${data}    Create Dictionary    order_name=${order_name}    status=${status}    user_id=${user_id}    address=${address}    hospital_contact_info=${hospital_contact_info}    server=${server}    network_role=${network_role}    fk_company=${fk_company}    fk_contact_Info=${fk_contact_Info}    autherkey=${autherkey}    remark=${remark}    productList=${productList}    sys_id=${sys_id}    mail=${mail}
    ${addr}    Post Request    api    node/order/save    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



########历史评估表################

保存评估历史记录
    [Arguments]    ${recordId}    ${assessId}    ${assessName}
    ...    ${patientGuid}
    ...    ${serialNumber}
    ...    ${assessResult}
    ...    ${assessConclusion}
    ...    ${historyItemList}
    ...    ${source}
    ...    ${resultContent}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${base_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${historyItemList}    Evaluate    [${historyItemList}]
    ${data}    Create Dictionary    recordId=${recordId}    assessId=${assessId}    assessName=${assessName}    patientGuid=${patientGuid}
    ...    serialNumber=${serialNumber}    assessResult=${assessResult}    assessConclusion=${assessConclusion}
    ...    historyItemList=${historyItemList}    source=${source}    resultContent=${resultContent}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/save    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${assessHistoryId}    Get From Dictionary    ${responsedata['body']}    assessHistoryId
    Set Global Variable    ${assessHistoryId}
    [Return]    ${responsedata}



根据评估历史记录id查询评估记录
    [Arguments]    ${Id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    # Create Session    api    ${base_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    Id=${Id}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorybyid    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}





评估表历史记录
    [Arguments]    ${patientGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${base_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    patientGuid=${patientGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorylist    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}




搜索文献
    [Arguments]    ${name}    ${diseaseId}    ${pageSize}    ${currentPage}    ${startDate}    ${endDate}    ${departmentId}    ${countryId}    ${orgName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    diseaseId=${diseaseId}    pageSize=${pageSize}    currentPage=${currentPage}    startDate=${startDate}    endDate=${endDate}    departmentId=${departmentId}    countryId=${countryId}    orgName=${orgName}
    ${addr}    Post Request    api    /doc/seer/document/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}




最新文献
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /doc/seer/document/newest    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



文献详情
    [Arguments]    ${documentId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    documentId=${documentId}
    ${addr}    Post Request    api    /doc/seer/v_1_0/document/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


文献标签
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /doc/seer/document/label    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}




文献下载
    [Arguments]    ${fileName}    ${filePath}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    fileName=${fileName}    filePath=${filePath}
    ${addr}    Get Request    api    /doc/seer/document/download    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}

申请文献
    [Arguments]    ${documentName}    ${applyOrg}    ${applySection}    ${applyMessage}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    documentName=${documentName}    applyOrg=${applyOrg}    applySection=${applySection}    applyMessage=${applyMessage}
    ${addr}    Post Request    api    /doc/seer/document/apply    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


文献诊断字典
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /doc/seer/document/disease_dict    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


文献申请列表
    [Arguments]    ${pageSize}    ${currentPage}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    pageSize=${pageSize}    currentPage=${currentPage}
    ${addr}    Post Request    api    /doc/seer/document/apply_list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${id}    Get From Dictionary    ${responsedata['body']['customerList'][0]}    id
    Set Global Variable    ${id}
    [Return]    ${responsedata}



修改文献热度
    [Arguments]    ${id}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${doc_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    /doc/seer/document/update_hot    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}




mayson默认推荐
    [Arguments]    ${doctorGuid}    ${department}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=7195F12825788F09375C2DB1E922F108
    Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    department=${department}
    ${addr}    Post Request    api    /mayson/track/default_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

