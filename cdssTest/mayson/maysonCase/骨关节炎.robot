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


############骨关节炎#############

骨关节炎-病史:女，65岁，双手关节肿痛1年，双膝关节疼痛5个月，双膝关节无骨性膨大，无肿胀，压痛阳性，右膝关节屈曲略受限。双膝关节浮髌试验阴性，膝关节活动时可触及骨擦感，闻及骨擦音，推荐疑似诊断:骨关节炎
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    # ${assert}    Create List
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，65岁，双手关节肿痛1年，双膝关节疼痛5个月，双膝关节无骨性膨大，无肿胀，压痛阳性，右膝关节屈曲略受限。双膝关节浮髌试验阴性，膝关节活动时可触及骨擦感，闻及骨擦音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    骨关节炎
    # Lists Should Be Equal    ${aj}    ${assert}




骨关节炎-手动输入诊断：骨关节炎，推荐检查:关节X线、关节腔穿刺关节液检查、C-反应蛋 白、红细胞沉降率(ESR)、骨密度检查、关节 镜检查、四肢关节MRI、类风湿因子测定、抗 环瓜氨酸肽抗体(CCP)、抗角蛋白抗体 (AKA) 、自身抗体检验
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    四肢关节MRI    关节镜检查    关节X线    抗环瓜氨酸肽抗体(CCP)    自身抗体检验    抗角蛋白抗体(AKA)    C-反应蛋白    类风湿因子测定    红细胞沉降率(ESR)    骨密度检查     关节腔穿刺关节液检查
    ${Assessment}    Set Variable    骨关节炎
    ${Subjective}    Set Variable    女，65岁，双手关节肿痛1年，双膝关节疼痛5个月，双膝关节无骨性膨大，无肿胀，压痛阳性，右膝关节屈曲略受限。双膝关节浮髌试验阴性，膝关节活动时可触及骨擦感，闻及骨擦音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    骨关节炎
    Lists Should Be Equal    ${aj}    ${assert}






骨关节炎-手动输入诊断：骨关节炎，推荐治疗:氨基葡萄糖硫酸软骨素治疗、关节腔注射皮质类固醇激素、对症止痛治疗、作业疗法和物理治疗、一般治疗、转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    氨基葡萄糖硫酸软骨素治疗    关节腔注射皮质类固醇激素    对症止痛治疗    作业疗法和物理治疗    一般治疗    转诊
    ${Assessment}    Set Variable    骨关节炎
    ${Subjective}    Set Variable    女，65岁，双手关节肿痛1年，双膝关节疼痛5个月，双膝关节无骨性膨大，无肿胀，压痛阳性，右膝关节屈曲略受限。双膝关节浮髌试验阴性，膝关节活动时可触及骨擦感，闻及骨擦音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    骨关节炎
    Lists Should Be Equal    ${aj}    ${assert}




骨关节炎-病历内容增加：膝骨关节炎，推荐治疗增加:膝关节腔注射治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    氨基葡萄糖硫酸软骨素治疗    膝关节腔注射治疗    关节腔注射皮质类固醇激素    对症止痛治疗    作业疗法和物理治疗    一般治疗    转诊
    ${Assessment}    Set Variable    骨关节炎
    ${Subjective}    Set Variable    女，65岁，双手关节肿痛1年，双膝关节疼痛5个月，双膝关节无骨性膨大，无肿胀，压痛阳性，右膝关节屈曲略受限。双膝关节浮髌试验阴性，膝关节活动时可触及骨擦感，闻及骨擦音,膝骨关节炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    # Should Contain    ${aj[:5]}    骨关节炎
    Lists Should Be Equal    ${aj}    ${assert}






