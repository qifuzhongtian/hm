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
#######胸主动脉瘤###

胸主动脉瘤-主诉:男，59岁，咳嗽、闷气、上腹部疼痛不适1月，加重1周。高血压病史10年，糖尿病病史1年。胸部CT检查提示为胸主动脉瘤，推荐疑似诊断:胸主动脉瘤
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，59岁，咳嗽、闷气、上腹部疼痛不适1月，加重1周。高血压病史10年，糖尿病病史1年。胸部CT检查提示为胸主动脉瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    胸主动脉瘤

胸主动脉瘤-点击疑似诊断或手动输入：胸主动脉瘤，推荐检查：超声心动图、胸主动脉造影成像（CTA）、心电图(ECG)门控技术、胸主动脉磁共振血管造影(MRA)
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    胸主动脉造影成像（CTA）    胸主动脉磁共振血管造影(MRA)    心电图(ECG)门控技术    超声心动图
    ${Assessment}    Set Variable    胸主动脉瘤
    ${Subjective}    Set Variable    男，59岁，咳嗽、闷气、上腹部疼痛不适1月，加重1周。高血压病史10年，糖尿病病史1年。胸部CT检查提示为胸主动脉瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    胸主动脉瘤

胸主动脉瘤-点击疑似诊断或手动输入：胸主动脉瘤，推荐治疗：升主动脉瘤监测与管理、主动脉弓动脉瘤监测与管理、降主动脉瘤监测与管理、一般治疗、ARB、控制高血压
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    控制高血压    一般治疗    升主动脉瘤监测与管理    主动脉弓动脉瘤监测与管理    降主动脉瘤监测与管理    ARB
    ${Assessment}    Set Variable    胸主动脉瘤
    ${Subjective}    Set Variable    男，59岁，咳嗽、闷气、上腹部疼痛不适1月，加重1周。高血压病史10年，糖尿病病史1年。胸部CT检查提示为胸主动脉瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    胸主动脉瘤

胸主动脉瘤-诊断调整为：胸主动脉夹层，推荐评估表：胸主动脉夹层的分类系统-Stanford分类系统、胸主动脉夹层的分类系统-DeBakey分类系统
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    胸主动脉夹层的分类系统-Stanford分类系统    胸主动脉夹层的分类系统-DeBakey分类系统
    ${Assessment}    Set Variable    胸主动脉夹层
    ${Subjective}    Set Variable    男，59岁，咳嗽、闷气、上腹部疼痛不适1月，加重1周。高血压病史10年，糖尿病病史1年。胸部CT检查提示为胸主动脉瘤，胸主动脉夹层
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Lists Should Be Equal    ${aj}    ${assert}
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
    #Should Contain    ${aj[:5]}    胸主动脉瘤


胸主动脉瘤-手动输入评估表评估结果：胸主动脉夹层DeBakeyI型，推荐治疗增加：手术治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    控制高血压    一般治疗    升主动脉瘤监测与管理    主动脉弓动脉瘤监测与管理    降主动脉瘤监测与管理    ARB    手术治疗
    ${Assessment}    Set Variable    胸主动脉夹层
    ${Subjective}    Set Variable    男，59岁，咳嗽、闷气、上腹部疼痛不适1月，加重1周。高血压病史10年，糖尿病病史1年。胸部CT检查提示为胸主动脉瘤，胸主动脉夹层，胸主动脉夹层DeBakeyI型
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
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
    #Should Contain    ${aj[:5]}    胸主动脉瘤






















