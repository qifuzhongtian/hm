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
#######颈动脉疾病(成人)###

颈动脉疾病(成人)-主诉:女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕，推荐疑似诊断:颈动脉硬化
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    颈动脉硬化

颈动脉疾病(成人)-点击疑似诊断或手动输入:颈动脉硬化+查体：可闻及颈动脉杂音，推荐治疗:纠正动脉粥样硬化的危险因素
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    颈动脉硬化
    ${Subjective}    Set Variable    女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕，可闻及颈动脉杂音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}    纠正动脉粥样硬化的危险因素
    #####疑似诊断
    ##${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    ##Should Contain    ${aj[:5]}    颈动脉硬化

颈动脉疾病(成人)-点击疑似诊断或手动输入:颈动脉硬化+查体：可闻及颈动脉杂音，推荐检查:颈动脉双功超声
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    颈动脉硬化
    ${Subjective}    Set Variable    女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕，可闻及颈动脉杂音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj}    颈动脉双功超声
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Should Contain    ${aj}    颈动脉双功超声
    #####疑似诊断
    ##${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    ##Should Contain    ${aj[:5]}    颈动脉硬化

颈动脉疾病(成人)-诊断修改为：颈动脉狭窄，推荐检查增加:颈动脉造影CT、颈动脉MRI、颈动脉导管血管造影术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    颈动脉MRI    颈动脉造影CT    颈动脉导管血管造影术
    ${Assessment}    Set Variable    颈动脉狭窄
    ${Subjective}    Set Variable    女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕，可闻及颈动脉杂音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Should Contain    ${aj}    纠正动脉粥样硬化的危险因素
    #####疑似诊断
    ##${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    ##Should Contain    ${aj[:5]}    颈动脉硬化

颈动脉疾病(成人)-修改诊断:颈动脉狭窄，推荐治疗增加:氯吡格雷替代治疗、抗血小板治疗、监测颈动脉狭窄情况
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    抗血小板治疗    氯吡格雷替代治疗    监测颈动脉狭窄情况
    ${Assessment}    Set Variable    颈动脉狭窄
    ${Subjective}    Set Variable    女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕，可闻及颈动脉杂音
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #Should Contain    ${aj}    纠正动脉粥样硬化的危险因素
    #####疑似诊断
    ##${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    ##Should Contain    ${aj[:5]}    颈动脉硬化

颈动脉疾病(成人)-病历内容增加:重度颈动脉狭窄，推荐治疗增加:转诊、颈内血管重建术、颈动脉内膜切除术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    抗血小板治疗    氯吡格雷替代治疗    监测颈动脉狭窄情况    转诊    颈内血管重建术    颈动脉内膜切除术
    ${Assessment}    Set Variable    颈动脉狭窄
    ${Subjective}    Set Variable    女，60岁，左侧上下肢远端麻木无力，伴头晕2月，患者2月前，无明显诱因出现左上下肢远端麻木无力，不能单腿站立，症状持续2-3分钟可自行缓解，伴头晕，可闻及颈动脉杂音，重度颈动脉狭窄
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #Should Contain    ${aj}    纠正动脉粥样硬化的危险因素
    #####疑似诊断
    ##${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    ##Should Contain    ${aj[:5]}    颈动脉硬化


















