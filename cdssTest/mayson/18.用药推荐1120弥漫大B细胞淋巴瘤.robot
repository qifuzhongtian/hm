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
# ----gender  Integer 否   性别0女，1男,  2 其他
# ----age double  是   年龄
# ----ageType String  是   岁、月、天
# ----maritalStatus   Integer 否   婚姻状况  0：未婚 ，1: 已婚， 2:其他
# ----pregnancyStatus Integer 否   妊娠状况  1: 怀孕  0：未怀孕
# ----bodyTempr   Double  否   体温
# ----heartRate   Integer 否   心率
# ----lowBldPress Double  否   舒张压-低压
# ----highBldPress    Double  否   收缩压-高压
*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***

药品方案3行-分组1:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案3行-分组2:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:注射用环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案3行-分组3:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:盐酸多柔比星注射液 注射用盐酸表柔比星 盐酸表柔比星注射液 注射用盐酸表柔比星(速溶)
    [Documentation]    断言:""
    ${assert}    Create List    盐酸多柔比星注射液    注射用盐酸表柔比星    盐酸表柔比星注射液    注射用盐酸表柔比星(速溶)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案3行-分组4:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:注射用硫酸长春新碱
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案3行-分组5:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案3行-分组6:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:醋酸泼尼松龙注射液 醋酸泼尼松龙片 醋酸泼尼松片 氢化泼尼松注射液 泼尼松龙片 注射用甲泼尼龙琥珀酸钠
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙注射液    醋酸泼尼松龙片    醋酸泼尼松片    氢化泼尼松注射液    泼尼松龙片    注射用甲泼尼龙琥珀酸钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][5]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案3行-分组7:治疗方案-其他非强化化疗方案:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阴性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][6]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




药品方案3行-分组8:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案3行-分组9:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:注射用环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案3行-分组10:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:盐酸多柔比星注射液 注射用盐酸表柔比星 盐酸表柔比星注射液 注射用盐酸表柔比星(速溶)
    [Documentation]    断言:""
    ${assert}    Create List    盐酸多柔比星注射液    注射用盐酸表柔比星    盐酸表柔比星注射液    注射用盐酸表柔比星(速溶)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案3行-分组11:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:注射用硫酸长春新碱
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案3行-分组12:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案3行-分组13:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:醋酸泼尼松龙注射液 醋酸泼尼松龙片 醋酸泼尼松片 氢化泼尼松注射液 泼尼松龙片 注射用甲泼尼龙琥珀酸钠
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙注射液    醋酸泼尼松龙片    醋酸泼尼松片    氢化泼尼松注射液    泼尼松龙片    注射用甲泼尼龙琥珀酸钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][5]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案3行-分组14:治疗方案-中枢神经系统受累治疗:主要条件:中枢神经系统受累高风险人群&脑脊液细胞学检查阴性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"中枢神经系统受累高风险人群 脑脊液细胞学检查阳性 中枢神经系统浸润 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][6]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案4行-分组1:治疗方案-髓系生长因子治疗:主要条件:弥漫大B细胞淋巴瘤｜中枢神经系统受累高风险人群+伴随条件:WBC<=10×10E9/L｜白细胞减少,用药推荐包含:注射用重组人粒细胞巨噬细胞刺激因子 注射用重组人粒细胞刺激因子(CHO细胞) 重组人粒细胞刺激因子注射液 聚乙二醇化重组人粒细胞刺激因子注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用重组人粒细胞巨噬细胞刺激因子    注射用重组人粒细胞刺激因子(CHO细胞)    重组人粒细胞刺激因子注射液    聚乙二醇化重组人粒细胞刺激因子注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 中枢神经系统受累高风险人群 白细胞计数:10 10^9/L 白细胞减少 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#########20171116  预防肿瘤溶解综合征       弥漫大B细胞淋巴瘤｜肿瘤溶解综合征高危｜高肿瘤负荷｜中枢神经系统受累高风险人群         mmxdbxblbl4 是

药品方案5行-分组16:治疗方案-预防肿瘤溶解综合征:主要条件:弥漫大B细胞淋巴瘤｜肿瘤溶解综合征高危｜高肿瘤负荷｜中枢神经系统受累高风险人群,用药推荐包含:氯化钠注射液 葡萄糖氯化钠注射液 葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    氯化钠注射液    葡萄糖氯化钠注射液    葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 肿瘤溶解综合征高危 高肿瘤负荷 中枢神经系统受累高风险人群 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案5行-分组17:治疗方案-预防肿瘤溶解综合征:主要条件:弥漫大B细胞淋巴瘤｜肿瘤溶解综合征高危｜高肿瘤负荷｜中枢神经系统受累高风险人群,用药推荐包含:碳酸氢钠注射液 碳酸氢钠片
    [Documentation]    断言:""
    ${assert}    Create List    碳酸氢钠注射液    碳酸氢钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 肿瘤溶解综合征高危 高肿瘤负荷 中枢神经系统受累高风险人群 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案5行-分组18:治疗方案-预防肿瘤溶解综合征:主要条件:弥漫大B细胞淋巴瘤｜肿瘤溶解综合征高危｜高肿瘤负荷｜中枢神经系统受累高风险人群,用药推荐包含:别嘌醇片 别嘌醇缓释片 别嘌醇缓释胶囊 复方别嘌醇片
    [Documentation]    断言:""
    ${assert}    Create List    别嘌醇片    别嘌醇缓释片    别嘌醇缓释胶囊    复方别嘌醇片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 肿瘤溶解综合征高危 高肿瘤负荷 中枢神经系统受累高风险人群 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案5行-分组19:治疗方案-预防肿瘤溶解综合征:主要条件:弥漫大B细胞淋巴瘤｜肿瘤溶解综合征高危｜高肿瘤负荷｜中枢神经系统受累高风险人群,用药推荐包含:呋塞米注射液 注射用呋塞米
    [Documentation]    断言:""
    ${assert}    Create List    呋塞米注射液    注射用呋塞米
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 肿瘤溶解综合征高危 高肿瘤负荷 中枢神经系统受累高风险人群 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#########20171116  利妥昔单抗靶向药物治疗     弥漫大B细胞淋巴瘤&CD20阳性        CD20阴性  mmxdbxblbl5 是
药品方案6行-分组20:治疗方案-利妥昔单抗靶向药物治疗:主要条件:弥漫大B细胞淋巴瘤&CD20阳性,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 CD20阳性 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#########20171116  首选R-CHOP方案联合放疗      弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期I期｜AnnArbor淋巴瘤分期系统分期II期        AnnArbor淋巴瘤分期系统分期II期&巨块型淋巴瘤｜病灶直径>10cm｜HIV阳性｜心肌病｜ECOG体能状况评分＞2分  mmxdbxblbl6 是

药品方案7行-分组21:治疗方案-首选R-CHOP方案联合放疗:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期I期｜AnnArbor淋巴瘤分期系统分期II期,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期I期 AnnArbor淋巴瘤分期系统分期II期 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案7行-分组22:治疗方案-首选R-CHOP方案联合放疗:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期I期｜AnnArbor淋巴瘤分期系统分期II期,用药推荐包含:注射用环磷酰胺 盐酸多柔比星注射液 注射用盐酸表柔比星 盐酸表柔比星注射液 注射用盐酸表柔比星(速溶)
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺    盐酸多柔比星注射液    注射用盐酸表柔比星    盐酸表柔比星注射液    注射用盐酸表柔比星(速溶)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期I期 AnnArbor淋巴瘤分期系统分期II期 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案7行-分组23:治疗方案-首选R-CHOP方案联合放疗:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期I期｜AnnArbor淋巴瘤分期系统分期II期,用药推荐包含:注射用硫酸长春新碱
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期I期 AnnArbor淋巴瘤分期系统分期II期 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案7行-分组24:治疗方案-首选R-CHOP方案联合放疗:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期I期｜AnnArbor淋巴瘤分期系统分期II期,用药推荐包含:醋酸泼尼松龙注射液 醋酸泼尼松龙片 醋酸泼尼松片 氢化泼尼松注射液 泼尼松龙片 注射用甲泼尼龙琥珀酸钠
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙注射液    醋酸泼尼松龙片    醋酸泼尼松片    氢化泼尼松注射液    泼尼松龙片    注射用甲泼尼龙琥珀酸钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期I期 AnnArbor淋巴瘤分期系统分期II期 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#####20171116  首选R-CHOP方案      弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期III期｜AnnArbor淋巴瘤分期系统分期IV期｜巨块型II期弥漫性大B细胞淋巴瘤     AnnArbor淋巴瘤分期系统分期I期｜AnnArbor淋巴瘤分期系统分期II期&病灶直径<=10cm   mmxdbxblbl7 是
药品方案8行-分组25:治疗方案-首选R-CHOP方案:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期III期｜AnnArbor淋巴瘤分期系统分期IV期｜巨块型II期弥漫性大B细胞淋巴瘤,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期III期 AnnArbor淋巴瘤分期系统分期IV期 巨块型II期弥漫性大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案8行-分组26:治疗方案-首选R-CHOP方案:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期III期｜AnnArbor淋巴瘤分期系统分期IV期｜巨块型II期弥漫性大B细胞淋巴瘤,用药推荐包含:盐酸多柔比星注射液 注射用盐酸表柔比星 盐酸表柔比星注射液 注射用盐酸表柔比星(速溶)
    [Documentation]    断言:""
    ${assert}    Create List    盐酸多柔比星注射液    注射用盐酸表柔比星    盐酸表柔比星注射液    注射用盐酸表柔比星(速溶)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期III期 AnnArbor淋巴瘤分期系统分期IV期 巨块型II期弥漫性大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案8行-分组27:治疗方案-首选R-CHOP方案:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期III期｜AnnArbor淋巴瘤分期系统分期IV期｜巨块型II期弥漫性大B细胞淋巴瘤,用药推荐包含:注射用硫酸长春新碱
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期III期 AnnArbor淋巴瘤分期系统分期IV期 巨块型II期弥漫性大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案8行-分组28:治疗方案-首选R-CHOP方案:主要条件:弥漫大B细胞淋巴瘤&AnnArbor淋巴瘤分期系统分期III期｜AnnArbor淋巴瘤分期系统分期IV期｜巨块型II期弥漫性大B细胞淋巴瘤,用药推荐包含:醋酸泼尼松龙注射液 醋酸泼尼松龙片 醋酸泼尼松片 氢化泼尼松注射液 泼尼松龙片 注射用甲泼尼龙琥珀酸钠
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙注射液    醋酸泼尼松龙片    醋酸泼尼松片    氢化泼尼松注射液    泼尼松龙片    注射用甲泼尼龙琥珀酸钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 AnnArbor淋巴瘤分期系统分期III期 AnnArbor淋巴瘤分期系统分期IV期 巨块型II期弥漫性大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#####20171116  挽救化疗方案      弥漫大B细胞淋巴瘤       "HIV阳性｜心肌病｜ ECOG体能状况评分＞2分"  mmxdbxblbl8 是
药品方案9行-分组30:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][5]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案9行-分组31:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:阿糖胞苷注射液 注射用阿糖胞苷 注射用盐酸阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用阿糖胞苷    注射用盐酸阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][6]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案9行-分组32:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:注射用盐酸吉西他滨
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸吉西他滨
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案9行-分组33:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:注射用顺铂 注射用顺铂(冻干型) 顺铂氯化钠注射液 顺铂注射液 卡铂注射液 注射用卡铂
    [Documentation]    断言:""
    ${assert}    Create List    注射用顺铂    注射用顺铂(冻干型)    顺铂氯化钠注射液    顺铂注射液    卡铂注射液    注射用卡铂
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案9行-分组34:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:注射用异环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用异环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案9行-分组35:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:地塞米松棕榈酸酯注射液 地塞米松磷酸钠注射液 注射用地塞米松磷酸钠 醋酸地塞米松注射液
    [Documentation]    断言:""
    ${assert}    Create List    地塞米松棕榈酸酯注射液    地塞米松磷酸钠注射液    注射用地塞米松磷酸钠    醋酸地塞米松注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案9行-分组36:治疗方案-挽救化疗方案:主要条件:弥漫大B细胞淋巴瘤,用药推荐包含:依托泊苷注射液 注射用依托泊苷 注射用磷酸依托泊苷 依托泊苷软胶囊 依托泊苷胶囊
    [Documentation]    断言:""
    ${assert}    Create List    依托泊苷注射液    注射用依托泊苷    注射用磷酸依托泊苷    依托泊苷软胶囊    依托泊苷胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

########20171116    止吐药物        弥漫大B细胞淋巴瘤&化疗｜放疗&呕吐          mmxdbxblbl9 是
药品方案10行-分组37:治疗方案-止吐药物:主要条件:弥漫大B细胞淋巴瘤&化疗｜放疗&呕吐,用药推荐包含:注射用盐酸昂丹司琼 盐酸昂丹司琼氯化钠注射液 盐酸昂丹司琼注射液 盐酸昂丹司琼葡萄糖注射液 盐酸阿扎司琼注射液 注射用盐酸格拉司琼 盐酸格拉司琼注射液 盐酸雷莫司琼注射液 注射用盐酸雷莫司琼 枸橼酸托烷司琼注射液 盐酸托烷司琼葡萄糖注射液 甲磺酸托烷司琼注射液 注射用盐酸托烷司琼 盐酸格拉司琼葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸昂丹司琼    盐酸昂丹司琼氯化钠注射液    盐酸昂丹司琼注射液    盐酸昂丹司琼葡萄糖注射液    盐酸阿扎司琼注射液    注射用盐酸格拉司琼    盐酸格拉司琼注射液    盐酸雷莫司琼注射液    注射用盐酸雷莫司琼    枸橼酸托烷司琼注射液    盐酸托烷司琼葡萄糖注射液    甲磺酸托烷司琼注射液    注射用盐酸托烷司琼    盐酸格拉司琼葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 化疗 放疗 呕吐 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案10行-分组38:治疗方案-止吐药物:主要条件:弥漫大B细胞淋巴瘤&化疗｜放疗&呕吐,用药推荐包含:盐酸格拉司琼片 盐酸格拉司琼胶囊 盐酸格拉司琼口腔崩解片 盐酸阿扎司琼片 盐酸格拉司琼分散片 盐酸托烷司琼胶囊 盐酸托烷司琼口服溶液 盐酸昂丹司琼口腔崩解片 盐酸昂丹司琼片 盐酸昂丹司琼胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸格拉司琼片    盐酸格拉司琼胶囊    盐酸格拉司琼口腔崩解片    盐酸阿扎司琼片    盐酸格拉司琼分散片    盐酸托烷司琼胶囊    盐酸托烷司琼口服溶液    盐酸昂丹司琼口腔崩解片    盐酸昂丹司琼片    盐酸昂丹司琼胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"弥漫大B细胞淋巴瘤 化疗 放疗 呕吐 诊断及诊断依据:弥漫大B细胞淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




