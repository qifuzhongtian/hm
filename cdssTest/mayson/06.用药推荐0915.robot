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

###### 43L 20170919 静脉溶栓        脑梗死｜短暂性脑缺血发作            237 是
1.1 静脉溶栓:.1:主诉:脑梗死,用药推荐包含:注射用阿替普酶
    [Documentation]    断言:""
    ${assert}    Create List    注射用阿替普酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

###### 43L 20170919 静脉溶栓        脑梗死｜短暂性脑缺血发作            237 是
1.2 静脉溶栓:.1:主诉:脑梗死,用药推荐包含:注射用尿激酶
    [Documentation]    断言:""
    ${assert}    Create List    注射用尿激酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###### 44L 20170919 抗血小板治疗      脑梗死｜短暂性脑缺血发作            240 是
######   20170919 脑梗死 脑梗死         抗血小板治疗  不适合溶栓的患者应在发病后尽早给予抗血小板治疗；同时溶栓治疗者，抗血小板药物应在溶栓24h后开始使用      是
2.1 抗血小板治疗:主诉:脑梗死｜短暂性脑缺血发作,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

2.2 抗血小板治疗:主诉:脑梗死｜短暂性脑缺血发作,用药推荐包含:硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

2.3 抗血小板治疗:主诉:脑梗死｜短暂性脑缺血发作,用药推荐包含:阿司匹林双嘧达莫缓释胶囊 阿司匹林双嘧达莫缓释片
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林双嘧达莫缓释胶囊    阿司匹林双嘧达莫缓释片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###### 45L 20170919 抗凝治疗        脑梗死｜短暂性脑缺血发作            235 是
######  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
3.1 抗凝治疗:主诉:脑梗死｜短暂性脑缺血发作,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

3.2 抗凝治疗:主诉:脑梗死｜短暂性脑缺血发作,用药推荐包含:肝素钙注射液 肝素钠注射液 依诺肝素钠注射液 注射用依诺肝素钠 达肝素钠注射液 磺达肝癸钠注射液 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    肝素钙注射液    肝素钠注射液    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    磺达肝癸钠注射液    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s




##### 46L 20170919 降颅压治疗       脑梗死｜短暂性脑缺血发作｜脑出血            238 是
######  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
4.1 降颅压治疗:主诉:脑梗死｜短暂性脑缺血发作｜脑出血,用药推荐包含:甘露醇注射液 复方甘露醇注射液 甘油果糖氯化钠注射液 甘油果糖注射液 呋塞米注射液 注射用呋塞米
    [Documentation]    断言:""
    ${assert}    Create List    甘露醇注射液    复方甘露醇注射液    甘油果糖氯化钠注射液    甘油果糖注射液    呋塞米注射液    注射用呋塞米
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

4.2 降颅压治疗:主诉:脑梗死｜短暂性脑缺血发作｜脑出血,用药推荐包含:人血白蛋白注射液 注射用七叶皂苷钠
    [Documentation]    断言:""
    ${assert}    Create List    人血白蛋白注射液    注射用七叶皂苷钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

###### 47L 20170919    改善循环及脑保护    降纤治疗    血液高凝状态｜血栓前状态｜高纤维蛋白原血症&脑梗死｜短暂性脑缺血发作      出血｜出血倾向 236 是
######  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
5.1 改善循环及脑保护:降纤治疗:主诉:脑梗死｜短暂性脑缺血发作｜脑出血,用药推荐包含:注射用降纤酶 降纤酶注射液 巴曲酶注射液 注射用白眉蛇毒血凝酶 蛇毒血凝酶注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用降纤酶    降纤酶注射液    巴曲酶注射液    注射用白眉蛇毒血凝酶    蛇毒血凝酶注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"血液高凝状态 血栓前状态 高纤维蛋白原血症&脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###### 48L 20170919 改善循环及脑保护    脑保护治疗   脑梗死｜短暂性脑缺血发作            239 是
######  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
6.1 改善循环及脑保护:脑保护治疗:主诉:脑梗死｜短暂性脑缺血发作,用药推荐包含:依达拉奉注射液 胞二磷胆碱注射液 脑蛋白水解物注射液
    [Documentation]    断言:""
    ${assert}    Create List    依达拉奉注射液    胞二磷胆碱注射液    脑蛋白水解物注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"脑梗死 短暂性脑缺血发作 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###### 49L 20170919 20170919    改善循环及脑保护    改善脑血循环  急性缺血性脑卒中｜脑梗死            263 是
######  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
7.1 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:丁苯酞氯化钠注射液 丁苯酞软胶囊 胰激肽原酶肠溶片 注射用胰激肽原酶
    [Documentation]    断言:""
    ${assert}    Create List    丁苯酞氯化钠注射液    丁苯酞软胶囊    胰激肽原酶肠溶片    注射用胰激肽原酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急性缺血性脑卒中 脑梗死 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#### 50L 20170919 TIA危险因素管理   血压管理和降压治疗   收缩压>=140mmHg｜舒张压>=90mmHg｜高血压&短暂性脑缺血发作           241 是
####  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
####  #######短暂性脑缺血发作 LDL-C>:100mg/dl 主动脉弓动脉粥样硬化斑块 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率70% 主动脉弓动脉粥样硬化斑块 收缩压:140mmHg 舒张压:90mmHg 高血压 HbA1c增高 糖尿病 糖尿病前期

#分组148
7.1 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:注射用盐酸拉贝洛尔 盐酸拉贝洛尔注射液 注射用盐酸乌拉地尔 乌拉地尔氯化钠注射液 乌拉地尔注射液 乌拉地尔葡萄糖注射液 盐酸尼卡地平氯化钠注射液 盐酸尼卡地平注射液 盐酸尼卡地平葡萄糖注射液 注射用盐酸尼卡地平 注射用盐酸索他洛尔 注射用盐酸艾司洛尔 呋塞米注射液 注射用呋塞米 硝酸甘油注射液 注射用硝普钠
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸拉贝洛尔    盐酸拉贝洛尔注射液    注射用盐酸乌拉地尔    乌拉地尔氯化钠注射液    乌拉地尔注射液    乌拉地尔葡萄糖注射液    盐酸尼卡地平氯化钠注射液    盐酸尼卡地平注射液    盐酸尼卡地平葡萄糖注射液    注射用盐酸尼卡地平    注射用盐酸索他洛尔    注射用盐酸艾司洛尔    呋塞米注射液    注射用呋塞米    硝酸甘油注射液    注射用硝普钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



#分组103
7.2 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:乌拉地尔缓释片 乌拉地尔缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    乌拉地尔缓释片    乌拉地尔缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][5]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组147
7.3 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:盐酸尼卡地平缓释片 盐酸尼卡地平片 盐酸尼卡地平缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸尼卡地平缓释片    盐酸尼卡地平片    盐酸尼卡地平缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s




#分组149
7.4 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:培哚普利吲达帕胺片 氯沙坦钾氢氯噻嗪片 依那普利氢氯噻嗪片 厄贝沙坦氢氯噻嗪分散片 厄贝沙坦氢氯噻嗪片 厄贝沙坦氢氯噻嗪胶囊 替米沙坦氢氯噻嗪片 比索洛尔氢氯噻嗪片 缬沙坦氢氯噻嗪片 缬沙坦氢氯噻嗪胶囊 贝那普利氢氯噻嗪片
    [Documentation]    断言:""
    ${assert}    Create List    培哚普利吲达帕胺片    氯沙坦钾氢氯噻嗪片    依那普利氢氯噻嗪片    厄贝沙坦氢氯噻嗪分散片    厄贝沙坦氢氯噻嗪片    厄贝沙坦氢氯噻嗪胶囊    替米沙坦氢氯噻嗪片    比索洛尔氢氯噻嗪片    缬沙坦氢氯噻嗪片    缬沙坦氢氯噻嗪胶囊    贝那普利氢氯噻嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组150
7.5 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:盐酸拉贝洛尔片 酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔片 盐酸阿罗洛尔片 盐酸索他洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸拉贝洛尔片    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔片    盐酸阿罗洛尔片    盐酸索他洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组151
7.6 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:吲达帕胺片 吲达帕胺缓释片 吲达帕胺缓释胶囊 吲达帕胺胶囊
    [Documentation]    断言:""
    ${assert}    Create List    吲达帕胺片    吲达帕胺缓释片    吲达帕胺缓释胶囊    吲达帕胺胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组152
7.7 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][7]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组153
7.8 改善循环及脑保护:改善脑血循环:主诉:急性缺血性脑卒中｜脑梗死,用药推荐包含:氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"收缩压:140mmHg 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][7]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



### 51L 20170919  抗栓治疗        短暂性脑缺血发作            242 是
###  20170919    脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是


#分组104
8.1 抗栓治疗::主诉:短暂性脑缺血发作,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 心源性栓塞性短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组105
8.2 抗栓治疗::主诉:短暂性脑缺血发作,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 心源性栓塞性短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组106
8.3 抗栓治疗::主诉:短暂性脑缺血发作,用药推荐包含:硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 心源性栓塞性短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组107
8.4 抗栓治疗::主诉:短暂性脑缺血发作,用药推荐包含:阿司匹林双嘧达莫缓释胶囊 阿司匹林双嘧达莫缓释片
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林双嘧达莫缓释胶囊    阿司匹林双嘧达莫缓释片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 心源性栓塞性短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

## 52L 20170919  抗栓治疗        短暂性脑缺血发作            242 是
##  20170919  口服抗凝治疗      短暂性脑缺血发作            243 是

9.1 口服抗凝治疗::主诉:短暂性脑缺血发作,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 短暂性脑缺血发作 房颤 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



### 53L 20170919  20170919 TIA危险因素管理   血脂管理和调脂治疗   短暂性脑缺血发作&LDL-C>=100mg/dl｜主动脉弓动脉粥样硬化斑块           244 是
###  20170919
#分组108
10.1 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片
    [Documentation]    断言:""
    ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组142
10.2 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:普罗布考片
    [Documentation]    断言:""
    ${assert}    Create List    普罗布考片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组143
10.3 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:非诺贝特片 非诺贝特胶囊 非诺贝特胶囊(Ⅱ) 非诺贝特咀嚼片 非诺贝特分散片 非诺贝特片(Ⅲ) 非诺贝特缓释胶囊 吉非罗齐胶囊 吉非罗齐片 苯扎贝特片 苯扎贝特分散片 苯扎贝特胶囊
    [Documentation]    断言:""
    ${assert}    Create List    非诺贝特片    非诺贝特胶囊    非诺贝特胶囊(Ⅱ)    非诺贝特咀嚼片    非诺贝特分散片    非诺贝特片(Ⅲ)    非诺贝特缓释胶囊    吉非罗齐胶囊    吉非罗齐片    苯扎贝特片    苯扎贝特分散片    苯扎贝特胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组144
10.4 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:依折麦布片 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    依折麦布片    依折麦布辛伐他汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s




## 54L  20170919  TIA危险因素管理   血脂管理和调脂治疗   颅内大动脉粥样硬化性狭窄｜颈动脉狭窄率70%-99%｜主动脉弓动脉粥样硬化斑块&短暂性脑缺血发作            244 是
###颅内大动脉粥样硬化性狭窄｜颈动脉狭窄率70%-99%｜主动脉弓动脉粥样硬化斑块&短暂性脑缺血发作
###颅内大动脉粥样硬化性狭窄 颈动脉狭窄率:70% 主动脉弓动脉粥样硬化斑块 短暂性脑缺血发作


分组108
11.1 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片
    [Documentation]    断言:""
    ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率:70% 主动脉弓动脉粥样硬化斑块 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组142
11.2 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:普罗布考片
    [Documentation]    断言:""
    ${assert}    Create List    普罗布考片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率:70% 主动脉弓动脉粥样硬化斑块 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组143
11.3 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:非诺贝特片 非诺贝特胶囊 非诺贝特胶囊(Ⅱ) 非诺贝特咀嚼片 非诺贝特分散片 非诺贝特片(Ⅲ) 非诺贝特缓释胶囊 吉非罗齐胶囊 吉非罗齐片 苯扎贝特片 苯扎贝特分散片 苯扎贝特胶囊
    [Documentation]    断言:""
    ${assert}    Create List    非诺贝特片    非诺贝特胶囊    非诺贝特胶囊(Ⅱ)    非诺贝特咀嚼片    非诺贝特分散片    非诺贝特片(Ⅲ)    非诺贝特缓释胶囊    吉非罗齐胶囊    吉非罗齐片    苯扎贝特片    苯扎贝特分散片    苯扎贝特胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率:70% 主动脉弓动脉粥样硬化斑块 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组144
11.4 TIA危险因素管理:血脂管理和调脂治疗:主诉:短暂性脑缺血发作 LDL-C:100mg/dl 主动脉弓动脉粥样硬化斑块,用药推荐包含:依折麦布片 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    依折麦布片    依折麦布辛伐他汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率:70% 主动脉弓动脉粥样硬化斑块 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s





# 55L  20170919   TIA危险因素管理   血糖管理和降糖治疗   HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作          245 是
##颅内大动脉粥样硬化性狭窄｜颈动脉狭窄率70%-99%｜主动脉弓动脉粥样硬化斑块&短暂性脑缺血发作
##HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作
##HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作

#分组109
12.1 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:胰岛素注射液 低精蛋白锌胰岛素注射液 精蛋白锌重组人胰岛素注射液 精蛋白锌胰岛素注射液 精蛋白生物合成人胰岛素注射液 精蛋白重组人胰岛素注射液 重组赖脯胰岛素注射液 赖脯胰岛素注射液 门冬胰岛素注射液 重组人胰岛素注射液 生物合成人胰岛素注射液 谷赖胰岛素注射液
    [Documentation]    断言:""
    ${assert}    Create List    胰岛素注射液    低精蛋白锌胰岛素注射液    精蛋白锌重组人胰岛素注射液    精蛋白锌胰岛素注射液    精蛋白生物合成人胰岛素注射液    精蛋白重组人胰岛素注射液    重组赖脯胰岛素注射液    赖脯胰岛素注射液    门冬胰岛素注射液    重组人胰岛素注射液    生物合成人胰岛素注射液    谷赖胰岛素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][7]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组110
12.2 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:盐酸二甲双胍片 盐酸二甲双胍肠溶片 盐酸二甲双胍肠溶胶囊 盐酸二甲双胍胶囊 盐酸二甲双胍缓释片 盐酸二甲双胍缓释胶囊 盐酸二甲双胍缓释片(Ⅱ)
    [Documentation]    断言:""
    ${assert}    Create List    盐酸二甲双胍片    盐酸二甲双胍肠溶片    盐酸二甲双胍肠溶胶囊    盐酸二甲双胍胶囊    盐酸二甲双胍缓释片    盐酸二甲双胍缓释胶囊    盐酸二甲双胍缓释片(Ⅱ)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][8]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组111
12.3 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:瑞格列奈分散片 瑞格列奈片 那格列奈胶囊 那格列奈分散片 那格列奈片 米格列奈钙片 米格列醇片
    [Documentation]    断言:""
    ${assert}    Create List    瑞格列奈分散片    瑞格列奈片    那格列奈胶囊    那格列奈分散片    那格列奈片    米格列奈钙片    米格列醇片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][9]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组112
12.4 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:格列齐特分散片 格列齐特片 格列齐特片(Ⅱ) 格列齐特片(II) 格列齐特缓释片 格列齐特缓释胶囊 格列美脲片 格列美脲胶囊 格列吡嗪分散片 格列吡嗪胶囊 格列吡嗪片 格列吡嗪控释片 格列吡嗪缓释片 格列吡嗪缓释胶囊 格列喹酮分散片 格列喹酮片
    [Documentation]    断言:""
    ${assert}    Create List    格列齐特分散片    格列齐特片    格列齐特片(Ⅱ)    格列齐特片(II)    格列齐特缓释片    格列齐特缓释胶囊    格列美脲片    格列美脲胶囊    格列吡嗪分散片    格列吡嗪胶囊    格列吡嗪片    格列吡嗪控释片    格列吡嗪缓释片    格列吡嗪缓释胶囊    格列喹酮分散片    格列喹酮片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组113
12.5 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:利格列汀片 沙格列汀片 磷酸西格列汀片 维格列汀片 苯甲酸阿格列汀片
    [Documentation]    断言:""
    ${assert}    Create List    利格列汀片    沙格列汀片    磷酸西格列汀片    维格列汀片    苯甲酸阿格列汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组114
12.6 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:艾塞那肽注射液 利拉鲁肽注射液
    [Documentation]    断言:""
    ${assert}    Create List    艾塞那肽注射液    利拉鲁肽注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组115
12.7 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:伏格列波糖分散片 伏格列波糖咀嚼片 伏格列波糖片 伏格列波糖胶囊 阿卡波糖片 阿卡波糖胶囊
    [Documentation]    断言:""
    ${assert}    Create List    伏格列波糖分散片    伏格列波糖咀嚼片    伏格列波糖片    伏格列波糖胶囊    阿卡波糖片    阿卡波糖胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][5]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组116
12.8 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:马来酸罗格列酮片 盐酸罗格列酮片 盐酸罗格列酮胶囊 酒石酸罗格列酮分散片 盐酸吡格列酮分散片 盐酸吡格列酮口腔崩解片 盐酸吡格列酮片 盐酸吡格列酮胶囊
    [Documentation]    断言:""
    ${assert}    Create List    马来酸罗格列酮片    盐酸罗格列酮片    盐酸罗格列酮胶囊    酒石酸罗格列酮分散片    盐酸吡格列酮分散片    盐酸吡格列酮口腔崩解片    盐酸吡格列酮片    盐酸吡格列酮胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][6]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组145
12.9 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:地特胰岛素注射液 甘精胰岛素注射液 重组甘精胰岛素注射液
    [Documentation]    断言:""
    ${assert}    Create List    地特胰岛素注射液    甘精胰岛素注射液    重组甘精胰岛素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组146
12.10 TIA危险因素管理:血糖管理和降糖治疗:主诉:HbA1c增高｜糖尿病｜糖尿病前期&短暂性脑缺血发作,用药推荐包含:门冬胰岛素30注射液 门冬胰岛素50注射液 门冬胰岛素30注射液 精蛋白锌重组赖脯胰岛素混合注射液(25R) 精蛋白锌重组赖脯胰岛素混合注射液(50R)
    [Documentation]    断言:""
    ${assert}    Create List    门冬胰岛素30注射液    门冬胰岛素50注射液    门冬胰岛素30注射液    精蛋白锌重组赖脯胰岛素混合注射液(25R)    精蛋白锌重组赖脯胰岛素混合注射液(50R)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" HbA1c增高 糖尿病 糖尿病前期 短暂性脑缺血发作 诊断及诊断依据:短暂性脑缺血发作 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



# 56L  20170919   脑出血血糖管理     脑出血         246 是
#分组
13.1 脑出血血糖管理::主诉:脑出血,用药推荐包含:胰岛素注射液
    [Documentation]    断言:""
    ${assert}    Create List    胰岛素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


##### 57L   20170919  脑出血血压管理     脑出血         269 是
#####分组150
14.1 脑出血血压管理::主诉:脑出血,用药推荐包含:乌拉地尔缓释片 乌拉地尔缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    乌拉地尔缓释片    乌拉地尔缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][5]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组162
14.2 脑出血血压管理::主诉:脑出血,用药推荐包含:注射用盐酸拉贝洛尔 盐酸拉贝洛尔注射液 注射用盐酸乌拉地尔 乌拉地尔氯化钠注射液 乌拉地尔注射液 乌拉地尔葡萄糖注射液 盐酸尼卡地平氯化钠注射液 盐酸尼卡地平注射液 盐酸尼卡地平葡萄糖注射液 注射用盐酸尼卡地平 注射用盐酸索他洛尔 注射用盐酸艾司洛尔 呋塞米注射液 注射用呋塞米 硝酸甘油注射液 注射用硝普钠
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸拉贝洛尔    盐酸拉贝洛尔注射液    注射用盐酸乌拉地尔    乌拉地尔氯化钠注射液    乌拉地尔注射液    乌拉地尔葡萄糖注射液    盐酸尼卡地平氯化钠注射液    盐酸尼卡地平注射液    盐酸尼卡地平葡萄糖注射液    注射用盐酸尼卡地平    注射用盐酸索他洛尔    注射用盐酸艾司洛尔    呋塞米注射液    注射用呋塞米    硝酸甘油注射液    注射用硝普钠
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组163
14.3 脑出血血压管理::主诉:脑出血,用药推荐包含:盐酸尼卡地平缓释片 盐酸尼卡地平片 盐酸尼卡地平缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸尼卡地平缓释片    盐酸尼卡地平片    盐酸尼卡地平缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组164
14.4 脑出血血压管理::主诉:脑出血,用药推荐包含:盐酸拉贝洛尔片 酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔片 盐酸阿罗洛尔片 盐酸索他洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸拉贝洛尔片    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔片    盐酸阿罗洛尔片    盐酸索他洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

#分组1
14.5 脑出血血压管理::主诉:脑出血,用药推荐包含:马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利分散片 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片
    [Documentation]    断言:""
    ${assert}    Create List    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利分散片    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



#分组166
14.6 脑出血血糖管理::主诉:脑出血,用药推荐包含:氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组167
14.7 脑出血血糖管理::主诉:脑出血,用药推荐包含:吲达帕胺片 吲达帕胺缓释片 吲达帕胺缓释胶囊 吲达帕胺胶囊
    [Documentation]    断言:""
    ${assert}    Create List    吲达帕胺片    吲达帕胺缓释片    吲达帕胺缓释胶囊    吲达帕胺胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][6]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


#分组168
14.8 脑出血血糖管理::主诉:脑出血,用药推荐包含:培哚普利吲达帕胺片 氯沙坦钾氢氯噻嗪片 依那普利氢氯噻嗪片 厄贝沙坦氢氯噻嗪分散片 厄贝沙坦氢氯噻嗪片 厄贝沙坦氢氯噻嗪胶囊 替米沙坦氢氯噻嗪片 比索洛尔氢氯噻嗪片 缬沙坦氢氯噻嗪片 缬沙坦氢氯噻嗪胶囊 贝那普利氢氯噻嗪片
    [Documentation]    断言:""
    ${assert}    Create List    培哚普利吲达帕胺片    氯沙坦钾氢氯噻嗪片    依那普利氢氯噻嗪片    厄贝沙坦氢氯噻嗪分散片    厄贝沙坦氢氯噻嗪片    厄贝沙坦氢氯噻嗪胶囊    替米沙坦氢氯噻嗪片    比索洛尔氢氯噻嗪片    缬沙坦氢氯噻嗪片    缬沙坦氢氯噻嗪胶囊    贝那普利氢氯噻嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][7]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


### 58L  20170919 止血治疗        脑出血         247 是
###分组150
15.1 止血治疗::主诉:脑出血,用药推荐包含:维生素K1注射液 硫酸鱼精蛋白注射液 氨基己酸注射液 氨基己酸氯化钠注射液 氨甲苯酸注射液 注射用氨甲苯酸 氨甲苯酸氯化钠注射液 氨甲苯酸葡萄糖注射液 巴曲酶注射液 凝血酶冻干粉 人凝血酶原复合物 冻干人凝血酶 注射用白眉蛇毒血凝酶 注射用血凝酶 蛇毒血凝酶注射液 注射用矛头蝮蛇血凝酶 注射用尖吻蝮蛇血凝酶
    [Documentation]    断言:""
    ${assert}    Create List    维生素K1注射液    硫酸鱼精蛋白注射液    氨基己酸注射液    氨基己酸氯化钠注射液    氨甲苯酸注射液    注射用氨甲苯酸    氨甲苯酸氯化钠注射液    氨甲苯酸葡萄糖注射液    巴曲酶注射液    凝血酶冻干粉    人凝血酶原复合物    冻干人凝血酶    注射用白眉蛇毒血凝酶    注射用血凝酶    蛇毒血凝酶注射液    注射用矛头蝮蛇血凝酶    注射用尖吻蝮蛇血凝酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][5]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


### 59L 20170919    脑出血并发症治疗    抗血管痉挛治疗 脑出血&蛛网膜下腔出血         248 是
###分组
16.1 脑出血并发症治疗:抗血管痉挛治疗:主诉:脑出血&蛛网膜下腔出血,用药推荐包含:尼莫地平注射液 注射用尼莫地平 尼莫地平软胶囊 尼莫地平缓释片 尼莫地平缓释胶囊 尼莫地平分散片 尼莫地平片
    [Documentation]    断言:""
    ${assert}    Create List    尼莫地平注射液    注射用尼莫地平    尼莫地平软胶囊    尼莫地平缓释片    尼莫地平缓释胶囊    尼莫地平分散片    尼莫地平片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 蛛网膜下腔出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


## 60L 20170919    脑出血并发症治疗    预防应激性溃疡 脑出血         249 是
###分组
17.1 脑出血并发症治疗:预防应激性溃疡:主诉:脑出血&蛛网膜下腔出血,用药推荐包含:注射用兰索拉唑 注射用奥美拉唑钠 注射用艾司奥美拉唑钠 注射用奥美拉唑钠(静脉滴注) 注射用泮托拉唑钠 注射用埃索美拉唑钠 埃索美拉唑肠溶胶囊 埃索美拉唑镁肠溶片 奥美拉唑肠溶片 奥美拉唑镁肠溶片 奥美拉唑钠肠溶片 雷贝拉唑钠肠溶片 雷贝拉唑钠肠溶胶囊 兰索拉唑口崩片 兰索拉唑片 兰索拉唑肠溶胶囊 泮托拉唑肠溶片 泮托拉唑钠肠溶片 泮托拉唑钠肠溶胶囊
    [Documentation]    断言:""
    ${assert}    Create List    注射用兰索拉唑    注射用奥美拉唑钠    注射用艾司奥美拉唑钠    注射用奥美拉唑钠(静脉滴注)    注射用泮托拉唑钠    注射用埃索美拉唑钠    埃索美拉唑肠溶胶囊    埃索美拉唑镁肠溶片    奥美拉唑肠溶片    奥美拉唑镁肠溶片    奥美拉唑钠肠溶片    雷贝拉唑钠肠溶片    雷贝拉唑钠肠溶胶囊    兰索拉唑口崩片    兰索拉唑片    兰索拉唑肠溶胶囊    泮托拉唑肠溶片    泮托拉唑钠肠溶片    泮托拉唑钠肠溶胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


## 61L 20170919 脑出血并发症治疗    抗癫痫药物   脑出血&痫性发作｜幕上血肿清除术后           250 是
## 脑出血 痫性发作 幕上血肿清除术后
###分组
18.1 脑出血并发症治疗:抗癫痫药物:主诉:脑出血&蛛网膜下腔出血,用药推荐包含:苯妥英钠片 注射用苯巴比妥钠 苯巴比妥钠注射液 苯巴比妥片 卡马西平片 卡马西平缓释胶囊 卡马西平胶囊 卡马西平缓释片 地西泮注射液 地西泮片 注射用丙戊酸钠 丙戊酸钠片 丙戊酸钠缓释片 丙戊酸钠口服溶液
    [Documentation]    断言:""
    ${assert}    Create List    苯妥英钠片    注射用苯巴比妥钠    苯巴比妥钠注射液    苯巴比妥片    卡马西平片    卡马西平缓释胶囊    卡马西平胶囊    卡马西平缓释片    地西泮注射液    地西泮片    注射用丙戊酸钠    丙戊酸钠片    丙戊酸钠缓释片    丙戊酸钠口服溶液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 脑出血 痫性发作 幕上血肿清除术后 诊断及诊断依据:脑出血 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


### 62L 20170919    非麦角类DR激动剂       帕金森｜早发型帕金森｜晚发型帕金森           251 是
### 帕金森 早发型帕金森 晚发型帕金森
###分组
19.1 非麦角类DR激动剂::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:吡贝地尔缓释片 盐酸普拉克索片 盐酸普拉克索缓释片 盐酸罗匹尼罗片 盐酸罗匹尼罗缓释片
    [Documentation]    断言:""
    ${assert}    Create List    吡贝地尔缓释片    盐酸普拉克索片    盐酸普拉克索缓释片    盐酸罗匹尼罗片    盐酸罗匹尼罗缓释片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 早发型帕金森 晚发型帕金森 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


## 63L 20170919    MAO-B抑制剂        帕金森｜早发型帕金森｜晚发型帕金森           252 是
## 帕金森 早发型帕金森 晚发型帕金森
##分组
20.1 非麦角类DR激动剂::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:盐酸司来吉兰片 盐酸司来吉兰胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸司来吉兰片    盐酸司来吉兰胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 早发型帕金森 晚发型帕金森 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


### 64L 20170919    金刚烷胺        帕金森｜早发型帕金森｜晚发型帕金森           253 是
### 帕金森 早发型帕金森 晚发型帕金森
###分组
21.1 金刚烷胺::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:盐酸金刚烷胺片 盐酸金刚烷胺胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸金刚烷胺片    盐酸金刚烷胺胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 早发型帕金森 晚发型帕金森 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



### L 20170919    复方左旋多巴      帕金森｜早发型帕金森｜晚发型帕金森           254 是
### 帕金森 早发型帕金森 晚发型帕金森
###分组
22.1 复方左旋多巴::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:卡左双多巴缓释片 卡左双多巴控释片 复方卡比多巴片 多巴丝肼片 多巴丝肼胶囊 多巴丝肼缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    卡左双多巴缓释片    卡左双多巴控释片    复方卡比多巴片    多巴丝肼片    多巴丝肼胶囊    多巴丝肼缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 早发型帕金森 晚发型帕金森 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


### 66L 20170919    20170919    复方左旋多巴＋COMT抑制剂      帕金森｜早发型帕金森｜晚发型帕金森           255 是
### 帕金森 早发型帕金森 晚发型帕金森
###分组
23.1 复方左旋多巴＋COMT抑制剂::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:恩他卡朋双多巴片 恩他卡朋双多巴片(Ⅱ) 恩他卡朋双多巴片(Ⅲ) 恩他卡朋双多巴片(IV)
    [Documentation]    断言:""
    ${assert}    Create List    恩他卡朋双多巴片    恩他卡朋双多巴片(Ⅱ)    恩他卡朋双多巴片(Ⅲ)    恩他卡朋双多巴片(IV)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 早发型帕金森 晚发型帕金森 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


## 67L 20170919    抗胆碱能药       帕金森｜早发型帕金森｜晚发型帕金森           256 是
## 帕金森 早发型帕金森 晚发型帕金森
## 帕金森 震颤明显
###分组257
24.1 抗胆碱能药::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:盐酸苯海索片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸苯海索片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 震颤明显 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



### 68L 20170919    COMT抑制剂     帕金森｜早发型帕金森｜晚发型帕金森           257 是
### 帕金森 早发型帕金森 晚发型帕金森
### 帕金森 震颤明显
###分组257
25.1 抗胆碱能药::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:托卡朋片 恩他卡朋片
    [Documentation]    断言:""
    ${assert}    Create List    托卡朋片    恩他卡朋片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 异动症 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



## 68L 20170919    非典型神经安定剂        帕金森｜早发型帕金森｜晚发型帕金森           258 是
## 帕金森 早发型帕金森 晚发型帕金森
## 帕金森 震颤明显
###分组257
25.1 COMT抑制剂::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:氯氮平片 氯氮平分散片 氯氮平口腔崩解片
    [Documentation]    断言:""
    ${assert}    Create List    氯氮平片    氯氮平分散片    氯氮平口腔崩解片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 异动症 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][5]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



# 69L 20170919    非典型神经安定剂        帕金森｜早发型帕金森｜晚发型帕金森           258 是
# 帕金森 早发型帕金森 晚发型帕金森
# 帕金森 震颤明显
#分组257
25.1 非典型神经安定剂::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:氯氮平片 氯氮平分散片 氯氮平口腔崩解片
    [Documentation]    断言:""
    ${assert}    Create List    氯氮平片    氯氮平分散片    氯氮平口腔崩解片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 异动症 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][5]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



##70l 20170919    精神障碍用药  焦虑／抑郁   帕金森｜早发型帕金森｜晚发型帕金森&精神障碍｜焦虑｜抑郁            259 是
## 帕金森 早发型帕金森 晚发型帕金森
## 帕金森 震颤明显
###分组257
26.1 精神障碍用药:焦虑／抑郁:主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:盐酸氟西汀分散片 盐酸氟西汀片 盐酸氟西汀肠溶片 盐酸氟西汀胶囊 盐酸帕罗西汀片 盐酸帕罗西汀肠溶缓释片 盐酸舍曲林片 盐酸舍曲林分散片 盐酸舍曲林胶囊 马来酸氟伏沙明片 盐酸文拉法辛缓释片 盐酸文拉法辛片 盐酸文拉法辛缓释胶囊 盐酸文拉法辛胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸氟西汀分散片    盐酸氟西汀片    盐酸氟西汀肠溶片    盐酸氟西汀胶囊    盐酸帕罗西汀片    盐酸帕罗西汀肠溶缓释片    盐酸舍曲林片    盐酸舍曲林分散片    盐酸舍曲林胶囊    马来酸氟伏沙明片    盐酸文拉法辛缓释片    盐酸文拉法辛片    盐酸文拉法辛缓释胶囊    盐酸文拉法辛胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 精神障碍 抑郁 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



###71l 20170919   精神障碍用药  幻觉／妄想   帕金森｜早发型帕金森｜晚发型帕金森&精神障碍｜幻觉｜妄想            260 是
### 帕金森 早发型帕金森 晚发型帕金森
### 帕金森 震颤明显
###分组
27.1 精神障碍用药:幻觉／妄想:主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:氯氮平片 氯氮平分散片 氯氮平口腔崩解片
    [Documentation]    断言:""
    ${assert}    Create List    氯氮平片    氯氮平分散片    氯氮平口腔崩解片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 精神障碍 幻觉 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



###72l 20170919    精神障碍用药  认知障碍或痴呆 帕金森｜早发型帕金森｜晚发型帕金森&精神障碍｜认知障碍｜痴呆          261 是
###分组
28.1 精神障碍用药:认知障碍或痴呆:主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:氯氮平片 氯氮平分散片 氯氮平口腔崩解片
    [Documentation]    断言:""
    ${assert}    Create List    氯氮平片    氯氮平分散片    氯氮平口腔崩解片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 精神障碍 认知障碍 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###73l 20170919 精神障碍用药  易激惹 帕金森｜早发型帕金森｜晚发型帕金森&精神障碍｜易激惹          262 是
###分组
29.1 精神障碍用药:易激惹:主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:劳拉西泮片 地西泮片 复方地西泮片
    [Documentation]    断言:""
    ${assert}    Create List    劳拉西泮片    地西泮片    复方地西泮片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 帕金森 精神障碍 易激惹 诊断及诊断依据:帕金森 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][3]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



###74l 20170919 改善脑血循环      急性缺血性脑卒中            263 是
###分组

###74l 20170919   改善脑血循环      急性缺血性脑卒中            263 是  应为改善循环及闹保护
###分组
30.1 改善脑血循环::主诉:帕金森｜早发型帕金森｜晚发型帕金森,用药推荐包含:丁苯酞氯化钠注射液 丁苯酞软胶囊 胰激肽原酶肠溶片 注射用胰激肽原酶
    [Documentation]    断言:""
    ${assert}    Create List    丁苯酞氯化钠注射液    丁苯酞软胶囊    胰激肽原酶肠溶片    注射用胰激肽原酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 急性缺血性脑卒中 诊断及诊断依据:脑梗死 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###75l 20170919 肠内／肠外营养支持                   264 是
###分组136
31.1 肠内／肠外营养支持::主诉:营养风险筛查2002(NRS):3分,用药推荐包含:整蛋白型肠内营养剂(粉剂) 氨基酸型肠内营养粉 短肽型肠内营养剂 肠内营养乳剂(TP) 肠内营养乳剂(TP-HE) 肠内营养乳剂(TPF) 肠内营养乳剂(TPF-T) 肠内营养混悬液(SP) 肠内营养混悬液(TP) 肠内营养混悬液(TP-MCT) 肠内营养混悬液(TPF) 肠内营养混悬液(TPF-D) 肠内营养混悬液(TPSPA) 肠内营养混悬液Ⅱ(TP) 肠内营养混悬液(TPF-DM) 肠内营养粉剂(TP) 肠内营养乳剂(TPF-D) 肠内营养混悬液(TPF-FOS) 肠内营养粉剂(AA-PA) 肠内营养粉剂(AA) 肠内营养粉(AA) 肠内营养粉剂( TP) 肠内营养粉剂( AA) 肠外营养注射液(25)
    [Documentation]    断言:""
    ${assert}    Create List    整蛋白型肠内营养剂(粉剂)    氨基酸型肠内营养粉    短肽型肠内营养剂    肠内营养乳剂(TP)    肠内营养乳剂(TP-HE)    肠内营养乳剂(TPF)    肠内营养乳剂(TPF-T)    肠内营养混悬液(SP)    肠内营养混悬液(TP)    肠内营养混悬液(TP-MCT)    肠内营养混悬液(TPF)    肠内营养混悬液(TPF-D)    肠内营养混悬液(TPSPA)    肠内营养混悬液Ⅱ(TP)    肠内营养混悬液(TPF-DM)    肠内营养粉剂(TP)    肠内营养乳剂(TPF-D)    肠内营养混悬液(TPF-FOS)    肠内营养粉剂(AA-PA)    肠内营养粉剂(AA)    肠内营养粉(AA)    肠内营养粉剂( TP)    肠内营养粉剂( AA)    肠外营养注射液(25)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 营养风险筛查2002(NRS):3分 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

###分组137
31.2 肠内／肠外营养支持::主诉:营养风险筛查2002(NRS):3分,用药推荐包含:脂肪乳注射液(C14～24) 脂肪乳注射液(C14-24) 脂肪乳注射液 脂肪乳注射液[C14-24] 多种油脂肪乳注射液(C6~24) 中/长链脂肪乳注射液(C8～24Ve) 中/长链脂肪乳注射液(C8~24) 中/长链脂肪乳注射液(C8-24Ve) 中/长链脂肪乳注射液(C8-24) ω-3 鱼油中/长链脂肪乳注射液 长链脂肪乳注射液(OO) ω-3鱼油脂肪乳注射液 中/长链脂肪乳注射液(C6～24) 中/长链脂肪乳注射液(C8～24) 结构脂肪乳注射液(C6～24) 脂肪乳氨基酸(17)葡萄糖(11%)注射液 脂肪乳氨基酸(17)葡萄糖(19%)注射液 脂肪乳氨基酸(18)注射液 脂肪乳(10%)/氨基酸(15)/葡萄糖(20%)注射液 脂肪乳(20%)/氨基酸(15)/葡萄糖(30%)注射液 中长链脂肪乳/氨基酸(16)/葡萄糖(16％)注射液
    [Documentation]    断言:""
    ${assert}    Create List    脂肪乳注射液(C14～24)    脂肪乳注射液(C14-24)    脂肪乳注射液    脂肪乳注射液[C14-24]    多种油脂肪乳注射液(C6~24)    中/长链脂肪乳注射液(C8～24Ve)    中/长链脂肪乳注射液(C8~24)    中/长链脂肪乳注射液(C8-24Ve)    中/长链脂肪乳注射液(C8-24)    ω-3 鱼油中/长链脂肪乳注射液    长链脂肪乳注射液(OO)    ω-3鱼油脂肪乳注射液    中/长链脂肪乳注射液(C6～24)    中/长链脂肪乳注射液(C8～24)    结构脂肪乳注射液(C6～24)    脂肪乳氨基酸(17)葡萄糖(11%)注射液    脂肪乳氨基酸(17)葡萄糖(19%)注射液    脂肪乳氨基酸(18)注射液    脂肪乳(10%)/氨基酸(15)/葡萄糖(20%)注射液    脂肪乳(20%)/氨基酸(15)/葡萄糖(30%)注射液    中长链脂肪乳/氨基酸(16)/葡萄糖(16％)注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 营养风险筛查2002(NRS):3分 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###分组138
31.3 肠内／肠外营养支持::主诉:营养风险筛查2002(NRS):3分,用药推荐包含:复方氨基酸注射液 复方氨基酸(15)双肽(2)注射液 复方氨基酸注射液 (15AA) 复方氨基酸注射液(17AA) 复方氨基酸注射液 (18AA) 复方氨基酸注射液 (18AA-Ⅱ) 复方氨基酸注射液(l8AA-Ⅲ) 复方氨基酸注射液(14AA) 复方氨基酸注射液(18AA-V) 复方氨基酸注射液(15-HBC) 复方氨基酸注射液(18AA-Ⅳ) 复方氨基酸注射液(18AA-Ⅴ) 复方氨基酸注射液(18AA-Ⅶ) 复方氨基酸注射液(20AA) 复方氨基酸注射液(3AA) 复方氨基酸注射液(9AA) 复方氨基酸注射液(17AA-I) 复方氨基酸注射液(18AA-I) 复方氨基酸注射液(6AA) 复方氨基酸注射液(15AA) 复方氨基酸注射液(18AA-IV) 复方氨基酸注射液(18AA-Ⅸ) 复方氨基酸注射液(18AA)
    [Documentation]    断言:""
    ${assert}    Create List    复方氨基酸注射液    复方氨基酸(15)双肽(2)注射液    复方氨基酸注射液 (15AA)    复方氨基酸注射液(17AA)    复方氨基酸注射液 (18AA)    复方氨基酸注射液 (18AA-Ⅱ)    复方氨基酸注射液(l8AA-Ⅲ)    复方氨基酸注射液(14AA)    复方氨基酸注射液(18AA-V)    复方氨基酸注射液(15-HBC)    复方氨基酸注射液(18AA-Ⅳ)    复方氨基酸注射液(18AA-Ⅴ)    复方氨基酸注射液(18AA-Ⅶ)    复方氨基酸注射液(20AA)    复方氨基酸注射液(3AA)    复方氨基酸注射液(9AA)    复方氨基酸注射液(17AA-I)    复方氨基酸注射液(18AA-I)    复方氨基酸注射液(6AA)    复方氨基酸注射液(15AA)    复方氨基酸注射液(18AA-IV)    复方氨基酸注射液(18AA-Ⅸ)    复方氨基酸注射液(18AA)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 营养风险筛查2002(NRS):3分 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###分组139
31.4 肠内／肠外营养支持::营养风险筛查2002(NRS):3分,用药推荐包含:复方维生素注射液(4) 注射用12种复合维生素 注射用水溶性维生素 注射用脂溶性维生素(II) 注射用脂溶性维生素(Ⅰ) 注射用脂溶性维生素(Ⅱ) 脂溶性维生素注射液(Ⅱ) 注射用多种维生素(12) 注射用脂溶性维生素(I) 注射用复方维生素(3) 脂溶性维生素注射液(Ⅰ) 复方维生素(3)注射液 复方维生素(4)注射液
    [Documentation]    断言:""
    ${assert}    Create List    复方维生素注射液(4)    注射用12种复合维生素    注射用水溶性维生素    注射用脂溶性维生素(II)    注射用脂溶性维生素(Ⅰ)    注射用脂溶性维生素(Ⅱ)    脂溶性维生素注射液(Ⅱ)    注射用多种维生素(12)    注射用脂溶性维生素(I)    注射用复方维生素(3)    脂溶性维生素注射液(Ⅰ)    复方维生素(3)注射液    复方维生素(4)注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 营养风险筛查2002(NRS):3分 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



###76l 20170919 NSAIDs      疼痛          265 是
###分组
32.1 NSAIDs::主诉:疼痛评分:1,用药推荐包含:布洛芬分散片 布洛芬口腔崩解片 右旋布洛芬片 布洛芬片 布洛芬缓释片 布洛芬缓释胶囊 布洛芬胶囊 布洛芬软胶囊 布洛芬咀嚼片 右旋布洛芬胶囊 布洛芬口服溶液 双氯芬酸钠双释放肠溶胶囊 双氯芬酸钠缓释片 双氯芬酸钠缓释片(IV) 双氯芬酸钠缓释片(Ⅰ) 双氯芬酸钠缓释胶囊 双氯芬酸钠缓释胶囊(Ⅲ) 双氯芬酸钠肠溶片 双氯芬酸钠肠溶缓释胶囊 双氯芬酸钠肠溶胶囊 双氯芬酸钾分散片 双氯芬酸钾片 双氯芬酸钾胶囊 双氯芬酸钠缓释片(Ⅴ) 双氯芬酸钠缓释胶囊(I) 双氯芬酸钠缓释胶囊(Ⅰ) 美洛昔康分散片 美洛昔康片 美洛昔康胶囊 美洛昔康颗粒 塞来昔布胶囊 氯诺昔康片 氯诺昔康速释片 氯诺昔康分散片 注射用氯诺昔康 双氯芬酸钠注射液 复方双氯芬酸钠注射液 美洛昔康注射液 注射用帕瑞昔布钠 酮咯酸氨丁三醇注射液 氟比洛芬酯注射液
    [Documentation]    断言:""
    ${assert}    Create List    布洛芬分散片    布洛芬口腔崩解片    右旋布洛芬片    布洛芬片    布洛芬缓释片    布洛芬缓释胶囊    布洛芬胶囊    布洛芬软胶囊    布洛芬咀嚼片    右旋布洛芬胶囊    布洛芬口服溶液    双氯芬酸钠双释放肠溶胶囊    双氯芬酸钠缓释片    双氯芬酸钠缓释片(IV)    双氯芬酸钠缓释片(Ⅰ)    双氯芬酸钠缓释胶囊    双氯芬酸钠缓释胶囊(Ⅲ)    双氯芬酸钠肠溶片    双氯芬酸钠肠溶缓释胶囊    双氯芬酸钠肠溶胶囊    双氯芬酸钾分散片    双氯芬酸钾片    双氯芬酸钾胶囊    双氯芬酸钠缓释片(Ⅴ)    双氯芬酸钠缓释胶囊(I)    双氯芬酸钠缓释胶囊(Ⅰ)    美洛昔康分散片    美洛昔康片    美洛昔康胶囊    美洛昔康颗粒    塞来昔布胶囊    氯诺昔康片    氯诺昔康速释片    氯诺昔康分散片    注射用氯诺昔康    双氯芬酸钠注射液    复方双氯芬酸钠注射液    美洛昔康注射液    注射用帕瑞昔布钠    酮咯酸氨丁三醇注射液    氟比洛芬酯注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 疼痛评分:1 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

###77l 20170919 弱阿片类药物      疼痛          266 是
###分组
33.1 弱阿片类药物::主诉:疼痛评分:1,用药推荐包含:复方磷酸可待因片 磷酸可待因片 磷酸可待因缓释片 磷酸可待因注射液 复方磷酸可待因溶液 复方磷酸可待因口服溶液(Ⅲ) 阿司匹林可待因片
    [Documentation]    断言:""
    ${assert}    Create List    复方磷酸可待因片    磷酸可待因片    磷酸可待因缓释片    磷酸可待因注射液    复方磷酸可待因溶液    复方磷酸可待因口服溶液(Ⅲ)    阿司匹林可待因片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 疼痛评分:4 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s

###78l 20170919 强阿片类药物      疼痛          267 是
###分组
34.1 强阿片类药物::主诉:疼痛评分:7,用药推荐包含:盐酸哌替啶片 盐酸哌替啶注射液 盐酸吗啡注射液 盐酸氢吗啡酮注射液 硫酸吗啡注射液 硫酸吗啡片 硫酸吗啡口服溶液 硫酸吗啡栓 硫酸吗啡缓释片 盐酸吗啡缓释片 盐酸吗啡片 芬太尼透皮贴剂 枸橼酸芬太尼注射液 丁丙诺啡透皮贴剂 盐酸丁丙诺啡舌下片 盐酸丁丙诺啡注射液
    [Documentation]    断言:""
    ${assert}    Create List    盐酸哌替啶片    盐酸哌替啶注射液    盐酸吗啡注射液    盐酸氢吗啡酮注射液    硫酸吗啡注射液    硫酸吗啡片    硫酸吗啡口服溶液    硫酸吗啡栓    硫酸吗啡缓释片    盐酸吗啡缓释片    盐酸吗啡片    芬太尼透皮贴剂    枸橼酸芬太尼注射液    丁丙诺啡透皮贴剂    盐酸丁丙诺啡舌下片    盐酸丁丙诺啡注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 疼痛评分:7 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s



###79l 20170919 20170919    中度疼痛非阿片药物       疼痛          268 是
###分组160
35.1 中度疼痛非阿片药物::主诉:疼痛评分:4,用药推荐包含:盐酸曲马多缓释胶囊 盐酸曲马多胶囊 盐酸曲马多片 盐酸曲马多缓释片 盐酸曲马多分散片 盐酸曲马多缓释片(II) 盐酸曲马多泡腾颗粒 盐酸曲马多滴剂 盐酸曲马多注射液 盐酸曲马多氯化钠注射液 注射用盐酸曲马多 盐酸曲马多葡萄糖注射液 氨酚曲马多胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸曲马多缓释胶囊    盐酸曲马多胶囊    盐酸曲马多片    盐酸曲马多缓释片    盐酸曲马多分散片    盐酸曲马多缓释片(II)    盐酸曲马多泡腾颗粒    盐酸曲马多滴剂    盐酸曲马多注射液    盐酸曲马多氯化钠注射液    注射用盐酸曲马多    盐酸曲马多葡萄糖注射液    氨酚曲马多胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 疼痛评分:4 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


###分组161
35.2 中度疼痛非阿片药物::主诉:疼痛评分:4,用药推荐包含:盐酸布桂嗪注射液 盐酸布桂嗪片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸布桂嗪注射液    盐酸布桂嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":" 疼痛评分:4 诊断及诊断依据: ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.4s


