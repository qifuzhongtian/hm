*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    新建病历接口    patientId=${empty}
...    AND    保存患者信息    patientId=${empty}    patientName=接口保存病例    gender=1    age=50    ageType=岁    idCardNo=110221199901015859    phoneNo=13333333333    linkman=紧急联系人项    linkmanPhone=1344444444    comment=备注项    address=地址项    occupation=职业项
...    AND    新建病历接口    patientId=${patientId}
...    AND    保存病历    recordId=${recordId}    patientId=${patientId}    patientName=接口自动保存病例    gender=1    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    doctorAdvice=我是医嘱    examList={"examId":"843","examName":"抗RA33抗体","total":"1","patientExamId":"","price":"1","isCharged":"0","dataSource":"1"}    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}    patentPrescriptionList={"isCharged":"0","prescription":${null},"patentDrugList":[{"drugId":"29087","drugName":"萃仙丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日2次(bid)","dosage":"1","dosageUnit":"粒","totalDosage":2,"totalDosageUnit":"盒","price":1,"univalence":2,"prescription":${null},"specification":"每100粒重3g","manufacturer":"本溪仙草堂药业有限公司"},{"drugId":"4695","drugName":"防风通圣丸","dataSource":"1","assId":"","usage":"口服","frequency":"1日1次(qd)","dosage":"1","dosageUnit":"支","totalDosage":1,"totalDosageUnit":"盒","price":1,"univalence":1,"prescription":${null},"specification":"6.0g/袋*20/盒","manufacturer":"四川禾润制药有限公司"}]}
# ...    AND    医生病患列表    patientConditions=接口自动保存病例    diagnosis=    currentPage=1    pageSize=50

Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名    类型    说明    # recordId    Long    病历编号

*** Test Cases ***
13.1 下载病历处方
    [Documentation]    断言:"断言响应码200"
    ${getRes}    下载病历处方    recordId=${recordId}
    log    ${getRes.status_code}
    Should Be Equal As Strings    ${getRes.status_code}    200

    # 导入药品excel
    #    [Arguments]    ${hospitalId}    ${excelFile}
    #    ${file}    Evaluate    open(/Users/yinbo/Downloads/drug_import_template_with_branch.xls)
    #    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    # Create Session    api    ${base_url}    ${dict}
    #    ${params}    Create Dictionary    hospitalId=${hospitalId}
    #    ${addr}    Get Request    api    his/instock/importDrugs    params=${params}    excelFile=${multiple_files}
    #    ${responsedata}    To Json    ${addr.content}
    #    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    #    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    #    # Delete All Sessions
    #    [Return]    ${responsedata}
    # *** Settings ***
    # Suite Setup    登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
    # Suite Teardown    RequestsLibrary.Delete All Sessions
    # Resource    ../his关键字.robot
    # Library    Collections
    # Library    RequestsLibrary    # 字段名    类型    # barCode    String    # 6924962599294

