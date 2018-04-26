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

# #######
#######乳腺纤维腺瘤###

乳腺纤维腺瘤-主诉:女，28岁，发现右乳外上象限肿块5年，近半月肿块增大较快。5年来肿物逐渐增大，月经周期对肿块大小无影响+输入查体结果：乳房肿块质地似橡皮球，肿块表面光滑，大小约2×1mm，界清，易于推动，无压痛，推荐疑似诊断:乳腺纤维腺瘤
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，28岁，发现右乳外上象限肿块5年，近半月肿块增大较快。5年来肿物逐渐增大，月经周期对肿块大小无影响，乳房肿块质地似橡皮球，肿块表面光滑，大小约2×1mm，界清，易于推动，无压痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    乳腺纤维腺瘤


乳腺纤维腺瘤-点击疑似诊断或手动输入：乳腺纤维腺瘤，推荐检查:血常规、尿常规、肝功能、肾功能、输血前四项、凝血常规、电解质常规、性激素检查、尿妊娠试验、粪便常规、胸部X线、心电图、乳腺B超检查、乳腺钼靶、乳腺粗针穿刺活检
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    乳腺粗针穿刺活检    乳腺钼靶    尿常规    乳腺B超检查    尿妊娠试验    粪便常规    血常规    性激素检查    肝功能    输血前四项    肾功能    电解质常规    凝血常规    胸部X线    心电图
    ${Assessment}    Set Variable    乳腺纤维腺瘤
    ${Subjective}    Set Variable    女，28岁，发现右乳外上象限肿块5年，近半月肿块增大较快。5年来肿物逐渐增大，月经周期对肿块大小无影响，乳房肿块质地似橡皮球，肿块表面光滑，大小约2×1mm，界清，易于推动，无压痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    乳腺纤维腺瘤


乳腺纤维腺瘤-点击疑似诊断或手动输入：乳腺纤维腺瘤，推荐评估表：真空辅助微创旋切术禁忌症评估
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    乳腺纤维腺瘤
    ${Subjective}    Set Variable    女，28岁，发现右乳外上象限肿块5年，近半月肿块增大较快。5年来肿物逐渐增大，月经周期对肿块大小无影响，乳房肿块质地似橡皮球，肿块表面光滑，大小约2×1mm，界清，易于推动，无压痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}    真空辅助微创旋切术禁忌症评估
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    乳腺纤维腺瘤

乳腺纤维腺瘤-点击疑似诊断或手动输入：乳腺纤维腺瘤直径3.1cm，推荐治疗：乳房肿物开放切除术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    乳腺纤维腺瘤直径3.1cm
    ${Subjective}    Set Variable    女，28岁，发现右乳外上象限肿块5年，近半月肿块增大较快。5年来肿物逐渐增大，月经周期对肿块大小无影响，乳房肿块质地似橡皮球，肿块表面光滑，大小约2×1mm，界清，易于推动，无压痛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Should Contain    ${aj}    乳房肿物开放切除术
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}    乳房肿物开放切除术
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    乳腺纤维腺瘤

乳腺纤维腺瘤-病历内容增加：乳腺纤维腺瘤术后，推荐治疗增加：随访观察、术后止血治疗、术后镇痛治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    随访观察    术后止血治疗    术后镇痛治疗    乳房肿物开放切除术
    ${Assessment}    Set Variable    乳腺纤维腺瘤直径3.1cm
    ${Subjective}    Set Variable    女，28岁，发现右乳外上象限肿块5年，近半月肿块增大较快。5年来肿物逐渐增大，月经周期对肿块大小无影响，乳房肿块质地似橡皮球，肿块表面光滑，大小约2×1mm，界清，易于推动，无压痛，乳腺纤维腺瘤术后
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Should Contain    ${aj}    乳房肿物开放切除术
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #Should Contain    ${aj}    乳房肿物开放切除术
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    乳腺纤维腺瘤



















