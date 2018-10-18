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

# #######白血病
#######伯基特淋巴瘤###

伯基特淋巴瘤-主诉:男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤，推荐疑似诊断:伯基特淋巴瘤
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    Should Contain    ${aj[:5]}    伯基特淋巴瘤

伯基特淋巴瘤-点击疑似诊断或手动输入：伯基特淋巴瘤，推荐检查：血常规、血清HIV病毒检查、血清EB病毒检查、血清HCV病毒检查、血清HBV病毒检查、肝功能、肾功能、电解质全套、血糖、 血清乳酸脱氢酶测定、血清免疫球蛋白、血清碱性磷酸酶测定、常规心电图、超声心动图、组织活检病理检查、组织病理免疫组化抗体、组织荧光原位杂交(FISH)检查、PET- CT、胸部CT、腹部CT、骨盆CT、骨髓活检、 腰穿脑脊液细胞学检查、血型
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    组织活检病理检查    骨髓活检    血清HIV病毒检查    血清HCV病毒检查    血清EB病毒检查    血清HBV病毒检查    组织荧光原位杂交(FISH)检查    组织病理免疫组化抗体    腰穿脑脊液细胞学检查     血型    胸部CT    腹部CT    血常规    肝功能    肾功能    血糖    电解质全套    血清免疫球蛋白    血清乳酸脱氢酶测定    血清碱性磷酸酶测定    常规心电图    骨盆CT     PET-CT    超声心动图
    ${Assessment}    Set Variable    伯基特淋巴瘤
    ${Subjective}    Set Variable    男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    #Should Contain    ${aj[:5]}    伯基特淋巴瘤

伯基特淋巴瘤-点击疑似诊断或手动输入：伯基特淋巴瘤，推荐评估表：Ann Arbor(安娜堡)淋巴瘤分期系统、Cotswolds修订特征分期、Burkitt淋巴瘤的Murphy分期、体力状况ECOG评分、淋巴瘤Deauville标准评分（梅奥版）
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    Burkitt淋巴瘤的Murphy分期    体力状况ECOG评分    淋巴瘤Deauville标准评分（梅奥版）    Ann Arbor(安娜堡)淋巴瘤分期系统    Cotswolds修订特征分期
    ${Assessment}    Set Variable    伯基特淋巴瘤
    ${Subjective}    Set Variable    男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
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
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    伯基特淋巴瘤

伯基特淋巴瘤-点击疑似诊断或手动输入：伯基特淋巴瘤，推荐治疗：水化防治肿瘤溶解综合征、控尿酸防治肿瘤溶解综合征、靶向药物治疗、化疗主要治疗手段、放疗辅助、造血干细胞移植、R-CODOX-M化疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    水化防治肿瘤溶解综合征    控尿酸防治肿瘤溶解综合征    靶向药物治疗    化疗主要治疗手段    放疗辅助    造血干细胞移植    R-CODOX-M化疗
    ${Assessment}    Set Variable    伯基特淋巴瘤
    ${Subjective}    Set Variable    男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    伯基特淋巴瘤

伯基特淋巴瘤-病历内容增加评估表评估结果：ECOG评分4分，推荐治疗增加：姑息性化疗、姑息性支持治疗、R-IVAC化疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    水化防治肿瘤溶解综合征    控尿酸防治肿瘤溶解综合征    靶向药物治疗    放疗辅助    造血干细胞移植    姑息性化疗    姑息性支持治疗    R-CODOX-M化疗    R-IVAC化疗
    ${Assessment}    Set Variable    伯基特淋巴瘤
    ${Subjective}    Set Variable    男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤，ECOG评分4分
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    伯基特淋巴瘤

伯基特淋巴瘤-病历内容进一步增加：化疗后，白细胞减少，推荐治疗增加：补充造血生长因子
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    水化防治肿瘤溶解综合征    控尿酸防治肿瘤溶解综合征    靶向药物治疗    放疗辅助    造血干细胞移植    姑息性化疗    姑息性支持治疗    R-CODOX-M化疗    R-IVAC化疗    补充造血生长因子
    ${Assessment}    Set Variable    伯基特淋巴瘤
    ${Subjective}    Set Variable    男，58岁，发现右颈后淋巴结肿大20天，无明显诱因发现右颈后一月鸡蛋大小的肿大淋巴结，行淋巴结活检术，病理回报：伯基特淋巴瘤，ECOG评分4分，化疗后，白细胞减少
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"58","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    伯基特淋巴瘤














