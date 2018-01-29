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

######20171116  预防中枢神经系统浸润      急性淋巴细胞白血病           jxlbxbbxb1  是

药品方案2行-分组1:治疗方案-预防中枢神经系统浸润:主要条件:急性淋巴细胞白血病,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案2行-分组2:治疗方案-预防中枢神经系统浸润:主要条件:急性淋巴细胞白血病,用药推荐包含:阿糖胞苷注射液 注射用阿糖胞苷 注射用盐酸阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用阿糖胞苷    注射用盐酸阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案2行-分组3:治疗方案-预防中枢神经系统浸润:主要条件:急性淋巴细胞白血病,用药推荐包含:醋酸地塞米松注射液
    [Documentation]    断言:""
    ${assert}    Create List    醋酸地塞米松注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案2行-分组4:治疗方案-预防中枢神经系统浸润:主要条件:急性淋巴细胞白血病,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤 阿糖胞苷注射液 注射用阿糖胞苷 注射用盐酸阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤    阿糖胞苷注射液    注射用阿糖胞苷    注射用盐酸阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



######20171116  预防肿瘤溶解综合征       急性淋巴细胞白血病           jxlbxbbxb2  是

药品方案3行-分组5:治疗方案-预治肿瘤溶解综合征:主要条件:急性淋巴细胞白血病,用药推荐包含:氯化钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    氯化钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案3行-分组6:治疗方案-预治肿瘤溶解综合征:主要条件:急性淋巴细胞白血病,用药推荐包含:葡萄糖氯化钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    葡萄糖氯化钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案3行-分组7:治疗方案-预治肿瘤溶解综合征:主要条件:急性淋巴细胞白血病,用药推荐包含:葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案3行-分组8:治疗方案-预治肿瘤溶解综合征:主要条件:急性淋巴细胞白血病,用药推荐包含:碳酸氢钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    碳酸氢钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案3行-分组9:治疗方案-预治肿瘤溶解综合征:主要条件:急性淋巴细胞白血病,用药推荐包含:别嘌醇片 别嘌醇缓释片 别嘌醇缓释胶囊 复方别嘌醇片
    [Documentation]    断言:""
    ${assert}    Create List    别嘌醇片    别嘌醇缓释片    别嘌醇缓释胶囊    复方别嘌醇片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

######20171116  高剂量羟基脲治疗        急性淋巴细胞白血病&高白细胞血症｜WBC>100×10E9/L｜白细胞淤滞           jxlbxbbxb3  是
######急性淋巴细胞白血病 高白细胞血症 WBC:101×10E9/L 白细胞淤滞
药品方案4行-分组10:治疗方案-高剂量羟基脲治疗:主要条件:急性淋巴细胞白血病&高白细胞血症｜WBC>100×10E9/L｜白细胞淤滞,用药推荐包含:羟基脲片 羟基脲胶囊
    [Documentation]    断言:""
    ${assert}    Create List    羟基脲片    羟基脲胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 高白细胞血症 WBC:101×10E9/L 白细胞淤滞 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



######20171116  预防性抗细菌真菌病毒药物        急性淋巴细胞白血病&中性粒细胞减少       体温>=38.3℃｜脓毒症｜中性粒细胞减少性发热    jxlbxbbxb4  是
######急性淋巴细胞白血病 中性粒细胞减少
药品方案5行-分组11:治疗方案-预防性抗细菌真菌病毒药物:主要条件:急性淋巴细胞白血病&中性粒细胞减少,用药推荐包含:左氧氟沙星片0.5g 乳酸左氧氟沙星分散片 甲磺酸左氧氟沙星片 甲磺酸左氧氟沙星胶囊 乳酸左氧氟沙星片 乳酸左氧氟沙星胶囊 盐酸左氧氟沙星胶囊 盐酸左氧氟沙星分散片 盐酸左氧氟沙星片
    [Documentation]    断言:""
    ${assert}    Create List    左氧氟沙星片0.5g    乳酸左氧氟沙星分散片    甲磺酸左氧氟沙星片    甲磺酸左氧氟沙星胶囊    乳酸左氧氟沙星片    乳酸左氧氟沙星胶囊    盐酸左氧氟沙星胶囊    盐酸左氧氟沙星分散片    盐酸左氧氟沙星片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案5行-分组12:治疗方案-预防性抗细菌真菌病毒药物:主要条件:急性淋巴细胞白血病&中性粒细胞减少,用药推荐包含:伏立康唑胶囊 伏立康唑片 伏立康唑分散片
    [Documentation]    断言:""
    ${assert}    Create List    伏立康唑胶囊    伏立康唑片    伏立康唑分散片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案5行-分组13:治疗方案-预防性抗细菌真菌病毒药物:主要条件:急性淋巴细胞白血病&中性粒细胞减少,用药推荐包含:注射用醋酸卡泊芬净
    [Documentation]    断言:""
    ${assert}    Create List    注射用醋酸卡泊芬净
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案5行-分组14:治疗方案-预防性抗细菌真菌病毒药物:主要条件:急性淋巴细胞白血病&中性粒细胞减少,用药推荐包含:阿昔洛韦片 阿昔洛韦缓释片 阿昔洛韦咀嚼片 阿昔洛韦分散片 阿昔洛韦胶囊 阿昔洛韦颗粒 盐酸伐昔洛韦片 盐酸伐昔洛韦分散片 盐酸伐昔洛韦缓释片 盐酸伐昔洛韦胶囊 盐酸伐昔洛韦颗粒
    [Documentation]    断言:""
    ${assert}    Create List    阿昔洛韦片    阿昔洛韦缓释片    阿昔洛韦咀嚼片    阿昔洛韦分散片    阿昔洛韦胶囊    阿昔洛韦颗粒    盐酸伐昔洛韦片    盐酸伐昔洛韦分散片    盐酸伐昔洛韦缓释片    盐酸伐昔洛韦胶囊    盐酸伐昔洛韦颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



######20171116  加强抗感染治疗     急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降            jxlbxbbxb5  是
######急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降
######急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降

药品方案6行-分组15:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用盐酸头孢吡肟
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸头孢吡肟
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案6行-分组16:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用美罗培南
    [Documentation]    断言:""
    ${assert}    Create List    注射用美罗培南
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案6行-分组17:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用盐酸万古霉素 注射用盐酸去甲万古霉素
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸万古霉素    注射用盐酸去甲万古霉素
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案6行-分组18:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:硫酸庆大霉素氯化钠注射液 硫酸庆大霉素注射液 注射用硫酸庆大霉素
    [Documentation]    断言:""
    ${assert}    Create List    硫酸庆大霉素氯化钠注射液    硫酸庆大霉素注射液    注射用硫酸庆大霉素
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案6行-分组19:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用硫酸阿米卡星 硫酸阿米卡星氯化钠注射液 硫酸阿米卡星注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸阿米卡星    硫酸阿米卡星氯化钠注射液    硫酸阿米卡星注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案6行-分组20:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用硫酸妥布霉素 硫酸妥布霉素氯化钠注射液 硫酸妥布霉素注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸妥布霉素    硫酸妥布霉素氯化钠注射液    硫酸妥布霉素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案6行-分组21:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用伏立康唑
    [Documentation]    断言:""
    ${assert}    Create List    注射用伏立康唑
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品方案6行-分组22:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用醋酸卡泊芬净
    [Documentation]    断言:""
    ${assert}    Create List    注射用醋酸卡泊芬净
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案6行-分组23:治疗方案-加强抗感染治疗:主要条件:急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降,用药推荐包含:注射用两性霉素B 注射用两性霉素B脂质体
    [Documentation]    断言:""
    ${assert}    Create List    注射用两性霉素B    注射用两性霉素B脂质体
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



######20171116  预防肺孢子菌肺炎        急性淋巴细胞白血病           jxlbxbbxb6  是
######急性淋巴细胞白血病&中性粒细胞减少&疑似脓毒症｜血压下降
######急性淋巴细胞白血病 中性粒细胞减少 疑似脓毒症 血压下降

药品方案7行-分组24:治疗方案-预防肺孢子菌肺炎:主要条件:急性淋巴细胞白血病,用药推荐包含:联磺甲氧苄啶胶囊 联磺甲氧苄啶片
    [Documentation]    断言:""
    ${assert}    Create List    联磺甲氧苄啶胶囊    联磺甲氧苄啶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案7行-分组25:治疗方案-预防肺孢子菌肺炎:主要条件:急性淋巴细胞白血病,用药推荐包含:氨苯砜片
    [Documentation]    断言:""
    ${assert}    Create List    氨苯砜片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案7行-分组26:治疗方案-预防肺孢子菌肺炎:主要条件:急性淋巴细胞白血病,用药推荐包含:沙丁胺醇气雾剂 硫酸沙丁胺醇气雾剂 复方硫酸沙丁胺醇气雾剂
    [Documentation]    断言:""
    ${assert}    Create List    沙丁胺醇气雾剂    硫酸沙丁胺醇气雾剂    复方硫酸沙丁胺醇气雾剂
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




######20171116  防治大剂量阿糖胞苷毒性     急性淋巴细胞白血病   结膜炎｜神经毒性作用｜小脑毒性作用       jxlbxbbxb7  是
######急性淋巴细胞白血病 结膜炎 神经毒性作用 小脑毒性作用

药品方案8行-分组27:治疗方案-防治大剂量阿糖胞苷毒性:主要条件:急性淋巴细胞白血病+伴随条件:结膜炎｜神经毒性作用｜小脑毒性作用,用药推荐包含:注射用维生素B6 维生素B6注射液 维生素B6片 维生素B6缓释片 维生素B6片
    [Documentation]    断言:""
    ${assert}    Create List    注射用维生素B6    维生素B6注射液    维生素B6片    维生素B6缓释片    维生素B6片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 结膜炎 神经毒性作用 小脑毒性作用 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案8行-分组28:治疗方案-防治大剂量阿糖胞苷毒性:主要条件:急性淋巴细胞白血病+伴随条件:结膜炎｜神经毒性作用｜小脑毒性作用,用药推荐包含:醋酸泼尼松龙滴眼液
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙滴眼液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 结膜炎 神经毒性作用 小脑毒性作用 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




######20171116  短疗程强化疗联合利妥昔单抗和鞘注        急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病            jxlbxbbxb8  是
#######急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病
#######急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病

药品方案9行-分组29:治疗方案-短疗程强化疗联合利妥昔单抗和鞘注:主要条件:急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案9行-分组30:治疗方案-短疗程强化疗联合利妥昔单抗和鞘注:主要条件:急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病,用药推荐包含:注射用盐酸阿糖胞苷 注射用阿糖胞苷 阿糖胞苷注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸阿糖胞苷    注射用阿糖胞苷    阿糖胞苷注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案9行-分组31:治疗方案-短疗程强化疗联合利妥昔单抗和鞘注:主要条件:急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病,用药推荐包含:注射用环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案9行-分组32:治疗方案-短疗程强化疗联合利妥昔单抗和鞘注:主要条件:急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案9行-分组33:治疗方案-短疗程强化疗联合利妥昔单抗和鞘注:主要条件:急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤 阿糖胞苷注射液 注射用阿糖胞苷 注射用盐酸阿糖胞苷 醋酸地塞米松注射液
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤    阿糖胞苷注射液    注射用阿糖胞苷    注射用盐酸阿糖胞苷    醋酸地塞米松注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案9行-分组34:治疗方案-短疗程强化疗联合利妥昔单抗和鞘注:主要条件:急性淋巴细胞白血病&成熟B细胞白血病｜Burkitt样急性淋巴细胞白血病,用药推荐包含:亚叶酸钙氯化钠注射液 亚叶酸钙注射液 注射用亚叶酸钙 亚叶酸钙片 亚叶酸钙胶囊
    [Documentation]    断言:""
    ${assert}    Create List    亚叶酸钙氯化钠注射液    亚叶酸钙注射液    注射用亚叶酸钙    亚叶酸钙片    亚叶酸钙胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 成熟B细胞白血病 Burkitt样急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


######20171116  伊马替尼靶向药物治疗      急性淋巴细胞白血病&费城染色体阳性｜Ph+急性淋巴细胞白血病          jxlbxbbxb9  是
##########急性淋巴细胞白血病 费城染色体阳性 Ph+急性淋巴细胞白血病
药品方案10行-分组35:治疗方案-伊马替尼靶向药物治疗:主要条件:急性淋巴细胞白血病&费城染色体阳性｜Ph+急性淋巴细胞白血病,用药推荐包含:甲磺酸伊马替尼片 甲磺酸伊马替尼胶囊
    [Documentation]    断言:""
    ${assert}    Create List    甲磺酸伊马替尼片    甲磺酸伊马替尼胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 费城染色体阳性 Ph+急性淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


######20171116  利妥昔单抗靶向药物治疗     急性淋巴细胞白血病&CD20阳性            jxlbxbbxb10 是
##########急性淋巴细胞白血病 CD20阳性
药品方案11行-分组36:治疗方案-利妥昔单抗靶向药物治疗:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 CD20阳性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


######20171116  标准Hyper-CAVD方案      急性淋巴细胞白血病&T细胞淋巴细胞白血病            jxlbxbbxb11 是
##########急性淋巴细胞白血病 T细胞淋巴细胞白血病
药品方案12行-分组37:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:注射用环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 T细胞淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案12行-分组38:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:注射用盐酸多柔比星 盐酸多柔比星脂质体注射液 注射用盐酸多柔比星(速溶) 盐酸多柔比星注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸多柔比星    盐酸多柔比星脂质体注射液    注射用盐酸多柔比星(速溶)    盐酸多柔比星注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 T细胞淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案12行-分组39:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:注射用硫酸长春新碱
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 T细胞淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案12行-分组40:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:醋酸地塞米松注射液
    [Documentation]    断言:""
    ${assert}    Create List    醋酸地塞米松注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 T细胞淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案12行-分组41:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 T细胞淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品方案12行-分组42:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:阿糖胞苷注射液 注射用阿糖胞苷 注射用盐酸阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用阿糖胞苷    注射用盐酸阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 T细胞淋巴细胞白血病 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

######20171116  标准Hyper-CAVD方案      急性淋巴细胞白血病&B细胞淋巴白血病&CD阴性&Ph染色体阴性         jxlbxbbxb12 是
##########
药品方案13行-分组44:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:盐酸米托蒽醌注射液 注射用盐酸米托蒽醌 盐酸米托蒽醌氯化钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    盐酸米托蒽醌注射液    注射用盐酸米托蒽醌    盐酸米托蒽醌氯化钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 B细胞淋巴白血病 CD阴性 Ph染色体阴性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案13行-分组45:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:阿糖胞苷注射液 注射用阿糖胞苷 注射用盐酸阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用阿糖胞苷    注射用盐酸阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 B细胞淋巴白血病 CD阴性 Ph染色体阴性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


######20171116  挽救方案        急性淋巴细胞白血病&难治性急性淋巴细胞白血病｜复发性急性淋巴细胞白血病         jxlbxbbxb13 是

药品方案14行-分组46:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:巯嘌呤片
    [Documentation]    断言:""
    ${assert}    Create List    巯嘌呤片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 B细胞淋巴白血病 CD阴性 Ph染色体阴性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案14行-分组47:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤 甲氨蝶呤片
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤    甲氨蝶呤片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 B细胞淋巴白血病 CD阴性 Ph染色体阴性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案14行-分组48:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:注射用硫酸长春新碱
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 B细胞淋巴白血病 CD阴性 Ph染色体阴性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案14行-分组49:治疗方案-标准Hyper-CAVD方案:主要条件:急性淋巴细胞白血病&CD20阳性,用药推荐包含:醋酸地塞米松注射液 醋酸泼尼松龙注射液 醋酸泼尼松龙片 醋酸泼尼松片 氢化泼尼松注射液 泼尼松龙片 注射用甲泼尼龙琥珀酸钠 醋酸泼尼松龙注射液
    [Documentation]    断言:""
    ${assert}    Create List    醋酸地塞米松注射液    醋酸泼尼松龙注射液    醋酸泼尼松龙片    醋酸泼尼松片    氢化泼尼松注射液    泼尼松龙片    注射用甲泼尼龙琥珀酸钠    醋酸泼尼松龙注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 B细胞淋巴白血病 CD阴性 Ph染色体阴性 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

######20171116  维持巩固化疗      急性淋巴细胞白血病&化疗后缓解 典型ALL       jxlbxbbxb14 是
######急性淋巴细胞白血病 化疗后缓解
药品方案15行-分组50:治疗方案-维持巩固化疗:主要条件:急性淋巴细胞白血病&CD20阳性+ 伴随条件:典型ALL,用药推荐包含:培门冬酶注射液 注射用左旋门冬酰胺酶
    [Documentation]    断言:""
    ${assert}    Create List    培门冬酶注射液    注射用左旋门冬酰胺酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性淋巴细胞白血病 化疗后缓解 典型ALL 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}

######20171116  止吐药治疗       化疗｜放疗&呕吐            jxlbxbbxb15 是
######化疗 放疗 呕吐
药品方案15行-分组51:治疗方案-止吐药治疗:主要条件:急性淋巴细胞白血病&CD20阳性+ 伴随条件:典型ALL,用药推荐包含:注射用盐酸昂丹司琼 盐酸昂丹司琼氯化钠注射液 盐酸昂丹司琼注射液 盐酸昂丹司琼葡萄糖注射液 盐酸阿扎司琼注射液 注射用盐酸格拉司琼 盐酸格拉司琼注射液 盐酸雷莫司琼注射液 注射用盐酸雷莫司琼 枸橼酸托烷司琼注射液 盐酸托烷司琼葡萄糖注射液 甲磺酸托烷司琼注射液 注射用盐酸托烷司琼 盐酸格拉司琼葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸昂丹司琼    盐酸昂丹司琼氯化钠注射液    盐酸昂丹司琼注射液    盐酸昂丹司琼葡萄糖注射液    盐酸阿扎司琼注射液    注射用盐酸格拉司琼    盐酸格拉司琼注射液    盐酸雷莫司琼注射液    注射用盐酸雷莫司琼    枸橼酸托烷司琼注射液    盐酸托烷司琼葡萄糖注射液    甲磺酸托烷司琼注射液    注射用盐酸托烷司琼    盐酸格拉司琼葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"化疗 放疗 呕吐 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}

药品方案15行-分组52:治疗方案-止吐药治疗:主要条件:急性淋巴细胞白血病&CD20阳性+ 伴随条件:典型ALL,用药推荐包含:盐酸格拉司琼片 盐酸格拉司琼胶囊 盐酸格拉司琼口腔崩解片 盐酸阿扎司琼片 盐酸格拉司琼分散片 盐酸托烷司琼胶囊 盐酸托烷司琼口服溶液 盐酸昂丹司琼口腔崩解片 盐酸昂丹司琼片 盐酸昂丹司琼胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸格拉司琼片    盐酸格拉司琼胶囊    盐酸格拉司琼口腔崩解片    盐酸阿扎司琼片    盐酸格拉司琼分散片    盐酸托烷司琼胶囊    盐酸托烷司琼口服溶液    盐酸昂丹司琼口腔崩解片    盐酸昂丹司琼片    盐酸昂丹司琼胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"化疗 放疗 呕吐 诊断及诊断依据:急性淋巴细胞白血病 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}


















