*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
#######ACS规则导出－智能推荐1120慢性淋巴细胞白血病
###############################################推荐检查####################################################
### 数据版本 年龄  年龄类型  主要条件  次要条件  否定条件  推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  ID  是否新增
#######20171113         毛细胞白血病｜疑似毛细胞白血病         血常规 全血细胞分析及分类，每周查，直到血细胞计数稳定 一般检查        是
#######毛细胞白血病｜疑似毛细胞白血病


推荐检查2行-1 主要条件:毛细胞白血病, 推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规

推荐检查2行-2 主要条件:疑似毛细胞白血病, 推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    疑似毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规


#######20171113         毛细胞白血病｜疑似毛细胞白血病         外周血涂片   瘤细胞体积中等大，胞质丰富，偶见颗粒，胞质周边有细长毛刺为毛细胞白血病典型特征 确诊检查        是

推荐检查3行-1 主要条件:毛细胞白血病, 推荐检查包含:外周血涂片
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    外周血涂片

推荐检查3行-2 主要条件:疑似毛细胞白血病, 推荐检查包含:外周血涂片
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    疑似毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    外周血涂片


#######20171113         毛细胞白血病｜疑似毛细胞白血病         血生化检查       一般检查        是

推荐检查4行-1 主要条件:毛细胞白血病, 推荐检查包含:血生化检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血生化检查

推荐检查4行-2 主要条件:疑似毛细胞白血病, 推荐检查包含:血生化检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    疑似毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血生化检查

#######20171113         毛细胞白血病          流式细胞分析  有淋巴细胞增多，可进行外周血（白血病-淋巴瘤表型）流式细胞分析。用于区分克隆性和非克隆性淋巴细胞增生并为克隆性淋巴细胞（如果检测到的话）提供诊断信息  鉴别检查        是

推荐检查5行-1 主要条件:毛细胞白血病, 推荐检查包含:流式细胞分析
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    流式细胞分析




#######20171113         毛细胞白血病｜全血小板计数减少           骨髓穿刺活检  初始确诊；或治疗后6个月患者全血细胞计数未恢复，考虑再次进行骨髓活检  确诊检查        是

推荐检查6行-1 主要条件:毛细胞白血病, 推荐检查包含:骨髓穿刺活检
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    骨髓穿刺活检

推荐检查6行-2 主要条件:全血细胞减少, 推荐检查包含:骨髓穿刺活检
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    全血细胞减少
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    骨髓穿刺活检


#######20171113         毛细胞白血病｜毛细胞白血病复发｜疑似毛细胞白血病            BRAF-V600E分子检测  诊断不明确时或疾病复发时，可考虑与血液科医生讨论进行BRAF-V600E检测  确诊检查        是

推荐检查7行-1 主要条件:毛细胞白血病, 推荐检查包含:BRAF-V600E分子检测
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    BRAF-V600E分子检测

推荐检查7行-2 主要条件:毛细胞白血病复发, 推荐检查包含:BRAF-V600E分子检测
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    BRAF-V600E分子检测


推荐检查7行-3 主要条件:疑似毛细胞白血病, 推荐检查包含:BRAF-V600E分子检测
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    疑似毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    BRAF-V600E分子检测


#######20171113         毛细胞白血病｜毛细胞白血病复发｜疑似毛细胞白血病            胸部X线  诊断不明确时或疾病复发时，可考虑与血液科医生讨论进行BRAF-V600E检测  确诊检查        是

推荐检查8行-1 主要条件:毛细胞白血病+次要条件:发热, 推荐检查包含:胸部X线
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病 发热
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    胸部X线

#######20171113         毛细胞白血病          腹部超声    如果脾脏未触及或因体型而无法进行准确的评估，考虑进行腹部超声检查    一般检查        是
推荐检查9行-1 主要条件:毛细胞白血病, 推荐检查包含:腹部超声
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
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
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    腹部超声


#######20171113         毛细胞白血病&育龄期(女)&女性            妊娠试验        一般检查        是
推荐检查10行-1 主要条件:毛细胞白血病&育龄期(女)&女性, 推荐检查包含:妊娠试验
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    妊娠试验


#######20171113         毛细胞白血病复发        毛细胞白血病  血常规 全血细胞计数及分类   一般检查        是
推荐检查11行-1 主要条件:毛细胞白血病复发, 推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规


#######20171113         毛细胞白血病复发        毛细胞白血病  外周血涂片       一般检查        是

推荐检查12行-1 主要条件:毛细胞白血病复发, 推荐检查包含:外周血涂片
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    外周血涂片



#######20171113         毛细胞白血病复发        毛细胞白血病  血生化检查       一般检查        是

推荐检查13行-1 主要条件:毛细胞白血病复发, 推荐检查包含:血生化检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血生化检查




##############20171113          毛细胞白血病复发    外周血涂片未明确毛细胞白血病复发者   毛细胞白血病  骨髓穿刺活检  单侧骨髓穿刺活检来确诊细胞学复发    确诊检查        是

推荐检查14行-1 主要条件:毛细胞白血病复发+次要条件:外周血涂片未明确毛细胞白血病复发者, 推荐检查包含:骨髓穿刺活检
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发 外周血涂片未明确毛细胞白血病复发者
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    骨髓穿刺活检



##############20171113          毛细胞白血病复发        毛细胞白血病  腹部超声        一般检查        是

推荐检查15行-1 主要条件:毛细胞白血病复发, 推荐检查包含:腹部超声
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    腹部超声





##############20171113          毛细胞白血病复发        毛细胞白血病  胸部X线        一般检查        是

推荐检查16行-1 主要条件:毛细胞白血病复发, 推荐检查包含:胸部X线
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    胸部X线



##########20171113          毛细胞白血病复发        毛细胞白血病  流式细胞分析  筛查克隆性淋巴细胞增生，毛细胞白血病特征性表达荧光强度强的CD19和CD20、CD22、CD11c和CD103，并且抗酒石酸酸性磷酸酶（TRAP）表达阳性   鉴别检查        是

推荐检查17行-1 主要条件:毛细胞白血病复发, 推荐检查包含:流式细胞分析
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    流式细胞分析



##########20171113          毛细胞白血病｜毛细胞白血病复发         CD4细胞计数 淋巴细胞亚型分析筛查免疫缺陷，化疗前维持CD4细胞计数>200个/mm3，CD4细胞计数下降者预防性使用抗感染 鉴别检查        是

推荐检查18行-1 主要条件:毛细胞白血病, 推荐检查包含:CD4细胞计数
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    CD4细胞计数


推荐检查18行-2 主要条件:毛细胞白血病复发, 推荐检查包含:CD4细胞计数
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病复发
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    CD4细胞计数

##########20171113          毛细胞白血病｜毛细胞白血病复发         血常规 淋巴细胞亚型分析筛查免疫缺陷，化疗前维持血常规>200个/mm3，血常规下降者预防性使用抗感染 鉴别检查        是

推荐检查19行-1 主要条件:毛细胞白血病, 推荐检查包含:血常规
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规




##########20171113          毛细胞白血病复发        毛细胞白血病治疗条件｜毛细胞白血病   外周血涂片   毛细胞白血病复发尚不符合毛细胞白血病治疗条件者酌情继续监测   一般检查        是

推荐检查20行-1 主要条件:毛细胞白血病, 推荐检查包含:外周血涂片
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    外周血涂片




##########20171113          毛细胞白血病复发        毛细胞白血病治疗条件｜毛细胞白血病   血生化检查   毛细胞白血病复发尚不符合毛细胞白血病治疗条件者酌情继续监测   一般检查        是

推荐检查21行-1 主要条件:毛细胞白血病, 推荐检查包含:血生化检查
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血生化检查




##########20171113          毛细胞白血病复发        毛细胞白血病治疗条件｜毛细胞白血病   骨髓穿刺活检  毛细胞白血病复发尚不符合毛细胞白血病治疗条件者酌情继续监测   一般检查        是

推荐检查22行-1 主要条件:毛细胞白血病, 推荐检查包含:骨髓穿刺活检
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    骨髓穿刺活检






##########20171113          毛细胞白血病复发        毛细胞白血病治疗条件｜毛细胞白血病   腹部超声    毛细胞白血病复发尚不符合毛细胞白血病治疗条件者酌情继续监测   一般检查        是

推荐检查23行-1 主要条件:毛细胞白血病, 推荐检查包含:腹部超声
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    腹部超声




#########################################检查解读################################

#######20171113         口腔温度>38℃    血中性粒细胞计数＜1.5×10E9L      中性粒细胞减少性发热  中性粒细胞减少性发热定义为口腔温度>38 ℃并且全血细胞计数+分类检查中性粒细胞计数＜1.5×109L AME-毛细胞白血病  是
######口腔温度>38℃  血中性粒细胞计数＜1.5×10E9L
######口腔温度:38.1℃  血中性粒细胞计数＜1.5×10E9L

检查解读2行-1 病历内容:口腔温度>38℃ +检查结果:血中性粒细胞计数＜1.5×10E9L,推荐诊断包含:中性粒细胞减少性发热
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    口腔温度:38.1℃ 中性粒细胞:1.4 10^9/L
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    中性粒细胞减少性发热



#######20171113         脾大｜血小板计数减少    BRAF-V600E分子检测BRAF V600E阳性      毛细胞白血病      AME-毛细胞白血病  是
#####脾大｜血小板计数减少
#####脾大 血小板计数减少

检查解读3行-1 病历内容:脾大 +检查结果:BRAF-V600E分子检测BRAF V600E阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脾大 BRAF-V600E分子检测BRAFV600E阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病

检查解读3行-2 病历内容:血小板计数减少 +检查结果:BRAF-V600E分子检测BRAF V600E阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    血小板计数减少 BRAF-V600E分子检测BRAFV600E阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病



#######20171113         脾大｜血小板计数减少    免疫组化瘤细胞B细胞标准染色阳性&Annexin-1阳性        毛细胞白血病      AME-毛细胞白血病  是
######免疫组化瘤细胞B细胞标准染色阳性&Annexin-1阳性
######免疫组化瘤细胞B细胞标准染色阳性 Annexin-1阳性

检查解读4行-1 病历内容:脾大 +检查结果:免疫组化瘤细胞B细胞标准染色阳性&Annexin-1阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脾大 免疫组化瘤细胞B细胞标准染色阳性 Annexin-1阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病

检查解读4行-2 病历内容:血小板计数减少 +检查结果:免疫组化瘤细胞B细胞标准染色阳性&Annexin-1阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    血小板计数减少 免疫组化瘤细胞B细胞标准染色阳性 Annexin-1阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病





#######20171113         脾大｜血小板计数减少    血涂片瘤细胞胞质周边有细长毛刺&抗酒石酸酶染色阳性       毛细胞白血病      AME-毛细胞白血病  是


检查解读5行-1 病历内容:脾大 +检查结果:血涂片瘤细胞胞质周边有细长毛刺&抗酒石酸酶染色阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脾大 血涂片瘤细胞胞质周边有细长毛刺 抗酒石酸酶染色阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病

检查解读5行-2 病历内容:血小板计数减少 +检查结果:血涂片瘤细胞胞质周边有细长毛刺&抗酒石酸酶染色阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    血小板计数减少 血涂片瘤细胞胞质周边有细长毛刺 抗酒石酸酶染色阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病


#######20171113         脾大｜血小板计数减少    CD19阳性&CD5阴性&CD10阴性&CD103阳性&CD25阳性      毛细胞白血病      AME-毛细胞白血病  是


检查解读6行-1 病历内容:脾大 +检查结果:CD19阳性&CD5阴性&CD10阴性&CD103阳性&CD25阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脾大 CD19阳性 CD5阴性 CD10阴性 CD103阳性 CD25阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病

检查解读6行-2 病历内容:血小板计数减少 +检查结果:CD19阳性&CD5阴性&CD10阴性&CD103阳性&CD25阳性,推荐诊断包含:毛细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    血小板计数减少 CD19阳性 CD5阴性 CD10阴性 CD103阳性 CD25阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    毛细胞白血病



#######20171113             CD19阳性&CD5阳性&CD20阳性｜CD23阳性      慢性淋巴细胞白血病       AME-毛细胞白血病  是


检查解读7行-1 病历内容: +检查结果:CCD19阳性&CD5阳性&CD20阳性,推荐诊断包含:慢性淋巴细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    CD19阳性 CD5阳性 CD20阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    慢性淋巴细胞白血病

检查解读7行-2 病历内容: +检查结果:CCD19阳性&CD5阳性&CD23阳性,推荐诊断包含:慢性淋巴细胞白血病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    CD19阳性 CD5阳性 CD23阳性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}    慢性淋巴细胞白血病



########################################推荐评分表##########################################################
#####20171113   毛细胞白血病｜B细胞增殖｜慢性淋巴增殖性疾病      B细胞慢性淋巴增殖性疾病的鉴别诊断   B细胞慢性淋巴增殖性疾病(B-CLPD)的鉴别诊断，各主要B-CLPD疾病的免疫表型及遗传学特征，鉴别毛细胞白血病（HCL)、慢性淋巴细胞白血病(CLL)、套细胞淋巴瘤(MCL)、滤泡淋巴瘤(FL)、脾边缘区淋巴瘤(SMZL)、B-幼淋细胞白血病 (B-PLL) 是
#########毛细胞白血病｜B细胞增殖｜慢性淋巴增殖性疾病
#########毛细胞白血病 B细胞增殖 慢性淋巴增殖性疾病

推荐评分表2行-1 病历内容:毛细胞白血病,推荐评分表包含:B细胞慢性淋巴增殖性疾病的鉴别诊断
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     B细胞慢性淋巴增殖性疾病的鉴别诊断

推荐评分表2行-2 病历内容:B细胞增殖,推荐评分表包含:B细胞慢性淋巴增殖性疾病的鉴别诊断
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    B细胞增殖
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     B细胞慢性淋巴增殖性疾病的鉴别诊断

推荐评分表2行-3 病历内容:慢性淋巴增殖性疾病,推荐评分表包含:B细胞慢性淋巴增殖性疾病的鉴别诊断
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性淋巴增殖性疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     B细胞慢性淋巴增殖性疾病的鉴别诊断


########################################推荐评分表##########################################################
#####20171113   毛细胞白血病｜B细胞增殖｜慢性淋巴增殖性疾病      B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图   B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图通过系统的FCM免疫表型分析结合细胞遗传学及分子生物学检测对多数B-CLPD进行诊断与鉴别诊断，鉴别毛细胞白血病(HCL)、慢性淋巴细胞白血病(CLL)、套细胞淋巴瘤(MCL)、滤泡淋巴瘤(FL)、边缘区淋巴瘤(MZL)、毛细胞白血病-变异型(HCL-V)、华氏巨球蛋白血症(WM)  是

推荐评分表3行-1 病历内容:毛细胞白血病,推荐评分表包含:B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图

推荐评分表3行-2 病历内容:B细胞增殖,推荐评分表包含:B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    B细胞增殖
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图

推荐评分表3行-3 病历内容:慢性淋巴增殖性疾病,推荐评分表包含:B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性淋巴增殖性疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     B细胞慢性淋巴增殖性疾病的免疫表型和细胞/分子遗传学鉴别诊断流程图



########################################推荐评分表##########################################################
#####20171113   慢性淋巴细胞白血病｜B细胞增殖｜慢性淋巴增殖性疾病｜毛细胞白血病        慢性淋巴细胞白血病的RMH免疫标志积分系统   慢性淋巴细胞白血病的英国马斯登皇家医院(RMH)免疫标志积分系统，鉴别慢性淋巴细胞白血病(CLL)与其他B-CLPD。CLL积分4-5分，其他B-CLPD积分0-2分，积分3分时建议进行FISH检测除外套细胞淋巴瘤(MCL)，CD200在慢性淋巴细胞白血病CLL和毛细胞白血病HCL细胞中高表达；毛细胞白血病是一种少见的B细胞慢性淋巴增殖性疾病(B-CLPD)，在本积分系统得分0-3分   是

推荐评分表4行-1 病历内容:慢性淋巴细胞白血病,推荐评分表包含:诊断CLL的免疫表型积分系统
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性淋巴细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     诊断CLL的免疫表型积分系统

推荐评分表4行-2 病历内容:B细胞增殖,推荐评分表包含:诊断CLL的免疫表型积分系统
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    B细胞增殖
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     诊断CLL的免疫表型积分系统

推荐评分表4行-3 病历内容:慢性淋巴增殖性疾病,推荐评分表包含:诊断CLL的免疫表型积分系统
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    慢性淋巴增殖性疾病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     诊断CLL的免疫表型积分系统


推荐评分表4行-4 病历内容:毛细胞白血病,推荐评分表包含:诊断CLL的免疫表型积分系统
    [Documentation]    ""
    #执行删除操作
    # [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     诊断CLL的免疫表型积分系统




######################################推荐治疗方案##########################################################
#######20171113 毛细胞白血病  毛细胞白血病&中性粒细胞减少性发热｜血小板减少相关性出血            转诊  毛细胞白血病，白细胞减少、血小板减少出血、感染风险、严重合并症，建议转诊三级医学中心血液科评估治疗   无   是
#########毛细胞白血病&中性粒细胞减少性发热｜血小板减少相关性出血
#########毛细胞白血病&中性粒细胞减少性发热｜血小板减少相关性出血

推荐治疗方案2行-1 主要条件:毛细胞白血病&中性粒细胞减少性发热,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 中性粒细胞减少性发热
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

推荐治疗方案2行-2 主要条件:毛细胞白血病&血小板减少相关性出血,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 血小板减少相关性出血
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


#######20171113 毛细胞白血病  毛细胞白血病&口腔温度>38 ℃&中性粒细胞计数＜1.5×109/L          转诊  毛细胞白血病，白细胞减少、血小板减少出血、感染风险、严重合并症，建议转诊三级医学中心血液科评估治疗   无   是
######毛细胞白血病&口腔温度>38 ℃&中性粒细胞计数＜1.5×109/L
######毛细胞白血病 口腔温度:38.1℃ 中性粒细胞:1.4 10^9/L


推荐治疗方案3行-1 主要条件:毛细胞白血病&口腔温度>38 ℃&中性粒细胞计数＜1.5×109/L,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 口腔温度:38.1℃ 中性粒细胞:1.4 10^9/L
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


#######20171113 毛细胞白血病  毛细胞白血病&初始治疗无反应          转诊  初始治疗无反应（化疗克拉屈滨或喷司他丁、靶向药物利妥昔单抗）者转诊三级医学中心血液科评估治疗  无   是
##########毛细胞白血病&初始治疗无反应


推荐治疗方案4行-1 主要条件:毛细胞白血病&初始治疗无反应,推荐方案:转诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 初始治疗无反应
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


#######220171113    毛细胞白血病  毛细胞白血病｜毛细胞白血病治疗条件           初始一线化疗  治疗首选克拉屈滨，每天给药，共5天，仅一个周期     是
#######毛细胞白血病｜毛细胞白血病治疗条件

推荐治疗方案5行-1 主要条件:毛细胞白血病,推荐方案:初始一线化疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病
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
    Should Contain    ${aj}     初始一线化疗

推荐治疗方案5行-2 主要条件:毛细胞白血病治疗条件,推荐方案:初始一线化疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病治疗条件
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
    Should Contain    ${aj}     初始一线化疗



#######20171113 毛细胞白血病  毛细胞白血病｜毛细胞白血病治疗条件   不接受克拉屈滨治疗       初始二线化疗  不接受克拉屈滨者可用喷司他丁替代    无   是

推荐治疗方案6行-1 主要条件:毛细胞白血病+次要条件:不接受克拉屈滨治疗,推荐方案:初始二线化疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 不接受克拉屈滨治疗
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
    Should Contain    ${aj}     初始二线化疗

推荐治疗方案6行-2 主要条件:毛细胞白血病治疗条件+次要条件:不接受克拉屈滨治疗,推荐方案:初始二线化疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病治疗条件 不接受克拉屈滨治疗
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
    Should Contain    ${aj}     初始二线化疗



#######20171113 毛细胞白血病  毛细胞白血病&年龄<60岁｜ECOG评分<2分 初始治疗    CD20阴性  克拉曲滨联合利妥昔单抗治疗   克拉屈滨联合利妥昔单抗（一种单克隆抗体）可用于身体健康、合并症少的年轻患者毛细胞白血病初始方案     是
######毛细胞白血病&年龄<60岁｜ECOG评分<2分
######毛细胞白血病&年龄<60岁｜ECOG评分<2分
######毛细胞白血病&年龄<60岁｜ECOG评分<2分

推荐治疗方案7行-1 主要条件:毛细胞白血病&年龄<60岁+次要条件:初始治疗,推荐方案:克拉曲滨联合利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 初始治疗
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     克拉曲滨联合利妥昔单抗治疗

推荐治疗方案7行-2 主要条件:毛细胞白血病&ECOG评分<2分+次要条件:初始治疗,推荐方案:克拉曲滨联合利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病治疗条件 ECOG评分:1分 初始治疗
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
    Should Contain    ${aj}     克拉曲滨联合利妥昔单抗治疗

推荐治疗方案7行-3 主要条件:毛细胞白血病&ECOG评分<2分+次要条件:初始治疗+否定条件:CD20阴性,"不应"推荐方案:克拉曲滨联合利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病治疗条件 ECOG评分:1分 初始治疗 CD20阴性
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     克拉曲滨联合利妥昔单抗治疗



#######20171113 毛细胞白血病  毛细胞白血病&妊娠期女性    初始治疗        妊娠期干扰素治疗    干扰素治疗作为初始治疗方案仅推荐用于妊娠期女性毛细胞白血病患者     是

推荐治疗方案8行-1 主要条件:毛细胞白血病 妊娠期女性+次要条件:初始治疗,推荐方案:妊娠期干扰素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 妊娠期女性 初始治疗
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
    Should Contain    ${aj}     妊娠期干扰素治疗



#######20171113 毛细胞白血病  毛细胞白血病&中性粒细胞＜1.0×10E9/L｜CD4细胞计数下降｜有感染征象 化疗前 中性粒细胞>=1.5×10E9/L&CD4细胞计数＞200个/mm3  髓系生长因子治疗    开始化疗前使用聚乙二醇非格司亭6 mg皮下注射，诱导支持治疗至中性粒细胞>=1.5×10E9/L、CD4细胞计数＞200个/mm3以减少感染的发生       是
#########毛细胞白血病&中性粒细胞＜1.0×10E9/L｜CD4细胞计数下降｜有感染征象
#########毛细胞白血病&中性粒细胞:0.9 10^9/L｜CD4细胞计数下降｜有感染征象
#########毛细胞白血病&

推荐治疗方案9行-1 主要条件:毛细胞白血病&中性粒细胞:0.9 10^9/L+次要条件:化疗前,推荐方案:髓系生长因子治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 中性粒细胞:0.9 10^9/L 化疗前
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
    Should Contain    ${aj}     髓系生长因子治疗


推荐治疗方案9行-2 主要条件:毛细胞白血病&CD4细胞计数下降+次要条件:化疗前,推荐方案:髓系生长因子治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 CD4细胞计数下降 化疗前
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
    Should Contain    ${aj}     髓系生长因子治疗


推荐治疗方案9行-3 主要条件:毛细胞白血病&有感染征象+次要条件:化疗前,推荐方案:髓系生长因子治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 有感染征象 化疗前
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
    Should Contain    ${aj}     髓系生长因子治疗

#####中性粒细胞>=1.5×10E9/L&CD4细胞计数＞200个/mm3
#####中性粒细胞:1.5×10E9/L&CD4细胞计数:201个/mm3


推荐治疗方案9行-4 主要条件:毛细胞白血病&中性粒细胞:0.9 10^9/L｜CD4细胞计数下降｜有感染征象+次要条件:化疗前+否定条件:中性粒细胞:1.5×10E9/L&CD4细胞计数:201个/mm3,"不应"推荐方案:髓系生长因子治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 有感染征象 中性粒细胞:1.6 10^9/L CD4细胞计数:201 /mm3
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
    Should Not Contain    ${aj}     髓系生长因子治疗



#######20171113 毛细胞白血病  毛细胞白血病&中性粒细胞＜1.0×10E9/L｜CD4细胞计数下降｜有感染征象 化疗前 中性粒细胞>=1.5×10E9/L&CD4细胞计数＞200个/mm3  预防性抗感染治疗    开始化疗前使用聚乙二醇非格司亭6 mg皮下注射，诱导支持治疗至中性粒细胞>=1.5×10E9/L、CD4细胞计数＞200个/mm3以减少感染的发生       是
#########毛细胞白血病&有机会性感染风险｜CD4细胞计数降低
#########毛细胞白血病&有机会性感染风险｜CD4细胞计数降低

推荐治疗方案10行-1 主要条件:毛细胞白血病&有机会性感染风险+次要条件:化疗前,推荐方案:预防性抗感染治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 有机会性感染风险 化疗前
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
    Should Contain    ${aj}     预防性抗感染治疗


推荐治疗方案10行-2 主要条件:毛细胞白血病&CD4细胞计数降低+次要条件:化疗前,推荐方案:预防性抗感染治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 CD4细胞计数降低 化疗前
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
    Should Contain    ${aj}     预防性抗感染治疗



推荐治疗方案10行-3 主要条件:毛细胞白血病&有机会性感染风险｜CD4细胞计数降低+次要条件:化疗前+否定条件:CD4细胞计数>200个/mm3,"不应"推荐方案:预防性抗感染治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 有机会性感染风险 CD4细胞计数降低 化疗前 CD4细胞计数:201/mm3
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
    Should Not Contain    ${aj}     预防性抗感染治疗



#######20171113 毛细胞白血病  毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件  脾功能亢进｜症状性脾肿大        脾切除治疗   毛细胞白血病复发，距离初次缓解时间<=24个月者，可考虑脾切除术治疗。尤其是有脾区剧烈疼痛、脾破裂者，可行脾切除术。切脾后血象改善或恢复正常  无   是
########毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件
########毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件
######脾功能亢进｜症状性脾肿大
######脾功能亢进 症状性脾肿大

推荐治疗方案11行-1 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件+次要条件:脾功能亢进,推荐方案:脾切除治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件 脾功能亢进
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
    Should Contain    ${aj}     脾切除治疗


推荐治疗方案11行-2 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件+次要条件:症状性脾肿大,推荐方案:脾切除治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件 症状性脾肿大
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
    Should Contain    ${aj}     脾切除治疗




#######20171113 毛细胞白血病  毛细胞白血病复发&毛细胞白血病治疗条件         克拉曲滨联合利妥昔单抗治疗复发 毛细胞白血病复发，无论复发早晚均可使用克拉曲滨联合利妥昔单抗治疗        是
#######毛细胞白血病复发&毛细胞白血病治疗条件

推荐治疗方案12行-1 主要条件:毛细胞白血病复发&毛细胞白血病治疗条件+次要条件:脾功能亢进,推荐方案:克拉曲滨联合利妥昔单抗治疗复发
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 毛细胞白血病治疗条件
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
    Should Contain    ${aj}     克拉曲滨联合利妥昔单抗治疗复发



#######20171113 毛细胞白血病  毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件  脾功能亢进｜症状性脾肿大        早期复发患者的化疗方案选择   毛细胞白血病复发，距离初次缓解时间<=24个月者，可考虑脾切除术治疗。尤其是有脾区剧烈疼痛、脾破裂者，可行脾切除术。切脾后血象改善或恢复正常  无   是
########毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件
########毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件
######脾功能亢进｜症状性脾肿大
######脾功能亢进 症状性脾肿大

推荐治疗方案13行-1 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:早期复发患者的化疗方案选择
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件
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
    Should Contain    ${aj}     早期复发患者的化疗方案选择


推荐治疗方案13行-2 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:早期复发患者的化疗方案选择
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件
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
    Should Contain    ${aj}     早期复发患者的化疗方案选择





#######20171113 毛细胞白血病  毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件          新靶向药物威罗菲尼   可考虑筛选入组新靶向药物威罗菲尼临床试验    无   是


推荐治疗方案14行-1 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:新靶向药物威罗菲尼
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件
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
    Should Contain    ${aj}     新靶向药物威罗菲尼


推荐治疗方案14行-2 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:新靶向药物威罗菲尼
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:24月 毛细胞白血病治疗条件
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
    Should Contain    ${aj}     新靶向药物威罗菲尼



#######20171113 毛细胞白血病  毛细胞白血病复发&复发时间距离初次缓解时间>24个月&毛细胞白血病治疗条件           晚期复发患者的化疗方案选择   缓解时间>24个月者可重复原来的嘌呤核苷类似物(克拉屈滨或喷司他丁)治疗后再加用利妥昔单抗   无   是


推荐治疗方案15行-1 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:晚期复发患者的化疗方案选择
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 复发时间距离初次缓解时间:25月 血红蛋白:9g/dlL 血红蛋白:99 g/L 中性粒细胞:0.9 10^9/L 血小板计数:99 10^9/L 严重贫血 中性粒细胞减低:10^9/L 血小板减少
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"0","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     晚期复发患者的化疗方案选择


#######20171113 毛细胞白血病  毛细胞白血病          评估启动治疗时机和风险获益   超过90%的毛细胞白血病患者在最初诊断时就需要治疗，但一些患者可能不满足标准的诊断时进行治疗的条件。医生与患者立即沟通讨论治疗风险和获益    无   是

推荐治疗方案16行-1 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:评估启动治疗时机和风险获益
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病
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
    Should Contain    ${aj}     评估启动治疗时机和风险获益




#######20171113 毛细胞白血病  毛细胞白血病复发            干扰素治疗毛细胞白血病复发   毛细胞白血病复发者其他治疗无效时尝试使用干扰素治疗       是

推荐治疗方案17行-1 主要条件:毛细胞白血病复发&复发时间距离初次缓解时间<=24个月&毛细胞白血病治疗条件,推荐方案:干扰素治疗毛细胞白血病复发
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发
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
    Should Contain    ${aj}     干扰素治疗毛细胞白血病复发




#######20171113 毛细胞白血病  毛细胞白血病&发热       中性粒细胞减少性发热  治疗前对发热进行管理  除非证实为其他原因，患者发热应考虑为感染的征象，应在开始化疗之前尽一切努力明确发热源并治疗感染 无   是

推荐治疗方案18行-1 主要条件:毛细胞白血病&发热,推荐方案:治疗前对发热进行管理
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 发热
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
    Should Contain    ${aj}     治疗前对发热进行管理


推荐治疗方案18行-2 主要条件:毛细胞白血病&发热+否定条件:中性粒细胞减少性发热,"不应"推荐方案:治疗前对发热进行管理
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 发热 中性粒细胞减少性发热
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
    Should Not Contain    ${aj}     治疗前对发热进行管理



#######20171113 毛细胞白血病  毛细胞白血病｜毛细胞白血病复发&年龄>＝60岁&ECOG评分3分｜ECOG评分4分   不能耐受克拉屈滨        靶向药物利妥昔单抗治疗 单用CD20单克隆抗体利妥昔单抗治疗，375mg/m2体表面积，1周1次        是
##########毛细胞白血病｜毛细胞白血病复发&年龄>＝60岁&ECOG评分3分｜ECOG评分4分
##########毛细胞白血病 毛细胞白血病复发&年龄>＝60岁&ECOG评分3分 ECOG评分4分

推荐治疗方案19行-1 主要条件:毛细胞白血病&年龄>＝60岁&ECOG评分3分+次要条件:不能耐受克拉屈滨,推荐方案:靶向药物利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 ECOG评分3分 不能耐受克拉屈滨
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     靶向药物利妥昔单抗治疗


推荐治疗方案19行-2 主要条件:毛细胞白血病&年龄>＝60岁&ECOG评分4分+次要条件:不能耐受克拉屈滨,推荐方案:靶向药物利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病 ECOG评分4分 不能耐受克拉屈滨
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     靶向药物利妥昔单抗治疗



推荐治疗方案19行-3 主要条件:毛细胞白血病复发&年龄>＝60岁&ECOG评分3分+次要条件:不能耐受克拉屈滨,推荐方案:靶向药物利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 ECOG评分3分 不能耐受克拉屈滨
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     靶向药物利妥昔单抗治疗


推荐治疗方案19行-4 主要条件:毛细胞白血病复发&年龄>＝60岁&ECOG评分4分+次要条件:不能耐受克拉屈滨,推荐方案:靶向药物利妥昔单抗治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    毛细胞白血病复发 ECOG评分4分 不能耐受克拉屈滨
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     靶向药物利妥昔单抗治疗


#######20171113 毛细胞白血病  化疗&呕吐&毛细胞白血病            止呕药治疗   昂丹司琼、阿扎司琼等防治化疗（尤其是细胞毒化疗药）引起的呕吐      是

推荐治疗方案20行-1 主要条件:化疗&呕吐&毛细胞白血病,推荐方案:止呕药治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    毛细胞白血病
    ${Subjective}    Set Variable    化疗 呕吐 毛细胞白血病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     止呕药治疗















