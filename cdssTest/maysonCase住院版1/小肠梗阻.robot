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


############小肠梗阻#############

# 小肠梗阻-主诉：男，65岁，腹痛、腹胀伴呕吐13小时，13小时前无明显诱因出现腹部疼痛，呈阵发性胀痛,推荐疑似诊断：急性小肠梗阻
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     # ${assert}    Create List
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男，65岁，腹痛、腹胀伴呕吐13小时，13小时前无明显诱因出现腹部疼痛，呈阵发性胀痛
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj[:5]}    急性小肠梗阻
#     # Lists Should Be Equal    ${aj}    ${assert}



小肠梗阻-手动输入诊断：急性小肠梗阻,补充病史：既往有腹部手术史,推荐检查:腹部CT、血生化、血气分析、血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    血气分析    血常规    腹部CT    血生化
    ${Assessment}    Set Variable    急性小肠梗阻
    ${Subjective}    Set Variable    男，65岁，腹痛、腹胀伴呕吐13小时，13小时前无明显诱因出现腹部疼痛，呈阵发性胀痛,既往有腹部手术史
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    性小肠梗阻
    Lists Should Be Equal    ${aj}    ${assert}





# 小肠梗阻-手动输入诊断：急性小肠梗阻,补充病史：既往有腹部手术史,推荐治疗:泛影葡胺激发
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${assert}    Create List    泛影葡胺激发
#     ${Assessment}    Set Variable    急性小肠梗阻
#     ${Subjective}    Set Variable    男，65岁，腹痛、腹胀伴呕吐13小时，13小时前无明显诱因出现腹部疼痛，呈阵发性胀痛,既往有腹部手术史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ######检查解读
#     # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     # Should Contain    ${aj[:5]}    性小肠梗阻
#     Lists Should Be Equal    ${aj}    ${assert}


小肠梗阻-病历内容中增加：绞窄性小肠梗阻,推荐治疗增加:会诊、手术探查、防治感染、鼻胃管减压术、补液治疗、手术治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    鼻胃管减压术    补液治疗    会诊    手术探查    泛影葡胺激发    防治感染    手术治疗
    ${Assessment}    Set Variable    急性小肠梗阻
    ${Subjective}    Set Variable    男，65岁，腹痛、腹胀伴呕吐13小时，13小时前无明显诱因出现腹部疼痛，呈阵发性胀痛,既往有腹部手术史,绞窄性小肠梗阻
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    性小肠梗阻
    Lists Should Be Equal    ${aj}    ${assert}




小肠梗阻-进一步补充并发症：休克,推荐治疗增加:抗休克治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    鼻胃管减压术    补液治疗    会诊    手术探查    泛影葡胺激发    防治感染    抗休克治疗    手术治疗
    ${Assessment}    Set Variable    急性小肠梗阻
    ${Subjective}    Set Variable    男，65岁，腹痛、腹胀伴呕吐13小时，13小时前无明显诱因出现腹部疼痛，呈阵发性胀痛,既往有腹部手术史,绞窄性小肠梗阻,休克
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj[:5]}    性小肠梗阻
    Lists Should Be Equal    ${aj}    ${assert}


