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
#######流行性乙型脑炎###

流行性乙型脑炎-主诉:男，10岁，发热，头痛4天，病情加重1天伴呕吐。查体：T：40℃颈硬，克氏征阳性+检查结果输入：WBC14×109/L，N0.86，L0.14，推荐疑似诊断:流行性乙型脑炎
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，10岁，发热，头痛4天，病情加重1天伴呕吐。查体：T：40℃颈硬，克氏征阳性，WBC14×109/L，N0.86，L0.14
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    流行性乙型脑炎

流行性乙型脑炎-点击疑似诊断或手动输入：流行性乙型脑炎，推荐检查：血常规、腰椎穿刺脑脊液检查、脑脊液常规、脑脊液生化检查、头颅CT、头颅MRI、血清乙脑特异性IgM抗体测定、脑脊液乙脑抗体测定、补体结合试验、反向被动血凝抑制试验、乙脑病毒抗原测定
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    脑脊液生化检查    腰椎穿刺脑脊液检查    血清乙脑特异性IgM抗体测定    乙脑病毒抗原测定    脑脊液乙脑抗体测定    脑脊液常规    补体结合试验    反向被动血凝抑制试验    头颅CT    头颅MRI    血常规
    ${Assessment}    Set Variable    流行性乙型脑炎
    ${Subjective}    Set Variable    男，10岁，发热，头痛4天，病情加重1天伴呕吐。查体：T：40℃颈硬，克氏征阳性，WBC14×109/L，N0.86，L0.14
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    流行性乙型脑炎

# 流行性乙型脑炎-点击疑似诊断或手动输入：流行性乙型脑炎，推荐治疗：水电解质平衡治疗、住院治疗、降温治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${assert}    Create List    水电解质平衡治疗    住院治疗    降温治疗
#     ${Assessment}    Set Variable    流行性乙型脑炎
#     ${Subjective}    Set Variable    男，10岁，发热，头痛4天，病情加重1天伴呕吐。查体：T：40℃颈硬，克氏征阳性，WBC14×109/L，N0.86，L0.14
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #Lists Should Be Equal    ${aj}    ${assert}
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Lists Should Be Equal    ${aj}    ${assert}
#     #####疑似诊断
#     #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #Should Contain    ${aj[:5]}    流行性乙型脑炎

# 流行性乙型脑炎-病历内容增加：惊厥，推荐治疗增加：保持呼吸道通畅、镇静止痉治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${assert}    Create List    水电解质平衡治疗    住院治疗    保持呼吸道通畅    降温治疗    镇静止痉治疗
#     ${Assessment}    Set Variable    流行性乙型脑炎
#     ${Subjective}    Set Variable    男，10岁，发热，头痛4天，病情加重1天伴呕吐。查体：T：40℃颈硬，克氏征阳性，WBC14×109/L，N0.86，L0.14，惊厥
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #Lists Should Be Equal    ${aj}    ${assert}
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Lists Should Be Equal    ${aj}    ${assert}
#     #####疑似诊断
#     #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #Should Contain    ${aj[:5]}    流行性乙型脑炎

# 流行性乙型脑炎-病历内容增加：脑水肿，推荐治疗增加：脱水降颅压治疗、血管扩张剂治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${assert}    Create List    水电解质平衡治疗    住院治疗    保持呼吸道通畅    降温治疗    镇静止痉治疗    脱水降颅压治疗    血管扩张剂治疗
#     ${Assessment}    Set Variable    流行性乙型脑炎
#     ${Subjective}    Set Variable    男，10岁，发热，头痛4天，病情加重1天伴呕吐。查体：T：40℃颈硬，克氏征阳性，WBC14×109/L，N0.86，L0.14，惊厥，脑水肿
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     #####推荐检查评估表
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     #####推荐检查
#     #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #Lists Should Be Equal    ${aj}    ${assert}
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Lists Should Be Equal    ${aj}    ${assert}
#     #####疑似诊断
#     #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     #Should Contain    ${aj[:5]}    流行性乙型脑炎








