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


############儿童急性支气管炎#############

儿童急性支气管炎-病史：男，5岁，于6小时前出现咳嗽、咳痰伴发热，痰不易咳出，无呕吐、腹泻、抽搐、盗汗，肺部听诊双肺呼吸音粗，可闻及干啰音，推荐疑似诊断:支气管炎
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，5岁，于6小时前出现咳嗽、咳痰伴发热，痰不易咳出，无呕吐、腹泻、抽搐、盗汗，肺部听诊双肺呼吸音粗，可闻及干啰音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    支气管炎
    # Lists Should Be Equal    ${aj}    ${assert}


儿童急性支气管炎-手动输入诊断：急性支气管炎，推荐检查:血清超敏C反应蛋白、血常规、尿常规、粪便常规、肝功能、肾功能、呼吸道病原检测、痰支原体培养、衣原体抗原测定、心肌酶谱检查、血气分析、心电图、胸部X线(正侧位)、胸部CT、肺功能检查、免疫球蛋白检查、过敏原试验、纤维支气管镜检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    过敏原试验    肺功能检查    胸部CT    呼吸道病原检测    胸部X线(正侧位)    衣原体抗原测定    痰支原体培养    心肌酶谱检查    纤维支气管镜检查    免疫球蛋白检查    尿常规    粪便常规    血常规    肝功能    肾功能    血清超敏C反应蛋白    心电图    血气分析
    ${Assessment}    Set Variable    急性支气管炎
    ${Subjective}    Set Variable    男，5岁，于6小时前出现咳嗽、咳痰伴发热，痰不易咳出，无呕吐、腹泻、抽搐、盗汗，肺部听诊双肺呼吸音粗，可闻及干啰音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    支气管炎
    Lists Should Be Equal    ${aj}    ${assert}


儿童急性支气管炎-手动输入诊断：急性支气管炎，推荐治疗:抗生素治疗、对症治疗、加强呼吸道护理
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    抗生素治疗    对症治疗    加强呼吸道护理
    ${Assessment}    Set Variable    急性支气管炎
    ${Subjective}    Set Variable    男，5岁，于6小时前出现咳嗽、咳痰伴发热，痰不易咳出，无呕吐、腹泻、抽搐、盗汗，肺部听诊双肺呼吸音粗，可闻及干啰音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    支气管炎
    Lists Should Be Equal    ${aj}    ${assert}

