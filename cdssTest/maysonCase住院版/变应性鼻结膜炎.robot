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

# #######耳鼻喉科
#######变应性鼻结膜炎###

鼻咽癌-主诉:女，30岁，无明显诱因出现鼻塞、鼻痒、打喷嚏三天，加重半天，伴有眼痒，结膜充血1天，推荐疑似诊断:变应性鼻结膜炎
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，30岁，无明显诱因出现鼻塞、鼻痒、打喷嚏三天，加重半天，伴有眼痒，结膜充血1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    变应性鼻结膜炎

鼻咽癌-手动输入诊断:变应性鼻结膜炎，推荐检查:鼻腔分泌物涂片、过敏原皮肤点刺试验、免疫球蛋白IgE、补体检查、鼻激发试验、鼻窦CT、鼻内窥镜检查、皮肤免疫球蛋白IgE
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    皮肤免疫球蛋白IgE    免疫球蛋白IgE    补体检查    鼻激发试验    鼻腔分泌物涂片    鼻内窥镜检查    过敏原皮肤点刺试验    鼻窦CT
    ${Assessment}    Set Variable    变应性鼻结膜炎
    ${Subjective}    Set Variable    女，30岁，无明显诱因出现鼻塞、鼻痒、打喷嚏三天，加重半天，伴有眼痒，结膜充血1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    变应性鼻结膜炎

鼻咽癌-手动输入诊断:变应性鼻结膜炎，推荐治疗:变应原回避治疗、变应原免疫治疗、鼻盐水冲洗、抗组胺药物治疗、白三烯受体拮抗剂治疗、下鼻甲减容手术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    变应原回避治疗    变应原免疫治疗    鼻盐水冲洗    抗组胺药物治疗    白三烯受体拮抗剂治疗    下鼻甲减容手术
    ${Assessment}    Set Variable    变应性鼻结膜炎
    ${Subjective}    Set Variable    女，30岁，无明显诱因出现鼻塞、鼻痒、打喷嚏三天，加重半天，伴有眼痒，结膜充血1天
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    变应性鼻结膜炎

鼻咽癌-病历内容增加:中度变应性鼻结膜炎，推荐治疗增加:变应原回避治疗、变应原免疫治疗、鼻盐水冲洗、抗组胺药物治疗、白三烯受体拮抗剂治疗、下鼻甲减容手术、鼻用皮质类固醇激素为基础的治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    变应原回避治疗    变应原免疫治疗    鼻盐水冲洗    抗组胺药物治疗    白三烯受体拮抗剂治疗    鼻用皮质类固醇激素为基础的治疗    下鼻甲减容手术
    ${Assessment}    Set Variable    变应性鼻结膜炎
    ${Subjective}    Set Variable    女，30岁，无明显诱因出现鼻塞、鼻痒、打喷嚏三天，加重半天，伴有眼痒，结膜充血1天，中度变应性鼻结膜炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    变应性鼻结膜炎




























