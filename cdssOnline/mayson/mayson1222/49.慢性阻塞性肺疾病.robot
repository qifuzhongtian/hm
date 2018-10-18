*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
###############################################推荐检查####################################################

#######201712224            慢性阻塞性肺疾病急性加重&黏液嵌塞｜肺叶萎陷          纤维支气管镜检查        鉴别检查
#######慢性阻塞性肺疾病急性加重&黏液嵌塞

推荐检查2行-1 主要条件:慢性阻塞性肺疾病急性加重&黏液嵌塞,推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 黏液嵌塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规

推荐检查2行-2 主要条件:慢性阻塞性肺疾病急性加重&肺叶萎陷,推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 肺叶萎陷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规


#########201712224          慢性阻塞性肺疾病        慢性阻塞性肺疾病急性加重    肺功能检查   肺功能检查是确诊COPD的必备条件，应用支气管舒张剂后，FEV1/FVC<0.70表明患者存在持续性气流阻塞，即COPD。所有的医务工作者在对COPD患者进行诊治的时候，必须参考肺功能结果  确诊检查
推荐检查3行-1 主要条件:慢性阻塞性肺疾病,推荐检查包含:肺功能检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性阻塞性肺疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肺功能检查


#########201712224          慢性阻塞性肺疾病            血常规 全血细胞计数可明确患者有无红细胞增多症或出血  鉴别检查

推荐检查4行-1 主要条件:慢性阻塞性肺疾病,推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性阻塞性肺疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规

推荐检查5行-1 主要条件:慢性阻塞性肺疾病,推荐检查包含:血生化
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性阻塞性肺疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血生化

#######201712224            早发型慢性阻塞性肺疾病｜慢性阻塞性肺病可疑α-1抗胰蛋白酶缺乏         染色体核型分析 α-1抗胰蛋白酶(A1AT)是一种保护肺部免受肺气肿破坏的分泌型糖蛋白。正常的表型是PiMM。A1AT缺乏是一种常染色体隐性遗传病(14号染色体)，也是肺气肿最常见的遗传性病因。该病最常与PiZZ表型相关  鉴别检查
#######早发型慢性阻塞性肺疾病｜慢性阻塞性肺病可疑α-1抗胰蛋白酶缺乏
#######早发型慢性阻塞性肺疾病 慢性阻塞性肺病可疑α-1抗胰蛋白酶缺乏

推荐检查6行-1 主要条件:早发型慢性阻塞性肺疾病,推荐检查包含:染色体核型分析
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    早发型慢性阻塞性肺疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    染色体核型分析


推荐检查6行-2 主要条件:慢性阻塞性肺病可疑α-1抗胰蛋白酶缺乏,推荐检查包含:染色体核型分析
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性阻塞性肺病可疑α-1抗胰蛋白酶缺乏
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"30","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    染色体核型分析




######################################推荐治疗方案##########################################################
#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&晚期心肺疾病｜中度气流受限｜重度气流受限｜第一秒用力呼气容积<50%预计值｜FEV1<50%预计值｜慢性阻塞性肺疾病门诊治疗无效｜肺减容术术前｜肺移植术前          转诊  转诊给呼吸科医生    无
#########慢性阻塞性肺疾病&晚期心肺疾病｜中度气流受限｜重度气流受限｜第一秒用力呼气容积<50%预计值｜FEV1<50%预计值｜慢性阻塞性肺疾病门诊治疗无效｜肺减容术术前｜肺移植术前
#########慢性阻塞性肺疾病&晚期心肺疾病 中度气流受限 重度气流受限 第一秒用力呼气容积<50%预计值 FEV1<50%预计值 慢性阻塞性肺疾病门诊治疗无效 肺减容术术前 肺移植术前
#########慢性阻塞性肺疾病& 中度气流受限 重度气流受限 第一秒用力呼气容积49%预计值 FEV1 49%预计值 慢性阻塞性肺疾病门诊治疗无效 肺减容术术前 肺移植术前


推荐治疗方案2行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&晚期心肺疾病,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 晚期心肺疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&中度气流受限,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 中度气流受限
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-3 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&重度气流受限,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 重度气流受限
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-4 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&第一秒用力呼气容积49%预计值,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 第一秒用力呼气容积49%预计值
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-5 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&FEV1:49%预计值,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 FEV1:49%预计值
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-6 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&慢性阻塞性肺疾病门诊治疗无效,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病门诊治疗无效
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-7 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺减容术术前,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺减容术术前
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


推荐治疗方案2行-8 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺移植术前,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺移植术前
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转诊


#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&肺大疱            戒烟  COPD管理基石包括戒烟和尼古丁替代/生物行为疗法   无

推荐治疗方案3行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺大疱,推荐方案:戒烟
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺大疱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     戒烟



#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&肺大疱            戒烟  COPD管理基石包括戒烟和尼古丁替代/生物行为疗法   无
推荐治疗方案4行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺大疱,推荐方案:尼古丁替代疗法
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺大疱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     尼古丁替代疗法


#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&肺大疱            戒烟  COPD管理基石包括戒烟和尼古丁替代/生物行为疗法   无
推荐治疗方案5行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺大疱,推荐方案:生物行为疗法
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺大疱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     生物行为疗法


#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&气流受限严重程度分级Ⅰ期｜气流受限严重程度分级Ⅱ期｜肺大疱          支气管扩张剂治疗    常用于治疗COPD的支气管扩张剂包括β2受体激动剂、抗胆碱能药物和甲基黄嘌呤类药物。治疗选择取决于药物的可及性和患者的反应
#########慢性阻塞性肺疾病&气流受限严重程度分级Ⅰ期｜气流受限严重程度分级Ⅱ期｜肺大疱
#########慢性阻塞性肺疾病&气流受限严重程度分级Ⅰ期 气流受限严重程度分级Ⅱ期 肺大疱

推荐治疗方案6行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅰ期,推荐方案:支气管扩张剂治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅰ期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     支气管扩张剂治疗

推荐治疗方案6行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅱ期,推荐方案:支气管扩张剂治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅱ期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     支气管扩张剂治疗

推荐治疗方案6行-3 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺大疱,推荐方案:支气管扩张剂治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺大疱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     支气管扩张剂治疗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病急性加重            糖皮质激素治疗 频繁急性加重的患者可使用吸入型糖皮质激素，联用β2受体激动剂、抗胆碱能药物和(或)茶碱可能给肺功能和健康状况带来额外的改善

推荐治疗方案7行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病急性加重,推荐方案:糖皮质激素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     糖皮质激素治疗


#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病急性加重            糖皮质激素治疗 频繁急性加重的患者可使用吸入型糖皮质激素，联用β2受体激动剂、抗胆碱能药物和(或)茶碱可能给肺功能和健康状况带来额外的改善

推荐治疗方案8行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅲ期,推荐方案:糖皮质激素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅲ期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     糖皮质激素治疗

#########201712224  慢性阻塞性肺疾病    中度慢性阻塞性肺疾病｜重度慢性阻塞性肺疾病｜极重度慢性阻塞性肺疾病&支气管扩张剂单药治疗效果不佳            维持治疗
#########中度慢性阻塞性肺疾病｜重度慢性阻塞性肺疾病｜极重度慢性阻塞性肺疾病&支气管扩张剂单药治疗效果不佳
#########  &

推荐治疗方案9行-1 诊断条件:慢性阻塞性肺疾病+主要条件:中度慢性阻塞性肺疾病&支气管扩张剂单药治疗效果不佳,推荐方案:维持治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    中度慢性阻塞性肺疾病 支气管扩张剂单药治疗效果不佳
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     维持治疗


推荐治疗方案9行-2 诊断条件:慢性阻塞性肺疾病+主要条件:重度慢性阻塞性肺疾病&支气管扩张剂单药治疗效果不佳,推荐方案:维持治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    重度慢性阻塞性肺疾病 支气管扩张剂单药治疗效果不佳
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     维持治疗


推荐治疗方案9行-3 诊断条件:慢性阻塞性肺疾病+主要条件:极重度慢性阻塞性肺疾病&支气管扩张剂单药治疗效果不佳,推荐方案:维持治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    极重度慢性阻塞性肺疾病 支气管扩张剂单药治疗效果不佳
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     维持治疗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&长效支气管扩张剂联合治疗效果不佳           联合用药治疗
#########慢性阻塞性肺疾病&长效支气管扩张剂联合治疗效果不佳

推荐治疗方案10行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&长效支气管扩张剂联合治疗效果不佳,推荐方案:联合用药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 长效支气管扩张剂联合治疗效果不佳
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     联合用药治疗

#########慢性阻塞性肺疾病&血氧饱和度88%

推荐治疗方案11行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&血氧饱和度88%,推荐方案:辅助性氧疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 血氧饱和度88%
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     辅助性氧疗

#########慢性阻塞性肺疾病&血氧饱和度88%

推荐治疗方案12行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病急性加重,推荐方案:辅助性氧疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     辅助性氧疗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&慢性呼吸衰竭｜气流受限严重程度分级Ⅳ期｜肺大疱            长期氧疗    如果出现慢性呼吸衰竭，加用长期氧疗，考虑手术治疗    无
#########慢性阻塞性肺疾病&气流受限严重程度分级I期
推荐治疗方案13行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级I期,推荐方案:接种流感疫苗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级I期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     接种流感疫苗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&慢性呼吸衰竭｜气流受限严重程度分级Ⅳ期｜肺大疱            长期氧疗    如果出现慢性呼吸衰竭，加用长期氧疗，考虑手术治疗    无
#########慢性阻塞性肺疾病&慢性呼吸衰竭｜气流受限严重程度分级Ⅳ期｜肺大疱
#########慢性阻塞性肺疾病&慢性呼吸衰竭 气流受限严重程度分级Ⅳ期 肺大疱

推荐治疗方案14行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&慢性呼吸衰竭,推荐方案:长期氧疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 慢性呼吸衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     长期氧疗

推荐治疗方案14行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅳ期,推荐方案:长期氧疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅳ期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     长期氧疗

推荐治疗方案14行-3 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺大疱,推荐方案:长期氧疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺大疱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     长期氧疗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&慢性呼吸衰竭｜气流受限严重程度分级Ⅳ期            手术治疗    如果出现慢性呼吸衰竭，加用长期氧疗，考虑手术治疗    无

推荐治疗方案15行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&慢性呼吸衰竭,推荐方案:手术治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 慢性呼吸衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     手术治疗

推荐治疗方案15行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅳ期,推荐方案:手术治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅳ期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     手术治疗

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重            支气管扩张剂联合激素治疗    慢性阻塞性肺疾病(COPD)急性加重患者可雾化吸入或吸入型支气管扩张剂及全身皮质类固醇激素，全身皮质类固醇激素一旦病情稳定，逐渐减量

推荐治疗方案16行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重,推荐方案:支气管扩张剂联合激素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     支气管扩张剂联合激素治疗


#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重            支气管扩张剂联合激素治疗    慢性阻塞性肺疾病(COPD)急性加重患者可雾化吸入或吸入型支气管扩张剂及全身皮质类固醇激素，全身皮质类固醇激素一旦病情稳定，逐渐减量

推荐治疗方案17行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重,推荐方案:无创通气(BIPAP)
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     无创通气(BIPAP)

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重            支气管扩张剂联合激素治疗    慢性阻塞性肺疾病(COPD)急性加重患者可雾化吸入或吸入型支气管扩张剂及全身皮质类固醇激素，全身皮质类固醇激素一旦病情稳定，逐渐减量

推荐治疗方案18行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重,推荐方案:气管插管
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     气管插管

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重            机械通气        无

推荐治疗方案19行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重,推荐方案:机械通气
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     机械通气

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重&心力衰竭           合并症治疗
#########慢性阻塞性肺疾病急性加重&心力衰竭

推荐治疗方案20行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&心力衰竭,推荐方案:合并症治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     合并症治疗

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重&胸腔积液           胸腔穿刺    对中等至大量胸腔积液患者行胸腔穿刺   无

推荐治疗方案21行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&胸腔积液,推荐方案:胸腔穿刺
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 胸腔积液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     胸腔穿刺

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重&胸腔积液&疑似肺栓塞｜肺栓塞     气胸  抗凝治疗
#########慢性阻塞性肺疾病急性加重&胸腔积液&疑似肺栓塞

推荐治疗方案22行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&胸腔积液&疑似肺栓塞,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 胸腔积液 疑似肺栓塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案22行-2 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&胸腔积液&肺栓塞,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 胸腔积液 肺栓塞
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗

#########201712224  慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重   慢性阻塞性肺疾病急性加重&呼吸衰竭｜严重呼吸困难｜高碳酸血症｜缺氧｜充血性心力衰竭｜肺炎｜糖尿病｜心律失常｜肾衰竭｜肝衰竭｜精神状态改变            ICU治疗       无
#########慢性阻塞性肺疾病急性加重&呼吸衰竭｜严重呼吸困难｜高碳酸血症｜缺氧｜充血性心力衰竭｜肺炎｜糖尿病｜心律失常｜肾衰竭｜肝衰竭｜精神状态改变
#########慢性阻塞性肺疾病急性加重&呼吸衰竭 严重呼吸困难 高碳酸血症 缺氧 充血性心力衰竭 肺炎 糖尿病 心律失常 肾衰竭 肝衰竭 精神状态改变
#########慢性阻塞性肺疾病急性加重& 严重呼吸困难 高碳酸血症 缺氧 充血性心力衰竭 肺炎 糖尿病 心律失常 肾衰竭 肝衰竭 精神状态改变

推荐治疗方案23行-1 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&呼吸衰竭,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 呼吸衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-2 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&严重呼吸困难,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 严重呼吸困难
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-3 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&高碳酸血症,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 高碳酸血症
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-4 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&充血性心力衰竭,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 充血性心力衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-5 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&肺炎,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 肺炎
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-6 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&糖尿病,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-7 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&心律失常,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 心律失常
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-8 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&肾衰竭,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 肾衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-9 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&肝衰竭,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 肝衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗


推荐治疗方案23行-10 诊断条件:慢性阻塞性肺疾病｜慢性阻塞性肺疾病急性加重+主要条件:慢性阻塞性肺疾病急性加重&精神状态改变,推荐方案:抗凝治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病 慢性阻塞性肺疾病急性加重
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 精神状态改变
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&脓痰｜呼吸困难增加｜痰量增多         经验性抗生素治疗
#########慢性阻塞性肺疾病&脓痰｜呼吸困难增加｜痰量增多
#########慢性阻塞性肺疾病&脓痰 呼吸困难增加 痰量增多

推荐治疗方案24行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病急性加重&脓痰,推荐方案:经验性抗生素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 脓痰
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     经验性抗生素治疗


推荐治疗方案24行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病急性加重&呼吸困难增加,推荐方案:经验性抗生素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 呼吸困难增加
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     经验性抗生素治疗


推荐治疗方案24行-3 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病急性加重&痰量增多,推荐方案:经验性抗生素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病急性加重 痰量增多
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     经验性抗生素治疗

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&脓痰｜呼吸困难增加｜痰量增多         经验性抗生素治疗
#########慢性阻塞性肺疾病&脓痰｜呼吸困难增加｜痰量增多
#########慢性阻塞性肺疾病&脓痰 呼吸困难增加 痰量增多

推荐治疗方案25行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病,推荐方案:稳定期药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     稳定期药物治疗


#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&第一秒用力呼气容积>20%预计值｜肺一氧化碳弥散量>20%预计值｜肺气肿分布不均匀｜肺气肿以肺上叶为主｜气流受限严重程度分级Ⅱ期｜气流受限严重程度分级Ⅲ期  运动耐量尚可      肺减容术    有以下情况的患者可以考虑行肺减容术:中度或重度症状；运动耐量尚可；第一秒用力呼气容积>20%预计值；肺一氧化碳弥散量>20%预计值；肺气肿分布不均匀(肺气肿以肺上叶为主)   无
#########慢性阻塞性肺疾病&第一秒用力呼气容积>20%预计值 肺一氧化碳弥散量>20%预计值 肺气肿分布不均匀 肺气肿以肺上叶为主 气流受限严重程度分级Ⅱ期 气流受限严重程度分级Ⅲ期
#########慢性阻塞性肺疾病&  肺气肿分布不均匀 肺气肿以肺上叶为主 气流受限严重程度分级Ⅱ期 气流受限严重程度分级Ⅲ期

推荐治疗方案26行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&第一秒用力呼气容积21%预计值&次要条件:运动耐量尚可,推荐方案:肺减容术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 第一秒用力呼气容积21%预计值 运动耐量尚可
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺减容术


推荐治疗方案26行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺一氧化碳弥散量21%预计值&次要条件:运动耐量尚可,推荐方案:肺减容术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺一氧化碳弥散量21%预计值 运动耐量尚可
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺减容术

推荐治疗方案26行-3 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺气肿分布不均匀&次要条件:运动耐量尚可,推荐方案:肺减容术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺气肿分布不均匀 运动耐量尚可
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺减容术


推荐治疗方案26行-4 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺气肿以肺上叶为主&次要条件:运动耐量尚可,推荐方案:肺减容术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺气肿以肺上叶为主 运动耐量尚可
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺减容术


推荐治疗方案26行-5 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅱ期&次要条件:运动耐量尚可,推荐方案:肺减容术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅱ期 运动耐量尚可
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺减容术

推荐治疗方案26行-6 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅲ期&次要条件:运动耐量尚可,推荐方案:肺减容术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅲ期 运动耐量尚可
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺减容术


#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&慢性呼吸衰竭｜气流受限严重程度分级Ⅳ期            肺移植     无
#########慢性阻塞性肺疾病&慢性呼吸衰竭 气流受限严重程度分级Ⅳ期
#########慢性阻塞性肺疾病&

推荐治疗方案27行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&慢性呼吸衰竭,推荐方案:肺移植
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 慢性呼吸衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺移植


推荐治疗方案27行-2 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&气流受限严重程度分级Ⅳ期,推荐方案:肺移植
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 气流受限严重程度分级Ⅳ期
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺移植

#########201712224  慢性阻塞性肺疾病    慢性阻塞性肺疾病&肺大疱            肺大疱切除术  大疱性肺气肿与肺气肿的治疗相同(戒烟、氧疗、肺康复、使用支气管扩张剂以及适当进行免疫接种)。当肺大疱占据一侧胸腔超过1/3时，可考虑手术切除部分肺脏(肺大疱切除术)  无

推荐治疗方案28行-1 诊断条件:慢性阻塞性肺疾病+主要条件:慢性阻塞性肺疾病&肺大疱,推荐方案:肺大疱切除术
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    慢性阻塞性肺疾病
    ${Subjective}    Set Variable    慢性阻塞性肺疾病 肺大疱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肺大疱切除术


