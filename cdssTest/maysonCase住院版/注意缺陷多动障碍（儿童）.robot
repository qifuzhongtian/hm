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
#######注意缺陷多动障碍（儿童）###

注意缺陷多动障碍（儿童）-主诉:男，年龄10岁，上课注意力不集中，多动半年。患儿上课老走神，好做小动作，做作业特慢，好写错字，算术常对错位，考试成绩不及格，还常与同学吵架、打架，推荐疑似诊断:多动性障碍
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，年龄10岁，上课注意力不集中，多动半年。患儿上课老走神，好做小动作，做作业特慢，好写错字，算术常对错位，考试成绩不及格，还常与同学吵架、打架
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
    Should Contain    ${aj[:5]}    多动性障碍

注意缺陷多动障碍（儿童）-手动输入诊断：注意缺陷多动障碍，推荐检查：神经电生理检查、脑电图、注意力变量检测、甲状腺功能、基因检测、头颅MRI
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    注意力变量检测    神经电生理检查    脑电图    头颅MRI    甲状腺功能    基因检测
    ${Assessment}    Set Variable    注意缺陷多动障碍
    ${Subjective}    Set Variable    男，年龄10岁，上课注意力不集中，多动半年。患儿上课老走神，好做小动作，做作业特慢，好写错字，算术常对错位，考试成绩不及格，还常与同学吵架、打架，
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
    #Should Contain    ${aj[:5]}    多动性障碍

注意缺陷多动障碍（儿童）-手动输入诊断：注意缺陷多动障碍，推荐评估表：NICHQVanderbilt注意缺陷多动障碍父母评定量表(VADPRS)、注意缺陷多动障碍的诊断标准(DSM-5标准)、ADHD自填量表
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    NICHQVanderbilt注意缺陷多动障碍父母评定量表(VADPRS)    注意缺陷多动障碍的诊断标准(DSM-5标准)    ADHD自填量表
    ${Assessment}    Set Variable    注意缺陷多动障碍
    ${Subjective}    Set Variable    男，年龄10岁，上课注意力不集中，多动半年。患儿上课老走神，好做小动作，做作业特慢，好写错字，算术常对错位，考试成绩不及格，还常与同学吵架、打架，
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
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    多动性障碍

注意缺陷多动障碍（儿童）-手动输入诊断：注意缺陷多动障碍，推荐治疗：患者教育、行为疗法、认知行为治疗、学校干预、药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    患者教育    行为疗法    认知行为治疗    学校干预    药物治疗
    ${Assessment}    Set Variable    注意缺陷多动障碍
    ${Subjective}    Set Variable    男，年龄10岁，上课注意力不集中，多动半年。患儿上课老走神，好做小动作，做作业特慢，好写错字，算术常对错位，考试成绩不及格，还常与同学吵架、打架，
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
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
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
    #Should Contain    ${aj[:5]}    多动性障碍

注意缺陷多动障碍（儿童）-病历内容增加：治疗好转，推荐治疗增加：监测
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    患者教育    行为疗法    认知行为治疗    学校干预    药物治疗    监测
    ${Assessment}    Set Variable    注意缺陷多动障碍
    ${Subjective}    Set Variable    男，年龄10岁，上课注意力不集中，多动半年。患儿上课老走神，好做小动作，做作业特慢，好写错字，算术常对错位，考试成绩不及格，还常与同学吵架、打架，治疗好转
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
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
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
    #Should Contain    ${aj[:5]}    多动性障碍








