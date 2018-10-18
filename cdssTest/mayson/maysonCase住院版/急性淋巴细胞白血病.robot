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

# #######白血病
#######急性淋巴细胞白血病###

急性淋巴细胞白血病-主诉:男，48岁，因头晕，乏力，面色苍白，全身骨痛，皮肤紫斑就诊+检查结果输入：骨髓象显示为急性淋巴细胞白血病，推荐疑似诊断:急性淋巴细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，48岁，因头晕，乏力，面色苍白，全身骨痛，皮肤紫斑就诊，骨髓象显示为急性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    急性淋巴细胞白血病


急性淋巴细胞白血病-点击疑似诊断或手动输入：急性淋巴细胞白血病，推荐检查：血常规、外周血涂片、骨髓血涂片、DIC筛查、网织红细胞计数、血电解质全套、肾功能、肝功能、血清铁蛋白、促红细胞生成素测定、红细胞沉降率(ESR)、血糖、恶性贫血级联检查、常规心电图、超声心动图、胸部X 线(正侧位)、骨髓检查ALL FISH全套、骨髓检查BCR-ABL PCR检测、腰椎穿刺脑脊液检查、骨髓穿刺活检、骨髓检查流式细胞术免疫表型分析、骨髓检查MD染色体、单侧骨髓穿刺活检、骨髓检查流式细胞术免疫表型分型
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    骨髓血涂片    外周血涂片    血常规    骨髓检查BCR-ABL PCR检测     骨髓检查ALL FISH全套    骨髓穿刺活检    骨髓检查流式细胞术免疫表型分析    腰椎穿刺脑脊液检查    骨髓检查MD染色体    骨髓检查流式细胞术免疫表型分型    单侧骨髓穿刺活检    网织红细胞计数    DIC筛查    血清铁蛋白    血电解质全套    红细胞沉降率(ESR)    促红细胞生成素测定    胸部X线(正侧位)    恶性贫血级联检查    肝功能    肾功能    血糖    常规心电图    超声心动图
    ${Assessment}    Set Variable    急性淋巴细胞白血病
    ${Subjective}    Set Variable    男，48岁，因头晕，乏力，面色苍白，全身骨痛，皮肤紫斑就诊，骨髓象显示为急性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    急性淋巴细胞白血病

急性淋巴细胞白血病-点击疑似诊断或手动输入：急性淋巴细胞白血病，推荐治疗：预防中枢神经系统浸润、预治肿瘤溶解综合征、预防肺孢子菌肺炎、防治大剂量阿糖胞苷毒性、风险评估预后、化疗、造血干细胞移植、门冬酰胺酶治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防中枢神经系统浸润    预治肿瘤溶解综合征    预防肺孢子菌肺炎    防治大剂量阿糖胞苷毒性    风险评估预后    化疗    造血干细胞移植    门冬酰胺酶治疗
    ${Assessment}    Set Variable    急性淋巴细胞白血病
    ${Subjective}    Set Variable    男，48岁，因头晕，乏力，面色苍白，全身骨痛，皮肤紫斑就诊，骨髓象显示为急性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    急性淋巴细胞白血病

急性淋巴细胞白血病-病历内容补充检查结果：中性粒细胞减少，推荐治疗增加：预防性抗细菌真菌病毒药物
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防中枢神经系统浸润    预治肿瘤溶解综合征    预防性抗细菌真菌病毒药物    预防肺孢子菌肺炎    防治大剂量阿糖胞苷毒性    风险评估预后    化疗    造血干细胞移植    门冬酰胺酶治疗
    ${Assessment}    Set Variable    急性淋巴细胞白血病
    ${Subjective}    Set Variable    男，48岁，因头晕，乏力，面色苍白，全身骨痛，皮肤紫斑就诊，骨髓象显示为急性淋巴细胞白血病，中性粒细胞减少
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    急性淋巴细胞白血病

急性淋巴细胞白血病-病历内容进一步增加：血压下降，推荐治疗增加：加强抗感染治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防中枢神经系统浸润    预治肿瘤溶解综合征    预防性抗细菌真菌病毒药物    加强抗感染治疗    预防肺孢子菌肺炎    防治大剂量阿糖胞苷毒性    风险评估预后    化疗    造血干细胞移植    门冬酰胺酶治疗
    ${Assessment}    Set Variable    急性淋巴细胞白血病
    ${Subjective}    Set Variable    男，48岁，因头晕，乏力，面色苍白，全身骨痛，皮肤紫斑就诊，骨髓象显示为急性淋巴细胞白血病，中性粒细胞减少，血压下降
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"48","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    急性淋巴细胞白血病









