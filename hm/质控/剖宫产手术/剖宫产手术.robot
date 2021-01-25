*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***

剖宫产手术:开剖宫产医嘱，推出:剖宫产指征 CS-3
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable
    #获取当前时间
    ${admissionTime}    Get time    timestamp
    #距离当前1天后的时间
    ${operationTime}    add time to date    ${admissionTime}    23hours
    #手术执行时间，将上面的时间去掉显示毫秒
    ${operationTimeFinal}    Get SubString    ${operationTime}    0  19
    #手术记录中的手术开始日期
    ${startOperationDate}    Get SubString    ${operationTime}    0  10
    #手术记录中的手术开始时间
    ${startOperationTime}    Get SubString    ${operationTime}    -12  -7
    ${finishOperationTime}    add time to date    ${operationTime}    5hours
    #手术记录中的结束时间
    ${finishOperation}    Get SubString    ${finishOperationTime}    -12  -7
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=5    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${admissionTime}    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    doctorName=测试医生    admissionTime=${admissionTime}    inpatientDepartment=儿科
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    # ...    medicalOrders={"orderType": 3,"orderId": "1562668327867","uuid": "1294-20778","frequency": "-","orderContent": "(小袋)0.9%氯化钠注射液 100ml/袋","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime": 1549531074000,"executeTime":"1549531074000","stopTime":"1549531074000","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "静脉泵入","orderCode": "2136"},{"orderType":3,"orderId":"1562669119074","uuid":"1294-20778","frequency":"-","orderContent":"(小袋)0.9%氯化钠注射液100ml/袋","recordId":20778,"incisionType":"","id":557765,"timelinessFlag":1,"level":"","operationType":"4","preoperativeDiagnose":"","orderCreateTime":1562860800000,"executeTime":"1549531074000","stopTime":"1549531074000","unit":"ml","dosageform":"","position":"","status":1,"dosage":"50","description":"低分子肝素钙注射液","orderClass":1,"anesthesia":"","customerId":1294,"doctorGuid":"0000012061","specification":"","sample":"","orderFlag":1,"pathway":"口服","orderCode":"561"}
    ...    medicalOrders={"orderId":"45714073","doctorGuid":"DBA","timelinessFlag":"2","orderClass":"1","orderType":"6","orderCode":"5004","orderContent":"古典式剖宫产术","position":"胸部","level":"二级手术","operationType":"4","incisionType":"","anesthesia":"局麻","preoperativeDiagnose":"术前诊断名称","createTime":"${admissionTime}","executeTime":"${operationTimeFinal}","stopTime":"${operationTimeFinal}","orderFlag":"1"}
    #####推荐检查评估表
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
    ${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    Should Contain    ${aj}    剖宫产指征








剖宫产手术:开剖宫产医嘱，满足主要条件，推出:孕妇乙肝病毒含量风险评估 CS-7
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    乙肝表面抗原携带者
    ${Subjective}    Set Variable
    #获取当前时间
    ${admissionTime}    Get time    timestamp
    #距离当前1天后的时间
    ${operationTime}    add time to date    ${admissionTime}    23hours
    #手术执行时间，将上面的时间去掉显示毫秒
    ${operationTimeFinal}    Get SubString    ${operationTime}    0  19
    #手术记录中的手术开始日期
    ${startOperationDate}    Get SubString    ${operationTime}    0  10
    #手术记录中的手术开始时间
    ${startOperationTime}    Get SubString    ${operationTime}    -12  -7
    ${finishOperationTime}    add time to date    ${operationTime}    5hours
    #手术记录中的结束时间
    ${finishOperation}    Get SubString    ${finishOperationTime}    -12  -7
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=5    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=${admissionTime}    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    doctorName=测试医生    admissionTime=${admissionTime}    inpatientDepartment=儿科
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"姓名","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}        currentDiseaseName=
    # ...    medicalOrders={"orderType": 3,"orderId": "1562668327867","uuid": "1294-20778","frequency": "-","orderContent": "(小袋)0.9%氯化钠注射液 100ml/袋","recordId": 20778,"incisionType": "","id": 438947,"timelinessFlag": 1,"level": "","operationType":"4","preoperativeDiagnose": "","orderCreateTime": 1549531074000,"executeTime":"1549531074000","stopTime":"1549531074000","unit": "ml","dosageform": "","position": "","status": 1,"dosage": "50","description": "","orderClass": 1,"anesthesia": "","customerId": 1294,"doctorGuid": "0000012061","specification": "","sample": "","orderFlag": 1,"pathway": "静脉泵入","orderCode": "2136"},{"orderType":3,"orderId":"1562669119074","uuid":"1294-20778","frequency":"-","orderContent":"(小袋)0.9%氯化钠注射液100ml/袋","recordId":20778,"incisionType":"","id":557765,"timelinessFlag":1,"level":"","operationType":"4","preoperativeDiagnose":"","orderCreateTime":1562860800000,"executeTime":"1549531074000","stopTime":"1549531074000","unit":"ml","dosageform":"","position":"","status":1,"dosage":"50","description":"低分子肝素钙注射液","orderClass":1,"anesthesia":"","customerId":1294,"doctorGuid":"0000012061","specification":"","sample":"","orderFlag":1,"pathway":"口服","orderCode":"561"}
    ...    medicalOrders={"orderId":"45714073","doctorGuid":"DBA","timelinessFlag":"2","orderClass":"1","orderType":"6","orderCode":"5004","orderContent":"古典式剖宫产术","position":"胸部","level":"二级手术","operationType":"4","incisionType":"","anesthesia":"局麻","preoperativeDiagnose":"术前诊断名称","createTime":"${admissionTime}","executeTime":"${operationTimeFinal}","stopTime":"${operationTimeFinal}","orderFlag":"1"}
    #####推荐检查评估表
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['qualityControlResponse']['examinationRecommendList']]
    Should Contain    ${aj}    孕妇乙肝病毒含量风险评估











