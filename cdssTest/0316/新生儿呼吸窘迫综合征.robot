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


############新生儿呼吸窘迫综合征#############

新生儿呼吸窘迫综合征-病史：男，2天，早产儿，胎龄36周时娩出，出现三凹征，皮肤紫绀，血氧饱和度降低，推荐疑似诊断:新生儿呼吸窘迫综合征
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，2天，早产儿，胎龄36周时娩出，出现三凹征，皮肤紫绀，血氧饱和度降低
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    新生儿呼吸窘迫综合征
    # Lists Should Be Equal    ${aj}    ${assert}



新生儿呼吸窘迫综合征-点击疑似诊断或手动输入：新生儿呼吸窘迫综合征，推荐检查:尿常规、粪便常规、血常规、C-反应蛋白、血气分析、血生化、血电解质、心脏超声检查、胸部X线(正侧位)、痰培养、血培养、血糖监测、TORCH检查、总胆红素测定、凝血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    血培养    胸部X线(正侧位)    TORCH检查    心脏超声检查    尿常规    血糖监测    总胆红素测定    粪便常规    C-反应蛋白    血气分析    痰培养    血常规    血电解质    凝血常规    血生化
    ${Assessment}    Set Variable    新生儿呼吸窘迫综合征
    ${Subjective}    Set Variable    男，2天，早产儿，胎龄36周时娩出，出现三凹征，皮肤紫绀，血氧饱和度降低
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    新生儿呼吸窘迫综合征
    Lists Should Be Equal    ${aj}    ${assert}




新生儿呼吸窘迫综合征-点击疑似诊断或手动输入：新生儿呼吸窘迫综合征，推荐评估表:新生儿机械通气使用前评估
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    新生儿机械通气使用前评估
    ${Assessment}    Set Variable    新生儿呼吸窘迫综合征
    ${Subjective}    Set Variable    男，2天，早产儿，胎龄36周时娩出，出现三凹征，皮肤紫绀，血氧饱和度降低
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    新生儿呼吸窘迫综合征
    Lists Should Be Equal    ${aj}    ${assert}




新生儿呼吸窘迫综合征-点击疑似诊断或手动输入：新生儿呼吸窘迫综合征，推荐治疗:肺表面活性物质PS治疗、呼吸支持治疗、防治代谢性酸中毒、抗感染治疗、营养支持治疗、其他治疗用药、防治并发症
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    肺表面活性物质PS治疗    呼吸支持治疗    防治代谢性酸中毒    抗感染治疗    营养支持治疗    其他治疗用药    防治并发症
    ${Assessment}    Set Variable    新生儿呼吸窘迫综合征
    ${Subjective}    Set Variable    男，2天，早产儿，胎龄36周时娩出，出现三凹征，皮肤紫绀，血氧饱和度降低
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    新生儿呼吸窘迫综合征
    Lists Should Be Equal    ${aj}    ${assert}


新生儿呼吸窘迫综合征-补充病历内容：动脉导管未闭，推荐治疗增加:促动脉导管闭合药物治疗、手术治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    肺表面活性物质PS治疗    呼吸支持治疗    防治代谢性酸中毒    抗感染治疗    营养支持治疗    其他治疗用药    促动脉导管闭合药物治疗    手术治疗    防治并发症
    ${Assessment}    Set Variable    新生儿呼吸窘迫综合征
    ${Subjective}    Set Variable    男，2天，早产儿，胎龄36周时娩出，出现三凹征，皮肤紫绀，血氧饱和度降低,动脉导管未闭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"2","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    新生儿呼吸窘迫综合征
    Lists Should Be Equal    ${aj}    ${assert}


