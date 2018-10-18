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


############霍奇金淋巴瘤#############

霍奇金淋巴瘤-病史：主诉：女，年龄57岁，发现左锁骨上淋巴结肿大1月余,检查结果输入：颈部淋巴结活检病理为：找到R‐S 变异细胞，颈部霍奇金淋巴瘤（结节硬化型）,推荐疑似诊断：霍奇金病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    主诉：女，年龄57岁，发现左锁骨上淋巴结肿大1月余,检查结果输入：颈部淋巴结活检病理为：找到R‐S 变异细胞，颈部霍奇金淋巴瘤（结节硬化型）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"57","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    霍奇金病
    # Lists Should Be Equal    ${aj}    ${assert}




霍奇金淋巴瘤-病史：点击疑似诊断或手动输入：霍奇金淋巴瘤,推荐检查:血常规、红细胞沉降率、外周血涂片、肝功能、血清乳酸脱氢酶测定、血清 碱性磷酸酶测定、肾功能、血清EB病毒检查、血清HIV病毒检查、血清HCV病毒检查、 血清HBV病毒检查、血电解质全套、免疫组 织化学染色(一步法)、胸部CT、腹部CT、 盆腔CT、正电子发射计算机断层显像(PET- CT)、骨髓活检、超声心动图、心电图、肺功能检查、β2微球蛋白
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    骨髓活检    外周血涂片    正电子发射计算机断层显像(PET-CT)    血清HIV病毒检查    血清HCV病毒检查    血清EB病毒检查    血清HBV病毒检查    红细胞沉降率    胸部CT    盆腔CT    血电解质全套    腹部CT    血常规    肝功能    肾功能    免疫组织化学染色（一步法）    血清乳酸脱氢酶测定    β2微球蛋白    妊娠试验    血清碱性磷酸酶测定    心电图    超声心动图    肺功能检查
    ${Assessment}    Set Variable    霍奇金淋巴瘤
    ${Subjective}    Set Variable    主诉：女，年龄57岁，发现左锁骨上淋巴结肿大1月余,检查结果输入：颈部淋巴结活检病理为：找到R‐S 变异细胞，颈部霍奇金淋巴瘤（结节硬化型）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"57","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    霍奇金淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}





霍奇金淋巴瘤-病史：点击疑似诊断或手动输入：霍奇金淋巴瘤,推荐评估表:Ann Arbor(安娜堡)淋巴瘤分期系统、霍奇金淋巴瘤预后评估(梅奥版)、体力状况ECOG评分、淋巴瘤Deauville标准评分（梅奥版）、Cotswolds修订特征分期
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    体力状况ECOG评分    淋巴瘤Deauville标准评分（梅奥版）    Ann Arbor(安娜堡)淋巴瘤分期系统    霍奇金淋巴瘤预后评估(梅奥版)    Cotswolds修订特征分期
    ${Assessment}    Set Variable    霍奇金淋巴瘤
    ${Subjective}    Set Variable    主诉：女，年龄57岁，发现左锁骨上淋巴结肿大1月余,检查结果输入：颈部淋巴结活检病理为：找到R‐S 变异细胞，颈部霍奇金淋巴瘤（结节硬化型）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"57","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    霍奇金淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}






霍奇金淋巴瘤-病史：点击疑似诊断或手动输入：霍奇金淋巴瘤,推荐治疗：早期预后不良者推荐方案、晚期疾病者推荐方案、一线化疗方案、二线化疗方案、放疗、造血干细胞移植、靶向药物利妥昔单抗治疗、新靶向治疗药维度汀、防治治疗并发症、转诊生育门诊

    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    一线化疗方案    放疗    靶向药物利妥昔单抗治疗    防治治疗并发症    转诊生育门诊    早期预后不良者推荐方案    晚期疾病者推荐方案    二线化疗方案    造血干细胞移植    新靶向治疗药维度汀
    ${Assessment}    Set Variable    霍奇金淋巴瘤
    ${Subjective}    Set Variable    主诉：女，年龄57岁，发现左锁骨上淋巴结肿大1月余,检查结果输入：颈部淋巴结活检病理为：找到R‐S 变异细胞，颈部霍奇金淋巴瘤（结节硬化型）
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"57","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    霍奇金淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}



霍奇金淋巴瘤-病史：病历内容增加：放疗未达到完全缓解,推荐增加：ICE挽救治疗方案
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    一线化疗方案    放疗    靶向药物利妥昔单抗治疗    防治治疗并发症    ICE挽救治疗方案    转诊生育门诊    早期预后不良者推荐方案    晚期疾病者推荐方案    二线化疗方案    造血干细胞移植    新靶向治疗药维度汀
    ${Assessment}    Set Variable    霍奇金淋巴瘤
    ${Subjective}    Set Variable    主诉：女，年龄57岁，发现左锁骨上淋巴结肿大1月余,检查结果输入：颈部淋巴结活检病理为：找到R‐S 变异细胞，颈部霍奇金淋巴瘤（结节硬化型）,放疗未达到完全缓解
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"57","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    ...    operationRecord={"recordNumber":1234567,"position":"","incisionType":"切片","anesthesia":"没有","preoperativeDiagnose":"","operationList":[{"operationId":6598,"operationName":"乳腺导管选择性切除术(单根)","operationType":"","operationDesc":"","operationTime":""},{"operationId":6614,"operationName":"单侧乳房切除术","operationType":1}]}    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    霍奇金淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}








