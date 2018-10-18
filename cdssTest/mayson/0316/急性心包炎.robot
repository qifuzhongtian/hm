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
#######急性心包炎###

急性心包炎-主诉:男，33岁，突发胸痛1小时。1小时前无名显诱因睡觉时突发左前胸部疼痛，为剧痛，疼痛向左颈部、左肩部放射，左侧卧位及呼吸时疼痛加剧，略感胸闷，出气不畅，推荐疑似诊断:急性心肌梗死
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，33岁，突发胸痛1小时。1小时前无名显诱因睡觉时突发左前胸部疼痛，为剧痛，疼痛向左颈部、左肩部放射，左侧卧位及呼吸时疼痛加剧，略感胸闷，出气不畅
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"33","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    急性心肌梗死

急性心包炎-手动输入查体结果：心尖搏动减弱、心音遥远、心包摩擦感，手动输入诊断：急性心包炎，推荐检查：血常规、心电图、超声心动图、肌钙蛋白、心肌酶、红细胞沉降率(ESR)、C-反应蛋白、肝功能、肾功能、胸部X线(正侧位)、结核菌素试验(PPD试验)、血清结核抗体检测、甲状腺功能、血液细菌培养、抗核抗体测定、抗中性粒细胞抗体、病毒全套、快速梅毒血清反应素试验、真菌培养、心脏CT、心脏核磁共振成像、正电子发射计算机断层显像(PET-CT)、心包组织活检、心包穿刺液涂片、心包穿刺液培养、穿刺细胞学病理检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    血常规    心电图    超声心动图    肌钙蛋白    心肌酶    红细胞沉降率(ESR)    C-反应蛋白    肝功能    肾功能    胸部X线(正侧位)    结核菌素试验(PPD试验)    血清结核抗体检测    甲状腺功能    血液细菌培养    抗核抗体测定    抗中性粒细胞抗体    病毒全套    快速梅毒血清反应素试验    真菌培养    心脏CT    心脏核磁共振成像    正电子发射计算机断层显像(PET-CT)    心包组织活检    心包穿刺液涂片    心包穿刺液培养    穿刺细胞学病理检查
    ${Assessment}    Set Variable    急性心包炎
    ${Subjective}    Set Variable    男，33岁，突发胸痛1小时。1小时前无名显诱因睡觉时突发左前胸部疼痛，为剧痛，疼痛向左颈部、左肩部放射，左侧卧位及呼吸时疼痛加剧，略感胸闷，出气不畅，心尖搏动减弱、心音遥远、心包摩擦感
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"33","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    急性心肌梗死

急性心包炎-手动输入查体结果：心尖搏动减弱、心音遥远、心包摩擦感，手动输入诊断：急性心包炎，推荐治疗：非甾体类抗炎药治疗、秋水仙碱治疗、病因治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    非甾体类抗炎药治疗    病因治疗    秋水仙碱治疗
    ${Assessment}    Set Variable    急性心包炎
    ${Subjective}    Set Variable    男，33岁，突发胸痛1小时。1小时前无名显诱因睡觉时突发左前胸部疼痛，为剧痛，疼痛向左颈部、左肩部放射，左侧卧位及呼吸时疼痛加剧，略感胸闷，出气不畅，心尖搏动减弱、心音遥远、心包摩擦感
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"33","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    急性心肌梗死

急性心包炎-病历内容增加并发症：心包填塞，推荐治疗增加：住院治疗、急诊心包腔穿刺引流治疗、心包切开/心包开窗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    住院治疗    非甾体类抗炎药治疗    急诊心包腔穿刺引流治疗    心包切开/心包开窗治疗    病因治疗    秋水仙碱治疗
    ${Assessment}    Set Variable    急性心包炎
    ${Subjective}    Set Variable    男，33岁，突发胸痛1小时。1小时前无名显诱因睡觉时突发左前胸部疼痛，为剧痛，疼痛向左颈部、左肩部放射，左侧卧位及呼吸时疼痛加剧，略感胸闷，出气不畅，心尖搏动减弱、心音遥远、心包摩擦感，心包填塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"33","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    急性心肌梗死

急性心包炎-病历内容增加并发症：结核性心包炎，推荐治疗增加：
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    住院治疗    非甾体类抗炎药治疗    急诊心包腔穿刺引流治疗    心包切开/心包开窗治疗    心包腔内注药治疗    标准抗结核治疗    病因治疗    秋水仙碱治疗
    ${Assessment}    Set Variable    急性心包炎
    ${Subjective}    Set Variable    男，33岁，突发胸痛1小时。1小时前无名显诱因睡觉时突发左前胸部疼痛，为剧痛，疼痛向左颈部、左肩部放射，左侧卧位及呼吸时疼痛加剧，略感胸闷，出气不畅，心尖搏动减弱、心音遥远、心包摩擦感，心包填塞，结核性心包炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"33","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    急性心肌梗死














