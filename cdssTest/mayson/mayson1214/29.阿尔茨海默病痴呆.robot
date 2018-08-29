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
#######201712143    <1  月   阿尔茨海默病痴呆      癫痫发作持续<=5分钟 血常规 全血细胞计数及分类   一般检查        是
推荐检查2行-1 主要条件:阿尔茨海默病痴呆,推荐检查包含:脑脊液常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    阿尔茨海默病痴呆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"0.9","ageType":"月","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    脑脊液常规

#######201712143    <1  月   阿尔茨海默病痴呆      癫痫发作持续<=5分钟 血常规 全血细胞计数及分类   一般检查        是
推荐检查3行-1 主要条件:阿尔茨海默病痴呆,推荐检查包含:颅脑MRI
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    阿尔茨海默病痴呆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"0.9","ageType":"月","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    颅脑MRI


#######201712144            阿尔茨海默病痴呆            FDG PET/CT  检查有助于明确痴呆的病因    鉴别检查
推荐检查4行-1 主要条件:阿尔茨海默病痴呆,推荐检查包含:FDG PET/CT
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    阿尔茨海默病痴呆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"0.9","ageType":"月","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    FDG PET/CT

#######201712144            阿尔茨海默病痴呆            PETAβ显像 检查有助于明确痴呆的病因    鉴别检查
推荐检查5行-1 主要条件:阿尔茨海默病痴呆,推荐检查包含:PETAβ显像
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    阿尔茨海默病痴呆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"0.9","ageType":"月","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    PETAβ显像


#######201712144            阿尔茨海默病痴呆            单光子发射计算机断层扫描(SPECT) 检查有助于明确痴呆的病因    鉴别检查
推荐检查6行-1 主要条件:阿尔茨海默病痴呆,推荐检查包含:单光子发射计算机断层扫描(SPECT)
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    阿尔茨海默病痴呆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"0.9","ageType":"月","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    单光子发射计算机断层扫描(SPECT)





########################推荐治疗方案#################################################################
#######201712144    阿尔茨海默病｜阿尔茨海默病痴呆｜中度阿尔茨海默病痴呆｜重度阿尔茨海默病痴呆   阿尔茨海默病｜阿尔茨海默病痴呆&非典型认知表现         转诊  对于阿尔茨海默病复杂的、非典型的或快速进展的认知表现需要由神经科医生做进一步评估    否
#######阿尔茨海默病｜阿尔茨海默病痴呆&非典型认知表现
#######阿尔茨海默病 阿尔茨海默病痴呆&非典型认知表现
#######阿尔茨海默病 阿尔茨海默病痴呆 中度阿尔茨海默病痴呆 重度阿尔茨海默病痴呆
#######
推荐治疗方案2行-1 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 非典型认知表现
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

推荐治疗方案2行-2 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 非典型认知表现
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

推荐治疗方案2行-3 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 非典型认知表现
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

推荐治疗方案2行-4 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 非典型认知表现
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


推荐治疗方案2行-5 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 非典型认知表现
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

推荐治疗方案2行-6 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 非典型认知表现
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


推荐治疗方案2行-7 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 非典型认知表现
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

推荐治疗方案2行-8 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&非典型认知表现,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 非典型认知表现
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





######################################推荐治疗方案##########################################################
#######201712144    阿尔茨海默病｜阿尔茨海默病痴呆｜中度阿尔茨海默病痴呆｜重度阿尔茨海默病痴呆   阿尔茨海默病｜阿尔茨海默病痴呆&非典型认知表现         药物治疗  对于阿尔茨海默病复杂的、非典型的或快速进展的认知表现需要由神经科医生做进一步评估    否
#######阿尔茨海默病｜阿尔茨海默病痴呆&非典型认知表现
#######阿尔茨海默病 阿尔茨海默病痴呆&非典型认知表现
#######阿尔茨海默病 阿尔茨海默病痴呆 中度阿尔茨海默病痴呆 重度阿尔茨海默病痴呆
#######
推荐治疗方案3行-1 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案3行-2 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案3行-3 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案3行-4 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗


推荐治疗方案3行-5 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案3行-6 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗


推荐治疗方案3行-7 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案3行-8 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗




######################################推荐治疗方案##########################################################
#######201712144    阿尔茨海默病｜阿尔茨海默病痴呆｜中度阿尔茨海默病痴呆｜重度阿尔茨海默病痴呆   阿尔茨海默病｜阿尔茨海默病痴呆&非典型认知表现         药物治疗  对于阿尔茨海默病复杂的、非典型的或快速进展的认知表现需要由神经科医生做进一步评估    否
#######阿尔茨海默病｜阿尔茨海默病痴呆&非典型认知表现
#######阿尔茨海默病 阿尔茨海默病痴呆&非典型认知表现
#######阿尔茨海默病 阿尔茨海默病痴呆 中度阿尔茨海默病痴呆 重度阿尔茨海默病痴呆
#######
推荐治疗方案4行-1 诊断条件:阿尔茨海默病+主要条件:中度阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    中度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案4行-2 诊断条件:阿尔茨海默病+主要条件:重度阿尔茨海默病痴&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    重度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案4行-3 诊断条件:阿尔茨海默病痴呆+主要条件:中度阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    中度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案4行-4 诊断条件:阿尔茨海默病痴呆+主要条件:重度阿尔茨海默病痴&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    重度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗


推荐治疗方案4行-5 诊断条件:中度阿尔茨海默病痴呆+主要条件:中度阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    中度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案4行-6 诊断条件:中度阿尔茨海默病痴呆+主要条件:重度阿尔茨海默病痴&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    重度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗


推荐治疗方案4行-7 诊断条件:重度阿尔茨海默病痴呆+主要条件:中度阿尔茨海默病痴呆&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    中度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗

推荐治疗方案4行-8 诊断条件:重度阿尔茨海默病痴呆+主要条件:重度阿尔茨海默病痴&认知障碍,推荐方案:药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    重度阿尔茨海默病痴呆 认知障碍
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
    Should Contain    ${aj}     药物治疗





#######201712144    阿尔茨海默病｜阿尔茨海默病痴呆｜中度阿尔茨海默病痴呆｜重度阿尔茨海默病痴呆   阿尔茨海默病｜阿尔茨海默病痴呆&幻觉｜妄想           抗精神病药治疗 主要为非典型抗精神病药，对幻觉、妄想等症状有效。但可能增加心脑血管事件、肺部感染等不良事件。因此应小剂量应用，症状控制后尽早减量或停用
#######阿尔茨海默病｜阿尔茨海默病痴呆&幻觉｜妄想
#######阿尔茨海默病 阿尔茨海默病痴呆&

推荐治疗方案5行-1 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-2 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-3 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-4 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-5 诊断条件:阿尔茨海默病痴+主要条件:阿尔茨海默病&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴
    ${Subjective}    Set Variable    阿尔茨海默病 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-6 诊断条件:阿尔茨海默病痴+主要条件:阿尔茨海默病&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴
    ${Subjective}    Set Variable    阿尔茨海默病 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-7 诊断条件:阿尔茨海默病痴+主要条件:阿尔茨海默病痴呆&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-8 诊断条件:阿尔茨海默病痴+主要条件:阿尔茨海默病痴呆&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-9 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-10 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-11 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-12 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-13 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-14 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 妄想
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-15 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&幻觉,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 幻觉
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
    Should Contain    ${aj}     抗精神病药治疗


推荐治疗方案5行-16 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&妄想,推荐方案:抗精神病药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 妄想
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
    Should Contain    ${aj}     抗精神病药治疗




#######201712144    阿尔茨海默病｜阿尔茨海默病痴呆｜中度阿尔茨海默病痴呆｜重度阿尔茨海默病痴呆   阿尔茨海默病｜阿尔茨海默病痴呆&抑郁         苯二氮卓类药物治疗  对于阿尔茨海默病复杂的、非典型的或快速进展的认知表现需要由神经科医生做进一步评估    否
#######阿尔茨海默病｜阿尔茨海默病痴呆&抑郁
#######阿尔茨海默病 阿尔茨海默病痴呆&抑郁
#######阿尔茨海默病 阿尔茨海默病痴呆 中度阿尔茨海默病痴呆 重度阿尔茨海默病痴呆
#######
推荐治疗方案6行-1 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗

推荐治疗方案6行-2 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗

推荐治疗方案6行-3 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗

推荐治疗方案6行-4 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗


推荐治疗方案6行-5 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗

推荐治疗方案6行-6 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗


推荐治疗方案6行-7 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗

推荐治疗方案6行-8 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&抑郁,推荐方案:抗抑郁药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 抑郁
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
    Should Contain    ${aj}     抗抑郁药治疗





#######201712144    阿尔茨海默病｜阿尔茨海默病痴呆｜中度阿尔茨海默病痴呆｜重度阿尔茨海默病痴呆   阿尔茨海默病｜阿尔茨海默病痴呆&焦虑｜激惹｜睡眠障碍          苯二氮卓类药物治疗
#######阿尔茨海默病｜阿尔茨海默病痴呆&焦虑｜激惹｜睡眠障碍
#######阿尔茨海默病 阿尔茨海默病痴呆&焦虑 激惹 睡眠障碍
#######阿尔茨海默病 阿尔茨海默病痴呆&

推荐治疗方案7行-1 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-2 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-3 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-4 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-5 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-6 诊断条件:阿尔茨海默病+主要条件:阿尔茨海默病痴呆&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗



推荐治疗方案7行-7 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-8 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-9 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-10 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-11 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-12 诊断条件:阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-13 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-14 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-15 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-16 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-17 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-18 诊断条件:中度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    中度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-13 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-14 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-15 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-16 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&焦虑,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 焦虑
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
    Should Contain    ${aj}     苯二氮卓类药物治疗


推荐治疗方案7行-17 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&激惹,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 激惹
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

推荐治疗方案7行-18 诊断条件:重度阿尔茨海默病痴呆+主要条件:阿尔茨海默病痴呆&睡眠障碍,推荐方案:苯二氮卓类药物治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    重度阿尔茨海默病痴呆
    ${Subjective}    Set Variable    阿尔茨海默病痴呆 睡眠障碍
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
    Should Contain    ${aj}     苯二氮卓类药物治疗

