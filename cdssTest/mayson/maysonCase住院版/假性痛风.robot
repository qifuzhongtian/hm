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
# ----highBldPress    Double  否   收缩压-高w压
*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############假性痛风#############

假性痛风-病史:主诉：男，39岁，突发右肩疼痛5天，关节疼痛伴关节活动受限，压之疼痛明显伴明显肿胀,检查结果输入：右肩关节正位X线片，见肱盂关节狭窄，软骨下骨质硬化及骨赘形成。关节面肥大，但肱骨头未见半脱位、骨质破坏和软组织肿块，推荐疑似诊断:痛风
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉：男，39岁，突发右肩疼痛5天，关节疼痛伴关节活动受限，压之疼痛明显伴明显肿胀,检查结果输入：右肩关节正位X线片，见肱盂关节狭窄，软骨下骨质硬化及骨赘形成。关节面肥大，但肱骨头未见半脱位、骨质破坏和软组织肿块
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    痛风
    # Lists Should Be Equal    ${aj}    ${assert}


假性痛风-病史:手动输入诊断：假性痛风，推荐检查:关节腔穿刺、关节X线、血钙、血清铁 (SI)、血清总铁结合力(TIBC)、血清转 铁蛋白饱和度(TSAT)、血清促甲状腺激素 测定(TSH)、血清镁、血常规、红细胞沉降 率(ESR)、C-反应蛋白、肝功能(ALT、AST、 白蛋白)、关节双能CT、肾功能
    [Documentation]    断言:""肉谁巨额玩烤奶C级覅待见掉分就掉来犯
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    关节腔穿刺    关节X线    血钙    血清铁 (SI)    血清总铁结合力(TIBC)    血清转铁蛋白饱和度(TSAT)    血清促甲状腺激素 测定(TSH)    血清镁    血常规    红细胞沉降 率(ESR)    C-反应蛋白    肝功能(ALT    AST     白蛋白)    关节双能CT    肾功能
    ${Assessment}    Set Variable    假性痛风
    ${Subjective}    Set Variable    主诉：男，39岁，突发右肩疼痛5天，关节疼痛伴关节活动受限，压之疼痛明显伴明显肿胀,检查结果输入：右肩关节正位X线片，见肱盂关节狭窄，软骨下骨质硬化及骨赘形成。关节面肥大，但肱骨头未见半脱位、骨质破坏和软组织肿块
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    痛风
    Lists Should Be Equal    ${aj}    ${assert}




假性痛风-病史:手动输入诊断：假性痛风，推荐治疗:NSAIDs治疗假性痛风、秋水仙碱治疗假性痛风、皮质类固醇激素治疗假性痛风、关节腔注射治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    NSAIDs治疗假性痛风    秋水仙碱治疗假性痛风    皮质类固醇激素治疗假性痛风    关节腔注射治疗
    ${Assessment}    Set Variable    假性痛风
    ${Subjective}    Set Variable    主诉：男，39岁，突发右肩疼痛5天，关节疼痛伴关节活动受限，压之疼痛明显伴明显肿胀,检查结果输入：右肩关节正位X线片，见肱盂关节狭窄，软骨下骨质硬化及骨赘形成。关节面肥大，但肱骨头未见半脱位、骨质破坏和软组织肿块
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    痛风
    Lists Should Be Equal    ${aj}    ${assert}






假性痛风-病历内容增加：二水焦磷酸钙暴露,推荐治疗增加:预防假性痛风药物
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    NSAIDs治疗假性痛风    秋水仙碱治疗假性痛风    皮质类固醇激素治疗假性痛风    关节腔注射治疗    预防假性痛风药物
    ${Assessment}    Set Variable    假性痛风
    ${Subjective}    Set Variable    主诉：男，39岁，突发右肩疼痛5天，关节疼痛伴关节活动受限，压之疼痛明显伴明显肿胀,检查结果输入：右肩关节正位X线片，见肱盂关节狭窄，软骨下骨质硬化及骨赘形成。关节面肥大，但肱骨头未见半脱位、骨质破坏和软组织肿块,二水焦磷酸钙暴露
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    痛风
    Lists Should Be Equal    ${aj}    ${assert}



