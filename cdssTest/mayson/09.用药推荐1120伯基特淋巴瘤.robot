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

###### 20171108 水化防治肿瘤溶解综合征     伯基特淋巴瘤｜Burkitt淋巴瘤   化疗前｜化疗后     bjtlbl1 是
#####伯基特淋巴瘤 Burkitt淋巴瘤
#####伯基特淋巴瘤 Burkitt淋巴瘤 化疗前 化疗后
######20171108  bjtlbl1 3889    氯化钠注射液  1   静脉注射    250ml-500ml 1日1次-1日3次   是
######20171108    bjtlbl1 7205    葡萄糖氯化钠注射液   2   静脉注射    250ml-500ml 1日1次-1日3次   是
######20171108    bjtlbl1 7207    葡萄糖注射液  3   静脉注射    250ml-500ml 1日1次-1日3次   是

药品详情2行-分组1:治疗方案-水化防治肿瘤溶解综合征:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤 +伴随条件化疗前｜化疗后,用药推荐包含:氯化钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    氯化钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 化疗前 化疗后 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情2行-分组2:治疗方案-水化防治肿瘤溶解综合征:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤 +伴随条件化疗前｜化疗后,用药推荐包含:葡萄糖氯化钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    葡萄糖氯化钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 化疗前 化疗后 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情2行-分组3:治疗方案-水化防治肿瘤溶解综合征:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤 +伴随条件化疗前｜化疗后,用药推荐包含:葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 化疗前 化疗后 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

###### 20171108 别嘌醇防治肿瘤溶解综合征        伯基特淋巴瘤｜Burkitt淋巴瘤   高尿酸血症｜化疗前｜化疗后       bjtlbl2 是

#####伯基特淋巴瘤 Burkitt淋巴瘤
#####伯基特淋巴瘤 Burkitt淋巴瘤 高尿酸血症 化疗前 化疗后
##### 20171108    bjtlbl2 954 别嘌醇片    4   口服  300mg-600mg 1日1次    是   梅奥
##### 20171108    bjtlbl2 955 别嘌醇缓释片  4   口服  300mg-600mg 1日1次    是   梅奥
##### 20171108    bjtlbl2 956 别嘌醇缓释胶囊 4   口服  300mg-600mg 1日1次    是   梅奥
##### 20171108    bjtlbl2 16432   复方别嘌醇片  4   口服  300mg-600mg 1日1次    是   梅奥

药品详情3行-分组4:治疗方案-控尿酸防治肿瘤溶解综合征:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤+伴随条件:高尿酸血症｜化疗前｜化疗后,用药推荐包含:别嘌醇片 别嘌醇缓释片 别嘌醇缓释胶囊 复方别嘌醇片
    [Documentation]    断言:""
    ${assert}    Create List    别嘌醇片    别嘌醇缓释片    别嘌醇缓释胶囊    复方别嘌醇片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 高尿酸血症 化疗前 化疗后 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}






#####伯基特淋巴瘤｜Burkitt淋巴瘤& 中枢神经系统浸润 中枢神经系统细胞学检查阳性

药品详情4行-分组5:治疗方案-鞘内注射治疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&中枢神经系统浸润｜中枢神经系统细胞学检查阳性,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情4行-分组6:治疗方案-鞘内注射治疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&中枢神经系统浸润｜中枢神经系统细胞学检查阳性,用药推荐包含:环孢素注射液
    [Documentation]    断言:""
    ${assert}    Create List    环孢素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情4行-分组7:治疗方案-鞘内注射治疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&中枢神经系统浸润｜中枢神经系统细胞学检查阳性,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情4行-分组8:治疗方案-鞘内注射治疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&中枢神经系统浸润｜中枢神经系统细胞学检查阳性,用药推荐包含:醋酸地塞米松注射液
    [Documentation]    断言:""
    ${assert}    Create List    醋酸地塞米松注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


###### 20171108 靶向药物治疗      伯基特淋巴瘤｜Burkitt淋巴瘤           bjtlbl4 是
#####伯基特淋巴瘤｜Burkitt淋巴瘤&

药品详情5行-分组9:治疗方案-靶向药物治疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



###### 20171108 化疗主要治疗手段        伯基特淋巴瘤｜Burkitt淋巴瘤           bjtlbl5 是
#####伯基特淋巴瘤｜Burkitt淋巴瘤
#######20171108 bjtlbl5 585 依托泊苷注射液 10  静脉注射    80mg/m2体表面积 1日1次    是
#######20171108    bjtlbl5 11299   注射用依托泊苷 10  静脉注射    80mg/m2体表面积 1日1次    是
#######20171108    bjtlbl5 11417   注射用磷酸依托泊苷   10  静脉注射    80mg/m2体表面积 1日1次    是
#######20171108    bjtlbl5 586 依托泊苷胶囊  10  口服  50mg/m2体表面积-75mg/m2体表面积 1日1次    是   175mg-200mg，连续服用5天，停药3周；50mg-75mg，连续服用21天，停药1周
#######20171108    bjtlbl5 587 依托泊苷软胶囊 10  口服  50mg/m2体表面积-75mg/m2体表面积 1日1次    是   175mg-200mg，连续服用5天，停药3周；50mg-75mg，连续服用21天，停药1周

药品详情6行-分组10:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:依托泊苷注射液 注射用依托泊苷 注射用磷酸依托泊苷 依托泊苷胶囊 依托泊苷软胶囊
    [Documentation]    断言:""
    ${assert}    Create List    依托泊苷注射液    注射用依托泊苷    注射用磷酸依托泊苷    依托泊苷胶囊    依托泊苷软胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情6行-分组11:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:注射用硫酸长春新碱 硫酸长春碱注射液 注射用硫酸长春地辛
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱    硫酸长春碱注射液    注射用硫酸长春地辛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情6行-分组12:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:注射用盐酸柔红霉素 注射用盐酸多柔比星 盐酸多柔比星注射液 注射用盐酸吡柔比星
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸柔红霉素    注射用盐酸多柔比星    盐酸多柔比星注射液    注射用盐酸吡柔比星
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



药品详情6行-分组13:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:注射用环磷酰胺 环磷酰胺片
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺    环磷酰胺片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


##分组14
药品详情6行-分组14:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:醋酸泼尼松龙注射液 氢化泼尼松注射液 泼尼松龙片 醋酸泼尼松龙片 醋酸泼尼松片 地塞米松棕榈酸酯注射 地塞米松磷酸钠注射液 注射用地塞米松磷酸钠 醋酸地塞米松注射液 地塞米松片 醋酸地塞米松片
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙注射液    氢化泼尼松注射液    泼尼松龙片    醋酸泼尼松龙片    醋酸泼尼松片    地塞米松棕榈酸酯注射    地塞米松磷酸钠注射液    注射用地塞米松磷酸钠    醋酸地塞米松注射液    地塞米松片    醋酸地塞米松片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

##分组15
药品详情6行-分组15:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:注射用异环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用异环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

##分组16
药品详情6行-分组16:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤 甲氨蝶呤片
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤    甲氨蝶呤片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

##分组17
药品详情6行-分组17:治疗方案-化疗主要治疗手段:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤,用药推荐包含:巯嘌呤片
    [Documentation]    断言:""
    ${assert}    Create List    巯嘌呤片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


###### 20171108 强化IT-MTX化疗      伯基特淋巴瘤｜Burkitt淋巴瘤&中枢神经系统浸润          bjtlbl6 是
#####伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润

药品详情7行-分组18:治疗方案-强化IT-MTX化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&中枢神经系统浸润,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



###### 20171108 DA-R-EPOCH化疗        伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁           bjtlbl7 是
#####伯基特淋巴瘤 Burkitt淋巴瘤

药品详情8行-分组19:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:注射用盐酸柔红霉素
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸柔红霉素
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情8行-分组20:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情8行-分组21:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情8行-分组22:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:依托泊苷注射液 注射用依托泊苷 注射用磷酸依托泊苷
    [Documentation]    断言:""
    ${assert}    Create List    依托泊苷注射液    注射用依托泊苷    注射用磷酸依托泊苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情8行-分组23:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:注射用硫酸长春新碱 硫酸长春碱注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱    硫酸长春碱注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情8行-分组24:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:盐酸多柔比星注射液 注射用盐酸吡柔比星
    [Documentation]    断言:""
    ${assert}    Create List    盐酸多柔比星注射液    注射用盐酸吡柔比星
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情8行-分组25:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:注射用环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情8行-分组26:治疗方案-DA-R-EPOCH化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁,用药推荐包含:醋酸泼尼松龙注射液 氢化泼尼松注射液
    [Documentation]    断言:""
    ${assert}    Create List    醋酸泼尼松龙注射液    氢化泼尼松注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


######20171108  IT-MTX化疗        伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁&中枢神经系统浸润          bjtlbl8 是
#####伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润
药品详情9行-分组19:治疗方案-IT-MTX化疗:主要条件:伯基特淋巴瘤｜Burkitt淋巴瘤&年龄>=60岁&中枢神经系统浸润,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



###### 20171108 R-CODOX-M化疗     伯基特淋巴瘤｜Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润          bjtlbl9 是

药品详情10行-分组36:治疗方案-R-CODOX-M化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情10行-分组37:治疗方案-R-CODOX-M化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:注射用环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情10行-分组38:治疗方案-R-CODOX-M化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:注射用硫酸长春新碱 硫酸长春碱注射液 注射用硫酸长春地辛
    [Documentation]    断言:""
    ${assert}    Create List    注射用硫酸长春新碱    硫酸长春碱注射液    注射用硫酸长春地辛
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情10行-分组39:治疗方案-R-CODOX-M化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:注射用盐酸柔红霉素 注射用盐酸多柔比星 盐酸多柔比星注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸柔红霉素    注射用盐酸多柔比星    盐酸多柔比星注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

药品详情10行-分组40:治疗方案-R-CODOX-M化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



###### 20171108 R-IVAC化疗        伯基特淋巴瘤｜Burkitt淋巴瘤&年龄［18岁－60岁）&中枢神经系统浸润          bjtlbl10    是

药品详情11行-分组41:治疗方案-R-IVAC化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:利妥昔单抗注射液
    [Documentation]    断言:""
    ${assert}    Create List    利妥昔单抗注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情11行-分组42:治疗方案-R-IVAC化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:依托泊苷注射液 注射用依托泊苷 注射用磷酸依托泊苷
    [Documentation]    断言:""
    ${assert}    Create List    依托泊苷注射液    注射用依托泊苷    注射用磷酸依托泊苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情11行-分组43:治疗方案-R-IVAC化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:注射用异环磷酰胺
    [Documentation]    断言:""
    ${assert}    Create List    注射用异环磷酰胺
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情11行-分组44:治疗方案-R-IVAC化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:阿糖胞苷注射液 注射用盐酸阿糖胞苷 注射用阿糖胞苷
    [Documentation]    断言:""
    ${assert}    Create List    阿糖胞苷注射液    注射用盐酸阿糖胞苷    注射用阿糖胞苷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情11行-分组45:治疗方案-R-IVAC化疗:主要条件:伯基特淋巴瘤 Burkitt淋巴瘤&年龄［18岁-60岁）&中枢神经系统浸润,用药推荐包含:甲氨蝶呤注射液 注射用甲氨蝶呤
    [Documentation]    断言:""
    ${assert}    Create List    甲氨蝶呤注射液    注射用甲氨蝶呤
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"伯基特淋巴瘤 Burkitt淋巴瘤 中枢神经系统浸润 中枢神经系统细胞学检查阳性 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

###### 20171108 大剂量MTX后亚叶酸钙解救       大剂量MTX化疗            bjtlbl11    是

药品详情12行-分组46:治疗方案-大剂量MTX后亚叶酸钙解救:主要条件:大剂量MTX化疗,用药推荐包含:亚叶酸钙注射液 亚叶酸钙氯化钠注射液 注射用亚叶酸钙
    [Documentation]    断言:""
    ${assert}    Create List    亚叶酸钙注射液    亚叶酸钙氯化钠注射液    注射用亚叶酸钙
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"大剂量MTX化疗 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


###### 20171108 补充造血生长因子        化疗后白细胞减少｜中性粒细胞计数绝对值<=1.5×10E9/L｜中性粒细胞绝对值<=1.5×10E9/L            bjtlbl12    是
###### 化疗后白细胞减少 中性粒细胞计数绝对值:1.5×10E9/L 中性粒细胞绝对值:1.5×10E9/L

药品详情13行-分组47:治疗方案-补充造血生长因子:主要条件:化疗后白细胞减少｜中性粒细胞计数绝对值<=1.5×10E9/L｜中性粒细胞绝对值<=1.5×10E9/L,用药推荐包含:注射用重组人粒细胞巨噬细胞刺激因子 注射用重组人粒细胞刺激因子(CHO细胞) 重组人粒细胞刺激因子注射液 聚乙二醇化重组人粒细胞刺激因子注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用重组人粒细胞巨噬细胞刺激因子    注射用重组人粒细胞刺激因子(CHO细胞)    重组人粒细胞刺激因子注射液    聚乙二醇化重组人粒细胞刺激因子注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"化疗后白细胞减少 中性粒细胞计数绝对值:1.5×10E9/L 中性粒细胞绝对值:1.5×10E9/L 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


###### 20171108 止呕药治疗       化疗｜放疗&呕吐            bjtlbl13    是

药品详情14行-分组48:治疗方案-止呕药治疗:主要条件:化疗｜放疗&呕吐,用药推荐包含:注射用盐酸昂丹司琼 盐酸昂丹司琼氯化钠注射液 盐酸昂丹司琼注射液 盐酸昂丹司琼葡萄糖注射液 盐酸阿扎司琼注射液 注射用盐酸格拉司琼 盐酸格拉司琼注射液 盐酸雷莫司琼注射液 注射用盐酸雷莫司琼 枸橼酸托烷司琼注射液 盐酸托烷司琼葡萄糖注射液 甲磺酸托烷司琼注射液 注射用盐酸托烷司琼 盐酸格拉司琼葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸昂丹司琼    盐酸昂丹司琼氯化钠注射液    盐酸昂丹司琼注射液    盐酸昂丹司琼葡萄糖注射液    盐酸阿扎司琼注射液    注射用盐酸格拉司琼    盐酸格拉司琼注射液    盐酸雷莫司琼注射液    注射用盐酸雷莫司琼    枸橼酸托烷司琼注射液    盐酸托烷司琼葡萄糖注射液    甲磺酸托烷司琼注射液    注射用盐酸托烷司琼    盐酸格拉司琼葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"化疗后白细胞减少 中性粒细胞计数绝对值:1.5×10E9/L 中性粒细胞绝对值:1.5×10E9/L 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品详情14行-分组49:治疗方案-止呕药治疗:主要条件:化疗｜放疗&呕吐,用药推荐包含:盐酸格拉司琼片 盐酸格拉司琼胶囊 盐酸格拉司琼口腔崩解片 盐酸阿扎司琼片 盐酸格拉司琼分散片 盐酸托烷司琼胶囊 盐酸托烷司琼口服溶液 盐酸昂丹司琼口腔崩解片 盐酸昂丹司琼片 盐酸昂丹司琼胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸格拉司琼片    盐酸格拉司琼胶囊    盐酸格拉司琼口腔崩解片    盐酸阿扎司琼片    盐酸格拉司琼分散片    盐酸托烷司琼胶囊    盐酸托烷司琼口服溶液    盐酸昂丹司琼口腔崩解片    盐酸昂丹司琼片    盐酸昂丹司琼胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"化疗后白细胞减少 中性粒细胞计数绝对值:1.5×10E9/L 中性粒细胞绝对值:1.5×10E9/L 诊断及诊断依据:伯基特淋巴瘤 Burkitt淋巴瘤 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}











