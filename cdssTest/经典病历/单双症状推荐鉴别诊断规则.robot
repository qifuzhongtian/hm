*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***


2行-腹胀,推出诊断:肠梗阻,先天性肥大性幽门狭窄,先天性十二指肠闭锁,先天性小肠狭窄,急性坏死性肠炎,腹部肿物,肝大,脾大,环状胰腺,先天性肠旋转不良,先天性回肠闭锁,先天性空肠闭锁,胎粪堵塞综合征,小左结肠综合征,胎粪性肠梗阻,嵌顿性腹股沟斜疝,先天性巨结肠类源病,先天性肛门直肠畸形,先天性肾病综合征,充血性心力衰竭
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹胀
    ${assert}    Create List    肠梗阻    先天性肥大性幽门狭窄    先天性十二指肠闭锁    先天性小肠狭窄    急性坏死性肠炎    腹部肿物    肝大    脾大    环状胰腺    先天性肠旋转不良    先天性回肠闭锁    先天性空肠闭锁    胎粪堵塞综合征    小左结肠综合征    胎粪性肠梗阻    嵌顿性腹股沟斜疝    先天性巨结肠类源病    先天性肛门直肠畸形    先天性肾病综合征    充血性心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}




3行-腹部膨隆,推出诊断:肠梗阻,先天性肥大性幽门狭窄,先天性十二指肠闭锁,先天性小肠狭窄,急性坏死性肠炎,腹部肿物,肝大,脾大,环状胰腺,先天性肠旋转不良,先天性回肠闭锁,先天性空肠闭锁,胎粪堵塞综合征,小左结肠综合征,胎粪性肠梗阻,嵌顿性腹股沟斜疝,先天性巨结肠类源病,先天性肛门直肠畸形,先天性肾病综合征,充血性心力衰竭
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹部膨隆
    ${assert}    Create List    肠梗阻    先天性肥大性幽门狭窄    先天性十二指肠闭锁    先天性小肠狭窄    急性坏死性肠炎    腹部肿物    肝大    脾大    环状胰腺    先天性肠旋转不良    先天性回肠闭锁    先天性空肠闭锁    胎粪堵塞综合征    小左结肠综合征    胎粪性肠梗阻    嵌顿性腹股沟斜疝    先天性巨结肠类源病    先天性肛门直肠畸形    先天性肾病综合征    充血性心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}




4行-腹胀,推出诊断:胃肠功能紊乱,慢性胃炎,肠吸收不良,乳糖不耐受,腹部肿物,消化性溃疡,急性阑尾炎,嵌顿性脐疝,先天性巨结肠,蛔虫病,便秘,膀胱扩张,腹水,肠梗阻,单纯性肾囊肿,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,腹主动脉瘤,肾积水,肾细胞癌,糖原贮积病
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹胀
    ${assert}    Create List    慢性胃炎    肠吸收不良    乳糖不耐受    腹部肿物    消化性溃疡    急性阑尾炎    嵌顿性脐疝    先天性巨结肠    蛔虫病    便秘    膀胱扩张    腹水    肠梗阻    单纯性肾囊肿    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    腹主动脉瘤    肾积水    肾细胞癌    糖原贮积病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}




5行-腹部膨隆,推出诊断:轮状病毒性肠炎,胃肠功能紊乱,慢性胃炎,肠吸收不良,乳糖不耐受,腹部肿物,消化性溃疡,肠套叠,急性阑尾炎,嵌顿性脐疝,先天性巨结肠,蛔虫病,便秘,膀胱扩张,腹水,肠梗阻,单纯性肾囊肿,肝大,脾大,腹主动脉瘤,肾积水,肾细胞癌,糖原贮积病
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹部膨隆
    ${assert}    Create List    轮状病毒性肠炎    胃肠功能紊乱    慢性胃炎    肠吸收不良    乳糖不耐受    腹部肿物    消化性溃疡    肠套叠    急性阑尾炎    嵌顿性脐疝    先天性巨结肠    蛔虫病    便秘    膀胱扩张    腹水    肠梗阻    单纯性肾囊肿    肝大    脾大    腹主动脉瘤    肾积水    肾细胞癌    糖原贮积病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}




6行-腹胀,推出诊断:肠易激综合征,妊娠,便秘,膀胱扩张,腹水,肠梗阻,卵巢囊肿,单纯性肾囊肿,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,腹主动脉瘤,肾积水,肾细胞癌,肠吸收不良,乳糖不耐受,旅行者腹泻
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹胀
    ${assert}    Create List    肠易激综合征    妊娠    便秘    膀胱扩张    腹水    肠梗阻    卵巢囊肿    单纯性肾囊肿    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    腹主动脉瘤    肾积水    肾细胞癌    肠吸收不良    乳糖不耐受    旅行者腹泻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"0","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}




7行-腹部膨隆,推出诊断:肠易激综合征,妊娠,便秘,膀胱扩张,腹水,肠梗阻,卵巢囊肿,单纯性肾囊肿,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,腹主动脉瘤,肾积水,肾细胞癌,肠吸收不良,乳糖不耐受,旅行者腹泻
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹部膨隆
    ${assert}    Create List    肠易激综合征    妊娠    便秘    膀胱扩张    腹水    肠梗阻    卵巢囊肿    单纯性肾囊肿    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    腹主动脉瘤    肾积水    肾细胞癌    肠吸收不良    乳糖不耐受    旅行者腹泻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"0","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}





8行-腹胀,推出诊断:肠易激综合征,便秘,膀胱扩张,腹水,肠梗阻,单纯性肾囊肿,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,腹主动脉瘤,肾积水,肾细胞癌,肠吸收不良,乳糖不耐受,旅行者腹泻
    [Documentation]    断言:""
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    腹胀
    ${assert}    Create List    肠易激综合征    便秘    膀胱扩张    腹水    肠梗阻    单纯性肾囊肿    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    腹主动脉瘤    肾积水    肾细胞癌    肠吸收不良    乳糖不耐受    旅行者腹泻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
    ...    doctorGuid=675    doctorName=hmkj
    ...    patientInfo={"gender":"1","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
    # Should Contain    ${aj}    流行性感冒
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Lists should Be Equal    ${aj}    ${assert}
    List Should Contain Sub List    ${aj}    ${assert}




9行-腹部膨隆,推出诊断:肠易激综合征,便秘,膀胱扩张,腹水,肠梗阻,单纯性肾囊肿,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,腹主动脉瘤,肾积水,肾细胞癌,肠吸收不良,乳糖不耐受,旅行者腹泻
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹部膨隆
        ${assert}    Create List    肠易激综合征    便秘    膀胱扩张    腹水    肠梗阻    单纯性肾囊肿    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    腹主动脉瘤    肾积水    肾细胞癌    肠吸收不良    乳糖不耐受    旅行者腹泻
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


10行-腹痛,推出诊断:急性胃肠炎,泌尿道感染,输尿管结石,肾结石,消化性溃疡,急性胆囊炎,急性心肌梗死,急性阑尾炎,急性胰腺炎,憩室炎,尿潴留,肾盂肾炎,膀胱炎,肋间神经痛,腹腔间隔室综合征,腹腔动脉压迫综合征,急性结肠假性梗阻,嗜酸粒细胞性胃肠炎,肠脂垂炎,家族性地中海热,高钙血症,甲状腺功能减退症,腹直肌鞘血肿,肾梗死,肠系膜动脉硬化,游走脾
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛
        ${assert}    Create List    急性胃肠炎    泌尿道感染    输尿管结石    肾结石    消化性溃疡    急性胆囊炎    急性心肌梗死    急性阑尾炎    急性胰腺炎    憩室炎    尿潴留    肾盂肾炎    膀胱炎    肋间神经痛    腹腔间隔室综合征    腹腔动脉压迫综合征    急性结肠假性梗阻    嗜酸粒细胞性胃肠炎    肠脂垂炎    家族性地中海热    高钙血症    甲状腺功能减退症    腹直肌鞘血肿    肾梗死    肠系膜动脉硬化    游走脾
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



11行-急性腹痛,推出诊断:急性胃肠炎,便秘,急性阑尾炎,炎症性肠病,缺血性肠病,急性肠系膜淋巴结炎,肠扭转,胃食管反流病,急性胰腺炎,胆道蛔虫病,肠梗阻,麦克尔憩室,肠绞窄,胃穿孔,肠穿孔,肾绞痛,急性胆囊炎,腹膜炎,腹部损伤,肝炎,糖尿病酮症酸中毒,镰状细胞性贫血
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性腹痛
        ${assert}    Create List    急性胃肠炎    便秘    急性阑尾炎    炎症性肠病    缺血性肠病    急性肠系膜淋巴结炎    肠扭转    胃食管反流病    急性胰腺炎    胆道蛔虫病    肠梗阻    麦克尔憩室    肠绞窄    胃穿孔    肠穿孔    肾绞痛    急性胆囊炎    腹膜炎    腹部损伤    肝炎    糖尿病酮症酸中毒    镰状细胞性贫血
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



12行-急性腹痛,推出诊断:急性胃肠炎,消化性溃疡,急性胆囊炎,急性阑尾炎,急性女性盆腔炎,流产,卵巢扭转,异位妊娠,肾绞痛,肠梗阻,急性腹膜炎,消化道穿孔,肾盂肾炎,急性出血坏死性肠炎,肝炎,炎症性肠病,缺血性肠病,主动脉夹层,肠扭转,自发性腹膜炎,腹主动脉瘤破裂,门静脉血栓形成,腹壁挫伤,带状疱疹,胸膜炎,肠易激综合征,便秘,细菌性食物中毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性腹痛
        ${assert}    Create List    急性胃肠炎    消化性溃疡    急性胆囊炎    急性阑尾炎    急性女性盆腔炎    流产    卵巢扭转    异位妊娠    肾绞痛    肠梗阻    急性腹膜炎    消化道穿孔    肾盂肾炎    急性出血坏死性肠炎    肝炎    炎症性肠病    缺血性肠病    主动脉夹层    肠扭转    自发性腹膜炎    腹主动脉瘤破裂    门静脉血栓形成    腹壁挫伤    带状疱疹    胸膜炎    肠易激综合征    便秘    细菌性食物中毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"15","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



13行-急性腹痛,推出诊断:急性胃肠炎,消化性溃疡,急性胆囊炎,急性阑尾炎,肾绞痛,肠梗阻,急性腹膜炎,消化道穿孔,肾盂肾炎,急性出血坏死性肠炎,肝炎,炎症性肠病,缺血性肠病,主动脉夹层,肠扭转,自发性腹膜炎,腹主动脉瘤破裂,门静脉血栓形成,腹壁挫伤,带状疱疹,胸膜炎,肠易激综合征,便秘,细菌性食物中毒,憩室炎,胃恶性肿瘤,结肠恶性肿瘤,食管裂孔疝
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性腹痛
        ${assert}    Create List    急性胃肠炎    消化性溃疡    急性胆囊炎    急性阑尾炎    肾绞痛    肠梗阻    急性腹膜炎    消化道穿孔    肾盂肾炎    急性出血坏死性肠炎    肝炎    炎症性肠病    缺血性肠病    主动脉夹层    肠扭转    自发性腹膜炎    腹主动脉瘤破裂    门静脉血栓形成    腹壁挫伤    带状疱疹    胸膜炎    肠易激综合征    便秘    细菌性食物中毒    憩室炎    胃恶性肿瘤    结肠恶性肿瘤    食管裂孔疝
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


14行-上腹痛,推出诊断:消化不良,胃炎,消化性溃疡,胆囊炎,急性心肌梗死,反流性食管炎,肠易激综合征,胆绞痛,十二指肠炎,胃轻瘫,胰腺炎,腹膜炎,肝炎,创伤性脾破裂,肝脓肿,胃恶性肿瘤,胰恶性肿瘤,药物相关性上腹痛,腹主动脉瘤破裂,肝大,脾大,脾脓肿,脾梗死,奥迪括约肌痉挛,肝周脓肿,巴德-基亚里综合征,门静脉血栓形成,肌痛
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    上腹痛
        ${assert}    Create List    消化不良    胃炎    消化性溃疡    胆囊炎    急性心肌梗死    反流性食管炎    肠易激综合征    胆绞痛    十二指肠炎    胃轻瘫    胰腺炎    腹膜炎    肝炎    创伤性脾破裂    肝脓肿    胃恶性肿瘤    胰恶性肿瘤    药物相关性上腹痛    腹主动脉瘤破裂    肝大    脾大    脾脓肿    脾梗死    奥迪括约肌痉挛    肝周脓肿    巴德-基亚里综合征    门静脉血栓形成    肌痛
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


15行-慢性腹痛,推出诊断:泌尿道感染,便秘,慢性胃炎,反流性食管炎,胃十二指肠溃疡,慢性胆囊炎,胆石病,病毒性感染,炎症性肠病,慢性胰腺炎,肠易激综合征,溃疡性结肠炎,克罗恩病,肾积水,泌尿系结石,子宫肌瘤,结核性腹膜炎,麦克尔憩室,子宫颈癌,子宫内膜癌,缺血性肠病,肝炎,肝细胞癌,肝脓肿,抑郁状态,焦虑状态,绒毛膜癌,肠道寄生虫病,带状疱疹
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    慢性腹痛
        ${assert}    Create List    泌尿道感染    便秘    慢性胃炎    反流性食管炎    胃十二指肠溃疡    慢性胆囊炎    胆石病    病毒性感染    炎症性肠病    慢性胰腺炎    肠易激综合征    溃疡性结肠炎    克罗恩病    肾积水    泌尿系结石    子宫肌瘤    结核性腹膜炎    麦克尔憩室    子宫颈癌    子宫内膜癌    缺血性肠病    肝炎    肝细胞癌    肝脓肿    抑郁状态    焦虑状态    绒毛膜癌    肠道寄生虫病    带状疱疹
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



16行-急性下腹痛,推出诊断:急性胃肠炎,泌尿道感染,急性阑尾炎,憩室炎,急性女性盆腔炎,泌尿系结石,肾盂肾炎,膀胱炎,尿潴留,流产,异位妊娠,盆腔脓肿,子宫内膜异位症,急性子宫内膜炎,急性胰腺炎,卵巢蒂扭转,卵巢破裂,骨盆疼痛综合征,子宫穿孔,精神性疼痛,肠痉挛,脊柱肿瘤,直肠炎,莫尔加尼囊状附件扭转,宫颈恶性肿瘤,卵巢过度刺激,绞窄性腹股沟疝
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性下腹痛
        ${assert}    Create List    急性胃肠炎    泌尿道感染    急性阑尾炎    憩室炎    急性女性盆腔炎    泌尿系结石    肾盂肾炎    膀胱炎    尿潴留    流产    异位妊娠    盆腔脓肿    子宫内膜异位症    急性子宫内膜炎    急性胰腺炎    卵巢蒂扭转    卵巢破裂    骨盆疼痛综合征    子宫穿孔    精神性疼痛    肠痉挛    脊柱肿瘤    直肠炎    莫尔加尼囊状附件扭转    宫颈恶性肿瘤    卵巢过度刺激    绞窄性腹股沟疝
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



17行-急性下腹痛,推出诊断:急性胃肠炎,泌尿道感染,输尿管结石,肾结石,前列腺炎,直肠炎,急性阑尾炎,急性胰腺炎,憩室炎,肾盂肾炎,膀胱炎,尿潴留,骨盆疼痛综合征,精神性疼痛,肠痉挛,脊柱肿瘤,绞窄性腹股沟疝
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性下腹痛
        ${assert}    Create List    急性胃肠炎    泌尿道感染    输尿管结石    肾结石    前列腺炎    直肠炎    急性阑尾炎    急性胰腺炎    憩室炎    肾盂肾炎    膀胱炎    尿潴留    骨盆疼痛综合征    精神性疼痛    肠痉挛    脊柱肿瘤    绞窄性腹股沟疝
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


# 18行-慢性下腹痛,推出诊断:子宫内膜异位症,慢性盆腔炎,骨盆疼痛综合征,卵巢囊肿,肠易激综合征,痛经,泌尿道感染,骨痛,子宫阴道脱垂,盆腔良性肿瘤,子宫平滑肌瘤,慢性子宫内膜炎,慢性间质性膀胱炎,宫内节育器不良反应,手术后盆腔腹膜粘连,子宫肿瘤,子宫附件恶性肿瘤,膀胱肿瘤,输尿管肿瘤,结肠肿瘤,憩室炎,乙状结肠恶性肿瘤,炎症性肠病,肠梗阻,肌痛
#         [Documentation]    断言:""
#         ${Assessment}    Set Variable
#         ${Subjective}    Set Variable    慢性下腹痛
#         ${assert}    Create List    子宫内膜异位症    慢性盆腔炎    骨盆疼痛综合征    卵巢囊肿    肠易激综合征    痛经    泌尿道感染    骨痛    子宫阴道脱垂    盆腔良性肿瘤    子宫平滑肌瘤    慢性子宫内膜炎    慢性间质性膀胱炎    宫内节育器不良反应    手术后盆腔腹膜粘连    子宫肿瘤    子宫附件恶性肿瘤    膀胱肿瘤    输尿管肿瘤    结肠肿瘤    憩室炎    乙状结肠恶性肿瘤    炎症性肠病    肠梗阻    肌痛
#         [Setup]    Run Keywords    获取时间戳
#         ...    AND    获取随机数
#         ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
#         ...    doctorGuid=675    doctorName=hmkj
#         ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#         ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#         ...    definiteDiagnosis=
#         ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#         ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
#         ...    labTestList=
#         ...    examinationList=
#         ...    newTestList=
#         ...    operationRecord=
#         ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
    ...    newRecogFlag=1#
    #####疑似诊断
#         ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#         # Lists should Be Equal    ${aj}    ${assert}
#         List Should Contain Sub List    ${aj}    ${assert}


19行-便秘,推出诊断:功能性便秘,肛裂,痔,肛周脓肿,克罗恩病,药物相关性便秘,胃肠功能障碍,肠易激综合征,肠粘连,结肠恶性肿瘤,盆腔肿瘤,肠梗阻,肥胖症,后天性巨结肠,肠憩室病,甲状腺功能减退症,高钙血症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    便秘
        ${assert}    Create List    功能性便秘    肛裂    痔    肛周脓肿    克罗恩病    药物相关性便秘    胃肠功能障碍    肠易激综合征    肠粘连    结肠恶性肿瘤    盆腔肿瘤    肠梗阻    肥胖症    后天性巨结肠    肠憩室病    甲状腺功能减退症    高钙血症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



20行-腹泻,推出诊断:牛奶过敏反应,诺如病毒肠炎,大肠杆菌性肠炎,细菌性肠炎,炎症性肠病,肠道念珠菌病,乳糖不耐受,药物相关性腹泻,急性上呼吸道感染,支气管肺炎,过敏性腹泻,短肠综合征,泌尿道感染,食物过敏,囊性纤维化病,小肠肿瘤,蛋白丢失性胃肠病,慢性胰腺炎,甲状腺功能亢进症,糖尿病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹泻
        ${assert}    Create List    牛奶过敏反应    诺如病毒肠炎    大肠杆菌性肠炎    细菌性肠炎    炎症性肠病    肠道念珠菌病    乳糖不耐受    药物相关性腹泻    急性上呼吸道感染    支气管肺炎    过敏性腹泻    短肠综合征    泌尿道感染    食物过敏    囊性纤维化病    小肠肿瘤    蛋白丢失性胃肠病    慢性胰腺炎    甲状腺功能亢进症    糖尿病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



21行-腹泻,推出诊断:感染性腹泻,急性胃肠炎,肠易激综合征,炎症性肠病,胃肠功能紊乱,细菌性食物中毒,药物相关性腹泻,憩室炎,腹胀满病,乳糖不耐受,肠肿瘤,酒精滥用,乳糜泻,阑尾炎,甲状腺功能亢进症,肠吸收不良,过敏性腹泻,阿米巴病,卵巢恶性肿瘤,钩虫病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹泻
        ${assert}    Create List    感染性腹泻    急性胃肠炎    肠易激综合征    炎症性肠病    胃肠功能紊乱    细菌性食物中毒    药物相关性腹泻    憩室炎    腹胀满病    乳糖不耐受    肠肿瘤    酒精滥用    乳糜泻    阑尾炎    甲状腺功能亢进症    肠吸收不良    过敏性腹泻    阿米巴病    卵巢恶性肿瘤    钩虫病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



22行-呕吐,推出诊断:急性下呼吸道感染,腹泻,急性出血坏死性肠炎,低钠血症,泌尿道感染,肠套叠,中枢神经系统感染,颅内出血,颅脑外伤,先天性幽门狭窄,贲门失弛缓症,药物相关性呕吐,先天性肠旋转不良,环状胰腺,胎粪性腹膜炎,胎粪性肠梗阻,一氧化碳中毒,败血症,幽门狭窄
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呕吐
        ${assert}    Create List    急性下呼吸道感染    腹泻    急性出血坏死性肠炎    低钠血症    泌尿道感染    肠套叠    中枢神经系统感染    颅内出血    颅脑外伤    先天性幽门狭窄    贲门失弛缓症    药物相关性呕吐    先天性肠旋转不良    环状胰腺    胎粪性腹膜炎    胎粪性肠梗阻    一氧化碳中毒    败血症    幽门狭窄
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



23行-呕吐,推出诊断:急性胃肠炎,急性细菌性痢疾,病毒性肝炎,胃食管反流病,急性阑尾炎,消化性溃疡,肠梗阻,贲门失弛缓症,便秘,蛔虫病伴有肠道并发症,肠系膜上动脉压迫综合征,中枢神经系统感染,糖尿病酮症酸中毒,尿毒症,颅内占位性病变,颅脑外伤,一氧化碳中毒,药物相关性呕吐,神经性厌食
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呕吐
        ${assert}    Create List    急性胃肠炎    急性细菌性痢疾    病毒性肝炎    胃食管反流病    急性阑尾炎    消化性溃疡    肠梗阻    贲门失弛缓症    便秘    蛔虫病伴有肠道并发症    肠系膜上动脉压迫综合征    中枢神经系统感染    糖尿病酮症酸中毒    尿毒症    颅内占位性病变    颅脑外伤    一氧化碳中毒    药物相关性呕吐    神经性厌食
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"3","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


24行-呕吐,推出诊断:胃肠炎,急性上呼吸道感染,胃和十二指肠疾病,急腹症,低血糖,幽门梗阻,肠梗阻,胆囊炎,胆石病,妊娠,梅尼埃病,胃神经官能症,迷路炎,胰腺炎,药物相关性呕吐,幽门狭窄,妊娠合并阑尾炎,消化性溃疡,胃恶性肿瘤,酒精中毒,偏头痛,颅内压增高,脑膜炎,脑出血,神经性贪食,癔症,良性阵发性眩晕,肾盂肾炎,输尿管结石,肾衰竭
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呕吐
        ${assert}    Create List    胃肠炎    急性上呼吸道感染    胃和十二指肠疾病    急腹症    低血糖    幽门梗阻    肠梗阻    胆囊炎    胆石病    妊娠    梅尼埃病    胃神经官能症    迷路炎    胰腺炎    药物相关性呕吐    幽门狭窄    妊娠合并阑尾炎    消化性溃疡    胃恶性肿瘤    酒精中毒    偏头痛    颅内压增高    脑膜炎    脑出血    神经性贪食    癔症    良性阵发性眩晕    肾盂肾炎    输尿管结石    肾衰竭
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


25行-呕血,推出诊断:急性胃黏膜病变,胃溃疡,十二指肠溃疡,肝硬化伴食管静脉曲张破裂出血,食管恶性肿瘤,胃恶性肿瘤,胃食管反流病,食管异物穿孔,憩室炎,食管贲门黏膜撕裂综合征,食管裂孔疝,纵隔恶性肿瘤,胆管出血,食管腐蚀伤,腐蚀性胃炎,食管破裂,门脉高压性胃肠病,胆管结石,胆道蛔虫病,原发性胆囊癌,胆管癌,胰腺炎,胆囊十二指肠瘘,血小板减少,白血病,血友病,再生障碍性贫血,鼻出血,咯血,抗坏血酸缺乏,
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呕血
        ${assert}    Create List    急性胃黏膜病变    胃溃疡    十二指肠溃疡    肝硬化伴食管静脉曲张破裂出血    食管恶性肿瘤    胃恶性肿瘤    胃食管反流病    食管异物穿孔    憩室炎    食管贲门黏膜撕裂综合征    食管裂孔疝    纵隔恶性肿瘤    胆管出血    食管腐蚀伤    腐蚀性胃炎    食管破裂    门脉高压性胃肠病    胆管结石    胆道蛔虫病    原发性胆囊癌    胆管癌    胰腺炎    胆囊十二指肠瘘    血小板减少    白血病    血友病    再生障碍性贫血    鼻出血    咯血    抗坏血酸缺乏
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



26行-腹股沟肿物,推出诊断:腹股沟淋巴结肿大,腹股沟疝,股疝,大隐静脉曲张,皮脂腺囊肿,腹股沟脓肿,转移性肿瘤,低位阑尾肿块,盆腔肿瘤,腹股沟肿瘤,脂肪瘤,腰大肌脓肿,淋巴瘤,动脉瘤,神经纤维瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹股沟肿物
        ${assert}    Create List    腹股沟淋巴结肿大    腹股沟疝    股疝    大隐静脉曲张    皮脂腺囊肿    腹股沟脓肿    转移性肿瘤    低位阑尾肿块    盆腔肿瘤    腹股沟肿瘤    脂肪瘤    腰大肌脓肿    淋巴瘤    动脉瘤    神经纤维瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




27行-腹股沟包块,推出诊断:腹股沟淋巴结肿大,腹股沟疝,股疝,大隐静脉曲张,皮脂腺囊肿,腹股沟脓肿,转移性肿瘤,低位阑尾肿块,盆腔肿瘤,腹股沟肿瘤,脂肪瘤,腰大肌脓肿,淋巴瘤,动脉瘤,神经纤维瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹股沟包块
        ${assert}    Create List    腹股沟淋巴结肿大    腹股沟疝    股疝    大隐静脉曲张    皮脂腺囊肿    腹股沟脓肿    转移性肿瘤    低位阑尾肿块    盆腔肿瘤    腹股沟肿瘤    脂肪瘤    腰大肌脓肿    淋巴瘤    动脉瘤    神经纤维瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


28行-腹股沟肿物,推出诊断:腹股沟淋巴结肿大,腹股沟疝,股疝,皮脂腺囊肿,精索静脉曲张,精索鞘膜积液,盆腔肿瘤,大隐静脉曲张,先天性可回缩睾丸,腹股沟脓肿,转移性肿瘤,隐睾,异位睾丸,腹股沟肿瘤,脂肪瘤,腰大肌脓肿,淋巴瘤,动脉瘤,神经纤维瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹股沟肿物
        ${assert}    Create List    腹股沟淋巴结肿大    腹股沟疝    股疝    皮脂腺囊肿    精索静脉曲张    精索鞘膜积液    盆腔肿瘤    大隐静脉曲张    先天性可回缩睾丸    腹股沟脓肿    转移性肿瘤    隐睾    异位睾丸    腹股沟肿瘤    脂肪瘤    腰大肌脓肿    淋巴瘤    动脉瘤    神经纤维瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


29行-腹股沟包块,推出诊断:腹股沟淋巴结肿大,腹股沟疝,股疝,皮脂腺囊肿,精索静脉曲张,精索鞘膜积液,盆腔肿瘤,大隐静脉曲张,先天性可回缩睾丸,腹股沟脓肿,转移性肿瘤,隐睾,异位睾丸,腹股沟肿瘤,脂肪瘤,腰大肌脓肿,淋巴瘤,动脉瘤,神经纤维瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹股沟包块
        ${assert}    Create List    腹股沟淋巴结肿大    腹股沟疝    股疝    皮脂腺囊肿    精索静脉曲张    精索鞘膜积液    盆腔肿瘤    大隐静脉曲张    先天性可回缩睾丸    腹股沟脓肿    转移性肿瘤    隐睾    异位睾丸    腹股沟肿瘤    脂肪瘤    腰大肌脓肿    淋巴瘤    动脉瘤    神经纤维瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


30行-喘鸣,推出诊断:急性喉气管炎,急性喉炎,气管支气管炎,气管内异物,急性会厌炎,喉水肿,喉狭窄,喉麻痹,支气管哮喘,急性梗阻性喉炎［哮吼］,喉肿瘤,咽后脓肿,白喉,喉和气管烧伤,扁桃体周脓肿,急性气管炎,喉痉挛,声带麻痹
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    喘鸣
        ${assert}    Create List    急性喉气管炎    急性喉炎    气管支气管炎    气管内异物    急性会厌炎    喉水肿    喉狭窄    喉麻痹    支气管哮喘    急性梗阻性喉炎［哮吼］    喉肿瘤    咽后脓肿    白喉    喉和气管烧伤    扁桃体周脓肿    急性气管炎    喉痉挛    声带麻痹
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



31行-颈部僵硬,推出诊断:病毒性上呼吸道感染,颈部淋巴结炎,颈椎病,颈部皮肤脓肿、疖和痈,挥鞭伤,斜颈,癔症,脑膜炎,脑脓肿,脊柱骨折,骨肿瘤,脑出血,脑肿瘤,类风湿性关节炎,强直性脊柱炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    颈部僵硬
        ${assert}    Create List    病毒性上呼吸道感染    颈部淋巴结炎    颈椎病    颈部皮肤脓肿、疖和痈    挥鞭伤    斜颈    癔症    脑膜炎    脑脓肿    脊柱骨折    骨肿瘤    脑出血    脑肿瘤    类风湿性关节炎    强直性脊柱炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



32行-颈部肿物,推出诊断:颈部淋巴结炎,甲状腺结节,甲状腺炎,甲状腺肿瘤,颌下腺良性肿瘤,颈淋巴结肿大,颈部血管瘤,颈动脉瘤,甲状舌管囊肿,颈淋巴结结核,颈部淋巴管瘤,颌下腺恶性肿瘤,皮脂腺囊肿,咽囊,转移性肿瘤,支气管囊肿,放线菌病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    颈部肿物
        ${assert}    Create List    颈部淋巴结炎    甲状腺结节    甲状腺炎    甲状腺肿瘤    颌下腺良性肿瘤    颈淋巴结肿大    颈部血管瘤    颈动脉瘤    甲状舌管囊肿    颈淋巴结结核    颈部淋巴管瘤    颌下腺恶性肿瘤    皮脂腺囊肿    咽囊    转移性肿瘤    支气管囊肿    放线菌病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


33行-声音嘶哑,推出诊断:急性喉炎,慢性喉炎,急性咽炎,急性扁桃体炎,鼻窦炎,甲状腺功能减退症,喉恶性肿瘤,喉返神经麻痹,急性会厌炎,咽喉损伤,化学性上呼吸道炎症,癔病性失音,声带结节,声带息肉,喉息肉,胃食管反流病,帕金森病,运动神经元病,震颤,重症肌无力,喉白斑,淀粉样变喉损害
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    声音嘶哑
        ${assert}    Create List    急性喉炎    慢性喉炎    急性咽炎    急性扁桃体炎    鼻窦炎    甲状腺功能减退症    喉恶性肿瘤    喉返神经麻痹    急性会厌炎    咽喉损伤    化学性上呼吸道炎症    癔病性失音    声带结节    声带息肉    喉息肉    胃食管反流病    帕金森病    运动神经元病    震颤    重症肌无力    喉白斑    淀粉样变喉损害
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



34行-吞咽困难,推出诊断:食管狭窄,咽炎,食管炎,扁桃体炎,胃食管反流病,化学性食管炎,神经官能症,食管癌,贲门失弛缓症,重症肌无力,胃恶性肿瘤,咽喉恶性肿瘤,缺铁性吞咽困难,咽后脓肿,咽囊,食管内异物,食管裂孔疝,纵隔肿瘤,干燥综合征,全身性硬皮病,多发性肌炎,皮肌炎,脑神经炎,系统性硬化症,强直性肌营养不良,有机磷中毒,球麻痹,运动神经元病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    吞咽困难
        ${assert}    Create List    食管狭窄    咽炎    食管炎    扁桃体炎    胃食管反流病    化学性食管炎    神经官能症    食管癌    贲门失弛缓症    重症肌无力    胃恶性肿瘤    咽喉恶性肿瘤    缺铁性吞咽困难    咽后脓肿    咽囊    食管内异物    食管裂孔疝    纵隔肿瘤    干燥综合征    全身性硬皮病    多发性肌炎    皮肌炎    脑神经炎    系统性硬化症    强直性肌营养不良    有机磷中毒    球麻痹    运动神经元病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



35行-咽痛,推出诊断:急性扁桃体炎,扁桃体周脓肿,急性咽炎,链球菌性咽炎,咽后脓肿,病毒性咽炎,咽峡炎,传染性单核细胞增多症,白喉,会厌炎,颈动脉痛,口咽恶性肿瘤,反流性食管炎,急性甲状腺炎,亚急性甲状腺炎,神经根痛,舌咽神经痛,念珠菌性口炎,淋球菌性咽炎,鼻后滴漏综合征,肥大性咽炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咽痛
        ${assert}    Create List    急性扁桃体炎    扁桃体周脓肿    急性咽炎    链球菌性咽炎    咽后脓肿    病毒性咽炎    咽峡炎    传染性单核细胞增多症    白喉    会厌炎    颈动脉痛    口咽恶性肿瘤    反流性食管炎    急性甲状腺炎    亚急性甲状腺炎    神经根痛    舌咽神经痛    念珠菌性口炎    淋球菌性咽炎    鼻后滴漏综合征    肥大性咽炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


36行-气急,推出诊断:心力衰竭,肺部感染,胸腔积液,冠状动脉粥样硬化性心脏病,慢性阻塞性肺病伴有急性下呼吸道感染,肺炎,急性支气管炎,支气管扩张伴感染,肺恶性肿瘤,间质性肺病,急性喉气管炎,急性心肌梗死
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    气急
        ${assert}    Create List    心力衰竭    肺部感染    胸腔积液    冠状动脉粥样硬化性心脏病    慢性阻塞性肺病伴有急性下呼吸道感染    肺炎    急性支气管炎    支气管扩张伴感染    肺恶性肿瘤    间质性肺病    急性喉气管炎    急性心肌梗死
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


37行-气促,推出诊断:心力衰竭,肺部感染,胸腔积液,冠状动脉粥样硬化性心脏病,慢性阻塞性肺病伴有急性下呼吸道感染,肺炎,急性支气管炎,支气管扩张伴感染,肺恶性肿瘤,间质性肺病,急性喉气管炎,急性心肌梗死
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    气促
        ${assert}    Create List    心力衰竭    肺部感染    胸腔积液    冠状动脉粥样硬化性心脏病    慢性阻塞性肺病伴有急性下呼吸道感染    肺炎    急性支气管炎    支气管扩张伴感染    肺恶性肿瘤    间质性肺病    急性喉气管炎    急性心肌梗死
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



38行-呼吸困难,推出诊断:喉炎,肺炎,慢性阻塞性肺病,喉水肿,心力衰竭,支气管哮喘,急性呼吸窘迫综合征,冠状动脉粥样硬化性心脏病,贫血,气胸,胸腔积液,肺脓肿,支气管扩张,肺栓塞,心肌病,心脏瓣膜病,肺原位癌,主动脉狭窄,通气过度,急性冠脉综合征,心包压塞,炎症后肺纤维化,肺动脉高压,间质性肺病,食管裂孔疝,由右向左分流的先天性心脏病,由左向右分流的先天性心脏病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呼吸困难
        ${assert}    Create List    喉炎    肺炎    慢性阻塞性肺病    喉水肿    心力衰竭    支气管哮喘    急性呼吸窘迫综合征    冠状动脉粥样硬化性心脏病    贫血    气胸    胸腔积液    肺脓肿    支气管扩张    肺栓塞    心肌病    心脏瓣膜病    肺原位癌    主动脉狭窄    通气过度    急性冠脉综合征    心包压塞    炎症后肺纤维化    肺动脉高压    间质性肺病    食管裂孔疝    由右向左分流的先天性心脏病    由左向右分流的先天性心脏病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




39行-咳嗽,推出诊断:急性上呼吸道感染,急性下呼吸道感染,毛细支气管炎,急性气管支气管炎,支气管肺炎,咳嗽变异性哮喘,疱疹性咽峡炎,咽结膜热,急性喉炎,急性化脓性扁桃体炎,大叶性肺炎,鼻窦炎,气管内异物,嗜酸细胞性肺炎,胃食管反流病,心因性咳嗽,肺结核,鼻后滴漏综合征,肺异物,耳内异物,免疫缺陷,间质性肺病,先天性气管食管瘘,百日咳
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咳嗽
        ${assert}    Create List
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"17","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


40行-慢性咳嗽,推出诊断:咳嗽变异性哮喘,上气道咳嗽综合征,心因性咳嗽,气管内异物,胃食管反流病,嗜酸细胞性肺炎,肺结核,肺异物,间质性肺病,百日咳,耳内异物,免疫缺陷,先天性气管食管瘘
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    慢性咳嗽
        ${assert}    Create List    咳嗽变异性哮喘    上气道咳嗽综合征    心因性咳嗽    气管内异物    胃食管反流病    嗜酸细胞性肺炎    肺结核    肺异物    间质性肺病    百日咳    耳内异物    免疫缺陷    先天性气管食管瘘
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"17","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


41行-咳嗽,推出诊断:急性上呼吸道感染,急性下呼吸道感染,急性气管支气管炎,鼻炎,咳嗽变异性哮喘,支气管炎,肺炎,胃食管反流病,左心室衰竭,支气管扩张,吸入性肺炎,肺结核,药物不良反应,肺肿瘤,间质性肺病,间质性纤维化性肺泡炎,过敏性肺炎,急性气管炎,鼻息肉,心因性咳嗽,喉恶性肿瘤,肺异物,气管内异物,膈肌刺激
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咳嗽
        ${assert}    Create List    急性上呼吸道感染    急性下呼吸道感染    急性气管支气管炎    鼻炎    咳嗽变异性哮喘    支气管炎    肺炎    胃食管反流病    左心室衰竭    支气管扩张    吸入性肺炎    肺结核    药物不良反应    肺肿瘤    间质性肺病    间质性纤维化性肺泡炎    过敏性肺炎    急性气管炎    鼻息肉    心因性咳嗽    喉恶性肿瘤    肺异物    气管内异物    膈肌刺激
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



42行-咯血,推出诊断:肺炎,支气管扩张,慢性支气管炎,支气管恶性肿瘤,肺结核,支气管结核,二尖瓣狭窄,慢性阻塞性肺病,肺动脉高压,肺水肿,肺栓塞,结节性多动脉炎,喉肿瘤,支气管结石,支气管腺瘤,肺真菌感染,气管肿瘤,系统性红斑狼疮,曲霉病,流行性出血热,白塞病,ANCA相关性血管炎,抗磷脂综合征,肺挫伤,气管内异物,弥散性血管内凝血,肺出血型钩端螺旋体病,先天性肺动静脉瘘,支气管动静脉瘘,肺含铁血黄素沉积症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咯血
        ${assert}    Create List    肺炎    支气管扩张    慢性支气管炎    支气管恶性肿瘤    肺结核    支气管结核    二尖瓣狭窄    慢性阻塞性肺病    肺动脉高压    肺水肿    肺栓塞    结节性多动脉炎    喉肿瘤    支气管结石    支气管腺瘤    肺真菌感染    气管肿瘤    系统性红斑狼疮    曲霉病    流行性出血热    白塞病    ANCA相关性血管炎    抗磷脂综合征    肺挫伤    气管内异物    弥散性血管内凝血    肺出血型钩端螺旋体病    先天性肺动静脉瘘    支气管动静脉瘘    肺含铁血黄素沉积症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



43行-心悸,推出诊断:窦性心动过速,期前收缩,室性心动过速,室上性心动过速,贫血,心动过缓,房室传导阻滞,冠状动脉粥样硬化性心脏病,高血压性心脏病,心房颤动,心房扑动,心脏瓣膜病,心肌病,心肌炎,心包炎,病态窦房结综合征,妊娠,发热,焦虑状态,甲状腺功能亢进症,围绝经期综合征,药物不良反应,预激综合征,低血糖,嗜铬细胞瘤,二尖瓣脱垂,起搏器综合征,心脏粘液瘤,由右向左分流的先天性心脏病,由左向右分流的先天性心脏病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    心悸
        ${assert}    Create List    窦性心动过速    期前收缩    室性心动过速    室上性心动过速    贫血    心动过缓    房室传导阻滞    冠状动脉粥样硬化性心脏病    高血压性心脏病    心房颤动    心房扑动    心脏瓣膜病    心肌病    心肌炎    心包炎    病态窦房结综合征    妊娠    发热    焦虑状态    甲状腺功能亢进症    围绝经期综合征    药物不良反应    预激综合征    低血糖    嗜铬细胞瘤    二尖瓣脱垂    起搏器综合征    心脏粘液瘤    由右向左分流的先天性心脏病    由左向右分流的先天性心脏病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


44行-闭经,推出诊断:妊娠,情绪冲动和紧张状态,多囊卵巢综合征,女性更年期综合征,卵巢早衰,药物相关性停经,甲状腺功能亢进症,甲状腺功能减退症,神经性厌食,口服避孕药,高催乳素血症,肾上腺皮质功能减退症,过度训练,库欣综合征,先天性肾上腺皮质增生症,产后垂体功能减退症,卵巢肿瘤,垂体肿瘤,垂体前叶功能减退危象,处女膜闭锁,下丘脑功能不良,糖尿病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    闭经
        ${assert}    Create List    妊娠    情绪冲动和紧张状态    多囊卵巢综合征    女性更年期综合征    卵巢早衰    药物相关性停经    甲状腺功能亢进症    甲状腺功能减退症    神经性厌食    口服避孕药    高催乳素血症    肾上腺皮质功能减退症    过度训练    库欣综合征    先天性肾上腺皮质增生症    产后垂体功能减退症    卵巢肿瘤    垂体肿瘤    垂体前叶功能减退危象    处女膜闭锁    下丘脑功能不良    糖尿病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


45行-月经过多,推出诊断:功能障碍性子宫出血,宫颈息肉,子宫内膜息肉,子宫内膜异位症,子宫肌瘤,青春期月经过多,女性更年期综合征,子宫内膜炎,子宫腺肌病,宫内节育器不良反应,慢性盆腔炎,甲状腺功能减退症,凝血障碍,高催乳素血症,子宫内膜癌,库欣综合征,肾上腺皮质功能减退症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    月经过多
        ${assert}    Create List    功能障碍性子宫出血    宫颈息肉    子宫内膜息肉    子宫内膜异位症    子宫肌瘤    青春期月经过多    女性更年期综合征    子宫内膜炎    子宫腺肌病    宫内节育器不良反应    慢性盆腔炎    甲状腺功能减退症    凝血障碍    高催乳素血症    子宫内膜癌    库欣综合征    肾上腺皮质功能减退症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


46行-不规则阴道流血,推出诊断:功能障碍性子宫出血,排卵期出血,宫颈炎性疾病,子宫肌瘤,妊娠早期出血,子宫内膜炎,宫颈息肉,子宫腺肌病,慢性盆腔炎,围绝经期综合征,葡萄胎,子宫内膜增厚,口服避孕药,宫内节育器不良反应,老年性阴道炎,子宫内膜息肉,甲状腺功能减退症,子宫积脓,宫颈外翻,阴道息肉,阴道炎,异常子宫出血,子宫内膜癌,子宫颈癌,卵巢肿瘤,阴道癌,外生殖器挫伤,出血性疾病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    不规则阴道流血
        ${assert}    Create List    功能障碍性子宫出血    排卵期出血    宫颈炎性疾病    子宫肌瘤    妊娠早期出血    子宫内膜炎    宫颈息肉    子宫腺肌病    慢性盆腔炎    围绝经期综合征    葡萄胎    子宫内膜增厚    口服避孕药    宫内节育器不良反应    老年性阴道炎    子宫内膜息肉    甲状腺功能减退症    子宫积脓    宫颈外翻    阴道息肉    阴道炎    异常子宫出血    子宫内膜癌    子宫颈癌    卵巢肿瘤    阴道癌    外生殖器挫伤    出血性疾病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



47行-痛经,推出诊断:原发性痛经,子宫内膜异位症,子宫腺肌病,子宫肌瘤,慢性盆腔炎,宫内节育器不良反应,女性盆腔静脉充血综合征,宫腔粘连,子宫后倾,宫颈炎性疾病,卵巢囊肿,子宫内膜息肉,先天性子宫畸形,处女膜闭锁,子宫发育不全,先天性宫颈狭窄,精神源性痛经原发性痛经,子宫内膜异位症,子宫腺肌病,子宫肌瘤,慢性盆腔炎,宫内节育器不良反应,女性盆腔静脉充血综合征,宫腔粘连,子宫后倾,宫颈炎性疾病,卵巢囊肿,子宫内膜息肉,先天性子宫畸形,处女膜闭锁,子宫发育不全,先天性宫颈狭窄,精神源性痛经
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    痛经
        ${assert}    Create List    原发性痛经    子宫内膜异位症    子宫腺肌病    子宫肌瘤    慢性盆腔炎    宫内节育器不良反应    女性盆腔静脉充血综合征    宫腔粘连    子宫后倾    宫颈炎性疾病    卵巢囊肿    子宫内膜息肉    先天性子宫畸形    处女膜闭锁    子宫发育不全    先天性宫颈狭窄    精神源性痛经
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


48行-意识模糊,推出诊断:败血症,脑血管意外,癫痫,低血糖,低氧血症,酒精戒断综合征,酒精中毒,电解质代谢紊乱,心功能不全,肝功能不全,颅内感染,尿毒症,糖尿病酮症酸中毒,药物相关性意识模糊,黏液性水肿昏迷,韦尼克脑病,颅内肿瘤,甲状旁腺功能减退症,甲状旁腺功能亢进症,库欣病,颅脑外伤,高血压脑病,一氧化碳中毒,糖尿病高渗高血糖综合征,高碳酸血症,高渗透性和高钠血症,低渗透性和低钠血症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    意识模糊
        ${assert}    Create List    败血症    脑血管意外    癫痫    低血糖    低氧血症    酒精戒断综合征    酒精中毒    电解质代谢紊乱    心功能不全    肝功能不全    颅内感染    尿毒症    糖尿病酮症酸中毒    药物相关性意识模糊    黏液性水肿昏迷    韦尼克脑病    颅内肿瘤    甲状旁腺功能减退症    甲状旁腺功能亢进症    库欣病    颅脑外伤    高血压脑病    一氧化碳中毒    糖尿病高渗高血糖综合征    高碳酸血症    高渗透性和高钠血症    低渗透性和低钠血症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



49行-谵妄,推出诊断:败血症,脑血管意外,癫痫,低血糖,低氧血症,酒精戒断综合征,酒精中毒,电解质代谢紊乱,心功能不全,肝功能不全,颅内感染,尿毒症,糖尿病酮症酸中毒,药物相关性意识模糊,黏液性水肿昏迷,韦尼克脑病,颅内肿瘤,甲状旁腺功能减退症,甲状旁腺功能亢进症,库欣病,颅脑外伤,高血压脑病,一氧化碳中毒,糖尿病高渗高血糖综合征,高碳酸血症,高渗透性和高钠血症,低渗透性和低钠血症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    谵妄
        ${assert}    Create List    败血症    脑血管意外    癫痫    低血糖    低氧血症    酒精戒断综合征    酒精中毒    电解质代谢紊乱    心功能不全    肝功能不全    颅内感染    尿毒症    糖尿病酮症酸中毒    药物相关性意识模糊    黏液性水肿昏迷    韦尼克脑病    颅内肿瘤    甲状旁腺功能减退症    甲状旁腺功能亢进症    库欣病    颅脑外伤    高血压脑病    一氧化碳中毒    糖尿病高渗高血糖综合征    高碳酸血症    高渗透性和高钠血症    低渗透性和低钠血症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



50行-头晕,推出诊断:焦虑状态,低血糖,直立性低血压,椎-基底动脉供血不足,短暂性脑缺血发作,良性阵发性眩晕,梅尼埃病,病毒性感染,急性中毒,慢性酒精中毒,药物不良反应,心律失常,冠状动脉粥样硬化性心脏病,心功能不全,周围神经病,帕金森综合征,小脑共济失调,颈椎病,主动脉狭窄,锁骨下动脉盗血综合征,症状性局灶性癫痫,肾上腺皮质功能减退症,一氧化碳中毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    头晕
        ${assert}    Create List    焦虑状态    低血糖    直立性低血压    椎-基底动脉供血不足    短暂性脑缺血发作    良性阵发性眩晕    梅尼埃病    病毒性感染    急性中毒    慢性酒精中毒    药物不良反应    心律失常    冠状动脉粥样硬化性心脏病    心功能不全    周围神经病    帕金森综合征    小脑共济失调    颈椎病    主动脉狭窄    锁骨下动脉盗血综合征    症状性局灶性癫痫    肾上腺皮质功能减退症    一氧化碳中毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



51行-幻觉,推出诊断:伴有滥用可能性的精神兴奋剂的有害效应,极度疲劳,使用酒精引起的精神性障碍,谵妄,代谢紊乱,癫痫,高热惊厥,颅内占位性病变,抑郁性精神病,急性应激反应,低氧血症,嗜睡,躁狂发作,代谢性脑病,帕金森病,路易体痴呆,精神分裂症,脑震荡后综合征伴有滥用可能性的精神兴奋剂的有害效应,极度疲劳,使用酒精引起的精神性障碍,谵妄,代谢紊乱,癫痫,高热惊厥,颅内占位性病变,抑郁性精神病,急性应激反应,低氧血症,嗜睡,躁狂发作,代谢性脑病,帕金森病,路易体痴呆,精神分裂症,脑震荡后综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    幻觉
        ${assert}    Create List    伴有滥用可能性的精神兴奋剂的有害效应    极度疲劳    使用酒精引起的精神性障碍    谵妄    代谢紊乱    癫痫    高热惊厥    颅内占位性病变    抑郁性精神病    急性应激反应    低氧血症    嗜睡    躁狂发作    代谢性脑病    帕金森病    路易体痴呆    精神分裂症    脑震荡后综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


52行-头痛,推出诊断:紧张型头痛,鼻窦炎,偏头痛,颈椎病,丛集性头痛,三叉神经痛,急性上呼吸道感染,视网膜性偏头痛,药物性头痛,慢性创伤后头痛,反应性低血糖症,疲劳综合征,巨细胞动脉炎,蛛网膜下出血,脑膜炎,脑出血,恶性高血压,急性闭角型青光眼,视神经炎,大脑静脉非脓性血栓形成,脑震荡后综合征,大脑动脉夹层形成，未破裂,颅内占位性病变,一氧化碳中毒,垂体卒中,嗜铬细胞瘤,带状疱疹后遗症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    头痛
        ${assert}    Create List    紧张型头痛    鼻窦炎    偏头痛    颈椎病    丛集性头痛    三叉神经痛    急性上呼吸道感染    视网膜性偏头痛    药物性头痛    慢性创伤后头痛    反应性低血糖症    疲劳综合征    巨细胞动脉炎    蛛网膜下出血    脑膜炎    脑出血    恶性高血压    急性闭角型青光眼    视神经炎    大脑静脉非脓性血栓形成    脑震荡后综合征    大脑动脉夹层形成，未破裂    颅内占位性病变    一氧化碳中毒    垂体卒中    嗜铬细胞瘤    带状疱疹后遗症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


53行-头痛,推出诊断:紧张型头痛,鼻窦炎,青光眼,偏头痛,颈椎病,丛集性头痛,三叉神经痛,急性上呼吸道感染,视网膜性偏头痛,药物性头痛,慢性创伤后头痛,反应性低血糖症,疲劳综合征,巨细胞动脉炎,蛛网膜下出血,脑膜炎,脑出血,恶性高血压,视神经炎,大脑静脉非脓性血栓形成,脑震荡后综合征,大脑动脉夹层形成，未破裂,颅内占位性病变,一氧化碳中毒,垂体卒中,嗜铬细胞瘤,带状疱疹后遗症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    头痛
        ${assert}    Create List    紧张型头痛    鼻窦炎    青光眼    偏头痛    颈椎病    丛集性头痛    三叉神经痛    急性上呼吸道感染    视网膜性偏头痛    药物性头痛    慢性创伤后头痛    反应性低血糖症    疲劳综合征    巨细胞动脉炎    蛛网膜下出血    脑膜炎    脑出血    恶性高血压    视神经炎    大脑静脉非脓性血栓形成    脑震荡后综合征    大脑动脉夹层形成，未破裂    颅内占位性病变    一氧化碳中毒    垂体卒中    嗜铬细胞瘤    带状疱疹后遗症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"61","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




54行-头痛,推出诊断:紧张型头痛,鼻窦炎,偏头痛,颈椎病,丛集性头痛,三叉神经痛,急性上呼吸道感染,视网膜性偏头痛,药物性头痛,慢性创伤后头痛,反应性低血糖症,疲劳综合征,巨细胞动脉炎,蛛网膜下出血,脑膜炎,脑出血,恶性高血压,急性闭角型青光眼,视神经炎,大脑静脉非脓性血栓形成,脑震荡后综合征,大脑动脉夹层形成，未破裂,颅内占位性病变,一氧化碳中毒,垂体卒中,嗜铬细胞瘤,带状疱疹后遗症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    头痛
        ${assert}    Create List    紧张型头痛    鼻窦炎    偏头痛    颈椎病    丛集性头痛    三叉神经痛    急性上呼吸道感染    视网膜性偏头痛    药物性头痛    慢性创伤后头痛    反应性低血糖症    疲劳综合征    巨细胞动脉炎    蛛网膜下出血    脑膜炎    脑出血    恶性高血压    急性闭角型青光眼    视神经炎    大脑静脉非脓性血栓形成    脑震荡后综合征    大脑动脉夹层形成，未破裂    颅内占位性病变    一氧化碳中毒    垂体卒中    嗜铬细胞瘤    带状疱疹后遗症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"61","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


55行-失眠,推出诊断:焦虑状态,抑郁状态,慢性酒精中毒,不良睡眠习惯,慢性顽固性疼痛,围绝经期综合征,夜尿,非器质性失眠症,梦魇,上呼吸道疾病,不安腿综合征,睡眠呼吸暂停,胃食管反流病,创伤后应激障碍,睡行症,睡惊症［夜惊症］,左心室衰竭,甲状腺功能亢进症,躁狂发作,使用镇静剂或催眠剂引起的戒断状态
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    失眠
        ${assert}    Create List    焦虑状态    抑郁状态    慢性酒精中毒    不良睡眠习惯    慢性顽固性疼痛    围绝经期综合征    夜尿    非器质性失眠症    梦魇    上呼吸道疾病    不安腿综合征    睡眠呼吸暂停    胃食管反流病    创伤后应激障碍    睡行症    睡惊症［夜惊症］    左心室衰竭    甲状腺功能亢进症    躁狂发作    使用镇静剂或催眠剂引起的戒断状态
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




56行-性欲减退,推出诊断:抑郁状态,围绝经期综合征,酒精有害性使用,性功能障碍,雄激素部分缺乏综合征,甲状腺功能减退症,药物相关性性欲减退,下丘脑功能不良,库欣综合征,肾上腺皮质功能减退症,垂体疾患,慢性肾衰竭,睾丸功能障碍,肾上腺肿瘤,睾丸肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    性欲减退
        ${assert}    Create List    抑郁状态    围绝经期综合征    酒精有害性使用    性功能障碍    雄激素部分缺乏综合征    甲状腺功能减退症    药物相关性性欲减退    下丘脑功能不良    库欣综合征    肾上腺皮质功能减退症    垂体疾患    慢性肾衰竭    睾丸功能障碍    肾上腺肿瘤    睾丸肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"61","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


57行-失忆,推出诊断:痴呆,多发性硬化性痴呆,阿尔茨海默病性痴呆,焦虑状态,抑郁症,头部外伤,脑血管病,慢性酒精中毒,脑肿瘤,甲状腺功能减退症,蛛网膜下出血,硫胺素缺乏,短暂性完全性遗忘,维生素B12缺乏症,叶酸缺乏症,神游症,心因性失忆症,人格障碍,难治性癫痫,梅毒,脑炎,一氧化碳中毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    失忆
        ${assert}    Create List    痴呆    多发性硬化性痴呆    阿尔茨海默病性痴呆    焦虑状态    抑郁症    头部外伤    脑血管病    慢性酒精中毒    脑肿瘤    甲状腺功能减退症    蛛网膜下出血    硫胺素缺乏    短暂性完全性遗忘    维生素B12缺乏症    叶酸缺乏症    神游症    心因性失忆症    人格障碍    难治性癫痫    梅毒    脑炎    一氧化碳中毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


58行-眩晕,推出诊断:良性阵发性眩晕,前庭周围性眩晕,梅尼埃病,前庭神经元炎,咽鼓管疾患,中耳炎,迷路炎,药物相关性眩晕,急性酒精中毒,脑血管病,椎-基底动脉供血不足,颅内肿瘤,偏头痛,癫痫,耵聍栓塞,听神经瘤,鼻咽恶性肿瘤,外伤后眩晕,多发性硬化,梅毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    眩晕
        ${assert}    Create List    良性阵发性眩晕    前庭周围性眩晕    梅尼埃病    前庭神经元炎    咽鼓管疾患    中耳炎    迷路炎    药物相关性眩晕    急性酒精中毒    脑血管病    椎-基底动脉供血不足    颅内肿瘤    偏头痛    癫痫    耵聍栓塞    听神经瘤    鼻咽恶性肿瘤    外伤后眩晕    多发性硬化    梅毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



59行-耳聋,推出诊断:突发特发性听觉丧失,混合性耳聋,耵聍栓塞,中耳炎,外耳道炎,咽鼓管炎,鼓膜穿孔,耳鼓膜创伤性破裂,颞骨骨折,听骨链中断,老年性耳聋,梅尼埃病,耳蜗性耳硬化症,噪音性耳聋,听神经炎,听神经瘤,鼻息肉,鼻咽良性肿瘤,鼻咽恶性肿瘤,药物性耳聋,耳蜗血管病变,维生素B12缺乏症,中耳胆脂瘤,外耳胆脂瘤,先天性外耳道闭锁,流行性脑脊髓膜炎,流行性腮腺炎,外耳带状疱疹,风疹,水痘
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳聋
        ${assert}    Create List    突发特发性听觉丧失    混合性耳聋    耵聍栓塞    中耳炎    外耳道炎    咽鼓管炎    鼓膜穿孔    耳鼓膜创伤性破裂    颞骨骨折    听骨链中断    老年性耳聋    梅尼埃病    耳蜗性耳硬化症    噪音性耳聋    听神经炎    听神经瘤    鼻息肉    鼻咽良性肿瘤    鼻咽恶性肿瘤    药物性耳聋    耳蜗血管病变    维生素B12缺乏症    中耳胆脂瘤    外耳胆脂瘤    先天性外耳道闭锁    流行性脑脊髓膜炎    流行性腮腺炎    外耳带状疱疹    风疹    水痘
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



60行-耳痛,推出诊断:中耳炎,外耳道炎,外耳疖,外耳痈,耳内异物,扁桃体周脓肿,扁桃体炎,急性咽喉炎,颞下颌关节功能障碍,牙周脓肿,牙冠周脓肿,牙龈脓肿,三叉神经痛,鼻窦炎,外耳湿疹,脂溢性皮炎,软骨炎,乳突炎,颈椎病,中耳胆脂瘤,外耳胆脂瘤,鼻窦继发恶性肿瘤,喉恶性肿瘤,咬合异常,颞颌关节炎,气压伤,丹毒,冻伤,灼性神经痛,外耳软骨膜炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳痛
        ${assert}    Create List    中耳炎    外耳道炎    外耳疖    外耳痈    耳内异物    扁桃体周脓肿    扁桃体炎    急性咽喉炎    颞下颌关节功能障碍    牙周脓肿    牙冠周脓肿    牙龈脓肿    三叉神经痛    鼻窦炎    外耳湿疹    脂溢性皮炎    软骨炎    乳突炎    颈椎病    中耳胆脂瘤    外耳胆脂瘤    鼻窦继发恶性肿瘤    喉恶性肿瘤    咬合异常    颞颌关节炎    气压伤    丹毒    冻伤    灼性神经痛    外耳软骨膜炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



61行-耳道溢液,推出诊断:外耳疖,急性化脓性中耳炎,外耳道炎,慢性化脓性中耳炎,外耳湿疹,脂溢性皮炎,银屑病,中耳胆脂瘤,外耳胆脂瘤,开放性外耳道损伤,大疱性鼓膜炎,耳内异物,耵聍栓塞,乳突炎,外耳脓肿,外耳道皮肤恶性肿瘤,外耳阻塞性角化病,外耳带状疱疹,脑脊液耳漏
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳道溢液
        ${assert}    Create List    外耳疖    急性化脓性中耳炎    外耳道炎    慢性化脓性中耳炎    外耳湿疹    脂溢性皮炎    银屑病    中耳胆脂瘤    外耳胆脂瘤    开放性外耳道损伤    大疱性鼓膜炎    耳内异物    耵聍栓塞    乳突炎    外耳脓肿    外耳道皮肤恶性肿瘤    外耳阻塞性角化病    外耳带状疱疹    脑脊液耳漏
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



62行-耳鸣,推出诊断:耵聍栓塞,老年性耳聋,化脓性中耳炎,分泌性中耳炎,中耳和乳突疾患,粘连性中耳炎,耳硬化,梅尼埃病,突发特发性听觉丧失,头部外伤,药物相关性耳鸣,噪声性耳鸣,高血压,动脉粥样硬化,听神经瘤,软腭阵挛,重度贫血,外耳湿疹,听神经炎,颞下颌关节功能障碍,头面部动静脉瘘,肾衰竭,颈静脉球肿瘤,颅骨佩吉特病,结节病,颅内肿瘤,脑血管病,多发性硬化,颅内感染,糖尿病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳鸣
        ${assert}    Create List    耵聍栓塞    老年性耳聋    化脓性中耳炎    分泌性中耳炎    中耳和乳突疾患    粘连性中耳炎    耳硬化    梅尼埃病    突发特发性听觉丧失    头部外伤    药物相关性耳鸣    噪声性耳鸣    高血压    动脉粥样硬化    听神经瘤    软腭阵挛    重度贫血    外耳湿疹    听神经炎    颞下颌关节功能障碍    头面部动静脉瘘    肾衰竭    颈静脉球肿瘤    颅骨佩吉特病    结节病    颅内肿瘤    脑血管病    多发性硬化    颅内感染    糖尿病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




63行-面部疼痛,推出诊断:鼻窦炎,三叉神经痛,牙周脓肿,牙冠周脓肿,牙龈脓肿,颞下颌关节功能障碍,带状疱疹,偏头痛,巨细胞动脉炎,丛集性头痛,阻塞性腮腺炎,腮腺脓肿,流行性腮腺炎,颈椎病,上颌骨囊肿,下颌骨囊肿,颌面间隙感染,非典型性面部痛,鼻咽恶性肿瘤,颅后窝脑膜瘤,青光眼,神经梅毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    面部疼痛
        ${assert}    Create List    鼻窦炎    三叉神经痛    牙周脓肿    牙冠周脓肿    牙龈脓肿    颞下颌关节功能障碍    带状疱疹    偏头痛    巨细胞动脉炎    丛集性头痛    阻塞性腮腺炎    腮腺脓肿    流行性腮腺炎    颈椎病    上颌骨囊肿    下颌骨囊肿    颌面间隙感染    非典型性面部痛    鼻咽恶性肿瘤    颅后窝脑膜瘤    青光眼    神经梅毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



64行-皮疹,推出诊断:湿疹,丘疹性荨麻疹,手足口病,川崎病,药物性皮炎,传染性单核细胞增多症,巨细胞病毒病,风疹,水痘,猩红热,过敏性紫癜,血小板减少性紫癜,白血病,再生障碍性贫血,麻疹,白癜风,幼年型类风湿性关节炎,血管神经性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮疹
        ${assert}    Create List    湿疹    丘疹性荨麻疹    手足口病    川崎病    药物性皮炎    传染性单核细胞增多症    巨细胞病毒病    风疹    水痘    猩红热    过敏性紫癜    血小板减少性紫癜    白血病    再生障碍性贫血    麻疹    白癜风    幼年型类风湿性关节炎    血管神经性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


65行-面部皮疹,推出诊断:痤疮,硬红斑,脂溢性湿疹,脓疱疮,口周皮炎,黄褐斑,药物光毒性反应,带状疱疹,变应性湿疹,酒渣鼻,白色糠疹,特应性皮炎,丹毒,瘀斑,银屑病,白癜风,玫瑰糠疹,多形性红斑,系统性红斑狼疮,二尖瓣狭窄,结节性硬化症,寻常性狼疮,肉瘤病,皮肌炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    面部皮疹
        ${assert}    Create List    痤疮    硬红斑    脂溢性湿疹    脓疱疮    口周皮炎    黄褐斑    药物光毒性反应    带状疱疹    变应性湿疹    酒渣鼻    白色糠疹    特应性皮炎    丹毒    瘀斑    银屑病    白癜风    玫瑰糠疹    多形性红斑    系统性红斑狼疮    二尖瓣狭窄    结节性硬化症    寻常性狼疮    肉瘤病    皮肌炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


66行-面部肿胀,推出诊断:流行性腮腺炎,血管神经性水肿,牙周脓肿,颌面部外伤,腮腺导管结石,颌下腺导管结石,急性腮腺炎,颌面间隙感染,下颌角肥大伴咬肌肥大,牙龈囊肿,黏液性水肿,带状疱疹,腮腺肿瘤,上颌骨恶性肿瘤,下颌骨恶性肿瘤,库欣病,鼻咽恶性肿瘤,伯基特淋巴瘤流行性腮腺炎,血管神经性水肿,牙周脓肿,颌面部外伤,腮腺导管结石,颌下腺导管结石,急性腮腺炎,颌面间隙感染,下颌角肥大伴咬肌肥大,牙龈囊肿,黏液性水肿,带状疱疹,腮腺肿瘤,上颌骨恶性肿瘤,下颌骨恶性肿瘤,库欣病,鼻咽恶性肿瘤,伯基特淋巴瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    面部肿胀
        ${assert}    Create List    流行性腮腺炎    血管神经性水肿    牙周脓肿    颌面部外伤    腮腺导管结石    颌下腺导管结石    急性腮腺炎    颌面间隙感染    下颌角肥大伴咬肌肥大    牙龈囊肿    黏液性水肿    带状疱疹    腮腺肿瘤    上颌骨恶性肿瘤    下颌骨恶性肿瘤    库欣病    鼻咽恶性肿瘤    伯基特淋巴瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



67行-面部溃疡,推出诊断:脓疱疮,单纯疱疹,带状疱疹,恶性雀斑痣,面部恶性黑色素瘤,药物相关性面部溃疡,痤疮,接触性皮炎,皮肤结核,口腔瘘管,天疱疮,神经梅毒,皮肤梅毒,坏死性溃疡性口炎,基底细胞癌,角化棘皮瘤,鳞状细胞癌,皮肤利什曼病,颈面部放线菌病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    面部溃疡
        ${assert}    Create List    脓疱疮    单纯疱疹    带状疱疹    恶性雀斑痣    面部恶性黑色素瘤    药物相关性面部溃疡    痤疮    接触性皮炎    皮肤结核    口腔瘘管    天疱疮    神经梅毒    皮肤梅毒    坏死性溃疡性口炎    基底细胞癌    角化棘皮瘤    鳞状细胞癌    皮肤利什曼病    颈面部放线菌病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



68行-面部水泡,推出诊断:脓疱疮,单纯疱疹,带状疱疹,恶性雀斑痣,面部恶性黑色素瘤,药物相关性面部溃疡,痤疮,接触性皮炎,皮肤结核,口腔瘘管,天疱疮,神经梅毒,皮肤梅毒,坏死性溃疡性口炎,基底细胞癌,角化棘皮瘤,鳞状细胞癌,皮肤利什曼病,颈面部放线菌病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    面部水泡
        ${assert}    Create List    脓疱疮    单纯疱疹    带状疱疹    恶性雀斑痣    面部恶性黑色素瘤    药物相关性面部溃疡    痤疮    接触性皮炎    皮肤结核    口腔瘘管    天疱疮    神经梅毒    皮肤梅毒    坏死性溃疡性口炎    基底细胞癌    角化棘皮瘤    鳞状细胞癌    皮肤利什曼病    颈面部放线菌病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



69行-鼻塞,推出诊断:变应性鼻炎,慢性鼻窦炎,鼻息肉,血管运动性鼻炎,腺样体肥大,鼻中隔偏曲,鼻腔良性肿瘤,鼻损伤,鼻腔异物,药物相关性鼻塞,后天性鼻腔闭锁,鼻腔纤维血管瘤,鼻腔恶性肿瘤,变应性肉芽肿性血管炎,结节病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    鼻塞
        ${assert}    Create List    变应性鼻炎    慢性鼻窦炎    鼻息肉    血管运动性鼻炎    腺样体肥大    鼻中隔偏曲    鼻腔良性肿瘤    鼻损伤    鼻腔异物    药物相关性鼻塞    后天性鼻腔闭锁    鼻腔纤维血管瘤    鼻腔恶性肿瘤    变应性肉芽肿性血管炎    结节病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



70行-流涕,推出诊断:急性上呼吸道感染,变应性鼻炎,血管运动性鼻炎,鼻窦炎,鼻炎,鼻息肉,药物相关性鼻炎,可卡因有害性使用,丛集性头痛,鼻腔异物,药物相关性流涕,恶性肿瘤,脑脊液鼻漏,变应性肉芽肿性血管炎,结节病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    流涕
        ${assert}    Create List    急性上呼吸道感染    变应性鼻炎    血管运动性鼻炎    鼻窦炎    鼻炎    鼻息肉    药物相关性鼻炎    可卡因有害性使用    丛集性头痛    鼻腔异物    药物相关性流涕    恶性肿瘤    脑脊液鼻漏    变应性肉芽肿性血管炎    结节病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



71行-鼻出血,推出诊断:鼻溃疡,感染,药物相关性鼻出血,变应性鼻炎,高血压,鼻中隔穿孔,鼻中隔息肉,肝病,鼻中隔偏曲,鼻骨骨折,血小板减少,凝血障碍,维生素K缺乏病,抗坏血酸缺乏,遗传性出血性毛细血管扩张,鼻腔肿瘤,白血病,鼻腔异物,鼻开放性伤口
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    鼻出血
        ${assert}    Create List    鼻溃疡    感染    药物相关性鼻出血    变应性鼻炎    高血压    鼻中隔穿孔    鼻中隔息肉    肝病    鼻中隔偏曲    鼻骨骨折    血小板减少    凝血障碍    维生素K缺乏病    抗坏血酸缺乏    遗传性出血性毛细血管扩张    鼻腔肿瘤    白血病    鼻腔异物    鼻开放性伤口
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


72行-口臭,推出诊断:鼻溃疡,感染,药物相关性鼻出血,变应性鼻炎,高血压,鼻中隔穿孔,鼻中隔息肉,肝病,鼻中隔偏曲,鼻骨骨折,血小板减少,凝血障碍,维生素K缺乏病,抗坏血酸缺乏,遗传性出血性毛细血管扩张,鼻腔肿瘤,白血病,鼻腔异物,鼻开放性伤口
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    口臭
        ${assert}    Create List    牙龈炎    牙周炎    酒精滥用    牙槽脓肿    药物相关性口臭    鼻窦炎    胃食管反流病    急性胃肠炎    支气管扩张    饥饿性酮症    肝衰竭    癔症    精神病    牙龈化脓性肉芽肿    鼻窦脓肿    干燥综合征    扁桃体炎    扁桃体周脓肿    鼻后滴漏综合征    鼻腔异物    肾终末期疾病    支气管炎    肺脓肿    先天性咽憩室    胃结肠瘘    口咽癌    口腔癌
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


73行-牙龈出血,推出诊断:牙龈炎,牙周病,坏死性溃疡性口炎,义齿性口炎,药物相关性牙龈出血或牙龈痛,口腔阿弗他溃疡,疱疹病毒性龈口炎,自身免疫病,口腔肿瘤,血液和造血器官的疾病,原发性小肠吸收不良综合征,抗坏血酸缺乏,铅中毒,汞中毒,无机物的毒性效应,砷化物中毒,遗传性出血性毛细血管扩张,淋巴管瘤,海绵状血管瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    牙龈出血
        ${assert}    Create List    牙龈炎    牙周病    坏死性溃疡性口炎    义齿性口炎    药物相关性牙龈出血或牙龈痛    口腔阿弗他溃疡    疱疹病毒性龈口炎    自身免疫病    口腔肿瘤    血液和造血器官的疾病    原发性小肠吸收不良综合征    抗坏血酸缺乏    铅中毒    汞中毒    无机物的毒性效应    砷化物中毒    遗传性出血性毛细血管扩张    淋巴管瘤    海绵状血管瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


74行-牙龈痛,推出诊断:牙龈炎,牙周病,坏死性溃疡性口炎,义齿性口炎,药物相关性牙龈出血或牙龈痛,口腔阿弗他溃疡,疱疹病毒性龈口炎,自身免疫病,口腔肿瘤,血液和造血器官的疾病,原发性小肠吸收不良综合征,抗坏血酸缺乏,铅中毒,汞中毒,无机物的毒性效应,砷化物中毒,遗传性出血性毛细血管扩张,淋巴管瘤,海绵状血管瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    牙龈痛
        ${assert}    Create List    牙龈炎    牙周病    坏死性溃疡性口炎    义齿性口炎    药物相关性牙龈出血或牙龈痛    口腔阿弗他溃疡    疱疹病毒性龈口炎    自身免疫病    口腔肿瘤    血液和造血器官的疾病    原发性小肠吸收不良综合征    抗坏血酸缺乏    铅中毒    汞中毒    无机物的毒性效应    砷化物中毒    遗传性出血性毛细血管扩张    淋巴管瘤    海绵状血管瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



75行-口腔肿物,推出诊断:根尖脓肿,口腔阿弗他溃疡,福代斯斑点,口腔念珠菌感染,舌下腺囊肿,扁平苔藓,颊咬伤,舌下囊肿,上颌骨增生,下颌骨增生,上颌骨骨质增生,下颌骨骨质增生,口腔白斑,口腔癌前病变,扁桃体结石,口腔溃疡,口腔癌,口咽癌,口腔黏膜刺激性增生,金属的毒性效应,走马疳（坏疽性口炎、口颊坏疽）,口腔皮样囊肿,舌下腺良性肿瘤,舌下腺恶性肿瘤,多形性红斑,黑毛舌,地图样舌,药物相关性口腔肿物和粘膜病变,艾迪生病,黑斑息肉
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    口腔肿物
        ${assert}    Create List    根尖脓肿    口腔阿弗他溃疡    福代斯斑点    口腔念珠菌感染    舌下腺囊肿    扁平苔藓    颊咬伤    舌下囊肿    上颌骨增生    下颌骨增生    上颌骨骨质增生    下颌骨骨质增生    口腔白斑    口腔癌前病变    扁桃体结石    口腔溃疡    口腔癌    口咽癌    口腔黏膜刺激性增生    金属的毒性效应    走马疳（坏疽性口炎、口颊坏疽）    口腔皮样囊肿    舌下腺良性肿瘤    舌下腺恶性肿瘤    多形性红斑    黑毛舌    地图样舌    药物相关性口腔肿物和粘膜病变    艾迪生病    黑斑息肉
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



76行-口腔粘膜病变,推出诊断:根尖脓肿,口腔阿弗他溃疡,福代斯斑点,口腔念珠菌感染,舌下腺囊肿,扁平苔藓,颊咬伤,舌下囊肿,上颌骨增生,下颌骨增生,上颌骨骨质增生,下颌骨骨质增生,口腔白斑,口腔癌前病变,扁桃体结石,口腔溃疡,口腔癌,口咽癌,口腔黏膜刺激性增生,金属的毒性效应,走马疳（坏疽性口炎、口颊坏疽）,口腔皮样囊肿,舌下腺良性肿瘤,舌下腺恶性肿瘤,多形性红斑,黑毛舌,地图样舌,药物相关性口腔肿物和粘膜病变,艾迪生病,黑斑息肉
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    口腔粘膜病变
        ${assert}    Create List    根尖脓肿    口腔阿弗他溃疡    福代斯斑点    口腔念珠菌感染    舌下腺囊肿    扁平苔藓    颊咬伤    舌下囊肿    上颌骨增生    下颌骨增生    上颌骨骨质增生    下颌骨骨质增生    口腔白斑    口腔癌前病变    扁桃体结石    口腔溃疡    口腔癌    口咽癌    口腔黏膜刺激性增生    金属的毒性效应    走马疳（坏疽性口炎、口颊坏疽）    口腔皮样囊肿    舌下腺良性肿瘤    舌下腺恶性肿瘤    多形性红斑    黑毛舌    地图样舌    药物相关性口腔肿物和粘膜病变    艾迪生病    黑斑息肉
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



77行-口腔溃疡,推出诊断:外伤,口腔阿弗他溃疡,溃疡性龈炎,新生儿鹅口疮,缺铁性贫血,维生素B12缺乏性贫血,叶酸盐缺乏性贫血,柯萨奇病毒感染,克罗恩病,溃疡性结肠炎,带状疱疹,单纯疱疹,传染性单核细胞增多症,口腔扁平苔藓,鳞状细胞癌,唾液腺癌,自身免疫病,白血病,急性粒细胞缺乏症,结核病,艾滋病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    口腔溃疡
        ${assert}    Create List    外伤    口腔阿弗他溃疡    溃疡性龈炎    新生儿鹅口疮    缺铁性贫血    维生素B12缺乏性贫血    叶酸盐缺乏性贫血    柯萨奇病毒感染    克罗恩病    溃疡性结肠炎    带状疱疹    单纯疱疹    传染性单核细胞增多症    口腔扁平苔藓    鳞状细胞癌    唾液腺癌    自身免疫病    白血病    急性粒细胞缺乏症    结核病    艾滋病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


78行-舌痛,推出诊断:外伤,营养性贫血,维生素B12缺乏性贫血,口腔阿弗他溃疡,病毒性感染,地图样舌,口腔念珠菌感染,口和咽烧伤,裂沟舌,舌咽神经痛,药物相关性舌痛,舌扁平苔藓,舌恶性肿瘤,白塞病,寻常型天疱疮
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    舌痛
        ${assert}    Create List    外伤    营养性贫血    维生素B12缺乏性贫血    口腔阿弗他溃疡    病毒性感染    地图样舌    口腔念珠菌感染    口和咽烧伤    裂沟舌    舌咽神经痛    药物相关性舌痛    舌扁平苔藓    舌恶性肿瘤    白塞病    寻常型天疱疮
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



79行-异常步态,推出诊断:外伤,关节炎,脑血管意外,帕金森病,梅尼埃病,前庭神经炎,间歇性跛行,腓总神经麻痹,多发性硬化,腰骶神经根炎,马尾损伤,重症肌无力,脊髓痨,强直性肌营养不良,运动神经元病,小脑共济失调,癔症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    异常步态
        ${assert}    Create List    外伤    关节炎    脑血管意外    帕金森病    梅尼埃病    前庭神经炎    间歇性跛行    腓总神经麻痹    多发性硬化    腰骶神经根炎    马尾损伤    重症肌无力    脊髓痨    强直性肌营养不良    运动神经元病    小脑共济失调    癔症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



80行-背痛,推出诊断:关节炎,颈椎病,骨质疏松,肺部感染,胃溃疡,胰腺炎,胆囊炎,肺结核,心肌梗死,肾炎,肾结石,泌尿道感染,输尿管结石,胸椎滑脱,胸椎骨折,胸椎脓肿,胸椎椎管狭窄,主动脉夹层,胸膜粘连,肺原位癌,强直性脊柱炎,转移性肿瘤,多发性骨髓瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    背痛
        ${assert}    Create List    关节炎    颈椎病    骨质疏松    肺部感染    胃溃疡    胰腺炎    胆囊炎    肺结核    心肌梗死    肾炎    肾结石    泌尿道感染    输尿管结石    胸椎滑脱    胸椎骨折    胸椎脓肿    胸椎椎管狭窄    主动脉夹层    胸膜粘连    肺原位癌    强直性脊柱炎    转移性肿瘤    多发性骨髓瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


81行-背部痛,推出诊断:关节炎,颈椎病,骨质疏松,肺部感染,胃溃疡,胰腺炎,胆囊炎,肺结核,心肌梗死,肾炎,肾结石,泌尿道感染,输尿管结石,胸椎滑脱,胸椎骨折,胸椎脓肿,胸椎椎管狭窄,主动脉夹层,胸膜粘连,肺原位癌,强直性脊柱炎,转移性肿瘤,多发性骨髓瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    背部痛
        ${assert}    Create List    关节炎    颈椎病    骨质疏松    肺部感染    胃溃疡    胰腺炎    胆囊炎    肺结核    心肌梗死    肾炎    肾结石    泌尿道感染    输尿管结石    胸椎滑脱    胸椎骨折    胸椎脓肿    胸椎椎管狭窄    主动脉夹层    胸膜粘连    肺原位癌    强直性脊柱炎    转移性肿瘤    多发性骨髓瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


82行-腰背痛,推出诊断:肌肉损伤,神经根型腰椎病,脊椎病,十二指肠溃疡,急性胰腺炎,肾盂肾炎,盆腔炎,肾结石,骨髓炎,强直性脊柱炎,脊柱肿瘤,抑郁状态,焦虑状态,椎管狭窄,主动脉夹层,胰恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腰背痛
        ${assert}    Create List    肌肉损伤    神经根型腰椎病    脊椎病    十二指肠溃疡    急性胰腺炎    肾盂肾炎    盆腔炎    肾结石    骨髓炎    强直性脊柱炎    脊柱肿瘤    抑郁状态    焦虑状态    椎管狭窄    主动脉夹层    胰恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


83行-发作性意识丧失,推出诊断:癫痫,短暂性脑缺血发作,室上性心动过速,低血糖,体位性低血压,血管迷走神经性晕厥,心动过缓,阿-斯综合征,主动脉狭窄,肥厚型梗阻性心肌病,睡眠时呼吸暂停,发作性睡病和猝倒症,肺动脉狭窄,排尿性晕厥,咳嗽性晕厥,运动后晕厥,颈动脉窦性晕厥,通气过度,锁骨下动脉盗血综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发作性意识丧失
        ${assert}    Create List    癫痫    短暂性脑缺血发作    室上性心动过速    低血糖    体位性低血压    血管迷走神经性晕厥    心动过缓    阿-斯综合征    主动脉狭窄    肥厚型梗阻性心肌病    睡眠时呼吸暂停    发作性睡病和猝倒症    肺动脉狭窄    排尿性晕厥    咳嗽性晕厥    运动后晕厥    颈动脉窦性晕厥    通气过度    锁骨下动脉盗血综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



84行-多汗,推出诊断:绝经期和女性更年期状态,焦虑状态,炎症,低血糖,甲状腺功能亢进症,药物相关性多汗,戒断综合征,晕厥,疼痛,手汗症,结核病,艾滋病,心内膜炎,布鲁氏菌病,恶性肿瘤,中枢神经系统疾患,厚皮性骨膜病,肢端肥大症和垂体性巨人症,类癌瘤综合征,嗜铬细胞瘤,结缔组织病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    多汗
        ${assert}    Create List    绝经期和女性更年期状态    焦虑状态    炎症    低血糖    甲状腺功能亢进症    药物相关性多汗    戒断综合征    晕厥    疼痛    手汗症    结核病    艾滋病    心内膜炎    布鲁氏菌病    恶性肿瘤    中枢神经系统疾患    厚皮性骨膜病    肢端肥大症和垂体性巨人症    类癌瘤综合征    嗜铬细胞瘤    结缔组织病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


85行-发热,推出诊断:病毒性上呼吸道感染,胃肠炎,扁桃体炎,肺部感染,川崎病,急性腮腺炎,手足口病,药物性发热,急性细支气管炎,急性喉气管炎,中耳炎,急性会厌炎,泌尿道感染,阑尾炎,风疹,水痘,免疫接种后反应,脑膜炎,脑炎,麻疹,蜂窝织炎,结核病,急性白血病,传染性单核细胞增多症,艾滋病,感染性关节炎,骨髓炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热
        ${assert}    Create List
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"17","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


86行-发热,推出诊断:病毒性上呼吸道感染,胃肠炎,扁桃体炎,肺部感染,急性喉气管炎,中耳炎,急性会厌炎,泌尿道感染,阑尾炎,肝炎,风湿热,药物性发热,结核病,蜂窝织炎,输血反应,传染性单核细胞增多症,脑膜炎,脑炎,系统性红斑狼疮,急性白血病,恶性淋巴瘤,肺腺癌,肝细胞癌,肾细胞癌,脾梗死,艾滋病,感染性关节炎,骨髓炎,颅内出血
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热
        ${assert}    Create List    病毒性上呼吸道感染    胃肠炎    扁桃体炎    肺部感染    急性喉气管炎    中耳炎    急性会厌炎    泌尿道感染    阑尾炎    肝炎    风湿热    药物性发热    结核病    蜂窝织炎    输血反应    传染性单核细胞增多症    脑膜炎    脑炎    系统性红斑狼疮    急性白血病    恶性淋巴瘤    肺腺癌    肝细胞癌    肾细胞癌    脾梗死    艾滋病    感染性关节炎    骨髓炎    颅内出血
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



87行-长期发热,推出诊断:结核病,慢性鼻窦炎,慢性化脓性中耳炎,风湿热,慢性肾盂肾炎,慢性肾小球肾炎,慢性盆腔炎,慢性胆管炎,慢性细菌性前列腺炎,脓肿,克罗恩病,溃疡性结肠炎,药物性发热,类风湿性关节炎,白血病,甲状腺功能亢进症,感染性心内膜炎,系统性红斑狼疮,结节性多动脉炎,多发性肌炎,恶性肿瘤,艾滋病,传染性单核细胞增多症,疟疾,莱姆病,放线菌病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    长期发热
        ${assert}    Create List    结核病    慢性鼻窦炎    慢性化脓性中耳炎    风湿热    慢性肾盂肾炎    慢性肾小球肾炎    慢性盆腔炎    慢性胆管炎    慢性细菌性前列腺炎    脓肿    克罗恩病    溃疡性结肠炎    药物性发热    类风湿性关节炎    白血病    甲状腺功能亢进症    感染性心内膜炎    系统性红斑狼疮    结节性多动脉炎    多发性肌炎    恶性肿瘤    艾滋病    传染性单核细胞增多症    疟疾    莱姆病    放线菌病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



88行-乏力,推出诊断:贫血,肺部感染,2型糖尿病,冠状动脉粥样硬化性心脏病,慢性胃炎,脑动脉供血不足,短暂性脑缺血发作,慢性肾脏病,心力衰竭,脑梗死,慢性肾小球肾炎,上消化道出血,肝硬化,眩晕综合征,低钾血症,恶性肿瘤,全血细胞减少
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乏力
        ${assert}    Create List    贫血    肺部感染    2型糖尿病    冠状动脉粥样硬化性心脏病    慢性胃炎    脑动脉供血不足    短暂性脑缺血发作    慢性肾脏病    心力衰竭    脑梗死    慢性肾小球肾炎    上消化道出血    肝硬化    眩晕综合征    低钾血症    恶性肿瘤    全血细胞减少
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}
        # Should Contain    ${aj}    阴囊超声

89行-胸痛,推出诊断:急性冠脉综合征,心绞痛,急性心肌梗死,急性心包炎,肺炎,胸膜炎,主动脉夹层,肺栓塞,反流性食管炎,胰腺炎,消化性溃疡,气胸,支气管炎,肋间神经炎,肋骨软骨炎,乳腺炎,肺腺癌,心肌病,胸壁蜂窝织炎,胸膜肿瘤,食管癌,纵隔炎,纵隔气肿,纵膈恶性淋巴瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    胸痛
        ${assert}    Create List    急性冠脉综合征    心绞痛    急性心肌梗死    急性心包炎    肺炎    胸膜炎    主动脉夹层    肺栓塞    反流性食管炎    胰腺炎    消化性溃疡    气胸    支气管炎    肋间神经炎    肋骨软骨炎    乳腺炎    肺腺癌    心肌病    胸壁蜂窝织炎    胸膜肿瘤    食管癌    纵隔炎    纵隔气肿    纵膈恶性淋巴瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


90行-晕厥,推出诊断:心律失常,长QT综合征,低血糖性晕厥,急性心肌梗死,脑血管病,短暂性脑缺血发作,主动脉瓣狭窄,黏液瘤,肺动脉瓣狭窄,原发性肺动脉高压,肺栓塞,法洛四联症,血管迷走神经性晕厥,颈动脉窦性晕厥,排尿性晕厥,咳嗽性晕厥,吞咽性晕厥,热性晕厥,多发性大动脉炎,锁骨下动脉盗血综合征,体位性低血压,重度贫血,癔症性晕厥,焦虑性神经症,通气过度
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    晕厥
        ${assert}    Create List    心律失常    长QT综合征    低血糖性晕厥    急性心肌梗死    脑血管病    短暂性脑缺血发作    主动脉瓣狭窄    黏液瘤    肺动脉瓣狭窄    原发性肺动脉高压    肺栓塞    法洛四联症    血管迷走神经性晕厥    颈动脉窦性晕厥    排尿性晕厥    咳嗽性晕厥    吞咽性晕厥    热性晕厥    多发性大动脉炎    锁骨下动脉盗血综合征    体位性低血压    重度贫血    癔症性晕厥    焦虑性神经症    通气过度
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


91行-腹水,推出诊断:肝硬化失代偿期,慢性心力衰竭,肝细胞癌,肾病综合征,恶性腹水,结核性腹膜炎,病毒性肝炎,低蛋白血症,腹膜恶性肿瘤,腹膜转移癌,细菌性腹膜炎,心包炎,限制型心肌病,腹膜透析,巴德-基亚里综合征,门静脉血栓形成,下腔静脉阻塞,肝小静脉闭塞病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹水
        ${assert}    Create List    肝硬化失代偿期    慢性心力衰竭    肝细胞癌    肾病综合征    恶性腹水    结核性腹膜炎    病毒性肝炎    低蛋白血症    腹膜恶性肿瘤    腹膜转移癌    细菌性腹膜炎    心包炎    限制型心肌病    腹膜透析    巴德-基亚里综合征    门静脉血栓形成    下腔静脉阻塞    肝小静脉闭塞病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



92行-便血,推出诊断:上消化道出血,克罗恩病,痔,肛裂,肛瘘,溃疡性结肠炎,急性出血坏死性肠炎,结肠息肉,空肠憩室炎,急性细菌性痢疾,空肠溃疡,麦克尔憩室,缺血性结肠炎,小肠肿瘤,肠套叠,结肠憩室炎,结肠恶性肿瘤,直肠损伤,直肠息肉,白血病,血小板减少性紫癜,血友病,遗传性出血性毛细血管扩张,流行性出血热,钩虫病,阿米巴痢疾,血吸虫病,伤寒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    便血
        ${assert}    Create List    上消化道出血    克罗恩病    痔    肛裂    肛瘘    溃疡性结肠炎    急性出血坏死性肠炎    结肠息肉    空肠憩室炎    急性细菌性痢疾    空肠溃疡    麦克尔憩室    缺血性结肠炎    小肠肿瘤    肠套叠    结肠憩室炎    结肠恶性肿瘤    直肠损伤    直肠息肉    白血病    血小板减少性紫癜    血友病    遗传性出血性毛细血管扩张    流行性出血热    钩虫病    阿米巴痢疾    血吸虫病    伤寒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



93行-蛋白尿,推出诊断:急性肾小球肾炎,慢性肾小球肾炎,急进性肾小球肾炎,肾病综合征,IgA肾病,间质性肾炎,肾盂肾炎,直立性蛋白尿,高血压性肾病,糖尿病肾病,急性高尿酸血症肾病,自身免疫性甲状腺炎,充血性心力衰竭,感染性心内膜炎,肾小管病变,系统性红斑狼疮,干燥综合征,系统性硬化症,多发性骨髓瘤,挤压综合征,流行性出血热,钩端螺旋体病,乙型肝炎相关性肾炎,横纹肌溶解症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    蛋白尿
        ${assert}    Create List    急性肾小球肾炎    慢性肾小球肾炎    急进性肾小球肾炎    肾病综合征    IgA肾病    间质性肾炎    肾盂肾炎    直立性蛋白尿    高血压性肾病    糖尿病肾病    急性高尿酸血症肾病    自身免疫性甲状腺炎    充血性心力衰竭    感染性心内膜炎    肾小管病变    系统性红斑狼疮    干燥综合征    系统性硬化症    多发性骨髓瘤    挤压综合征    流行性出血热    钩端螺旋体病    乙型肝炎相关性肾炎    横纹肌溶解症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



94行-一侧肢体无力,推出诊断:脑梗死,脑出血,颅内占位性病变,颅内动脉瘤,蛛网膜下出血,颅脑外伤,颅内感染,中枢神经系统脱髓鞘病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    一侧肢体无力
        ${assert}    Create List    脑梗死    脑出血    颅内占位性病变    颅内动脉瘤    蛛网膜下出血    颅脑外伤    颅内感染    中枢神经系统脱髓鞘病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



95行-瘫痪,推出诊断:低钾型周期性麻痹,周期性瘫痪,大脑性瘫痪,肌萎缩侧索硬化症,重症肌无力,肌无力综合征,多发性肌炎,原发性侧索硬化症,进行性脊髓性肌萎缩,进行性肌营养不良,线粒体肌病,代谢性肌病,特发性炎症性肌病,强直性肌营养不良,先天性肌强直,脂质沉积性肌病,甲状腺功能减退性肌病,癔病性瘫痪
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    瘫痪
        ${assert}    Create List    低钾型周期性麻痹    周期性瘫痪    大脑性瘫痪    肌萎缩侧索硬化症    重症肌无力    肌无力综合征    多发性肌炎    原发性侧索硬化症    进行性脊髓性肌萎缩    进行性肌营养不良    线粒体肌病    代谢性肌病    特发性炎症性肌病    强直性肌营养不良    先天性肌强直    脂质沉积性肌病    甲状腺功能减退性肌病    癔病性瘫痪
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


96行-腰腿痛,推出诊断:腰椎间盘突出,腰肌劳损,腰椎退行性病变,腰椎椎管狭窄,第三腰椎横突综合征,梨状肌综合征,腰椎结核,腰椎骨折,腰椎脱位,消化性溃疡,胰腺炎,胰恶性肿瘤,泌尿系结石,肾盂肾炎,肾炎,盆腔炎,盆腔肿瘤,腹膜后肿瘤,内脏下垂,腰椎恶性肿瘤,隐性脊柱裂
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腰腿痛
        ${assert}    Create List    腰椎间盘突出    腰肌劳损    腰椎退行性病变    腰椎椎管狭窄    第三腰椎横突综合征    梨状肌综合征    腰椎结核    腰椎骨折    腰椎脱位    消化性溃疡    胰腺炎    胰恶性肿瘤    泌尿系结石    肾盂肾炎    肾炎    盆腔炎    盆腔肿瘤    腹膜后肿瘤    内脏下垂    腰椎恶性肿瘤    隐性脊柱裂
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



97行-痴呆,推出诊断:路易体痴呆,帕金森病性痴呆,阿尔茨海默病性痴呆,血管性痴呆,额颞痴呆,肝性脑病,尿毒症性脑病,电解质代谢紊乱,贫血,亨廷顿病性痴呆,酒精中毒性痴呆,多发脑梗死性痴呆,肝豆状核变性,进行性多灶性白质脑病,大脑淀粉样血管病,正常压力脑积水,病毒性脑炎,神经梅毒,朊蛋白病,艾滋病,金属的毒性效应，其他的,一氧化碳中毒性脑病,酒精中毒性脑病,维生素B12缺乏症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    痴呆
        ${assert}    Create List    路易体痴呆    帕金森病性痴呆    阿尔茨海默病性痴呆    血管性痴呆    额颞痴呆    肝性脑病    尿毒症性脑病    电解质代谢紊乱    贫血    亨廷顿病性痴呆    酒精中毒性痴呆    多发脑梗死性痴呆    肝豆状核变性    进行性多灶性白质脑病    大脑淀粉样血管病    正常压力脑积水    病毒性脑炎    神经梅毒    朊蛋白病    艾滋病    金属的毒性效应，其他的    一氧化碳中毒性脑病    酒精中毒性脑病    维生素B12缺乏症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


98行-记忆力下降,推出诊断:贫血,阿尔茨海默病,脑血管病,额颞痴呆,大脑动脉粥样硬化,抑郁症,失眠,血管性痴呆,帕金森病,神经衰弱,焦虑状态,慢性鼻窦炎,鼾症,阻塞性睡眠呼吸暂停综合征,颈椎病,甲状腺功能减退症,维生素B12缺乏症,酒精中毒性脑病,脑外伤后综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    记忆力下降
        ${assert}    Create List    贫血    阿尔茨海默病    脑血管病    额颞痴呆    大脑动脉粥样硬化    抑郁症    失眠    血管性痴呆    帕金森病    神经衰弱    焦虑状态    慢性鼻窦炎    鼾症    阻塞性睡眠呼吸暂停综合征    颈椎病    甲状腺功能减退症    维生素B12缺乏症    酒精中毒性脑病    脑外伤后综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



99行-紧张,推出诊断:抑郁状态,甲状腺功能亢进症,器质性脑病,心悸,焦虑［回避］型人格障碍,广泛性焦虑障碍,经前紧张征,惊恐障碍,强迫性神经症,恐怖性焦虑障碍,药物不良反应,酒精滥用,戒断综合征,躯体化障碍,创伤后应激障碍,精神病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    紧张
        ${assert}    Create List    抑郁状态    甲状腺功能亢进症    器质性脑病    心悸    焦虑［回避］型人格障碍    广泛性焦虑障碍    经前紧张征    惊恐障碍    强迫性神经症    恐怖性焦虑障碍    药物不良反应    酒精滥用    戒断综合征    躯体化障碍    创伤后应激障碍    精神病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



100行-焦虑,推出诊断:抑郁状态,甲状腺功能亢进症,器质性脑病,心悸,焦虑［回避］型人格障碍,广泛性焦虑障碍,经前紧张征,惊恐障碍,强迫性神经症,恐怖性焦虑障碍,药物不良反应,酒精滥用,戒断综合征,躯体化障碍,创伤后应激障碍,精神病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    焦虑
        ${assert}    Create List    抑郁状态    甲状腺功能亢进症    器质性脑病    心悸    焦虑［回避］型人格障碍    广泛性焦虑障碍    经前紧张征    惊恐障碍    强迫性神经症    恐怖性焦虑障碍    药物不良反应    酒精滥用    戒断综合征    躯体化障碍    创伤后应激障碍    精神病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



101行-不育,推出诊断:精子异常,与不排卵有关的女性不孕症,输卵管起因的女性不孕症,子宫内膜异位症,宫颈粘液异常,多囊卵巢综合征,闭经,子宫平滑肌瘤,子宫内膜息肉,宫颈起因的女性不孕症,贫血,甲状腺疾患,女性生殖器先天性畸形,性功能障碍,肾上腺皮质肿瘤,染色体异常,子宫内膜结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    不育
        ${assert}    Create List    精子异常    与不排卵有关的女性不孕症    输卵管起因的女性不孕症    子宫内膜异位症    宫颈粘液异常    多囊卵巢综合征    闭经    子宫平滑肌瘤    子宫内膜息肉    宫颈起因的女性不孕症    贫血    甲状腺疾患    女性生殖器先天性畸形    性功能障碍    肾上腺皮质肿瘤    染色体异常    子宫内膜结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



102行-不孕,推出诊断:精子异常,与不排卵有关的女性不孕症,输卵管起因的女性不孕症,子宫内膜异位症,宫颈粘液异常,多囊卵巢综合征,闭经,子宫平滑肌瘤,子宫内膜息肉,宫颈起因的女性不孕症,贫血,甲状腺疾患,女性生殖器先天性畸形,性功能障碍,肾上腺皮质肿瘤,染色体异常,子宫内膜结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    不孕
        ${assert}    Create List    精子异常    与不排卵有关的女性不孕症    输卵管起因的女性不孕症    子宫内膜异位症    宫颈粘液异常    多囊卵巢综合征    闭经    子宫平滑肌瘤    子宫内膜息肉    宫颈起因的女性不孕症    贫血    甲状腺疾患    女性生殖器先天性畸形    性功能障碍    肾上腺皮质肿瘤    染色体异常    子宫内膜结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



103行-黄疸,推出诊断:新生儿生理性黄疸,新生儿病理性黄疸,自身免疫性溶血性贫血,新生儿红细胞增多症,遗传性球形红细胞增多症,先天性胆管闭塞性黄疸,先天性葡萄糖醛酸转移酶缺乏症,新生儿肝炎,甲状腺功能减退症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    黄疸
        ${assert}    Create List    新生儿生理性黄疸    新生儿病理性黄疸    自身免疫性溶血性贫血    新生儿红细胞增多症    遗传性球形红细胞增多症    先天性胆管闭塞性黄疸    先天性葡萄糖醛酸转移酶缺乏症    新生儿肝炎    甲状腺功能减退症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"28","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



104行-黄疸,推出诊断:溶血性贫血,病毒性肝炎,胆管炎,胰腺炎,肝脓肿,梗阻性黄疸,传染性单核细胞增多症,自身免疫性肝炎,肝豆状核变性,布鲁氏菌病,钩端螺旋体病,黄热病,疟疾,先天性高胆红素血症,吉尔伯特综合征,罗托综合征,迪宾-约翰逊综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    黄疸
        ${assert}    Create List    溶血性贫血    病毒性肝炎    胆管炎    胰腺炎    肝脓肿    梗阻性黄疸    传染性单核细胞增多症    自身免疫性肝炎    肝豆状核变性    布鲁氏菌病    钩端螺旋体病    黄热病    疟疾    先天性高胆红素血症    吉尔伯特综合征    罗托综合征    迪宾-约翰逊综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


105行-黄疸,推出诊断:病毒性肝炎,胆管结石,胆管炎,胰腺炎,酒精性肝硬化,酒精性肝炎,肝恶性肿瘤,壶腹周围恶性肿瘤,胰头癌,药物过量,溶血性贫血,阵发性夜间血红蛋白尿,败血症,高胆红素血症,钩端螺旋体病,心功能不全,缩窄性心包炎,胆管癌,妊娠期肝内胆汁淤积症,妊娠合并脂肪肝,吉尔伯特综合征,肝豆状核变性,α1-抗胰蛋白酶缺乏症,半乳糖血症,肝糖原贮积症,血色病,淀粉样变
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    黄疸
        ${assert}    Create List    病毒性肝炎    胆管结石    胆管炎    胰腺炎    酒精性肝硬化    酒精性肝炎    肝恶性肿瘤    壶腹周围恶性肿瘤    胰头癌    药物过量    溶血性贫血    阵发性夜间血红蛋白尿    败血症    高胆红素血症    钩端螺旋体病    心功能不全    缩窄性心包炎    胆管癌    妊娠期肝内胆汁淤积症    妊娠合并脂肪肝    吉尔伯特综合征    肝豆状核变性    α1-抗胰蛋白酶缺乏症    半乳糖血症    肝糖原贮积症    血色病    淀粉样变
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"20","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



106行-跛行,推出诊断:外伤,髋关节滑膜炎,反应性关节炎,老年性关节炎,化脓性关节炎,股骨上端(非创伤性)骨骺滑脱,幼年型股骨骺骨软骨病,特发性脊柱侧弯，其他的,先天性髋脱位,双下肢不等长,骨髓炎,风湿热,系统性红斑狼疮,皮肌炎,佝偻病,少关节性幼年型关节炎,幼年型类风湿性关节炎,假肥大型肌营养不良症,骨恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    跛行
        ${assert}    Create List    外伤    髋关节滑膜炎    反应性关节炎    老年性关节炎    化脓性关节炎    股骨上端(非创伤性)骨骺滑脱    幼年型股骨骺骨软骨病    特发性脊柱侧弯，其他的    先天性髋脱位    双下肢不等长    骨髓炎    风湿热    系统性红斑狼疮    皮肌炎    佝偻病    少关节性幼年型关节炎    幼年型类风湿性关节炎    假肥大型肌营养不良症    骨恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



107行-麻木,推出诊断:焦虑状态,腕管综合征,坐骨神经痛,糖尿病神经病变,颈椎病,多发性硬化,脊髓炎,周围神经病,短暂性脑缺血发作,脑卒中,外伤,偏头痛,脊髓肿瘤,脊髓空洞症,新皮质癫痫,脑肿瘤,癔症,慢性缺血性心脏病,周围血管疾病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    麻木
        ${assert}    Create List    焦虑状态    腕管综合征    坐骨神经痛    糖尿病神经病变    颈椎病    多发性硬化    脊髓炎    周围神经病    短暂性脑缺血发作    脑卒中    外伤    偏头痛    脊髓肿瘤    脊髓空洞症    新皮质癫痫    脑肿瘤    癔症    慢性缺血性心脏病    周围血管疾病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



108行-感觉异常,推出诊断:焦虑状态,腕管综合征,坐骨神经痛,糖尿病神经病变,颈椎病,多发性硬化,脊髓炎,周围神经病,短暂性脑缺血发作,脑卒中,外伤,偏头痛,脊髓肿瘤,脊髓空洞症,新皮质癫痫,脑肿瘤,癔症,慢性缺血性心脏病,周围血管疾病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    感觉异常
        ${assert}    Create List    焦虑状态    腕管综合征    坐骨神经痛    糖尿病神经病变    颈椎病    多发性硬化    脊髓炎    周围神经病    短暂性脑缺血发作    脑卒中    外伤    偏头痛    脊髓肿瘤    脊髓空洞症    新皮质癫痫    脑肿瘤    癔症    慢性缺血性心脏病    周围血管疾病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



109行-淋巴结肿大,推出诊断:急性上呼吸道感染,急性化脓性扁桃体炎,病毒性感染,牙龈炎,结核病,恶性肿瘤,淋巴瘤,白血病,骨髓瘤病,败血症,结节病,传染性单核细胞增多症,系统性红斑狼疮,类风湿性关节炎,性传播疾病,艾滋病,猫抓病,风疹,麻疹,土拉菌病,麻风,丝虫病,非洲锥虫病,药物相关性淋巴结肿大
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    淋巴结肿大
        ${assert}    Create List    急性上呼吸道感染    急性化脓性扁桃体炎    病毒性感染    牙龈炎    结核病    恶性肿瘤    淋巴瘤    白血病    骨髓瘤病    败血症    结节病    传染性单核细胞增多症    系统性红斑狼疮    类风湿性关节炎    性传播疾病    艾滋病    猫抓病    风疹    麻疹    土拉菌病    麻风    丝虫病    非洲锥虫病    药物相关性淋巴结肿大
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


110行-口干,推出诊断:贫血,尿崩症,糖尿病,脱水,药物相关性口渴,焦虑状态,原发性甲状腺功能亢进症,高钙血症,肾盂肾炎,血管球性肾炎,肾积水,干燥综合征,慢性肾脏病,妊娠,强迫性动作,镰状细胞病,头颈部放射治疗后
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    口干
        ${assert}    Create List    贫血    尿崩症    糖尿病    脱水    药物相关性口渴    焦虑状态    原发性甲状腺功能亢进症    高钙血症    肾盂肾炎    血管球性肾炎    肾积水    干燥综合征    慢性肾脏病    妊娠    强迫性动作    镰状细胞病    头颈部放射治疗后
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



111行-口渴,推出诊断:贫血,尿崩症,糖尿病,脱水,药物相关性口渴,焦虑状态,原发性甲状腺功能亢进症,高钙血症,肾盂肾炎,血管球性肾炎,肾积水,干燥综合征,慢性肾脏病,妊娠,强迫性动作,镰状细胞病,头颈部放射治疗后
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    口渴
        ${assert}    Create List    贫血    尿崩症    糖尿病    脱水    药物相关性口渴    焦虑状态    原发性甲状腺功能亢进症    高钙血症    肾盂肾炎    血管球性肾炎    肾积水    干燥综合征    慢性肾脏病    妊娠    强迫性动作    镰状细胞病    头颈部放射治疗后
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



112行-震颤,推出诊断:焦虑状态,甲状腺功能亢进症,特发性震颤,帕金森病,帕金森综合征,戒断综合征,药物不良反应,高碳酸血症,多发性硬化,小脑共济失调,急性肝衰竭,肝豆状核变性,癔症,脑膜脑炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    震颤
        ${assert}    Create List    焦虑状态    甲状腺功能亢进症    特发性震颤    帕金森病    帕金森综合征    戒断综合征    药物不良反应    高碳酸血症    多发性硬化    小脑共济失调    急性肝衰竭    肝豆状核变性    癔症    脑膜脑炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



113行-体重增加,推出诊断:肥胖症,甲状腺功能减退症,高脂血症,糖尿病前期,妊娠,水肿,围绝经期综合征,多囊卵巢综合征,卵巢囊肿,药物相关性体重增加,库欣综合征,下丘脑性肥胖,垂体功能减退症,糖原贮积病,胰岛素瘤,普拉德-威利综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    体重增加
        ${assert}    Create List    肥胖症    甲状腺功能减退症    高脂血症    糖尿病前期    妊娠    水肿    围绝经期综合征    多囊卵巢综合征    卵巢囊肿    药物相关性体重增加    库欣综合征    下丘脑性肥胖    垂体功能减退症    糖原贮积病    胰岛素瘤    普拉德-威利综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


114行-体重下降,推出诊断:糖尿病,营养性消瘦,甲状腺功能亢进症,消化性溃疡,慢性胃炎,炎症性肠病,肠易激综合征,慢性肝炎,贫血,抑郁症,焦虑状态,慢性阻塞性肺病,类风湿性关节炎,慢性心力衰竭,心肌病,慢性胰腺炎,恶性肿瘤,慢性肾功能衰竭,痴呆,药物相关性消瘦,神经性厌食,肝衰竭,败血症,系统性红斑狼疮,艾滋病,垂体功能减退症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    体重下降
        ${assert}    Create List    糖尿病    营养性消瘦    甲状腺功能亢进症    消化性溃疡    慢性胃炎    炎症性肠病    肠易激综合征    慢性肝炎    贫血    抑郁症    焦虑状态    慢性阻塞性肺病    类风湿性关节炎    慢性心力衰竭    心肌病    慢性胰腺炎    恶性肿瘤    慢性肾功能衰竭    痴呆    药物相关性消瘦    神经性厌食    肝衰竭    败血症    系统性红斑狼疮    艾滋病    垂体功能减退症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



115行-皮肤水疱,推出诊断:外伤,身体烧伤,单纯疱疹,带状疱疹,手足口病,水痘,湿疹,天疱疮,类天疱疮,疱疹样皮炎,下肢水肿,大疱性脓疱病,药物相关性水疱,多形红斑,血卟啉病,中毒性表皮坏死松解症,大疱性表皮松解症,变应性血管炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤水疱
        ${assert}    Create List    外伤    身体烧伤    单纯疱疹    带状疱疹    手足口病    水痘    湿疹    天疱疮    类天疱疮    疱疹样皮炎    下肢水肿    大疱性脓疱病    药物相关性水疱    多形红斑    血卟啉病    中毒性表皮坏死松解症    大疱性表皮松解症    变应性血管炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


116行-皮肤红斑,推出诊断:蜂窝织炎,痛风,身体烧伤,中毒性红斑,酒渣鼻,妊娠,肝病,甲状腺功能亢进症,药物光毒性反应,受压区Ⅰ期压疮,多形红斑,系统性红斑狼疮,火激红斑,固定性药疹,网状青斑症,艾滋病,结节性红斑,硬红斑,莱姆病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤红斑
        ${assert}    Create List    蜂窝织炎    痛风    身体烧伤    中毒性红斑    酒渣鼻    妊娠    肝病    甲状腺功能亢进症    药物光毒性反应    受压区Ⅰ期压疮    多形红斑    系统性红斑狼疮    火激红斑    固定性药疹    网状青斑症    艾滋病    结节性红斑    硬红斑    莱姆病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



117行-皮肤结节,推出诊断:皮脂腺囊肿,脂肪瘤,类风湿性结节,痛风,疣,结节病,囊肿型痤疮,角化棘皮瘤,黄色瘤,皮肤纤维瘤,结节性红斑,结节性血管炎,结节性多动脉炎,化脓性肉芽肿,组织细胞瘤,基底细胞癌,鳞状细胞癌,慢性结节性耳轮软骨皮炎,恶性黑色素瘤,寻常性狼疮,海分枝杆菌感染,放线菌病,淋巴瘤,转移性癌,黏液性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤结节
        ${assert}    Create List    皮脂腺囊肿    脂肪瘤    类风湿性结节    痛风    疣    结节病    囊肿型痤疮    角化棘皮瘤    黄色瘤    皮肤纤维瘤    结节性红斑    结节性血管炎    结节性多动脉炎    化脓性肉芽肿    组织细胞瘤    基底细胞癌    鳞状细胞癌    慢性结节性耳轮软骨皮炎    恶性黑色素瘤    寻常性狼疮    海分枝杆菌感染    放线菌病    淋巴瘤    转移性癌    黏液性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


118行-丘疹,推出诊断:痤疮,疥疮,病毒性疣,传染性软疣,血管瘤,皮肤赘生物,病毒性疾病,粟丘疹,被无毒昆虫和其他无毒节肢动物咬伤或蜇伤,脂溢性角化病,黄色瘤,滴状银屑病,慢性苔藓样糠疹,扁平苔藓,痱子,毛发角化病,恶性黑色素瘤,基底细胞癌,皮肤卡波西肉瘤,毛囊角化病,黑棘皮病,弹性纤维假黄瘤,结节性硬化症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    丘疹
        ${assert}    Create List    痤疮    疥疮    病毒性疣    传染性软疣    血管瘤    皮肤赘生物    病毒性疾病    粟丘疹    被无毒昆虫和其他无毒节肢动物咬伤或蜇伤    脂溢性角化病    黄色瘤    滴状银屑病    慢性苔藓样糠疹    扁平苔藓    痱子    毛发角化病    恶性黑色素瘤    基底细胞癌    皮肤卡波西肉瘤    毛囊角化病    黑棘皮病    弹性纤维假黄瘤    结节性硬化症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



119行-紫癜,推出诊断:外伤,老年性紫癜,肝病,血管内压增高性紫癜,药物相关性紫癜,血管炎,血小板减少,肾衰竭,感染性心内膜炎,冷球蛋白血症,凝血障碍,脑膜炎球菌血症,立氏立克次体性斑疹热,维生素C缺乏后遗症,维生素K缺乏病,弥散性血管内凝血,埃勒斯-当洛斯综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    紫癜
        ${assert}    Create List    外伤    老年性紫癜    肝病    血管内压增高性紫癜    药物相关性紫癜    血管炎    血小板减少    肾衰竭    感染性心内膜炎    冷球蛋白血症    凝血障碍    脑膜炎球菌血症    立氏立克次体性斑疹热    维生素C缺乏后遗症    维生素K缺乏病    弥散性血管内凝血    埃勒斯-当洛斯综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



120行-皮肤脓疱,推出诊断:脓疱疮,葡萄球菌感染,单纯疱疹,带状疱疹,寻常痤疮,酒渣鼻,口周皮炎,化脓性汗腺炎,皮肤念珠菌病,脓疱性银屑病,疱疹样皮炎,白塞病,牛痘样水疱,铜绿假单胞菌感染,药物相关性脓疱
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤脓疱
        ${assert}    Create List    脓疱疮    葡萄球菌感染    单纯疱疹    带状疱疹    寻常痤疮    酒渣鼻    口周皮炎    化脓性汗腺炎    皮肤念珠菌病    脓疱性银屑病    疱疹样皮炎    白塞病    牛痘样水疱    铜绿假单胞菌感染    药物相关性脓疱
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




121行-皮肤鳞屑,推出诊断:银屑病,湿疹,真菌病,脂溢性皮炎,脂溢性角化病,苔藓样皮炎,扁平苔藓,日光性角化病,花斑癣,玫瑰糠疹,幼年跖部皮病,滴状银屑病,鲍恩病,蕈样肉芽肿,药物相关性鳞屑,片层状鱼鳞癣,脓溢性皮肤角化病,慢性苔藓样糠疹,皮肤二期梅毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤鳞屑
        ${assert}    Create List    银屑病    湿疹    真菌病    脂溢性皮炎    脂溢性角化病    苔藓样皮炎    扁平苔藓    日光性角化病    花斑癣    玫瑰糠疹    幼年跖部皮病    滴状银屑病    鲍恩病    蕈样肉芽肿    药物相关性鳞屑    片层状鱼鳞癣    脓溢性皮肤角化病    慢性苔藓样糠疹    皮肤二期梅毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


122行-皮肤斑块,推出诊断:银屑病,湿疹,真菌病,脂溢性皮炎,脂溢性角化病,苔藓样皮炎,扁平苔藓,日光性角化病,花斑癣,玫瑰糠疹,幼年跖部皮病,滴状银屑病,鲍恩病,蕈样肉芽肿,药物相关性斑块,片层状鱼鳞癣,脓溢性皮肤角化病,慢性苔藓样糠疹,皮肤二期梅毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤斑块
        ${assert}    Create List    银屑病    湿疹    真菌病    脂溢性皮炎    脂溢性角化病    苔藓样皮炎    扁平苔藓    日光性角化病    花斑癣    玫瑰糠疹    幼年跖部皮病    滴状银屑病    鲍恩病    蕈样肉芽肿    药物相关性斑块    片层状鱼鳞癣    脓溢性皮肤角化病    慢性苔藓样糠疹    皮肤二期梅毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



123行-皮肤瘙痒,推出诊断:变应性接触性皮炎,荨麻疹,疥疮,特应性皮炎,玫瑰糠疹,银屑病,黄疸,缺铁性贫血,糖尿病,甲状腺功能亢进症,甲状腺功能减退症,尿毒症,扁平苔藓,痱子,妊娠疱疹,疱疹样皮炎,心因性瘙痒症,白血病,慢性骨髓增生性疾病,瘙痒症,药物不良反应
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤瘙痒
        ${assert}    Create List    变应性接触性皮炎    荨麻疹    疥疮    特应性皮炎    玫瑰糠疹    银屑病    黄疸    缺铁性贫血    糖尿病    甲状腺功能亢进症    甲状腺功能减退症    尿毒症    扁平苔藓    痱子    妊娠疱疹    疱疹样皮炎    心因性瘙痒症    白血病    慢性骨髓增生性疾病    瘙痒症    药物不良反应
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



124行-肛门瘙痒,推出诊断:痔,肛门皮赘,肛裂,真菌病,外阴扁平湿疣,慢性腹泻,链球菌感染,性传播疾病,大便失禁,直肠脱垂,银屑病,糖尿病,刺激性皮炎,直肠肛门恶性肿瘤,去污剂引起的刺激性接触性皮炎,异物反应,硬化萎缩性苔藓,克罗恩病,直肠阴道瘘,瘙痒症,类圆线虫病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    肛门瘙痒
        ${assert}    Create List    痔    肛门皮赘    肛裂    真菌病    外阴扁平湿疣    慢性腹泻    链球菌感染    性传播疾病    大便失禁    直肠脱垂    银屑病    糖尿病    刺激性皮炎    直肠肛门恶性肿瘤    去污剂引起的刺激性接触性皮炎    异物反应    硬化萎缩性苔藓    克罗恩病    直肠阴道瘘    瘙痒症    类圆线虫病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


125行-肛门肿胀,推出诊断:肛管脱垂,脱垂性内痔,血肿,肛门皮赘,肛周脓肿,直肠脱垂,尖锐湿疣,皮脂腺囊肿,前哨痔,肛瘘,肛门损伤,藏毛窦感染,化脓性汗腺炎,恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    肛门肿胀
        ${assert}    Create List    肛管脱垂    脱垂性内痔    血肿    肛门皮赘    肛周脓肿    直肠脱垂    尖锐湿疣    皮脂腺囊肿    前哨痔    肛瘘    肛门损伤    藏毛窦感染    化脓性汗腺炎    恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


126行-肛周疼痛,推出诊断:肛裂,血栓性痔,肛周脓肿,痉挛性肛门直肠痛,血肿,直肠肛门恶性肿瘤,提肛肌综合征,克罗恩病,尾骨痛,会阴下降综合征,前列腺炎,卵巢囊肿,卵巢肿瘤,孤立性直肠溃疡综合征,肛周结核,马尾综合征,子宫内膜异位症,肛门损伤,盆腔肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    肛周疼痛
        ${assert}    Create List    肛裂    血栓性痔    肛周脓肿    痉挛性肛门直肠痛    血肿    直肠肛门恶性肿瘤    提肛肌综合征    克罗恩病    尾骨痛    会阴下降综合征    前列腺炎    卵巢囊肿    卵巢肿瘤    孤立性直肠溃疡综合征    肛周结核    马尾综合征    子宫内膜异位症    肛门损伤    盆腔肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



127行-肛门疼痛,推出诊断:肛裂,血栓性痔,肛周脓肿,痉挛性肛门直肠痛,血肿,直肠肛门恶性肿瘤,提肛肌综合征,克罗恩病,尾骨痛,会阴下降综合征,前列腺炎,卵巢囊肿,卵巢肿瘤,孤立性直肠溃疡综合征,肛周结核,马尾综合征,子宫内膜异位症,肛门损伤,盆腔肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    肛门疼痛
        ${assert}    Create List    肛裂    血栓性痔    肛周脓肿    痉挛性肛门直肠痛    血肿    直肠肛门恶性肿瘤    提肛肌综合征    克罗恩病    尾骨痛    会阴下降综合征    前列腺炎    卵巢囊肿    卵巢肿瘤    孤立性直肠溃疡综合征    肛周结核    马尾综合征    子宫内膜异位症    肛门损伤    盆腔肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


128行-直肠出血,推出诊断:痔,肛裂,胃肠炎,炎症性肠病,缺血性肠病,直肠恶性肿瘤,直肠憩室,绒毛状腺瘤,直肠损伤,肠套叠,麦克尔憩室,结肠恶性肿瘤,药物相关性直肠出血,凝血障碍,肠血管疾患
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    直肠出血
        ${assert}    Create List    痔    肛裂    胃肠炎    炎症性肠病    缺血性肠病    直肠恶性肿瘤    直肠憩室    绒毛状腺瘤    直肠损伤    肠套叠    麦克尔憩室    结肠恶性肿瘤    药物相关性直肠出血    凝血障碍    肠血管疾患
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



129行-直肠流液,推出诊断:痔,肛裂,直肠脱垂,直肠炎,尖锐湿疣,炎症性肠病,直肠恶性肿瘤,肛瘘,肛周瘘,性传播疾病,绒毛状腺瘤,孤立性直肠溃疡综合征,肛周结核,直肠肛门恶性肿瘤,艾滋病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    直肠流液
        ${assert}    Create List    痔    肛裂    直肠脱垂    直肠炎    尖锐湿疣    炎症性肠病    直肠恶性肿瘤    肛瘘    肛周瘘    性传播疾病    绒毛状腺瘤    孤立性直肠溃疡综合征    肛周结核    直肠肛门恶性肿瘤    艾滋病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



130行-血尿,推出诊断:泌尿道感染,肾结石,输尿管结石,尿道炎,前列腺增生,膀胱肿瘤,前列腺癌,肾炎,肾小球肾炎,尿道损伤,肾结核,肾细胞癌,慢性间质性膀胱炎,多囊肾,运动性血尿,抗凝剂的有害效应,血小板减少综合征,血友病,镰状细胞病,感染性心内膜炎,血吸虫病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    血尿
        ${assert}    Create List    泌尿道感染    肾结石    输尿管结石    尿道炎    前列腺增生    膀胱肿瘤    前列腺癌    肾炎    肾小球肾炎    尿道损伤    肾结核    肾细胞癌    慢性间质性膀胱炎    多囊肾    运动性血尿    抗凝剂的有害效应    血小板减少综合征    血友病    镰状细胞病    感染性心内膜炎    血吸虫病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



131行-多尿,推出诊断:糖尿病,慢性肾功能衰竭,药物相关性多尿,慢性肾炎综合征,慢性肾盂肾炎,部分性垂体性尿崩症,原发性甲状旁腺功能亢进症,原发性醛固酮过多症,肾性尿崩症,肾小球硬化,肾小管酸中毒,急性肾衰竭,中枢性尿崩症,高钙血症,库欣病,镰状细胞性贫血,精神性多饮,室上性心动过速,Wolfram综合征,范科尼综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    多尿
        ${assert}    Create List    糖尿病    慢性肾功能衰竭    药物相关性多尿    慢性肾炎综合征    慢性肾盂肾炎    部分性垂体性尿崩症    原发性甲状旁腺功能亢进症    原发性醛固酮过多症    肾性尿崩症    肾小球硬化    肾小管酸中毒    急性肾衰竭    中枢性尿崩症    高钙血症    库欣病    镰状细胞性贫血    精神性多饮    室上性心动过速    Wolfram综合征    范科尼综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




132行-少尿,推出诊断:血容量不足性休克,脱水,肾病综合征,心功能不全,失血性休克,肝肾综合征,肾动脉栓塞,肾动脉血栓形成,狼疮性肾炎,高血压危象,急性肾衰竭,急性肾炎综合征,急性间质性肾炎,急性肾小管坏死,肾乳头坏死,肾盂积水伴有肾和输尿管结石梗阻
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    少尿
        ${assert}    Create List    血容量不足性休克    脱水    肾病综合征    心功能不全    失血性休克    肝肾综合征    肾动脉栓塞    肾动脉血栓形成    狼疮性肾炎    高血压危象    急性肾衰竭    急性肾炎综合征    急性间质性肾炎    急性肾小管坏死    肾乳头坏死    肾盂积水伴有肾和输尿管结石梗阻
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



133行-无尿,推出诊断:血容量不足性休克,脱水,肾病综合征,心功能不全,失血性休克,肝肾综合征,肾动脉栓塞,肾动脉血栓形成,狼疮性肾炎,高血压危象,急性肾衰竭,急性肾炎综合征,急性间质性肾炎,急性肾小管坏死,肾乳头坏死,肾盂积水伴有肾和输尿管结石梗阻
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    无尿
        ${assert}    Create List    血容量不足性休克    脱水    肾病综合征    心功能不全    失血性休克    肝肾综合征    肾动脉栓塞    肾动脉血栓形成    狼疮性肾炎    高血压危象    急性肾衰竭    急性肾炎综合征    急性间质性肾炎    急性肾小管坏死    肾乳头坏死    肾盂积水伴有肾和输尿管结石梗阻
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



134行-尿频,推出诊断:膀胱炎,尿道炎,膀胱过度活动症,膀胱结石,糖尿病,尿道综合征,前列腺炎,肾盂肾炎,妊娠,尿崩症,精神性多饮,慢性间质性膀胱炎,焦虑状态,输尿管结石,卵巢囊肿,药物相关性多尿,膀胱颈狭窄,盆腔肿物,盆腔炎,膀胱肿瘤,膀胱结核,肾结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿频
        ${assert}    Create List    膀胱炎    尿道炎    膀胱过度活动症    膀胱结石    糖尿病    尿道综合征    前列腺炎    肾盂肾炎    妊娠    尿崩症    精神性多饮    慢性间质性膀胱炎    焦虑状态    输尿管结石    卵巢囊肿    药物相关性多尿    膀胱颈狭窄    盆腔肿物    盆腔炎    膀胱肿瘤    膀胱结核    肾结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



135行-尿急,推出诊断:急性膀胱炎,泌尿道感染,尿道炎,急性前列腺炎,前列腺增生,膀胱结石,尿道结石,膀胱恶性肿瘤,糖尿病,前列腺恶性肿瘤,神经源性膀胱
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿急
        ${assert}    Create List    急性膀胱炎    泌尿道感染    尿道炎    急性前列腺炎    前列腺增生    膀胱结石    尿道结石    膀胱恶性肿瘤    糖尿病    前列腺恶性肿瘤    神经源性膀胱
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



136行-尿痛,推出诊断:泌尿道感染,膀胱炎,尿道炎,前列腺炎,急性前列腺炎,前列腺增生,阴道炎,膀胱结石,尿道结石,膀胱恶性肿瘤,糖尿病,前列腺恶性肿瘤,尿道旁腺脓肿,反应性关节炎,神经源性膀胱
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿痛
        ${assert}    Create List    泌尿道感染    膀胱炎    尿道炎    前列腺炎    急性前列腺炎    前列腺增生    阴道炎    膀胱结石    尿道结石    膀胱恶性肿瘤    糖尿病    前列腺恶性肿瘤    尿道旁腺脓肿    反应性关节炎    神经源性膀胱
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



137行-尿失禁,推出诊断:膀胱炎,痴呆,帕金森病,前列腺增生,膀胱过度活动症,膀胱颈狭窄,尿道狭窄,泌尿道感染,慢性间质性膀胱炎,膀胱结石,膀胱肿瘤,手术后尿道综合征,糖尿病,前列腺切除术后状态,尿失禁，其他特指的,骨盆骨折,先天性输尿管畸形,先天性尿道畸形,神经源性膀胱,神经梅毒,多发性硬化,脊髓空洞症,截瘫,马尾损伤,精神病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿失禁
        ${assert}    Create List    膀胱炎    痴呆    帕金森病    前列腺增生    膀胱过度活动症    膀胱颈狭窄    尿道狭窄    泌尿道感染    慢性间质性膀胱炎    膀胱结石    膀胱肿瘤    手术后尿道综合征    糖尿病    前列腺切除术后状态    尿失禁，其他特指的    骨盆骨折    先天性输尿管畸形    先天性尿道畸形    神经源性膀胱    神经梅毒    多发性硬化    脊髓空洞症    截瘫    马尾损伤    精神病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



138行-尿失禁,推出诊断:压力性尿失禁,膀胱炎,膀胱过度活动症,膀胱颈梗阻,痴呆,帕金森病,泌尿道感染,慢性间质性膀胱炎,膀胱结石,膀胱肿瘤,膀胱颈狭窄,尿道狭窄,手术后尿道综合征,膀胱阴道瘘,输尿管阴道瘘,骨盆骨折,先天性输尿管畸形,先天性尿道畸形,神经源性膀胱,多发性硬化,脊髓空洞症,截瘫,马尾损伤,精神病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿失禁
        ${assert}    Create List    压力性尿失禁    膀胱炎    膀胱过度活动症    膀胱颈梗阻    痴呆    帕金森病    泌尿道感染    慢性间质性膀胱炎    膀胱结石    膀胱肿瘤    膀胱颈狭窄    尿道狭窄    手术后尿道综合征    膀胱阴道瘘    输尿管阴道瘘    骨盆骨折    先天性输尿管畸形    先天性尿道畸形    神经源性膀胱    多发性硬化    脊髓空洞症    截瘫    马尾损伤    精神病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



139行-夜尿,推出诊断:膀胱炎,尿道综合征,膀胱过度活动症,梗阻性尿路疾病,糖尿病,睡眠呼吸暂停,衰老,焦虑状态,药物不良反应,尿崩症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    夜尿
        ${assert}    Create List    膀胱炎    尿道综合征    膀胱过度活动症    梗阻性尿路疾病    糖尿病    睡眠呼吸暂停    衰老    焦虑状态    药物不良反应    尿崩症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



140行-尿潴留,推出诊断:前列腺增生,前列腺癌,药物相关性尿潴留,膀胱颈梗阻,尿道狭窄,泌尿道感染,尿道结石,前列腺充血,盆腔肿物,生殖器疱疹,龟头包皮炎,便秘,多发性硬化,神经梅毒,脊髓受压,膀胱肿瘤,创伤性尿道断裂,尿道内异物,包皮过长
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿潴留
        ${assert}    Create List    前列腺增生    前列腺癌    药物相关性尿潴留    膀胱颈梗阻    尿道狭窄    泌尿道感染    尿道结石    前列腺充血    盆腔肿物    生殖器疱疹    龟头包皮炎    便秘    多发性硬化    神经梅毒    脊髓受压    膀胱肿瘤    创伤性尿道断裂    尿道内异物    包皮过长
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


141行-尿潴留,推出诊断:药物相关性尿潴留,膀胱颈梗阻,尿道狭窄,泌尿道感染,便秘,尿道结石,盆腔肿物,膀胱肿瘤,尿道内异物,多发性硬化,神经梅毒,脊髓受压
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    尿潴留
        ${assert}    Create List    药物相关性尿潴留    膀胱颈梗阻    尿道狭窄    泌尿道感染    便秘    尿道结石    盆腔肿物    膀胱肿瘤    尿道内异物    多发性硬化    神经梅毒    脊髓受压
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



142行-啼哭,推出诊断:肠绞痛,便秘,出牙综合征,病毒性感染,尿布疹,免疫接种后反应,胃肠炎,毛细支气管炎,肺部感染,急性喉气管炎,泌尿道感染,阑尾炎,肠梗阻,肠套叠,中耳炎,外耳炎,乳突炎,脑膜炎,脑炎,绞窄性疝气,骨髓炎,睾丸扭转,先天性巨结肠症,幽门狭窄,龟头包皮炎,败血症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    啼哭
        ${assert}    Create List    肠绞痛    便秘    出牙综合征    病毒性感染    尿布疹    免疫接种后反应    胃肠炎    毛细支气管炎    肺部感染    急性喉气管炎    泌尿道感染    阑尾炎    肠梗阻    肠套叠    中耳炎    外耳炎    乳突炎    脑膜炎    脑炎    绞窄性疝气    骨髓炎    睾丸扭转    先天性巨结肠症    幽门狭窄    龟头包皮炎    败血症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



143行-发育迟缓,推出诊断:青春期延迟,甲状腺功能亢进症,特纳综合征,神经性厌食,低促性腺激素性腺功能减退症,下丘脑综合征,垂体肿物,糖尿病,肾衰竭,囊性纤维化病,乳糜泻,高催乳素血症,先天性肾上腺皮质增生症,库欣综合征,药物相关性青春期发育迟缓,放射性损伤,生长激素缺乏症,卵巢功能障碍,甲状腺功能减退症,单纯性性腺发育不全,睾丸下降不全
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发育迟缓
        ${assert}    Create List    青春期延迟    甲状腺功能亢进症    特纳综合征    神经性厌食    低促性腺激素性腺功能减退症    下丘脑综合征    垂体肿物    糖尿病    肾衰竭    囊性纤维化病    乳糜泻    高催乳素血症    先天性肾上腺皮质增生症    库欣综合征    药物相关性青春期发育迟缓    放射性损伤    生长激素缺乏症    卵巢功能障碍    甲状腺功能减退症    单纯性性腺发育不全    睾丸下降不全
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"17","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



144行-生长缓慢,推出诊断:体质性生长发育延迟,呕吐,肠吸收不良,感染,内分泌疾患,泌尿道感染,慢性胃肠炎,唐氏综合征,特纳综合征,胎儿营养不良,产程和分娩并发症,早产婴儿，其他的,胎儿和新生儿受母体内有害物质的影响,胎儿和新生儿受母体其他药物的影响,胎儿和新生儿受母体传染病和寄生虫病的影响,大脑性瘫痪,肝功能不全,心功能不全,肾衰竭,支气管哮喘，危重,恶性肿瘤,结核病,艾滋病,寄生虫病,囊性纤维化病,代谢障碍,Prader-Willi综合征,小颌畸形
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    生长缓慢
        ${assert}    Create List    体质性生长发育延迟    呕吐    肠吸收不良    感染    内分泌疾患    泌尿道感染    慢性胃肠炎    唐氏综合征    特纳综合征    胎儿营养不良    产程和分娩并发症    早产婴儿，其他的    胎儿和新生儿受母体内有害物质的影响    胎儿和新生儿受母体其他药物的影响    胎儿和新生儿受母体传染病和寄生虫病的影响    大脑性瘫痪    肝功能不全    心功能不全    肾衰竭    支气管哮喘，危重    恶性肿瘤    结核病    艾滋病    寄生虫病    囊性纤维化病    代谢障碍    Prader-Willi综合征    小颌畸形
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


145行-急性单关节痛,推出诊断:创伤性关节炎,化脓性关节炎,痛风,老年性关节炎,骨折,扭伤,肌肉拉伤,创伤后滑膜炎,骨肿瘤,类风湿性关节炎,白血病,焦磷酸盐结晶性关节炎(病),髌骨软骨软化,关节积血,布赖特氏病,关节病型银屑病,髌肌腱炎,胫骨幼年型骨软骨病,血友病,足菌肿,丝虫病,股骨头无菌性坏死
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性单关节痛
        ${assert}    Create List    创伤性关节炎    化脓性关节炎    痛风    老年性关节炎    骨折    扭伤    肌肉拉伤    创伤后滑膜炎    骨肿瘤    类风湿性关节炎    白血病    焦磷酸盐结晶性关节炎(病)    髌骨软骨软化    关节积血    布赖特氏病    关节病型银屑病    髌肌腱炎    胫骨幼年型骨软骨病    血友病    足菌肿    丝虫病    股骨头无菌性坏死
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



146行-上肢痛,推出诊断:肌肉劳损,肩周炎,外上髁炎,肩峰下滑囊炎,关节囊炎,颈椎病,心绞痛,二头肌腱炎,肩锁关节扭伤和劳损,胸锁关节扭伤和劳损,钙化性肌腱炎,腱鞘炎,腕管综合征,颈肋,尺神经炎,带状疱疹后遗症,椎间盘突出症,胃食管反流病,恶性肿瘤,锁骨下动脉瘤,多发性硬化,梅毒性主动脉炎,胸廓出口综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    上肢痛
        ${assert}    Create List    肌肉劳损    肩周炎    外上髁炎    肩峰下滑囊炎    关节囊炎    颈椎病    心绞痛    二头肌腱炎    肩锁关节扭伤和劳损    胸锁关节扭伤和劳损    钙化性肌腱炎    腱鞘炎    腕管综合征    颈肋    尺神经炎    带状疱疹后遗症    椎间盘突出症    胃食管反流病    恶性肿瘤    锁骨下动脉瘤    多发性硬化    梅毒性主动脉炎    胸廓出口综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



147行-小腿痛,推出诊断:痛性痉挛和痉挛,肌强直性疾患,蜂窝织炎,周围血管疾病,肌肉损伤,膝关节痛,糖尿病神经病变,酒精性神经系统变性,腘窝囊肿,深静脉血栓,血栓性静脉炎,运动神经元病,多发性硬化,肌酶缺乏,精神性疼痛,铅中毒,跟腱断裂
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    小腿痛
        ${assert}    Create List    痛性痉挛和痉挛    肌强直性疾患    蜂窝织炎    周围血管疾病    肌肉损伤    膝关节痛    糖尿病神经病变    酒精性神经系统变性    腘窝囊肿    深静脉血栓    血栓性静脉炎    运动神经元病    多发性硬化    肌酶缺乏    精神性疼痛    铅中毒    跟腱断裂
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



148行-足部疼痛,推出诊断:异物反应,关节炎,肌腱炎,痛风,趾骨骨疣,拇外翻,甲癣,足底筋膜炎,神经瘤,跖痛症,水肿,跖骨骨折,跟骨骺炎,骨软骨炎,红斑性肢痛症,周围神经病,化脓性关节炎,下肢缺血
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    足部疼痛
        ${assert}    Create List    异物反应    关节炎    肌腱炎    痛风    趾骨骨疣    拇外翻    甲癣    足底筋膜炎    神经瘤    跖痛症    水肿    跖骨骨折    跟骨骺炎    骨软骨炎    红斑性肢痛症    周围神经病    化脓性关节炎    下肢缺血
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



149行-手痛,推出诊断:老年性关节炎,腕管综合征,腕骨骨折,类风湿性关节炎,腱鞘炎,腱鞘囊肿,痛风,雷诺综合征,甲沟炎,扳机指,尺神经损害,桡神经损害,复杂性区域疼痛综合征,职业相关疾病,湿疹,震颤,周围神经病,掌腱膜纤维瘤病,关节病,骨髓炎,月骨缺血性坏死
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    手痛
        ${assert}    Create List    老年性关节炎    腕管综合征    腕骨骨折    类风湿性关节炎    腱鞘炎    腱鞘囊肿    痛风    雷诺综合征    甲沟炎    扳机指    尺神经损害    桡神经损害    复杂性区域疼痛综合征    职业相关疾病    湿疹    震颤    周围神经病    掌腱膜纤维瘤病    关节病    骨髓炎    月骨缺血性坏死
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




150行-腕关节痛,推出诊断:老年性关节炎,腕管综合征,腕骨骨折,类风湿性关节炎,腱鞘炎,腱鞘囊肿,痛风,雷诺综合征,甲沟炎,扳机指,尺神经损害,桡神经损害,复杂性区域疼痛综合征,职业相关疾病,湿疹,震颤,周围神经病,掌腱膜纤维瘤病,关节病,骨髓炎,月骨缺血性坏死
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腕关节痛
        ${assert}    Create List    老年性关节炎    腕管综合征    腕骨骨折    类风湿性关节炎    腱鞘炎    腱鞘囊肿    痛风    雷诺综合征    甲沟炎    扳机指    尺神经损害    桡神经损害    复杂性区域疼痛综合征    职业相关疾病    湿疹    震颤    周围神经病    掌腱膜纤维瘤病    关节病    骨髓炎    月骨缺血性坏死
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



151行-下肢溃疡,推出诊断:糖尿病,类风湿性关节炎,血管炎,下肢静脉功能不全,周围血管疾病,全身性水肿,下肢皮肤感染,带状疱疹,恶性肿瘤,热带溃疡,艾滋病,肺结核,药物不良反应
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    下肢溃疡
        ${assert}    Create List    糖尿病    类风湿性关节炎    血管炎    下肢静脉功能不全    周围血管疾病    全身性水肿    下肢皮肤感染    带状疱疹    恶性肿瘤    热带溃疡    艾滋病    肺结核    药物不良反应
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



152行-多发性关节痛,推出诊断:类风湿性关节炎,多关节炎,老年性关节炎,反应性关节炎,结缔组织病,银屑病性关节炎,过敏性紫癜,恶性肿瘤,药物相关性骨痛,肥大性肺性骨关节病,结节病,镰状细胞性贫血伴有危象,淀粉样变性关节病,风湿热,莱姆病,肝豆状核变性,布鲁氏菌病,潜水员病\\[减压病\\]
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    多发性关节痛
        ${assert}    Create List    类风湿性关节炎    多关节炎    老年性关节炎    反应性关节炎    结缔组织病    银屑病性关节炎    过敏性紫癜    恶性肿瘤    药物相关性骨痛    肥大性肺性骨关节病    结节病    镰状细胞性贫血伴有危象    淀粉样变性关节病    风湿热    莱姆病    肝豆状核变性    布鲁氏菌病    潜水员病\\[减压病\\]
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



153行-肌肉疼痛,推出诊断:肌肉劳损,病毒性感染,抑郁状态,风湿性多肌痛,药物相关性肌痛,维生素D缺乏病,关节痛,纤维肌痛,疲劳综合征,结缔组织病,周围血管疾病,酒精中毒性周围神经病,糖尿病周围神经病变,流行性肌痛,甲状腺功能减退症,药物不良反应,多发性肌炎,皮肌炎,恶性肿瘤,血卟啉病,吉兰-巴雷综合症,脊髓灰质炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    肌肉疼痛
        ${assert}    Create List    肌肉劳损    病毒性感染    抑郁状态    风湿性多肌痛    药物相关性肌痛    维生素D缺乏病    关节痛    纤维肌痛    疲劳综合征    结缔组织病    周围血管疾病    酒精中毒性周围神经病    糖尿病周围神经病变    流行性肌痛    甲状腺功能减退症    药物不良反应    多发性肌炎    皮肌炎    恶性肿瘤    血卟啉病    吉兰-巴雷综合症    脊髓灰质炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


154行-髋部疼痛,推出诊断:肌肉劳损,老年性关节炎,滑囊炎,背部病,股外侧皮神经炎,感染性关节炎,股骨头无菌性坏死,肌疝,髋关节置换术后疼痛,椎管狭窄,髂胫带综合征,髋臼骨折,骨折,关节脱位,骨病变
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    髋部疼痛
        ${assert}    Create List    肌肉劳损    老年性关节炎    滑囊炎    背部病    股外侧皮神经炎    感染性关节炎    股骨头无菌性坏死    肌疝    髋关节置换术后疼痛    椎管狭窄    髂胫带综合征    髋臼骨折    骨折    关节脱位    骨病变
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



155行-膝关节痛,推出诊断:类风湿性关节炎,老年性关节炎,软骨疾患,慢性软组织损伤,关节炎,骨质疏松,半月板损伤,滑囊炎,髋关节病,髂胫带综合征,髌骨软骨软化,胫骨幼年型骨软骨病,背部病,韧带损伤,髌肌腱炎,腘窝囊肿,关节游离体,骨病变,复发性髌骨脱位,剥脱性骨软骨炎,血色病,血友病,骨肉瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    膝关节痛
        ${assert}    Create List    类风湿性关节炎    老年性关节炎    软骨疾患    慢性软组织损伤    关节炎    骨质疏松    半月板损伤    滑囊炎    髋关节病    髂胫带综合征    髌骨软骨软化    胫骨幼年型骨软骨病    背部病    韧带损伤    髌肌腱炎    腘窝囊肿    关节游离体    骨病变    复发性髌骨脱位    剥脱性骨软骨炎    血色病    血友病    骨肉瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



156行-水肿,推出诊断:新生儿溶血症,新生儿硬肿症,低蛋白血症,先天性心脏畸形
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    水肿
        ${assert}    Create List    新生儿溶血症    新生儿硬肿症    低蛋白血症    先天性心脏畸形
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"28","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


157行-水肿,推出诊断:低蛋白血症,肾病综合征,先天性心脏畸形,血管神经性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    水肿
        ${assert}    Create List    低蛋白血症    肾病综合征    先天性心脏畸形    血管神经性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


158行-水肿,推出诊断:肾小球肾炎,肾病综合征,心力衰竭,肝病,血管神经性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    水肿
        ${assert}    Create List    肾小球肾炎    肾病综合征    心力衰竭    肝病    血管神经性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"4","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



159行-水肿,推出诊断:肾小球肾炎,肾病综合征,心力衰竭,肝病,药物性水肿,妊娠水肿,蛋白丢失性胃肠病,甲状腺功能减退症,血管神经性水肿,系统性红斑狼疮
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    水肿
        ${assert}    Create List    肾小球肾炎    肾病综合征    心力衰竭    肝病    药物性水肿    妊娠水肿    蛋白丢失性胃肠病    甲状腺功能减退症    血管神经性水肿    系统性红斑狼疮
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



160行-踝部水肿,推出诊断:充血性心力衰竭,药物相关性踝关节肿胀,静脉功能不全,肥胖症,盆腔肿物,肝硬化,经前症候群,贫血,肾病,低蛋白血症,蛋白丢失性胃肠病,下腔静脉血栓形成,丝虫病,遗传性淋巴水肿,钩虫病,血管神经性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    踝部水肿
        ${assert}    Create List    充血性心力衰竭    药物相关性踝关节肿胀    静脉功能不全    肥胖症    盆腔肿物    肝硬化    经前症候群    贫血    肾病    低蛋白血症    蛋白丢失性胃肠病    下腔静脉血栓形成    丝虫病    遗传性淋巴水肿    钩虫病    血管神经性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


161行-下肢水肿,推出诊断:蜂窝织炎,踝关节肿胀,肌肉拉伤,腘囊肿破裂,深静脉血栓,跟腱断裂,湿疹,下肢静脉炎,原发性下肢静脉曲张,肌疝,单纯性下肢静脉曲张,平滑肌肿瘤,下肢动脉硬化闭塞症,下肢静脉功能不全,下肢恶性肿瘤,下肢骨肿瘤,假肥大型肌营养不良症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    下肢水肿
        ${assert}    Create List    蜂窝织炎    踝关节肿胀    肌肉拉伤    腘囊肿破裂    深静脉血栓    跟腱断裂    湿疹    下肢静脉炎    原发性下肢静脉曲张    肌疝    单纯性下肢静脉曲张    平滑肌肿瘤    下肢动脉硬化闭塞症    下肢静脉功能不全    下肢恶性肿瘤    下肢骨肿瘤    假肥大型肌营养不良症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



162行-乳房肿大,推出诊断:青春期乳房肥大,药物相关性男性乳房肿大,肝病,肺原位癌,甲状腺功能亢进症,甲状腺功能减退症,高催乳素血症,血液透析并发症,慢性肾衰竭,睾丸恶性肿瘤,肾上腺恶性肿瘤,隐睾,睾丸功能减退症,克兰费尔特综合征,两性畸形，不可归类在他处者,男性假两性畸形，不可归类在他处者,肢端肥大症,McCune-Albright综合征,肾上腺皮质增生,乳腺癌
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乳房肿大
        ${assert}    Create List    青春期乳房肥大    药物相关性男性乳房肿大    肝病    肺原位癌    甲状腺功能亢进症    甲状腺功能减退症    高催乳素血症    血液透析并发症    慢性肾衰竭    睾丸恶性肿瘤    肾上腺恶性肿瘤    隐睾    睾丸功能减退症    克兰费尔特综合征    两性畸形，不可归类在他处者    男性假两性畸形，不可归类在他处者    肢端肥大症    McCune-Albright综合征    肾上腺皮质增生    乳腺癌
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



163行-乳房肿块,推出诊断:乳腺癌,乳房孤立囊肿,乳腺脓肿,乳腺纤维腺瘤,良性乳腺发育不良,乳管扩张症,乳房脂肪坏死,脂肪瘤,乳房佩吉特病,产褥期积乳囊肿,弥漫性囊性乳腺病,乳腺结核,良性叶状瘤,乳腺血栓性静脉炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乳房肿块
        ${assert}    Create List    乳腺癌    乳房孤立囊肿    乳腺脓肿    乳腺纤维腺瘤    良性乳腺发育不良    乳管扩张症    乳房脂肪坏死    脂肪瘤    乳房佩吉特病    产褥期积乳囊肿    弥漫性囊性乳腺病    乳腺结核    良性叶状瘤    乳腺血栓性静脉炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


164行-乳房疼痛,推出诊断:妊娠,乳痛症,乳头皲裂,乳腺脓肿,乳腺炎,乳腺癌,青春期疾患,产褥期积乳囊肿,乳房孤立囊肿,乳管扩张症,胸部损伤,肋骨软骨炎,心绞痛,颈椎病,带状疱疹,乳腺血栓性静脉炎,乳腺结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乳房疼痛
        ${assert}    Create List    妊娠    乳痛症    乳头皲裂    乳腺脓肿    乳腺炎    乳腺癌    青春期疾患    产褥期积乳囊肿    乳房孤立囊肿    乳管扩张症    胸部损伤    肋骨软骨炎    心绞痛    颈椎病    带状疱疹    乳腺血栓性静脉炎    乳腺结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



165行-乳头溢液,推出诊断:妊娠,导管内乳头状瘤,乳管扩张症,乳腺脓肿,乳腺炎,口服避孕药,导管内乳头状癌,与分娩无关的乳溢,高催乳素血症,乳管上皮增生,产褥期积乳囊肿,浆细胞性乳腺炎,机械性刺激,导管内乳头状黏液癌，侵袭性,乳腺结核,乳腺导管瘘,乳房佩吉特病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乳头溢液
        ${assert}    Create List    妊娠    导管内乳头状瘤    乳管扩张症    乳腺脓肿    乳腺炎    口服避孕药    导管内乳头状癌    与分娩无关的乳溢    高催乳素血症    乳管上皮增生    产褥期积乳囊肿    浆细胞性乳腺炎    机械性刺激    导管内乳头状黏液癌，侵袭性    乳腺结核    乳腺导管瘘    乳房佩吉特病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



166行-脱发,推出诊断:斑秃,变应性接触性皮炎,头癣,雄激素性脱发,脂溢性皮炎,拔毛狂,医源性情况,低蛋白血症,局限性硬皮病,红斑狼疮,静止期脱发,内分泌疾患,毛囊炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    脱发
        ${assert}    Create List    斑秃    变应性接触性皮炎    头癣    雄激素性脱发    脂溢性皮炎    拔毛狂    医源性情况    低蛋白血症    局限性硬皮病    红斑狼疮    静止期脱发    内分泌疾患    毛囊炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



167行-指甲异常,推出诊断:外伤,甲弯曲,咬指甲,银屑病,甲癣,白甲,剥脱性皮炎,甲营养不良,大疱性表皮松解症,黄甲综合征,手恶性黑色素瘤,原发性雷诺综合征,缺铁性贫血,普卢默-文森综合征,杵状指,甲沟炎,湿疹,自身免疫病,脆甲症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    指甲异常
        ${assert}    Create List    外伤    甲弯曲    咬指甲    银屑病    甲癣    白甲    剥脱性皮炎    甲营养不良    大疱性表皮松解症    黄甲综合征    手恶性黑色素瘤    原发性雷诺综合征    缺铁性贫血    普卢默-文森综合征    杵状指    甲沟炎    湿疹    自身免疫病    脆甲症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



168行-复视,推出诊断:复视,头部外伤,颧骨骨折,脑卒中,药物相关性复视,糖尿病神经病变,眼球运动障碍,吉兰-巴雷综合症,颅内占位性病变,重症肌无力,偏头痛,痛性眼肌麻痹
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    复视
        ${assert}    Create List    复视    头部外伤    颧骨骨折    脑卒中    药物相关性复视    糖尿病神经病变    眼球运动障碍    吉兰-巴雷综合症    颅内占位性病变    重症肌无力    偏头痛    痛性眼肌麻痹
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



169行-眼睑不适,推出诊断:睑腺炎,睑缘炎,睑板腺囊肿,睑黄斑瘤,泪道阻塞,眼睑水肿,睑外翻,睑内翻和倒睫,湿疹,上睑下垂,睑痉挛,眼恶性肿瘤,眼良性肿瘤,泪囊炎,传染性软疣
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    眼睑不适
        ${assert}    Create List    睑腺炎    睑缘炎    睑板腺囊肿    睑黄斑瘤    泪道阻塞    眼睑水肿    睑外翻    睑内翻和倒睫    湿疹    上睑下垂    睑痉挛    眼恶性肿瘤    眼良性肿瘤    泪囊炎    传染性软疣
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



170行-闪光,推出诊断:飞蚊症,偏头痛,玻璃体脱离,一过性黑矇,视网膜脱离,巨细胞动脉炎,血管迷走神经性晕厥,体位性低血压,玻璃体积血,药物不良反应,糖尿病,短暂性脑缺血发作,视神经炎,视盘水肿,外伤,脉络膜视网膜炎,癫痫,由于心理原因渲染的躯体症状
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    闪光
        ${assert}    Create List    飞蚊症    偏头痛    玻璃体脱离    一过性黑矇    视网膜脱离    巨细胞动脉炎    血管迷走神经性晕厥    体位性低血压    玻璃体积血    药物不良反应    糖尿病    短暂性脑缺血发作    视神经炎    视盘水肿    外伤    脉络膜视网膜炎    癫痫    由于心理原因渲染的躯体症状
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


171行-闪光感,推出诊断:飞蚊症,偏头痛,玻璃体脱离,一过性黑矇,视网膜脱离,巨细胞动脉炎,血管迷走神经性晕厥,体位性低血压,玻璃体积血,药物不良反应,糖尿病,短暂性脑缺血发作,视神经炎,视盘水肿,外伤,脉络膜视网膜炎,癫痫,由于心理原因渲染的躯体症状
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    闪光感
        ${assert}    Create List    飞蚊症    偏头痛    玻璃体脱离    一过性黑矇    视网膜脱离    巨细胞动脉炎    血管迷走神经性晕厥    体位性低血压    玻璃体积血    药物不良反应    糖尿病    短暂性脑缺血发作    视神经炎    视盘水肿    外伤    脉络膜视网膜炎    癫痫    由于心理原因渲染的躯体症状
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



172行-飞蚊症,推出诊断:飞蚊症,偏头痛,玻璃体脱离,一过性黑矇,视网膜脱离,巨细胞动脉炎,血管迷走神经性晕厥,体位性低血压,玻璃体积血,药物不良反应,糖尿病,短暂性脑缺血发作,视神经炎,视盘水肿,外伤,脉络膜视网膜炎,癫痫,由于心理原因渲染的躯体症状
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    飞蚊症
        ${assert}    Create List    飞蚊症    偏头痛    玻璃体脱离    一过性黑矇    视网膜脱离    巨细胞动脉炎    血管迷走神经性晕厥    体位性低血压    玻璃体积血    药物不良反应    糖尿病    短暂性脑缺血发作    视神经炎    视盘水肿    外伤    脉络膜视网膜炎    癫痫    由于心理原因渲染的躯体症状
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



173行-视觉障碍,推出诊断:近视,飞蚊症,玻璃体脱离,视网膜脱离,巨细胞动脉炎,血管迷走神经性晕厥,玻璃体积血,药物不良反应,糖尿病,视神经炎,视盘水肿,外伤,脉络膜视网膜炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    视觉障碍
        ${assert}    Create List    近视    飞蚊症    玻璃体脱离    视网膜脱离    巨细胞动脉炎    血管迷走神经性晕厥    玻璃体积血    药物不良反应    糖尿病    视神经炎    视盘水肿    外伤    脉络膜视网膜炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




174行-视力下降,推出诊断:白内障,慢性青光眼,高血压性视网膜病变,糖尿病视网膜病,年龄相关性黄斑变性,视网膜脱离,脉络膜视网膜炎,视神经炎,颅骨佩吉特病,视网膜色素变性,颅内肿瘤,黄斑变性,中毒性弱视,眼恶性肿瘤,遗传性视神经病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    视力下降
        ${assert}    Create List    白内障    慢性青光眼    高血压性视网膜病变    糖尿病视网膜病    年龄相关性黄斑变性    视网膜脱离    脉络膜视网膜炎    视神经炎    颅骨佩吉特病    视网膜色素变性    颅内肿瘤    黄斑变性    中毒性弱视    眼恶性肿瘤    遗传性视神经病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



175行-突发失明,推出诊断:急性闭角型青光眼,玻璃体积血,视网膜中央动脉阻塞,偏头痛,短暂性脑缺血发作,脑卒中,视网膜静脉阻塞,球后视神经炎,视网膜脱离,巨细胞动脉炎,脉络膜视网膜炎,癔症,皮质盲,视神经损伤,奎宁中毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    突发失明
        ${assert}    Create List    急性闭角型青光眼    玻璃体积血    视网膜中央动脉阻塞    偏头痛    短暂性脑缺血发作    脑卒中    视网膜静脉阻塞    球后视神经炎    视网膜脱离    巨细胞动脉炎    脉络膜视网膜炎    癔症    皮质盲    视神经损伤    奎宁中毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


176行-眼部瘙痒,推出诊断:变应性结膜炎,结膜炎,睑缘炎,泪道阻塞,睑外翻,睑内翻和倒睫,干眼症,湿疹,药物不良反应,多发性外眼异物,眼睑皮肤松弛症,皮脂腺腺癌,甲状腺相关性眼病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    眼部瘙痒
        ${assert}    Create List    变应性结膜炎    结膜炎    睑缘炎    泪道阻塞    睑外翻    睑内翻和倒睫    干眼症    湿疹    药物不良反应    多发性外眼异物    眼睑皮肤松弛症    皮脂腺腺癌    甲状腺相关性眼病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




177行-眼部刺激感,推出诊断:变应性结膜炎,结膜炎,睑缘炎,泪道阻塞,睑外翻,睑内翻和倒睫,干眼症,湿疹,药物不良反应,多发性外眼异物,眼睑皮肤松弛症,皮脂腺腺癌,甲状腺相关性眼病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    眼部刺激感
        ${assert}    Create List    变应性结膜炎    结膜炎    睑缘炎    泪道阻塞    睑外翻    睑内翻和倒睫    干眼症    湿疹    药物不良反应    多发性外眼异物    眼睑皮肤松弛症    皮脂腺腺癌    甲状腺相关性眼病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}


178行-结膜充血,推出诊断:急性结膜炎,虹膜炎,青光眼,角膜炎,角膜异物,巩膜炎,外伤,角膜溃疡,眶蜂窝织炎,颈内动脉海绵窦瘘,痛风,干眼症,结节病,结核病,弓形虫病,盘尾丝虫病,眼恶性肿瘤,鼻咽恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    结膜充血
        ${assert}    Create List    急性结膜炎    虹膜炎    青光眼    角膜炎    角膜异物    巩膜炎    外伤    角膜溃疡    眶蜂窝织炎    颈内动脉海绵窦瘘    痛风    干眼症    结节病    结核病    弓形虫病    盘尾丝虫病    眼恶性肿瘤    鼻咽恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



180行-毛发过多,推出诊断:多囊卵巢综合征,绝经期和女性更年期状态,神经性厌食,多毛症,药物相关性毛发过多,类固醇激素并发症,先天性肾上腺皮质增生症,卵巢肿瘤,肾上腺肿瘤,甲状腺功能减退症,迟发性皮肤卟啉症,库欣综合征,肢端肥大症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    毛发过多
        ${assert}    Create List    多囊卵巢综合征    绝经期和女性更年期状态    神经性厌食    多毛症    药物相关性毛发过多    类固醇激素并发症    先天性肾上腺皮质增生症    卵巢肿瘤    肾上腺肿瘤    甲状腺功能减退症    迟发性皮肤卟啉症    库欣综合征    肢端肥大症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



181行-毛发过多,推出诊断:神经性厌食,多毛症,药物相关性毛发过多,先天性肾上腺皮质增生症,肾上腺肿瘤,甲状腺功能减退症,迟发性皮肤卟啉症,库欣综合征,肢端肥大症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    毛发过多
        ${assert}    Create List    神经性厌食    多毛症    药物相关性毛发过多    先天性肾上腺皮质增生症    肾上腺肿瘤    甲状腺功能减退症    迟发性皮肤卟啉症    库欣综合征    肢端肥大症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"1","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




182行-头皮瘙痒,推出诊断:苔藓样皮炎,脓疱疮,头虱病,银屑病,脂溢性湿疹,变应性湿疹,真菌病,病毒性感染,抑郁状态
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    头皮瘙痒
        ${assert}    Create List    苔藓样皮炎    脓疱疮    头虱病    银屑病    脂溢性湿疹    变应性湿疹    真菌病    病毒性感染    抑郁状态
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




183行-妊娠+急性腹痛,推出诊断:流产,正常分娩,妊娠期肾盂肾炎,耻骨联合扭伤,便秘,异位妊娠,妊娠合并阑尾炎,子宫破裂,子宫扭转,子痫前期,卵巢蒂扭转,急性心肌梗死,子宫肌瘤,韧带损伤,出血性卵巢黄体囊肿,莫尔加尼囊状附件扭转,腹直肌鞘血肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    妊娠,急性腹痛
        ${assert}    Create List    流产    正常分娩    妊娠期肾盂肾炎    耻骨联合扭伤    便秘    异位妊娠    妊娠合并阑尾炎    子宫破裂    子宫扭转    子痫前期    卵巢蒂扭转    急性心肌梗死    子宫肌瘤    韧带损伤    出血性卵巢黄体囊肿    莫尔加尼囊状附件扭转    腹直肌鞘血肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




184行-皮肤鳞屑+皮肤斑块,推出诊断:银屑病,湿疹,真菌病,脂溢性皮炎,脂溢性角化病,苔藓样皮炎,扁平苔藓,日光性角化病,花斑癣,玫瑰糠疹,幼年跖部皮病,滴状银屑病,鲍恩病,蕈样肉芽肿,药物相关性鳞屑,药物相关性斑块,片层状鱼鳞癣,脓溢性皮肤角化病,慢性苔藓样糠疹,皮肤二期梅毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    皮肤鳞屑,皮肤斑块
        ${assert}    Create List    银屑病    湿疹    真菌病    脂溢性皮炎    脂溢性角化病    苔藓样皮炎    扁平苔藓    日光性角化病    花斑癣    玫瑰糠疹    幼年跖部皮病    滴状银屑病    鲍恩病    蕈样肉芽肿    药物相关性鳞屑    药物相关性斑块    片层状鱼鳞癣    脓溢性皮肤角化病    慢性苔藓样糠疹    皮肤二期梅毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




185行-慢性腹痛+腹胀,推出诊断:肠易激综合征,便秘,肠吸收不良,子宫平滑肌瘤,膀胱扩张,腹水,卵巢囊肿,乳糖不耐受,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,肾细胞癌
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    慢性腹痛,腹胀
        ${assert}    Create List    肠易激综合征    便秘    肠吸收不良    子宫平滑肌瘤    膀胱扩张    腹水    卵巢囊肿    乳糖不耐受    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    肾细胞癌
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




186行-反复腹痛+腹胀,推出诊断:肠易激综合征,便秘,肠吸收不良,子宫平滑肌瘤,膀胱扩张,腹水,卵巢囊肿,乳糖不耐受,胃恶性肿瘤,结肠恶性肿瘤,肝大,脾大,胰恶性肿瘤,肾细胞癌
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    反复腹痛,腹胀
        ${assert}    Create List    肠易激综合征    便秘    肠吸收不良    子宫平滑肌瘤    膀胱扩张    腹水    卵巢囊肿    乳糖不耐受    胃恶性肿瘤    结肠恶性肿瘤    肝大    脾大    胰恶性肿瘤    肾细胞癌
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




187行-腹胀+腹痛,推出诊断:急性胃肠炎,肠易激综合征,细菌性食物中毒,憩室炎,乳糖不耐受,肠梗阻,胰腺炎,腹膜炎,炎症性肠病,缺血性肠病,腹主动脉瘤破裂,胃恶性肿瘤,结肠恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹胀,腹痛
        ${assert}    Create List    急性胃肠炎    肠易激综合征    细菌性食物中毒    憩室炎    乳糖不耐受    肠梗阻    胰腺炎    腹膜炎    炎症性肠病    缺血性肠病    腹主动脉瘤破裂    胃恶性肿瘤    结肠恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




188行-腹泻+便秘,推出诊断:急性胃肠炎,肠易激综合征,胃肠功能性障碍,憩室炎,腹胀满病,乳糖不耐受,肠肿瘤,炎症性肠病,阑尾炎,原发性小肠吸收不良综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹泻,便秘
        ${assert}    Create List    急性胃肠炎    肠易激综合征    胃肠功能性障碍    憩室炎    腹胀满病    乳糖不耐受    肠肿瘤    炎症性肠病    阑尾炎    原发性小肠吸收不良综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




189行-腹胀+呕吐,推出诊断:胃肠炎,胃和十二指肠疾病,妊娠,胰腺炎,肠梗阻,幽门狭窄,胃恶性肿瘤,神经性贪食,便秘,糖尿病,胃轻瘫
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹胀,呕吐
        ${assert}    Create List    胃肠炎    胃和十二指肠疾病    妊娠    胰腺炎    肠梗阻    幽门狭窄    胃恶性肿瘤    神经性贪食    便秘    糖尿病    胃轻瘫
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




190行-腹胀+恶心,推出诊断:胃肠炎,胃和十二指肠疾病,妊娠,胰腺炎,肠梗阻,幽门狭窄,胃恶性肿瘤,神经性贪食,便秘,糖尿病,胃轻瘫
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹胀,恶心
        ${assert}    Create List    胃肠炎    胃和十二指肠疾病    妊娠    胰腺炎    肠梗阻    幽门狭窄    胃恶性肿瘤    神经性贪食    便秘    糖尿病    胃轻瘫
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




191行-腹痛+恶心,推出诊断:胃肠炎,胃和十二指肠疾病,阑尾炎,胰腺炎,肠梗阻,幽门狭窄,消化性溃疡,胃恶性肿瘤,神经性贪食,便秘,糖尿病,胃轻瘫,食管梗阻,贲门失弛缓症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,恶心
        ${assert}    Create List    胃肠炎    胃和十二指肠疾病    阑尾炎    胰腺炎    肠梗阻    幽门狭窄    消化性溃疡    胃恶性肿瘤    神经性贪食    便秘    糖尿病    胃轻瘫    食管梗阻    贲门失弛缓症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




192行-腹痛+呕吐,推出诊断:胃肠炎,胃和十二指肠疾病,阑尾炎,胰腺炎,肠梗阻,幽门狭窄,消化性溃疡,胃恶性肿瘤,神经性贪食,便秘,糖尿病,胃轻瘫,食管梗阻,贲门失弛缓症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,呕吐
        ${assert}    Create List    胃肠炎    胃和十二指肠疾病    阑尾炎    胰腺炎    肠梗阻    幽门狭窄    消化性溃疡    胃恶性肿瘤    神经性贪食    便秘    糖尿病    胃轻瘫    食管梗阻    贲门失弛缓症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}





193行-腹痛+呕血,推出诊断:消化性溃疡,食管贲门黏膜撕裂综合征,食管恶性肿瘤,胃恶性肿瘤,食管内异物,纵隔恶性肿瘤,胆管出血,食管腐蚀伤,腐蚀性胃炎,食管炎,食管破裂,门脉高压性胃肠病,胆囊十二指肠瘘,系统性红斑狼疮,手术后胃吻合口出血,食管裂孔疝,砷化物中毒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,呕血
        ${assert}    Create List    消化性溃疡    食管贲门黏膜撕裂综合征    食管恶性肿瘤    胃恶性肿瘤    食管内异物    纵隔恶性肿瘤    胆管出血    食管腐蚀伤    腐蚀性胃炎    食管炎    食管破裂    门脉高压性胃肠病    胆囊十二指肠瘘    系统性红斑狼疮    手术后胃吻合口出血    食管裂孔疝    砷化物中毒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




194行-腹痛+血尿,推出诊断:泌尿道感染,膀胱肿瘤,肾结石,输尿管结石,尿道炎,前列腺炎,前列腺癌,肾细胞癌,慢性间质性膀胱炎,肾盂肾炎,肾结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,血尿
        ${assert}    Create List    泌尿道感染    膀胱肿瘤    肾结石    输尿管结石    尿道炎    前列腺炎    前列腺癌    肾细胞癌    慢性间质性膀胱炎    肾盂肾炎    肾结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



195行-腹痛+尿频,推出诊断:膀胱炎,膀胱过度活动症,膀胱结石,前列腺炎,输尿管结石,尿道炎,肾盂肾炎,盆腔炎,膀胱颈狭窄,盆腔肿物,膀胱肿瘤,膀胱结核,肾结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,尿频
        ${assert}    Create List    膀胱炎    膀胱过度活动症    膀胱结石    前列腺炎    输尿管结石    尿道炎    肾盂肾炎    盆腔炎    膀胱颈狭窄    盆腔肿物    膀胱肿瘤    膀胱结核    肾结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



196行-腹痛+便秘,推出诊断:功能性便秘,胃肠功能障碍,肠易激综合征,炎症性肠病,肠梗阻,药物相关性便秘,先天性巨结肠,结肠恶性肿瘤,直肠恶性肿瘤,肠憩室病,后天性巨结肠,盆腔肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,便秘
        ${assert}    Create List    功能性便秘    胃肠功能障碍    肠易激综合征    炎症性肠病    肠梗阻    药物相关性便秘    先天性巨结肠    结肠恶性肿瘤    直肠恶性肿瘤    肠憩室病    后天性巨结肠    盆腔肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



197行-腹痛+便血,推出诊断:胃肠炎,直肠损伤,直肠恶性肿瘤,直肠憩室,绒毛状腺瘤,炎症性肠病,缺血性肠病,肠血管疾患,肠套叠,结肠恶性肿瘤,麦克尔憩室
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腹痛,便血
        ${assert}    Create List    胃肠炎    直肠损伤    直肠恶性肿瘤    直肠憩室    绒毛状腺瘤    炎症性肠病    缺血性肠病    肠血管疾患    肠套叠    结肠恶性肿瘤    麦克尔憩室
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



198行-乳房肿块+乳头溢液,推出诊断:导管内乳头状瘤,乳腺脓肿,乳腺炎,乳腺癌,乳腺纤维腺瘤,导管内乳头状癌,乳管上皮增生,产褥期积乳囊肿,浆细胞性乳腺炎,乳房佩吉特病,导管内乳头状黏液腺瘤,乳腺结核
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乳房肿块,乳头溢液
        ${assert}    Create List    导管内乳头状瘤    乳腺脓肿    乳腺炎    乳腺癌    乳腺纤维腺瘤    导管内乳头状癌    乳管上皮增生    产褥期积乳囊肿    浆细胞性乳腺炎    乳房佩吉特病    导管内乳头状黏液腺瘤    乳腺结核
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



199行-乳房肿块+乳房疼痛,推出诊断:乳腺囊性增生症,乳腺不典型增生,乳房孤立囊肿,乳腺脓肿,良性乳腺发育不良,乳管扩张症,脂肪瘤,乳腺癌,乳房佩吉特病,乳房脂肪坏死,产褥期积乳囊肿,弥漫性囊性乳腺病,乳腺结核,良性叶状瘤,乳腺血栓性静脉炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    乳房肿块,乳房疼痛
        ${assert}    Create List    乳腺囊性增生症    乳腺不典型增生    乳房孤立囊肿    乳腺脓肿    良性乳腺发育不良    乳管扩张症    脂肪瘤    乳腺癌    乳房佩吉特病    乳房脂肪坏死    产褥期积乳囊肿    弥漫性囊性乳腺病    乳腺结核    良性叶状瘤    乳腺血栓性静脉炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}



200行-胸痛+呼吸困难,推出诊断:肺部感染,心绞痛,气胸,急性心肌梗死,肺栓塞,焦虑状态,带状疱疹,肥厚型心肌病,肋骨骨折,心肌炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    胸痛,呼吸困难
        ${assert}    Create List    肺部感染    心绞痛    气胸    急性心肌梗死    肺栓塞    焦虑状态    带状疱疹    肥厚型心肌病    肋骨骨折    心肌炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




201行-胸痛+咯血,推出诊断:肺部感染,肺栓塞,肺恶性肿瘤,肺水肿,支气管扩张,结节性多动脉炎,肺结核,气管肿瘤,呼吸道内异物,系统性红斑狼疮,肺挫伤,ANCA相关性血管炎,曲霉病,肺肾综合征,白塞病,抗磷脂综合征
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    胸痛,咯血
        ${assert}    Create List    肺部感染    肺栓塞    肺恶性肿瘤    肺水肿    支气管扩张    结节性多动脉炎    肺结核    气管肿瘤    呼吸道内异物    系统性红斑狼疮    肺挫伤    ANCA相关性血管炎    曲霉病    肺肾综合征    白塞病    抗磷脂综合征
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




202行-胸痛+心悸,推出诊断:心绞痛,焦虑状态,急性心肌梗死,反流性食管炎,气胸,肺栓塞,肥厚型心肌病,心肌炎,主动脉夹层
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    胸痛,心悸
        ${assert}    Create List    心绞痛    焦虑状态    急性心肌梗死    反流性食管炎    气胸    肺栓塞    肥厚型心肌病    心肌炎    主动脉夹层
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




203行-呼吸困难+水肿,推出诊断:慢性阻塞性肺病,充血性心力衰竭,冠状动脉粥样硬化性心脏病,肺栓塞,心肌病,心脏瓣膜病,肺恶性肿瘤,胸腔积液,主动脉狭窄,由右向左分流的先天性心脏病,由左向右分流的先天性心脏病,肥胖症,腹水,肺动脉高压,缩窄性心包炎,心包积液
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呼吸困难,水肿
        ${assert}    Create List    慢性阻塞性肺病    充血性心力衰竭    冠状动脉粥样硬化性心脏病    肺栓塞    心肌病    心脏瓣膜病    肺恶性肿瘤    胸腔积液    主动脉狭窄    由右向左分流的先天性心脏病    由左向右分流的先天性心脏病    肥胖症    腹水    肺动脉高压    缩窄性心包炎    心包积液
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




204行-咳嗽+胸痛,推出诊断:急性下呼吸道感染,胃食管反流病,慢性阻塞性肺病,左心室衰竭,支气管扩张,吸入性肺炎,肺结核,肺肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咳嗽,胸痛
        ${assert}    Create List    急性下呼吸道感染    胃食管反流病    慢性阻塞性肺病    左心室衰竭    支气管扩张    吸入性肺炎    肺结核    肺肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




205行-咳嗽+咳痰,推出诊断:急性上呼吸道感染,急性下呼吸道感染,慢性阻塞性肺病,左心室衰竭,支气管扩张,吸入性肺炎,肺结核,肺肿瘤,间质性肺病,间质性纤维化性肺泡炎,过敏性肺炎,嗜酸细胞性肺炎,喉恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咳嗽,咳痰
        ${assert}    Create List    急性上呼吸道感染    急性下呼吸道感染    慢性阻塞性肺病    左心室衰竭    支气管扩张    吸入性肺炎    肺结核    肺肿瘤    间质性肺病    间质性纤维化性肺泡炎    过敏性肺炎    嗜酸细胞性肺炎    喉恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




206行-咳嗽+胸闷,推出诊断:急性上呼吸道感染,急性下呼吸道感染,胃食管反流病,支气管哮喘,慢性阻塞性肺病,左心室衰竭,支气管扩张,吸入性肺炎,肺结核,呼吸道内异物,药物不良反应,肺肿瘤,间质性肺病,间质性纤维化性肺泡炎,过敏性肺炎,嗜酸细胞性肺炎,喉恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    咳嗽,胸闷
        ${assert}    Create List    急性上呼吸道感染    急性下呼吸道感染    胃食管反流病    支气管哮喘    慢性阻塞性肺病    左心室衰竭    支气管扩张    吸入性肺炎    肺结核    呼吸道内异物    药物不良反应    肺肿瘤    间质性肺病    间质性纤维化性肺泡炎    过敏性肺炎    嗜酸细胞性肺炎    喉恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




207行-发热+腹痛,推出诊断:急性胃肠炎,消化性溃疡,胆绞痛,阑尾炎,胃肠炎,肾绞痛,胆囊炎,细菌性食物中毒,肠梗阻,肾盂肾炎,胰腺炎,消化道穿孔,腹膜炎,肝炎,炎症性肠病,缺血性肠病,自发性腹膜炎,带状疱疹,胃恶性肿瘤,结肠恶性肿瘤,糖尿病酮症酸中毒,憩室炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,腹痛
        ${assert}    Create List    急性胃肠炎    消化性溃疡    胆绞痛    阑尾炎    胃肠炎    肾绞痛    胆囊炎    细菌性食物中毒    肠梗阻    肾盂肾炎    胰腺炎    消化道穿孔    腹膜炎    肝炎    炎症性肠病    缺血性肠病    自发性腹膜炎    带状疱疹    胃恶性肿瘤    结肠恶性肿瘤    糖尿病酮症酸中毒    憩室炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}





208行-发热+呕血,推出诊断:急性胃粘膜病变,食管贲门黏膜撕裂综合征,食管静脉曲张伴有出血,食管恶性肿瘤,胃恶性肿瘤,食管内异物,纵隔恶性肿瘤,胆管出血,食管腐蚀伤,腐蚀性胃炎,食管炎,食管破裂,胆囊十二指肠瘘,白血病,再生障碍性贫血,系统性红斑狼疮
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,呕血
        ${assert}    Create List    急性胃粘膜病变    食管贲门黏膜撕裂综合征    食管静脉曲张伴有出血    食管恶性肿瘤    胃恶性肿瘤    食管内异物    纵隔恶性肿瘤    胆管出血    食管腐蚀伤    腐蚀性胃炎    食管炎    食管破裂    胆囊十二指肠瘘    白血病    再生障碍性贫血    系统性红斑狼疮
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




209行-发热+呕吐,推出诊断:急性胃肠炎,急性上呼吸道感染,阑尾炎,急腹症,胰腺炎,肠梗阻,迷路炎,药物相关性呕吐,幽门狭窄,消化性溃疡,胃恶性肿瘤,颅内压增高,脑膜炎,肾盂肾炎,肾衰竭
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,呕吐
        ${assert}    Create List    急性胃肠炎    急性上呼吸道感染    阑尾炎    急腹症    胰腺炎    肠梗阻    迷路炎    药物相关性呕吐    幽门狭窄    消化性溃疡    胃恶性肿瘤    颅内压增高    脑膜炎    肾盂肾炎    肾衰竭
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




210行-发热+腹泻,推出诊断:诺如病毒肠炎,大肠杆菌性肠炎,细菌性肠炎,肠道念珠菌病,急性上呼吸道感染,支气管肺炎,泌尿道感染
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,腹泻
        ${assert}    Create List    诺如病毒肠炎    大肠杆菌性肠炎    细菌性肠炎    肠道念珠菌病    急性上呼吸道感染    支气管肺炎    泌尿道感染
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




211行-发热+腹泻,推出诊断:感染性腹泻,急性胃肠炎,炎症性肠病,细菌性食物中毒,憩室炎,肠肿瘤,乳糜泻,阑尾炎,甲状腺功能亢进症,阿米巴病,卵巢恶性肿瘤,钩虫病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,腹泻
        ${assert}    Create List    感染性腹泻    急性胃肠炎    炎症性肠病    细菌性食物中毒    憩室炎    肠肿瘤    乳糜泻    阑尾炎    甲状腺功能亢进症    阿米巴病    卵巢恶性肿瘤    钩虫病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"14","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}





212行-发热+头痛,推出诊断:鼻窦炎,急性上呼吸道感染,慢性创伤后头痛,巨细胞动脉炎,蛛网膜下出血,脑膜炎,脑出血,大脑静脉非脓性血栓形成,颅内占位性病变,垂体卒中
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,头痛
        ${assert}    Create List    鼻窦炎    急性上呼吸道感染    慢性创伤后头痛    巨细胞动脉炎    蛛网膜下出血    脑膜炎    脑出血    大脑静脉非脓性血栓形成    颅内占位性病变    垂体卒中
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




213行-发热+鼻塞,推出诊断:鼻损伤,鼻腔异物,鼻腔恶性肿瘤,变应性肉芽肿性血管炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,鼻塞
        ${assert}    Create List    鼻损伤    鼻腔异物    鼻腔恶性肿瘤    变应性肉芽肿性血管炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




214行-发热+呼吸急促,推出诊断:慢性阻塞性肺病,肺部感染,胸腔积液,慢性阻塞性肺病伴有急性下呼吸道感染,肺炎,急性支气管炎,支气管扩张伴感染,急性喉气管炎,肺恶性肿瘤,间质性肺病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,呼吸急促
        ${assert}    Create List    慢性阻塞性肺病    肺部感染    胸腔积液    慢性阻塞性肺病伴有急性下呼吸道感染    肺炎    急性支气管炎    支气管扩张伴感染    急性喉气管炎    肺恶性肿瘤    间质性肺病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




215行-发热+胸痛,推出诊断:急性心包炎,肺炎,胸膜炎,胰腺炎,支气管炎,乳腺炎,肺腺癌,胸壁蜂窝织炎,胸膜肿瘤,食管癌,纵隔炎,纵隔气肿,纵隔肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,胸痛
        ${assert}    Create List    急性心包炎    肺炎    胸膜炎    胰腺炎    支气管炎    乳腺炎    肺腺癌    胸壁蜂窝织炎    胸膜肿瘤    食管癌    纵隔炎    纵隔气肿    纵隔肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




216行-发热+黄疸,推出诊断:自身免疫性溶血性贫血
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,黄疸
        ${assert}    Create List    自身免疫性溶血性贫血
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"27","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




217行-发热+黄疸,推出诊断:病毒性肝炎,胆管炎,胰腺炎,溶血性贫血
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,黄疸
        ${assert}    Create List    病毒性肝炎    胆管炎    胰腺炎    溶血性贫血
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




218行-发热+黄疸,推出诊断:病毒性肝炎,胆管炎,胰腺炎,肝恶性肿瘤,壶腹周围恶性肿瘤,胰头癌,败血症,钩端螺旋体病,胆管癌
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,黄疸
        ${assert}    Create List    病毒性肝炎    胆管炎    胰腺炎    肝恶性肿瘤    壶腹周围恶性肿瘤    胰头癌    败血症    钩端螺旋体病    胆管癌
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"20","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




219行-发热+颈部肿块,推出诊断:颈部淋巴结炎,甲状腺结节,甲状腺炎,甲状腺肿瘤,颈淋巴结肿大,颈淋巴结结核,颈部淋巴管瘤,颌下腺恶性肿瘤,转移性肿瘤,放线菌病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,颈部肿块
        ${assert}    Create List    颈部淋巴结炎    甲状腺结节    甲状腺炎    甲状腺肿瘤    颈淋巴结肿大    颈淋巴结结核    颈部淋巴管瘤    颌下腺恶性肿瘤    转移性肿瘤    放线菌病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




220行-发热+咽痛,推出诊断:急性扁桃体炎,扁桃体周脓肿,急性咽炎,链球菌性咽炎,咽后脓肿,病毒性咽炎,咽峡炎,传染性单核细胞增多症,白喉,会厌炎,口咽恶性肿瘤,念珠菌性口炎,急性甲状腺炎,亚急性甲状腺炎,淋球菌性咽炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,咽痛
        ${assert}    Create List    急性扁桃体炎    扁桃体周脓肿    急性咽炎    链球菌性咽炎    咽后脓肿    病毒性咽炎    咽峡炎    传染性单核细胞增多症    白喉    会厌炎    口咽恶性肿瘤    念珠菌性口炎    急性甲状腺炎    亚急性甲状腺炎    淋球菌性咽炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




221行-发热+颈部僵硬,推出诊断:病毒性上呼吸道感染,颈部淋巴结炎,颈部皮肤脓肿、疖和痈,脑膜炎,脑脓肿,脊柱骨折,骨肿瘤,脑出血,脑肿瘤,类风湿性关节炎,强直性脊柱炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,颈部僵硬
        ${assert}    Create List    病毒性上呼吸道感染    颈部淋巴结炎    颈部皮肤脓肿、疖和痈    脑膜炎    脑脓肿    脊柱骨折    骨肿瘤    脑出血    脑肿瘤    类风湿性关节炎    强直性脊柱炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




222行-发热+肌痛,推出诊断:病毒性感染,风湿性多肌痛,结缔组织病,恶性肿瘤,脊髓灰质炎
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    发热,肌痛
        ${assert}    Create List    病毒性感染    风湿性多肌痛    结缔组织病    恶性肿瘤    脊髓灰质炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




223行-耳鸣+眩晕,推出诊断:化脓性中耳炎,分泌性中耳炎,中耳和乳突疾患,偏头痛,粘连性中耳炎,梅尼埃病,动脉粥样硬化,听神经瘤,听神经炎,椎-基底动脉供血不足,颅内肿瘤,脑血管病,多发性硬化,颅内感染
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳鸣,眩晕
        ${assert}    Create List    化脓性中耳炎    分泌性中耳炎    中耳和乳突疾患    偏头痛    粘连性中耳炎    梅尼埃病    动脉粥样硬化    听神经瘤    听神经炎    椎-基底动脉供血不足    颅内肿瘤    脑血管病    多发性硬化    颅内感染
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




224行-耳痛+听力减退,推出诊断:耵聍栓塞,中耳炎,外耳道炎,咽鼓管炎,鼓膜穿孔,耳鼓膜创伤性破裂,颞骨骨折,听骨链中断,鼻咽良性肿瘤,鼻咽恶性肿瘤,外耳带状疱疹,气压伤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳痛,听力减退
        ${assert}    Create List    耵聍栓塞    中耳炎    外耳道炎    咽鼓管炎    鼓膜穿孔    耳鼓膜创伤性破裂    颞骨骨折    听骨链中断    鼻咽良性肿瘤    鼻咽恶性肿瘤    外耳带状疱疹    气压伤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




225行-耳痛+听力丧失,推出诊断:耵聍栓塞,中耳炎,外耳道炎,咽鼓管炎,鼓膜穿孔,耳鼓膜创伤性破裂,颞骨骨折,听骨链中断,鼻咽良性肿瘤,鼻咽恶性肿瘤,外耳带状疱疹,气压伤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    耳痛,听力丧失
        ${assert}    Create List    耵聍栓塞    中耳炎    外耳道炎    咽鼓管炎    鼓膜穿孔    耳鼓膜创伤性破裂    颞骨骨折    听骨链中断    鼻咽良性肿瘤    鼻咽恶性肿瘤    外耳带状疱疹    气压伤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}





226行-吞咽困难+颈部肿块,推出诊断:颌下腺恶性肿瘤,咽囊,转移性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    吞咽困难,颈部肿块
        ${assert}    Create List    颌下腺恶性肿瘤    咽囊    转移性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




227行-疼痛+跛行,推出诊断:外伤,髋关节滑膜炎,反应性关节炎,老年性关节炎,骨髓炎,风湿热,系统性红斑狼疮,化脓性关节炎,股骨上端(非创伤性)骨骺滑脱,先天性髋脱位,少关节性幼年型关节炎,幼年型类风湿性关节炎,骨恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    疼痛,跛行
        ${assert}    Create List    外伤    髋关节滑膜炎    反应性关节炎    老年性关节炎    骨髓炎    风湿热    系统性红斑狼疮    化脓性关节炎    股骨上端(非创伤性)骨骺滑脱    先天性髋脱位    少关节性幼年型关节炎    幼年型类风湿性关节炎    骨恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




228行-关节痛+低热,推出诊断:化脓性关节炎,创伤性关节炎,创伤后滑膜炎,风湿性多肌痛,类风湿性关节炎,赖特尔病,关节病型银屑病,髌肌腱炎,足菌肿,股骨头无菌性坏死,淋球菌性关节炎,风湿热,系统性红斑狼疮,丝虫病,莱姆病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    关节痛,低热
        ${assert}    Create List    化脓性关节炎    创伤性关节炎    创伤后滑膜炎    风湿性多肌痛    类风湿性关节炎    赖特尔病    关节病型银屑病    髌肌腱炎    足菌肿    股骨头无菌性坏死    淋球菌性关节炎    风湿热    系统性红斑狼疮    丝虫病    莱姆病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




229行-胸闷+踝部水肿,推出诊断:充血性心力衰竭,静脉功能不全,肥胖症,肝硬化,经前症候群,肾病,血管神经性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    胸闷,踝部水肿
        ${assert}    Create List    充血性心力衰竭    静脉功能不全    肥胖症    肝硬化    经前症候群    肾病    血管神经性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




230行-呼吸急促+踝部水肿,推出诊断:充血性心力衰竭,静脉功能不全,肥胖症,肝硬化,经前症候群,肾病,血管神经性水肿
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    呼吸急促,踝部水肿
        ${assert}    Create List    充血性心力衰竭    静脉功能不全    肥胖症    肝硬化    经前症候群    肾病    血管神经性水肿
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




231行-体重减轻+血尿,推出诊断:泌尿道感染,尿道炎,膀胱肿瘤,前列腺癌,肾炎,肾小球肾炎,肾结核,肾细胞癌,慢性间质性膀胱炎,多囊肾,血小板减少综合征,镰状细胞病,感染性心内膜炎,血吸虫病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    体重减轻,血尿
        ${assert}    Create List    泌尿道感染    尿道炎    膀胱肿瘤    前列腺癌    肾炎    肾小球肾炎    肾结核    肾细胞癌    慢性间质性膀胱炎    多囊肾    血小板减少综合征    镰状细胞病    感染性心内膜炎    血吸虫病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




232行-体重减轻+咳嗽,推出诊断:胃食管反流病,慢性阻塞性肺病,左心室衰竭,支气管扩张,咳嗽变异性哮喘,肺结核,肺肿瘤,间质性肺病,间质性纤维化性肺泡炎,喉恶性肿瘤
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    体重减轻,咳嗽
        ${assert}    Create List    胃食管反流病    慢性阻塞性肺病    左心室衰竭    支气管扩张    咳嗽变异性哮喘    肺结核    肺肿瘤    间质性肺病    间质性纤维化性肺泡炎    喉恶性肿瘤
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




233行-体重减轻+便血,推出诊断:上消化道出血,克罗恩病,溃疡性结肠炎,空肠憩室炎,空肠溃疡,麦克尔憩室,缺血性结肠炎,结肠憩室炎,结肠恶性肿瘤,直肠损伤,直肠息肉,小肠肿瘤,白血病,流行性出血热,钩虫病,阿米巴痢疾,血吸虫病,伤寒
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    体重减轻,便血
        ${assert}    Create List    上消化道出血    克罗恩病    溃疡性结肠炎    空肠憩室炎    空肠溃疡    麦克尔憩室    缺血性结肠炎    结肠憩室炎    结肠恶性肿瘤    直肠损伤    直肠息肉    小肠肿瘤    白血病    流行性出血热    钩虫病    阿米巴痢疾    血吸虫病    伤寒
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




234行-体重减轻+腹胀,推出诊断:慢性胃炎,反流性食管炎,胃十二指肠溃疡,炎症性肠病,缺血性肠病,肝炎,肝脓肿,抑郁状态,焦虑状态,慢性胰腺炎,肠易激综合征,溃疡性结肠炎,克罗恩病,结核性腹膜炎,麦克尔憩室,子宫颈癌,子宫内膜癌,卵巢癌,肝细胞癌,绒毛膜癌,肠道寄生虫病,胃恶性肿瘤,结肠恶性肿瘤,肾肿瘤,膀胱肿瘤,输尿管肿瘤,结肠肿瘤,血卟啉病,铅中毒,肾上腺皮质功能减退症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    体重减轻,腹胀
        ${assert}    Create List    慢性胃炎    反流性食管炎    胃十二指肠溃疡    炎症性肠病    缺血性肠病    肝炎    肝脓肿    抑郁状态    焦虑状态    慢性胰腺炎    肠易激综合征    溃疡性结肠炎    克罗恩病    结核性腹膜炎    麦克尔憩室    子宫颈癌    子宫内膜癌    卵巢癌    肝细胞癌    绒毛膜癌    肠道寄生虫病    胃恶性肿瘤    结肠恶性肿瘤    肾肿瘤    膀胱肿瘤    输尿管肿瘤    结肠肿瘤    血卟啉病    铅中毒    肾上腺皮质功能减退症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




235行-异常步态+肢体活动障碍,推出诊断:关节炎,脑血管意外,帕金森病,间歇性跛行,腓总神经麻痹,多发性硬化,腰骶神经根炎,马尾损伤,重症肌无力,脊髓痨,强直性肌营养不良,运动神经元病,小脑共济失调,癔症
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    异常步态,肢体活动障碍
        ${assert}    Create List    关节炎    脑血管意外    帕金森病    间歇性跛行    腓总神经麻痹    多发性硬化    腰骶神经根炎    马尾损伤    重症肌无力    脊髓痨    强直性肌营养不良    运动神经元病    小脑共济失调    癔症
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




236行-腰痛+血尿,推出诊断:泌尿道感染,肾结石,输尿管结石,膀胱肿瘤,肾炎,肾小球肾炎,尿道损伤,肾结核,肾细胞癌,慢性间质性膀胱炎,多囊肾,血吸虫病
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腰痛,血尿
        ${assert}    Create List    泌尿道感染    肾结石    输尿管结石    膀胱肿瘤    肾炎    肾小球肾炎    尿道损伤    肾结核    肾细胞癌    慢性间质性膀胱炎    多囊肾    血吸虫病
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




237行-腰痛+腹痛,推出诊断:急性胃肠炎,消化性溃疡,胆囊炎,胆石病,急性阑尾炎,急性心肌梗死,肾绞痛,肠梗阻,急性腹膜炎,消化道穿孔,肾盂肾炎,心绞痛,急性出血坏死性肠炎,肝炎,炎症性肠病,缺血性肠病,主动脉夹层,肠扭转,自发性腹膜炎,腹主动脉瘤破裂,门静脉血栓形成,腹壁挫伤,带状疱疹,胸膜炎,憩室炎,食管裂孔疝,泌尿道感染,慢性胰腺炎,肠易激综合征,溃疡性结肠炎,
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    腰痛,腹痛
        ${assert}    Create List    急性胃肠炎    消化性溃疡    胆囊炎    胆石病    急性阑尾炎    急性心肌梗死    肾绞痛    肠梗阻    急性腹膜炎    消化道穿孔    肾盂肾炎    心绞痛    急性出血坏死性肠炎    肝炎    炎症性肠病    缺血性肠病    主动脉夹层    肠扭转    自发性腹膜炎    腹主动脉瘤破裂    门静脉血栓形成    腹壁挫伤    带状疱疹    胸膜炎    憩室炎    食管裂孔疝    泌尿道感染    慢性胰腺炎    肠易激综合征    溃疡性结肠炎
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




238行-停经+下腹痛,推出诊断:先兆流产,稽留流产,异位妊娠,先兆早产不伴分娩,先兆临产,胎膜早破
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    停经,下腹痛
        ${assert}    Create List    先兆流产    稽留流产    异位妊娠    先兆早产不伴分娩    先兆临产    胎膜早破
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}




239行-急性腹痛,推出诊断:急性胃肠炎,消化性溃疡,急性胆囊炎,急性阑尾炎,急性心肌梗死,肾绞痛,肠梗阻,急性腹膜炎,消化道穿孔,肾盂肾炎,心绞痛,急性出血坏死性肠炎,肝炎,炎症性肠病,缺血性肠病,主动脉夹层,肠扭转,自发性腹膜炎,腹主动脉瘤破裂,门静脉血栓形成,腹壁挫伤,带状疱疹,胸膜炎,肠易激综合征,便秘,细菌性食物中毒,憩室炎,胃恶性肿瘤,结肠恶性肿瘤,食管裂孔疝
        [Documentation]    断言:""
        ${Assessment}    Set Variable
        ${Subjective}    Set Variable    急性腹痛
        ${assert}    Create List    急性胃肠炎    消化性溃疡    急性胆囊炎    急性阑尾炎    急性心肌梗死    肾绞痛    肠梗阻    急性腹膜炎    消化道穿孔    肾盂肾炎    心绞痛    急性出血坏死性肠炎    肝炎    炎症性肠病    缺血性肠病    主动脉夹层    肠扭转    自发性腹膜炎    腹主动脉瘤破裂    门静脉血栓形成    腹壁挫伤    带状疱疹    胸膜炎    肠易激综合征    便秘    细菌性食物中毒    憩室炎    胃恶性肿瘤    结肠恶性肿瘤    食管裂孔疝
        [Setup]    Run Keywords    获取时间戳
        ...    AND    获取随机数
        ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=
        ...    doctorGuid=675    doctorName=hmkj
        ...    patientInfo={"gender":"0","age":"51","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
        ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
        ...    definiteDiagnosis=
        ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"诊断依据及鉴别诊断","value":""},{"key":"病例特点","value":""},{"key":"出院医嘱","value":""},{"key": "诊断依据及鉴别诊断1","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
        ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGid":"","recordTime":""}
        ...    labTestList=
        ...    examinationList=
        ...    newTestList=
        ...    operationRecord=
        ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}
        ...    newRecogFlag=1
        #####推荐检查评估表
        # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
        #####推荐检查
        # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
        ######检查解读
        # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
        ######质控
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['qualityControlResponse']['therapeuticPlanList']]
        # Should Contain    ${aj}    流行性感冒
        #####推荐治疗方案
        # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
        #####疑似诊断
        ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
        # Lists should Be Equal    ${aj}    ${assert}
        List Should Contain Sub List    ${aj}    ${assert}

