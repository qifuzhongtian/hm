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

# #############################################第一期1206批典型案例####################################################
# #######巴雷特食管###
# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,推荐疑似诊断应包含:巴雷特食管
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    巴雷特食管


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入：疑似巴雷特食管,推荐检查包含:食管胃十二指肠镜检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    食管胃十二指肠镜检查

# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入：疑似巴雷特食管,推荐检查包含:胃组织活检
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    胃组织活检


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管,推荐治疗方案包含:抗反流治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗反流治疗


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管,推荐治疗方案包含:抗反流手术
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗反流手术



# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生,推荐治疗方案增加:质子泵抑制剂(PPI)治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    质子泵抑制剂(PPI)治疗


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生,推荐治疗方案增加:专科确诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    专科确诊


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生,推荐治疗方案增加:内镜下射频消融术
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    内镜下射频消融术

# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生,推荐治疗方案删除:抗反流治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Not Contain    ${aj}    抗反流治疗

# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生+进一步添加并发症：食管腺癌,推荐检查增加:正电子发射计算机断层显像(PET-CT)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生,食管腺癌
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    正电子发射计算机断层显像(PET-CT)


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生+进一步添加并发症：食管腺癌,推荐检查增加:胸部CT
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生,食管腺癌
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    胸部CT



# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生+进一步添加并发症：食管腺癌,推荐治疗增加:转诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生,食管腺癌
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    转诊


# 第一期:巴雷特食管:主要条件:男,59岁,持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,+手动输入:疑似巴雷特食管+明确诊断:巴雷特食管+明确增生程度:轻度异型增生+进一步添加并发症：食管腺癌,推荐治疗增加:内镜下治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    巴雷特食管
#     ${Subjective}    Set Variable    持续胸痛反胃数月,反酸3个月,呃逆、胸骨后疼痛、吞咽困难,体重减轻,疑似巴雷特食管,轻度异型增生,食管腺癌
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    内镜下治疗





# #######便秘(成人)###

# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月,推荐疑似诊断:便秘
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,62岁,长期便秘30年,加重半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    便秘

# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘,推荐检查:结肠通过时间测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    结肠通过时间测定


# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘,推荐检查:排粪造影
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    排粪造影

# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘,推荐检查:血钙
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血钙


# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘,推荐检查:乳糜泻组套检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    乳糜泻组套检查


# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘,推荐检查增加:甲状腺功能
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    甲状腺功能

# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘,推荐检查增加:细胞免疫学检验
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     #####推荐治疗方案
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    细胞免疫学检验


# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘,推荐治疗方案增加:一般治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    一般治疗


# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘,推荐治疗方案增加:饮食治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    饮食治疗



# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘,推荐治疗方案增加:药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    药物治疗


# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘,推荐治疗方案增加:改进治疗方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    改进治疗方案



# 第一期:便秘(成人):主要条件:男,62岁,长期便秘30年,加重半月+点击疑似诊断或手动输入:便秘+病历内容增加:慢性便秘+病历内容中添加:慢传输型便秘,推荐治疗方案增加:调整膳食性纤维治疗方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    长期便秘30年,加重半月,慢性便秘,慢传输型便秘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"62","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
#     #####推荐治疗方案
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     #####疑似诊断
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    调整膳食性纤维治疗方案





# #######便秘(小儿)########

# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史,推荐疑似诊断应包含:便秘
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    便秘

# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史,推荐检查包含:肛门检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肛门检查


# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史,推荐检查包含:直肠指检
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    直肠指检


# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史,推荐检查包含:神经系统检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    神经系统检查


# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史,推荐检查包含:腹部X线
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    腹部X线



# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘,推荐治疗:一般治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    一般治疗




# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘,推荐治疗:行为调整
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    行为调整



# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘,推荐治疗:非嵌塞性便秘药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    非嵌塞性便秘药物治疗




# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘,推荐治疗:非嵌塞性便秘维持治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    非嵌塞性便秘维持治疗



# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘+病历内容增加：粪便嵌塞,推荐治疗增加:灌肠治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史,粪便嵌塞
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    灌肠治疗


# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘+病历内容增加：粪便嵌塞,推荐治疗增加:粪便嵌塞的药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史,粪便嵌塞
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    粪便嵌塞的药物治疗


# 第一期:便秘(小儿):主要条件:男孩儿,6岁,排便次数减少,排便疼痛,腹胀,反复发生便秘史+点击疑似诊断或手动输入:便秘+病历内容增加：粪便嵌塞+进一步添加并发症：先天性巨结肠症,推荐治疗增加:转诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    便秘
#     ${Subjective}    Set Variable    排便次数减少,排便疼痛,腹胀,反复发生便秘史,粪便嵌塞,先天性巨结肠症
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"6","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    转诊




# # #######成人肝细胞癌########

# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄、尿黄、皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm,推荐疑似诊断:肝细胞癌
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄、尿黄、皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肝细胞癌

# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:肝功能
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肝功能


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:血脂检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血脂检查


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:电解质检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    电解质检查


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:肌酐测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肌酐测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:空腹血糖
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    空腹血糖


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:血常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血常规


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:肿瘤标志物测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肿瘤标志物测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:血清HIV病毒检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血清HIV病毒检查


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:乙型肝炎表面抗原测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    乙型肝炎表面抗原测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:乙型肝炎核心总抗体测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    乙型肝炎核心总抗体测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:甲型肝炎抗体IgM测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    甲型肝炎抗体IgM测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:甲型肝炎抗体IgG测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    甲型肝炎抗体IgG测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:丙型肝炎抗体测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    丙型肝炎抗体测定


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:心电图
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    心电图


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:胸部CT
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    胸部CT


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:腹部CT
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    腹部CT


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐检查:腹部MRI
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    腹部MRI


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐治疗:转诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    转诊


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌,推荐治疗:优化治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    优化治疗


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯,推荐评估表:Child-Pugh计算器
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯
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
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    Child-Pugh计算器



# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯,推荐评估表:体力状况ECOG评分
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯
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
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    体力状况ECOG评分



# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级,推荐治疗方案:局部消融治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    局部消融治疗



# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级,推荐治疗方案:经导管化疗栓塞
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    经导管化疗栓塞



# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级,推荐治疗方案:经导管放疗栓塞
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    经导管放疗栓塞



# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级,推荐治疗方案:外粒子束放疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    外粒子束放疗




# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级,推荐治疗方案:全身治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    全身治疗


# 第一期:成人肝细胞癌:主要条件:男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,检查结果输入：MRI检查显示肝脏占位直径3cm+点击疑似诊断或手动输入：肝细胞癌+病历内容增加：严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级,推荐治疗方案:肝移植
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    肝细胞癌
#     ${Subjective}    Set Variable    男,65岁,1个月前无明显诱因出现眼黄 尿黄 皮肤黄染,MRI检查显示肝脏占位直径3cm,严重肝纤维化、门静脉侵犯+评估表评估结果：ECOG体力状况0级、Child-Pugh分级A级
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
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肝移植




#######蛋白尿########
第一期:蛋白尿:主要条件:患儿,女,13岁,反复蛋白尿半年,推荐疑似诊断:蛋白尿
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    蛋白尿

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:尿常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    尿常规

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:尿沉渣(尿镜检)试验
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    尿沉渣(尿镜检)试验

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:尿蛋白/肌酐比值
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    尿蛋白/肌酐比值

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:24小时尿蛋白定量
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    24小时尿蛋白定量

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:尿有形成分分析
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    尿有形成分分析

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:24小时尿蛋白排泄率
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    24小时尿蛋白排泄率

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:肾动脉彩超检查(双侧)(空腹)
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    肾动脉彩超检查(双侧)(空腹)

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿,推荐检查包含:降尿蛋白治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    降尿蛋白治疗


第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿+病历内容增加:肾小管性蛋白尿,推荐检查增加:尿视黄醇结合蛋白
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    尿视黄醇结合蛋白


第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿+病历内容增加:肾小管性蛋白尿,推荐检查增加:尿α1-微球蛋白测定
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    尿α1-微球蛋白测定


第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿+病历内容增加:肾小管性蛋白尿,推荐检查增加:电解质全套
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    电解质全套


第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿+病历内容增加:肾小管性蛋白尿,推荐检查增加:肾功能
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    肾功能

第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿+病历内容增加:肾小管性蛋白尿,推荐检查增加:血脂检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    血脂检查


第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+点击疑似诊断或手动输入:蛋白尿+病历内容增加:肾小管性蛋白尿,推荐治疗增加:进一步明确病因
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj}    进一步明确病因



第一期:蛋白尿:测试检查,推荐治疗增加:进一步明确病因
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    尿α1-微球蛋白测定    尿视黄醇结合蛋白    肾动脉彩超检查(双侧)(空腹)    肾功能    尿常规    尿沉渣(尿镜检)试验    电解质全套    24小时尿蛋白排泄率    血脂检查    尿有形成分分析    尿蛋白/肌酐比值    24小时尿蛋白定量1
    ${Assessment}    Set Variable    蛋白尿
    ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    # Should Contain    ${aj}    进一步明确病因
    Lists should Be Equal    ${aj}    ${assert}
    # List should contain sub list    ${aj}    ${assert}






# 第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+诊断:蛋白尿+病历内容增加：肾小管性蛋白尿,推荐检查增加:尿视黄醇结合蛋白
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    蛋白尿
#     ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    尿视黄醇结合蛋白


# 第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+诊断:蛋白尿+病历内容增加：肾小管性蛋白尿,推荐检查增加:尿视黄醇结合蛋白
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    蛋白尿
#     ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    尿视黄醇结合蛋白


# 第一期:蛋白尿:主诉：患儿,女,13岁,反复蛋白尿半+诊断:蛋白尿+病历内容增加：肾小管性蛋白尿,推荐治疗方案增加:进一步明确病因
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    蛋白尿
#     ${Subjective}    Set Variable    患儿,女,13岁,反复蛋白尿半年,肾小管性蛋白尿
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"13","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    进一步明确病因


# ####蛋白尿#####

# 第一期:急性肾损伤:主要条件:女,72岁,尿量减少,下肢明显水肿伴恶心1月余,推荐疑似诊断应包含:肾炎
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,72岁,尿量减少,下肢明显水肿伴恶心1月余
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"72","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    肾炎


# 第一期:急性肾损伤:主诉：女,72岁,尿量减少,下肢明显水肿伴恶心1月余+辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）,推荐检查增加:尿常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性肾损伤
#     ${Subjective}    Set Variable    女,72岁,尿量减少,下肢明显水肿伴恶心1月余,辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"72","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    尿常规


# 第一期:急性肾损伤:主诉：女,72岁,尿量减少,下肢明显水肿伴恶心1月余+辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）,推荐评估表包含:急性肾损伤分期评估表
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性肾损伤
#     ${Subjective}    Set Variable    女,72岁,尿量减少,下肢明显水肿伴恶心1月余,辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"72","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    急性肾损伤分期评估表


# 第一期:急性肾损伤:主诉：女,72岁,尿量减少,下肢明显水肿伴恶心1月余+辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）,推荐治疗方案包含:利尿剂治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性肾损伤
#     ${Subjective}    Set Variable    女,72岁,尿量减少,下肢明显水肿伴恶心1月余,辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"72","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    利尿剂治疗


# 第一期:急性肾损伤:主诉：女,72岁,尿量减少,下肢明显水肿伴恶心1月余+辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）+病历中增加：肾前性肾损伤,推荐治疗方案包含:扩容改善肾血流
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    急性肾损伤
#     ${Subjective}    Set Variable    女,72岁,尿量减少,下肢明显水肿伴恶心1月余,辅助检查显示：双下肢重度可凹性水肿,血肌酐248μmol／L（较前明显升高）,病历中增加：肾前性肾损伤
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"72","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    扩容改善肾血流


# #########良性前列腺增生#########
# 第一期:良性前列腺增生:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,推荐疑似诊断应包含:良性前列腺增生
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    良性前列腺增生

# 第一期:良性前列腺增生:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,推荐检查包含:尿常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    良性前列腺增生
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    尿常规


# 第一期:良性前列腺增生:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,推荐治疗方案包含:良性前列腺增生一线药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    良性前列腺增生
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    良性前列腺增生一线药物治疗


# 第一期:良性前列腺增生:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病历内容增加：血清前列腺特异性抗原增高,推荐治疗方案包含:前列腺磁共振增强扫描
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    良性前列腺增生
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病历内容增加：血清前列腺特异性抗原增高
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    前列腺磁共振增强扫描


# 第一期:良性前列腺增生:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病历内容增加：血清前列腺特异性抗原增高+进一步增加并发症：尿潴留,推荐治疗方案包含:留置导尿
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    良性前列腺增生
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病历内容增加：血清前列腺特异性抗原增高,进一步增加并发症：尿潴留
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"56","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    留置导尿



# 第一期:失眠:主要条件:男,49岁,失眠1个月余,加重1周 ,推荐疑似诊断应包含:失眠
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,49岁,失眠1个月余,加重1周
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    失眠



# 第一期:良性前列腺增生:主要条件:男,49岁,失眠1个月余,加重1周+诊断:失眠,推荐检查包含:睡眠脑电图（多导睡眠图）
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,49岁,失眠1个月余,加重1周
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    睡眠脑电图（多导睡眠图）


# 第一期:良性前列腺增生:主要条件:男,49岁,失眠1个月余,加重1周+诊断:失眠,推荐评估表包含:睡眠障碍国际分类第三版(ICSD-3)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    失眠
#     ${Subjective}    Set Variable    男,49岁,失眠1个月余,加重1周
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    睡眠障碍国际分类第三版(ICSD-3)


# 第一期:良性前列腺增生:主要条件:男,49岁,失眠1个月余,加重1周+诊断:失眠,推荐评估表包含:失眠严重指数(ISI)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    失眠
#     ${Subjective}    Set Variable    男,49岁,失眠1个月余,加重1周
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    失眠严重指数(ISI)


# 第一期:良性前列腺增生:主要条件:男,49岁,失眠1个月余,加重1周+诊断:失眠,推荐治疗方案包含:认知行为疗法(CBT)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    失眠
#     ${Subjective}    Set Variable    男,49岁,失眠1个月余,加重1周
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    认知行为疗法(CBT)


# 第一期:良性前列腺增生:主要条件:男,49岁,失眠1个月余,加重1周+诊断:失眠,推荐治疗方案包含:药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    失眠
#     ${Subjective}    Set Variable    男,49岁,失眠1个月余,加重1周
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    药物治疗







# #####吞咽困难######
# 第一期:吞咽困难:主要条件:男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定,推荐疑似诊断应包含:吞咽困难
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"50","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    吞咽困难



# 第一期:吞咽困难:主要条件:男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定+诊断:疑似吞咽困难,推荐检查应包含:胸部X线片（正位）
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    疑似吞咽困难
#     ${Subjective}    Set Variable    男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"50","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    胸部X线片（正位）



# 第一期:吞咽困难:主要条件:男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定+诊断:疑似吞咽困难,推荐评估表应包含:洼田饮水试验
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    疑似吞咽困难
#     ${Subjective}    Set Variable    男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"50","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    洼田饮水试验


# 第一期:吞咽困难:主要条件:男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳+诊断:口咽性吞咽困难,推荐治疗方案应包含:转诊耳鼻咽喉科或消化科
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    口咽性吞咽困难
#     ${Subjective}    Set Variable    男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"50","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    转诊耳鼻咽喉科或消化科


# 第一期:吞咽困难:主要条件:男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳+诊断:口咽性吞咽困难,推荐治疗方案应包含:转诊神经内科
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    口咽性吞咽困难
#     ${Subjective}    Set Variable    男,50岁,吞咽困难1年,无吞咽疼痛,无反酸、烧心、胸骨后疼痛等,食欲、体重稳定
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    pati∑entInfo={"gender":"1","age":"50","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    转诊神经内科




# ###########胃食管反流病###########

# 第一期:胃食管反流病:主要条件:男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月,推荐疑似诊断应包含:胃食管反流病
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"46","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    胃食管反流病


# 第一期:胃食管反流病:主要条件:男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月+诊断:疑似胃食管反流病,推荐检查应包含:食管阻抗-PH监测
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    疑似胃食管反流病
#     ${Subjective}    Set Variable    男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"46","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    食管阻抗-PH监测



# 第一期:胃食管反流病:主要条件:男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月+诊断:胃食管反流病,推荐评估表应包含:洛杉矶分级
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    胃食管反流病
#     ${Subjective}    Set Variable    男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"46","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    洛杉矶分级



# 第一期:胃食管反流病:主要条件:男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月+诊断:胃食管反流病+病历内容中增加:食管狭窄,推荐治疗方案应包含:胃镜下食管扩张术
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    胃食管反流病
#     ${Subjective}    Set Variable    男,46岁,反酸、胸骨后烧灼感半年,吞咽不畅、胸痛半月,食管狭窄
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"46","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     Should Contain    ${aj}    胃镜下食管扩张术



# #########胃息肉#########

# 第一期:胃息肉:主要条件:男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦+病历内容输入:胃镜下可见黏膜表面圆形或椭圆形隆起样病变,推荐疑似诊断应包含:胃息肉
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦,胃镜下可见黏膜表面圆形或椭圆形隆起样病变
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    胃息肉



# 第一期:胃息肉:主要条件:男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦+病历内容输入:胃镜下可见黏膜表面圆形或椭圆形隆起样病变+诊断输入:胃息肉,推荐检查应包含:食管胃十二指肠镜检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦,胃镜下可见黏膜表面圆形或椭圆形隆起样病变
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    食管胃十二指肠镜检查



# 第一期:胃息肉:主要条件:男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦+病历内容输入:胃镜下可见黏膜表面圆形或椭圆形隆起样病变+诊断输入:胃息肉+病历内容进一步增加：腺瘤性息肉病家族史,推荐检查应包含:全结肠镜检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦,胃镜下可见黏膜表面圆形或椭圆形隆起样病变,腺瘤性息肉病家族史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    全结肠镜检查



# 第一期:胃息肉:主要条件:男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦+病历内容输入:胃镜下可见黏膜表面圆形或椭圆形隆起样病变+诊断输入:胃息肉+病历内容进一步增加：腺瘤性息肉病家族史,推荐治疗方案应包含:会诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦,胃镜下可见黏膜表面圆形或椭圆形隆起样病变,腺瘤性息肉病家族史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    会诊


# 第一期:胃息肉:主要条件:男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦+病历内容输入:胃镜下可见黏膜表面圆形或椭圆形隆起样病变+诊断输入:胃息肉+病历内容进一步增加：腺瘤性息肉病家族史+进一步增加并发症：幽门螺旋杆菌感染,推荐治疗方案应包含:根除幽门螺旋杆菌治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,39岁,上腹部隐痛不适2个月。食欲下降、乏力、消瘦,胃镜下可见黏膜表面圆形或椭圆形隆起样病变,腺瘤性息肉病家族史,幽门螺旋杆菌感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"39","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    根除幽门螺旋杆菌治疗


# #########下肢静脉曲张#######

# 第一期:下肢静脉曲张:主要条件:女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月,推荐疑似诊断应包含:下肢静脉曲张
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    下肢静脉曲张


# 第一期:下肢静脉曲张:主要条件:女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月,推荐检查应包含:深静脉瓣膜功能检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    深静脉瓣膜功能检查



# 第一期:下肢静脉曲张:主要条件:女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月,推荐评估表应包含:静脉分类系统CEAP分级
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    静脉分类系统CEAP分级


# 第一期:下肢静脉曲张:主要条件:女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月+诊断输入:,推荐治疗方案应包含:随访观察
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    下肢静脉曲张
#     ${Subjective}    Set Variable    女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    随访观察


# 第一期:下肢静脉曲张:主要条件:女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月+诊断输入:下肢静脉曲张+评估表评估结果：静脉分类系统CEAP分级C2级,推荐治疗方案应包含:加压治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    下肢静脉曲张
#     ${Subjective}    Set Variable    女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月,静脉分类系统CEAP分级C2级
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    加压治疗


# 第一期:下肢静脉曲张:主要条件:女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月+诊断输入:下肢静脉曲张+评估表评估结果：静脉分类系统CEAP分级C2级+进一步添加并发症：静脉性溃疡,推荐治疗方案应包含:综合个体化治疗方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    下肢静脉曲张
#     ${Subjective}    Set Variable    女,35岁,左下肢浅静脉曲张,小腿胀痛不适1月,静脉分类系统CEAP分级C2级,静脉性溃疡
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    综合个体化治疗方案







# ################第二期1214############
# 第二期:阿尔茨海默病痴呆:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁,推荐疑似诊断应包含:阿尔茨海默病痴呆
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    阿尔茨海默病痴呆


# 第二期:阿尔茨海默病痴呆:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁+诊断:阿尔茨海默病痴呆,推荐疑似诊断应包含:脑脊液常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    阿尔茨海默病痴呆
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    脑脊液常规


# 第二期:阿尔茨海默病痴呆:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁+诊断:阿尔茨海默病痴呆+病历内容进一步增加：认知障碍,推荐疑似诊断应包含:药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    阿尔茨海默病痴呆
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁,认知障碍
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    药物治疗



# 第二期:阿尔茨海默病痴呆:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁+诊断:阿尔茨海默病痴呆+病历内容进一步增加：认知障碍+病历内容进一步增加：幻觉,推荐疑似诊断应包含:抗精神病药治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    阿尔茨海默病痴呆
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁,认知障碍,幻觉
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗精神病药治疗


# 第二期:阿尔茨海默病痴呆:主要条件:男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月+病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁+诊断:阿尔茨海默病痴呆+病历内容进一步增加：认知障碍+病历内容进一步增加：幻觉+病历内容进一步增加：抑郁,推荐疑似诊断应包含:抗抑郁药治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    阿尔茨海默病痴呆
#     ${Subjective}    Set Variable    男,56岁,夜尿增多 4年,尿频、尿急、尿不尽感2月,病史:近事遗忘,经常找不到东西,近1月来重复问同一个问题,熟人姓名常常想不起来,爱生气,脾气暴躁,认知障碍,幻觉,抑郁
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗抑郁药治疗


# ###########白细胞减少#########


# 第二期:白细胞减少:主要条件:女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L,推荐疑似诊断应包含:白细胞减少
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    白细胞减少


# 第二期:白细胞减少:主要条件:女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L+诊断输入：白细胞减少,推荐检查应包含:血常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    白细胞减少
#     ${Subjective}    Set Variable    女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血常规


# 第二期:白细胞减少:主要条件:女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L+诊断输入：白细胞减少,推荐检查应包含:药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    白细胞减少
#     ${Subjective}    Set Variable    女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L,白细胞减少
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    药物治疗


# 第二期:白细胞减少:主要条件:女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L+诊断输入：白细胞减少+病历内容增加：淋巴细胞减少,推荐检查应包含:会诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    白细胞减少
#     ${Subjective}    Set Variable    女,35岁,近几日出现乏力、头晕,体检发现白细胞减少,白细胞计数2.8x10E9/L,白细胞减少,淋巴细胞减少
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    会诊



# ########鼻咽癌#########

# 第二期:鼻咽癌:主要条件:男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞,推荐疑似诊断应包含:疑似鼻咽恶性肿瘤
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    疑似鼻咽恶性肿瘤

# 第二期:鼻咽癌:主要条件:男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞+诊断:疑似鼻咽癌,推荐疑似诊断应包含:疑似鼻咽恶性肿瘤
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    疑似鼻咽癌
#     ${Subjective}    Set Variable    男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    疑似鼻咽恶性肿瘤


# 第二期:鼻咽癌:主要条件:男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞+诊断:鼻咽癌,推荐检查应包含:头颅钆增强MRI
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    鼻咽癌
#     ${Subjective}    Set Variable    男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    头颅钆增强MRI

# 第二期:鼻咽癌:主要条件:男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞+诊断:鼻咽癌,推荐检查应包含:鼻咽癌UICC/AJCC分期第8版
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    鼻咽癌
#     ${Subjective}    Set Variable    男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    鼻咽癌UICC/AJCC分期第8版

# 第二期:鼻咽癌:主要条件:男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞+诊断:鼻咽癌+病历内容补充评估结果：III期鼻咽癌,推荐检查应包含:正电子发射计算机断层显像(PET-CT)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    鼻咽癌
#     ${Subjective}    Set Variable    男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞,III期鼻咽癌
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    正电子发射计算机断层显像(PET-CT)

# 第二期:鼻咽癌:主要条件:男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞+诊断:鼻咽癌+病历内容补充评估结果：III期鼻咽癌,推荐检查应包含:转诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    鼻咽癌
#     ${Subjective}    Set Variable    男,45岁,双侧无明显诱因性耳鸣1年,加重3月伴头痛、鼻塞,III期鼻咽癌
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    转诊



# 第二期:变应性鼻结膜炎:主要条件:女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天,推荐疑似诊断应包含:变应性鼻结膜炎
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    变应性鼻结膜炎


# 第二期:变应性鼻结膜炎:主要条件:女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天+诊断:变应性鼻结膜炎,推荐疑似诊断应包含:鼻腔分泌物涂片
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    变应性鼻结膜炎
#     ${Subjective}    Set Variable    女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    鼻腔分泌物涂片



# 第二期:变应性鼻结膜炎:主要条件:女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天+诊断:变应性鼻结膜炎,推荐治疗方案应包含:变应原回避治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    变应性鼻结膜炎
#     ${Subjective}    Set Variable    女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    变应原回避治疗



# 第二期:变应性鼻结膜炎:主要条件:女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天+诊断:变应性鼻结膜炎+病历内容增加：中度变应性鼻结膜炎,推荐治疗方案应包含:鼻用皮质类固醇激素为基础的治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    变应性鼻结膜炎
#     ${Subjective}    Set Variable    女,30岁,无明显诱因出现鼻塞、鼻痒、打喷嚏三天,加重半天,伴有眼痒,结膜充血1天,中度变应性鼻结膜炎
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    鼻用皮质类固醇激素为基础的治疗



# ########痤疮##########

# 第二期:痤疮:主要条件:女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节,推荐疑似诊断应包含:痤疮
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    痤疮

# 第二期:痤疮:主要条件:女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节+诊断:痤疮,推荐治疗方案应包含:局部治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    痤疮
#     ${Subjective}    Set Variable    女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    局部治疗

# 第二期:痤疮:主要条件:女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节+诊断:痤疮+病历内容中增加:非炎性痤疮,推荐治疗方案应包含:初始外用药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    痤疮
#     ${Subjective}    Set Variable    女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节,非炎性痤疮
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    初始外用药物治疗


# 第二期:痤疮:主要条件:女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节+诊断:痤疮+病历内容中增加:非炎性痤疮+病历内容中增加：重度炎性痤疮,推荐治疗方案应包含:转诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    痤疮
#     ${Subjective}    Set Variable    女,28岁,1年前患者面部出现小米粒大小红色丘疹,皮肤油腻,兼有脓疱、结节,非炎性痤疮,重度炎性痤疮
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"28","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    转诊


# ############癫痫持续状态#########
# 第二期:癫痫持续状态:主要条件:女,3天,突发四肢轻微抽动,肢体奇异的强直动作+诊断:癫痫持续状态,推荐疑似诊断应包含:癫痫持续状态
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,3天,突发四肢轻微抽动,肢体奇异的强直动作
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"3","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    癫痫持续状态



# 第二期:癫痫持续状态:主要条件:女,3天,突发四肢轻微抽动,肢体奇异的强直动作+诊断:癫痫持续状态,推荐疑似诊断应包含:血常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    女,3天,突发四肢轻微抽动,肢体奇异的强直动作
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"3","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血常规



# 第二期:癫痫持续状态:主要条件:女,3天,突发四肢轻微抽动,肢体奇异的强直动作+诊断:癫痫持续状态,推荐治疗方案应包含:支持性治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    女,3天,突发四肢轻微抽动,肢体奇异的强直动作
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"3","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    支持性治疗



# 第二期:癫痫持续状态:主要条件:女,3天,突发四肢轻微抽动,肢体奇异的强直动作+诊断:癫痫持续状态+病历内容进一步补充：药物治疗后,癫痫仍有发作,癫痫发作16分钟,推荐治疗方案应包含:左乙拉西坦治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    女,3天,突发四肢轻微抽动,肢体奇异的强直动作,药物治疗后,癫痫仍有发作,癫痫发作16分钟
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"3","ageType":"天","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    左乙拉西坦治疗


# ###########癫痫持续状态（成人）#########

# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史,推荐疑似诊断应包含:癫痫持续状态
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    癫痫持续状态



# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史+诊断:癫痫持续状态,推荐检查应包含:血常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血常规


# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史+诊断:癫痫持续状态,推荐评估表应包含:癫痫持续状态初始评估(梅奥版)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    癫痫持续状态初始评估(梅奥版)


# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史+诊断:癫痫持续状态,推荐治疗方案包含:长期使用抗癫痫药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    长期使用抗癫痫药物治疗



# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史+诊断:癫痫持续状态+病历内容进一步补充：非惊厥性癫痫持续状态,推荐检查包含:动脉血气分析
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史,非惊厥性癫痫持续状态
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    动脉血气分析


# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史+诊断:癫痫持续状态+病历内容进一步补充：非惊厥性癫痫持续状态,推荐治疗方案包含:完成初始评估积极去除诱因
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史,非惊厥性癫痫持续状态
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    完成初始评估积极去除诱因


# 第二期:癫痫持续状态（成人）:主要条件:男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史+诊断:癫痫持续状态+病历内容进一步补充：非惊厥性癫痫持续状态,推荐治疗方案包含:非惊厥性癫痫持续状态急诊治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    癫痫持续状态
#     ${Subjective}    Set Variable    男,30岁,突发意识丧失,四肢抽搐急性发作1小时,有癫痫发作史,非惊厥性癫痫持续状态
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    非惊厥性癫痫持续状态急诊治疗



# ###############儿童哮喘############
# 第二期:儿童哮喘:主要条件:女,10岁,反复咳喘1年,加重3天,推荐疑似诊断应包含:哮喘
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    女,10岁,反复咳喘1年,加重3天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    哮喘


# 第二期:儿童哮喘:主要条件:女,10岁,反复咳喘1年,加重3天+诊断:哮喘,推荐检查断应包含:胸部X线
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    哮喘
#     ${Subjective}    Set Variable    女,10岁,反复咳喘1年,加重3天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    胸部X线


# 第二期:儿童哮喘:主要条件:女,10岁,反复咳喘1年,加重3天+诊断:哮喘,推荐检查断应包含:5~18岁儿童哮喘分类(梅奥版)
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    哮喘
#     ${Subjective}    Set Variable    女,10岁,反复咳喘1年,加重3天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    5~18岁儿童哮喘分类(梅奥版)


# 第二期:儿童哮喘:主要条件:女,10岁,反复咳喘1年,加重3天+诊断:哮喘,推荐治疗方案应包含:预防治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    哮喘
#     ${Subjective}    Set Variable    女,10岁,反复咳喘1年,加重3天
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    预防治疗



# 第二期:儿童哮喘:主要条件:女,10岁,反复咳喘1年,加重3天+诊断:哮喘+病历内容增加:上呼吸道感染,推荐治疗方案应包含:预防治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    哮喘
#     ${Subjective}    Set Variable    女,10岁,反复咳喘1年,加重3天,上呼吸道感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Not Contain    ${aj}    预防治疗



# 第二期:儿童哮喘:主要条件:女,10岁,反复咳喘1年,加重3天+诊断:哮喘+病历内容增加:上呼吸道感染+病历内容增加：运动性哮喘,推荐治疗方案应包含:运动性哮喘的药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    哮喘
#     ${Subjective}    Set Variable    女,10岁,反复咳喘1年,加重3天,上呼吸道感染,运动性哮喘
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"0","age":"10","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    运动性哮喘的药物治疗




# #########关节感染（小儿）#######

# 第二期:关节感染（小儿）:主要条件:男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按,推荐疑似诊断应包含:疑似关节感染
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"4","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    疑似关节感染


# 第二期:关节感染（小儿）:主要条件:男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按+诊断:关节感染,推荐推荐检查应包含:血常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    关节感染
#     ${Subjective}    Set Variable    男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"4","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血常规

# 第二期:关节感染（小儿）:主要条件:男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按+诊断:关节感染+进一步补充检查结果:CRP20mg/L,推荐推荐检查应包含:血培养
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    关节感染
#     ${Subjective}    Set Variable    男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按,CRP20mg/L
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"4","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    血培养

# 第二期:关节感染（小儿）:主要条件:男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按+诊断:关节感染+进一步补充检查结果:CRP20mg/L+进一步确诊：化脓性关节炎,推荐治疗方案应包含:抗感染治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    关节感染
#     ${Subjective}    Set Variable    男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按,CRP20mg/L,化脓性关节炎
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"4","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗感染治疗

# 第二期:关节感染（小儿）:主要条件:男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按+诊断:关节感染+进一步补充检查结果:CRP20mg/L+进一步确诊：化脓性关节炎,推荐治疗方案应包含:手术治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    关节感染
#     ${Subjective}    Set Variable    男,4岁,患儿发热、哭闹,查体:T：39.3℃,右髋部及大腿近端肿胀,皮温高于左侧,右侧髋部肿胀疼痛拒按,CRP20mg/L,化脓性关节炎
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"4","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    手术治疗




# #########雷诺综合征#########

# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常,推荐疑似诊断应包含:雷诺综合征
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    雷诺综合征


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征,推荐检查应包含:抗核抗体测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗核抗体测定


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征,推荐检查应包含:抗着丝点抗体测定
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗着丝点抗体测定


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征,推荐治疗方案应包含:一般治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    一般治疗


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征,推荐治疗方案应包含:初始药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    初始药物治疗


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征,推荐治疗方案应包含:生物反馈治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    生物反馈治疗


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征+病历内容增加：继发性雷诺综合征,推荐治疗方案应包含:去除继发性雷诺综合征诱因
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常,继发性雷诺综合征
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    去除继发性雷诺综合征诱因

# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征+病历内容增加：继发性雷诺综合征,推荐治疗方案应包含:会诊
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常,继发性雷诺综合征
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    会诊


# 第二期:雷诺综合征:主要条件:男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常+诊断输入:雷诺综合征+病历内容增加：继发性雷诺综合征,推荐治疗方案不应包含:初始药物治疗
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    雷诺综合征
#     ${Subjective}    Set Variable    男,49岁,双手指麻木感4月余,寒冷刺激后皮色发白后发紫,伴麻木、感觉减退,病史:4月前受冷刺激后,突然出现双手指皮色发白,继而发紫,从指尖开始,逐渐扩展至整个手指,伴有局部发凉、麻木、针刺感和感觉减退。持续数分钟后逐渐转为潮红、皮肤转暖、并感烧样胀前,最后皮肤颜色恢复正常,继发性雷诺综合征
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Not Contain    ${aj}    初始药物治疗


# ##########尿路感染#########
# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,推荐疑似诊断应包含:尿路感染
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿路感染


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,推荐疑似诊断应包含:尿路感染
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿路感染



# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染,推荐检查应包含:尿常规
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿常规

# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染,推荐检查应包含:尿沉渣(尿镜检)试验
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿沉渣(尿镜检)试验


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染,推荐检查应包含:尿液革兰氏染色
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿液革兰氏染色



# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染,推荐治疗方案应包含:随访
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    随访



# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染,推荐治疗方案应包含:抗生素治疗原则
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    抗生素治疗原则


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染,推荐治疗方案应包含:纠正复杂性尿路感染危险因素
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    纠正复杂性尿路感染危险因素


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染,推荐检查应包含:泌尿系超声
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    泌尿系超声



# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染,推荐检查应包含:膀胱镜检查
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    膀胱镜检查



# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染,推荐检查应包含:泌尿系CT
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    泌尿系CT



# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染,推荐检查应包含:盆腔CT
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    盆腔CT


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染+病历内容进一步补充：导尿管相关性尿路感染,推荐检查应包含:盆腔CT
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染,导尿管相关性尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    盆腔CT


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染+病历内容进一步补充：导尿管相关性尿路感染,推荐治疗方案应包含:留置导尿管替代方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染,导尿管相关性尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    留置导尿管替代方案


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染+病历内容进一步补充：导尿管相关性尿路感染,推荐治疗方案应包含:住院抗菌治疗方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染,导尿管相关性尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    住院抗菌治疗方案


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染+病历内容进一步补充：导尿管相关性尿路感染,推荐治疗方案应包含:门诊经验性抗菌一线方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染,导尿管相关性尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    门诊经验性抗菌一线方案


# 第二期:尿路感染:主要条件:尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+病历内容输入：尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性+诊断:尿路感染+病历内容进一步补充：反复尿路感染+病历内容进一步补充：导尿管相关性尿路感染,推荐治疗方案应包含:门诊经验性抗菌二线方案
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路感染
#     ${Subjective}    Set Variable    尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,尿常规检查发现白细胞增多、红细胞增多及尿硝酸盐阳性,反复尿路感染,导尿管相关性尿路感染
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    门诊经验性抗菌二线方案


# #############尿路结石###########
# 第二期:尿路结石:主要条件:男,35岁,无明显诱因腰痛2天,剧烈腰痛2小时,现病史:2天前无明显诱因突然出现腰痛,疼痛呈间歇性隐痛。2小时前突发剧烈腰痛,伴恶心呕吐,呕吐胃内容物+病历内容输入：影像学检查显示尿路有结石,推荐疑似诊断应包含:尿路结石
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable
#     ${Subjective}    Set Variable    男,35岁,无明显诱因腰痛2天,剧烈腰痛2小时,现病史:2天前无明显诱因突然出现腰痛,疼痛呈间歇性隐痛。2小时前突发剧烈腰痛,伴恶心呕吐,呕吐胃内容物,影像学检查显示尿路有结石
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿路结石


# 第二期:尿路结石:主要条件:男,35岁,无明显诱因腰痛2天,剧烈腰痛2小时,现病史:2天前无明显诱因突然出现腰痛,疼痛呈间歇性隐痛。2小时前突发剧烈腰痛,伴恶心呕吐,呕吐胃内容物+病历内容输入：影像学检查显示尿路有结石+诊断:尿路结石,推荐疑似诊断应包含:尿路结石的结石病因分析
#     [Documentation]    断言:""
#     # ${timestamp}    Get Time    epoch
#     ${Assessment}    Set Variable    尿路结石
#     ${Subjective}    Set Variable    男,35岁,无明显诱因腰痛2天,剧烈腰痛2小时,现病史:2天前无明显诱因突然出现腰痛,疼痛呈间歇性隐痛。2小时前突发剧烈腰痛,伴恶心呕吐,呕吐胃内容物,影像学检查显示尿路有结石
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":"1","age":"35","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ...    newTestList=
#     ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#     # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#     # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
#     Should Contain    ${aj}    尿路结石的结石病因分析


