*** Settings ***
Suite Setup      adminse登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***


开启灰度
    [Documentation]    node/releaseConfig/updateReleaseConfigDict

    ${getRes}    adminse切换灰度配置    id=${1219}    customerId=${1219}    enableReleaseConfig=${1}    releaseConfigType=${1}

    Should Contain    ${getRes['msg']}    success


关闭泌尿科临床风险预警
    ${getRes}    adminse灰度服务配置    roleIdList=${11}    releaseConfigType=${1}    funId=3    type=${2}    customerId=1219    diseases=${-1}
    Should Contain    ${getRes['msg']}    success

关闭泌尿科肿瘤质控
    ${getRes}    adminse灰度服务配置    roleIdList=${11}    releaseConfigType=${1}    funId=8    type=${2}    customerId=1219    diseases=
    Should Contain    ${getRes['msg']}    success

关闭临床风险和肿瘤质控后灰度规则发布生效
    ${getRes}    灰度发布生效    customerId=${1219}
    Should Contain    ${getRes['body']}    缓存刷新成功！


智能推荐接口displayMergeWindow字段是否为0
    [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=泌尿科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    # ${aj}    Evaluate    ${getRes['body']['displayMergeWindow']}
    Should Be Equal As Integers    ${getRes['body']['displayMergeWindow']}    ${0}



合并卡控大窗的displayMergeWindow字段为0
    [Documentation]    cdss/mayson/v_2_0/block_recommend
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=泌尿科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脑梗死，肺癌"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${getRes}    合并卡控大窗    inpatientArea=内科1病区    inpatientDepartment=呼吸科    inpatientDepartmentId=    recordId=${recordId}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    # log    ${size}

    #得到返回值的list
    Should Be Equal As Integers    ${getRes['body']['displayMergeWindow']}    ${0}


adminse登录
    adminse登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f



开启泌尿科临床风险预警
    ${getRes}    adminse灰度服务配置    roleIdList=${11}    releaseConfigType=${1}    funId=3    type=${1}    customerId=1219    diseases=${-1}
    Should Contain    ${getRes['msg']}    success


开启泌尿科肿瘤质控
    ${getRes}    adminse灰度服务配置    roleIdList=${11}    releaseConfigType=${1}    funId=8    type=${1}    customerId=1219    diseases=
    Should Contain    ${getRes['msg']}    success


开启临床风险和肿瘤质控后灰度规则发布生效
    ${getRes}    灰度发布生效    customerId=${1219}
    Should Contain    ${getRes['body']}    缓存刷新成功！



智能推荐接口displayMergeWindow字段是否为1
    [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=泌尿科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    # ${aj}    Evaluate    ${getRes['body']['displayMergeWindow']}
    Should Be Equal As Integers    ${getRes['body']['displayMergeWindow']}    ${1}

合并卡控大窗的displayMergeWindow字段为1
    [Documentation]    cdss/mayson/v_2_0/block_recommend
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ...    AND   智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=1    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=泌尿科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"脑梗死，肺癌"},{"key":"辅助检查","value":""}],"progressType":"1","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"2","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ${getRes}    合并卡控大窗    inpatientArea=内科1病区    inpatientDepartment=呼吸科    inpatientDepartmentId=    recordId=${recordId}
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    # log    ${size}

    #得到返回值的list
    Should Be Equal As Integers    ${getRes['body']['displayMergeWindow']}    ${1}

adminse再次登录
    adminse登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f

关闭admin-se灰度
    [Documentation]    node/releaseConfig/updateReleaseConfigDict

    ${getRes}    adminse切换灰度配置    id=${1219}    customerId=${1219}    enableReleaseConfig=${0}    releaseConfigType=${null}

    Should Contain    ${getRes['msg']}    success


关闭灰度发布生效
    ${getRes}    灰度发布生效    customerId=${1219}
    Should Contain    ${getRes['body']}    缓存刷新成功！


# 规则模板配置
#     ${index}    Set Variable    1
#     ${getRes}    规则模板配置    index=${index}
#     ...    pageSize=
#     ...    customerId=
#     ...    systemId=
#     ...    progressType=
#     ...    templateName=
#     ...    modifyDateBegin=
#     ...    modifyDateEnd=
#     Should Be Equal As Strings    ${getRes['code']}    200




# 检查检验查看
#     ${getRes}    检查检验查看    customerId=1001
#     ...    index=${1}
#     ...    pageSize=${20}
#     ...    orderBy=${2}
#     ...    sourceType=1,2,3

#     Should Be Equal As Strings    ${getRes['code']}    200


