*** Variables ***
#=======医院内网需要修改的==============#
#mayson生产环境       修改成http://负载ip/cdss
# ${mayson_url}     http://profile.huimeionline.com/cdss
${mayson_url}    http://test-mayson.huimeionline.com/cdss
#演示环境
# ${mayson_url}    http://172.16.4.178/cdss


#{url}内部平台 ,惠每用户中心地址
#预发
# ${inside_url}     http://172.16.3.40
#测试
${inside_url}    http://172.16.3.64
#内部平台-demo环境
# ${inside_url}    http://172.16.4.178
#文献生产环境           修改成http://负载ip/cdss
# ${ doc_url}       http://profile-doc.huimeionline.com/doc
${doc_url}      http://test-profile-doc.huimeionline.com/doc
#演示环境
# ${doc_url}      http://172.16.4.178/cdss
#内涵质控
# ${connotation_url}    http://172.16.3.68
${connotation_url}    http://172.16.4.178
#测试环境
# ${mayson_url}    http://10.27.213.55
#文献前端环境           修改成http://负载ip/wenxian
# ${doc_fe}         http://doc.huimeionline.com
${doc_fe}       http://172.16.4.178/wenxian
#文献线上             修改成http://负载ip
${doc_online}     http://120.26.223.139
# ${doc_online}    http://172.16.4.178
#ame生产环境          修改成http://负载ip
${ame_url}        http://ame.huimeionline.com
# ${ame_url}      http://172.16.4.178:8092
#fuxi验证接口         修改成 http://负载ip/node/active
${fuxi_data}      ${inside_url}:3014
# ${fuxi_data}    http://172.16.4.178/node/active
#adminse          修改成http://负载ip
${adminse}        http://admin-se.huimeionline.com/
# ${adminse}      http://172.16.4.178
# ${adminse}      http://test-admin-se.huimeionline.com/
#amcPc版           修改成http://负载ip/cdss
${amc_url}    http://amc.huimeionline.com
# ${base_gdms}      http://gdms.huimeionline.com
# ${amc_url}    http://172.16.4.178/cdss
# ${base_gdms}    http://172.16.4.178/cdss
#病历质控平台 3021
${songshan_url}    ${inside_url}:3021
#惠每用户中心 3019
${taishan_url}    ${inside_url}:3019
${inside_url}     http://10.117.68.109
#华山 3020
${huashan_url}    ${inside_url}:3020
#临床质量管理平台:3016
${tesla_url}      ${inside_url}:3016
#绿道               修改成对应的ip端口
${lvdao_url}      ${inside_url}:3022
#庄周
${zhuangzhou_url}    ${inside_url}:3023
#肿瘤
${zhongliu_url}    ${inside_url}:3026
##文献图片/文件差异接口,修改为http://athena_ip:8095形式
${athenaDoc_url}    http://mayson.huimeionline.com:8095
# ${athenaDoc_url}    http://172.16.4.178:8095
#=======以下内容不需要修改==============#
######################apollo######################
${mayson_url_sf}    http://10.27.213.55:9092
######################ovf模板地址######################
# ${mayson_url}    http://192.168.1.13/cdss
# ${mayson_url}     http://192.168.1.13/cdss
${null}           null
#测试号
${Huimei_id}      7195F12825788F09375C2DB1E922F108
# ${Huimei_id}    D7928B9182ABF6E0A6A6EBB71B353585

*** Keywords ***
获取时间戳
    ${timestamp}    Get Time    epoch
    ${time_now}    Get Time    timestamp
    Set Global Variable    ${timestamp}
    Set Global Variable    ${time_now}

获取随机数
    ${random}    Generate Random String    3    1234567890
    Set Global Variable    ${random}

时间
    ${time}    Get Current Date    result_format=timestamp
    #通用药品医嘱时间，此刻
    ${medical_create}    add time to date    ${time}    -1hours
    ${medicalOrders_create}    Get SubString    ${medical_create}    0    19
    #肿瘤规则检验医嘱时间
    ${orders_lis_create_time}    add time to date    ${medicalOrders_create}    2seconds
    #手术时间
    ${operation_time}    add time to date    ${time}    3hours
    ${operation_start_time}    Get SubString    ${operation_time}    0    19
    #医嘱时间
    ${medicalOrders}    add time to date    ${operation_start_time}    -10hours
    ${medicalOrders_time}    Get SubString    ${medicalOrders}    0    19
    #医嘱停止时间
    ${medicalOrders_stop}    add time to date    ${operation_start_time}    -2hours
    ${medicalOrders_stop_time}    Get SubString    ${medicalOrders_stop}    0    19
    Set Global Variable    ${time}
    Set Global Variable    ${operation_start_time}
    Set Global Variable    ${medicalOrders_time}
    Set Global Variable    ${medicalOrders_stop_time}
    Set Global Variable    ${medicalOrders_create}
    Set Global Variable    ${orders_lis_create_time}

安全用药
    [Arguments]    ${drugCommonNames}    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}
    ...    ${confirmDiagnosis}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    drugCommonNames=${drugCommonNames}    gender=${gender}    age=${age}    ageType=${ageType}    drugIds=${drugIds}
    ...    symptom=${symptom}    confirmDiagnosis=${confirmDiagnosis}
    ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

药品查询
    [Arguments]    ${drugName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

查询药品与诊断
    [Arguments]    ${hasAssessType}    ${name}
    ${true}    Set Variable    ${true}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    hasAssessType=${hasAssessType}    name=${name}
    ${addr}    Post Request    api    v_2_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

药品详情
    [Arguments]    ${drugId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    drugId=${drugId}
    ${addr}    Post Request    api    hmsm/v_1_0/drug/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

诊断依据
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/basis    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见症状
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见诊断
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_diseases    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见个人史
    [Arguments]    ${gender}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}
    ${addr}    Post Request    api    v_2_0/common_personal_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见过敏史
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_allergy_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见家族史
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_family_history    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见体格检查
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_physical    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

常见症状和类型
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    v_2_0/common_symptom_obj    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

鉴别诊断
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/suspected_diagnosis    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

疾病详情
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

梅奥疾病详情
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/mayo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

疾病处置详细
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/treatment    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

相关疾病
    [Arguments]    ${diseaseId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseId=${diseaseId}
    ${addr}    Post Request    api    v_2_0/disease/reference    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

疾病查询弹层提示
    [Arguments]    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_0/disease/popup    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能诊断2.0
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    ${addr}    Post Request    api    v_2_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    Should Contain    ${aj}    ${msg}
    Delete All Sessions

智能诊断
    [Arguments]    ${slice}    ${msg}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${aj}    Evaluate    [aj${slice} for aj in $responsedata['body']['suspectedDiseases']]
    Should Contain    ${aj}    ${msg}
    Delete All Sessions

智能诊断2.2
    [Arguments]    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    ${addr}    Post Request    api    v_2_2/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Delete All Sessions

智能诊断2.3
    [Arguments]    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}
    ...    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}
    ...    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}
    ...    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}
    ...    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}    presentHistory=${presentHistory}
    ${addr}    Post Request    api    v_2_3/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病例识别
    [Arguments]    ${symptom}    ${gender}    ${age}    ${ageType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    gender=${gender}    age=${age}    ageType=${ageType}
    ${addr}    Post Request    api    /recognize    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

疾病查询
    [Arguments]    ${diseaseName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Post Request    api    v_2_0/disease/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

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
    Should Be Empty    ${aj}

妇产科诊断性别
    [Arguments]    ${query}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url_219}    ${dict}
    ${object}    Set Variable    {"bool":{"must":[{"term":{"department":"妇产科"}}],"filter":{"bool":{"should":[{"term":{"gender":0}},{"term":{"gender":1}}]}}}}
    ${query}    Evaluate    dict(${object})
    ${data}    Create Dictionary    query=${query}
    ${addr}    Post Request    api    /disease/disease/_search?_source=false    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

查询常用药品
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    ncds/v_1_0/open/routine/medicine    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

查询病种列表
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    ncds/v_1_0/open/disease    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

查询病种下药品信息
    [Arguments]    ${id}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    ncds/v_1_0/open/disease/medicine    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_用户登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_urla}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    /user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_症状sug
    [Arguments]    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}
    ${addr}    Post Request    api    apollo/amc/symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_科室sug
    [Arguments]    ${subject}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_url}    ${dict}
    ${data}    Create Dictionary    subject=${subject}
    ${addr}    Post Request    api    /apollo/amc/query_subject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_问诊症状统计
    [Arguments]    ${currentPage}    ${pageSize}    ${countmode}    ${userGuid}    ${doctorGuid}    ${doctorName}
    ...    ${hospitalGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_url}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    pageSize=${pageSize}    countmode=${countmode}    userGuid=${userGuid}    doctorGuid=${doctorGuid}
    ...    doctorName=${doctorName}    hospitalGuid=${hospitalGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /apollo/amc/static_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_问诊科室统计
    [Arguments]    ${currentPage}    ${pageSize}    ${countmode}    ${userGuid}    ${doctorGuid}    ${doctorName}
    ...    ${hospitalGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_url}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    pageSize=${pageSize}    countmode=${countmode}    userGuid=${userGuid}    doctorGuid=${doctorGuid}
    ...    doctorName=${doctorName}    hospitalGuid=${hospitalGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /apollo/amc/static_subject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_问诊记录列表
    [Arguments]    ${currentPage}    ${pageSize}    ${countmode}    ${userGuid}    ${doctorGuid}    ${doctorName}
    ...    ${hospitalGuid}    ${serialNumber}    ${recordStart}    ${recordEnd}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${amc_url}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    pageSize=${pageSize}    countmode=${countmode}    userGuid=${userGuid}    doctorGuid=${doctorGuid}
    ...    doctorName=${doctorName}    hospitalGuid=${hospitalGuid}    serialNumber=${serialNumber}    recordStart=${recordStart}    recordEnd=${recordEnd}
    ${addr}    Post Request    api    /apollo/amc/record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${number}    Get From Dictionary    ${responsedata['body']['recordList'][0]}    number
    Set Global Variable    ${number}
    log    ${data}
    [Return]    ${responsedata}

amcPc版_问诊记录列表详情
    [Arguments]    ${number}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${amc_url}    ${dict}
    ${data}    Create Dictionary    number=${number}
    ${addr}    Post Request    api    /apollo/amc/record_info    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amc进入
    [Arguments]    ${AlgoID}    ${age}    ${ageStyle}    ${gender}    ${symptomId}    ${symptomName}
    ...    ${patientName}    ${patientPhone}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    AlgoID=${AlgoID}    age=${age}    ageStyle=${ageStyle}    gender=${gender}    symptomId=${symptomId}
    ...    symptomName=${symptomName}    patientName=${patientName}    patientPhone=${patientPhone}
    ${addr}    Post Request    api    amc/exam_enter    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${hms}    Get From Dictionary    ${responsedata['head']}    _hms
    Set Global Variable    ${hms}
    log    ${data}
    [Return]    ${responsedata}

amc下一题
    [Arguments]    ${questionId}    ${type}    ${answer}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    ${answer}    Create List    ${answer}
    # ${data}    Create Dictionary    questionId=${questionId}    type=${type}    answer=${answer}
    ${data}    Create Dictionary    questionId=${questionId}    type=${type}    answer=${answer}
    ${dataList}    Create List    ${data}
    ${addr}    Post Request    api    amc/next_question?_hms=${hms}    data=${dataList}
    ${responsedata}    To Json    ${addr.content}
    ${number}    Get from Dictionary    ${responsedata["body"]}    number
    Set Global variable    ${number}
    log    ${data}
    [Return]    ${responsedata}

amc问诊记录
    [Arguments]    ${number}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    ${data}    Create Dictionary    number=${number}
    ${addr}    Post Request    api    amc/record_info    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amc常见症状
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amc/common_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

问诊记录添加备注
    [Arguments]    ${number}    ${recordRemark}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    ${data}    Create Dictionary    number=${number}    recordRemark=${recordRemark}
    ${addr}    Post Request    api    amc/update_record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版症状统计图型
    [Arguments]    ${enterTime}    ${recordTime}    ${symptom}    ${gender}    ${subject}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    enterTime=${enterTime}    recordTime=${recordTime}    symptom=${symptom}    gender=${gender}    subject=${subject}
    ${addr}    Post Request    api    /amc/static_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版科室统计图型
    [Arguments]    ${enterTime}    ${recordTime}    ${symptom}    ${gender}    ${subject}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    enterTime=${enterTime}    recordTime=${recordTime}    symptom=${symptom}    gender=${gender}    subject=${subject}
    ${addr}    Post Request    api    /amc/static_subject    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc版症状搜索
    [Arguments]    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}
    ${addr}    Post Request    api    /amc/symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

amcPc客户信息
    [Arguments]    ${authKey}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    authKey=${authKey}
    ${addr}    Post Request    api    /customer_info    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

问诊路径
    [Arguments]    ${symptomId}    ${age}    ${ageType}    ${sex}    ${patientName}    ${saveFlag}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptomId=${symptomId}    age=${age}    ageType=${ageType}    sex=${sex}    patientName=${patientName}
    ...    saveFlag=${saveFlag}
    ${addr}    Post Request    api    /amc/node_tree    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

答题记录
    [Arguments]    ${nodeId}    ${algoIdList}    ${seqIdList}    ${symptomIdList}    ${algoId}    ${seqId}
    ...    ${age}    ${ageType}    ${sex}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${algoIdList}    Create List    ${algoIdList}
    ${seqIdList}    Create List    ${seqIdList}
    ${symptomIdList}    Create List    ${symptomIdList}
    ${data}    Create Dictionary    nodeId=${nodeId}    algoIdList=${algoIdList}    seqIdList=${seqIdList}    symptomIdList=${symptomIdList}    algoId=${algoId}
    ...    seqId=${seqId}    age=${age}    ageType=${ageType}    sex=${sex}
    ${addr}    Post Request    api    /amc/answer_record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

提交记录
    [Arguments]    ${nodeId}    ${algoId}    ${seqId}    ${age}    ${ageType}    ${sex}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    nodeId=${nodeId}    algoId=${algoId}    seqId=${seqId}    age=${age}    ageType=${ageType}
    ...    sex=${sex}
    ${addr}    Post Request    api    /amc/submit_record    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

历史搜索
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /amc/history_symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

症状搜索
    [Arguments]    ${symptom}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}
    ${addr}    Post Request    api    amc/v_4_0/symptom    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

ame登录
    [Arguments]    ${userName}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${ame_url}    ${dict}
    ${data}    Create Dictionary    userName=${userName}    password=${password}
    ${addr}    Post Request    api    ame/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

ame查询
    [Arguments]    ${name}
    ${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${ame_url}    ${dict}
    ${data}    Create Dictionary    name=${name}
    ${addr}    Post Request    api    ame/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

ame管理_用户登录
    [Arguments]    ${doctorName}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${ame_url}    ${dict}
    ${data}    Create Dictionary    doctorName=${doctorName}    password=${password}
    ${addr}    Post Request    api    role/userLogin    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

ame管理_文档关联诊断sug
    [Arguments]    ${diseaseName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${ame_url}    ${dict}
    ${params}    Create Dictionary    diseaseName=${diseaseName}
    ${addr}    Get Request    api    /etXml/queryXmlDiseaseSug?pId=22943,11    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

ame管理_文档列表查询
    [Arguments]    ${zhName}    ${enName}    ${languageType}    ${type}    ${modifyStart}    ${modifyEnd}
    ...    ${index}    ${pageSize}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${ame_url}    ${dict}
    ${data}    Create Dictionary    zhName=${zhName}    enName=${enName}    languageType=${languageType}    type=${type}    modifyStart=${modifyStart}
    ...    modifyEnd=${modifyEnd}    index=${index}    pageSize=${pageSize}
    ${addr}    Post Request    api    /etXml/queryEtXmlList    data=${data}
    log    ${data}
    [Return]    ${responsedata}

识别接口
    [Arguments]    ${symptom}    ${assert}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=78D211AA892A8155EF18F4CDB967043A
    Create Session    api    http://10.117.64.153:8080    ${dict}
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
    log    ${data}
    [Return]    ${responsedata}

用药推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ${addr}    Post Request    api    mayson/v_2_0/medication_regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

用药推荐_宣武
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_xw}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientInfo=${patientInfo}
    ${addr}    Post Request    api    mayson/v_1_0/medication_regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

mayson搜索
    [Arguments]    ${name}    ${hasAssessType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    hasAssessType=${hasAssessType}
    ${addr}    Post Request    api    v_2_0/search/all    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

mayson默认推荐搜索
    [Arguments]    ${doctorGuid}    ${department}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    department=${department}
    ${addr}    Post Request    api    /mayson/track/default_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

治疗方案
    [Arguments]    ${symptom}    ${uuid}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}
    ...    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${examInfo}
    ...    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    symptom=${symptom}    uuid=${uuid}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}
    ...    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}
    ...    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap[]=${confirmDiagnosisMap}
    ...    presentHistory=${presentHistory}
    ${addr}    Post Request    api    athena/v_1_0/regimen    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能诊断4.0
    [Arguments]    ${userGuid}    ${doctorGuid}    ${serialNumber}    ${hospitalGuid}    ${symptom}    ${previousHistory}
    ...    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}
    ...    ${lowBldPress}    ${highBldPress}    ${examInfo}    ${heartRate}    ${age}    ${ageType}
    ...    ${confirmDiagnosis}    ${confirmDiagnosisMap}    ${presentHistory}    ${hasDetail}    ${symptomClickDiseaseId}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    doctorGuid=${doctorGuid}    serialNumber=${serialNumber}    hospitalGuid=${hospitalGuid}    symptom=${symptom}
    ...    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}
    ...    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}
    ...    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}    confirmDiagnosisMap=${confirmDiagnosisMap}    presentHistory=${presentHistory}    hasDetail=${hasDetail}    symptomClickDiseaseId=${symptomClickDiseaseId}
    ${addr}    Post Request    api    v_4_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能推荐门诊
    [Arguments]    ${userGuid}    ${serialNumber}    ${doctorGuid}    ${hospitalGuid}    ${symptom}    ${drugCommonNames}
    ...    ${examinationList}    ${newTestList}    ${labTestList}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${weight}    ${gender}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}
    ...    ${examInfo}    ${heartRate}    ${age}    ${ageType}    ${confirmDiagnosis}    ${confirmDiagnosisMap}
    ...    ${presentHistory}    ${hasDetail}    ${symptomClickDiseaseId}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    # ${drugCommonNames}    Evaluate    [${drugCommonNames}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    doctorGuid=${doctorGuid}    hospitalGuid=${hospitalGuid}    symptom=${symptom}
    ...    drugCommonNames=${drugCommonNames}    examinationList=${examinationList}    newTestList=${newTestList}    labTestList=${labTestList}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    weight=${weight}    gender=${gender}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}
    ...    highBldPress=${highBldPress}    examInfo=${examInfo}    heartRate=${heartRate}    age=${age}    ageType=${ageType}    confirmDiagnosis=${confirmDiagnosis}
    ...    confirmDiagnosisMap=${confirmDiagnosisMap}    presentHistory=${presentHistory}    hasDetail=${hasDetail}    symptomClickDiseaseId=${symptomClickDiseaseId}
    ${addr}    Post Request    api    v_5_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}
    ...    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}    ${prescriptions}
    ...    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
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
    log    ${data}
    [Return]    ${responsedata}

智能推荐v2
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${requestSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}
    ...    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}
    ...    ${prescriptions}    ${currentDiseaseName}    ${medicalOrders}    ${openInterdict}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
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
    ${medicalOrders}    Evaluate    [${medicalOrders}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=${patientName}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientDepartment=${inpatientDepartment}    pageSource=${pageSource}    requestSource=${requestSource}    patientInfo=${patientInfo}    physicalSign=${physicalSign}
    ...    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
    ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}    openInterdict=${openInterdict}
    ${addr}    Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    ${recordId}    Get from Dictionary    ${responsedata["body"]}    recordId
    ${serialNumber}    Get from Dictionary    ${responsedata["body"]["patientInfo"]}    serialNumber
    ${userGuid}    Get from Dictionary    ${responsedata["body"]["patientInfo"]}    userGuid
    Set Global variable    ${recordId}
    Set Global variable    ${userGuid}
    Set Global variable    ${serialNumber}
    log    ${data}
    [Return]    ${responsedata}

智能推荐test
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}
    ...    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}    ${prescriptions}
    ...    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    http://test-mayson.huimeionline.com/cdss    ${dict}
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
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

保存评估历史记录
    [Arguments]    ${recordId}    ${assessId}    ${assessName}    ${patientGuid}    ${serialNumber}    ${assessValue}
    ...    ${assessRemark}    ${assessResult}    ${historyItemList}    ${source}    ${resultContent}    ${assessItemWordIds}
    ...    ${pageSource}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${historyItemList}    Evaluate    [${historyItemList}]
    ${assessItemWordIds}    Evaluate    [${assessItemWordIds}]
    ${data}    Create Dictionary    recordId=${recordId}    assessId=${assessId}    assessName=${assessName}    patientGuid=${patientGuid}    serialNumber=${serialNumber}
    ...    assessRemark=${assessRemark}    assessValue=${assessValue}    assessResult=${assessResult}    historyItemList=${historyItemList}    source=${source}    resultContent=${resultContent}
    ...    assessItemWordIds=${assessItemWordIds}    pageSource=${pageSource}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/save    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${assessHistoryId}    Get From Dictionary    ${responsedata['body']}    assessHistoryId
    Set Global Variable    ${assessHistoryId}
    log    ${data}
    [Return]    ${responsedata}

查询惠每评估表
    [Arguments]    ${doctorGuid}    ${assessId}    ${serialNumber}    ${userGuid}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    assessId=${assessId}    serialNumber=${serialNumber}    userGuid=${userGuid}
    ${addr}    Post Request    api    /mayson/v_1_0/assess/query    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${assessHistoryId}    Get From Dictionary    ${responsedata['body']}    assessHistoryId
    # Set Global Variable    ${assessHistoryId}
    log    ${data}
    [Return]    ${responsedata}

根据评估历史记录id查询评估记录
    [Arguments]    ${Id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    ${data}    Create Dictionary    Id=${Id}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorybyid    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # 评估表历史记录
    #    [Arguments]    ${patientGuid}    ${serialNumber}
    #    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    Create Session    api    ${mayson_url}    ${dict}
    #    ${data}    Create Dictionary    patientGuid=${patientGuid}    serialNumber=${serialNumber}
    #    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorylist    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    [Return]    ${responsedata}
    log    ${data}
    log    ${data}
    [Return]    ${responsedata}

查询评估表历史列表
    [Arguments]    ${patientGuid}    ${serialNumber}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    patientGuid=${patientGuid}    serialNumber=${serialNumber}
    ${addr}    Post Request    api    /mayson/v_1_0/assesshistory/findhistorylist    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${assessHistoryId}    Get From Dictionary    ${responsedata['body']}    assessHistoryId
    # Set Global Variable    ${assessHistoryId}
    log    ${data}
    [Return]    ${responsedata}

搜索文献
    [Arguments]    ${name}    ${diseaseId}    ${pageSize}    ${currentPage}    ${startDate}    ${endDate}
    ...    ${departmentId}    ${countryId}    ${orgName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    diseaseId=${diseaseId}    pageSize=${pageSize}    currentPage=${currentPage}    startDate=${startDate}
    ...    endDate=${endDate}    departmentId=${departmentId}    countryId=${countryId}    orgName=${orgName}
    ${addr}    Post Request    api    /seer/document/search    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

最新文献
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /seer/document/newest    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献详情
    [Arguments]    ${documentId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary    documentId=${documentId}
    ${addr}    Post Request    api    /seer/v_1_0/document/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献标签
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /seer/document/label    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献下载
    [Arguments]    ${fileName}    ${filePath}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${params}    Create Dictionary    fileName=${fileName}    filePath=${filePath}
    ${addr}    Get Request    api    /seer/document/download    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}

申请文献
    [Arguments]    ${documentName}    ${applyOrg}    ${applySection}    ${applyMessage}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary    documentName=${documentName}    applyOrg=${applyOrg}    applySection=${applySection}    applyMessage=${applyMessage}
    ${addr}    Post Request    api    /seer/document/apply    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献诊断字典
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /seer/document/disease_dict    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献申请列表
    [Arguments]    ${pageSize}    ${currentPage}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary    pageSize=${pageSize}    currentPage=${currentPage}
    ${addr}    Post Request    api    /seer/document/apply_list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${id}    Get From Dictionary    ${responsedata['body']['customerList'][0]}    id
    Set Global Variable    ${id}
    log    ${data}
    [Return]    ${responsedata}

修改文献热度
    [Arguments]    ${id}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${doc_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    /seer/document/update_hot    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

mayson默认推荐
    [Arguments]    ${doctorGuid}    ${department}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    doctorGuid=${doctorGuid}    department=${department}
    ${addr}    Post Request    api    /mayson/track/default_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

风火山林甲状腺
    [Arguments]    ${userGuid}    ${serialNumber}    ${gender}    ${age}    ${ageType}    ${examinationName}
    ...    ${examinationDesc}    ${examinationResult}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    gender=${gender}    age=${age}    ageType=${ageType}
    ...    examinationDesc=${examinationDesc}    examinationResult=${examinationResult}
    ${addr}    Post Request    api    /mayson/v_1_1/smart_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
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
    ${data}    Create Dictionary    examId=${examId}
    ${addr}    Post Request    api    /v_2_0/exam/detail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

检查结果
    [Arguments]    ${serialNumber}    ${inpatientDepartment}    ${userGuid}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientArea}    ${requestSource}    ${patientName}    ${openInterdict}    ${patientInfo}    ${physicalSign}
    ...    ${examinationList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${physicalSign}    Evaluate    dict(${physicalSign})
    ${examinationList}    Evaluate    [${examinationList}]
    ${data}    Create Dictionary    serialNumber=${serialNumber}    inpatientDepartment=${inpatientDepartment}    userGuid=${userGuid}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientArea=${inpatientArea}    requestSource=${requestSource}    patientName=${patientName}    openInterdict=${openInterdict}    patientInfo=${patientInfo}
    ...    physicalSign=${physicalSign}    examinationList=${examinationList}
    ${addr}    Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能推荐_医生团队
    [Arguments]    ${userGuid}    ${serialNumber}    ${doctorGuid}    ${doctorName}    ${pageSource}    ${patientInfo}
    ...    ${physicalSign}    ${definiteDiagnosis}    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}
    ...    ${newTestList}    ${operationRecord}    ${prescriptions}    ${currentDiseaseName}    ${medicalOrders}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=D7928B9182ABF6E0A6A6EBB71B353585
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
    log    ${data}
    [Return]    ${responsedata}

新算法识别接口
    [Arguments]    ${contents}
    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${mayson_url_sf}    ${dict}
    ${contents}    Evaluate    [${contents}]
    ${data}    Create Dictionary    contents=${contents}
    ${addr}    Post Request    api    inference    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能推荐_围手术期
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${requestSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}
    ...    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}
    ...    ${prescriptions}    ${currentDiseaseName}    ${medicalOrders}    ${openInterdict}
    ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
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
    ${medicalOrders}    Evaluate    [${medicalOrders}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=${patientName}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientDepartment=${inpatientDepartment}    pageSource=${pageSource}    requestSource=${requestSource}    patientInfo=${patientInfo}    physicalSign=${physicalSign}
    ...    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
    ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}    openInterdict=${openInterdict}
    ${addr}    Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${operationId}    Get from Dictionary    ${responsedata["body"]["qualityControlResponse"]["checkListResp"][0]}    operationId
    Set Global variable    ${operationId}
    ${recordId}    Get from Dictionary    ${responsedata["body"]}    recordId
    Set Global variable    ${recordId}
    log    ${data}
    [Return]    ${responsedata}

围手术期checklist
    [Arguments]    ${operationId}    ${recordId}
    ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    operationId=${operationId}    recordId=${recordId}
    ${addr}    Post Request    api    sentry/v_2_0/cl/get_check_list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${operationId}    Get from Dictionary    ${responsedata["body"]["qualityControlResponse"]["checkListResp"][0]}    operationId
    # Set Global variable    ${operationId}
    ${id}    Get from Dictionary    ${responsedata["body"]['checkListResp'][0]['checkListItem'][0][0]}    id
    Set Global variable    ${id}
    log    ${data}
    [Return]    ${responsedata}

围手术期checklist更新
    [Arguments]    ${checkListItem}    ${recordId}
    ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
    ${checkListItem}    Evaluate    [[${checkListItem}]]
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    checkListItem=${checkListItem}    recordId=${recordId}
    ${addr}    Post Request    api    sentry/v_2_0/cl/update    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    active/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

新版质控统计明细
    [Arguments]    ${id}
    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    /active/queryChartConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

新版质控统计
    [Arguments]    ${id}
    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    active/queryChartConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

adminse登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    node/user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

下发规则
    [Arguments]    ${customerId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${adminse}    ${dict}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    customerId=${customerId}
    ${addr}    Post Request    api    /mayson/effectTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
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
    log    ${data}
    [Return]    ${responsedata}

检查检验查看
    [Arguments]    ${customerId}    ${index}    ${pageSize}    ${orderBy}    ${sourceType}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    customerId=${customerId}    index=${index}    pageSize=${pageSize}    orderBy=${orderBy}    sourceType=${sourceType}
    ${addr}    Post Request    api    node/dictionary/queryExamCustomerList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献首页
    [Arguments]    ${fileName}    ${filePath}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    http://test-doc.huimeionline.com/index.html?auth=%7B%22autherKey%22%3A%227195F12825788F09375C2DB1E922F108%22    ${dict}
    #${params}    Create Dictionary    fileName=${fileName}    filePath=${filePath}
    ${addr}    Get Request    api
    [Return]    ${addr}

病情评估_儿童哮喘
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronicDiseaseId}    ${sex}
    ...    ${riskFactorId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    chronicDiseaseId=${chronicDiseaseId}
    ...    sex=${sex}    riskFactorId=${riskFactorId}
    ${addr}    Post Request    api    /ncds/v_1_0/chronicdisease/asthma/recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

药物治疗
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronic_disease_id}    ${sex}
    ...    ${categoryId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    chronic_disease_id=${chronic_disease_id}
    ...    sex=${sex}    categoryId=${categoryId}
    ${addr}    Post Request    api    /ncds/v_1_0/chronicdisease/medicine    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

患者教育
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronicDiseaseId}    ${sex}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    diseaseId=${chronicDiseaseId}
    ...    sex=${sex}
    ${addr}    Post Request    api    /v_2_0/disease/patientInstructor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

慢病打开
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronicDiseaseId}    ${sex}
    ...    ${assistExamineDiabetesPojo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    chronicDiseaseId=${chronicDiseaseId}
    ...    sex=${sex}    assistExamineDiabetesPojo=${assistExamineDiabetesPojo}
    ${addr}    Post Request    api    /ncds/v_1_0/chronicdisease/init    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病情评估_糖尿病
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronicDiseaseId}    ${sex}
    ...    ${riskFactorId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    chronicDiseaseId=${chronicDiseaseId}
    ...    sex=${sex}    riskFactorId=${riskFactorId}
    ${addr}    Post Request    api    /ncds/v_1_0/chronicdisease/recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

慢病打开_三高
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronicDiseaseId}    ${sex}
    ...    ${assistExamineDiabetesPojo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    chronicDiseaseId=${chronicDiseaseId}
    ...    sex=${sex}    assistExamineDiabetesPojo=${assistExamineDiabetesPojo}
    ${addr}    Post Request    api    /ncds/v_1_0/chronicdisease/threehigh/baseinfo/init    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

慢病打开_高血压
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${chronicDiseaseId}    ${sex}
    ...    ${assistExamineDiabetesPojo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    chronicDiseaseId=${chronicDiseaseId}
    ...    sex=${sex}    assistExamineDiabetesPojo=${assistExamineDiabetesPojo}
    ${addr}    Post Request    api    /ncds/v_1_1/blood_pressure_exam_info_acquire    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病情评估_高血压
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${bloodPressure}    ${gender}
    ...    ${dangerFactors}    ${deeperConfirms}    ${pastMedicalHistory}    ${targetOrganDamages}    ${personalHistory}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${bloodPressure}    Evaluate    dict(${bloodPressure})
    ${dangerFactors}    Evaluate    [${dangerFactors}]
    ${deeperConfirms}    Evaluate    [${deeperConfirms}]
    ${pastMedicalHistory}    Evaluate    [${pastMedicalHistory}]
    ${targetOrganDamages}    Evaluate    [${targetOrganDamages}]
    ${personalHistory}    Evaluate    [${personalHistory}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    bloodPressure=${bloodPressure}
    ...    gender=${gender}    dangerFactors=${dangerFactors}    deeperConfirms=${deeperConfirms}    pastMedicalHistory=${pastMedicalHistory}    targetOrganDamages=${targetOrganDamages}    personalHistory=${personalHistory}
    ${addr}    Post Request    api    /ncds/v_1_1/hbp_treatment_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

药物治疗_高血压
    [Arguments]    ${userGuid}    ${serialNumber}    ${age}    ${ageType}    ${classification}    ${sex}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    age=${age}    ageType=${ageType}    classification=${classification}
    ...    sex=${sex}
    ${addr}    Post Request    api    /ncds/v_1_1/antihypertensive_drug    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

药品详情_对接版
    [Arguments]    ${drugId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    drugId=${drugId}    customEnv=${customEnv}
    ${addr}    Get Request    api    /athena/v_1_0/article/drug?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

检查检验_对接版
    [Arguments]    ${examId}    ${customEnv}    ${examType}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    examId=${examId}    customEnv=${customEnv}    examType=${examType}
    ${addr}    Get Request    api    /athena/v_1_0/article/exam?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

检查建议_对接版
    [Arguments]    ${diseaseId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    diseaseId=${diseaseId}    customEnv=${customEnv}
    ${addr}    Get Request    api    /athena/v_1_0/article/exam_advice?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

处置建议_对接版
    [Arguments]    ${diseaseId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    diseaseId=${diseaseId}    customEnv=${customEnv}
    ${addr}    Get Request    api    /athena/v_1_0/article/dispose_advice?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

用药建议_对接版
    [Arguments]    ${diseaseId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    diseaseId=${diseaseId}    customEnv=${customEnv}
    ${addr}    Get Request    api    /athena/v_1_0/article/drug_advice?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

患者指导_对接版
    [Arguments]    ${diseaseId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    diseaseId=${diseaseId}    customEnv=${customEnv}
    ${addr}    Get Request    api    /athena/v_1_0/article/patient_guide?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

疾病险情_对接版
    [Arguments]    ${diseaseId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    diseaseId=${diseaseId}    customEnv=${customEnv}
    ${addr}    Get Request    api    /athena/v_1_0/article/disease?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

质控已完成
    [Arguments]    ${userGuid}    ${serialNumber}    ${projectId}    ${doctorGuid}    ${operate}    ${guid}
    ...    ${type}    ${qcDiseaseDiagnosisList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${qcDiseaseDiagnosisList}    Evaluate    dict(${qcDiseaseDiagnosisList})
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    projectId=${projectId}    doctorGuid=${doctorGuid}    operate=${operate}
    ...    guid=${guid}    type=${type}    qcDiseaseDiagnosisList=${qcDiseaseDiagnosisList}
    ${addr}    Post Request    api    /sentry/v_2_0/qc/result    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献图片差异
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${athenaDoc_url}    ${dict}
    ${params}    Create Dictionary
    ${addr}    Get Request    api    /athena/file/imgCompare    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

文献文件差异
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${athenaDoc_url}    ${dict}
    ${params}    Create Dictionary
    ${addr}    Get Request    api    /athena/file/defrct_def    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

检验检查操作说明
    [Arguments]    ${examId}    ${examType}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    examId=${examId}    examType=${examType}    customEnv=${customEnv}
    ${addr}    Get Request    api    cdss/athena/v_1_0/article/page/exam?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

药品说明书
    [Arguments]    ${drugId}    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    drugId=${drugId}    customEnv=${customEnv}
    ${addr}    Get Request    api    cdss/athena/v_1_0/article/drug?    params=${params}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

手术合理性
    [Arguments]    ${patientGuid}    ${serialNumber}    ${department}    ${doctorGuid}    ${examId}    ${examType}
    ...    ${customEnv}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    patientGuid=${patientGuid}    serialNumber=${serialNumber}    department=${department}    doctorGuid=${doctorGuid}    examId=${examId}
    ...    examType=${examType}    customEnv=${customEnv}
    ${addr}    Post Request    api    cdss/mayson/v_1_0/logical_exam    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

伏羲调度任务更新
    [Arguments]    ${id}    ${remark}    ${sourceLinkId}    ${taskDate}    ${taskHour}    ${taskMinute}
    ...    ${taskName}    ${taskSecond}    ${taskSql}    ${taskStatus}    ${taskType}    ${taskWeek}
    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}    remark=${remark}    sourceLinkId=${sourceLinkId}    taskDate=${taskDate}    taskHour=${taskHour}
    ...    taskMinute=${taskMinute}    taskName=${taskName}    taskSecond=${taskSecond}    taskSql=${taskSql}    taskStatus=${taskStatus}    taskType=${taskType}
    ...    taskWeek=${taskWeek}
    ${addr}    Post Request    api    task/updateTaskInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

VTE2快速确认
    [Arguments]    ${aiResult}    ${assessId}    ${assessItem}    ${assessPostil}    ${assessResultItemList}    ${compare}
    ...    ${expressId}    ${fileName}    ${ignore}    ${productId}    ${projectId}    ${qcDiseaseDiagnosisList}
    ...    ${doctorGuid}    ${pageSource}    ${recordId}    ${assessResultType}
    ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
    Create Session    api    ${mayson_url}    ${dict}
    ${aiResult}    Evaluate    dict(${aiResult})
    ${assessResultItemList}    Evaluate    [${assessResultItemList}]
    ${qcDiseaseDiagnosisList}    Evaluate    [${qcDiseaseDiagnosisList}]
    ${data}    Create Dictionary    aiResult=${aiResult}    assessId=${assessId}    assessItem=${assessItem}    assessPostil=${assessPostil}    assessResultItemList=${assessResultItemList}
    ...    compare=${compare}    expressId=${expressId}    fileName=${fileName}    ignore=${ignore}    productId=${productId}    projectId=${projectId}
    ...    qcDiseaseDiagnosisList=${qcDiseaseDiagnosisList}    doctorGuid=${doctorGuid}    pageSource=${pageSource}    recordId=${recordId}    assessResultType=${assessResultType}
    ${addr}    Post Request    api    /sentry/assess/save    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病案首页_病历质控
    [Arguments]    ${userGuid}    ${serialNumber}    ${doctorGuid}    ${pageSource}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    doctorGuid=${doctorGuid}    pageSource=${pageSource}
    ${addr}    Post Request    api    mayson/v_1_0/medical_record_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${recordId}    Get from Dictionary    ${responsedata["body"]}    recordId
    Set Global variable    ${recordId}
    log    ${data}
    [Return]    ${responsedata}

病历质控初始化数据
    [Arguments]    ${patientGuid}    ${serialNumber}    ${doctorGuid}    ${pageSource}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    patientGuid=${patientGuid}    serialNumber=${serialNumber}    doctorGuid=${doctorGuid}    pageSource=${pageSource}
    ${addr}    Post Request    api    mayson/v_1_0/init_mc_data    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历质控平台登录
    [Arguments]    ${name}    ${password}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${songshan_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    manage/userLogin    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历查询患者列表
    [Arguments]    ${order}    ${time_start}    ${time_end}    ${time_type}    ${inpatient_department}    ${patient_area}
    ...    ${display_id}    ${case_no}    ${serial_number}    ${patient_name}    ${doctor_name}    ${problem_start}
    ...    ${problem_end}    ${status}    ${name_id_list}    ${display_type}    ${line_item_veto}    ${index_start}
    ...    ${index_end}    ${total_start}    ${total_end}    ${category_id}    ${page_size}    ${current_index}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    order=${order}    time_start=${time_start}    time_end=${time_end}    time_type=${time_type}    inpatient_department=${inpatient_department}
    ...    patient_area=${patient_area}    display_id=${display_id}    case_no=${case_no}    serial_number=${serial_number}    patient_name=${patient_name}    doctor_name=${doctor_name}
    ...    problem_start=${problem_start}    problem_end=${problem_end}    status=${status}    name_id_list=${name_id_list}    display_type=${display_type}    line_item_veto=${line_item_veto}
    ...    index_start=${index_start}    index_end=${index_end}    total_start=${total_start}    total_end=${total_end}    category_id=${category_id}    page_size=${page_size}
    ...    current_index=${current_index}
    ${addr}    Post Request    api    /mc/mcRecordInfoList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${record_id}    Get From Dictionary    ${responsedata['data']['list'][0]}    record_id
    # Set Global Variable    ${record_id}
    log    ${data}
    [Return]    ${responsedata}

问题分析列表
    [Arguments]    ${order}    ${name_id}    ${category_id}    ${time_start}    ${time_end}    ${inpatient_department}
    ...    ${display_type}    ${line_item_veto}    ${page_size}    ${current_index}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    order=${order}    name_id=${name_id}    category_id=${category_id}    time_start=${time_start}    time_end=${time_end}
    ...    inpatient_department=${inpatient_department}    display_type=${display_type}    line_item_veto=${line_item_veto}    page_size=${page_size}    current_index=${current_index}
    ${addr}    Post Request    api    /mc/ruleProblemList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

惠每用户中心登录
    [Arguments]    ${name}    ${password}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${taishan_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

惠每用户中心首页列表
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${inside_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    product/homeList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台登录
    [Arguments]    ${name}    ${password}    ${time}    ${type}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}    time=${time}    type=${type}
    ${addr}    Post Request    api    manage/userLogin    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台统计管理
    [Arguments]    ${start_time}    ${end_time}    ${disease}    ${doctor}    ${patient}    ${project}
    ...    ${specialDisease}    ${time_type}    ${query_type}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    start_time=${start_time}    end_time=${end_time}    disease=${disease}    doctor=${doctor}    patient=${patient}
    ...    project=${project}    specialDisease=${specialDisease}    time_type=${time_type}    query_type=${query_type}
    ${addr}    Post Request    api    statistic/relationDic    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台临床风险预警
    [Arguments]    ${start_time}    ${end_time}    ${dept_type}    ${dept_name}    ${disease_code}    ${disease_class}
    ...    ${doctor_code}    ${doctor_name}    ${patient_name}    ${time_type}    ${order}    ${current_index}
    ...    ${page_size}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${order}    Evaluate    ${order}
    ${data}    Create Dictionary    start_time=${start_time}    end_time=${end_time}    dept_type=${dept_type}    dept_name=${dept_name}    disease_code=${disease_code}
    ...    disease_class=${disease_class}    doctor_code=${doctor_code}    doctor_name=${doctor_name}    patient_name=${patient_name}    time_type=${time_type}    order=${order}
    ...    current_index=${current_index}    page_size=${page_size}
    ${addr}    Post Request    api    statistic/qcItemDetailList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

智能推荐-绿道
    [Arguments]    ${userGuid}    ${serialNumber}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}
    ...    ${weight}    ${bodyTempr}    ${lowBldPress}    ${highBldPress}    ${heartRate}    ${height}
    ...    ${waistline}    ${presentHistory}    ${symptomClickDiseaseId}    ${confirmDiagnosis}    ${gender}    ${age}
    ...    ${ageType}    ${symptom}    ${confirmDiagnosisMap}    ${drugCommonNames}    ${examinationList}    ${newTestList}
    ...    ${labTestList}    ${patientName}    ${inpatientDepartment}    ${progressNoteList}    ${patientInfo}    ${doctorName}
    ...    ${doctorGuid}
    ${confirmDiagnosisMap}    Evaluate    [${confirmDiagnosisMap}]
    ${drugCommonNames}    Evaluate    [${drugCommonNames}]
    ${examinationList}    Evaluate    [${examinationList}]
    ${newTestList}    Evaluate    [${newTestList}]
    ${labTestList}    Evaluate    [${labTestList}]
    ${progressNoteList}    Evaluate    [${progressNoteList}]
    ${patientInfo}    Evaluate    ${patientInfo}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}
    ...    familyHistory=${familyHistory}    weight=${weight}    bodyTempr=${bodyTempr}    lowBldPress=${lowBldPress}    highBldPress=${highBldPress}    heartRate=${heartRate}
    ...    height=${height}    waistline=${waistline}    presentHistory=${presentHistory}    symptomClickDiseaseId=${symptomClickDiseaseId}    confirmDiagnosis=${confirmDiagnosis}    gender=${gender}
    ...    age=${age}    ageType=${ageType}    symptom=${symptom}    confirmDiagnosisMap=${confirmDiagnosisMap}    drugCommonNames=${drugCommonNames}    examinationList=${examinationList}
    ...    newTestList=${newTestList}    labTestList=${labTestList}    patientName=${patientName}    inpatientDepartment=${inpatientDepartment}    progressNoteList=${progressNoteList}    patientInfo=${patientInfo}
    ...    doctorName=${doctorName}    doctorGuid=${doctorGuid}
    ${addr}    Post Request    api    v_5_0/diagnose_through_interrogation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

医院知识库登录
    [Arguments]    ${name}    ${password}    ${type}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${huashan_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}    type=${type}
    ${addr}    Post Request    api    user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

医院知识库知识维护
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${huashan_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    article/typeCount    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

绿道登录
    [Arguments]    ${name}    ${password}    ${type}    ${time}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${lvdao_url}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}    type=${type}    time=${time}
    ${addr}    Post Request    api    manage/userLogin    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

绿道入组
    [Arguments]    ${end}    ${groupId}    ${index}    ${joinWay}    ${needRecommend}    ${pageSize}
    ...    ${reportId}    ${seachBody}    ${start}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    end=${end}    groupId=${groupId}    index=${index}    joinWay=${joinWay}    needRecommend=${needRecommend}
    ...    pageSize=${pageSize}    reportId==${reportId}    seachBody=${seachBody}    start=${start}
    ${addr}    Post Request    api    patient/getcasesList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

绿道填报
    [Arguments]    ${end}    ${from}    ${index}    ${pageSize}    ${seachBody}    ${start}
    ...    ${status}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    end=${end}    from=${from}    index=${index}    pageSize=${pageSize}    seachBody=${seachBody}
    ...    start=${start}    status=${status}
    log    ${data}
    ${addr}    Post Request    api    patient/getPatientList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

评估表html转PDF
    [Arguments]    ${htmlStr}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    htmlStr=${htmlStr}
    ${addr}    Post Request    api    mayson/api/assess_to_pdf    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

评估表打印下载
    [Arguments]    ${pdfName}    ${pdfPath}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary    pdfName=${pdfName}    pdfPath=${pdfPath}
    ${addr}    Get Request    api    /mayson/api/assess_pdf_download?hmj={"Huimei_id":"D7928B9182ABF6E0A6A6EBB71B353585"}    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}

病历查询基础信息
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /mc/mcBaseInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历详情
    [Arguments]    ${record_id}
    ${data}    Create Dictionary    record_id=${record_id}
    ${addr}    Post Request    api    /mc/mcRecordInfoDetail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${record_id}    Get From Dictionary    ${responsedata['data']['detail']}    record_id
    Set Global Variable    ${record_id}
    log    ${data}
    [Return]    ${responsedata}

驳回批注下载
    [Arguments]    ${param}    ${filePath}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${songshan_url}    ${dict}
    ${params}    Create Dictionary    param=${param}    filePath=${filePath}
    ${addr}    Get Request    api    /mc/mcRecordInfoDownload    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}

病历详情结果列表
    [Arguments]    ${record_id}    ${result}
    ${data}    Create Dictionary    record_id=${record_id}    result=${result}
    ${addr}    Post Request    api    /mc/mcRecordInfoResultList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取科室类别
    [Arguments]    ${order}    ${type}    ${date}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    order=${order}    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getTJDepartByCategory    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取基本信息
    [Arguments]    ${type}    ${date}
    ${data}    Create Dictionary    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getTJBasInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取科室显示
    [Arguments]    ${order}    ${type}    ${date}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    order=${order}    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getTJDepartByDispaly    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取统计趋势
    [Arguments]    ${type}    ${date}
    ${data}    Create Dictionary    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getTJTrend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取级别基本信息
    [Arguments]    ${type}    ${date}
    ${data}    Create Dictionary    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getTJBasInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取科室级别
    [Arguments]    ${order}    ${type}    ${date}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    order=${order}    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getTJDepartByGrade    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_获取科室级别显示
    [Arguments]    ${order}    ${type}    ${date}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    order=${order}    type=${type}    date=${date}
    ${addr}    Post Request    api    /tj/getGradeDepartByDispaly    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历质控规则查询显示列表
    [Arguments]    ${content}    ${filter_type}    ${category_id}    ${black_type}    ${order}    ${recommend_level}
    ...    ${current_index}    ${page_size}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    content=${content}    filter_type=${filter_type}    category_id=${category_id}    black_type=${black_type}    order=${order}
    ...    recommend_level=${recommend_level}    current_index=${current_index}    page_size=${page_size}
    ${addr}    Post Request    api    /mc/mcRuleList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历质控规则下载
    ${Cookie_value}    Set_variable    SONGSHANSESSIONID=442534a4d0506c9c3737a474a419d2ba0ad2c2901303911a    userInfo=%7B%22id%22%3A13%2C%22name%22%3A%22privateTesting%22%2C%22create_time%22%3A%222020-02-19T07%3A17%3A27.000Z%22%2C%22modify_time%22%3A%222020-02-19T07%3A17%3A27.000Z%22%2C%22BURRIED_URL%22%3A%22http%3A//mayson.huimeionline.com%22%7D
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}    Cookie=${Cookie_value}
    Create Session    api    ${mayson_url}    ${dict}
    ${params}    Create Dictionary
    ${addr}    Get Request    api    /mc/mcRuleDownload    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    [Return]    ${addr}

统计_工作台_特征统计
    [Arguments]    ${time_start}    ${time_end}
    ${data}    Create Dictionary    time_start=${time_start}    time_end=${time_end}
    ${addr}    Post Request    api    /work/workFeatureTJ    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台_目标分布
    [Arguments]    ${time_start}    ${time_end}
    ${data}    Create Dictionary    time_start=${time_start}    time_end=${time_end}
    ${addr}    Post Request    api    /work/workTargetDistribution    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台_workAppraisTaskTJ
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /work/workAppraisTaskTJ    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台_质量统计
    [Arguments]    ${type}    ${content}    ${page_size}    ${current_index}    ${time_start}    ${time_end}
    ${data}    Create Dictionary    type=${type}    content=${content}    page_size=${page_size}    current_index=${current_index}    time_start=${time_start}
    ...    time_end=${time_end}
    ${addr}    Post Request    api    /work/workQualityTJ    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台_质控问题描述
    [Arguments]    ${time_start}    ${time_end}
    ${data}    Create Dictionary    time_start=${time_start}    time_end=${time_end}
    ${addr}    Post Request    api    /work/workProblemDistribution    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台todo
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /work/workTodo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台_病历等级统计
    [Arguments]    ${time_start}    ${time_end}
    ${data}    Create Dictionary    time_start=${time_start}    time_end=${time_end}
    ${addr}    Post Request    api    /work/workLevelTJ    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

统计_工作台_出院病历质量统计
    [Arguments]    ${type}    ${time_start}    ${time_end}
    ${data}    Create Dictionary    type=${type}    time_start=${time_start}    time_end=${time_end}
    ${addr}    Post Request    api    /work/workApprovalStatusTJ    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历质控评价管理批次列表
    [Arguments]    ${name}    ${status}    ${type}    ${order}    ${current_index}    ${page_size}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    name=${name}    status=${status}    type=${type}    order=${order}    current_index=${current_index}
    ...    page_size=${page_size}
    ${addr}    Post Request    api    /appraise/appraiseList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

用户列表
    [Arguments]    ${content}    ${jump}    ${order}    ${current_index}    ${page_size}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    content=${content}    jump=${jump}    order=${order}    current_index=${current_index}    page_size=${page_size}
    ${addr}    Post Request    api    /manage/userList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

账号管理医生组列表
    [Arguments]    ${content}    ${order}    ${current_index}    ${page_size}
    ${order}    Evaluate    dict(${order})
    ${data}    Create Dictionary    content=${content}    order=${order}    current_index=${current_index}    page_size=${page_size}
    ${addr}    Post Request    api    /manage/doctorGroupList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历查询问题描述列表
    ${data}    Create Dictionary
    ${addr}    Post Request    api    /mc/mcProjectList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

规则提醒级别配置
    [Arguments]    ${group_code}    ${recommend_level}    ${type}
    ${data}    Create Dictionary    group_code=${group_code}    recommend_level=${recommend_level}    type=${type}
    ${addr}    Post Request    api    /mc/upRuleConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

快速确认评估表
    [Arguments]    ${assessDictName}    ${assessId}    ${assessName}    ${assessResult}    ${assessValue}    ${assessValueUnit}
    ...    ${displayResult}    ${expressId}    ${productId}    ${projectId}    ${assessResultItemList}    ${doctorGuid}
    ...    ${serialNumber}    ${userGuid}    ${pageSource}    ${recordId}    ${assessResultType}    ${ruleNumber}
    ...    ${isConfirmNurse}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${assessResultItemList}    Evaluate    [${assessResultItemList}]
    ${data}    Create Dictionary    assessDictName=${assessDictName}    assessId=${assessId}    assessName=${assessName}    assessResult=${assessResult}    assessValue=${assessValue}
    ...    assessValueUnit=${assessValueUnit}    displayResult=${displayResult}    expressId=${expressId}    productId=${productId}    projectId=${projectId}    assessResultItemList=${assessResultItemList}
    ...    doctorGuid=${doctorGuid}    serialNumber=${serialNumber}    userGuid=${userGuid}    pageSource=${pageSource}    recordId=${recordId}    assessResultType=${assessResultType}
    ...    ruleNumber=${ruleNumber}    isConfirmNurse=${isConfirmNurse}
    ${addr}    Post Request    api    /sentry/assess/save    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

庄周登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    log    ${data}
    ${addr}    Post Request    api    user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

庄周_填报汇总
    [Arguments]    ${startDate}    ${endDate}    ${type}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    type=${type}
    log    ${data}
    ${addr}    Post Request    api    fillSummary/list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

庄周_患者统计
    [Arguments]    ${startDate}    ${endDate}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}
    log    ${data}
    ${addr}    Post Request    api    patientsStatistics/list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

内涵质控
    [Arguments]    ${masterProfile}    ${recordDatas}    ${recordId}    ${ruleCodes}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${mayson_url}    ${dict}
    Create Session    api    ${connotation_url}:9998    ${dict}
    ${masterProfile}    Evaluate    dict(${masterProfile})
    ${recordDatas}    Evaluate    dict(${recordDatas})
    ${data}    Create Dictionary    masterProfile=${masterProfile}    recordDatas=${recordDatas}    recordId=${recordId}    ruleCodes=${ruleCodes}
    ${addr}    Post Request    api    v_1_0/quality_control    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

首页质控
    [Arguments]    ${masterProfile}    ${recordDatas}    ${recordId}    ${ruleCodes}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${mayson_url}    ${dict}
    # Create Session    api    ${connotation_url}:9120    ${dict}
    Create Session    api    ${connotation_url}:8091    ${dict}
    ${masterProfile}    Evaluate    dict(${masterProfile})
    ${recordDatas}    Evaluate    dict(${recordDatas})
    # ${recordId}    Evaluate    [${recordId}]
    # ${ruleCodes}    Evaluate    [${ruleCodes}]
    ${data}    Create Dictionary    masterProfile=${masterProfile}    recordDatas=${recordDatas}    recordId=${recordId}    ruleCodes=${ruleCodes}
    ${addr}    Post Request    api    pangoo/ruleengine/homePage    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

房颤指征
    [Arguments]    ${recordId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${data}    Create Dictionary    recordId=${recordId}
    ${addr}    Post Request    api    mayson/v_1_0/mayson_response_cache    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

房颤申请会诊
    [Arguments]    ${qcConsultationRequset}    ${assessResultRequest}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${qcConsultationRequset}    Evaluate    dict(${qcConsultationRequset})
    ${assessResultRequest}    Evaluate    dict(${assessResultRequest})
    # ${physicalSign}    Evaluate    dict(${physicalSign})
    ${data}    Create Dictionary    recordId=${recordId}    qcConsultationRequset=${qcConsultationRequset}    assessResultRequest=${assessResultRequest}
    ${addr}    Post Request    api    sentry/v_2_0/qc/applyForConsultation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

庄周_患者信息
    [Arguments]    ${disease_duration_type}    ${endDate}    ${group_name}    ${index}    ${not_treat_reason}    ${source_way}
    ...    ${startDate}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    disease_duration_type=${disease_duration_type}    endDate=${endDate}    group_name=${group_name}    index=${index}    not_treat_reason=${not_treat_reason}
    ...    source_way=${source_way}    startDate=${startDate}
    log    ${data}
    ${addr}    Post Request    api    patientsStatistics/patientInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_出院人次
    [Arguments]    ${dept_code}    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}
    ...    ${query_type}    ${start_time}    ${time_type}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_code=${dept_code}    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}
    ...    end_time=${end_time}    query_type=${query_type}    start_time=${start_time}    time_type=${time_type}
    ${addr}    Post Request    api    statistic/patientVisitData    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_住院天数
    [Arguments]    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}    ${start_time}
    ...    ${time_type}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}    end_time=${end_time}
    ...    start_time=${start_time}    time_type=${time_type}
    ${addr}    Post Request    api    statistic/patientInhouseNum    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_年龄分布
    [Arguments]    ${dept_code}    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}
    ...    ${start_time}    ${time_type}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_code=${dept_code}    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}
    ...    end_time=${end_time}    start_time=${start_time}    time_type=${time_type}
    ${addr}    Post Request    api    statistic/patientAgeSpread    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_主管医生
    [Arguments]    ${dept_code}    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}
    ...    ${start_time}    ${time_type}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_code=${dept_code}    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}
    ...    end_time=${end_time}    start_time=${start_time}    time_type=${time_type}
    ${addr}    Post Request    api    statistic/patientDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_单病种概况
    [Arguments]    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}    ${start_time}
    ...    ${time_type}    ${doctor_code}    ${doctor_name}    ${current_index}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}    end_time=${end_time}
    ...    start_time=${start_time}    time_type=${time_type}    doctor_code=${doctor_code}    doctor_name=${doctor_name}    current_index=${current_index}
    ${addr}    Post Request    api    statistic/qcItemDetailList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_医生质控监测
    [Arguments]    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}    ${start_time}
    ...    ${time_type}    ${project_code}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}    end_time=${end_time}
    ...    start_time=${start_time}    time_type=${time_type}    project_code=${project_code}
    ${addr}    Post Request    api    statistic/qcDoctorChartData    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

临床质量管理平台_科室质控监测
    [Arguments]    ${dept_name}    ${dept_type}    ${disease_class}    ${disease_code}    ${end_time}    ${start_time}
    ...    ${time_type}    ${project_code}
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary    dept_name=${dept_name}    dept_type=${dept_type}    disease_class=${disease_class}    disease_code=${disease_code}    end_time=${end_time}
    ...    start_time=${start_time}    time_type=${time_type}    project_code=${project_code}
    ${addr}    Post Request    api    statistic/qcDepartmentChartData    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

绿道_全局
    # ${Cookie_value}    Set_variable    hmdocMaysonInfo=%7B%221%22%3A%7B%22status%22%3A2%7D%2C%221507520888%22%3A%7B%22status%22%3A2%7D%2C%220210497%22%3A%7B%22status%22%3A2%7D%7D
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${tesla_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    patient/groupAll    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

通用识别
    [Arguments]    ${contents}
    ${contents}    Evaluate    [${contents}]
    # ${contents}    Evaluate    dict(${contents})
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${connotation_url}:9088    ${dict}
    ${data}    Create Dictionary    contents=${contents}
    # ${addr}    Post Request    api    :9088/inference    data=${data}
    ${addr}    Post Request    api    /inference    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

人工操作病历质控结果
    [Arguments]    ${recordId}    ${touch}    ${operateItems}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${operateItems}    Evaluate    [${operateItems}]
    ${data}    Create Dictionary    recordId=${recordId}    touch=${touch}    operateItems=${operateItems}
    ${addr}    Post Request    api    /sentry/mc/project_operate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

检验报告
    [Arguments]    ${serialNumber}    ${userGuid}    ${doctorGuid}    ${requestSource}    ${doctorName}    ${patientName}
    ...    ${department}    ${inpatientArea}    ${patientInfo}    ${labTestList}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${patientInfo}    Evaluate    dict(${patientInfo})
    ${labTestList}    Evaluate    [${labTestList}]
    ${data}    Create Dictionary    serialNumber=${serialNumber}    userGuid=${userGuid}    doctorGuid=${doctorGuid}    requestSource=${requestSource}    doctorName=${doctorName}
    ...    patientName=${patientName}    department=${department}    inpatientArea=${inpatientArea}    patientInfo=${patientInfo}    labTestList=${labTestList}
    ${addr}    Post Request    api    mayson/v_2_0/intelligent_recommendation    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

专病数据集识别
    [Arguments]    ${diseaseFlag}    ${masterProfile}
    ${masterProfile}    Evaluate    ${masterProfile}
    # ${contents}    Evaluate    dict(${contents})
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${connotation_url}:9089    ${dict}
    ${data}    Create Dictionary    diseaseFlag=${diseaseFlag}    masterProfile=${masterProfile}
    # ${addr}    Post Request    api    :9088/inference    data=${data}
    log    ${data}
    ${addr}    Post Request    api    /get_standard_dataset    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

病历质控提交反馈
    [Arguments]    ${recordId}    ${mcRecordFeedback}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${mayson_url}    ${dict}
    ${mcRecordFeedback}    Evaluate    dict(${mcRecordFeedback})
    ${data}    Create Dictionary    recordId=${recordId}    mcRecordFeedback=${mcRecordFeedback}
    ${addr}    Post Request    api    /sentry/mc/add_feedback    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

快速推荐
    [Arguments]    ${userGuid}    ${serialNumber}    ${patientName}    ${doctorGuid}    ${doctorName}    ${admissionTime}
    ...    ${inpatientDepartment}    ${pageSource}    ${requestSource}    ${patientInfo}    ${physicalSign}    ${definiteDiagnosis}
    ...    ${progressNoteList}    ${deleteProgressNoteList}    ${labTestList}    ${examinationList}    ${newTestList}    ${operationRecord}
    ...    ${prescriptions}    ${currentDiseaseName}    ${medicalOrders}    ${openInterdict}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
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
    ${medicalOrders}    Evaluate    [${medicalOrders}]
    ${data}    Create Dictionary    userGuid=${userGuid}    serialNumber=${serialNumber}    patientName=${patientName}    doctorGuid=${doctorGuid}    doctorName=${doctorName}
    ...    admissionTime=${admissionTime}    inpatientDepartment=${inpatientDepartment}    pageSource=${pageSource}    requestSource=${requestSource}    patientInfo=${patientInfo}    physicalSign=${physicalSign}
    ...    definiteDiagnosis=${definiteDiagnosis}    progressNoteList=${progressNoteList}    deleteProgressNoteList=${deleteProgressNoteList}    labTestList=${labTestList}    examinationList=${examinationList}    newTestList=${newTestList}
    ...    operationRecord=${operationRecord}    prescriptions=${prescriptions}    currentDiseaseName=${currentDiseaseName}    medicalOrders=${medicalOrders}    openInterdict=${openInterdict}
    log    ${data}
    ${addr}    Post Request    api    mayson/v_2_0/smart_recommend    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${recordId}    Get from Dictionary    ${responsedata["body"]}    recordId
    ${serialNumber}    Get from Dictionary    ${responsedata["body"]["patientInfo"]}    serialNumber
    ${userGuid}    Get from Dictionary    ${responsedata["body"]["patientInfo"]}    userGuid
    Set Global variable    ${recordId}
    Set Global variable    ${userGuid}
    Set Global variable    ${serialNumber}
    log    ${data}
    [Return]    ${responsedata}

庄周_单病种上报统计
    [Arguments]    ${startDate}    ${endDate}    ${type}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    type=${type}
    log    ${data}
    ${addr}    Post Request    api    diseaseUp/list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

庄周_单病种科室统计
    [Arguments]    ${startDate}    ${endDate}    ${type}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    type=${type}
    log    ${data}
    ${addr}    Post Request    api    diseaseUp/diseaseDepartment    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

庄周_病种质控完成统计
    [Arguments]    ${startDate}    ${endDate}    ${type}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3023    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    type=${type}
    log    ${data}
    ${addr}    Post Request    api    diseaseQuality/list    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

肿瘤平台登录
    [Arguments]    ${name}    ${password}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${zhongliu_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3026    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    log    ${data}
    ${addr}    Post Request    api    user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

肿瘤_患者列表
    [Arguments]    ${time_start}    ${time_end}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3026    ${dict}
    ${data}    Create Dictionary    time_start=${time_start}    time_end=${time_end}
    log    ${data}
    ${addr}    Post Request    api    check/getList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

肿瘤_患者稽查表
    [Arguments]    ${recordId}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3026    ${dict}
    ${data}    Create Dictionary    recordId=${recordId}
    log    ${data}
    ${addr}    Post Request    api    check/getPatientCheckInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}

肿瘤_患者保存
    [Arguments]    ${recordId}
    #${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #Create Session    api    ${zhuangzhou_url}    ${dict}
    #Create Session    api    http://172.16.3.64:3026    ${dict}
    ${data}    Create Dictionary    recordId=${recordId}
    log    ${data}
    ${addr}    Post Request    api    check/updatePatientCheckInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    log    ${data}
    [Return]    ${responsedata}







