*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名   类型  是否必须    说明
# userGuid    String  是   患者唯一编号
# serialNumber    String  是   住院病历唯一编号
# patientInfo Object  是   患者信息
# ----gender  Integer 否   性别0女,1男,  2 其他
# ----age double  是   年龄
# ----ageType String  是   岁、月、天
# ----maritalStatus   Integer 否   婚姻状况  0：未婚 ,1: 已婚, 2:其他
# ----pregnancyStatus Integer 否   妊娠状况  1: 怀孕  0：未怀孕
# ----bodyTempr   Double  否   体温
# ----heartRate   Integer 否   心率
# ----lowBldPress Double  否   舒张压-低压
# ----highBldPress    Double  否   收缩压-高压
*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############慢性髓系白血病#############

慢性髓系白血病-病史：男，年龄55岁，3个月前肚子越来越大，体重增长6斤，经常觉得乏力，低热，白细胞计数及血小板均升高,检查结果输入：骨髓象显示为慢性髓系白血病,推荐疑似诊断：慢性髓系白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    病史：男，年龄55岁，3个月前肚子越来越大，体重增长6斤，经常觉得乏力，低热，白细胞计数及血小板均升高,检查结果输入：骨髓象显示为慢性髓系白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    慢性髓系白血病
    # Lists Should Be Equal    ${aj}    ${assert}



慢性髓系白血病-点击疑似诊断或手动输入：慢性髓系白血病,推荐检查:血常规、外周血涂片、荧光原位杂交检测 BCR-ABL基因重排、定性逆转录聚合酶链反 应检测BCR-ABL基因重排、JAK2 V617F或其 他突变的基因检测、电解质全套、肝功能、 肾功能、血糖、心电图、骨髓穿刺活检、荧 光原位杂交检测Ph染色体、定性逆转录聚合 酶链反应检测Ph染色体、骨髓血涂片、胸部X 线(正侧位)、HLA配型检查、血型
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    血常规    外周血涂片    荧光原位杂交检测 BCR-ABL基因重排    定性逆转录聚合酶链反 应检测BCR-ABL基因重排    JAK2 V617F或其 他突变的基因检测    电解质全套    肝功能     肾功能    血糖    心电图    骨髓穿刺活检    荧 光原位杂交检测Ph染色体    定性逆转录聚合 酶链反应检测Ph染色体    骨髓血涂片    胸部X 线(正侧位)    HLA配型检查    血型
    ${Assessment}    Set Variable    慢性髓系白血病
    ${Subjective}    Set Variable    男，年龄55岁，3个月前肚子越来越大，体重增长6斤，经常觉得乏力，低热，白细胞计数及血小板均升高,检查结果输入：骨髓象显示为慢性髓系白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    慢性髓系白血病
    # Lists Should Be Equal    ${aj}    ${assert}


慢性髓系白血病-点击疑似诊断或手动输入：慢性髓系白血病,推荐治疗增加:首选伊马替尼靶向药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List    血常规    外周血涂片    荧光原位杂交检测 BCR-ABL基因重排    定性逆转录聚合酶链反 应检测BCR-ABL基因重排    JAK2 V617F或其 他突变的基因检测    电解质全套    肝功能     肾功能    血糖    心电图    骨髓穿刺活检    荧 光原位杂交检测Ph染色体    定性逆转录聚合 酶链反应检测Ph染色体    骨髓血涂片    胸部X 线(正侧位)    HLA配型检查    血型
    ${Assessment}    Set Variable    慢性髓系白血病
    ${Subjective}    Set Variable    男，年龄55岁，3个月前肚子越来越大，体重增长6斤，经常觉得乏力，低热，白细胞计数及血小板均升高,检查结果输入：骨髓象显示为慢性髓系白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    首选伊马替尼靶向药物治疗
    # Lists Should Be Equal    ${aj}    ${assert}




慢性髓系白血病-病历内容增加：白细胞淤滞,推荐治疗增加：羟基脲等防治白细胞淤滞
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    首选伊马替尼靶向药物治疗    羟基脲等防治白细胞淤滞
    ${Assessment}    Set Variable    慢性髓系白血病
    ${Subjective}    Set Variable    男，年龄55岁，3个月前肚子越来越大，体重增长6斤，经常觉得乏力，低热，白细胞计数及血小板均升高,检查结果输入：骨髓象显示为慢性髓系白血病,白细胞淤滞,
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    首选伊马替尼靶向药物治疗
    Lists Should Be Equal    ${aj}    ${assert}




慢性髓系白血病-病历内容增加：羟基脲治疗无效,推荐治疗删除：羟基脲等防治白细胞淤滞,治疗方案增加:白细胞去除术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    首选伊马替尼靶向药物治疗    白细胞去除术
    ${Assessment}    Set Variable    慢性髓系白血病
    ${Subjective}    Set Variable    男，年龄55岁，3个月前肚子越来越大，体重增长6斤，经常觉得乏力，低热，白细胞计数及血小板均升高,检查结果输入：骨髓象显示为慢性髓系白血病,白细胞淤滞,羟基脲治疗无效
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"55","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    首选伊马替尼靶向药物治疗
    Lists Should Be Equal    ${aj}    ${assert}








