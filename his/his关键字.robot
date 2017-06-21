*** Variables ***
# ${base_url}     http://his.huimei.com/api
${base_url}       http://10.117.64.153:8080

${base_url_jl}    http://192.168.1.18:8080
# ${base_url}     http://api.huimeionline.com
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A
${Huimei_id_safe_medication}    C3B844493A477BCF3D7B73A5E902B269
# ${SESSION}      6fa8ddef-c9d2-4957-9edb-78094ee09c3c

*** Keywords ***
安全用药
    [Arguments]    ${gender}    ${age}    ${ageType}    ${drugIds}    ${symptom}    ${confirmDiagnosis}
    ...    # 安全用药    #    [Arguments]    ${slice}    ${msg}    ${gender}
    ...    # ${age}    ${ageType}    # ${drugIds}    ${symptom}    ${confirmDiagnosis}
    #    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    #    Create Session    api    ${base_url}    ${dict}
    #    ${data}    Create Dictionary    gender=${gender}    age=${age}    ageType=${ageType}
    #    ...    drugIds=${drugIds}    symptom=${symptom}    confirmDiagnosis=${confirmDiagnosis}
    #    ${addr}    Post Request    api    hmsm/v_1_0/safe_medication    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    # ${str}    Get From Dictionary    ${responsedata}    head
    #    # ${str1}    Get From Dictionary    ${str}    error
    #    # Should Be Equal As Strings    ${str1}    ${msg}
    #    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    #    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id_safe_medication}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    gender=${gender}    age=${age}    ageType=${ageType}    drugIds=${drugIds}    symptom=${symptom}
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

登录接口
    [Arguments]    ${doctorName}    ${password}    ${loginStatus}
    ${dict}    Create Dictionary    Content-Type=application/json
    # Create Session    api    ${base_url_jl}    ${dict}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    doctorName=${doctorName}    password=${password}    loginStatus=${loginStatus}
    ${addr}    Post Request    api    his/login/login    data=${data}
    # ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions

新建病历接口
    [Arguments]    ${patientId}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}
    ${addr}    Post Request    api    his/outpatient/newRecord    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${recordId}    Get From Dictionary    ${responsedata["body"]}    recordId
    Set Global Variable    ${recordId}
    # Return From Keyword    ${recordId}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # $response["body"]["recordId"]
    # 先转换成json    然后 ${response["body"]["recordId"]}
    # ${diagnosis}    evaluate    [${diagnosis}]

诊所注册
    [Arguments]    ${userName}    ${realName}    ${phone}    ${registerInvitation}    ${hospitalName}    ${hospitalLicense}
    ...    ${smsCaptcha}    ${invitationCode}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    userName=${userName}    realName=${realName}    phone=${phone}    registerInvitation[]=${registerInvitation}    hospitalName=${hospitalName}
    ...    hospitalLicense=${hospitalLicense}    smsCaptcha=${smsCaptcha}    invitationCode=${invitationCode}
    ${addr}    Post Request    api    his/user/hospitalRegister    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

重名验证
    [Arguments]    ${userName}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    userName=${userName}
    ${addr}    Post Request    api    his/user/verifyUserName    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['status']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

用户登录
    [Arguments]    ${doctorName}    ${password}    ${loginStatus}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    doctorName=${doctorName}    password=${password}    loginStatus=${loginStatus}
    ${addr}    Post Request    api    his/login/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

修改密码
    [Arguments]    ${oldPassword}    ${userName}    ${newPassword}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    oldPassword=${oldPassword}    userName=${userName}    newPassword=${newPassword}
    ${addr}    Post Request    api    his/user/updateUserPassword    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

退出登录
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    his/login/logout    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    #####
    #####门诊
    [Return]    ${responsedata}

新建病历
    [Arguments]    ${patientId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}
    ${addr}    Post Request    api    his/outpatient/newRecord    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

今日就诊
    [Arguments]    ${doctorId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    doctorId=${doctorId}
    ${addr}    Post Request    api    his/outpatient/todayPatientInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

患者Sug查询
    [Arguments]    ${patientName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientName=${patientName}
    ${addr}    Post Request    api    his/outpatient/searchPatientBySug    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

检查搜索
    [Arguments]    ${examName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    examName=${examName}
    ${addr}    Post Request    api    his/manage/searchExam    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

保存患者信息
    [Arguments]    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${idCardNo}
    ...    ${phoneNo}    ${linkman}    ${linkmanPhone}    ${comment}    ${address}    ${occupation}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}
    ...    idCardNo=${idCardNo}    phoneNo=${phoneNo}    linkman=${linkman}    linkmanPhone=${linkmanPhone}    comment=${comment}    address=${address}
    ...    occupation=${occupation}
    ${addr}    Post Request    api    his/outpatient/savePatientInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

医生病患列表
    [Arguments]    ${patientConditions}    ${diagnosis}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientConditions=${patientConditions}    diagnosis=${diagnosis}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/outpatient/getMyPatients    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取患者信息
    [Arguments]    ${patientId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}
    ${addr}    Post Request    api    his/outpatient/getPatientInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取患者病例
    [Arguments]    ${slice}    ${msg}    ${patientId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}
    ${addr}    Post Request    api    his/outpatient/getPatientRecords    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

病历详细
    [Arguments]    ${patientId}    ${recordId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}    recordId=${recordId}
    ${addr}    Post Request    api    his/outpatient/getRecordInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

保存病历
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}
    ...    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}
    ...    ${heartRate}    ${height}    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}
    ...    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}    ${examList}    ${diagnosis}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    examList=${examList}    diagnosis=${diagnosis}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

保存病历1
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}
    ...    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}
    ...    ${heartRate}    ${height}    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}
    ...    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}    ${examList}    ${examId}
    ...    ${examName}    ${total}    ${patientExamId}    ${price}    ${isCharged}    ${dataSource}
    ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    @{examList}    Set Variable    ${examId}    ${examName}    ${total}    ${patientExamId}    ${price}
    ...    ${isCharged}    ${dataSource}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    examList=${examList}    examId=${examId}    examName=${examName}
    ...    total=${total}    patientExamId=${patientExamId}    price=${price}    isCharged=${isCharged}    dataSource=${dataSource}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

保存病历2
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}
    ...    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}
    ...    ${heartRate}    ${height}    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}
    ...    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}    ${examList}    ${examId}
    ...    ${examName}    ${total}    ${patientExamId}    ${price}    ${isCharged}    ${dataSource}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${examList}    create List    ${examId}    ${examName}    ${total}    ${patientExamId}    ${price}
    ...    ${isCharged}    ${dataSource}
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    examList=${examList}    examId=${examId}    examName=${examName}
    ...    total=${total}    patientExamId=${patientExamId}    price=${price}    isCharged=${isCharged}    dataSource=${dataSource}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

保存病历4
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}
    ...    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}
    ...    ${heartRate}    ${height}    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}
    ...    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}    ${examList}    ${diagnosis}
    ...    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    ${diagnosis}    evaluate    [${a}]
    ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    examList=${examList}    diagnosis=${diagnosis}    a=${a}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

保存病历5
    [Arguments]    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}
    ...    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}
    ...    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${modle}    ${examList}    ${diagnosis}
    # ...    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    evaluate    [${diagnosis}]
    ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    examList=${examList}    diagnosis=${diagnosis}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

查询患者病历历史
    [Arguments]    ${patientId}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/hisotryRecord/getPatientRecords    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获得病历的处方，检查等
    [Arguments]    ${patientId}    ${recordId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}    recordId=${recordId}
    ${addr}    Post Request    api    his/hisotryRecord/getRecordById    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询医生最近病历
    [Arguments]    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    pageSize=${pageSize}
    ${addr}    Post Request    api    his/hisotryRecord/getDoctorRecords    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

诊所信息查询
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    his/manage/getHospitalInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

诊所人员信息删除
    [Arguments]    ${doctorId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    doctorId=${doctorId}
    ${addr}    Post Request    api    his/manage/deleteDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

诊所人员信息保存
    [Arguments]    ${doctorId}    ${doctorName}    ${password}    ${gender}    ${realName}    ${phone}
    ...    ${mail}    ${laboratoryId}    ${function}    ${first}    ${flag}    ${status}
    ...    ${verification}    ${functionId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${function}    evaluate    {${function}}
    ${doctorName}    Generate Random String    10    ${doctorName}
    ${data}    Create Dictionary    doctorId=${doctorId}    doctorName=${doctorName}    password=${password}    realName=${realName}    gender=${gender}
    ...    realName=${realName}    phone=${phone}    mail=${mail}    laboratoryId=${laboratoryId}    function=${function}    first=${first}
    ...    flag=${flag}    status=${status}    verification=${verification}    functionId=${functionId}
    ${addr}    Post Request    api    his/manage/saveDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

诊所人员查询
    [Arguments]    ${page}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    page=${page}
    ${addr}    Post Request    api    his/manage/searchDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

科室信息删除
    [Arguments]    ${laboratoryId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    laboratoryId=${laboratoryId}
    ${addr}    Post Request    api    his/manage/deleteLaboratory    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

科室信息保存
    [Arguments]    ${laboratoryId}    ${laboratoryName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    laboratoryId=${laboratoryId}    laboratoryName=${laboratoryName}
    ${addr}    Post Request    api    his/manage/saveLaboratory    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

科室信息查询
    [Arguments]    ${page}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    page=${page}
    ${addr}    Post Request    api    his/manage/searchLaboratory    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

检查删除
    [Arguments]    ${examId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    examId=${examId}
    ${addr}    Post Request    api    his/manage/deleteExam    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

检查重名
    [Arguments]    ${examName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    examName=${examName}
    ${addr}    Post Request    api    his/manage/verifyExamName    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

新增检查
    [Arguments]    ${examId}    ${examName}    ${examPrice}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    examId=${examId}    examName=${examName}    examPrice=${examPrice}
    ${addr}    Post Request    api    his/manage/saveExam    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询医生列表
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    his/manage/searchDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

检查查询
    [Arguments]    ${examName}    ${page}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    examName=${examName}    page=${page}
    ${addr}    Post Request    api    his/manage/searchExam    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

科室重名
    [Arguments]    ${laboratoryName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    laboratoryName=${laboratoryName}
    ${addr}    Post Request    api    his/manage/verifyLaboratoryName    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

药品列表查询
    [Arguments]    ${drugName}    ${drugType}    ${status}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}    drugType=${drugType}    status=${status}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/inventory/searchDrugList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

药品搜索sug根据药品名称
    [Arguments]    ${drugName}    ${dataSource}    ${version}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}    dataSource=${dataSource}    version=${version}
    ${addr}    Post Request    api    his/inventory/searchDrugByName    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

新增药品
    [Arguments]    ${drugName}    ${drugType}    ${isOtc}    ${status}    ${customType}    ${drugBatchNo}
    ...    ${expirationOptions}    ${approvalNumber}    ${barCode}    ${singleDosage}    ${singleDosageUnit}    ${frequency}
    ...    ${prescribeAmount}    ${prescribeAmountUnit}    ${instruction}    ${doctorAdvice}    ${specification}    ${specMinimumDosage}
    ...    ${specMinimumUnit}    ${specUnit}    ${specUnitaryRatio}    ${specPackageUnit}    ${manufacturer}    ${purchasePrice}
    ...    ${prescriptionPrice}    ${inventoryCount}    ${inventoryThreshold}    ${validityDate}    ${goodsShelfCode}    ${openStock}
    ...    ${supplier}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}    drugType=${drugType}    isOtc=${isOtc}    status=${status}    customType=${customType}
    ...    drugBatchNo=${drugBatchNo}    expirationOptions=${expirationOptions}    approvalNumber=${approvalNumber}    barCode=${barCode}    singleDosage=${singleDosage}    singleDosageUnit=${singleDosageUnit}
    ...    frequency=${frequency}    prescribeAmount=${prescribeAmount}    prescribeAmountUnit=${prescribeAmountUnit}    instruction=${instruction}    doctorAdvice=${doctorAdvice}    specification=${specification}
    ...    specMinimumDosage=${specMinimumDosage}    specMinimumUnit=${specMinimumUnit}    specUnit=${specUnit}    specUnitaryRatio=${specUnitaryRatio}    specPackageUnit=${specPackageUnit}    manufacturer=${manufacturer}
    ...    purchasePrice=${purchasePrice}    prescriptionPrice=${prescriptionPrice}    inventoryCount=${inventoryCount}    inventoryThreshold=${inventoryThreshold}    validityDate=${validityDate}    goodsShelfCode=${goodsShelfCode}
    ...    openStock=${openStock}    supplier=${supplier}
    ${addr}    Post Request    api    his/inventory/saveDrug    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

生产厂家sug
    [Arguments]    ${manufacturer}    ${version}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    manufacturer=${manufacturer}    version=${version}
    ${addr}    Post Request    api    his/inventory/searchManufacturer    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

查询药品详细信息
    [Arguments]    ${drugId}    ${dataSource}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugId=${drugId}    dataSource=${dataSource}
    ${addr}    Post Request    api    his/inventory/drugDetail    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

导出药品excel,批次管理
    [Arguments]    ${drugBatchNo}    ${drugName}    ${drugType}    ${allInstock}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${params}    Create Dictionary    drugBatchNo=${drugBatchNo}    drugName=${drugName}    drugType=${drugType}    allInstock=${allInstock}
    ${addr}    Get Request    api    his/instock/exportDrugInventoryListByBatch    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${addr}


导出药品excel,非批次管理
    [Arguments]    ${drugBatchNo}    ${drugName}    ${drugType}    ${allInstock}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${params}    Create Dictionary    drugBatchNo=${drugBatchNo}    drugName=${drugName}    drugType=${drugType}    allInstock=${allInstock}
    ${addr}    Get Request    api    his/instock/exportDrugInventoryList    params=${params}
    # ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${addr}



导入药品excel
    [Arguments]    ${hospitalId}    ${excelFile}
    ${file}    Evaluate    open(/Users/yinbo/Downloads/drug_import_template_with_branch.xls)
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${params}    Create Dictionary    hospitalId=${hospitalId}
    ${addr}    Get Request    api    his/instock/importDrugs    params=${params}    excelFile=${multiple_files}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

修改保存药品
    [Arguments]    ${id}    ${drugName}    ${drugType}    ${isOtc}    ${status}    ${customType}
    ...    ${drugBatchNo}    ${expirationOptions}    ${approvalNumber}    ${barCode}    ${singleDosage}    ${singleDosageUnit}
    ...    ${frequency}    ${prescribeAmount}    ${prescribeAmountUnit}    ${instruction}    ${doctorAdvice}    ${specification}
    ...    ${specMinimumDosage}    ${specMinimumUnit}    ${specUnit}    ${specUnitaryRatio}    ${specPackageUnit}    ${manufacturer}
    ...    ${purchasePrice}    ${prescriptionPrice}    ${inventoryCount}    ${inventoryThreshold}    ${validityDate}    ${goodsShelfCode}
    ...    ${openStock}    ${supplier}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    id=${id}    drugName=${drugName}    drugType=${drugType}    isOtc=${isOtc}    status=${status}
    ...    customType=${customType}    drugBatchNo=${drugBatchNo}    expirationOptions=${expirationOptions}    approvalNumber=${approvalNumber}    barCode=${barCode}    singleDosage=${singleDosage}
    ...    singleDosageUnit=${singleDosageUnit}    frequency=${frequency}    prescribeAmount=${prescribeAmount}    prescribeAmountUnit=${prescribeAmountUnit}    instruction=${instruction}    doctorAdvice=${doctorAdvice}
    ...    specification=${specification}    specMinimumDosage=${specMinimumDosage}    specMinimumUnit=${specMinimumUnit}    specUnit=${specUnit}    specUnitaryRatio=${specUnitaryRatio}    specPackageUnit=${specPackageUnit}
    ...    manufacturer=${manufacturer}    purchasePrice=${purchasePrice}    prescriptionPrice=${prescriptionPrice}    inventoryCount=${inventoryCount}    inventoryThreshold=${inventoryThreshold}    validityDate=${validityDate}
    ...    goodsShelfCode=${goodsShelfCode}    openStock=${openStock}    supplier=${supplier}
    ${addr}    Post Request    api    his/inventory/modifyDrug    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

删除药品
    [Arguments]    ${drugIds}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugIds=${drugIds}
    ${addr}    Post Request    api    his/inventory/deleteDrug    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    # 字典sug
    #    [Arguments]    ${cnName}    ${type}
    #    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    # Create Session    api    ${base_url}    ${dict}
    #    ${data}    Create Dictionary    cnName=${cnName}    type=${type}
    #    ${addr}    Post Request    api    his/outpatient/getRecordInfo    data=${data}
    #    ${responsedata}    To Json    ${addr.content}
    #    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    #    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    #    # Delete All Sessions
    #    [Return]    ${responsedata}
    [Return]    ${responsedata}

字典sug
    [Arguments]    ${cnName}    ${type}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    cnName=${cnName}    type=${type}
    ${addr}    Post Request    api    his/dict/searchDictionary    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

药品名称搜索sug
    [Arguments]    ${drugName}    ${version}
    # ${dict}    Create Dictionary    Content-version=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}    version=${version}
    ${addr}    Post Request    api    his/inventory/searchDrugNameList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Contain    ${aj[:15]}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

根据条形码验证药品是否重复
    [Arguments]    ${barCode}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    barCode=${barCode}
    ${addr}    Post Request    api    his/inventory/checkDrugRepeatedByBarCode    data=${data}
    log    ${addr}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${addr}

药品入库日志
    [Arguments]    ${startDate}    ${endDate}    ${drugBatchNo}    ${drugName}    ${supplier}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    drugBatchNo=${drugBatchNo}    drugName=${drugName}    supplier=${supplier}
    ${addr}    Post Request    api    his/instock/searchBatchInstockLog    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

药品搜索sug
    [Arguments]    ${dataSource}    ${drugName}    ${version}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    dataSource=${dataSource}    drugName=${drugName}    version=${version}
    ${addr}    Post Request    api    his/inventory/searchDrugByNameForInsock    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取载入常用处方列表
    [Arguments]    ${tempName}    ${tempAuthority}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    tempName=${tempName}    tempAuthority=${tempAuthority}
    ${addr}    Post Request    api    his/template/loadRecipeTemplateList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

下载病历处方
    [Arguments]    ${recordId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${params}    Create Dictionary    recordId=${recordId}
    ${addr}    Get Request    api    his/outpatient/printInquiryPdf    params=${params}
    #${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${addr}



自定义分类sug
    [Arguments]    ${customType}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    customType=${customType}
    ${addr}    Post Request    api    his/inventory/searchDrugCustomType    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


待收费订单列表
    [Arguments]    ${startDate}    ${endDate}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/order/getToChargeOrders    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}



已收费列表订单列表
    [Arguments]    ${startDate}    ${endDate}    ${patientName}    ${doctorId}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    patientName=${patientName}    doctorId=${doctorId}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/order/getChargedOrders    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


已退费列表订单列表
    [Arguments]    ${startDate}    ${endDate}    ${patientName}    ${doctorId}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    patientName=${patientName}    doctorId=${doctorId}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/order/getRefundedOrders    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}


获取待收费订单详情
    [Arguments]    ${orderNo}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}
    ${addr}    Post Request    api    his/order/getToChargeOrders    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

收费
    [Arguments]    ${orderNo}    ${orderExamListId}    ${orderPrescriptionIds}    ${orderAdditionAmtListId}
    ...    ${actualAmt}    ${recordVersion}    ${debtorsName}    ${debtorsPhone}    ${debtAmt}
    ...    ${medicalInsurance}    ${commercialInsurance}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}    orderExamListId=${orderExamListId}    orderPrescriptionIds=${orderPrescriptionIds}    orderAdditionAmtListId=${orderAdditionAmtListId}    actualAmt=${actualAmt}    recordVersion=${recordVersion}    debtorsName=${debtorsName}    debtorsPhone=${debtorsPhone}    debtAmt=${debtAmt}    medicalInsurance=${medicalInsurance}    commercialInsurance=${commercialInsurance}
    ${addr}    Post Request    api    his/order/charge    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



获取已收费列表订单详情
    [Arguments]    ${orderNo}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}
    ${addr}    Post Request    api    his/order/getChargedOrderInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Delete All Sessions
    [Return]    ${responsedata}


