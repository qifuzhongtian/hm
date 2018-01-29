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

######20171115  蒽环类标准诱导化疗       急性髓系白血病｜急性髓系白血病首次诱导化疗   心功能评价能耐受蒽环类药物   急性早幼粒细胞白血病｜心功能评价不能耐受蒽环类药物｜化疗不耐受 jxsxbxb1    是

# 药品方案2行-分组1:治疗方案-蒽环类标准诱导化疗:主要条件:急性髓系白血病｜急性髓系白血病首次诱导化疗+伴随条件:心功能评价能耐受蒽环类药物,用药推荐包含:注射用盐酸柔红霉素 注射用盐酸伊达比星 盐酸伊达比星胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸柔红霉素    注射用盐酸伊达比星    盐酸伊达比星胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 急性髓系白血病首次诱导化疗 心功能评价能耐受蒽环类药物 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


# 药品方案2行-分组2:治疗方案-蒽环类标准诱导化疗:主要条件:急性髓系白血病｜急性髓系白血病首次诱导化疗+伴随条件:心功能评价能耐受蒽环类药物,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷
#     [Documentation]    断言:""
#     ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 急性髓系白血病首次诱导化疗 心功能评价能耐受蒽环类药物 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}



###########20171115 非蒽环类诱导化疗        急性髓系白血病｜急性髓系白血病首次诱导化疗   心功能评价不能耐受蒽环类药物  急性早幼粒细胞白血病｜化疗不耐受    jxsxbxb2    是

# 药品方案3行-分组3:治疗方案-非蒽环类诱导化疗:主要条件:急性髓系白血病｜急性髓系白血病首次诱导化疗+伴随条件:心功能评价能耐受蒽环类药物,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷
#     [Documentation]    断言:""
#     ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 急性髓系白血病首次诱导化疗 心功能评价能耐受蒽环类药物 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


# 药品方案3行-分组4:治疗方案-非蒽环类诱导化疗:主要条件:急性髓系白血病｜急性髓系白血病首次诱导化疗+伴随条件:心功能评价能耐受蒽环类药物,用药推荐包含:注射用磷酸氟达拉滨 磷酸氟达拉滨片
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用磷酸氟达拉滨    磷酸氟达拉滨片
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 急性髓系白血病首次诱导化疗 心功能评价能耐受蒽环类药物 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########20171115    高剂量羟基脲治疗        急性髓系白血病&高白细胞血症｜WBC>100×10E9/L｜白细胞淤滞｜白细胞计数迅速上升含原始细胞      急性早幼粒细胞白血病  jxsxbxb3    是

# 药品方案4行-分组5:治疗方案-高剂量羟基脲治疗:主要条件:急性髓系白血病&高白细胞血症｜WBC>100×10E9/L｜白细胞淤滞｜白细胞计数迅速上升含原始细胞,用药推荐包含:羟基脲片 羟基脲胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    羟基脲片    羟基脲胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 高白细胞血症 WBC:101×10E9/L 白细胞淤滞 白细胞计数迅速上升含原始细胞 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########20171115    高剂量羟基脲治疗        急性早幼粒细胞白血病&WBC>50×10E9/L｜白细胞计数迅速上升含原始细胞｜高白细胞血症｜白细胞淤滞            jxsxbxb4    是

# 药品方案5行-分组6:治疗方案-高剂量羟基脲治疗:主要条件:急性早幼粒细胞白血病&WBC>50×10E9/L｜白细胞计数迅速上升含原始细胞｜高白细胞血症｜白细胞淤滞,用药推荐包含:羟基脲片 羟基脲胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    羟基脲片    羟基脲胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性早幼粒细胞白血病 WBC:51×10E9/L 白细胞计数迅速上升含原始细胞 高白细胞血症 白细胞淤滞 诊断及诊断依据:急性早幼粒细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########20171115    高剂量羟基脲治疗        急性早幼粒细胞白血病&WBC>50×10E9/L｜白细胞计数迅速上升含原始细胞｜高白细胞血症｜白细胞淤滞            jxsxbxb4    是

# 药品方案6行-分组7:治疗方案-巩固化疗和异基因造血干细胞移植(HSCT):主要条件:急性髓系白血病 诱导缓解后巩固治疗,用药推荐包含:注射用盐酸阿糖胞苷 注射用阿糖胞苷 阿糖胞苷注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸阿糖胞苷    注射用阿糖胞苷    阿糖胞苷注射液
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 诱导缓解后巩固治疗 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案6行-分组8:治疗方案-巩固化疗和异基因造血干细胞移植(HSCT):主要条件:急性髓系白血病 诱导缓解后巩固治疗,用药推荐包含:注射用地西他滨
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用地西他滨
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 诱导缓解后巩固治疗 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案6行-分组9:治疗方案-巩固化疗和异基因造血干细胞移植(HSCT):主要条件:急性髓系白血病 诱导缓解后巩固治疗,用药推荐包含:注射用盐酸柔红霉素
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸柔红霉素
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 诱导缓解后巩固治疗 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

#########20171115   较低强度化疗和姑息治疗     急性髓系白血病&残留白血病｜诱导化疗失败&不耐受再诱导化疗   诱导化疗未缓解 "ECOG体能状况量表评分<3｜左心室射血分数在常用正常值范围内｜尚未接受累积剂量的蒽环类药物治疗｜考虑造血干细胞移植(HSCT)｜中等的细胞遗传学风险和分子学风险｜较低的细胞遗传学风险和分子学风险"   jxsxbxb6    是
# 药品方案7行-分组10:治疗方案-非蒽环类诱导化疗:主要条件:急性髓系白血病&残留白血病｜诱导化疗失败&不耐受再诱导化疗,用药推荐包含:注射用盐酸柔红霉素 注射用盐酸伊达比星 盐酸伊达比星胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸柔红霉素    注射用盐酸伊达比星    盐酸伊达比星胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 残留白血病 诱导化疗失败 不耐受再诱导化疗 诱导化疗未缓解 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案7行-分组11:治疗方案-非蒽环类诱导化疗:主要条件:急性髓系白血病&残留白血病｜诱导化疗失败 不耐受再诱导化疗,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷 阿糖胞苷注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷    阿糖胞苷注射液
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 残留白血病 诱导化疗失败 不耐受再诱导化疗 诱导化疗未缓解 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案7行-分组12:治疗方案-非蒽环类诱导化疗:主要条件:急性髓系白血病&残留白血病｜诱导化疗失败 不耐受再诱导化疗,用药推荐包含:注射用地西他滨
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用地西他滨
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 残留白血病 诱导化疗失败 不耐受再诱导化疗 诱导化疗未缓解 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案7行-分组13:治疗方案-非蒽环类诱导化疗:主要条件:急性髓系白血病&残留白血病｜诱导化疗失败 不耐受再诱导化疗,用药推荐包含:羟基脲片 羟基脲胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    羟基脲片    羟基脲胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 残留白血病 诱导化疗失败 不耐受再诱导化疗 诱导化疗未缓解 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# #########20171115   再诱导化疗       急性髓系白血病&残留白血病｜诱导化疗失败｜骨髓活检提示持续性疾病    可耐受再诱导化疗｜ECOG体能状况量表评分<3｜左心室射血分数在常用正常值范围内｜尚未接受累积剂量的蒽环类药物治疗｜考虑造血干细胞移植(HSCT)｜中等或较低的细胞遗传学风险和分子学风险   不耐受再诱导化疗｜诱导化疗达到完全缓解｜急性早幼粒细胞白血病  jxsxbxb7    是

# 药品方案8行-分组14:治疗方案-再诱导化疗:主要条件:急性髓系白血病&残留白血病｜诱导化疗失败｜骨髓活检提示持续性疾病+伴随条件:可耐受再诱导化疗｜ECOG体能状况量表评分<3｜左心室射血分数在常用正常值范围内｜尚未接受累积剂量的蒽环类药物治疗｜考虑造血干细胞移植(HSCT)｜中等或较低的细胞遗传学风险和分子学风险,用药推荐包含:注射用盐酸柔红霉素 注射用盐酸伊达比星 盐酸伊达比星胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸柔红霉素    注射用盐酸伊达比星    盐酸伊达比星胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 残留白血病 诱导化疗失败 骨髓活检提示持续性疾病 可耐受再诱导化疗 ECOG体能状况量表评分:2 左心室射血分数在常用正常值范围内 尚未接受累积剂量的蒽环类药物治疗 考虑造血干细胞移植(HSCT) 中等或较低的细胞遗传学风险和分子学风险 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案8行-分组15:治疗方案-再诱导化疗:主要条件:急性髓系白血病&残留白血病｜诱导化疗失败｜骨髓活检提示持续性疾病+伴随条件:可耐受再诱导化疗｜ECOG体能状况量表评分<3｜左心室射血分数在常用正常值范围内｜尚未接受累积剂量的蒽环类药物治疗｜考虑造血干细胞移植(HSCT)｜中等或较低的细胞遗传学风险和分子学风险,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷
#     [Documentation]    断言:""
#     ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 残留白血病 诱导化疗失败 骨髓活检提示持续性疾病 可耐受再诱导化疗 ECOG体能状况量表评分:2 左心室射血分数在常用正常值范围内 尚未接受累积剂量的蒽环类药物治疗 考虑造血干细胞移植(HSCT) 中等或较低的细胞遗传学风险和分子学风险 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

#########20171115   再诱导化疗       急性髓系白血病&残留白血病｜诱导化疗失败｜骨髓活检提示持续性疾病    可耐受再诱导化疗｜ECOG体能状况量表评分<3｜左心室射血分数在常用正常值范围内｜尚未接受累积剂量的蒽环类药物治疗｜考虑造血干细胞移植(HSCT)｜中等或较低的细胞遗传学风险和分子学风险   不耐受再诱导化疗｜诱导化疗达到完全缓解｜急性早幼粒细胞白血病  jxsxbxb7    是
###########急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败
# 药品方案9行-分组16:治疗方案-其他强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败+伴随条件:不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:克拉屈滨注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    克拉屈滨注射液
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病&难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 药品方案9行-分组17:治疗方案-其他强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败+伴随条件:不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:盐酸米托蒽醌注射液 注射用盐酸米托蒽醌 盐酸米托蒽醌氯化钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    盐酸米托蒽醌注射液    注射用盐酸米托蒽醌    盐酸米托蒽醌氯化钠注射液
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病&难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


# 药品方案9行-分组18:治疗方案-其他强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败+伴随条件:不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:依托泊苷注射液 注射用依托泊苷 注射用磷酸依托泊苷 依托泊苷软胶囊 依托泊苷胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    依托泊苷注射液    注射用依托泊苷    注射用磷酸依托泊苷    依托泊苷软胶囊    依托泊苷胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病&难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


# 药品方案9行-分组19:治疗方案-其他强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败+伴随条件:不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:注射用磷酸氟达拉滨 磷酸氟达拉滨片
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用磷酸氟达拉滨    磷酸氟达拉滨片
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病&难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}



# 药品方案9行-分组20:治疗方案-其他强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败+伴随条件:不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:注射用盐酸伊达比星 盐酸伊达比星胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸伊达比星    盐酸伊达比星胶囊
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病&难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}



# 药品方案10行-分组21:治疗方案-其他非强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败&不耐受其他强化化疗+伴随条件:不不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:注射用地西他滨
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用地西他滨
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不耐受其他强化化疗 急性髓系白血病 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白细胞 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}



# 药品方案10行-分组22:治疗方案-其他非强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败&不耐受其他强化化疗+伴随条件:不不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:注射用盐酸阿糖胞苷 注射用阿糖胞苷 阿糖胞苷注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用盐酸阿糖胞苷    注射用阿糖胞苷    阿糖胞苷注射液
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不耐受其他强化化疗 急性髓系白血病 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白细胞 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
#     ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

#####待改
药品方案10行-分组22:治疗方案-其他非强化化疗方案:主要条件:急性髓系白血病&难治性白血病｜第二次诱导化疗失败｜再诱导化疗失败&不耐受其他强化化疗+伴随条件:不不存在骨髓细胞数量过少｜明显的残留白血病细胞｜难治性疾病,用药推荐包含:注射用盐酸阿糖胞苷 注射用阿糖胞苷 阿糖胞苷注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸阿糖胞苷    注射用阿糖胞苷    阿糖胞苷注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性髓系白血病 难治性白血病 第二次诱导化疗失败 再诱导化疗失败 不耐受其他强化化疗 急性髓系白血病 不存在骨髓细胞数量过少 明显的残留白血病细胞 难治性疾病 诊断及诊断依据:急性髓系白细胞 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


