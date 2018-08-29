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


############弥漫大B细胞淋巴瘤#############

弥漫大B细胞淋巴瘤-病史:女，40岁，发现右颈部肿物，右眼视力模糊,推荐疑似诊断:甲状腺肿物
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    甲状腺肿物
    # Lists Should Be Equal    ${aj}    ${assert}



弥漫大B细胞淋巴瘤-病史:进一步增加病史：病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润,推荐疑似诊断:弥漫大B细胞淋巴瘤
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊,病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    弥漫大B细胞淋巴瘤
    # Lists Should Be Equal    ${aj}    ${assert}



弥漫大B细胞淋巴瘤-病史:点击疑似诊断或手动输入：弥漫大B细胞淋巴瘤,推荐检查:血常规、HIV血清学检测、HCV血清学检测、 HBV血清学检测、肾功能、肝功能、血糖、 电解质全套、血清碱性磷酸酶、血清乳酸脱 氢酶、血维生素D水平测定、超声心动图、 多门控采集扫描、头颈部CT、头颈部超声、 荧光原位杂交(FISH)、骨髓检查染色体核型 分析、病灶部位活检、胸部CT、腹部CT、 盆腔CT、HLA配型检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    病灶部位活检    荧光原位杂交(FISH)    血常规    骨髓检查染色体核型分析    HIV血清学检测    HBV血清学检测    HCV血清学检测    多门控采集扫描    头颈部超声    头颈部CT    HLA配型检查    胸部CT    盆腔CT    腹部CT    肝功能    肾功能    血糖    血清乳酸脱氢酶    血清碱性磷酸酶    电解质全套    血维生素D水平测定    超声心动图
    ${Assessment}    Set Variable    弥漫大B细胞淋巴瘤
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊,病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    弥漫大B细胞淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}


弥漫大B细胞淋巴瘤-病史:点击疑似诊断或手动输入：弥漫大B细胞淋巴瘤,推荐评估表:Ann Arbor(安娜堡)淋巴瘤分期系统、弥漫大B细胞淋巴瘤修订的国际预后指数（R-IPI）评分（梅奥版）、国内弥漫大B细胞淋巴瘤国际预后指数（IPI）评分、体力状况ECOG评分、淋巴瘤Deauville标准评分（梅奥版）
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    Ann Arbor(安娜堡)淋巴瘤分期系统    弥漫大B细胞淋巴瘤修订的国际预后指数（R-IPI）评分（梅奥版）    国内弥漫大B细胞淋巴瘤国际预后指数（IPI）评分    体力状况ECOG评分    淋巴瘤Deauville标准评分（梅奥版）
    ${Assessment}    Set Variable    弥漫大B细胞淋巴瘤
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊,病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    弥漫大B细胞淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}


弥漫大B细胞淋巴瘤-病史:点击疑似诊断或手动输入：弥漫大B细胞淋巴瘤,推荐治疗:自体造血干细胞移植、放疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防肿瘤溶解综合征    放疗    髓系生长因子治疗    自体造血干细胞移植
    ${Assessment}    Set Variable    弥漫大B细胞淋巴瘤
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊,病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    弥漫大B细胞淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}


弥漫大B细胞淋巴瘤-病史:手动输入或点击回填评估表评估结果：AnnArbor淋巴瘤分期系统分期III期,推荐治疗增加:首选R-CHOP方案、挽救化疗方案
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防肿瘤溶解综合征    放疗    髓系生长因子治疗    首选R-CHOP方案    挽救化疗方案    自体造血干细胞移植
    ${Assessment}    Set Variable    弥漫大B细胞淋巴瘤
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊,病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润,AnnArbor淋巴瘤分期系统分期III期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    弥漫大B细胞淋巴瘤
    Lists Should Be Equal    ${aj}    ${assert}



弥漫大B细胞淋巴瘤-病史:病历内容增加：化疗，呕吐,推荐检查增加:FDG PET/CT影像学检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防肿瘤溶解综合征    放疗    髓系生长因子治疗    自体造血干细胞移植
    ${Assessment}    Set Variable    弥漫大B细胞淋巴瘤
    ${Subjective}    Set Variable    女，40岁，发现右颈部肿物，右眼视力模糊,病理诊断为：弥漫大B细胞淋巴瘤，淋巴结周围组织浸润,AnnArbor淋巴瘤分期系统分期III期,化疗，呕吐
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    FDG PET/CT影像学检查
    # Lists Should Be Equal    ${aj}    ${assert}


