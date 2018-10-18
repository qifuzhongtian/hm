*** Settings ***
# Suite Setup    Run Keywords    登录接口
# ...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名	类型	是否必须	说明
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



####2L 溶栓  大面积肺栓塞｜肺栓塞｜急性肺栓塞        急性ST段抬高型心肌梗塞    29  是
1.溶栓治疗:溶栓.1:主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞,用药推荐包含:注射用尿激酶 注射用重组人尿激酶原 注射用重组链激酶 注射用阿替普酶 注射用瑞替普酶
    [Documentation]    断言:""
    ${assert}    Create List    注射用尿激酶    注射用重组人尿激酶原    注射用重组链激酶    注射用阿替普酶    注射用瑞替普酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 急性ST段抬高型心肌梗塞 Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    List should contain sub list    ${aj}     ${assert}
    # Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



####3L 经验性抗凝治疗 肠道外抗凝(一线治疗药物)   Wells评分中度可能急性肺栓塞｜Wells评分>=2分｜Wells评分高度可能急性肺栓塞            30  是
2.经验性抗凝治疗:肠道外抗凝(一线治疗药物):主诉:Wells评分中度可能急性肺栓塞｜Wells评分>=2分｜Wells评分高度可能急性肺栓塞,用药推荐包含:肝素钠注射液 肝素钙注射液 注射用肝素钙 依诺肝素钠注射液 注射用依诺肝素钠 达肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    肝素钠注射液    肝素钙注射液    注射用肝素钙    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:</InnerValue></Element></XElements><BodyText>Subjective: Wells评分:2 Wells评分:6 Wells评分:7 Objective: Assessment:诊断: Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


####4L 经验性抗凝治疗 传统口服抗凝药(与肠道外抗凝剂重叠使用5日)  Wells评分中度可能急性肺栓塞｜Wells评分>=2分｜Wells评分高度可能急性肺栓塞            31  是
3.经验性抗凝治疗:传统口服抗凝药(与肠道外抗凝剂重叠使用5日):主诉:Wells评分中度可能急性肺栓塞｜Wells评分>=2分｜Wells评分高度可能急性肺栓塞,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:</InnerValue></Element></XElements><BodyText>Subjective: Wells评分:2 Wells评分:6 Wells评分:7 Objective: Assessment:诊断: Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


####5L 经验性抗凝治疗 新型口服抗凝药(不需要与肝素重叠使用) Wells评分中度可能急性肺栓塞｜Wells评分>=2分｜Wells评分高度可能急性肺栓塞            32  是
4.经验性抗凝治疗:新型口服抗凝药(不需要与肝素重叠使用):主诉:Wells评分中度可能急性肺栓塞｜Wells评分>=2分｜Wells评分高度可能急性肺栓塞,用药推荐包含:利伐沙班片 阿哌沙班片 达比加群酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    利伐沙班片   阿哌沙班片   达比加群酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:</InnerValue></Element></XElements><BodyText>Subjective: Wells评分:2 Wells评分:6 Wells评分:7 Objective: Assessment:诊断: Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


####6L 抗凝治疗    肠道外抗凝(一线治疗药物)   大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%           55  是
5.抗凝治疗:肠道外抗凝(一线治疗药物):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:肝素钠注射液 肝素钙注射液 注射用肝素钙 依诺肝素钠注射液 注射用依诺肝素钠 达肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    肝素钠注射液    肝素钙注射液    注射用肝素钙    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
#     # [Teardown]    sleep    0.2s

####7L 抗凝治疗    传统口服抗凝药(与肠道外抗凝剂重叠使用5日)  大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%           56  是
6.抗凝治疗:传统口服抗凝药(与肠道外抗凝剂重叠使用5日):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


####8L 抗凝治疗    新型口服抗凝药(不需要与肝素重叠使用) 大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            57  是
7.抗凝治疗:传统口服抗凝药(与肠道外抗凝剂重叠使用5日):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:利伐沙班片 阿哌沙班片 达比加群酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    利伐沙班片    阿哌沙班片    达比加群酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####9L 门诊抗凝治疗  肠道外抗凝(一线治疗药物)   大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            58  是
8.门诊抗凝治疗:肠道外抗凝(一线治疗药物):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:肝素钠注射液 肝素钙注射液 注射用肝素钙 依诺肝素钠注射液 注射用依诺肝素钠 达肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    肝素钠注射液    肝素钙注射液    注射用肝素钙    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

#### 10l 门诊抗凝治疗10门诊抗凝治疗    传统口服抗凝药(与肠道外抗凝剂重叠使用5日)  大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            59  是
9.门诊抗凝治疗:传统口服抗凝药(与肠道外抗凝剂重叠使用5日):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####11L 门诊抗凝治疗 新型口服抗凝药(不需要与肝素重叠使用) 大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            60  是
10.门诊抗凝治疗:新型口服抗凝药(不需要与肝素重叠使用):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:利伐沙班片 阿哌沙班片 达比加群酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    利伐沙班片    阿哌沙班片    达比加群酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####12L 住院抗凝治疗 肠道外抗凝(一线治疗药物)   大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            61  是
11.住院抗凝治疗:肠道外抗凝(一线治疗药物):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:肝素钠注射液 肝素钙注射液 注射用肝素钙 依诺肝素钠注射液 注射用依诺肝素钠 达肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    肝素钠注射液    肝素钙注射液    注射用肝素钙    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####13L 住院抗凝治疗 传统口服抗凝药(与肠道外抗凝剂重叠使用5日)  大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            62  是
12.住院抗凝治疗:传统口服抗凝药(与肠道外抗凝剂重叠使用5日):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####14L 住院抗凝治疗 新型口服抗凝药(不需要与肝素重叠使用) 大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            63  是
13.住院抗凝治疗:新型口服抗凝药(不需要与肝素重叠使用):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:利伐沙班片 阿哌沙班片 达比加群酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    利伐沙班片    阿哌沙班片    达比加群酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####15L ICU抗凝治疗    肠道外抗凝(一线治疗药物)   大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            64  是
14.ICU抗凝治疗:肠道外抗凝(一线治疗药物):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:肝素钠注射液 肝素钙注射液 注射用肝素钙 依诺肝素钠注射液 注射用依诺肝素钠 达肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    肝素钠注射液    肝素钙注射液    注射用肝素钙    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####16L ICU抗凝治疗 传统口服抗凝药(与肠道外抗凝剂重叠使用5日)  大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            65  是
15.ICU抗凝治疗:传统口服抗凝药(与肠道外抗凝剂重叠使用5日):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####17L ICU抗凝治疗    新型口服抗凝药(不需要与肝素重叠使用) 大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%            66  是
16.ICU抗凝治疗:新型口服抗凝药(不需要与肝素重叠使用):主诉:大面积肺栓塞｜肺栓塞｜急性肺栓塞｜肺血管栓塞面积>=50%,用药推荐包含:利伐沙班片 阿哌沙班片 达比加群酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    利伐沙班片    阿哌沙班片    达比加群酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:肺栓塞 急性肺栓塞</InnerValue></Element></XElements><BodyText>Subjective: 大面积肺栓塞 肺栓塞 急性肺栓塞 肺血管栓塞面积:50% Objective: Assessment:诊断:肺栓塞 急性肺栓塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


####18L HFpEF治疗    醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB    心力衰竭症状｜心力衰竭 EF>=50%｜射血分数保留  EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    33  是
17.1 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭 +伴随条件:EF>=50%｜射血分数保留,用药推荐包含:螺内酯片 螺内酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    螺内酯片    螺内酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


17.2 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭 +伴随条件:EF>=50%｜射血分数保留,用药推荐包含:盐酸普萘洛尔片 盐酸普萘洛尔缓释片 盐酸普萘洛尔缓释胶囊 阿替洛尔片 酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 富马酸比索洛尔 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔 盐酸倍他洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    盐酸普萘洛尔缓释胶囊    阿替洛尔片    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    富马酸比索洛尔    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔    盐酸倍他洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

17.3 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭 +伴随条件:EF>=50%｜射血分数保留,用药推荐包含:马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利分散片 卡托普利片 卡托普利胶囊 卡托普利缓释片 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利分散片    卡托普利片    卡托普利胶囊    卡托普利缓释片    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



####19L HFrEF治疗    醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB    心力衰竭症状｜心力衰竭 EF<50%｜射血分数降低   EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    44  是
18.1 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭 +伴随条件:EF<50%｜射血分数降低,用药推荐包含:螺内酯片 螺内酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    螺内酯片    螺内酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

18.2 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭 +伴随条件:EF<50%｜射血分数降低,用药推荐包含:盐酸普萘洛尔片 盐酸普萘洛尔缓释片 盐酸普萘洛尔缓释胶囊 阿替洛尔片 酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 富马酸比索洛尔 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔 盐酸倍他洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    盐酸普萘洛尔缓释胶囊    阿替洛尔片    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    富马酸比索洛尔    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔    盐酸倍他洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



18.3 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭 +伴随条件:EF<50%｜射血分数降低,用药推荐包含:马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利分散片 卡托普利片 卡托普利胶囊 卡托普利缓释片 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利分散片    卡托普利片    卡托普利胶囊    卡托普利缓释片    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s




#####20L 降压 CCB/利尿剂 心力衰竭症状｜心力衰竭     EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    34  是
19.1 降压:CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭 ,用药推荐包含:氢氯噻嗪片 吲达帕胺片 吲达帕胺胶囊 吲达帕胺缓释胶囊(Ⅱ) 吲达帕胺缓释片 吲达帕胺缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    氢氯噻嗪片    吲达帕胺片    吲达帕胺胶囊    吲达帕胺缓释胶囊(Ⅱ)    吲达帕胺缓释片    吲达帕胺缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

19.2 降压:CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭,用药推荐包含:非洛地平片 非洛地平缓释片 非洛地平缓释片(Ⅱ) 非洛地平缓释胶囊 甲磺酸氨氯地平片 马来酸氨氯地平片 苯磺酸氨氯地平分散片 苯磺酸氨氯地平片 苯磺酸氨氯地平胶囊 马来酸氨氯地平分散片 马来酸左旋氨氯地平分散片 马来酸左旋氨氯地平片 苯磺酸左旋氨氯地平片 拉西地平分散片 拉西地平片 硝苯地平控释片 硝苯地平缓释片 硝苯地平缓释片(I) 硝苯地平缓释片(Ⅱ) 硝苯地平缓释片(Ⅲ) 硝苯地平缓释胶囊 尼群地平片 尼群地平软胶囊 尼群地平分散片 盐酸尼卡地平片 盐酸尼卡地平缓释胶囊 盐酸尼卡地平缓释片 盐酸贝尼地平 盐酸贝尼地平片 盐酸乐卡地平 盐酸乐卡地平片
    [Documentation]    断言:""
    ${assert}    Create List    非洛地平片    非洛地平缓释片    非洛地平缓释片(Ⅱ)    非洛地平缓释胶囊    甲磺酸氨氯地平片    马来酸氨氯地平片    苯磺酸氨氯地平分散片    苯磺酸氨氯地平片    苯磺酸氨氯地平胶囊    马来酸氨氯地平分散片    马来酸左旋氨氯地平分散片    马来酸左旋氨氯地平片    苯磺酸左旋氨氯地平片    拉西地平分散片    拉西地平片    硝苯地平控释片    硝苯地平缓释片    硝苯地平缓释片(I)    硝苯地平缓释片(Ⅱ)    硝苯地平缓释片(Ⅲ)    硝苯地平缓释胶囊    尼群地平片    尼群地平软胶囊    尼群地平分散片    盐酸尼卡地平片    盐酸尼卡地平缓释胶囊    盐酸尼卡地平缓释片    盐酸贝尼地平    盐酸贝尼地平片    盐酸乐卡地平    盐酸乐卡地平片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

19.3 降压:CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭,用药推荐包含:厄贝沙坦氢氯噻嗪分散片 厄贝沙坦氢氯噻嗪片 厄贝沙坦氢氯噻嗪胶囊 替米沙坦氢氯噻嗪片 氯沙坦钾氢氯噻嗪片 缬沙坦氢氯噻嗪片 缬沙坦氢氯噻嗪胶囊 贝那普利氢氯噻嗪片 依那普利氢氯噻嗪分散片 依那普利氢氯噻嗪咀嚼片 依那普利氢氯噻嗪片 比索洛尔氢氯噻嗪片
    [Documentation]    断言:""
    ${assert}    Create List    厄贝沙坦氢氯噻嗪分散片    厄贝沙坦氢氯噻嗪片    厄贝沙坦氢氯噻嗪胶囊    替米沙坦氢氯噻嗪片    氯沙坦钾氢氯噻嗪片    缬沙坦氢氯噻嗪片    缬沙坦氢氯噻嗪胶囊    贝那普利氢氯噻嗪片    依那普利氢氯噻嗪分散片    依那普利氢氯噻嗪咀嚼片    依那普利氢氯噻嗪片    比索洛尔氢氯噻嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



#####21L 对症治疗   利尿剂 心力衰竭症状｜心力衰竭     EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    39  是
10.1 对症治疗:利尿剂:主诉:心力衰竭症状｜心力衰竭,用药推荐包含:呋塞米片 布美他尼片 托拉塞米片 托拉塞米分散片 托拉塞米胶囊 复方呋塞米片 托拉塞米注射液 注射用托拉塞米 呋塞米注射液 注射用呋塞米
    [Documentation]    断言:""
    ${assert}    Create List    呋塞米片    布美他尼片    托拉塞米片    托拉塞米分散片    托拉塞米胶囊    复方呋塞米片    托拉塞米注射液    注射用托拉塞米    呋塞米注射液    注射用呋塞米
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

10.2 对症治疗:利尿剂:主诉:心力衰竭症状｜心力衰竭,用药推荐包含:氢氯噻嗪片 氯噻酮片 苄氟噻嗪片 盐酸阿米洛利片 氨苯蝶啶片
    [Documentation]    断言:""
    ${assert}    Create List    氢氯噻嗪片    氯噻酮片    苄氟噻嗪片    盐酸阿米洛利片    氨苯蝶啶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



####22L 对症治疗   地高辛 心力衰竭症状｜心力衰竭     EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    42  是
21 对症治疗:地高辛:主诉:心力衰竭症状｜心力衰竭,用药推荐包含:甲地高辛片 地高辛片 地高辛口服溶液 地高辛注射液
    [Documentation]    断言:""
    ${assert}    Create List    甲地高辛片    地高辛片    地高辛口服溶液    地高辛注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


####23L 对症治疗   硝酸酯类    心力衰竭症状｜心力衰竭     EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    43  是
22 对症治疗:硝酸酯类:主诉:心力衰竭症状｜心力衰竭,用药推荐包含:单硝酸异山梨酯分散片 单硝酸异山梨酯片 单硝酸异山梨酯缓释片 单硝酸异山梨酯缓释胶囊 单硝酸异山梨酯缓释胶囊(Ⅲ) 单硝酸异山梨酯缓释胶囊(Ⅱ) 单硝酸异山梨酯胶囊 单硝酸异山梨酯缓释胶囊(I) 单硝酸异山梨酯缓释胶囊(IV) 单硝酸异山梨酯缓释胶囊(Ⅰ) 硝酸异山梨酯片 硝酸异山梨酯缓释片 硝酸甘油片 硝酸甘油注射液 单硝酸异山梨脂葡萄糖注射液 注射用单硝酸异山梨酯 单硝酸异山梨酯葡萄糖注射液 注射用硝酸异山梨酯 硝酸异山梨酯葡萄糖注射液 硝酸异山梨酯注射液
    [Documentation]    断言:""
    ${assert}    Create List    单硝酸异山梨酯分散片    单硝酸异山梨酯片    单硝酸异山梨酯缓释片    单硝酸异山梨酯缓释胶囊    单硝酸异山梨酯缓释胶囊(Ⅲ)    单硝酸异山梨酯缓释胶囊(Ⅱ)    单硝酸异山梨酯胶囊    单硝酸异山梨酯缓释胶囊(I)    单硝酸异山梨酯缓释胶囊(IV)    单硝酸异山梨酯缓释胶囊(Ⅰ)    硝酸异山梨酯片    硝酸异山梨酯缓释片    硝酸甘油片    硝酸甘油注射液    单硝酸异山梨脂葡萄糖注射液    注射用单硝酸异山梨酯    单硝酸异山梨酯葡萄糖注射液    注射用硝酸异山梨酯    硝酸异山梨酯葡萄糖注射液    硝酸异山梨酯注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

####24L HFpEF治疗    醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB    心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留          33  是
23.1 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB,用药推荐包含:螺内酯片 螺内酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    螺内酯片    螺内酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

23.2 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB,用药推荐包含:盐酸普萘洛尔片 盐酸普萘洛尔缓释片 盐酸普萘洛尔缓释胶囊 阿替洛尔片 酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 富马酸比索洛尔 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔 盐酸倍他洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    盐酸普萘洛尔缓释胶囊    阿替洛尔片    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    富马酸比索洛尔    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔    盐酸倍他洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

23.3 HFpEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB,用药推荐包含:马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利分散片 卡托普利片 卡托普利胶囊 卡托普利缓释片 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利分散片    卡托普利片    卡托普利胶囊    卡托普利缓释片    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][3]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



# #####25L 降压 CCB/利尿剂 心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留          34  是
24.1 降压 CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留 ,用药推荐包含:氢氯噻嗪片 吲达帕胺片 吲达帕胺胶囊 吲达帕胺缓释胶囊(Ⅱ) 吲达帕胺缓释片 吲达帕胺缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    氢氯噻嗪片    吲达帕胺片    吲达帕胺胶囊    吲达帕胺缓释胶囊(Ⅱ)    吲达帕胺缓释片    吲达帕胺缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

24.2 降压 CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留,用药推荐包含:非洛地平片 非洛地平缓释片 非洛地平缓释片(Ⅱ) 非洛地平缓释胶囊 甲磺酸氨氯地平片 马来酸氨氯地平片 苯磺酸氨氯地平分散片 苯磺酸氨氯地平片 苯磺酸氨氯地平胶囊 马来酸氨氯地平分散片 马来酸左旋氨氯地平分散片 马来酸左旋氨氯地平片 苯磺酸左旋氨氯地平片 拉西地平分散片 拉西地平片 硝苯地平控释片 硝苯地平缓释片 硝苯地平缓释片(I) 硝苯地平缓释片(Ⅱ) 硝苯地平缓释片(Ⅲ) 硝苯地平缓释胶囊 尼群地平片 尼群地平软胶囊 尼群地平分散片 盐酸尼卡地平片 盐酸尼卡地平缓释胶囊 盐酸尼卡地平缓释片 盐酸贝尼地平 盐酸贝尼地平片 盐酸乐卡地平 盐酸乐卡地平片
    [Documentation]    断言:""
    ${assert}    Create List    非洛地平片    非洛地平缓释片    非洛地平缓释片(Ⅱ)    非洛地平缓释胶囊    甲磺酸氨氯地平片    马来酸氨氯地平片    苯磺酸氨氯地平分散片    苯磺酸氨氯地平片    苯磺酸氨氯地平胶囊    马来酸氨氯地平分散片    马来酸左旋氨氯地平分散片    马来酸左旋氨氯地平片    苯磺酸左旋氨氯地平片    拉西地平分散片    拉西地平片    硝苯地平控释片    硝苯地平缓释片    硝苯地平缓释片(I)    硝苯地平缓释片(Ⅱ)    硝苯地平缓释片(Ⅲ)    硝苯地平缓释胶囊    尼群地平片    尼群地平软胶囊    尼群地平分散片    盐酸尼卡地平片    盐酸尼卡地平缓释胶囊    盐酸尼卡地平缓释片    盐酸贝尼地平    盐酸贝尼地平片    盐酸乐卡地平    盐酸乐卡地平片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

24.3 降压 CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留,用药推荐包含:厄贝沙坦氢氯噻嗪分散片 厄贝沙坦氢氯噻嗪片 厄贝沙坦氢氯噻嗪胶囊 替米沙坦氢氯噻嗪片 氯沙坦钾氢氯噻嗪片 缬沙坦氢氯噻嗪片 缬沙坦氢氯噻嗪胶囊 贝那普利氢氯噻嗪片 依那普利氢氯噻嗪分散片 依那普利氢氯噻嗪咀嚼片 依那普利氢氯噻嗪片 比索洛尔氢氯噻嗪片
    [Documentation]    断言:""
    ${assert}    Create List    厄贝沙坦氢氯噻嗪分散片    厄贝沙坦氢氯噻嗪片    厄贝沙坦氢氯噻嗪胶囊    替米沙坦氢氯噻嗪片    氯沙坦钾氢氯噻嗪片    缬沙坦氢氯噻嗪片    缬沙坦氢氯噻嗪胶囊    贝那普利氢氯噻嗪片    依那普利氢氯噻嗪分散片    依那普利氢氯噻嗪咀嚼片    依那普利氢氯噻嗪片    比索洛尔氢氯噻嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


# #####26L 房颤控制 控制房颤心室率 心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留    心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&房颤&心率>110次/分       35  是
25.1 房颤控制:控制房颤心室率:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留 ,用药推荐包含:酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 盐酸普萘洛尔片 盐酸普萘洛尔缓释片 盐酸普萘洛尔缓释胶囊 阿替洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    盐酸普萘洛尔缓释胶囊    阿替洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 心力衰竭 射血分数:50% 射血分数保留 房颤 心率:111次/分 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


25.2 房颤控制:控制房颤心室率:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留 ,用药推荐包含:盐酸地尔硫卓片 盐酸地尔硫卓缓释胶囊 盐酸地尔硫卓缓释胶囊(Ⅱ) 盐酸地尔硫卓缓释片 盐酸地尔硫卓控释胶囊 盐酸维拉帕米片 盐酸维拉帕米缓释片 盐酸维拉帕米缓释胶囊 注射用盐酸地尔硫卓 盐酸维拉帕米注射液 地高辛片 地高辛注射液 盐酸胺碘酮片 盐酸胺碘酮胶囊
    [Documentation]    断言:""
    ${assert}    Create List    盐酸地尔硫卓片    盐酸地尔硫卓缓释胶囊    盐酸地尔硫卓缓释胶囊(Ⅱ)    盐酸地尔硫卓缓释片    盐酸地尔硫卓控释胶囊    盐酸维拉帕米片    盐酸维拉帕米缓释片    盐酸维拉帕米缓释胶囊    注射用盐酸地尔硫卓    盐酸维拉帕米注射液    地高辛片    地高辛注射液    盐酸胺碘酮片    盐酸胺碘酮胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 心力衰竭 射血分数:50% 射血分数保留 房颤 心率:111次/分 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



# #####27L 房颤控制 转复并维持窦性心律   心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&缺血症状         37  是
26.1 房颤控制:转复并维持窦性心律:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&缺血症状 ,用药推荐包含:注射用盐酸胺碘酮 盐酸胺碘酮注射液 盐酸胺碘酮片 盐酸胺碘酮胶囊
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸胺碘酮    盐酸胺碘酮注射液    盐酸胺碘酮片    盐酸胺碘酮胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 心力衰竭 射血分数:50% 射血分数保留 房颤 心率:111次/分 胸痛 心绞痛 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

26.2 房颤控制:转复并维持窦性心律:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&缺血症状 ,用药推荐包含:盐酸普罗帕酮注射液 盐酸普罗帕酮片 富马酸伊布利特注射液
    [Documentation]    断言:""
    ${assert}    Create List    盐酸普罗帕酮注射液    盐酸普罗帕酮片    富马酸伊布利特注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 心力衰竭 射血分数:50% 射血分数保留 房颤 心率:111次/分 胸痛 心绞痛 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


######28L 对症治疗 利尿剂 心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&肺淤血｜周围性水肿｜液体潴留｜容量超负荷         39  是
27.1 对症治疗:利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&肺淤血｜周围性水肿｜液体潴留｜容量超负荷,用药推荐包含:呋塞米片 布美他尼片 托拉塞米片 托拉塞米分散片 托拉塞米胶囊 复方呋塞米片 托拉塞米注射液 注射用托拉塞米 呋塞米注射液 注射用呋塞米
    [Documentation]    断言:""
    ${assert}    Create List    呋塞米片    布美他尼片    托拉塞米片    托拉塞米分散片    托拉塞米胶囊    复方呋塞米片    托拉塞米注射液    注射用托拉塞米    呋塞米注射液    注射用呋塞米
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 肺淤血 周围性水肿 液体潴留 容量超负荷 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

27.2 对症治疗:利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&肺淤血｜周围性水肿｜液体潴留｜容量超负荷,用药推荐包含:氢氯噻嗪片 氯噻酮片 苄氟噻嗪片 盐酸阿米洛利片 氨苯蝶啶片
    [Documentation]    断言:""
    ${assert}    Create List    氢氯噻嗪片    氯噻酮片    苄氟噻嗪片    盐酸阿米洛利片    氨苯蝶啶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 肺淤血 周围性水肿 液体潴留 容量超负荷 Objective: Assessment:诊断: Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


###29L 对症治疗   地高辛 心力衰竭症状｜心力衰竭     EF>=50%｜射血分数保留｜EF<50%｜射血分数降低    42  是
28.1对症治疗:地高辛:主诉: EF>=50%｜射血分数保留｜EF<50%｜射血分数降低,用药推荐包含:甲地高辛片 地高辛片 地高辛口服溶液 地高辛注射液
    [Documentation]    断言:""
    ${assert}    Create List    甲地高辛片    地高辛片    地高辛口服溶液    地高辛注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数保留 心肌收缩力下降 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


###30L 对症治疗    硝酸酯类    心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难         43  是
29.1对症治疗:硝酸酯类:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难,用药推荐包含:单硝酸异山梨酯分散片 单硝酸异山梨酯片 单硝酸异山梨酯缓释片 单硝酸异山梨酯缓释胶囊 单硝酸异山梨酯缓释胶囊(Ⅲ) 单硝酸异山梨酯缓释胶囊(Ⅱ) 单硝酸异山梨酯胶囊 单硝酸异山梨酯缓释胶囊(I) 单硝酸异山梨酯缓释胶囊(IV) 单硝酸异山梨酯缓释胶囊(Ⅰ) 硝酸异山梨酯片 硝酸异山梨酯缓释片 硝酸甘油片 硝酸甘油注射液 单硝酸异山梨脂葡萄糖注射液 注射用单硝酸异山梨酯 单硝酸异山梨酯葡萄糖注射液 注射用硝酸异山梨酯 硝酸异山梨酯葡萄糖注射液 硝酸异山梨酯注射液
    [Documentation]    断言:""
    ${assert}    Create List    单硝酸异山梨酯分散片    单硝酸异山梨酯片    单硝酸异山梨酯缓释片    单硝酸异山梨酯缓释胶囊    单硝酸异山梨酯缓释胶囊(Ⅲ)    单硝酸异山梨酯缓释胶囊(Ⅱ)    单硝酸异山梨酯胶囊    单硝酸异山梨酯缓释胶囊(I)    单硝酸异山梨酯缓释胶囊(IV)    单硝酸异山梨酯缓释胶囊(Ⅰ)    硝酸异山梨酯片    硝酸异山梨酯缓释片    硝酸甘油片    硝酸甘油注射液    单硝酸异山梨脂葡萄糖注射液    注射用单硝酸异山梨酯    单硝酸异山梨酯葡萄糖注射液    注射用硝酸异山梨酯    硝酸异山梨酯葡萄糖注射液    硝酸异山梨酯注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 呼吸困难 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####31L 冠状动脉血管重建术   术后用药    心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留          41  是
30.冠状动脉血管重建术:术后用药:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留,用药推荐包含:阿司匹林肠溶片 阿司匹林肠溶胶囊 阿司匹林肠溶缓释片 阿司匹林缓释片 硫酸氢氯吡格雷片
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林肠溶片    阿司匹林肠溶胶囊    阿司匹林肠溶缓释片    阿司匹林缓释片    硫酸氢氯吡格雷片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####32L HFrEF治疗   醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB    心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低           44  是
31.1 HFrEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低,用药推荐包含:螺内酯片 螺内酯胶囊
    [Documentation]    断言:""
    ${assert}    Create List    螺内酯片    螺内酯胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

31.2 HFrEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低,用药推荐包含:盐酸普萘洛尔片 盐酸普萘洛尔缓释片 盐酸普萘洛尔缓释胶囊 阿替洛尔片 酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 富马酸比索洛尔 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔 盐酸倍他洛尔片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    盐酸普萘洛尔缓释胶囊    阿替洛尔片    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    富马酸比索洛尔    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔    盐酸倍他洛尔片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

31.3 HFrEF治疗:醛固酮受体拮抗剂＋β受体阻滞剂＋ACEI/ARB:主诉:心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低,用药推荐包含:马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利分散片 卡托普利片 卡托普利胶囊 卡托普利缓释片 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 氯沙坦钾片 氯沙坦钾胶囊 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利分散片    卡托普利片    卡托普利胶囊    卡托普利缓释片    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    氯沙坦钾片    氯沙坦钾胶囊    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



#####33L 降压 CCB/利尿剂 心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低           45  是
32.1 降压:CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低,用药推荐包含:氢氯噻嗪片 吲达帕胺片 吲达帕胺胶囊 吲达帕胺缓释胶囊(Ⅱ) 吲达帕胺缓释片 吲达帕胺缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    氢氯噻嗪片    吲达帕胺片    吲达帕胺胶囊    吲达帕胺缓释胶囊(Ⅱ)    吲达帕胺缓释片    吲达帕胺缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

32.2 降压:CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低,用药推荐包含:非洛地平片 非洛地平缓释片 非洛地平缓释片(Ⅱ) 非洛地平缓释胶囊 甲磺酸氨氯地平片 马来酸氨氯地平片 苯磺酸氨氯地平分散片 苯磺酸氨氯地平片 苯磺酸氨氯地平胶囊 马来酸氨氯地平分散片 马来酸左旋氨氯地平分散片 马来酸左旋氨氯地平片 苯磺酸左旋氨氯地平片 拉西地平分散片 拉西地平片 硝苯地平控释片 硝苯地平缓释片 硝苯地平缓释片(I) 硝苯地平缓释片(Ⅱ) 硝苯地平缓释片(Ⅲ) 硝苯地平缓释胶囊 尼群地平片 尼群地平软胶囊 尼群地平分散片 盐酸尼卡地平片 盐酸尼卡地平缓释胶囊 盐酸尼卡地平缓释片 盐酸贝尼地平 盐酸贝尼地平片 盐酸乐卡地平 盐酸乐卡地平片
    [Documentation]    断言:""
    ${assert}    Create List    非洛地平片    非洛地平缓释片    非洛地平缓释片(Ⅱ)    非洛地平缓释胶囊    甲磺酸氨氯地平片    马来酸氨氯地平片    苯磺酸氨氯地平分散片    苯磺酸氨氯地平片    苯磺酸氨氯地平胶囊    马来酸氨氯地平分散片    马来酸左旋氨氯地平分散片    马来酸左旋氨氯地平片    苯磺酸左旋氨氯地平片    拉西地平分散片    拉西地平片    硝苯地平控释片    硝苯地平缓释片    硝苯地平缓释片(I)    硝苯地平缓释片(Ⅱ)    硝苯地平缓释片(Ⅲ)    硝苯地平缓释胶囊    尼群地平片    尼群地平软胶囊    尼群地平分散片    盐酸尼卡地平片    盐酸尼卡地平缓释胶囊    盐酸尼卡地平缓释片    盐酸贝尼地平    盐酸贝尼地平片    盐酸乐卡地平    盐酸乐卡地平片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

32.3 降压:CCB/利尿剂:主诉:心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低,用药推荐包含:厄贝沙坦氢氯噻嗪分散片 厄贝沙坦氢氯噻嗪片 厄贝沙坦氢氯噻嗪胶囊 替米沙坦氢氯噻嗪片 氯沙坦钾氢氯噻嗪片 缬沙坦氢氯噻嗪片 缬沙坦氢氯噻嗪胶囊 贝那普利氢氯噻嗪片 依那普利氢氯噻嗪分散片 依那普利氢氯噻嗪咀嚼片 依那普利氢氯噻嗪片 比索洛尔氢氯噻嗪片
    [Documentation]    断言:""
    ${assert}    Create List    厄贝沙坦氢氯噻嗪分散片    厄贝沙坦氢氯噻嗪片    厄贝沙坦氢氯噻嗪胶囊    替米沙坦氢氯噻嗪片    氯沙坦钾氢氯噻嗪片    缬沙坦氢氯噻嗪片    缬沙坦氢氯噻嗪胶囊    贝那普利氢氯噻嗪片    依那普利氢氯噻嗪分散片    依那普利氢氯噻嗪咀嚼片    依那普利氢氯噻嗪片    比索洛尔氢氯噻嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s



####对症治疗 34L   利尿剂 心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&肺淤血｜周围性水肿｜液体潴留｜容量超负荷         46  是
33.1 对症治疗:利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&肺淤血｜周围性水肿｜液体潴留｜容量超负荷,用药推荐包含:呋塞米片 布美他尼片 托拉塞米片 托拉塞米分散片 托拉塞米胶囊 托拉塞米注射液 注射用托拉塞米 呋塞米注射液 注射用呋塞米 复方呋塞米片
    [Documentation]    断言:""
    ${assert}    Create List    呋塞米片    布美他尼片    托拉塞米片    托拉塞米分散片    托拉塞米胶囊    托拉塞米注射液    注射用托拉塞米    呋塞米注射液    注射用呋塞米    复方呋塞米片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:51% 射血分数保留 射血分数保留 肺淤血周围性水肿液体潴留 颈静脉压升高 呼吸困难 端坐呼吸 阵发性夜间呼吸困难 水肿 腹水 湿啰音 第三心音奔马律 肝大 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

33.2 对症治疗:利尿剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&肺淤血｜周围性水肿｜液体潴留｜容量超负荷,用药推荐包含:氢氯噻嗪片 氯噻酮片 苄氟噻嗪片 盐酸阿米洛利片 氨苯蝶啶片
    [Documentation]    断言:""
    ${assert}    Create List    氢氯噻嗪片    氯噻酮片    苄氟噻嗪片    盐酸阿米洛利片    氨苯蝶啶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:51% 射血分数保留 射血分数保留 肺淤血周围性水肿液体潴留 颈静脉压升高 呼吸困难 端坐呼吸 阵发性夜间呼吸困难 水肿 腹水 湿啰音 第三心音奔马律 肝大 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####35L 对症治疗   硝酸酯类    心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难         49  是
34.1 对症治疗:硝酸酯类:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难,用药推荐包含:单硝酸异山梨酯分散片 单硝酸异山梨酯片 单硝酸异山梨酯缓释片 单硝酸异山梨酯缓释胶囊 单硝酸异山梨酯缓释胶囊(Ⅲ) 单硝酸异山梨酯缓释胶囊(Ⅱ) 单硝酸异山梨酯胶囊 单硝酸异山梨酯缓释胶囊(I) 单硝酸异山梨酯缓释胶囊(IV) 单硝酸异山梨酯缓释胶囊(Ⅰ) 硝酸异山梨酯片 硝酸异山梨酯缓释片 硝酸甘油片 硝酸甘油注射液 单硝酸异山梨脂葡萄糖注射液 注射用单硝酸异山梨酯 单硝酸异山梨酯葡萄糖注射液 注射用硝酸异山梨酯 硝酸异山梨酯葡萄糖注射液 硝酸异山梨酯注射液
    [Documentation]    断言:""
    ${assert}    Create List    单硝酸异山梨酯分散片    单硝酸异山梨酯片    单硝酸异山梨酯缓释片    单硝酸异山梨酯缓释胶囊    单硝酸异山梨酯缓释胶囊(Ⅲ)    单硝酸异山梨酯缓释胶囊(Ⅱ)    单硝酸异山梨酯胶囊    单硝酸异山梨酯缓释胶囊(I)    单硝酸异山梨酯缓释胶囊(IV)    单硝酸异山梨酯缓释胶囊(Ⅰ)    硝酸异山梨酯片    硝酸异山梨酯缓释片    硝酸甘油片    硝酸甘油注射液    单硝酸异山梨脂葡萄糖注射液    注射用单硝酸异山梨酯    单硝酸异山梨酯葡萄糖注射液    注射用硝酸异山梨酯    硝酸异山梨酯葡萄糖注射液    硝酸异山梨酯注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 呼吸困难 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    List should contain sub list    ${aj}     ${assert}
    # List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

#####36L 对症治疗   地高辛 心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&心肌收缩力下降          42  是
35.1 对症治疗:地高辛:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难,用药推荐包含:甲地高辛片 地高辛片 地高辛口服溶液 地高辛注射液
    [Documentation]    断言:""
    ${assert}    Create List    甲地高辛片    地高辛片    地高辛口服溶液    地高辛注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:50% 射血分数保留 心肌收缩力下降 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    List should contain sub list    ${aj}     ${assert}
    # List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


###37L 严重心衰处理 正性肌力药   心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低           50  是
36.1 严重心衰处理:正性肌力药:主诉:心力衰竭症状｜心力衰竭&<=50%｜射血分数降低&呼吸困难,用药推荐包含:去乙酰毛花苷注射液 毒毛花苷K注射液 地高辛片 地高辛注射液
    [Documentation]    断言:""
    ${assert}    Create List    去乙酰毛花苷注射液    毒毛花苷K注射液    地高辛片    地高辛注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 心功能III级 心功能IV级 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

36.2 严重心衰处理:正性肌力药:主诉:心力衰竭症状｜心力衰竭&EF<=50%｜射血分数保留&呼吸困难,用药推荐包含:乳酸米力农注射液 乳酸米力农葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    乳酸米力农注射液    乳酸米力农葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 心功能III级 心功能IV级 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


36.3 严重心衰处理:正性肌力药:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难,用药推荐包含:盐酸多巴胺注射液 注射用盐酸多巴酚丁胺 盐酸多巴酚丁胺注射液 盐酸多巴酚丁胺葡萄糖注射液
    [Documentation]    断言:""
    ${assert}    Create List    盐酸多巴胺注射液    注射用盐酸多巴酚丁胺    盐酸多巴酚丁胺注射液    盐酸多巴酚丁胺葡萄糖注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 劳力性呼吸困难 端坐呼吸 阵发性夜间呼吸困难 静息性咳嗽 劳力性咳嗽 水肿 水肿加重 体重增加 颈静脉压升高 第三心音奔马律 心尖搏动侧移 淤血性肝大 肝颈静脉反流征持续存在 腹胀 腹水 胸腔积液 左束支传导阻滞 心肌梗死 心力衰竭 射血分数:49% 射血分数降低 心功能III级 心功能IV级 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

#####38L 严重心衰处理 血管扩张剂   心力衰竭症状｜心力衰竭&EF<50%｜射血分数降低           48  是
37.1 严重心衰处理:血管扩张剂:主诉:心力衰竭症状｜心力衰竭&EF>=50%｜射血分数保留&呼吸困难,用药推荐包含:注射用硝普钠 复方硫酸双肼屈嗪片
    [Documentation]    断言:""
    ${assert}    Create List    注射用硝普钠    复方硫酸双肼屈嗪片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:心力衰竭</InnerValue></Element></XElements><BodyText>Subjective: 心力衰竭 射血分数:49% 射血分数降低 心功能评级III 心功能评级IV 严重心力衰竭 Objective: Assessment:诊断:心力衰竭 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####39L 抗凝治疗   抗凝治疗    房颤          53  是
38.1 抗凝治疗:抗凝治疗:主诉:房颤｜非瓣膜性房颤｜CHA2DS2-VASc评分>=1,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 CHA2DS2-VASc评分:2 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

38.2 抗凝治疗:抗凝治疗:主诉:房颤｜非瓣膜性房颤｜CHA2DS2-VASc评分>=1,用药推荐包含:硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 CHA2DS2-VASc评分:2 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

38.3 抗凝治疗:抗凝治疗:主诉:房颤｜非瓣膜性房颤｜CHA2DS2-VASc评分>=1,用药推荐包含:华法林钠片
    [Documentation]    断言:""
    ${assert}    Create List    华法林钠片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 CHA2DS2-VASc评分:2 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][2]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

38.4 抗凝治疗:抗凝治疗:主诉:房颤｜非瓣膜性房颤｜CHA2DS2-VASc评分>=1,用药推荐包含:达比加群酯胶囊 利伐沙班片 阿哌沙班片
    [Documentation]    断言:""
    ${assert}    Create List    达比加群酯胶囊    利伐沙班片    阿哌沙班片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 CHA2DS2-VASc评分:2 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][3]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

38.5 抗凝治疗:抗凝治疗:主诉:房颤｜非瓣膜性房颤｜CHA2DS2-VASc评分>=1,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 CHA2DS2-VASc评分:2 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][4]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####40L ß受体阻滞剂/非二氢吡啶CCB    ß受体阻滞剂  房颤|非瓣膜性房颤          51  是
39.1 ß受体阻滞剂/非二氢吡啶CCB:ß受体阻滞剂:主诉:房颤|非瓣膜性房颤,用药推荐包含:注射用酒石酸美托洛尔 酒石酸美托洛尔注射液 酒石酸美托洛尔片 酒石酸美托洛尔缓释片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 琥珀酸美托洛尔缓释片 阿替洛尔片 注射用盐酸艾司洛尔 盐酸艾司洛尔注射液 盐酸普萘洛尔注射液 盐酸普萘洛尔片 盐酸普萘洛尔缓释片 盐酸普萘洛尔缓释胶囊 卡维地洛片 卡维地洛胶囊 卡维地洛分散片 富马酸比索洛尔片 富马酸比索洛尔胶囊
    [Documentation]    断言:""
    ${assert}    Create List    注射用酒石酸美托洛尔    酒石酸美托洛尔注射液    酒石酸美托洛尔片    酒石酸美托洛尔缓释片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    琥珀酸美托洛尔缓释片    阿替洛尔片    注射用盐酸艾司洛尔    盐酸艾司洛尔注射液    盐酸普萘洛尔注射液    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    盐酸普萘洛尔缓释胶囊    卡维地洛片    卡维地洛胶囊    卡维地洛分散片    富马酸比索洛尔片    富马酸比索洛尔胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][6]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####41L ß受体阻滞剂/非二氢吡啶CCB    非二氢吡啶CCB    房颤          52  是
40.1 非二氢吡啶CCB:主诉:房颤|非瓣膜性房颤,用药推荐包含:盐酸维拉帕米注射液 注射用盐酸维拉帕米 盐酸维拉帕米片 盐酸维拉帕米缓释片 盐酸维拉帕米缓释胶囊 盐酸维拉帕米缓释小丸 注射用盐酸地尔硫卓 盐酸地尔硫卓注射液 盐酸地尔硫卓控释胶囊 盐酸地尔硫卓片 盐酸地尔硫卓缓释片 盐酸地尔硫卓缓释胶囊 盐酸地尔硫卓缓释胶囊(Ⅱ) 盐酸地尔硫卓缓释微丸
    [Documentation]    断言:""
    ${assert}    Create List    盐酸维拉帕米注射液    注射用盐酸维拉帕米    盐酸维拉帕米片    盐酸维拉帕米缓释片    盐酸维拉帕米缓释胶囊    盐酸维拉帕米缓释小丸    注射用盐酸地尔硫卓    盐酸地尔硫卓注射液    盐酸地尔硫卓控释胶囊    盐酸地尔硫卓片    盐酸地尔硫卓缓释片    盐酸地尔硫卓缓释胶囊    盐酸地尔硫卓缓释胶囊(Ⅱ)    盐酸地尔硫卓缓释微丸
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][6]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    List Should Contain Sub List    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s


#####42L 抗心律失常药 抗心律失常药  房颤          38  是
41.1 抗心律失常药:抗心律失常药,主诉:房颤|非瓣膜性房颤,用药推荐包含:注射用盐酸胺碘酮 盐酸胺碘酮注射液 盐酸胺碘酮片 盐酸胺碘酮胶囊
    [Documentation]    断言:""
    ${assert}    Create List    注射用盐酸胺碘酮    盐酸胺碘酮注射液    盐酸胺碘酮片    盐酸胺碘酮胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][5]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

41.2 抗心律失常药:抗心律失常药,主诉:房颤|非瓣膜性房颤,用药推荐包含:盐酸普罗帕酮注射液 盐酸普罗帕酮片 富马酸伊布利特注射液
    [Documentation]    断言:""
    ${assert}    Create List    盐酸普罗帕酮注射液    盐酸普罗帕酮片    富马酸伊布利特注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断:房颤</InnerValue></Element></XElements><BodyText>Subjective: 房颤 非瓣膜性房颤 Objective: Assessment:诊断:房颤 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐   userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][5]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
    # [Teardown]    sleep    0.2s

