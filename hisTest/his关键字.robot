*** Variables ***
# ${base_url}     http://his.huimei.com/api
#测试环境
${base_url}       http://10.117.64.153:8080
#大拿科技
# ${base_url}     http://116.62.205.173/api
#蒋磊
# ${base_url}    http://192.168.1.18:8080
# ${base病历详细_url}    http://api.huimeionline.com
${Huimei_id}      78D211AA892A8155EF18F4CDB967043A
# ${SESSION}      6fa8ddef-c9d2-4957-9edb-78094ee09c3c
${empty}
${null}    null


*** Keywords ***
登录接口
    # [Arguments]    ${doctorName}    ${password}    ${loginStatus}
    ${dict}    Create Dictionary    Content-Type=application/json
    # Create Session    api    ${base_url_jl}    ${dict}
    Create Session    api    ${base_url}    ${dict}
    #账号密码5
    ${data}    Create Dictionary    doctorName=yinbo    password=e3ceb5881a0a1fdaad01296d7554868d    loginStatus=1
    ${addr}    Post Request    api    his/login/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${doctorId}    Get From Dictionary    ${responsedata['body']}    doctorId
    Set Global Variable    ${doctorId}
    # [Return]    ${doctorId}
    # ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取时间戳
    ${secs}    Get Time    epoch
    Set Global Variable    ${secs}
    ${catenate}    Catenate    SEPARATOR=    ${secs}    接口发
    Set Global Variable    ${catenate}

获取日期
    ${today}    Get Current Date    result_format=%Y-%m-%d
    Set Global Variable    ${today}

登录接口.bak
    [Arguments]    ${doctorName}    ${password}    ${loginStatus}
    ${dict}    Create Dictionary    Content-Type=application/json
    # Create Session    api    ${base_url_jl}    ${dict}
    Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    doctorName=${doctorName}    password=${password}    loginStatus=${loginStatus}
    ${addr}    Post Request    api    his/login/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${doctorId}    Get From Dictionary    ${responsedata['body']}    doctorId
    Set Global Variable    ${doctorId}
    # [Return]    ${doctorId}
    # ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['head']['error']}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

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
    # ${diagnosis}    Evaluate    [${diagnosis}]

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
    ${recordId}    Get From Dictionary    ${responsedata['body']['patientList'][0]}    recordId
    Set Global Variable    ${recordId}
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



药品搜索sug
    [Arguments]    ${drugName}    ${dataSource}    ${saleChannel}    ${drugType}    ${version}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    drugName=${drugName}    dataSource=${dataSource}    saleChannel=${saleChannel}    drugType=${drugType}    version=${version}
    ${addr}    Post Request    api    his/inventory/searchDrugByNameForSaleDrug    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${drugName}    get From Dictionary    ${responsedata['body']['drugList'][0]}    drugName
    Set Global Variable    ${drugName}
    ${manufacturer}    get From Dictionary    ${responsedata['body']['drugList'][0]}    manufacturer
    Set Global Variable    ${manufacturer}
    ${drugId}    get From Dictionary    ${responsedata['body']['drugList'][0]}    id
    Set Global Variable    ${drugId}
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
    ${patientId}    Get From Dictionary    ${responsedata['body']}    patientId
    Set Global Variable    ${patientId}
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
    ${patientId}    Get From Dictionary    ${responsedata['body']['patientList'][0]}    patientId
    Set Global Variable    ${patientId}
    # ${recordId}    Get From Dictionary    ${responsedata['body']['patientList'][0]}    recordId
    # Set Global Variable    ${recordId}
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
    ${responsedata}    To Json    ${addr.content}    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}    # Should Be Equal As Strings
    ${recordVersion}    Get From Dictionary    ${responsedata['body']}    recordVersion
    Set Global Variable    ${recordVersion}
    #获取成药处方编号
    ${prescription_prescription}    Get From Dictionary    ${responsedata['body']['patentPrescriptionList'][0]}    prescription
    Set Global Variable    ${prescription_prescription}
    #获取成药处方编号
    # ${chinesePrescriptionList_prescription}    Get From Dictionary    ${responsedata['body']['chinesePrescriptionList'][0]}    prescription
    # Set Global Variable    ${chinesePrescriptionList_prescription}
    ${examList_patientExamId}    Get From Dictionary    ${responsedata['body']['examList'][0]}    patientExamId
    Set Global Variable    ${examList_patientExamId}
    ${recordVersion}    Get From Dictionary    ${responsedata['body']}    recordVersion
    Set Global Variable    ${recordVersion}
    #输液卡药品drugId
    # ${drugId}    Get From Dictionary    ${responsedata['body']['infusionList'][0]}    id
    # Set Global Variable    ${drugId}
    #输液卡处方编号
    # ${infusion_prescription}    Get From Dictionary    ${responsedata['body']['infusionList'][0]}    prescription
    # Set Global Variable    ${infusion_prescription}
    #输液卡获取病历id
    # ${recordId}    Get From Dictionary    ${responsedata['body']['infusionList'][0]}    recordId
    # Set Global Variable    ${recordId}
    [Return]    ${responsedata}

保存病历
    [Arguments]    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}
    ...    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}
    ...    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${modle}    ${doctorAdvice}    ${examList}    ${diagnosis}    ${patentPrescriptionList}
    # ...    ${additionalList}
    # ...    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    Evaluate    [${diagnosis}]
    ${examList}    Evaluate    [${examList}]
    # ${examList}    Evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${patentPrescriptionList}    Evaluate    [${patentPrescriptionList}]
    # ${additionalList}    Evaluate    [${additionalList}]
    ${data}    Create Dictionary    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    doctorAdvice=${doctorAdvice}    examList=${examList}    diagnosis=${diagnosis}    patentPrescriptionList=${patentPrescriptionList}
    # ...    additionalList=${additionalList}
    # ${examList}    Evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
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
    ${function}    Evaluate    {${function}}
    # ${doctorName}    Generate Random String    10    接口自动添加登录账号
    ${data}    Create Dictionary    doctorId=${doctorId}    doctorName=${doctorName}    password=${password}    realName=${realName}    gender=${gender}
    ...    realName=${realName}    phone=${phone}    mail=${mail}    laboratoryId=${laboratoryId}    function=${function}    first=${first}
    ...    flag=${flag}    status=${status}    verification=${verification}    functionId=${functionId}
    ${addr}    Post Request    api    his/manage/saveDoctor    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${doctorId}    get From Dictionary    ${responsedata['body']}    doctorId

     Global Variable    ${doctorId}
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
    ${doctorId}    get From Dictionary    ${responsedata['body']['doctorList'][0]}    doctorId
    Set Global Variable    ${doctorId}
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
    # ${}
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
    ${laboratoryId}    Get From Dictionary    ${responsedata['body']['laboratoryList'][0]}    laboratoryId
    Set Global Variable    ${laboratoryId}
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
    [Arguments]    ${examId}    ${examName}    ${examCost}    ${examPrice}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    examId=${examId}    examName=${examName}    examCost=${examCost}    examPrice=${examPrice}
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
    ${examId}    get From Dictionary    ${responsedata['body']['examList'][0]}    examId
    Set Global Variable     ${examId}
    [Return]    ${responsedata}

科室重名
    [Arguments]    ${laboratoryName}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    a药品入库pi    ${base_url}    ${dict}
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
    ${drugBatchNo}    get From Dictionary    ${responsedata['body']['drugList'][0]}    drugBatchNo
    Set Global Variable     ${drugBatchNo}
    ${drugId}    Get From Dictionary    ${responsedata['body']['drugList'][0]}    id
    Set Global Variable    ${drugId}
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
    ${drugId}    get From Dictionary    ${responsedata['body']}    drugId
    Set Global Variable    ${drugId}

    # ${barCode}    get From Dictionary    ${responsedata['body']}    barCode
    # Set Global Variable    ${barCode}
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
    ${barCode}    get From Dictionary    ${responsedata['body']}    barCode
    Set Global Variable    ${barCode}
    ${drugName}    get From Dictionary    ${responsedata['body']}    drugName
    Set Global Variable    ${drugName}
    ${manufacturer}    get From Dictionary    ${responsedata['body']}    manufacturer
    Set Global Variable    ${manufacturer}
    ${drugId}    get From Dictionary    ${responsedata['body']}    id
    Set Global Variable    ${drugId}
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
    [Return]    ${responsedata}
    # [Return]    ${addr}

药品入库
    [Arguments]    ${supplier}    ${batchInstockList}    ${purchaseOrderId}    ${createDate}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${batchInstockList}    Evaluate    [${batchInstockList}]
    # ${batchInstockList}    Evaluate    [{"drugId":"148349","instockCount":"1","purchasePrice":"1.00","prescriptionPrice":"88.11","validityDate":4070880000000,"expirationOptions":"","instockUnit":"盒"}]
    ${data}    Create Dictionary    supplier=${supplier}    batchInstockList=${batchInstockList}    purchaseOrderId=${purchaseOrderId}    createDate=${createDate}
    ${addr}    Post Request    api    his/instock/submitDrugInsock    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

财务查询
    [Arguments]    ${startDate}    ${endDate}    ${doctorName}    ${operateType}    ${payMode}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    doctorName=${doctorName}    operateType=${operateType}    payMode=${payMode}
    ...    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/statistics/chargeRecords    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


门诊日志
    [Arguments]    ${startDate}    ${endDate}    ${doctorName}    ${patientName}    ${orderType}    ${payMode}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    doctorName=${doctorName}    patientName=${patientName}    orderType=${orderType}    payMode=${payMode}
    ...    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/statistics/orderLogStatistics    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

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


销售明细
    [Arguments]    ${startDate}    ${endDate}    ${doctorName}    ${patientName}    ${type}    ${itemName}    ${customType}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    doctorName=${doctorName}    patientName=${patientName}    type=${type}    itemName=${itemName}
    ...    customType=${customType}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/statistics/orderSaleStatistics    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}


医生工作统计
    [Arguments]    ${startDate}    ${endDate}    ${doctorName}    ${drugType}    ${itemName}    ${customType}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    doctorName=${doctorName}    drugType=${drugType}    itemName=${itemName}
    ...    customType=${customType}    currentPage=${currentPage}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/statistics/workloadStatistics    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

药品搜索sug批次入库模块
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
    ${orderNo}    Get From Dictionary    ${responsedata['body']['orders'][0]}    orderNo
    Set Global Variable    ${orderNo}

    [Return]    ${responsedata}

已收费列表订单列表
    [Arguments]    ${startDate}    ${endDate}    ${patientName}    ${doctorId}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    patientName=${patientName}    doctorId=${doctorId}    currentPage=${currentPage}
    ...    pageSize=${pageSize}
    ${addr}    Post Request    api    his/order/getChargedOrders    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${orderNo}    Get From Dictionary    ${responsedata['body']['orders'][0]}    orderNo
    Set Global Variable    ${orderNo}
    [Return]    ${responsedata}

已退费列表订单列表
    [Arguments]    ${startDate}    ${endDate}    ${patientName}    ${doctorId}    ${currentPage}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    startDate=${startDate}    endDate=${endDate}    patientName=${patientName}    doctorId=${doctorId}    currentPage=${currentPage}
    ...    pageSize=${pageSize}
    ${addr}    Post Request    api    his/order/getRefundedOrders    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${orderNo}    Get From Dictionary    ${responsedata['body']['orders'][0]}    orderNo
    Set Global Variable    ${orderNo}

    [Return]    ${responsedata}

获取待收费订单详情
    [Arguments]    ${orderNo}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}
    ${addr}    Post Request    api    his/order/getToChargeOrderInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions

    ${orderExamListId}    Get From Dictionary    ${responsedata['body']['orderExamList']}    orderExamListId
    Set Global Variable    ${orderExamListId}
    #获取应收金额
    ${receivableAmt}    Get From Dictionary    ${responsedata['body']}    receivableAmt
    Set Global Variable    ${receivableAmt}
    #获取订单版本号
    ${recordVersion}    Get From Dictionary    ${responsedata['body']}    recordVersion
    Set Global Variable    ${recordVersion}
    #获取处方集合数组
    ${orderPrescriptionIds}    Get From Dictionary    ${responsedata['body']['orderPrescriptions'][0]}    orderPrescriptionId
    ${orderPrescriptionIds}    Create List    ${orderPrescriptionIds}
    Set Global Variable    ${orderPrescriptionIds}
    #获取附加费用单对象
    # ${object}    Get From Dictionary    ${responsedata['body']}    orderAdditionAmtList
    # ${orderAdditionAmtList}    Evaluate    dict(${object})
    # Set Global Variable    ${orderAdditionAmtList}
    [Return]    ${responsedata}

获取已收费列表订单详情
    [Arguments]    ${orderNo}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}
    ${addr}    Post Request    api    his/order/getChargedOrderInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Delete All Sessions
    #获取订单金额
    ${actualAmt}    Get From Dictionary    ${responsedata['body']}    actualAmt
    Set Global Variable    ${actualAmt}
    #获取订单版本号
    ${recordVersion}    Get From Dictionary    ${responsedata['body']}    recordVersion
    Set Global Variable    ${recordVersion}
    #获取检查单id
    ${orderExamListId}    Get From Dictionary    ${responsedata['body']['orderExamList']}    orderExamListId
    Set Global Variable    ${orderExamListId}

    #获取检查单号数组 itemId
    ${examItemId}    Get From Dictionary    ${responsedata['body']['orderExamList']['orderExams'][0]}    id
    Set Global Variable    ${examItemId}
    #获取检查单数组 金额
    ${examCount}    Get From Dictionary    ${responsedata['body']['orderExamList']['orderExams'][0]}    receivableAmt
    Set Global Variable    ${examCount}

    #orderPrescriptionId,presciptionType,orderDrugs:[itemId ,count]
    #获取处方单号id集合 orderPrescriptions ,作为退款的orderPrescriptionId
    ${orderPrescriptionId}    Get From Dictionary    ${responsedata['body']['orderPrescriptions'][0]}    orderPrescriptionId
    Set Global Variable    ${orderPrescriptionId}
    #获取 orderDrugId  作为退款的itemId
    ${prescriptionItemId}    Get From Dictionary    ${responsedata['body']['orderPrescriptions'][0]['orderDrugs'][0]}    id
    Set Global Variable    ${prescriptionItemId}
    #获取处方金额,给退款接口
    ${prescriptionCount}    Get From Dictionary    ${responsedata['body']['orderPrescriptions'][0]['orderDrugs'][0]}    receivableAmt
    Set Global Variable    ${prescriptionCount}
    [Return]    ${responsedata}

收费
    [Arguments]    ${orderNo}    ${orderExamListId}    ${orderPrescriptionIds}    ${payMode}    ${orderAdditionAmtListId}    ${actualAmt}    ${recordVersion}
    ...    ${debtorsName}    ${debtorsPhone}    ${debtAmt}    ${medicalInsurance}    ${commercialInsurance}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}    orderExamListId=${orderExamListId}    orderPrescriptionIds=${orderPrescriptionIds}    payMode=${payMode}    orderAdditionAmtListId=${orderAdditionAmtListId}    actualAmt=${actualAmt}
    ...    recordVersion=${recordVersion}    debtorsName=${debtorsName}    debtorsPhone=${debtorsPhone}    debtAmt=${debtAmt}    medicalInsurance=${medicalInsurance}    commercialInsurance=${commercialInsurance}
    ${addr}    Post Request    api    his/order/charge    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

退费
    [Arguments]    ${orderNo}    ${orderExamList}
    # ...    ${orderExamListId}
    ...    ${orderPrescriptions}    ${balanceId}    ${refundAmt}
    # ...        ${orderPrescriptionIds}
    ...    ${recordVersion}
    ...    ${debtAmt}    ${payMode}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${orderExamList}    Evaluate    dict(${orderExamList})
    ${orderPrescriptions}    Evaluate    [${orderPrescriptions}]
    ${data}    Create Dictionary    orderNo=${orderNo}    orderExamList=${orderExamList}
    # ...    orderExamListId=${orderExamListId}
    ...    orderPrescriptions=${orderPrescriptions}    balanceId=${balanceId}    refundAmt=${refundAmt}
    # ...    orderPrescriptionIds=${orderPrescriptionIds}
    ...    recordVersion=${recordVersion}    debtAmt=${debtAmt}    payMode=${payMode}
    ${addr}    Post Request    api    his/order/refund    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}



获取已退费列表订单详情
    [Arguments]    ${orderNo}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}
    ${addr}    Post Request    api    his/order/getRefundedOrderInfo    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Delete All Sessions
    [Return]    ${responsedata}



获取模板列表
    [Arguments]    ${currentPage}    ${tempName}    ${tempType}    ${tempAuthority}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    tempName=${tempName}    tempType=${tempType}    tempAuthority=${tempAuthority}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/template/searchTemplateList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${templateId}    Get From Dictionary    ${responsedata['body']['templates'][0]}    id
    Set Global Variable    ${templateId}
    [Return]    ${responsedata}

获取诊所模板列表
    [Arguments]    ${currentPage}    ${tempName}    ${pageSize}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    currentPage=${currentPage}    tempName=${tempName}    pageSize=${pageSize}
    ${addr}    Post Request    api    his/template/searchHospitalRecipeTemplateList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

删除模板
    [Arguments]    ${tempIds}    ${tempAuthority}    ${templateId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    tempIds=${tempIds}    tempAuthority=${tempAuthority}    templateId=${templateId}
    ${addr}    Post Request    api    his/template/deleteTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    # ${tempIds}    Evaluate    [${tempIds}]
    [Return]    ${responsedata}

保存中药饮片处方模板
    [Arguments]    ${id}    ${tempName}    ${tempType}    ${tempAuthority}    ${linkId}    ${chinesePrescriptionList}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${chinesePrescriptionList}    Evaluate    [{"dailyDosage":"1","decoctionPiecesList":[{"drugId":"148321","drugName":"淡竹叶","value":"10","unit":"g","comment":"后下","dataSource":"0","specification":"1.0g/g*1/g"},{"drugId":"148319","drugName":"葛根","value":"11","unit":"g","comment":"先煎","dataSource":"0","specification":"1.0g/g*1/g"}],"frequency":"1日1次(qd)","prescription":"","requirement":"水煎400ml；分早晚两次饭前温服","totalDosage":"1","usage":"口服"}]
    ${data}    Create Dictionary    id=${id}    tempName=${tempName}    tempType=${tempType}    tempAuthority=${tempAuthority}    linkId=${linkId}
    ...    chinesePrescriptionList=${chinesePrescriptionList}
    ${addr}    Post Request    api    his/template/saveHerbalTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取中药饮片处方模板详情
    [Arguments]    ${tempAuthority}    ${id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    tempAuthority=${tempAuthority}    id=${id}
    ${addr}    Post Request    api    his/template/getHerbalTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

保存西药成药处方模板
    [Arguments]    ${id}    ${tempName}    ${tempType}    ${linkId}    ${patentPrescriptionList}    # ...
    ...    ${tempAuthority}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    # ${tempName}    Generate Random String    22    1234567890abcdefghijklmnopkrst成药处方
    ${patentPrescriptionList}    Evaluate    [{"patentDrugList":[{"assId":"","dataSource":"0","dosage":"1","dosageUnit":"粒","drugId":"148307","drugName":"阿莫西林片[益萨林]","frequency":"1日3次(tid)","totalDosage":"1","totalDosageUnit":"盒","usage":"外用","specification":"0.25g/片*12/盒","manufacturer":"哈药总厂"},{"assId":"","dataSource":"0","dosage":"2","dosageUnit":"粒","drugId":"148306","drugName":"安乐片","frequency":"1日2次(bid)","totalDosage":"1","totalDosageUnit":"盒","usage":"口服","specification":"片*24/盒","manufacturer":"广西邦琪药业集团有限公司"}]}]
    ${data}    Create Dictionary    id=${id}    tempName=${tempName}    tempType=${tempType}    linkId=${linkId}    patentPrescriptionList=${patentPrescriptionList}
    ...    tempAuthority=${tempAuthority}
    ${addr}    Post Request    api    his/template/savePatentPrescriptionTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取西药饮片处方处方模板详情
    [Arguments]    ${tempAuthority}    ${id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    tempAuthority=${tempAuthority}    id=${id}
    ${addr}    Post Request    api    his/template/getPatentPrescriptionTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

保存医嘱模板
    [Arguments]    ${id}    ${tempName}    ${tempDesc}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    id=${id}    tempName=${tempName}    tempDesc=${tempDesc}
    ${addr}    Post Request    api    his/template/saveDoctorAdviceTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

获取医嘱模板
    [Arguments]    ${id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    his/template/getDoctorAdviceTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${id}    Get From Dictionary    ${responsedata['body']}    id
    Set Global Variable    ${id}
    [Return]    ${responsedata}

保存输液卡模板
    [Arguments]    ${id}    ${tempName}    ${tempType}    ${tempAuthority}    ${linkId}
    ...    ${infusionList}
    # ...    ${infusionGroupList}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${infusionList}    Evaluate    [${infusionList}]
    # ${infusionGroupList}    Evaluate    [${infusionGroupList}]
    # Create List    ${infusionList}    ${infusionList}
    ${data}    Create Dictionary    id=${id}    tempName=${tempName}    tempType=${tempType}    tempAuthority=${tempAuthority}    linkId=${linkId}
    ...    infusionList=${infusionList}
    # ...    infusionGroupList=${infusionGroupList}
    ${addr}    Post Request    api    his/template/saveOrUpdateInfusionTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    ${templateId}    Get From Dictionary    ${responsedata['body']}    templateId
    Set Global Variable    ${templateId}
    [Return]    ${responsedata}

获取输液卡模板详情
    [Arguments]    ${tempAuthority}    ${id}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    tempAuthority=${tempAuthority}    id=${id}
    ${addr}    Post Request    api    his/template/getInfusionTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

保存病历_输液卡
    [Arguments]    ${inquiryType}    ${address}    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}
    ...    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}
    ...    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${modle}    ${doctorAdvice}    ${examList}    ${diagnosis}    ${patentPrescriptionList}
    ...    ${chinesePrescriptionList}
    # ...    ${additionalList}
    ...    ${infusionList}
    # ...    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    Evaluate    [${diagnosis}]
    ${examList}    Evaluate    [${examList}]
    # ${examList}    Evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${patentPrescriptionList}    Evaluate    [${patentPrescriptionList}]
    ${chinesePrescriptionList}    Evaluate    [${chinesePrescriptionList}]
    # ${additionalList}    Evaluate    [${additionalList}]
    ${infusionList}    Evaluate    [${infusionList}]
    ${data}    Create Dictionary    inquiryType=${inquiryType}    address=${address}    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    doctorAdvice=${doctorAdvice}    examList=${examList}    diagnosis=${diagnosis}    patentPrescriptionList=${patentPrescriptionList}
    ...    chinesePrescriptionList=${chinesePrescriptionList}
    # ...    additionalList=${additionalList}
    ...    infusionList=${infusionList}
    # ${examList}    Evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/addPatinetRecordFirst    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${recordId}    Get From Dictionary    ${responsedata['body']}    recordId
    Set Global Variable    ${recordId}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


修改病历_输液卡
    [Arguments]    ${inquiryType}    ${address}    ${recordId}    ${patientId}    ${patientName}    ${gender}    ${age}    ${ageType}
    ...    ${phoneNo}    ${temperature}    ${sbp}    ${dbp}    ${heartRate}    ${height}
    ...    ${weight}    ${otherPhysique}    ${symptom}    ${previousHistory}    ${personalHistory}    ${allergyHistory}
    ...    ${familyHistory}    ${modle}    ${doctorAdvice}    ${examList}    ${diagnosis}    ${patentPrescriptionList}
    ...    ${chinesePrescriptionList}
    # ...    ${additionalList}
    ...    ${infusionList}    ${recordVersion}
    # ...    ${a}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${diagnosis}    Evaluate    [${diagnosis}]
    ${examList}    Evaluate    [${examList}]
    # ${examList}    Evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${patentPrescriptionList}    Evaluate    [${patentPrescriptionList}]
    ${chinesePrescriptionList}    Evaluate    [${chinesePrescriptionList}]
    # ${additionalList}    Evaluate    [${additionalList}]
    ${infusionList}    Evaluate    [${infusionList}]
    ${data}    Create Dictionary    inquiryType=${inquiryType}    address=${address}    recordId=${recordId}    patientId=${patientId}    patientName=${patientName}    gender=${gender}    age=${age}
    ...    ageType=${ageType}    phoneNo=${phoneNo}    temperature=${temperature}    sbp=${sbp}    dbp=${dbp}    heartRate=${heartRate}
    ...    height=${height}    weight=${weight}    otherPhysique=${otherPhysique}    symptom=${symptom}    previousHistory=${previousHistory}    personalHistory=${personalHistory}
    ...    allergyHistory=${allergyHistory}    familyHistory=${familyHistory}    modle=${modle}    doctorAdvice=${doctorAdvice}    examList=${examList}    diagnosis=${diagnosis}    patentPrescriptionList=${patentPrescriptionList}
    ...    chinesePrescriptionList=${chinesePrescriptionList}
    # ...    additionalList=${additionalList}
    ...    infusionList=${infusionList}
    ...    recordVersion=${recordVersion}
    # ${examList}    Evaluate    [{"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"0","isCharged":"0","dataSource":"1"}]
    ${addr}    Post Request    api    his/outpatient/modifyPatinetRecord    data=${data}
    ${responsedata}    To Json    ${addr.content}
    ${recordId}    Get From Dictionary    ${responsedata['body']}    recordId
    Set Global Variable    ${recordId}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}

输液卡_收费
    [Arguments]    ${orderNo}    ${orderExamListId}    ${orderPrescriptionIds}    ${orderAdditionAmtListId}    ${actualAmt}    ${recordVersion}
    ...    ${debtorsName}    ${debtorsPhone}    ${debtAmt}    ${medicalInsurance}    ${commercialInsurance}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    orderNo=${orderNo}    orderExamListId=${orderExamListId}    orderPrescriptionIds=${orderPrescriptionIds}    orderAdditionAmtListId=${orderAdditionAmtListId}    actualAmt=${actualAmt}
    ...    recordVersion=${recordVersion}    debtorsName=${debtorsName}    debtorsPhone=${debtorsPhone}    debtAmt=${debtAmt}    medicalInsurance=${medicalInsurance}    commercialInsurance=${commercialInsurance}
    ${addr}    Post Request    api    his/order/charge    data=${data}
    ${responsedata}    To Json    ${addr.content}
    [Return]    ${responsedata}

打印输液卡
    [Arguments]    ${recordId}
    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${base_url}    ${dict}
    ${data}    Create Dictionary    recordId=${recordId}
    ${addr}    Post Request    api    his/infusion/printInfusion    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    # Delete All Sessions
    [Return]    ${responsedata}

