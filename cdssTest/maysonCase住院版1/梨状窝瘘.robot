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
#######梨状窝瘘###

梨状窝瘘-主诉:女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘，推荐疑似诊断:梨状窝瘘
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    梨状窝瘘

梨状窝瘘-点击疑似诊断或手动输入：梨状窝瘘，推荐检查：尿常规、血常规、肝功能、肾功能、血电解质、乙肝五项、凝血常规、梅毒血清特异性抗体测定（TPHA等）、颈部B超、电子喉镜检查、心电图、超声心动图、颈部MRI
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    肾功能    尿常规    凝血常规    乙肝五项    梅毒血清特异性抗体测定（TPHA等）    心电图    血常规    血电解质    肝功能    颈部B超    电子喉镜检查    颈部MRI    超声心动图
    ${Assessment}    Set Variable    梨状窝瘘
    ${Subjective}    Set Variable    女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    梨状窝瘘

梨状窝瘘-点击疑似诊断或手动输入：梨状窝瘘，推荐治疗：支撑喉镜下梨状窝瘘封闭术、颈侧入路梨状窝瘘切除术、微创治疗、控制急性感染
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    微创治疗    控制急性感染    支撑喉镜下梨状窝瘘封闭术    颈侧入路梨状窝瘘切除术
    ${Assessment}    Set Variable    梨状窝瘘
    ${Subjective}    Set Variable    女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    梨状窝瘘

梨状窝瘘-病历内容增加：梨状窝瘘封闭术后，推荐治疗增加：预防性抗生素治疗、术后常规抑酸治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防性抗生素治疗    术后常规抑酸治疗    微创治疗    控制急性感染    支撑喉镜下梨状窝瘘封闭术    颈侧入路梨状窝瘘切除术
    ${Assessment}    Set Variable    梨状窝瘘
    ${Subjective}    Set Variable    女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘，梨状窝瘘封闭术后
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    梨状窝瘘

梨状窝瘘-病历内容增加并发症：化脓性甲状腺炎，推荐检查：甲状腺功能
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    尿常规    乙肝五项    血常规    血电解质    肝功能    肾功能    凝血常规    梅毒血清特异性抗体测定（TPHA等）    心电图    甲状腺功能    颈部B超    电子喉镜检查    颈部MRI    超声心动图
    ${Assessment}    Set Variable    梨状窝瘘
    ${Subjective}    Set Variable    女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘，梨状窝瘘封闭术后，化脓性甲状腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    梨状窝瘘

梨状窝瘘-病历内容增加并发症：化脓性甲状腺炎，推荐治疗增加：并发症治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    预防性抗生素治疗    术后常规抑酸治疗    微创治疗    控制急性感染    并发症治疗    支撑喉镜下梨状窝瘘封闭术    颈侧入路梨状窝瘘切除术
    ${Assessment}    Set Variable    梨状窝瘘
    ${Subjective}    Set Variable    女，12岁，咽痛1周，加重伴胸、背部疼痛2天。1周前劳累后出现咽痛，吞咽时加重，伴发热，约38.6℃，伴吐黄色脓样物，无明显臭味。2天前呼吸不畅加重，伴胸、背痛，喉镜显示双侧梨状窝分泌物潴留，不易咳出。上胃肠道造影提示梨状窝后纵隔内条片状高密度影，怀疑梨状窝瘘，梨状窝瘘封闭术后，化脓性甲状腺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"12","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    梨状窝瘘





