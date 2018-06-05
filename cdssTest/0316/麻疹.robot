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
# ----pregnancyStatus Integer 否   二尖瓣反流束面积(0-4)cm2妊娠状况  1: 怀孕  0：未怀孕
# ----bodyTempr   Double  否   体温
# ----heartRate   Integer 否   心率
# ----lowBldPress Double  否   舒张压-低压
# ----highBldPress    Double  否   收缩压-高压
*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***

# #######
#######麻疹###

麻疹-主诉:男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血，推荐疑似诊断:麻疹
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    麻疹


麻疹-点击疑似诊断或手动输入：麻疹，推荐检查：麻疹病毒IgM抗体测定、咽拭子麻疹病毒核酸检测、尿液麻疹病毒核酸检测、咽拭子麻疹病毒分离、尿液麻疹病毒分离、血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    麻疹病毒IgM抗体测定    咽拭子麻疹病毒核酸检测    咽拭子麻疹病毒分离    尿液麻疹病毒核酸检测    尿液麻疹病毒分离    血常规
    ${Assessment}    Set Variable    麻疹
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    麻疹

麻疹-点击疑似诊断或手动输入：麻疹，推荐治疗：维生素A、退热治疗、镇静治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    维生素A    退热治疗    镇静治疗
    ${Assessment}    Set Variable    麻疹
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    麻疹

麻疹-点击疑似诊断或手动输入：麻疹，推荐评估表：麻疹分型评估表
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    维生素A    退热治疗    镇静治疗
    ${Assessment}    Set Variable    麻疹
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}    麻疹分型评估表
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    麻疹

麻疹-病历内容增加：麻疹合并脑炎，推荐治疗增加：麻疹合并脑炎治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    维生素A    退热治疗    镇静治疗    麻疹合并脑炎治疗
    ${Assessment}    Set Variable    麻疹
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血，麻疹合并脑炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    麻疹

麻疹-病历内容增加：麻疹合并脑炎，推荐检查增加：脑脊液生化检查、脑脊液常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    麻疹病毒IgM抗体测定    咽拭子麻疹病毒核酸检测    咽拭子麻疹病毒分离    尿液麻疹病毒核酸检测    尿液麻疹病毒分离    血常规    脑脊液生化检查    脑脊液常规
    ${Assessment}    Set Variable    麻疹
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血，麻疹合并脑炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    麻疹

麻疹-手动输入评估表结果：重型麻疹，推荐治疗增加：重型麻疹治疗、麻疹合并肺炎治疗、麻疹合并喉炎治疗、麻疹合并心肌炎治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    维生素A    退热治疗    镇静治疗    重型麻疹治疗    麻疹合并肺炎治疗    麻疹合并喉炎治疗    麻疹合并脑炎治疗    麻疹合并心肌炎治疗
    ${Assessment}    Set Variable    麻疹
    ${Subjective}    Set Variable    男，2岁，发热6天，皮疹2天。6天前，患儿开始发烧，体温持续在38～39℃，伴流涕，流眼泪，2天前患儿头面部出现鲜红色皮疹，逐渐蔓延到全身。查体：全身皮肤弥漫鲜红色斑丘疹，稍高出皮肤表面，压之退色，口腔麻疹黏膜斑，结膜充血，麻疹合并脑炎，重型麻疹
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    麻疹





