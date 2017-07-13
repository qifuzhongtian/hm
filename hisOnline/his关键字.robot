*** Variables ***
${base_url}     http://his.huimei.com/api
${base_apollo}     http://apollo.huimeionline.com

# ${base_url}       http://10.117.64.153:8080
# ${base_url}       http://api.huimeionline.com
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A
# ${SESSION}    6fa8ddef-c9d2-4957-9edb-78094ee09c3c
*** Keywords ***


登录接口
    [Arguments]    ${doctorName}    ${password}    ${loginStatus}
    ${dict}    Create Dictionary    Content-Type=application/json
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
# 先转换成json   然后 ${response["body"]["recordId"]}
    # ${diagnosis}    evaluate    [${diagnosis}]

诊所注册
    [Arguments]    ${userName}    ${realName}    ${phone}    ${registerInvitation}    ${hospitalName}
    ...    ${hospitalLicense}    ${smsCaptcha}    ${invitationCode}
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
    [Arguments]    ${olduserName}    ${userName}    ${newPassword}
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    olduserName=${olduserName}    userName=${userName}    newPassword=${newPassword}
    ${addr}    Post Request    api    his/user/updateUserPassword    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}




退出登录
    [Arguments]
    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary
    ${addr}    Post Request    api    his/login/logout    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    [Return]    ${responsedata}






#####
#####门诊

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
    [Arguments]    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${idCardNo}    ${phoneNo}    ${linkman}    ${linkmanPhone}    ${comment}    ${address}    ${occupation}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}    idCardNo=${idCardNo}    phoneNo=${phoneNo}    linkman=${linkman}    linkmanPhone=${linkmanPhone}    comment=${comment}    address=${address}    occupation=${occupation}
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
    ${recordVersion}    Get From Dictionary    ${responsedata['body']}    recordVersion
    Set Global Variable     ${recordVersion}
    [Return]    ${responsedata}

保存病历
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}    ${weight}    ${otherPhysique}
    ...    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}
    ...    ${examList}    ${diagnosis}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}
    ...    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}
    ...    examList=${examList}    diagnosis=${diagnosis}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

保存病历1
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}    ${weight}    ${otherPhysique}
    ...    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}
    ...    ${examList}    ${examId}    ${examName}    ${total}    ${patientExamId}    ${price}    ${isCharged}    ${dataSource}
    ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    @{examList}    Set Variable    ${examId}    ${examName}    ${total}    ${patientExamId}    ${price}    ${isCharged}    ${dataSource}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}
    ...    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}
    ...    examList=${examList}    examId=${examId}    examName=${examName}    total=${total}    patientExamId=${patientExamId}    price=${price}    isCharged=${isCharged}    dataSource=${dataSource}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}




保存病历2
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}    ${weight}    ${otherPhysique}
    ...    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}
    ...    ${examList}    ${examId}    ${examName}    ${total}    ${patientExamId}    ${price}    ${isCharged}    ${dataSource}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${examList}    create List    ${examId}    ${examName}    ${total}    ${patientExamId}    ${price}    ${isCharged}    ${dataSource}
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}
    ...    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}
    ...    examList=${examList}    examId=${examId}    examName=${examName}    total=${total}    patientExamId=${patientExamId}    price=${price}    isCharged=${isCharged}    dataSource=${dataSource}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

保存病历4
    [Arguments]    ${slice}    ${msg}    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}    ${weight}    ${otherPhysique}
    ...    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}
    ...    ${examList}    ${diagnosis}    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${diagnosis}    evaluate    [{"diseaseId":"138","diseaseName":"急性心肌梗死"}]
    ${diagnosis}    evaluate    [${a}]
    ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}
    ...    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}
    ...    examList=${examList}    diagnosis=${diagnosis}    a=${a}
    # ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}




保存病历5
    [Arguments]    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}    ${weight}    ${otherPhysique}
    ...    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}    ${familyHistory}    ${modle}
    ...    ${examList}    ${diagnosis}
    # ...    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    evaluate    [${diagnosis}]
    ${examList}    evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}
    ...    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}
    ...    examList=${examList}    diagnosis=${diagnosis}
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
    [Arguments]
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
    [Arguments]    ${doctorId}    ${doctorName}    ${password}    ${gender}    ${realName}    ${phone}    ${mail}    ${laboratoryId}    ${function}    ${first}    ${flag}    ${status}    ${verification}    ${functionId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${function}    evaluate    {${function}}
    ${doctorName}    Generate Random String    10    ${doctorName}
    ${data}    Create Dictionary    doctorId=${doctorId}    doctorName=${doctorName}    password=${password}    realName=${realName}    gender=${gender}    realName=${realName}    phone=${phone}    mail=${mail}    laboratoryId=${laboratoryId}    function=${function}    first=${first}    flag=${flag}    status=${status}    verification=${verification}    functionId=${functionId}
    ${addr}    Post Request    api    his/manage/saveDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}























