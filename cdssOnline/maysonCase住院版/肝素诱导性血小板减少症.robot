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


############肝素诱导性血小板减少症#############

肝素诱导性血小板减少症-主诉：女性，59岁，活动后气短2年，突发晕厥4日，入院后因患者生命体征稳定，没有明显的右心衰竭，且有头部皮下血肿，予皮下注射依诺肝素钠6000U q12h抗凝治疗。抗凝治疗8天后复查血常规发现血小板减少，最低71×109/L，大便潜血（+）,推荐疑似诊断：血小板减少症
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女性，59岁，活动后气短2年，突发晕厥4日，入院后因患者生命体征稳定，没有明显的右心衰竭，且有头部皮下血肿，予皮下注射依诺肝素钠6000U q12h抗凝治疗。抗凝治疗8天后复查血常规发现血小板减少，最低71×109/L，大便潜血（+）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    血小板减少症
    # Lists Should Be Equal    ${aj}    ${assert}


肝素诱导性血小板减少症-手动输入诊断：怀疑肝素诱导性血小板减少症,推荐检查：全血细胞计数、HIT相关抗体免疫学检测、下肢血管超声
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    全血细胞计数    HIT相关抗体免疫学检测    下肢血管超声
    ${Assessment}    Set Variable    怀疑肝素诱导性血小板减少症
    ${Subjective}    Set Variable    女性，59岁，活动后气短2年，突发晕厥4日，入院后因患者生命体征稳定，没有明显的右心衰竭，且有头部皮下血肿，予皮下注射依诺肝素钠6000U q12h抗凝治疗。抗凝治疗8天后复查血常规发现血小板减少，最低71×109/L，大便潜血（+）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    血小板减少症
    Lists Should Be Equal    ${aj}    ${assert}


肝素诱导性血小板减少症-手动输入诊断：怀疑肝素诱导性血小板减少症,推荐评估表：肝素诱导的血小板减少症HIT 4Ts*预测评分模型
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List    全血细胞计数    HIT相关抗体免疫学检测    下肢血管超声
    ${Assessment}    Set Variable    怀疑肝素诱导性血小板减少症
    ${Subjective}    Set Variable    女性，59岁，活动后气短2年，突发晕厥4日，入院后因患者生命体征稳定，没有明显的右心衰竭，且有头部皮下血肿，予皮下注射依诺肝素钠6000U q12h抗凝治疗。抗凝治疗8天后复查血常规发现血小板减少，最低71×109/L，大便潜血（+）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    肝素诱导的血小板减少症HIT 4Ts*预测评分模型
    # Lists Should Be Equal    ${aj}    ${assert}



肝素诱导性血小板减少症-明确诊断：肝素诱导性血小板减少症,推荐治疗：停用所有肝素制品、凝血酶抑制剂(DTI)治疗、抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    停用所有肝素制品    凝血酶抑制剂(DTI)治疗    抗凝治疗
    ${Assessment}    Set Variable    怀疑肝素诱导性血小板减少症
    ${Subjective}    Set Variable    女性，59岁，活动后气短2年，突发晕厥4日，入院后因患者生命体征稳定，没有明显的右心衰竭，且有头部皮下血肿，予皮下注射依诺肝素钠6000U q12h抗凝治疗。抗凝治疗8天后复查血常规发现血小板减少，最低71×109/L，大便潜血（+）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    肝素诱导的血小板减少症HIT 4Ts*预测评分模型
    Lists Should Be Equal    ${aj}    ${assert}



肝素诱导性血小板减少症-手动增加评估表结果：HIT评分4分,推荐检查增加：肝素-PF4抗体(HIT)检测
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    全血细胞计数    HIT相关抗体免疫学检测    下肢血管超声    肝素-PF4抗体(HIT)检测
    ${Assessment}    Set Variable    怀疑肝素诱导性血小板减少症
    ${Subjective}    Set Variable    女性，59岁，活动后气短2年，突发晕厥4日，入院后因患者生命体征稳定，没有明显的右心衰竭，且有头部皮下血肿，予皮下注射依诺肝素钠6000U q12h抗凝治疗。抗凝治疗8天后复查血常规发现血小板减少，最低71×109/L，大便潜血（+）,HIT评分4分
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    肝素诱导的血小板减少症HIT 4Ts*预测评分模型
    Lists Should Be Equal    ${aj}    ${assert}

