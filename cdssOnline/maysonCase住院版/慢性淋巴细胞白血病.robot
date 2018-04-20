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
#######慢性淋巴细胞白血病###

慢性淋巴细胞白血病-主诉:男，56岁，乏力、贫血、体弱、消瘦、 出血、颈部肿大，体检发现白细胞总数100×109/L，来院复查+检查结果输入：骨髓象显示为慢性淋巴细胞白血病，推荐疑似诊断:慢性淋巴细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，56岁，乏力、贫血、体弱、消瘦、 出血、颈部肿大，体检发现白细胞总数100×109/L，来院复查，骨髓象显示为慢性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    慢性淋巴细胞白血病


慢性淋巴细胞白血病-点击疑似诊断或手动输入：慢性淋巴细胞白血病，推荐检查：血常规+分类、网织红细胞计数、外周血、流 式细胞分析、肝功能、肾功能、直接Coombs 试验(抗人球蛋白)(IgG/补体)、血清β2-微球 蛋白、免疫球蛋白游离轻链分析和蛋白电 泳、胸部B超、腹部B超、咽部B超、胸部CT 扫描、腹部CT扫描、盆骨CT扫描、乙肝筛 查、丙肝筛查、FISH、免疫球蛋白IgG定量、 25-羟基维生素D、骨髓活检和穿刺、细胞遗 传学分析、常规染色体核型分析、生物学检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    细胞遗传学分析    骨髓活检和穿刺    常规染色体核型分析    生物学检查    FISH    丙肝筛查    网织红细胞计数    直接Coombs试验(抗人球蛋白)(IgG/补体)    流式细胞分析    免疫球蛋白游离轻链分析和蛋白电泳    血清β2-微球蛋白    乙肝筛查    25-羟基维生素D    免疫球蛋白IgG定量    肝功能    肾功能    腹部B超    外周血    血常规+分类    咽部B超    胸部B超    腹部CT扫描    胸部CT扫描    盆骨CT扫描
    ${Assessment}    Set Variable    慢性淋巴细胞白血病
    ${Subjective}    Set Variable    男，56岁，乏力、贫血、体弱、消瘦、 出血、颈部肿大，体检发现白细胞总数100×109/L，来院复查，骨髓象显示为慢性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    慢性淋巴细胞白血病

慢性淋巴细胞白血病-点击疑似诊断或手动输入：慢性淋巴细胞白血病，推荐评估表：慢性淋巴细胞白血病(CLL)Rai临床分期、慢性淋巴细胞白血病(CLL)实验室分期、慢性淋巴细胞白血病(CLL)Binet临床分期、慢性淋巴细胞白血病的RMH免疫标志积分系统、体力状况ECOG 评分表、慢性淋巴细胞白血病患者的国际预后指数(CLL-IPI)
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    慢性淋巴细胞白血病（CLL）Binet临床分期    慢性淋巴细胞白血病(CLL)实验室分期    慢性淋巴细胞白血病(CLL)Rai临床分期    体力状况ECOG评分    慢性淋巴细胞白血病的RMH免疫标志积分系统    慢性淋巴细胞白血病患者的国际预后指数(CLL-IPI)
    ${Assessment}    Set Variable    慢性淋巴细胞白血病
    ${Subjective}    Set Variable    男，56岁，乏力、贫血、体弱、消瘦、 出血、颈部肿大，体检发现白细胞总数100×109/L，来院复查，骨髓象显示为慢性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    慢性淋巴细胞白血病

慢性淋巴细胞白血病-点击疑似诊断或手动输入：慢性淋巴细胞白血病，推荐治疗：CLL支持治疗和监测、化学免疫治疗方案
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    化学免疫治疗方案    CLL支持治疗和监测
    ${Assessment}    Set Variable    慢性淋巴细胞白血病
    ${Subjective}    Set Variable    男，56岁，乏力、贫血、体弱、消瘦、 出血、颈部肿大，体检发现白细胞总数100×109/L，来院复查，骨髓象显示为慢性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    慢性淋巴细胞白血病

慢性淋巴细胞白血病-病历内容增加：难治性慢性淋巴细胞白血病，推荐治疗增加：依鲁替尼、Idelalisib+利妥昔单抗、苯丁酸氮芥、甲泼尼龙+利妥昔单抗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    依鲁替尼    Idelalisib+利妥昔单抗    化学免疫治疗    苯丁酸氮芥    甲泼尼龙+利妥昔单抗    CLL支持治疗和监测
    ${Assessment}    Set Variable    慢性淋巴细胞白血病
    ${Subjective}    Set Variable    男，56岁，乏力、贫血、体弱、消瘦、 出血、颈部肿大，体检发现白细胞总数100×109/L，来院复查，骨髓象显示为慢性淋巴细胞白血病，难治性慢性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    慢性淋巴细胞白血病




















